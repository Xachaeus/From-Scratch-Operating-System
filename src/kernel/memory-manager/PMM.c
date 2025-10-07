#include "PMM.h"
#include <stdint.h>
#include <stdio.h>

AddressRegionDescriptor g_MemoryMap[MAX_ADDRESS_REGIONS];
AddressRegionDescriptor g_UsableMemoryMap[MAX_ADDRESS_REGIONS];

uint64_t PMM_Initialize(AddressRangeDescriptor* mem) {
    uint64_t usable_bytes = 0; 
    int j = 0;
    for (int i=0; i<MAX_ADDRESS_REGIONS; i++){
        g_MemoryMap[i].BaseAddress = mem[i].BaseAddress;
        g_MemoryMap[i].StartAddress = mem[i].BaseAddress;
        g_MemoryMap[i].Limit = mem[i].Limit;
        g_MemoryMap[i].BlockCount = mem[i].Limit / 4096;
        g_MemoryMap[i].EndAddress = mem[i].BaseAddress + mem[i].Limit;
        g_MemoryMap[i].Type = mem[i].RegionType;
        if (mem[i].RegionType == 1) {
            usable_bytes += mem[i].Limit;
            g_UsableMemoryMap[j].BaseAddress = mem[i].BaseAddress;
            g_UsableMemoryMap[j].StartAddress = mem[i].BaseAddress;
            g_UsableMemoryMap[j].Limit = mem[i].Limit;
            g_UsableMemoryMap[j].BlockCount = mem[i].Limit / 4096;
            g_UsableMemoryMap[j].EndAddress = mem[i].BaseAddress + mem[i].Limit;
            g_UsableMemoryMap[j].Type = mem[i].RegionType;
            j++;
        }
    }
    return usable_bytes;
}


void PMM_PrintUsableRegionInfo(int index) {
    printf("Start Address: 0x%llx\nEnd Address: 0x%llx\nSize: %lu blocks, %llu bytes\n", g_UsableMemoryMap[index].StartAddress, g_UsableMemoryMap[index].EndAddress, g_UsableMemoryMap[index].BlockCount, g_UsableMemoryMap[index].Limit);
}