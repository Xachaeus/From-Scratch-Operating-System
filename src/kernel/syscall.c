#include "syscall.h"
#include <HAL/hal.h>
#include <stdio.h>

void SyscallEntrypoint(Registers* regs) {
    switch (regs->eax) {
        case 0x4:
            printf("%s", regs->ecx);
            break;
        default:
            printf("Got system call 0x%x!\n", regs->eax);
    }
}