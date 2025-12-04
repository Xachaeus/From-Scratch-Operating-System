#ifndef DELAY_H
#define DELAY_H

#include <stdint.h>

void ActiveContextTimerSleepHook(uint32_t time_passed);
void sleep(uint32_t microseconds);

void MaskTimerInterrupt();
void UnmaskTimerInterrupt();

#endif