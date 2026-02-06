#include <file.h>
#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include <stddef.h>
#include <filesys/drive.h>
#include <filesys/fat12.h>
#include <proc/proc.h>

#define MAX_FILE_HANDLES 10
#define UNUSED_HANDLE -1

File g_Files[MAX_FILE_HANDLES];


FileDescriptor* g_ActiveFileDescriptors = NULL;


void File_Initialize() {
    for (int i = 0; i<MAX_FILE_HANDLES; i++) {
        g_Files[i].handle = UNUSED_HANDLE;
        g_Files[i].mapped_handle = NULL;
        g_Files[i].filesys = FILESYS_NONE;
    }
}

void SetActiveFileDescriptors(FileDescriptor* fd) {
    g_ActiveFileDescriptors = fd;
}

/*
Open system call
 - Responsible for opening files for processes regardless of disk or filesystem specifics
 - If a process is currently running, then return the file handle from that process's private file descriptor list
 - Otherwise, return the file handle from the global file handle list
*/
int open(const char* path) {
    // Search for an unused file descriptor. If all are in use, return -1 to convey that the open failed
    int handle = UNUSED_HANDLE;
    int proc_handle = UNUSED_HANDLE;
    for (int i=0; i<MAX_FILE_HANDLES; i++) {
        if (g_Files[i].handle == UNUSED_HANDLE) {
            g_Files[i].handle = i;
            handle = i;
            break;
        }
    }
    if (g_ActiveFileDescriptors != NULL) {
        for (int i = 0; i < PROC_NUM_FD; i++) {
            if (g_ActiveFileDescriptors[i].handle == UNUSED_HANDLE) {
                g_ActiveFileDescriptors[i].handle = i;
                g_ActiveFileDescriptors[i].source_handle = handle;
                proc_handle = i;
                break;
            }
        }
        if (proc_handle == UNUSED_HANDLE) {
            g_Files[handle].handle = UNUSED_HANDLE;
            return -1;
        }
    }
    if (handle == UNUSED_HANDLE) {return -1;}

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
        if (g_ActiveFileDescriptors != NULL) {g_ActiveFileDescriptors[proc_handle].handle = UNUSED_HANDLE;}
    }
    // Now that file is ready in its given filesystem, return the handle
    // If returning the handle for the process's FD map, add the number of STD files to allow for room in the handle space.
    if (g_ActiveFileDescriptors != NULL) {return proc_handle;}
    else {return handle;}
}


int read(int file, uint32_t byte_count, void* dest) {
    // Behavior for running processes
    if (g_ActiveFileDescriptors != NULL) {
        // If reading STDIN and a mapping has not been assigned
        if (file == 1 && g_ActiveFileDescriptors[1].source_handle == UNUSED_HANDLE) {
            return sscanf(dest, "%s");
        }
        // Otherwise
        file = g_ActiveFileDescriptors[file].source_handle;
    }
    // Behavior for no processes running
    if (g_Files[file].filesys == FILESYS_FAT12) {
        return FAT12_Read(g_Files[file].mapped_handle, byte_count, dest);
    }
}

int write(int file, uint32_t byte_count, void* src) {
    // Behavior for running processes
    if (g_ActiveFileDescriptors != NULL) {
        if (file == 0 && g_ActiveFileDescriptors[0].source_handle == UNUSED_HANDLE) {
            PutsK(src, byte_count);
        }
        else {
            // TODO: fill this in after file write has been implemented
        }
    }
    // Behavior for no running processes
    else {
        // TODO: fill this in after file write has been implemented
    }
}

void close(int file) {
    // Behavior for running processes
    if (g_ActiveFileDescriptors != NULL) {
        int handle = g_ActiveFileDescriptors[file].source_handle;
        g_ActiveFileDescriptors[file].handle = UNUSED_HANDLE;
        file = handle;
    }

    if (g_Files[file].filesys == FILESYS_FAT12){
        FAT12_Close(g_Files[file].mapped_handle);
    }

    g_Files[file].handle = UNUSED_HANDLE;
}

