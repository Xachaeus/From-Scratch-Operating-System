#include "PMM.h"
#include <stdint.h>
#include <stdio.h>

#define NUM_WEDGES 3
#define MAX_NUM_BLOCKS_REQ 1048288
#define MAX_NUM_BLOCKS ((MAX_NUM_BLOCKS_REQ + 7)/8)

AddressRegionDescriptor g_MemoryMap[MAX_ADDRESS_REGIONS];
AddressRegionDescriptor g_UsableMemoryMap[MAX_ADDRESS_REGIONS];

BitmapWedge g_BitmapWedges[NUM_WEDGES];

uint8_t g_Bitmap[MAX_NUM_BLOCKS];

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
        //if (mem[i].RegionType == 1) {
        if (mem[i].RegionType == 1 && mem[i].BaseAddress != 0x0) {
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

    for (int i = 0; i<NUM_WEDGES; i++) {
        g_BitmapWedges[i].free_blocks = 0;
        g_BitmapWedges[i].position = 0;
    }

    for (int i = 0; i<MAX_NUM_BLOCKS; i++) {
        g_Bitmap[i] = 0x0;
    }

    return usable_bytes;
}


uint8_t PMM_GetBitmapData(uint32_t index) {
    return (g_Bitmap[index/8] & (0x1 << (index%8))) ? 1 : 0;
}
uint8_t PMM_SetBitmapData(uint32_t index, uint8_t bit) {
    g_Bitmap[index/8] = (g_Bitmap[index/8] & ~(0x1 << (index%8))) | ((bit?0x1:0x0) << (index%8));
}


void PMM_PrintUsableRegionInfo(int index) {
    printf("Start Address: 0x%llx\nEnd Address: 0x%llx\nSize: %lu blocks, %llu bytes\n", g_UsableMemoryMap[index].StartAddress, g_UsableMemoryMap[index].EndAddress, g_UsableMemoryMap[index].BlockCount, g_UsableMemoryMap[index].Limit);
}


uint32_t PMM_BlockIndex2PhysicalAddress(uint32_t block_index) {
    int prev_blocks = 0;
    for (int i=0; i<MAX_ADDRESS_REGIONS; i++) {
        if(g_UsableMemoryMap[i].Limit == 0) {return 0xFFFFFFFF;} // Error, no block found
        int block_start = g_UsableMemoryMap[i].StartAddress/4096 - prev_blocks;
        int block_end = g_UsableMemoryMap[i].EndAddress/4096 - prev_blocks;
        prev_blocks += g_UsableMemoryMap[i].Limit/4096;

        if (block_end > block_index) { // This region contains the block index
            return (block_start + block_index) * 4096; // Return the address of the start of the block
        }
    }
}

uint32_t PMM_PhysicalAddress2BlockIndex(uint32_t address) {
    int prev_blocks = 0;
    for (int i=0; i<MAX_ADDRESS_REGIONS; i++) {
        if (g_UsableMemoryMap[i].StartAddress <= address && address <= g_UsableMemoryMap[i].EndAddress) {
            return ((address - g_UsableMemoryMap[i].StartAddress) / 4096) + prev_blocks;
        }
        prev_blocks += g_UsableMemoryMap[i].Limit/4096;
    }
}




void PMM_DEBUG_PrintWedges() {
    for (int i = 0; i < NUM_WEDGES; i++) {
        if (i%5 == 0){printf("\n");}
        printf("%d: P:%d,F:%d * ", i, g_BitmapWedges[i].position, g_BitmapWedges[i].free_blocks);
    }
    printf("\n\n");
}





uint32_t PMM_FirstFitSearch(uint32_t start_index, uint32_t num_blocks, uint32_t* num_free) {

    // Search through all bits in the bitmap for free block
    for (uint32_t i = start_index; i < MAX_NUM_BLOCKS; i++) {
        //printf("Idx:%d:%d ", i, PMM_GetBitmapData(i));
        // If an open block is found
        if (!PMM_GetBitmapData(i)) {
            // See if open region is long enough to fit required allocation
            int found = 1; int max_reached = 0;
            for (int j = 0; j<num_blocks; j++) {
                max_reached = j;
                if (PMM_GetBitmapData(i+j)) {
                    found = 0; break;
                }
                else{
                    (*num_free)++;
                }
            }
            // If available space is not big enough, skip to the last block checked (no need to search again)
            if (!found) {i += max_reached; continue;}
            // If space is big enough
            else {
                // Set the bits in the bitmap
                for (int j = 0; j<num_blocks; j++) {
                    PMM_SetBitmapData(i+j, 1);
                }
                (*num_free) -= num_blocks;
                // Return the block index
                return i;
            }
        }
    }
    return 0xFFFFFFFF;
}

uint32_t PMM_AllocateBlocks(uint32_t num_blocks) {
    int wedge = 0;
    uint32_t index = -1;
    uint32_t num_free = 0;
    while (index == -1 && wedge < NUM_WEDGES) {
        //printf("Checking wedge %d... ", wedge);
        if (num_blocks > g_BitmapWedges[wedge].free_blocks) {
            //printf("Not enough space: %d\n", g_BitmapWedges[wedge].free_blocks);
            index = PMM_FirstFitSearch(g_BitmapWedges[wedge].position, num_blocks, &g_BitmapWedges[wedge].free_blocks);
            //printf("First available index: %d\n", index);
            g_BitmapWedges[wedge].position = index + num_blocks;
            // Update the counts of free blocks for higher wedges; strict ordering MAY NOT occur naturally
            for (int w = 0; w < wedge; w++) {
                // Enforce strict ordering
                if (g_BitmapWedges[w].position < g_BitmapWedges[wedge].position){
                    g_BitmapWedges[w].position = g_BitmapWedges[wedge].position;
                    g_BitmapWedges[w].free_blocks = g_BitmapWedges[wedge].free_blocks;
                }
                else {
                    g_BitmapWedges[w].free_blocks -= num_blocks;
                }
            }
            return index;
        }

        else {
            //printf("Available blocks: %d\n", g_BitmapWedges[wedge].free_blocks);
            wedge++;
        }
    }
    // If all wedges are too far along to check, just find the first fit from 0
    index = PMM_FirstFitSearch(g_BitmapWedges[wedge].position, num_blocks, &num_free);
    // Update the free block counts of all wedges, but only if a real index was found
    for (int w = 0; w < NUM_WEDGES && index != -1; w++) {
        g_BitmapWedges[w].free_blocks -= num_blocks;
    }
    return index;
}

/*
int PMM_FreeBlocks(uint32_t index, uint32_t num_blocks) {

    int wedge = 0;
    while (wedge < NUM_WEDGES) {
        // Case 1: Wedge contains freed region
        if (g_BitmapWedges[wedge].position > index+num_blocks) {
            g_BitmapWedges[wedge].free_blocks += num_blocks;
            wedge++;
        }

        // Case 2: Wedge ENDS freed region
        else if (g_BitmapWedges[wedge].position == index+num_blocks) {

            // If this is the last wedge, aka what to do when back to first fit search
            if (wedge == NUM_WEDGES-1) {
                // Potential handler 1: do a backwards search to find the next unfree block and place the wedge there
                // Potential handler 2: put the wedge at 0, so the search takes place at the next allocation

                // Handler 1
                /*
                int freed_blocks = 0;
                // Turn the bitmap into a region of 32-bit chunks
                for (int index = (g_BitmapWedges[wedge].position-num_blocks-1) / 32; index >= 0; index--) {
                    uint32_t map_chunk = ((uint32_t*)g_Bitmap)[index]; // Search through 32 bits of the map at a time
                    // See if this block contains a non-free region
                    if (map_chunk != 0) {
                        uint16_t upper = (map_chunk & 0xFFFF0000) >> 16;
                        uint16_t lower = map_chunk & 0x0000FFFF;
                        int search_start;
                        // If non-free region in upper 16 bits
                        if (upper != 0){ search_start = (index+1)*32; }
                        else { search_start = (index+1)*32 - 16; }
                        for (int i = search_start;i>0;i--){
                            if (PMM_GetBitmapData(i)){
                                g_BitmapWedges[wedge].position = i;
                                freed_blocks = (search_start - i);
                                break;
                            }
                        }
                        break;
                    }
                    // If this whole chunk was still free, search the next 32-bit chunk
                    else {
                        freed_blocks += 32;
                    }
                }
                g_BitmapWedges[wedge].free_blocks -= freed_blocks;
                *//*
                // Handler 2
                g_BitmapWedges[wedge].position = 0;
                g_BitmapWedges[wedge].free_blocks = 0;
            }

            // If there are wedges below
            else {
                // Find the next wedge that is not overlapped with this one,
                // and update all overlapped wedges
                int position; int free_blocks; int last_wedge;
                for (int search = wedge+1; search<NUM_WEDGES; search++) {
                    // If all following wedges are overlapped, all the way to the end
                    if (g_BitmapWedges[search].position==g_BitmapWedges[wedge].position && search==NUM_WEDGES-1) {
                        // Then all will need to be set to 0.
                        position = 0; 
                        free_blocks = 0; 
                        last_wedge = search; break;
                    }
                    // If a wedge overlaps but is not the last wedge, we don't need to do anything
                    // If we find a wedge that is not overlapped
                    else if (g_BitmapWedges[search].position!=g_BitmapWedges[wedge].position) {
                        // Get its data and move all overlapped wedges here
                        position = g_BitmapWedges[search].position; 
                        free_blocks = g_BitmapWedges[search].free_blocks;
                        last_wedge = search-1; break;
                    }
                }
                // Lastly, we need to update all of the overlapped wedges
                for (int i = wedge; i <= last_wedge; i++){
                    g_BitmapWedges[i].position = position;
                    g_BitmapWedges[i].free_blocks = free_blocks;
                }
                wedge = last_wedge + 1;
            }

        }

        // Case 3: Wedge is INSIDE freed region (only possible if region boundaries not respected by user)
        else if (g_BitmapWedges[wedge].position <= index+num_blocks && g_BitmapWedges[wedge].position >= index) {
            return -1; // Return with invalid free and don't perform the free.
        }
        
        // Case 4: Wedge is before freed region
        else {
            break;
        }
    }

    for (int i = index; i<index+num_blocks; i++) { PMM_SetBitmapData(i, 0); }
    return 0;
}
*/


// Function to force-free a region, regardless of wedges. Should only be used if region sizes have been lost.
int PMM_FreeBlocks(uint32_t index, uint32_t num_blocks) {
    //int wedge = NUM_WEDGES-1;
    uint32_t position = 0; uint32_t free_blocks = 0;
    for (int wedge = NUM_WEDGES-1; wedge >= 0; wedge--) {
        // Case 1: Wedge is before free region
        if (g_BitmapWedges[wedge].position <= index) {
            //printf("%d:1;", wedge);
            position = g_BitmapWedges[wedge].position;
            free_blocks = g_BitmapWedges[wedge].free_blocks;
        }

        // Case 2: Wedge is within free region
        else if (g_BitmapWedges[wedge].position < index+num_blocks) {
            //printf("%d:error;", wedge);
            return -1; // This can only happen on an invalid free
        }
        // Case 3: Wedge ends free region
        else if (g_BitmapWedges[wedge].position == index+num_blocks) {
            if (!PMM_GetBitmapData(index-1)){
                //printf("%d:2;", wedge);
                g_BitmapWedges[wedge].position = position;
                g_BitmapWedges[wedge].free_blocks = free_blocks;
            }
            else {
                //printf("%d:3;");
                g_BitmapWedges[wedge].position = index;
            }
        }

        // Case 4: Wedge contains free region
        else {
            //printf("%d:4;", wedge);
            g_BitmapWedges[wedge].free_blocks += num_blocks;
        }
    }
    //printf("\n");

    for (int i = index; i<index+num_blocks; i++) { PMM_SetBitmapData(i, 0); }
    return 0;
}

// Function to force-free a region, regardless of wedges. Should only be used if region sizes have been lost.
void PMM_ForceFreeBlocks(uint32_t index, uint32_t num_blocks) {
    for (int i = index; i<index+num_blocks; i++) { PMM_SetBitmapData(i, 0); }
    int wedge = NUM_WEDGES;
    uint32_t position = 0; uint32_t free_blocks = 0;
    while (wedge >= 0) {
        // Case 1: Wedge is before force-free region
        if (g_BitmapWedges[wedge].position < index) {
            position = g_BitmapWedges[wedge].position;
            free_blocks = g_BitmapWedges[wedge].free_blocks;
        }

        // Case 2: Wedge is within force-free region
        // Case 3: Wedge ends force-free region
        else if (g_BitmapWedges[wedge].position < index+num_blocks) {
            g_BitmapWedges[wedge].position = position;
            g_BitmapWedges[wedge].free_blocks = free_blocks;
        }

        // Case 4: Wedge contains force-free region
        else {
            g_BitmapWedges[wedge].free_blocks += num_blocks;
        }

        wedge--;

    }
}


uint32_t PMM_GetBusyMemory() {
    uint32_t count = 0;
    for (uint32_t i = 0; i < MAX_NUM_BLOCKS; i++) {
        if (PMM_GetBitmapData(i)) {count++;}
    }
    return count;
}