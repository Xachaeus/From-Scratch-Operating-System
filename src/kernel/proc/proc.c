
#include "proc.h"
#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>
#include <stddef.h>
#include <syscall.h>
#include <CLI.h>
#include <memory.h>

#define USER_CODE_SEGMENT 0x8
#define USER_DATA_SEGMENT 0x10

#define PROCESS_MAX_RUNTIME 50000

#define STACK_BOTTOM 0xFFFFFFFC

ProcessControlBlock* g_running = NULL;
ProcessControlBlock* g_queue = NULL;

volatile uint8_t g_GoToKernel = 0;
volatile int g_schedulingEnabled = 1;
volatile uint32_t g_KernelESP;
volatile uint32_t g_time_since_switch = 0;

ProcessControlBlock g_Processes[100];



int GetAvailablePID() {
    return 1;
}

ProcessControlBlock* GetPCB(int pid) {
    return &(g_Processes[pid]);
}


void SwitchToKernel() {
    g_GoToKernel = 1;
}


void ExitHandler() {
    printf("Exit handler called!\n");
    syscall(1);
}

void SetContext(Context* new_context) {
    printf("Set context fucntion called!\n");
}


void CreateMappingForRegion(MemoryRegion* reg) {
    if (reg->isActive) {
        //printf("0x%x 0x%x 0x%x\n", reg->PhysMemoryBlockIdx, reg->NumBlocks, reg->BaseAddress);
        if(!FMM_CreateMapping(reg->PhysMemoryBlockIdx, reg->NumBlocks, reg->BaseAddress)){
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
    CreateMappingForRegion(&(proc->text_section));
    CreateMappingForRegion(&(proc->data_section));
    CreateMappingForRegion(&(proc->rodata_section));
    CreateMappingForRegion(&(proc->stack_section));
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





int ExecProc(int pid) {

    ProcessControlBlock* proc = &(g_Processes[pid]);

    g_schedulingEnabled = 0;

    proc->pid = pid;
    proc->run_time = 0;
    proc->proc_state = READY;

    AllocateMemoryRegion(&(proc->stack_section), 0xFFFFF000, 1);

    CreateMappingsForProcess(proc);

    proc->saved_context.eax = 0x0;
    proc->saved_context.ebx = 0x0;
    proc->saved_context.ecx = 0x0;
    proc->saved_context.edx = 0x0;

    proc->saved_context.edi = 0x0;
    proc->saved_context.esi = 0x0;

    proc->saved_context.context_esp = (uint32_t)STACK_BOTTOM - (uint32_t)(sizeof(Context));
    // Don't bother setting the stack pointer, it won't be restored explicitly by the ISR handler
    proc->saved_context.ebp = 0xFFFFFFFC;

    proc->saved_context.eip = proc->entry_address;
    proc->saved_context.eflags = 0x200;
    proc->saved_context.cs = USER_CODE_SEGMENT;
    proc->saved_context.ds = USER_DATA_SEGMENT;
    proc->saved_context.ss = USER_DATA_SEGMENT;


    // Put the context onto the new process's stack
    memcpy((void*)(proc->saved_context.context_esp), &(proc->saved_context), sizeof(Context));
    //*((uint32_t*)(0xFFFFFFF8)) = 0xFFFFFFF8;
    //*((uint32_t*)(0xFFFFFFF0)) = (uint32_t)&ExitHandler;
    //*((uint32_t*)(0xFFFFFFF4)) = 0xFFFFFFF4;
    //*((uint32_t*)(0xFFFFFFF8)) = 0xFFFFFFFC;
    //*((uint32_t*)(0xFFFFFFFC)) = (uint32_t)&ExitHandler;

    
    proc->next = g_queue;
    g_queue = proc;

    RemoveMappingsForProcess(proc);

    g_schedulingEnabled = 1;

    return 0;
}



void SchedulerHook(uint32_t delta_time, Context* context) {

    g_time_since_switch += delta_time;

    if (g_running != NULL) {
        g_running->run_time += delta_time;
        if (g_running->run_time > 10000) {
            printf("\nProcess %d timeout!\n", g_running->pid);
            g_GoToKernel = 1;
        }
    }

    if (g_schedulingEnabled) {

        if (g_GoToKernel == 1) {
            g_GoToKernel = 0;
            context->context_esp = g_KernelESP;
            TerminateProcess(g_running);
            g_running = NULL;
        }

        if (g_running == NULL && g_queue != NULL) {
            g_running = g_queue;
            g_queue = g_queue->next;
            CreateMappingsForProcess(g_running);
            g_KernelESP = context->context_esp;
            context->context_esp = g_running->saved_context.context_esp;
            asm("sti");
        }
    }
}