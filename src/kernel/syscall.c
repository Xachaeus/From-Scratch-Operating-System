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

void SyscallEntrypoint(Registers* regs) {
    //printf("Handling syscall\n");
    MaskTimerInterrupt();
    switch (regs->eax) {

        // Write
        case 0x1:
            printf("%s", regs->ecx);
            break;

        case 0x5:
            printf("%d", regs->ecx);
            break;

        // Microsleep
        case 0x23:
            PutToSleep(regs->ecx, (Context*)regs);
            break;

        // Getpid
        case 0x27:
            regs->eax = GetRunningPID();
            break;
        
        // Fork
        
        case 0x39:
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
        
        // Exit
        case 0x3C:
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