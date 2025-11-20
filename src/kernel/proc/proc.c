
#include "proc.h"
#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>
#include <stddef.h>
#include <CLI.h>

#define USER_CODE_SEGMENT 0x8
#define USER_DATA_SEGMENT 0x10

#define PROCESS_MAX_RUNTIME 5000

ProcessControlBlock* g_running = NULL;
ProcessControlBlock* g_queue = NULL;

uint32_t g_time_since_switch = 0;

int g_schedulingEnabled = 1;

void SetContext(Context* dest_context, Context* new_context) {

    dest_context->cs = new_context->cs;
    dest_context->ds = new_context->ds;
    dest_context->ss = new_context->ss;

    dest_context->eip = new_context->eip;
    dest_context->esp = new_context->esp;
    dest_context->ebp = new_context->ebp;

    *((uint32_t*)(dest_context->esp)) = (uint32_t)CLI_Mainloop;
    printf("Context set!\n");
}


void CreateMappingForRegion(MemoryRegion* reg) {
    if (reg->isActive) {
        //printf("0x%x 0x%x 0x%x\n", reg->PhysMemoryBlockIdx, reg->NumBlocks, reg->BaseAddress);
        if(!FMM_CreateMapping(reg->PhysMemoryBlockIdx, reg->NumBlocks, reg->BaseAddress)){
            printf("Failed to map address 0x%x\n", reg->BaseAddress);
        }
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


void TerminateProcess(ProcessControlBlock* proc) {
    FreeRegion(&(proc->text_section));
    FreeRegion(&(proc->data_section));
    FreeRegion(&(proc->rodata_section));
    FreeRegion(&(proc->stack_section));
}


int ExecProc(ProcessControlBlock* proc) {

    g_schedulingEnabled = 0;

    CreateMappingForRegion(&(proc->text_section));
    CreateMappingForRegion(&(proc->data_section));
    CreateMappingForRegion(&(proc->rodata_section));

    AllocateMemoryRegion(&(proc->stack_section), 0xFFFFFFFF, 1);
    CreateMappingForRegion(&(proc->stack_section));

    proc->saved_context.esp = 0xFFFFFFFC;
    proc->saved_context.ebp = 0xFFFFFFFC;
    *((uint32_t*)(proc->saved_context.esp)) = (uint32_t)&CLI_Mainloop;
    proc->saved_context.eip = proc->entry_address;
    proc->saved_context.cs = USER_CODE_SEGMENT;
    proc->saved_context.ds = USER_DATA_SEGMENT;
    proc->saved_context.ss = USER_DATA_SEGMENT;

    i686_call(proc->entry_address);
    //proc->next = g_queue;
    //g_queue = proc;

    TerminateProcess(proc);

    //g_schedulingEnabled = 1;

    return 0;
}

void SchedulerHook(uint32_t delta_time, Context* context) {
    g_time_since_switch += delta_time;

    if (g_schedulingEnabled) {

        if (g_running == NULL && g_queue != NULL) {
            printf("Launching first process!\n");
            g_running = g_queue;
            SetContext(context, &(g_running->saved_context));

        }

        if (g_time_since_switch > PROCESS_MAX_RUNTIME) {
            //printf("Switch!\n");
        }

    }
}