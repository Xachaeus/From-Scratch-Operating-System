#include <file.h>
#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include <stddef.h>
#include <filesys/drive.h>
#include <filesys/fat12.h>

#define MAX_FILE_HANDLES 10
#define UNUSED_HANDLE -1

#define FILESYS_NULL

#define STD_FILES 3

File g_Files[MAX_FILE_HANDLES+STD_FILES];


void File_Initialize() {
    for (int i = STD_FILES; i<MAX_FILE_HANDLES; i++) {
        g_Files[i].handle = UNUSED_HANDLE;
        g_Files[i].mapped_handle = NULL;
        g_Files[i].filesys = FILESYS_NONE;
    }
}


int open(const char* path) {
    // Search for an unused file descriptor. If all are in use, return -1 to convey that the open failed
    int handle = UNUSED_HANDLE;
    for (int i=STD_FILES; i<MAX_FILE_HANDLES; i++) {
        if (g_Files[i].handle == UNUSED_HANDLE) {
            g_Files[i].handle = i;
            handle = i;
            break;
        }
    }
    if (handle == UNUSED_HANDLE) {return handle;}

    // Iterate through the various filesystems until one of them works, and assign its handle to the available descriptor
    FAT12_File* FAT12_handle = FAT12_Open(path);
    if (FAT12_handle != NULL) { // If file exists in FAT12 drive
        g_Files[handle].filesys = FILESYS_FAT12;
        g_Files[handle].mapped_handle = FAT12_handle;
    }
    // Additional filesystem checks go here
    // If all open attempts fail, free the descriptor since the open failed
    else {
        g_Files[handle].handle = UNUSED_HANDLE;
        handle = UNUSED_HANDLE;
    }
    // Now that file is ready in its given filesystem, return the handle
    return handle;
}


int read(int file, uint32_t byte_count, void* dest) {
    if (g_Files[file].filesys == FILESYS_FAT12) {
        return FAT12_Read(g_Files[file].mapped_handle, byte_count, dest);
    }
}

int write(int file, uint32_t byte_count, void* src) {
    if (file == 0) {PutsK(src, byte_count);}
}

void close(int file) {
    if (g_Files[file].filesys == FILESYS_FAT12){
        FAT12_Close(g_Files[file].mapped_handle);
    }
    g_Files[file].handle = UNUSED_HANDLE;
}

