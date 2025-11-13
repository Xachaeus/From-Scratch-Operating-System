#ifndef PROC_H
#define PROC_H

#include <stdint.h>
#include <memory-manager/FMM.h>
#include <HAL/hal.h>


typedef struct {
    uint32_t ds;
    uint32_t edi, esi, ebp, kernel_esp, ebx, edx, ecx, eax;
    uint32_t interrupt, error;
    uint32_t eip, cs, eflags, esp, ss;
} __attribute__((packed)) Context;


typedef struct {
    MemoryRegion text_section;
    MemoryRegion data_section;
    MemoryRegion bss_section;
    MemoryRegion rodata_section;
    uint16_t pid;
    uint8_t proc_state;
    ProcessControlBlock* parent;
    Context saved_context;
    
    uint64_t creation_time;
    uint64_t run_time;
    
} __attribute__((packed)) ProcessControlBlock;

#endif