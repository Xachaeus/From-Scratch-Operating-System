
#include <stdint.h>
#include <stdio.h>
#include <HAL/hal.h>
#include "FMM.h"
#include "PMM.h"
#include "VMM.h"


uint32_t g_KernelDMAAddress;
uint32_t g_KernelDMAPhysicalAddress;


uint32_t FMM_GetDMAAddress() {
    return g_KernelDMAAddress;
}

uint32_t FMM_GetDMAPhysAddress() {
    return g_KernelDMAPhysicalAddress;
}


uint64_t FMM_Initialize(AddressRangeDescriptor* mem) {
    uint64_t available_memory = PMM_Initialize(mem);
    uint32_t kernel_page_directory_block = PMM_AllocateBlocks(1);
    uint32_t kernel_page_table_block = PMM_AllocateBlocks(1);
    uint32_t kernel_DMA_blocks = PMM_AllocateBlocks(2);
    VMM_Initialize(kernel_page_directory_block, kernel_page_table_block, kernel_DMA_blocks);

    i686_ISR_RegisterHandler(0xe, PageFaultHandler);

    g_KernelDMAPhysicalAddress = PMM_BlockIndex2PhysicalAddress(kernel_DMA_blocks);
    g_KernelDMAAddress = VMM_GetDMAAddress();

    return available_memory;
}

void PageFaultHandler(Registers* saved_state) {
    uint32_t invalid_address;
    asm volatile("mov %%cr2, %0" : "=r"(invalid_address));
    if (!(saved_state->error & 1)) {
        printf("Page Fault: Mapping not found for virtual address 0x%x!\n", invalid_address);
    }
    else {
        printf("Page fault for address 0x%x!\n", invalid_address);
    }
    printf("  interrupt=0x%x  error_code=0x%x  \n", saved_state->interrupt, saved_state->error);
    printf("  eax=%d  ebx=%d  ecx=%d  edx=%d  esi=%d  edi=%d\n", saved_state->eax, saved_state->ebx, saved_state->ecx, saved_state->edx, saved_state->esi, saved_state->edi);
    printf("  kernel_esp=%d  ebp=%d  eip=%d  cs=%d\n  eflags=%d  esp=%d  ss=%d  \n", saved_state->kernel_esp, saved_state->ebp, saved_state->eip, saved_state->cs, saved_state->eflags, saved_state->esp, saved_state->ss);
    for (;;);
}

void FMM_FreeBlocksAt(uint32_t virtual_address, uint32_t num_blocks) {
    VMM_PageTableEntry* table; VMM_PageTableEntry entry;
    virtual_address &= 0xFFFFF000;
    for (uint32_t effective_address = virtual_address; effective_address < virtual_address + (num_blocks*4096); effective_address += 4096) {

        if (!VMM_GetTableForAddress(effective_address, &table)) {continue;}
        if (!VMM_GetPageForAddress(effective_address, &entry)) {continue;}

        uint32_t physical_address = PMM_PhysicalAddress2BlockIndex(entry.data & 0xFFFFF000);
        //printf("Physical address: 0x%x, Index: 0x%x\n", entry.data & 0xFFFFF000, physical_address);
        PMM_FreeBlocks(physical_address, 1);
        VMM_ClearMappingForAddress(effective_address);
    }
}

int FMM_AllocateBlocksAt(uint32_t virtual_address, uint32_t num_blocks) {
    VMM_PageTableEntry* table; VMM_PageTableEntry entry;
    virtual_address &= 0xFFFFF000;
    for (uint32_t effective_address = virtual_address; effective_address < virtual_address + (num_blocks*4096); effective_address += 4096) {
        if (!VMM_GetTableForAddress(effective_address, &table)) {
            //printf("MM: Table not found for address 0x%x!\n", effective_address);
            uint32_t physical_table_address = PMM_BlockIndex2PhysicalAddress(PMM_AllocateBlocks(1));
            VMM_CreateTableForAddress(effective_address, physical_table_address);
        }
        int block_idx = PMM_AllocateBlocks(1);
        if (!VMM_CreatePageForAddress(effective_address, PMM_BlockIndex2PhysicalAddress(block_idx))) {
            printf("MM: Page allocation failed!\n");
            PMM_FreeBlocks(block_idx, 1);
            return 0;
        }
    }
    return 1;
}