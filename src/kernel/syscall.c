#include "syscall.h"
#include <HAL/hal.h>
#include <stdio.h>
#include <proc/proc.h>
#include <CLI.h>
#include <hardware-io/io.h>

void SyscallEntrypoint(Registers* regs) {
    switch (regs->eax) {
        case 0x1: // Exit
            HandleExit();
            break;
        case 0x2: // Sleep (temporary)
            PutToSleep(regs->ecx, (Context*)regs);
            break;
        case 0x3: // Get PID (temporary)
            regs->eax = GetRunningPID();
            break;
        case 0x4: // PutS
            printf("%s", regs->ecx);
            break;
        case 0x5: // PutD
            printf("%d", regs->ecx);
            break;


        default:
            printf("Got system call 0x%x!\n", regs->eax);
            break;
    }
    //asm("sti"); // THIS IS FULLY NECESSARY FOR SOME REASON
}