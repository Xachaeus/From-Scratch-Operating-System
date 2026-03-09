
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

#ifndef MAX_FAT12_FILE_HANDLES
#define MAX_FAT12_FILE_HANDLES 10
#endif

#ifndef ROOT_DIRECTORY_HANDLE
#define ROOT_DIRECTORY_HANDLE -1
#endif

#ifndef MAX_FAT12_PATH_SIZE
#define MAX_FAT12_PATH_SIZE 256
#endif

FAT12_Data g_FatData;
uint32_t g_FirstFATSector;
uint32_t g_FirstRootDirSector;
uint32_t g_RootDirSize;
uint32_t g_FirstDataSector;
uint8_t* g_FAT;
uint8_t g_RootDirectoryBuffer[512];

uint32_t g_FATLoaded = 0xFFFFFFFF;




void FAT12_PathName2FATName(uint8_t fat_name[], const char* path_name) {
    int src_idx = 0;
    for (int i = 0; i<8; i++) {
        if (path_name[src_idx] != '.') {
            fat_name[i] = path_name[src_idx];
            src_idx++;
        }
        else {
            fat_name[i] = ' ';
        }
    }
    src_idx++;
    for (int i = 8; i < 11; i++) {
        if (path_name[src_idx] != '\0') {
            fat_name[i] = path_name[src_idx];
            src_idx++;
        }
        else {
            fat_name[i] = ' ';
        }
    }
}



void FAT12_ReadSector(uint32_t lba, uint8_t* dest) {
    DISK_Floppy_ReadSector(lba);
    memcpy(dest, DISK_Floppy_GetSectorAddr(0), 512);
}

void FAT12_LoadFATSector(uint32_t idx) {
    DISK_Floppy_ReadSectorsTo(g_FirstFATSector + idx, 15, 1);
    g_FAT = DISK_Floppy_GetSectorAddr(15);
    g_FATLoaded = true;
}

void FAT12_WriteActiveFATSector(uint32_t idx) {
    printf("Writing active FAT sector to disk...\n");
    // Writes the currently-loaded FAT sector back to the disk
    DISK_Floppy_WriteSectorFrom(g_FirstFATSector + idx, 15);
    printf("Success!\n");
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

    for (int i = 0; i < MAX_FAT12_FILE_HANDLES; i++) {
        g_FatData.OpenedFiles[i].Opened = false;
    }

    //printf("\nVolume Label: %s\n", g_FatData.BS.BootSector.VolumeLabel);
    //printf("FAT size: %hd\n", g_FatData.BS.BootSector.SectorsPerFat);
    //printf("Sectors per cluster: %hd\n", g_FatData.BS.BootSector.SectorsPerCluster);
}

FAT12_File* FAT12_OpenEntry(FAT12_DirectoryEntry* entry) {
    // find empty handle
    int handle = -1;
    for (int i = 0; i < MAX_FAT12_FILE_HANDLES; i++) {
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

uint32_t FAT12_FindFreeCluster(uint32_t start_cluster) {
    // Start by loading the FAT at the provided start point. We will search one cluster at a time until a free cluster is found.
    uint32_t fatIndex = start_cluster * 3 / 2;
    uint32_t fatSectorIndex = (fatIndex * 3)/(512*2);
    if (g_FATLoaded != fatSectorIndex) {FAT12_LoadFATSector(fatSectorIndex);}
    uint16_t fatData = 0;

    __FAT_CHECK_LOOP:
    if (fatIndex % 2 == 0)
        fatData = (*(uint16_t*)(g_FAT + fatIndex)) & 0x0FFF;
    else
        fatData = (*(uint16_t*)(g_FAT + fatIndex)) >> 4;
    if (fatData) {
        fatIndex++;
        goto __FAT_CHECK_LOOP;
    }
    
    return fatIndex * 2 / 3;
}


uint32_t FAT12_WriteGetAnotherCluster(uint32_t currentCluster) {

    uint32_t current_cluster_val = FAT12_NextCluster(currentCluster);

    // If the provided cluster already has a cluster that follows it, return that cluster
    if (current_cluster_val != 0 && current_cluster_val < 0xFF8) {
        return current_cluster_val;
    }

    // Otherwise, rewrite the FAT to make this cluster point to a free cluster

    // Find a new cluster to use, and write its number to this cluster's entry in the FAT
    uint32_t next_cluster = FAT12_FindFreeCluster(currentCluster);

    uint32_t fatIndex = currentCluster * 3 / 2;
    uint32_t fatSectorIndex = (fatIndex * 3)/(512*2); // Figure out which sector of the fat needs to be loaded
    if (g_FATLoaded != fatSectorIndex) {FAT12_LoadFATSector(fatSectorIndex);}
    uint16_t FAT_val = (*(uint16_t*)(g_FAT + fatIndex));


    if (currentCluster % 2 == 0)
        (*(uint16_t*)(g_FAT + fatIndex)) = (FAT_val & 0xF000) | (next_cluster & 0x0FFF);
    else
        (*(uint16_t*)(g_FAT + fatIndex)) = (FAT_val & 0x000F) | (next_cluster << 4);

    FAT12_WriteActiveFATSector(fatSectorIndex);
    return next_cluster;
}

void FAT12_WriteFinalCluster(uint32_t currentCluster) {
    
    uint32_t current_cluster_val = FAT12_NextCluster(currentCluster);
    if (current_cluster_val != 0 && current_cluster_val < 0xFF8) {
        // TODO: Set this cluster to 0xFF8, then follow through the rest of the clusters in the preexisting chain and set them all to 0
    }

    uint32_t fatIndex = currentCluster * 3 / 2;
    uint32_t fatSectorIndex = (fatIndex * 3)/(512*2); // Figure out which sector of the fat needs to be loaded
    if (g_FATLoaded != fatSectorIndex) {FAT12_LoadFATSector(fatSectorIndex);}
    uint16_t FAT_val = (*(uint16_t*)(g_FAT + fatIndex));

    if (currentCluster % 2 == 0)
        (*(uint16_t*)(g_FAT + fatIndex)) = (FAT_val & 0xF000) | (0xFF8 & 0x0FFF);
    else
        (*(uint16_t*)(g_FAT + fatIndex)) = (FAT_val & 0x000F) | (0xFF8 << 4);

    FAT12_WriteActiveFATSector(fatSectorIndex);
    printf("Final cluster signature written!\n");
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


uint32_t FAT12_Write(FAT12_File* file, uint32_t byte_count, void* src) {

    printf("Beginning write...\n");
    FAT12_FileData* fd = (file->Handle == ROOT_DIRECTORY_HANDLE) ? &g_FatData.RootDirectory : &(g_FatData.OpenedFiles[file->Handle]);
    uint8_t* data_in = src;

    printf("Checking for directory status...\n");
    // If writing a file, do not read source buffer past the end of the file
    if (!fd->Public.IsDirectory) {
        byte_count = MIN(byte_count, fd->Public.Size - fd->Public.Position);
    }

    printf("Beginning loop...\n");
    while (byte_count > 0) {
        uint32_t left_in_buffer = 512 - (fd->Public.Position % 512);
        uint32_t put = MIN(byte_count, left_in_buffer);

        printf("Copying write data to DMA-addressable sector...\n");
        memcpy(DISK_Floppy_GetSectorAddr(0) + (fd->Public.Position % 512), data_in, put);
        // Special handling of root directory
        printf("Calling floppy write handler...\n");
        if (fd->Public.Handle == ROOT_DIRECTORY_HANDLE) {
            DISK_Floppy_WriteSectorFrom(fd->CurrentCluster, 0);
        }
        else {
            DISK_Floppy_WriteSectorFrom(FAT12_Cluster2Sector(fd->CurrentCluster), 0);
        }

        data_in += put;
        fd->Public.Position += put;
        byte_count -= put;
        printf("Checking how much still needs written...\n");
        if ((left_in_buffer == put) && byte_count > 0) {
            printf("Getting another cluster to write to...\n");
            // Special handling for root directory
            if (fd->Public.Handle == ROOT_DIRECTORY_HANDLE) {
                FAT12_WriteGetAnotherCluster(fd->CurrentCluster);
                fd->CurrentCluster++;
            }
            // Handling for all other entries
            else {
                uint32_t new_cluster = FAT12_NextCluster(fd->CurrentCluster);
                if (new_cluster == 0 || new_cluster >= 0xFF8) {
                    fd->CurrentCluster = FAT12_WriteGetAnotherCluster(fd->CurrentCluster);
                }
                else {
                    fd->CurrentCluster = new_cluster;
                }
                
                //printf("New cluster: 0x%x\n", fd->CurrentCluster);
            }
        }
    }
    printf("Writing closing signature to final cluster in chain...\n");
    FAT12_WriteFinalCluster(fd->CurrentCluster);
    printf("Write complete!\n");
    return (uint32_t)data_in - (uint32_t)src;
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
        /*
        printf("Checking entry ");
        for (int i=0; i<11; i++) {printf("%c", entry.Name[i]);}
        printf("\n");
        */
        if (memcmp(fat_name, entry.Name, 11) == 0) {
            *entryOut = entry;
            return true;
        }
    }

    return false;
}

FAT12_File* FAT12_Open(const char* path) {

    char name[MAX_FAT12_PATH_SIZE];
    memset(name, '\0', MAX_FAT12_PATH_SIZE);

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
            printf("FAT12: %s not found\n", name);
            return NULL;
        }
    }
    return current;
}


// Steps for fat12 write operation for a new file:
// 1. Open up the data sector for the immediate parent directory of the file
// 2. Determine how many clusters will be needed for the file.
// 3. Find a starting cluster. Write its index into the directory data and write that sector back to the disk.
// 4. Perform the following iteratively:
//    i. Write the first 512 bytes of the source data to the found cluster from the fat.
//    ii. If more data remains, find a new cluster from the FAT, put that cluster index into the FAT entry for the first cluster, and write the sector to disk
// 5. When all data has been written, write the 0xFF8 signature to the found cluster's entry in the FAT and write the sector to disk.
uint32_t FAT12_Write_New(char* path, uint32_t byte_count, void* src) {
    
    char *parent_dir_path, *file_name, *final_slash_pos = (char*)0xFFFFFFFF;
    char* c = path;
    uint8_t DirectoryBuffer[512];
    //printf("Parsing names from path...\n");
    while (*c) {
        if (*c == '/') {final_slash_pos = c;}
        c++;
    }

    if (final_slash_pos == (char*)0xFFFFFFFF) {
        return -1; // Error, no slash found so invalid path (all paths should be absolute and from root so should have at least a leading slash)
    }

    //printf("Opening parent dir...\n");
    *final_slash_pos = '\0';
    parent_dir_path = path; file_name = final_slash_pos + 1;
    FAT12_File*  parent_dir = FAT12_Open(parent_dir_path);
    //printf("Parent dir: %s  |  File name: %s\n", parent_dir_path, file_name);


    // Read directory information into memory
    // TODO: Include support for directories where size is greater than / equal to 512 bytes
    //printf("Reading directory info...\n");
    uint32_t bytes_read = FAT12_Read(parent_dir, 512, DirectoryBuffer);
    FAT12_DirectoryEntry* DirectoryEntries = (FAT12_DirectoryEntry*)DirectoryBuffer;
    uint32_t offset = 0;
    for (int i=0; i<16; i++) {
        if (DirectoryEntries[i].Name[0] == '\0') {
            offset = i * sizeof(FAT12_DirectoryEntry);
            break;
        }
    }

    printf("Directory bytes: %d  |  Directory entries: %d\n", offset, offset/sizeof(FAT12_DirectoryEntry));
    // Set up a pointer to write information for new file entry
    FAT12_DirectoryEntry* NewFileEntry = (FAT12_DirectoryEntry*)(&DirectoryBuffer[offset]);

    // Parse the file name from the path to 8.3 format for the FAT12 Entry
    //FAT12_PathName2FATName(NewFileEntry->Name, file_name);
    for (int i = 0; i<11; i++) {NewFileEntry->Name[i] = ' ';}
    int src_idx = 0;
    for (int i = 0; i<8; i++) {
        if (file_name[src_idx] != '.') {
            NewFileEntry->Name[i] = toupper(file_name[src_idx]);
            src_idx++;
        }
        else {
            NewFileEntry->Name[i] = ' ';
        }
    }
    src_idx++;
    for (int i = 8; i < 11; i++) {
        if (file_name[src_idx] != '\0') {
            NewFileEntry->Name[i] = toupper(file_name[src_idx]);
            src_idx++;
        }
        else {
            NewFileEntry->Name[i] = ' ';
        }
    }
    //for (int i = 0; i<11; i++) {printf("%c", NewFileEntry->Name[i]);}

    //printf("Finding a good cluster to write to...\n");

    // Find a free cluster and save its index to the file entry
    uint32_t first_free_cluster = FAT12_FindFreeCluster(0);
    NewFileEntry->FirstClusterHigh = first_free_cluster >> 16;
    NewFileEntry->FirstClusterLow = first_free_cluster & 0xFFFF;
    NewFileEntry->Attributes = 0;
    NewFileEntry->Size = byte_count;

    // All file entry data is now recorded, we can safely rewrite the directory data to the disk
    //printf("Writing directory information back to disk...\n");
    // Close and reopen file to reset position data for reading/writing
    FAT12_Close(parent_dir);
    parent_dir = FAT12_Open(parent_dir_path);
    FAT12_Write(parent_dir, 512, DirectoryBuffer);
    FAT12_Close(parent_dir);

    // Lastly, write actual file data into the file that is now pointed to in the directory
    *final_slash_pos = '/';
    printf("Opening file %s...\n", path);
    FAT12_File* file = FAT12_Open(path);
    printf("File value: 0x%x\n", file);
    printf("Writing file contents...\n");
    FAT12_Write(file, byte_count, src);
    FAT12_Close(file);

    return 0;
}