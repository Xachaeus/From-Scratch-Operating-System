#ifndef SYSCALL_H
#define SYSCALL_H

#include <HAL/hal.h>
#include <stdint.h>

void __attribute__((cdecl)) syscall(uint8_t int_num);
void SyscallEntrypoint(Registers* regs);


#endif