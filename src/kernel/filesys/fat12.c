
#include "fat12.h"

#include <stdint.h>
#include <stdbool.h>
#include <stddef.h>
#include <string.h>
#include <disk/floppy.h>
#include <memory.h>
#include <stdio.h>
#include <ctype.h>

#define MIN(a,b) (((a) < (b)) ? (a) : (b))

#define MAX_FILE_HANDLES 10
#define ROOT_DIRECTORY_HANDLE -1
#define MAX_PATH_SIZE 256

FAT12_Data g_FatData;
uint32_t g_FirstFATSector;
uint32_t g_FirstRootDirSector;
uint32_t g_RootDirSize;
uint32_t g_FirstDataSector;
uint8_t* g_FAT;
uint8_t g_RootDirectoryBuffer[512];

uint32_t g_FATLoaded = 0xFFFFFFFF;



void FAT12_ReadSector(uint32_t lba, uint8_t* dest) {
    DISK_Floppy_ReadSector(lba);
    memcpy(dest, DISK_Floppy_GetSectorAddr(0), 512);
}

void FAT12_LoadFATSector(uint32_t idx) {
    DISK_Floppy_ReadSectorsTo(g_FirstFATSector + idx, 15, 1);
    g_FAT = DISK_Floppy_GetSectorAddr(15);
    g_FATLoaded = true;
}

void FAT12_Initialize() {
    // Read the boot sector
    DISK_Floppy_ReadSector(0);
    memcpy(&(g_FatData.BS.BootSectorBytes), DISK_Floppy_GetSectorAddr(0), sizeof(FAT12_BootSector));
    // Set up information necessary to find FAT and root directory
    g_FirstFATSector = g_FatData.BS.BootSector.ReservedSectors;
    g_FirstRootDirSector = g_FirstFATSector + (g_FatData.BS.BootSector.FatCount * g_FatData.BS.BootSector.SectorsPerFat);
    // Record data for root directory
    g_RootDirSize = sizeof(FAT12_DirectoryEntry) * g_FatData.BS.BootSector.DirEntryCount;
    g_FatData.RootDirectory.Public.Handle = ROOT_DIRECTORY_HANDLE;
    g_FatData.RootDirectory.Public.Handle = ROOT_DIRECTORY_HANDLE;
    g_FatData.RootDirectory.Public.IsDirectory = true;
    g_FatData.RootDirectory.Public.Position = 0;
    g_FatData.RootDirectory.Public.Size = sizeof(FAT12_DirectoryEntry) * g_FatData.BS.BootSector.DirEntryCount;
    g_FatData.RootDirectory.Opened = true;
    g_FatData.RootDirectory.FirstCluster = g_FirstRootDirSector;
    g_FatData.RootDirectory.CurrentCluster = g_FirstRootDirSector;
    g_FatData.RootDirectory.CurrentSectorInCluster = 0;
    // Read data for root directory
    FAT12_ReadSector(g_FirstRootDirSector, (uint8_t*)&(g_RootDirectoryBuffer));

    g_FirstDataSector = g_FirstRootDirSector + ((g_RootDirSize + 512 - 1) / 512);

    for (int i = 0; i < MAX_FILE_HANDLES; i++) {
        g_FatData.OpenedFiles[i].Opened = false;
    }

    //printf("\nVolume Label: %s\n", g_FatData.BS.BootSector.VolumeLabel);
    //printf("FAT size: %hd\n", g_FatData.BS.BootSector.SectorsPerFat);
    //printf("Sectors per cluster: %hd\n", g_FatData.BS.BootSector.SectorsPerCluster);
}

FAT12_File* FAT12_OpenEntry(FAT12_DirectoryEntry* entry) {
    // find empty handle
    int handle = -1;
    for (int i = 0; i < MAX_FILE_HANDLES; i++) {
        if (!g_FatData.OpenedFiles[i].Opened) {handle = i; break;}
    }
    // out of handles
    if (handle < 0)
    {
        printf("FAT12: out of file handles\r\n");
        return NULL;
    }
    // Record Metadata
    FAT12_FileData* fd = &(g_FatData.OpenedFiles[handle]);
    fd->Public.Handle = handle;
    fd->Public.IsDirectory = (entry->Attributes & FAT12_ATTRIBUTE_DIRECTORY) != 0;
    fd->Public.Position = 0;
    fd->Public.Size = entry->Size;
    fd->FirstCluster = entry->FirstClusterLow + ((uint32_t)entry->FirstClusterHigh << 16);
    fd->CurrentCluster = fd->FirstCluster;
    fd->CurrentSectorInCluster = 0;
    // Read cluster into buffer
    fd->Opened = true;
    return &(fd->Public);
}

uint32_t FAT12_Cluster2Sector(uint32_t cluster) {
    return (cluster-2) + g_FirstDataSector;
}

uint32_t FAT12_NextCluster(uint32_t currentCluster)
{    
    uint32_t fatIndex = currentCluster * 3 / 2;
    uint32_t fatSectorIndex = (fatIndex * 3)/(512*2); // Figure out which sector of the fat needs to be loaded
    if (g_FATLoaded != fatSectorIndex) {FAT12_LoadFATSector(fatSectorIndex);}
    if (currentCluster % 2 == 0)
        return (*(uint16_t*)(g_FAT + fatIndex)) & 0x0FFF;
    else
        return (*(uint16_t*)(g_FAT + fatIndex)) >> 4;
}

uint32_t FAT12_Read(FAT12_File* file, uint32_t byte_count, void* dest) {
    FAT12_FileData* fd = (file->Handle == ROOT_DIRECTORY_HANDLE) ? &g_FatData.RootDirectory : &(g_FatData.OpenedFiles[file->Handle]);
    uint8_t* data_out = dest;

    // If opening a file, do not read past the end of the file
    if (!fd->Public.IsDirectory) {
        byte_count = MIN(byte_count, fd->Public.Size - fd->Public.Position);
    }

    while (byte_count > 0) {
        uint32_t left_in_buffer = 512 - (fd->Public.Position % 512);
        uint32_t take = MIN(byte_count, left_in_buffer);
        // Special handling of root directory
        if (fd->Public.Handle == ROOT_DIRECTORY_HANDLE) {
            DISK_Floppy_ReadSector(fd->CurrentCluster);
        }
        else {
            DISK_Floppy_ReadSector(FAT12_Cluster2Sector(fd->CurrentCluster));
        }

        memcpy(data_out, DISK_Floppy_GetSectorAddr(0) + (fd->Public.Position % 512), take);
        data_out += take;
        fd->Public.Position += take;
        byte_count -= take;
        if (left_in_buffer == take) {
            // Special handling for root directory
            if (fd->Public.Handle == ROOT_DIRECTORY_HANDLE) {
                fd->CurrentCluster++;
            }
            // Handling for all other entries
            else {
                fd->CurrentCluster = FAT12_NextCluster(fd->CurrentCluster);
                //printf("New cluster: 0x%x\n", fd->CurrentCluster);
                if (fd->CurrentCluster >= 0xFF8) {
                    //printf("Reached end of clusters!\n");
                    fd->Public.Size = fd->Public.Position;
                    break;
                }
            }
        }
    }
    return (uint32_t)data_out - (uint32_t)dest;
}

bool FAT12_ReadEntry(FAT12_File* file, FAT12_DirectoryEntry* entry_out) {
    return FAT12_Read(file, sizeof(FAT12_DirectoryEntry), entry_out) == sizeof(FAT12_DirectoryEntry);
}

void FAT12_Close(FAT12_File* file) {
    if (file->Handle == ROOT_DIRECTORY_HANDLE) {
        file->Position = 0;
        g_FatData.RootDirectory.CurrentCluster = g_FatData.RootDirectory.FirstCluster;
    }
    else {
        g_FatData.OpenedFiles[file->Handle].Opened = false;
    }
}

bool FAT12_FindFile(FAT12_File* file, const char* name, FAT12_DirectoryEntry* entryOut) {
    // Step 1: Parse applicable FAT name from provided name
    char fat_name[12];
    FAT12_DirectoryEntry entry;
    memset(fat_name, ' ', sizeof(fat_name));
    fat_name[11] = '\0';
    if (memcmp(name, "..", 2) == 0) {
        fat_name[0] = '.'; fat_name[1] = '.';
    }
    else if (memcmp(name, ".", 1) == 0) {
        fat_name[0] = '.';
    }
    else {
        const char* ext = strchr(name, '.');
        if (ext == NULL) {ext = name+11;}

        for (int i = 0; i < 8 && name[i] && name + i < ext; i++) {
            fat_name[i] = toupper(name[i]);
        }

        if (ext != NULL) {
            for (int i = 0; i < 3 && ext[i + 1]; i++) {
                fat_name[i + 8] = toupper(ext[i + 1]);
            }
        }
    }
    // Step 2: Search for name in file
    while (FAT12_ReadEntry(file, &entry)) {
        //printf("Checking new entry...\n");
        if (entry.Name[0] == '\0') {break;}
        if (memcmp(fat_name, entry.Name, 11) == 0) {
            *entryOut = entry;
            return true;
        }
    }

    return false;
}

FAT12_File* FAT12_Open(const char* path) {

    char name[MAX_PATH_SIZE];
    memset(name, '\0', MAX_PATH_SIZE);

    // Ignore leading slash
    if (path[0] == '/') {path++;}
    FAT12_File* current = &(g_FatData.RootDirectory.Public);

    while (*path) {
        // Extract next name from path
        bool isLast = false;
        const char* delim = strchr(path, '/');
        if (delim != NULL) {
            memcpy(name, path, delim-path);
            name[delim-path+1] = '\0';
            path = delim+1;
        }
        else {
            uint8_t len = strlen(path);
            memcpy(name, path, len);
            name[len+1] = '\0';
            path += len;
            isLast = true;
        }

        // Find the appropriate directory entry
        FAT12_DirectoryEntry entry;
        //printf("Searching for file...\n");
        if (FAT12_FindFile(current, name, &entry)) {
            //printf("Found file!\n");
            FAT12_Close(current);
            // check if directory
            if (!isLast && entry.Attributes & FAT12_ATTRIBUTE_DIRECTORY == 0)
            {
                printf("FAT12: %s not a directory\n", name);
                return NULL;
            }
            // open new directory entry
            current = FAT12_OpenEntry(&entry);
        }
        else
        {
            FAT12_Close(current);
            //printf("FAT12: %s not found\n", name);
            return NULL;
        }
    }
    return current;
}