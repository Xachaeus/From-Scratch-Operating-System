#ifndef HAL_H
#define HAL_H

#include <arch/x86/gdt.h>
#include <arch/x86/idt.h>
#include <arch/x86/isr.h>
#include <arch/x86/irq.h>
#include <arch/x86/PIT8254.h>

void HAL_Initialize();
void HAL_SetInterruptStack(void* address);

#endif