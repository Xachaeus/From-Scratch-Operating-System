
#include "proc.h"
#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>
#include <stddef.h>

#define USER_CODE_SEGMENT 0x8
#define USER_DATA_SEGMENT 0x10

#define PROCESS_MAX_RUNTIME 5000

ProcessControlBlock* g_running = NULL;
ProcessControlBlock* g_queue = NULL;

uint32_t g_time_since_switch = 0;


void SetContext(Context* dest_context, Context* new_context) {
    dest_context->cs = new_context->cs;
    dest_context->ds = new_context->ds;
    dest_context->ss = new_context->ss;

    dest_context->eip = new_context->eip;
    dest_context->esp = new_context->esp;
}


void CreateMappingForRegion(MemoryRegion* reg) {
    if (reg->isActive) {
        //printf("0x%x 0x%x 0x%x\n", reg->PhysMemoryBlockIdx, reg->NumBlocks, reg->BaseAddress);
        FMM_CreateMapping(reg->PhysMemoryBlockIdx, reg->NumBlocks, reg->BaseAddress);
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


int ExecProc(ProcessControlBlock* proc) {

    CreateMappingForRegion(&(proc->text_section));
    CreateMappingForRegion(&(proc->data_section));
    CreateMappingForRegion(&(proc->rodata_section));

    AllocateMemoryRegion(&(proc->stack_section), 0xFFFFFFFF, 1);

    proc->saved_context.esp = 0xFFFFFFFF;
    proc->saved_context.eip = proc->entry_address;
    proc->saved_context.cs = USER_CODE_SEGMENT;
    proc->saved_context.ds = USER_DATA_SEGMENT;
    proc->saved_context.ss = USER_DATA_SEGMENT;

    if (g_queue == NULL) {g_queue = NULL;}
    else {
        ProcessControlBlock* curr = g_queue;
        while (curr->next != NULL) {curr = curr->next;}
        curr->next = proc;
    }

    //printf("Jumping to proc start address...\n");
    i686_call(proc->entry_address);

    FreeRegion(&(proc->text_section));
    FreeRegion(&(proc->data_section));
    FreeRegion(&(proc->rodata_section));
    FreeRegion(&(proc->stack_section));

    return 0;
}

void SchedulerHook(uint32_t delta_time, Context* context) {
    g_time_since_switch += delta_time;

    if (g_running == NULL && g_queue != NULL) {
        printf("Launching first process!\n");
        g_running = g_queue;
        SetContext(context, &(g_running->saved_context));
    }

    if (g_time_since_switch > PROCESS_MAX_RUNTIME) {
        //printf("Switch!\n");
    }
}