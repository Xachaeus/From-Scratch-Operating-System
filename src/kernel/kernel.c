#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>
#include <HAL/hal.h>
#include <hardware-io/io.h>
#include <keyboard/keyboard.h>
#include <memory-manager/FMM.h>
#include <memory-manager/PMM.h>
#include <disk/floppy.h>
#include <filesys/fat12.h>
#include <delay.h>
#include <memory.h>
#include <string.h>
#include <stdbool.h>
#include <stddef.h>

// Set the PIC timer delay to the number of microseconds between timer calls
#define PIC_TIMER_DELAY 500


void setup_timer(Registers* regs) {
    // Ignore timer interrupts until initialization is complete
}

void timer(Registers* regs) {
    ActiveContextTimerCursorHook(PIC_TIMER_DELAY);
    ActiveContextTimerSleepHook(PIC_TIMER_DELAY);
}

void __attribute__((cdecl)) kernel_main(uint32_t boot_drive, uint32_t OriginalMemoryMapPtr){

    initialize_stdio(STD_HACKER_COLOR);

    printf("Kernel I/O Initialization Complete!\nBooted from drive: %lu\n", boot_drive);
    printf("Initializing HAL... ");
    i686_IRQ_RegisterHandler(0, setup_timer); // Do this so any initial timer interrupts are ignored
    HAL_Initialize();
    printf("Done!\nInitializing Memory Manager...");
    uint64_t usable_ram = FMM_Initialize((AddressRangeDescriptor*)OriginalMemoryMapPtr);
    printf("Done!\nUsable Ram: %llu blocks, %llu bytes\n", usable_ram/4096, usable_ram);
    i686_IRQ_RegisterHandler(0, timer);
    i686_IRQ_RegisterHandler(1, Keyboard_Handler);
    printf("Initializing Floppy Disk Controller...");
    i686_IRQ_RegisterHandler(6, DISK_Floppy_IRQ6Handler);
    DISK_Floppy_Initialize(boot_drive);
    printf("Done!\n");
    printf("Initializing filesystem... ");
    FAT12_Initialize();
    printf("Done!\n");

    printf("System initialization complete!\n");

    CFG_EnableCursorBlinking();
    CFG_SetCursorChar(0xDB);
    
    char DriveLetter = 'A';

    char CommandBuffer[256];
    char CurrentPath[256];

    memset(CurrentPath, '\0', 256);

    while(true) {
        memset(CommandBuffer, '\0', 256);
        printf("user@machine::%c:/%s$ ", DriveLetter, CurrentPath);
        getline(CommandBuffer, 256);
        const char* command_end = strchr(CommandBuffer, ' ');
        uint8_t command_len;
        if (command_end == NULL) {command_len = strlen(CommandBuffer);}
        else {command_len = command_end - CommandBuffer;}
        
        if (memcmp(CommandBuffer, "ls", 2) == 0) {
            FAT12_File* dir = FAT12_Open(CurrentPath);
            FAT12_DirectoryEntry entry;
            while (FAT12_ReadEntry(dir, &entry)) {
                if (entry.Name[0] == '\0'){break;}
                for (int i = 0; i<11; i++) {printf("%c", entry.Name[i]);}
                printf("\n");
            }
            FAT12_Close(dir);
        }

        else if (memcmp(CommandBuffer, "cd", 2) == 0) {
            const char* new_path = command_end + 1;
            char absolute_path[256];
            if (new_path[0] != '/') { // Relative, non-absolute path
                strcpy(absolute_path, CurrentPath);
                absolute_path[strlen(CurrentPath)] = '/';
                strcpy(absolute_path+strlen(CurrentPath)+1, new_path);
            }
            else {
                strcpy(absolute_path, new_path);
            }
            //printf("Searching for: \"%s\"\n", new_path);
            new_path = absolute_path;
            FAT12_File* file = FAT12_Open(new_path);
            if (file != NULL) {
                if (!file->IsDirectory) {
                    printf("Error: %s not a directory\n", new_path);
                }
                else {
                    //printf("Found directory: %s\n", new_path);
                    if (new_path[0] == '/'){new_path++;}
                    int new_path_len = strlen(new_path);
                    memcpy(CurrentPath, new_path, new_path_len);
                    memset(CurrentPath + new_path_len, '\0', 256-new_path_len);
                }
                FAT12_Close(file);
            }
            else {
                printf("Error: no such directory %s\n", new_path);
            }
        }

        else if (memcmp(CommandBuffer, "cat", 3) == 0) {
            const char* file_path = command_end + 1;
            char absolute_path[256];
            if (file_path[0] != '/') { // Relative, non-absolute path
                strcpy(absolute_path, CurrentPath);
                absolute_path[strlen(CurrentPath)] = '/';
                strcpy(absolute_path+strlen(CurrentPath)+1, file_path);
            }
            else {
                strcpy(absolute_path, file_path);
            }
            FAT12_File* file = FAT12_Open(absolute_path);
            if (file != NULL) {
                if (file->IsDirectory)  {
                    printf("Error: %s is a directory\n", absolute_path);
                }
                else {
                    char print_buffer[513];
                    while(file->Position != file->Size) {
                        FAT12_Read(file, 512, print_buffer);
                        print_buffer[((file->Position-1) % 512) + 1] = '\0';
                        printf("%s", print_buffer);
                    }
                    printf("\n");
                }
                FAT12_Close(file);
            }
            else {
                printf("Error: no such file %s\n", absolute_path);
            }
        }
    }

}