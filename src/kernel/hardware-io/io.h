#ifndef IO_H
#define IO_H

#include <stdint.h>

void __attribute__((cdecl)) i686_outb(uint16_t port, uint8_t value);
uint8_t __attribute__((cdecl)) i686_inb(uint16_t port);
uint8_t __attribute__((cdecl)) i686_EnableInterrupts();
uint8_t __attribute__((cdecl)) i686_DisableInterrupts();
void i686_iowait();

#endif