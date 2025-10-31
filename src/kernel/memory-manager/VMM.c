
#include "VMM.h"
#include "PMM.h"
#include <stdio.h>
#include <stdint.h>
#include <memory.h>


VMM_PageDirectoryEntry* g_PageDirectoryAddress;
VMM_PageTableEntry* g_PageTableAddress;


uint32_t VMM_GetPageTableHandler() {
    // Returns the address of the working page table; only necessary for external modules
    return (uint32_t)g_PageTableAddress;
}

void VMM_VirtualAddress2PageIndices(uint32_t address, uint32_t* PD_Index, uint32_t* PT_Index) {
    // Converts a virtual address to the page directory index and the page table index required to map it to a physical address
    *PD_Index = (address/4096) / 1024;  // Index of the appropriate entry in the Page Directory
    *PT_Index = (address/4096) % 1024;  // Index of the appropriate entry in the appropriate Page Table
}

uint32_t VMM_PageIndices2VirtualAddress(uint32_t PD_Index, uint32_t PT_Index) {
    // Converts a page directory index and a page table index into the virtual address it creates a mapping for
    return ((PD_Index*1024) + (PT_Index)) * 4096;
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

    g_PageDirectoryAddress = (VMM_PageDirectoryEntry*)PMM_BlockIndex2PhysicalAddress(KernelPageDirectoryBlock);
    g_PageTableAddress = (VMM_PageTableEntry*)PMM_BlockIndex2PhysicalAddress(KernelPageTableBlock);
}



void VMM_SetWorkingPageTable(uint32_t table_physical_address) {
    // Re-maps the address in g_PageTableAddress to the physical address of a page table
    uint32_t directory_index, table_index;
    VMM_VirtualAddress2PageIndices((uint32_t)g_PageTableAddress, &directory_index, &table_index);
    VMM_PageTableEntry* kernel_page_table = (VMM_PageTableEntry*)(g_PageDirectoryAddress[directory_index].data & 0xFFFFF000);
    VMM_CreatePageTableEntry(&(kernel_page_table[table_index]), table_physical_address, 0, 1, 1);
    VMM_InvalidatePage(g_PageTableAddress);
}

int VMM_LoadTableForAddress(uint32_t virtual_address) {
    // Finds the right table for the provided address, and maps g_PageTableAddress to that table's address
    uint32_t directory_index, table_index;
    VMM_VirtualAddress2PageIndices(virtual_address, &directory_index, &table_index);
    VMM_PageDirectoryEntry d_entry = g_PageDirectoryAddress[directory_index];
    if (!(d_entry.data & 0x1)) {return 0;}
    VMM_SetWorkingPageTable(d_entry.data & 0xFFFFF000);
    return 1;
}



int VMM_GetTableForAddress(uint32_t virtual_address, VMM_PageTableEntry** physical_table_address) {
    // Returns the address of the page table that contains the entry for the provided address, if it exists
    uint32_t directory_index, table_index;
    VMM_VirtualAddress2PageIndices(virtual_address, &directory_index, &table_index);
    VMM_PageDirectoryEntry d_entry = g_PageDirectoryAddress[directory_index];
    if (!(d_entry.data & 0x1)) {return 0;}
    *physical_table_address = (VMM_PageTableEntry*)(d_entry.data & 0xFFFFF000);
    return 1;
}


void VMM_CreateTableForAddress(uint32_t virtual_address, uint32_t table_physical_address) {
    // Given a virtual address and an available physical address block, create a table at that address and create an entry to that table at the right position within the page directory
    uint32_t directory_index, table_index;
    VMM_VirtualAddress2PageIndices(virtual_address, &directory_index, &table_index);
    printf("Creating table at index %d for address 0x%x\n", directory_index, virtual_address);
    VMM_CreatePageDirectoryEntry(&(g_PageDirectoryAddress[directory_index]), table_physical_address, 0, 1);
}


int VMM_GetPageForAddress(uint32_t virtual_address, VMM_PageTableEntry* entry) {
    // Returns the entry (NOT the address of the entry) in the right page table for the provided vitrual address
    uint32_t directory_index, table_index;
    VMM_VirtualAddress2PageIndices(virtual_address, &directory_index, &table_index);
    VMM_PageDirectoryEntry d_entry = g_PageDirectoryAddress[directory_index];
    if (!(d_entry.data & 0x1)) {return 0;}

    uint32_t table_address = d_entry.data & 0xFFFFF000;
    VMM_SetWorkingPageTable(table_address);
    VMM_PageTableEntry t_entry = g_PageTableAddress[table_index];
    if (!(t_entry.data & 0x1)) {return 0;}
    *entry = t_entry;
    return 1;
}

int VMM_CreatePageForAddress(uint32_t virtual_address, uint32_t physical_address) {
    // Given a virtual address, creates an entry in the right page table to map that address to the provided physical address.
    uint32_t directory_index, table_index;
    VMM_PageTableEntry* table_address;
    VMM_VirtualAddress2PageIndices(virtual_address, &directory_index, &table_index);
    if (!VMM_GetTableForAddress(virtual_address, &table_address)) {return 0;}

    VMM_SetWorkingPageTable((uint32_t)table_address);
    VMM_CreatePageTableEntry(&(g_PageTableAddress[table_index]), physical_address, 0, 1, 1);

    VMM_InvalidatePage(virtual_address);

    printf("Relevant page table entry: 0x%x\n", g_PageTableAddress[table_index]);
    return 1;
}

void VMM_ClearMappingForAddress(uint32_t virtual_address) {
    // Invalidates the page table entry for the provided virtual address
    uint32_t directory_index, table_index;
    VMM_VirtualAddress2PageIndices(virtual_address, &directory_index, &table_index);
    VMM_PageDirectoryEntry d_entry = g_PageDirectoryAddress[directory_index];
    if (!(d_entry.data & 0x1)) {return;}

    uint32_t table_address = d_entry.data & 0xFFFFF000;
    VMM_CreatePageTableEntry(g_PageTableAddress, table_address, 0, 1, 1);
    g_PageTableAddress[table_index].data = 0x0;
    VMM_InvalidatePage(virtual_address);
}