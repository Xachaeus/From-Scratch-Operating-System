#include "hal.h"
#include <arch/x86/gdt.h>
#include <arch/x86/idt.h>
#include <arch/x86/isr.h>
#include <arch/x86/irq.h>
#include <arch/x86/PIT8254.h>
#include <stdio.h>

void HAL_Initialize()
{
    i686_GDT_Initialize();
    i686_IDT_Initialize();
    i686_ISR_Initialize();
    i686_IRQ_Initialize();
    i686_PIT_Initialize();
}