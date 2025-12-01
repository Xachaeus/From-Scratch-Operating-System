#include "syscall.h"
#include <HAL/hal.h>
#include <stdio.h>
#include <proc/proc.h>
#include <CLI.h>

void SyscallEntrypoint(Registers* regs) {
    switch (regs->eax) {
        case 0x1: // Exit
            SwitchToKernel();
            break;
        case 0x4: // Print
            printf("%s", regs->ecx);
            break;
        default:
            printf("Got system call 0x%x!\n", regs->eax);
            break;
    }

    //asm("sti"); // THIS IS FULLY NECESSARY FOR SOME REASON
}