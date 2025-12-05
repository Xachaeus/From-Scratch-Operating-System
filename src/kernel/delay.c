#include "delay.h"

#include <stdint.h>
#include <arch/x86/PIC8259.h>
#include <hardware-io/io.h>

uint64_t volatile g_Timer = 0;

void ActiveContextTimerSleepHook(uint32_t time_passed) {
    g_Timer += time_passed;
}

void sleep(uint32_t microseconds) {
    g_Timer = 0;
    while (g_Timer < microseconds) {}
}

void MaskTimerInterrupt() {
    //i686_DisableInterrupts();
    i686_PIC_Mask(0);
}

void UnmaskTimerInterrupt() {
    //i686_EnableInterrupts();
    i686_PIC_Unmask(0);
}