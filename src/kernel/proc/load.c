
#include "load.h"
#include <proc/proc.h>
#include <disk/floppy.h>
#include <filesys/fat12.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>
#include <memory.h>
#include <stdio.h>

#include <memory-manager/VMM.h>

#define MIN(a,b) (((a) < (b)) ? (a) : (b))


int LoadProc(const char* path, ProcessControlBlock* proc) {

    // Start by copying the ELF file header into a buffer
    FAT12_File* file = FAT12_Open(path);
    if (file == NULL) {proc->proc_state = FILE_PATH_ERROR; return 0;}
    if (file->IsDirectory) {FAT12_Close(file); proc->proc_state = FILE_PATH_ERROR; return 0;}

    char header_buffer[512];
    char data_buffer[512];
    memset(header_buffer, '\0', 512);
    memset(data_buffer, '\0', 512);

    int position_in_file = FAT12_Read(file, 512, header_buffer);

    // Read the ELF Header

    const char elf_header[] = {0x7F, 'E', 'L', 'F'};
    if (memcmp(&(header_buffer[0]), elf_header, 4) != 0) {proc->proc_state = EXE_FORMAT_ERROR; return 0;} // Check for ELF header
    if (header_buffer[4] != 1) {proc->proc_state = EXE_FORMAT_ERROR; return 0;} // Check for 32 bit
    if (header_buffer[5] != 1) {proc->proc_state = EXE_FORMAT_ERROR; return 0;} // Check for little endian
    if (header_buffer[16] != 2) {proc->proc_state = EXE_FORMAT_ERROR; return 0;} // Check for executable (instead of relocatable or shared)
    if (header_buffer[18] != 3) {proc->proc_state = EXE_FORMAT_ERROR; return 0;} // Check for ISA (0x3 means x86)

    uint32_t program_entry_addr = ((uint32_t*)header_buffer)[24/4]; // Bytes 24-27 have program entry address
    uint32_t program_header_table_offset = ((uint32_t*)header_buffer)[28/4]; // Bytes 28-31 have program header offset
    uint32_t section_header_table_offset = ((uint32_t*)header_buffer)[32/4]; // Bytes 32-35 have section header offset

    uint16_t program_header_table_entry_size = ((uint16_t*)header_buffer)[42/2];
    uint16_t program_header_table_entry_count = ((uint16_t*)header_buffer)[44/2];
    uint16_t section_header_table_entry_size = ((uint16_t*)header_buffer)[46/2];
    uint16_t section_header_table_entry_count = ((uint16_t*)header_buffer)[48/2];

    uint16_t section_header_string_table_index = ((uint16_t*)header_buffer)[50/2]; // Bytes 42-43 have the size of a program header entry


    // Set the entry address of the process
    proc->entry_address = program_entry_addr;
    proc->bss_section.isActive = false;
    proc->stack_section.isActive = false;
    proc->data_section.isActive = false;
    proc->rodata_section.isActive = false;
    proc->text_section.isActive = false;

    FAT12_File* data_file = FAT12_Open(path);
    int position_in_data_file = FAT12_Read(data_file, 512, data_buffer);

    uint32_t PROCESSING_ADDRESS = 0x200000;

    for (int prog_table_index = 0; prog_table_index < program_header_table_entry_count; prog_table_index++) {

        int current_offset = program_header_table_offset + (prog_table_index * program_header_table_entry_size);
        if (current_offset >= position_in_file) {
            int byte_count = FAT12_Read(file, 512, header_buffer);
            position_in_file += byte_count;
        }

        //printf("Current offset: 0x%x\n", current_offset);

        ProgramHeader* current_header = (ProgramHeader*)&(header_buffer[current_offset % 512]);

        //printf("Segment type: %d\n", current_header->segment_type);
        //printf("Offset: 0x%x\n", current_header->p_offset);
        //printf("Size: 0x%x\n", current_header->p_memsz);
        //printf("Vaddr: 0x%x\n", current_header->p_vaddr);

        if (current_header->segment_type != 1) {continue;} // Check that the segment actually needs loading

        // Figure out which memory region of the process this section should be loaded into
        MemoryRegion* active_region;
        if (current_header->flags & EXECUTABLE) {active_region = &(proc->text_section);}
        else if ((current_header->flags & READABLE) && !(current_header->flags & WRITEABLE)) {active_region = &(proc->rodata_section);}
        else if (current_header->flags & READABLE) {active_region = &(proc->data_section);}
        active_region->isActive = true;

        // Allocate physical memory for file data
        active_region->NumBlocks = (current_header->p_memsz + 4096 - 1)/4096;
        active_region->PhysMemoryBlockIdx = FMM_AllocateBlocks(active_region->NumBlocks);
        active_region->BaseAddress = current_header->p_vaddr;

        // Create a mapping so the physical data can be written to
        FMM_CreateMapping(active_region->PhysMemoryBlockIdx, active_region->NumBlocks, PROCESSING_ADDRESS);

        // Read through the file until you get to the offset specified by the header
        while (position_in_data_file < current_header->p_offset) {position_in_data_file += FAT12_Read(data_file, 512, data_buffer);}
        
        // Copy the first chunk of data from however far into the buffer it begins, so that it is then aligned to 512 bytes
        memcpy((void*)(PROCESSING_ADDRESS + (current_header->p_vaddr & 0x00000FFF)), &(data_buffer[current_header->p_offset%512]), 512 - (current_header->p_offset%512));
        // Loop until all of the file data has been loaded into memory
        int data_bytes_read = 512 - (current_header->p_offset%512);
        while (data_bytes_read < current_header->p_filesz) {
            position_in_data_file += FAT12_Read(data_file, 512, data_buffer);
            memcpy((void*)(PROCESSING_ADDRESS + (current_header->p_vaddr & 0x00000FFF) + data_bytes_read), data_buffer, MIN(512, current_header->p_filesz - data_bytes_read));
            data_bytes_read += MIN(512, current_header->p_filesz - data_bytes_read);
        }
        FMM_ClearMapping(PROCESSING_ADDRESS, active_region->NumBlocks);
    }

    FAT12_Close(data_file);
    FAT12_Close(file);

    proc->proc_state = READY;
    return 1;
}