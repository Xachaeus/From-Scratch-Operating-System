
#include "VMM.h"
#include "PMM.h"
#include <stdio.h>
#include <stdint.h>



void VMM_VirtualAddress2PageIndices(uint32_t address, uint32_t* PD_Index, uint32_t* PT_Index) {
    *PD_Index = (address/4) / (1024*1024);  // Index of the appropriate entry in the Page Directory
    *PT_Index = (address/4) % 1024;         // Index of the appropriate entry in the appropriate Page Table
}

uint32_t VMM_PageIndices2VirtualAddress(uint32_t PD_Index, uint32_t PT_Index) {
    return ((PD_Index*1024*1024) + (PT_Index*1024))*4;
}



void VMM_CreatePageDirectoryEntry(VMM_PageDirectoryEntry* entry, uint32_t address, uint8_t avl, uint8_t supervisor) {
    entry->data = (address & 0xFFFFF000) | ((uint32_t)(avl & 0x0F) << 8) | (supervisor? PD_US_FM : 0) | 1;
}

void VMM_CreatePageTableEntry(VMM_PageTableEntry* entry, uint32_t address, uint8_t avl, uint8_t supervisor, uint8_t global) {
    entry->data = (address & 0xFFFFF000) | ((uint32_t)(avl & 0x07) << 9) | (global? PT_Glob_M : 0) | (supervisor? PT_US_FM : 0) | 1;
}



void VMM_Initialize(uint32_t KernelPageDirectoryBlock, uint32_t KernelPageTableBlock) {

    #define VMM_IDENTITY_END_BLOCK 256
    // The first 256 entries in the first page table covers 256*4096=1048576 bytes, or the first megabyte (up to address 0x100000)
    VMM_CreatePageDirectoryEntry(
        (VMM_PageDirectoryEntry*)PMM_BlockIndex2PhysicalAddress(KernelPageDirectoryBlock),  // Address of the first entry of the page directory
        PMM_BlockIndex2PhysicalAddress(KernelPageTableBlock),                               // Address of the first page table
        0,                                                                                  // No information in the avl for now
        1                                                                                   // Supervisor; should only be available to the kernel
    ); 

    // Ensure the rest of the page directory entries are clear
    for (int i = 1; i<1024; i++) {
        ((uint32_t*)PMM_BlockIndex2PhysicalAddress(KernelPageDirectoryBlock))[i] = 0x0;
    }

    for (int i = 0; i<VMM_IDENTITY_END_BLOCK; i++) { 
        VMM_CreatePageTableEntry(
            &(((VMM_PageTableEntry*)PMM_BlockIndex2PhysicalAddress(KernelPageTableBlock))[i]), // Individual entry within the page table
            (4096*i),   // Start addresses covered by each page table entry
            0,          // No information in the avl for now
            1,          // Supervisor; should only be available to the kernel
            1           // Global; maintain across page directory changes (since we'll never remove this mapping)
        ); 
    }

    // Create a mapping for the Page Directory, and add an extra mapping so the kernel can read an active Page Table
    VMM_CreatePageTableEntry(
        &(((VMM_PageTableEntry*)PMM_BlockIndex2PhysicalAddress(KernelPageTableBlock))[VMM_IDENTITY_END_BLOCK]),
        PMM_BlockIndex2PhysicalAddress(KernelPageDirectoryBlock),   // Start address of Page Directory
        0,          // No information in the avl for now
        1,          // Supervisor; should only be available to the kernel
        1           // Global; maintain across page directory changes (since we'll never remove this mapping)
    ); 

    VMM_CreatePageTableEntry(
        &(((VMM_PageTableEntry*)PMM_BlockIndex2PhysicalAddress(KernelPageTableBlock))[VMM_IDENTITY_END_BLOCK+1]),
        PMM_BlockIndex2PhysicalAddress(KernelPageTableBlock),   // Start address of Page Table
        0,          // No information in the avl for now
        1,          // Supervisor; should only be available to the kernel
        1           // Global; maintain across page directory changes (since we'll never remove this mapping)
    ); 

    // Ensure the rest of the page table entries are clear
    for (int i = VMM_IDENTITY_END_BLOCK+2; i<1024; i++) {
        ((uint32_t*)PMM_BlockIndex2PhysicalAddress(KernelPageTableBlock))[i] = 0x0;
    }

    /* DEBUG SECTION
    printf("First block of PD: 0x%x\n", *((VMM_PageDirectoryEntry*)PMM_BlockIndex2PhysicalAddress(KernelPageDirectoryBlock)));
    printf("First block of PT0: 0x%x\n", *((VMM_PageTableEntry*)PMM_BlockIndex2PhysicalAddress(KernelPageTableBlock)));
    printf("Second block of PT0: 0x%x\n", *(((VMM_PageTableEntry*)PMM_BlockIndex2PhysicalAddress(KernelPageTableBlock))+1));
    */

    // Lastly, enable paging
    VMM_EnablePaging((uint32_t)PMM_BlockIndex2PhysicalAddress(KernelPageDirectoryBlock));
}