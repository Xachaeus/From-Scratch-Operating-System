
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

uint32_t FMM_GetDMAAddress();
uint32_t FMM_GetDMAPhysAddress();

void FMM_FreeBlocksAt(uint32_t virtual_address, uint32_t num_blocks);
int FMM_AllocateBlocksAt(uint32_t virtual_address, uint32_t num_blocks);
void PageFaultHandler(Registers* saved_state);
#endif