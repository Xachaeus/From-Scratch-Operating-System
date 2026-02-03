#ifndef PROC_H
#define PROC_H

#include <stdint.h>
#include <memory-manager/FMM.h>
#include <HAL/hal.h>


typedef enum {
    FILE_PATH_ERROR = 0xFF,
    EXE_FORMAT_ERROR = 0x7F,
    COMPLETE = 0x0,
    READY = 0x1,
    RUNNING = 0x2,
    BLOCKED = 0x3
} PROC_STATES;

typedef struct {
    uint32_t ds;
    uint32_t edi, esi, ebp, context_esp, ebx, edx, ecx, eax;
    uint32_t interrupt, error;
    uint32_t eip, cs, eflags, esp, ss;
} __attribute__((packed)) Context;


typedef struct {
    MemoryRegion text_section;
    MemoryRegion data_section;
    MemoryRegion bss_section;
    MemoryRegion rodata_section;
    MemoryRegion stack_section;
    MemoryRegion kernel_stack_section;

    uint32_t entry_address;

    uint16_t pid;
    uint8_t proc_state;
    Context saved_context;
    
    uint64_t creation_time;
    uint64_t run_time;
    long sleep_time;

    void* next;
    void* parent;
    void* child;
    void* sibling;

} ProcessControlBlock;



void InitializeProcs();

void AddToSchedulerQueue(int pid);

int GetAvailablePID();
ProcessControlBlock* GetPCB(int pid);

void PrintProc(ProcessControlBlock* proc);

void DisableScheduling();
void EnableScheduling();


int ExecProc(int pid);

void TerminateRunningProcess(Context* context);
void KillRunningProcess(Context* context);
void SchedulerHook(uint32_t delta_time, Context* context);

// Syscall functions
void HandleExit(Context* context);
void PutToSleep(long microseconds, Context* context);
uint32_t GetRunningPID();
void CopyProcessMemory(ProcessControlBlock* dest, ProcessControlBlock* src);
void SaveContextToStack(ProcessControlBlock* proc);
void SaveExplicitContext(ProcessControlBlock* proc, Context* context);
void SetContext(Context* dest, Context* src);

void __attribute__((cdecl)) i686_call(uint32_t addr);

int __attribute__((cdecl)) exec(const char* path, const char** argv, int argc);

#endif