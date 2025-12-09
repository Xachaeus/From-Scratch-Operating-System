
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

#define PROCESS_MAX_RUNTIME 5000000 // Process max runtime is 5 seconds
#define PROCESS_TIME_SLICE 5000 // Process time slice is 5ms

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

void AddToSchedulerQueue(int pid) {
    AddToQueue(GetPCB(pid));
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




void HandleExit(Context* context) {
    g_KillRunning = 1;
    SchedulerHook(0, context);
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
    if (proc == NULL) {return;}
    CreateCodeMappingForRegion(&(proc->text_section));
    CreateDataMappingForRegion(&(proc->data_section));
    CreateDataMappingForRegion(&(proc->rodata_section));
    CreateDataMappingForRegion(&(proc->stack_section));
}

void RemoveMappingsForProcess(ProcessControlBlock* proc) {
    if (proc == NULL){return;}
    RemoveMappingForRegion(&(proc->text_section));
    RemoveMappingForRegion(&(proc->data_section));
    RemoveMappingForRegion(&(proc->rodata_section));
    RemoveMappingForRegion(&(proc->stack_section));
}




void CopyMemoryRegion(MemoryRegion* dest, MemoryRegion* src) {
    uint32_t temp_addr = src->BaseAddress + src->NumBlocks*4096;
    // Detect overflow
    if (temp_addr + src->NumBlocks*4096 < src->BaseAddress) {temp_addr = 0x200000;} // If processing address wraps around past the end of the address space, place it at the very beginning of the available address space
    AllocateMemoryRegion(dest, temp_addr, src->NumBlocks);

    CreateDataMappingForRegion(dest);
    CreateDataMappingForRegion(src);
    memcpy((void*)dest->BaseAddress, (void*)src->BaseAddress, src->NumBlocks*4096);
    RemoveMappingForRegion(src);
    RemoveMappingForRegion(dest);

    dest->BaseAddress = src->BaseAddress;
}

void CopyProcessMemory(ProcessControlBlock* dest, ProcessControlBlock* src) {
    if (dest == NULL || src == NULL) {printf("Error, invalid process args!\n"); return;}
    RemoveMappingsForProcess(g_running);
    CopyMemoryRegion(&(dest->text_section), &(src->text_section));
    CopyMemoryRegion(&(dest->data_section), &(src->data_section));
    CopyMemoryRegion(&(dest->rodata_section), &(src->rodata_section));
    CopyMemoryRegion(&(dest->stack_section), &(src->stack_section));
    CreateMappingsForProcess(g_running);
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

void KillRunningProcess(Context* context) {
    printf("Killing process %d\n", g_running->pid);
    TerminateRunningProcess(context);
}



int ExecProc(int pid) {

    ProcessControlBlock* proc = &(g_Processes[pid]);

    g_schedulingEnabled = 0;

    proc->run_time = 0;
    proc->proc_state = READY;

    AllocateMemoryRegion(&(proc->stack_section), STACK_BOTTOM, 1);

    RemoveMappingsForProcess(g_running);
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
    CreateMappingsForProcess(g_running);
    
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


    while (curr_sleeping != NULL) {

        curr_sleeping->sleep_time -= delta_time;

        // If process should wake
        if (curr_sleeping->sleep_time <= 0) {
            ProcessControlBlock* temp_sleeping = curr_sleeping;
            // First node in list
            if (curr_sleeping == g_sleeping_list) {
                g_sleeping_list = curr_sleeping->next;
                prev_sleeping = curr_sleeping->next;
                curr_sleeping = curr_sleeping->next;
            }
            // Otherwise
            else {
                prev_sleeping->next = curr_sleeping->next;
                curr_sleeping = curr_sleeping->next;
            }
            //printf("Previous is %d, current is %d, launching %d\n", prev_sleeping->pid, curr_sleeping->pid, temp_sleeping->pid);
            temp_sleeping->proc_state = READY;
            AddToQueue(temp_sleeping);
        }

        // Otherwise
        else {
            prev_sleeping = curr_sleeping;
            curr_sleeping = curr_sleeping->next;
        }
    }


    // Update runtime of currently running process
    if (g_running != NULL) {
        g_running->run_time += delta_time;
        if (g_running->run_time > PROCESS_MAX_RUNTIME) {
            printf("Process %d timeout!\n", g_running->pid);
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
                g_time_since_switch = 0;
                RemoveMappingsForProcess(g_running);
                TerminateProcess(g_running);
                g_running->proc_state = COMPLETE;
                g_running = GetFromQueue();
                if (g_running != NULL) {
                    //printf("Launching process %d\n", g_running->pid);
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
                g_time_since_switch = 0;
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