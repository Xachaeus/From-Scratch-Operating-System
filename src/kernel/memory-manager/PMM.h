#ifndef MEMORY_MANAGER_H
#define MEMORY_MANAGER_H

#define MAX_ADDRESS_REGIONS 20

#include <stdint.h>
#include "FMM.h"

typedef struct {
    uint64_t BaseAddress;
    uint64_t Limit;
    uint64_t StartAddress;
    uint64_t EndAddress;
    uint32_t Type;
    uint32_t BlockCount;
} AddressRegionDescriptor;

uint64_t PMM_Initialize(AddressRangeDescriptor* mem);
void PMM_PrintUsableRegionInfo(int index);

#endif