#include "syscall.h"
#include <HAL/hal.h>
#include <stdio.h>
#include <proc/proc.h>
#include <CLI.h>
#include <hardware-io/io.h>
#include <delay.h>
#include <display/kinter.h>
#include <memory.h>

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
        /*
        case 0x39:
            int new_pid = GetAvailablePID();
            ProcessControlBlock* new_proc = GetPCB(new_pid);
            ProcessControlBlock* running_proc = GetPCB(GetRunningPID());
            memcpy(new_proc, running_proc, sizeof(ProcessControlBlock));
            new_proc->pid = new_pid;
            new_proc->proc_state = READY;
            CopyProcessMemory(new_proc, running_proc);
            new_proc->parent = running_proc; running_proc->child = new_proc;
            regs->eax = new_pid;
            new_proc->saved_context.eax = 0;
            AddToSchedulerQueue(new_pid);
            break;
        */
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