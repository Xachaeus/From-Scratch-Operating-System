#include "syscall.h"
#include <HAL/hal.h>
#include <stdio.h>

void SyscallEntrypoint(Registers* regs) {
    printf("Got system call 0x%x!\n", regs->eax);
}