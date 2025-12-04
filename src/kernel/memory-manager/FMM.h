
#ifndef FMM_H
#define FMM_H

#include <stdint.h>
#include <stdbool.h>
#include <HAL/hal.h>

typedef struct {
    uint64_t BaseAddress;
    uint64_t Limit;
    uint32_t RegionType;
    uint32_t ExtendedACPI;
} AddressRangeDescriptor;

typedef struct {
    uint32_t BaseAddress;
    uint32_t NumBlocks;
    uint32_t PhysMemoryBlockIdx;
    bool isActive;
} MemoryRegion;

uint64_t FMM_Initialize(AddressRangeDescriptor* mem);

uint32_t FMM_GetDMAAddress();
uint32_t FMM_GetDMAPhysAddress();

void FMM_FreeBlocks(uint32_t block_idx, uint32_t num_blocks);
void FMM_FreeBlocksAt(uint32_t virtual_address, uint32_t num_blocks);
void FMM_ClearMapping(uint32_t virtual_address, uint32_t num_blocks);

uint32_t FMM_AllocateBlocks(uint32_t num_blocks);
int FMM_CreateMapping(uint32_t phys_block_id, uint32_t num_blocks, uint32_t virtual_address);
int FMM_CreateUserCodeMapping(uint32_t phys_block_id, uint32_t num_blocks, uint32_t virtual_address);
int FMM_CreateUserDataMapping(uint32_t phys_block_id, uint32_t num_blocks, uint32_t virtual_address);

void PageFaultHandler(Registers* saved_state);
#endif