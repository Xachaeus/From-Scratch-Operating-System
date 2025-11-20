#ifndef VMM_H
#define VMM_H

#include <stdint.h>

typedef enum {
    PD_Addr_M   = 0xFFFFF000,
    PD_Avl_M    = 0x00000F00,
    PD_Flags_M  = 0x000000FF,
    PD_Pres_M   = 0x00000001,

    PD_PS_FM    = 0b10000000,
    PD_AVL_FM   = 0b01000000,
    PD_A_FM     = 0b00100000,
    PD_PCD_FM   = 0b00010000,
    PD_PWT_FM   = 0b00001000,
    PD_US_FM    = 0b00000100,
    PD_RW_FM    = 0b00000010,
    PD_P_FM     = 0b00000001
} VMM_PageDirectoryFlags;

typedef enum {
    PT_Addr_M   = 0xFFFFF000,
    PT_Avl_M    = 0x00000E00,
    PT_Flags_M  = 0x000000FF,
    PT_Pres_M   = 0x00000001,
    PT_Glob_M   = 0x00000100,

    PT_PAT_FM   = 0b10000000,
    PT_D_FM     = 0b01000000,
    PT_A_FM     = 0b00100000,
    PT_PCD_FM   = 0b00010000,
    PT_PWT_FM   = 0b00001000,
    PT_US_FM    = 0b00000100,
    PT_RW_FM    = 0b00000010,
    PT_P_FM     = 0b00000001
} VMM_PageTableFlags;


typedef struct {
    uint32_t data;
} VMM_PageDirectoryEntry;

typedef struct {
    uint32_t data;
} VMM_PageTableEntry;


void VMM_Initialize(uint32_t KernelPageDirectoryBlock, uint32_t KernelPageTableBlocks, uint32_t KernelDMABlocks);

uint32_t VMM_GetDMAAddress();

void VMM_CreatePageDirectoryEntry(VMM_PageDirectoryEntry* entry, uint32_t address, uint8_t avl, uint8_t supervisor);
uint8_t VMM_GetPageDirectoryEntryAVL(VMM_PageDirectoryEntry* entry);
void VMM_SetPageDirectoryEntryAVL(VMM_PageDirectoryEntry* entry, uint8_t avl);

void VMM_CreatePageTableEntry(VMM_PageTableEntry* entry, uint32_t address, uint8_t avl, uint8_t supervisor, uint8_t global);
uint8_t VMM_GetPageTableEntryAVL(VMM_PageTableEntry* entry);
void VMM_SetPageTableEntryAVL(VMM_PageTableEntry* entry, uint8_t avl);

uint32_t VMM_VirtualAddress2PhysicalAddress(uint32_t virtual_address);

void __attribute__((cdecl)) VMM_EnablePaging(uint32_t page_directory);
void __attribute__((cdecl)) VMM_InvalidatePage(uint32_t virtual_address);
void __attribute__((cdecl)) VMM_InvalidateTLB();

uint32_t VMM_GetWorkingPageTableAddr();
void VMM_SetWorkingPageTable(uint32_t table_physical_address);
int VMM_GetTableForAddress(uint32_t virtual_address, VMM_PageTableEntry** entry);
void VMM_CreateTableForAddress(uint32_t virtual_address, uint32_t physical_address);
int VMM_GetPageForAddress(uint32_t virtual_address, VMM_PageTableEntry* entry);
int VMM_CreatePageForAddress(uint32_t virtual_address, uint32_t physical_address);
void VMM_ClearMappingForAddress(uint32_t virtual_address);

#endif