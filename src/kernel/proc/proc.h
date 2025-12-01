#ifndef PROC_H
#define PROC_H

#include <stdint.h>
#include <memory-manager/FMM.h>
#include <HAL/hal.h>


typedef enum {
    FILE_PATH_ERROR = 0xFF,
    EXE_FORMAT_ERROR = 0x7F,
    BLOCKED = 0x0,
    READY = 0x1,
    RUNNING = 0x2,
    COMPLETE = 0x3
} PROC_STATES;

typedef struct {
    uint32_t ds;
    uint32_t edi, esi, ebp, context_esp, ebx, edx, ecx, eax;
    uint32_t interrupt, error;
    uint32_t eip, cs, eflags, esp, ss;
} __attribute__((packed)) Context;


typedef struct {
    uint32_t old_stack_pointer;
    Context context;
} __attribute__((packed)) StackContext;


typedef struct {
    MemoryRegion text_section;
    MemoryRegion data_section;
    MemoryRegion bss_section;
    MemoryRegion rodata_section;
    MemoryRegion stack_section;

    uint32_t entry_address;

    uint16_t pid;
    uint8_t proc_state;
    Context saved_context;
    
    uint64_t creation_time;
    uint64_t run_time;

    void* next;

} ProcessControlBlock;



int GetAvailablePID();
ProcessControlBlock* GetPCB(int pid);

int ExecProc(int pid);

void TerminateRunningProcess(Context* context);
void SchedulerHook(uint32_t delta_time, Context* context);
void SwitchToKernel();

void __attribute__((cdecl)) i686_call(uint32_t addr);

#endif