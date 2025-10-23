
#ifndef FMM_H
#define FMM_H

#include <stdint.h>
#include <HAL/hal.h>

typedef struct {
    uint64_t BaseAddress;
    uint64_t Limit;
    uint32_t RegionType;
    uint32_t ExtendedACPI;
} AddressRangeDescriptor;

uint64_t FMM_Initialize(AddressRangeDescriptor* mem);
void PageFaultHandler(Registers* saved_state);
#endif