
#include "proc.h"
#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>
#include <stddef.h>
#include <syscall.h>
#include <CLI.h>
#include <memory.h>
#include <hardware-io/io.h>
#include <delay.h>

#define USER_CODE_SEGMENT 0x18
#define USER_DATA_SEGMENT 0x20

#define PROCESS_MAX_RUNTIME 1000000
#define PROCESS_TIME_SLICE 50000

#define STACK_BOTTOM 0xFFFFFFFC


#define MAX_PID 100

ProcessControlBlock* g_running = NULL;
ProcessControlBlock* g_queue = NULL;
ProcessControlBlock* g_sleeping_list = NULL;

volatile uint8_t g_GoToKernel = 0;
volatile uint8_t g_KillRunning = 0;
volatile uint8_t g_SleepRunning = 0;
volatile int g_schedulingEnabled = 1;
volatile uint32_t g_KernelESP;
volatile uint32_t g_SavedESP;
volatile uint32_t g_time_since_switch = 0;
volatile uint16_t g_PIDCounter = 0;

ProcessControlBlock g_Processes[MAX_PID];





void InitializeProcs() {
    for (int i = 0; i<MAX_PID; i++) {
        g_Processes[i].proc_state = COMPLETE;
        g_Processes[i].pid = i;
    }
}


void AddToQueue(ProcessControlBlock* proc) {
    if (g_queue == NULL) {g_queue = proc; proc->next = NULL; return;}
    ProcessControlBlock* curr = g_queue;
    while (curr->next != NULL) {curr = curr->next;}
    curr->next = proc;
    proc->next = NULL;
}

void AddToSleeping(ProcessControlBlock* proc) {
    proc->next = g_sleeping_list;
    g_sleeping_list = proc;
}

ProcessControlBlock* GetFromQueue() {
    if (g_queue == NULL) {return NULL;}
    ProcessControlBlock* curr = g_queue;
    g_queue = g_queue->next;
    curr->next = NULL;
    return curr;
}







int GetAvailablePID() {
    if (g_Processes[g_PIDCounter].proc_state != COMPLETE) {return -1;}
    int return_val = g_PIDCounter;
    g_PIDCounter = (g_PIDCounter + 1) % MAX_PID;
    return return_val;
}

ProcessControlBlock* GetPCB(int pid) {
    return &(g_Processes[pid]);
}




void HandleExit() {
    g_KillRunning = 1;
}

void PutToSleep(long microseconds, Context* context) {
    g_SleepRunning = 1;
    g_running->sleep_time = microseconds;
    AddToSleeping(g_running);
    SchedulerHook(0, context);
}

uint32_t GetRunningPID() {
    if (g_running == NULL) {return -1;}
    return g_running->pid;
}





void CreateCodeMappingForRegion(MemoryRegion* reg) {
    if (reg->isActive) {
        //printf("0x%x 0x%x 0x%x\n", reg->PhysMemoryBlockIdx, reg->NumBlocks, reg->BaseAddress);
        if(!FMM_CreateUserCodeMapping(reg->PhysMemoryBlockIdx, reg->NumBlocks, reg->BaseAddress)){
            printf("Failed to map address 0x%x\n", reg->BaseAddress);
        }
    }
}

void CreateDataMappingForRegion(MemoryRegion* reg) {
    if (reg->isActive) {
        //printf("0x%x 0x%x 0x%x\n", reg->PhysMemoryBlockIdx, reg->NumBlocks, reg->BaseAddress);
        if(!FMM_CreateUserDataMapping(reg->PhysMemoryBlockIdx, reg->NumBlocks, reg->BaseAddress)){
            printf("Failed to map address 0x%x\n", reg->BaseAddress);
        }
    }
}



void RemoveMappingForRegion(MemoryRegion* reg) {
    if (reg->isActive) {
        FMM_ClearMapping(reg->BaseAddress, reg->NumBlocks);
    }
}

void FreeRegion(MemoryRegion* reg) {
    if (reg->isActive) {
        FMM_ClearMapping(reg->BaseAddress, reg->NumBlocks);
        FMM_FreeBlocks(reg->PhysMemoryBlockIdx, reg->NumBlocks);
    }
}

void AllocateMemoryRegion(MemoryRegion* reg, uint32_t virtual_address, uint32_t num_blocks) {
    reg->NumBlocks = num_blocks;
    reg->PhysMemoryBlockIdx = FMM_AllocateBlocks(num_blocks);
    reg->BaseAddress = virtual_address;
    reg->isActive = true;
}


void CreateMappingsForProcess(ProcessControlBlock* proc) {
    CreateCodeMappingForRegion(&(proc->text_section));
    CreateDataMappingForRegion(&(proc->data_section));
    CreateDataMappingForRegion(&(proc->rodata_section));
    CreateDataMappingForRegion(&(proc->stack_section));
}

void RemoveMappingsForProcess(ProcessControlBlock* proc) {
    RemoveMappingForRegion(&(proc->text_section));
    RemoveMappingForRegion(&(proc->data_section));
    RemoveMappingForRegion(&(proc->rodata_section));
    RemoveMappingForRegion(&(proc->stack_section));
}




void TerminateProcess(ProcessControlBlock* proc) {
    FreeRegion(&(proc->text_section));
    FreeRegion(&(proc->data_section));
    FreeRegion(&(proc->rodata_section));
    FreeRegion(&(proc->stack_section));

    proc->proc_state = COMPLETE;
    proc->run_time = 0;
}


void TerminateRunningProcess(Context* context) {
    g_KillRunning = 1;
    SchedulerHook(0, context);
}



int ExecProc(int pid) {

    ProcessControlBlock* proc = &(g_Processes[pid]);

    g_schedulingEnabled = 0;

    proc->run_time = 0;
    proc->proc_state = READY;

    AllocateMemoryRegion(&(proc->stack_section), STACK_BOTTOM, 1);

    CreateMappingsForProcess(proc);

    proc->saved_context.eax = 0x0;
    proc->saved_context.ebx = 0x0;
    proc->saved_context.ecx = 0x0;
    proc->saved_context.edx = 0x0;

    proc->saved_context.edi = 0x0;
    proc->saved_context.esi = 0x0;

    proc->saved_context.context_esp = (uint32_t)STACK_BOTTOM - (uint32_t)(sizeof(Context));
    // Don't bother setting the stack pointer, it won't be restored explicitly by the ISR handler
    proc->saved_context.ebp = STACK_BOTTOM;
    proc->saved_context.esp = STACK_BOTTOM;

    proc->saved_context.eip = proc->entry_address;
    proc->saved_context.eflags = 0x200 | 0x3000;
    proc->saved_context.cs = USER_CODE_SEGMENT | 0x3;
    proc->saved_context.ds = USER_DATA_SEGMENT | 0x3;
    proc->saved_context.ss = USER_DATA_SEGMENT | 0x3;


    // Put the context onto the new process's stack
    memcpy((void*)(proc->saved_context.context_esp), &(proc->saved_context), sizeof(Context));

    RemoveMappingsForProcess(proc);
    
    AddToQueue(proc);

    return 0;
}


void DisableScheduling() {
    g_schedulingEnabled = 0;
}

void EnableScheduling() {
    g_schedulingEnabled = 1;
}

void SchedulerHook(uint32_t delta_time, Context* context) {

    MaskTimerInterrupt();


    g_time_since_switch += delta_time;


    ProcessControlBlock* curr_sleeping = g_sleeping_list;
    ProcessControlBlock* prev_sleeping = g_sleeping_list;

    // Case where no processes are sleeping
    if (curr_sleeping == NULL) {}
    // Case where exactly one process is sleeping
    else if (curr_sleeping->next == NULL) {
        curr_sleeping->sleep_time -= delta_time;
        if (curr_sleeping->sleep_time < 0) {
            curr_sleeping->proc_state = READY;
            g_sleeping_list = NULL;
            AddToQueue(curr_sleeping);
        }
    }
    // Case where >1 processes are sleeping
    else {
        curr_sleeping->sleep_time -= delta_time;
        if (curr_sleeping->sleep_time < 0) {
            curr_sleeping->proc_state = READY;
            g_sleeping_list = curr_sleeping->next;
            curr_sleeping->next = NULL;
            AddToQueue(curr_sleeping);
        }
        /*
        curr_sleeping = g_sleeping_list;
        while (curr_sleeping->next != NULL) {
            ProcessControlBlock* next = curr_sleeping->next; // Assignment to appease the linter/compiler
            next->sleep_time -= delta_time;
            if (next->sleep_time < 0) {
                next->proc_state = READY;
                curr_sleeping->next = next->next;
                next->next = NULL;
                AddToQueue(next);
                // Do NOT change curr_sleeping so that the next node in the chain is correctly found
            }
            else {
                curr_sleeping = next;
            }
        }
        */
    }


    // Update runtime of currently running process
    if (g_running != NULL) {
        g_running->run_time += delta_time;
        if (g_running->run_time > 1000000) {
            printf("\nProcess %d timeout!\n", g_running->pid);
            g_KillRunning = 1;
        }
    }


    // Determine if context switch is needed
    if (g_schedulingEnabled) {

        if (g_running != NULL) {

            // Force-kill running process
            if (g_KillRunning) {
                //printf("Killing process %d\n", g_running->pid);
                g_KillRunning = 0;
                g_SleepRunning = 0; // Don't accidentally have the next process sleep
                RemoveMappingsForProcess(g_running);
                TerminateProcess(g_running);
                g_running->proc_state = COMPLETE;
                g_running = GetFromQueue();
                if (g_running != NULL) {
                    g_running->proc_state = RUNNING;
                    CreateMappingsForProcess(g_running);
                    context->context_esp = g_running->saved_context.context_esp;
                }
                else {
                    g_GoToKernel = 1;
                }
            }

            // Running process sleeps
            if (g_SleepRunning) {
                g_SleepRunning = 0;
                g_running->saved_context.context_esp = context->context_esp;
                RemoveMappingsForProcess(g_running);
                g_running->proc_state = BLOCKED;
                g_running = GetFromQueue();
                if (g_running != NULL) {
                    g_running->proc_state = RUNNING;
                    CreateMappingsForProcess(g_running);
                    context->context_esp = g_running->saved_context.context_esp;
                }
                else {
                    g_GoToKernel = 1;
                }
            }

            // Preemption-based context switch
            if (g_time_since_switch > PROCESS_TIME_SLICE && g_running != NULL) {
                g_time_since_switch = 0;
                g_running->saved_context.context_esp = context->context_esp;
                RemoveMappingsForProcess(g_running);
                g_running->proc_state = READY;
                AddToQueue(g_running);
                //printf("Switching from %hu ", g_running->pid);
                g_running = GetFromQueue();
                if (g_running != NULL) {
                    //printf("to %d\n", g_running->pid);
                    g_running->proc_state = RUNNING;
                    CreateMappingsForProcess(g_running);
                    context->context_esp = g_running->saved_context.context_esp;
                }
                else {
                    //printf("to kernel\n");
                    g_GoToKernel = 1;
                }
            }
        }

        if (g_running == NULL && g_queue != NULL) {
            g_running = GetFromQueue();
            if (g_running == NULL) {printf("DEBUG: Error in queue pop function!\n");}
            g_running->proc_state = RUNNING;
            CreateMappingsForProcess(g_running);
            g_KernelESP = context->context_esp;
            context->context_esp = g_running->saved_context.context_esp;
        }

        if (g_GoToKernel) {
            g_GoToKernel = 0;
            context->context_esp = g_KernelESP;
            RemoveMappingsForProcess(g_running);
            TerminateProcess(g_running);
            g_running = NULL;
        }
        
    }
    UnmaskTimerInterrupt();
}