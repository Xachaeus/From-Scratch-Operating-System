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


typedef struct {
    uint32_t free_blocks;
    uint32_t position;
} BitmapWedge;

uint64_t PMM_Initialize(AddressRangeDescriptor* mem);
void PMM_PrintUsableRegionInfo(int index);
uint32_t PMM_BlockIndex2PhysicalAddress(uint32_t block_index);
uint32_t PMM_PhysicalAddress2BlockIndex(uint32_t address);

uint32_t PMM_GetBusyMemory();

uint32_t PMM_AllocateBlocks(uint32_t num_blocks);
int PMM_FreeBlocks(uint32_t index, uint32_t num_blocks);
void PMM_ForceFreeBlocks(uint32_t index, uint32_t num_blocks);

void PMM_DEBUG_PrintWedges();

#endif