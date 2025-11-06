#include "delay.h"

#include <stdint.h>

uint64_t volatile g_Timer = 0;

void ActiveContextTimerSleepHook(uint32_t time_passed) {
    g_Timer += time_passed;
}

void sleep(uint32_t microseconds) {
    g_Timer = 0;
    while (g_Timer < microseconds) {}
}
