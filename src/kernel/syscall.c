#include "syscall.h"
#include <HAL/hal.h>
#include <stdio.h>
#include <proc/proc.h>
#include <CLI.h>
#include <hardware-io/io.h>
#include <delay.h>
#include <display/kinter.h>
#include <memory.h>
#include <stddef.h>
#include <file.h>

void SyscallEntrypoint(Registers* regs) {
    //printf("Handling syscall\n");
    MaskTimerInterrupt();
    switch (regs->eax) {

        // Read
        case 0x3:
            regs->eax = read((int)regs->ebx, (int)regs->edx, (void*)regs->ecx);
            break;

        // Write
        case 0x4:
            regs->eax = write((int)regs->ebx, (int)regs->edx, (void*)regs->ecx);
            break;
        
        // Open
        case 0x5:
            regs->eax = open((const char*)regs->ebx);
            break;

        // Close
        case 0x6:
            close((int)regs->ebx);
            break;

        // WaitPID
        case 0x7:
            break;

        // Put Integer
        case 0xFF: // Temporary
            printf("%d", regs->ecx);
            break;

        // Microsleep
        case 0xa2:
            PutToSleep(regs->ebx, (Context*)regs);
            break;

        // Getpid
        case 0x14:
            regs->eax = GetRunningPID();
            break;
        
        // Fork
        case 0x2:
            //printf("Beginning fork...\n");
            int new_pid = GetAvailablePID();
            ProcessControlBlock* new_proc = GetPCB(new_pid);
            ProcessControlBlock* running_proc = GetPCB(GetRunningPID());

            SetContext(&(running_proc->saved_context), (Context*)regs);
            //printf("Copying process parameters...\n");
            memcpy(new_proc, running_proc, sizeof(ProcessControlBlock));

            new_proc->pid = new_pid;
            new_proc->proc_state = READY;
            //printf("Copying memory regions...\n");
            CopyProcessMemory(new_proc, running_proc);
            regs->eax = new_pid;
            new_proc->saved_context.eax = 0;
            //printf("Adding child to scheduler queue...\n");
            AddToSchedulerQueue(new_pid);
            //printf("Fork complete!\n");
            /*
            printf("Parent:\n");
            PrintProc(running_proc);
            printf("Child:\n");
            PrintProc(new_proc);
            */
            break;

        // Exec
        case 0xb:
            regs->eax = exec((const char*)regs->ebx, (int)regs->ecx, (const char**)regs->edx);
            break;
        
        // Exit
        case 0x1:
        // Kill
        //case 0x3E:
            //printf("Process %d called exit\n", GetRunningPID());
            HandleExit((Context*)regs);
            break;


        default:
            printf("Got system call 0x%x!\n", regs->eax);
            break;
    }
    UnmaskTimerInterrupt();
    //printf("Syscall handled\n");
}