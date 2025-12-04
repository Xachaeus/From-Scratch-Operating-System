
#include <stdint.h>
#include <stdio.h>
#include <HAL/hal.h>
#include "FMM.h"
#include "PMM.h"
#include "VMM.h"
#include <proc/proc.h>
#include <hardware-io/io.h>


volatile uint32_t g_KernelDMAAddress;
volatile uint32_t g_KernelDMAPhysicalAddress;


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

    i686_DisableInterrupts();

    uint32_t invalid_address;
    asm volatile("mov %%cr2, %0" : "=r"(invalid_address));

    int violating_pid = GetRunningPID();
    if (violating_pid == -1) {
        printf("Page fault for address 0x%x!\n", invalid_address);
        printf("Error is kernel-caused!\n");
        printf("  interrupt=0x%x  error_code=0x%x  \n", saved_state->interrupt, saved_state->error);
        printf("  eax=%d  ebx=%d  ecx=%d  edx=%d  esi=%d  edi=%d\n", saved_state->eax, saved_state->ebx, saved_state->ecx, saved_state->edx, saved_state->esi, saved_state->edi);
        printf("  kernel_esp=0x%x  ebp=0x%x  eip=0x%x  cs=%d\n  eflags=%d  esp=0x%x  ss=%d  \n", saved_state->kernel_esp, saved_state->ebp, saved_state->eip, saved_state->cs, saved_state->eflags, saved_state->esp, saved_state->ss);
        for (;;);
    }

    else {

        if (!(saved_state->error & 1)) {
            printf("Page Fault: Mapping not found for virtual address 0x%x!\n", invalid_address);
        }
        else {
            printf("Page fault for address 0x%x!\n", invalid_address);
        }
        VMM_PageDirectoryEntry d_entry; VMM_PageTableEntry t_entry;
        VMM_FetchTableForAddress(invalid_address, &d_entry);
        VMM_GetPageForAddress(invalid_address, &t_entry);
        printf("  Table: 0x%x  Page: 0x%x\n", d_entry.data, t_entry.data);
        printf("  interrupt=0x%x  error_code=0x%x  \n", saved_state->interrupt, saved_state->error);
        printf("  kernel_esp=0x%x  ebp=0x%x  eip=0x%x  cs=0x%x\n  eflags=0x%x  esp=0x%x  ss=0x%x  \n", saved_state->kernel_esp, saved_state->ebp, saved_state->eip, saved_state->cs, saved_state->eflags, saved_state->esp, saved_state->ss);
        
        TerminateRunningProcess((Context*)saved_state);

    }

    i686_EnableInterrupts();

}

void GeneralProtectionxFaultHandler(Registers* saved_state) {

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

void FMM_ClearMapping(uint32_t virtual_address, uint32_t num_blocks) {
    VMM_PageTableEntry* table; VMM_PageTableEntry entry;
    virtual_address &= 0xFFFFF000;
    for (uint64_t effective_address = virtual_address; effective_address < (uint64_t)virtual_address + (uint64_t)(num_blocks*4096); effective_address += 4096) {

        if (!VMM_GetTableForAddress(effective_address, &table)) {continue;}
        if (!VMM_GetPageForAddress(effective_address, &entry)) {continue;}

        //printf("Physical address: 0x%x, Index: 0x%x\n", entry.data & 0xFFFFF000, physical_address);
        VMM_ClearMappingForAddress(effective_address);
    }
}

void FMM_FreeBlocks(uint32_t block_idx, uint32_t num_blocks) {
    PMM_FreeBlocks(block_idx, num_blocks);
}

uint32_t FMM_AllocateBlocks(uint32_t num_blocks) {
    return PMM_AllocateBlocks(num_blocks);
}



int FMM_CreateUserCodeMapping(uint32_t phys_block_id, uint32_t num_blocks, uint32_t virtual_address) {
    VMM_PageTableEntry* table; VMM_PageTableEntry entry;
    virtual_address &= 0xFFFFF000;
    uint32_t curr_phys_block = phys_block_id;
    for (uint64_t effective_address = virtual_address; effective_address < (uint64_t)virtual_address + (uint64_t)(num_blocks*4096); effective_address += 4096) {
        if (!VMM_GetTableForAddress(effective_address, &table)) {
            uint32_t physical_table_address = PMM_BlockIndex2PhysicalAddress(PMM_AllocateBlocks(1));
            VMM_CreateUserTableForAddress(effective_address, physical_table_address);
        }
        //printf("Eff. Addr: 0x%x | 0x%x\n", effective_address, (num_blocks*4096));
        if (!VMM_CreateUserCodePageForAddress(effective_address, PMM_BlockIndex2PhysicalAddress(curr_phys_block))) {
            printf("MM: Page allocation failed!\n");
            PMM_FreeBlocks(curr_phys_block, 1);
            return 0;
        }
        curr_phys_block++;
    }
    VMM_InvalidateTLB();
    return 1;
}

int FMM_CreateUserDataMapping(uint32_t phys_block_id, uint32_t num_blocks, uint32_t virtual_address) {
    VMM_PageTableEntry* table; VMM_PageTableEntry entry;
    virtual_address &= 0xFFFFF000;
    uint32_t curr_phys_block = phys_block_id;
    for (uint64_t effective_address = virtual_address; effective_address < (uint64_t)virtual_address + (uint64_t)(num_blocks*4096); effective_address += 4096) {
        if (!VMM_GetTableForAddress(effective_address, &table)) {
            uint32_t physical_table_address = PMM_BlockIndex2PhysicalAddress(PMM_AllocateBlocks(1));
            VMM_CreateUserTableForAddress(effective_address, physical_table_address);
        }
        //printf("Eff. Addr: 0x%x | 0x%x\n", effective_address, (num_blocks*4096));
        if (!VMM_CreateUserDataPageForAddress(effective_address, PMM_BlockIndex2PhysicalAddress(curr_phys_block))) {
            printf("MM: Page allocation failed!\n");
            PMM_FreeBlocks(curr_phys_block, 1);
            return 0;
        }
        curr_phys_block++;
    }
    VMM_InvalidateTLB();
    return 1;
}




int FMM_CreateMapping(uint32_t phys_block_id, uint32_t num_blocks, uint32_t virtual_address) {
    VMM_PageTableEntry* table; VMM_PageTableEntry entry;
    virtual_address &= 0xFFFFF000;
    uint32_t curr_phys_block = phys_block_id;
    for (uint64_t effective_address = virtual_address; effective_address < (uint64_t)virtual_address + (uint64_t)(num_blocks*4096); effective_address += 4096) {
        if (!VMM_GetTableForAddress(effective_address, &table)) {
            uint32_t physical_table_address = PMM_BlockIndex2PhysicalAddress(PMM_AllocateBlocks(1));
            VMM_CreateTableForAddress(effective_address, physical_table_address);
        }
        //printf("Eff. Addr: 0x%x | 0x%x\n", effective_address, (num_blocks*4096));
        if (!VMM_CreatePageForAddress(effective_address, PMM_BlockIndex2PhysicalAddress(curr_phys_block))) {
            printf("MM: Page allocation failed!\n");
            PMM_FreeBlocks(curr_phys_block, 1);
            return 0;
        }
        curr_phys_block++;
    }
    VMM_InvalidateTLB();
    return 1;
}