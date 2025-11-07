
#ifndef FAT12_H
#define FAT12_H

/*
    **** IMPORTANT DISCLAIMER ***

    This is NOT a complete FAT12 driver. It does not support drives where the
    sector size is not 512 bytes, or where there are multiple sectors per cluster.
    It is only intended for operating on the floppy disk which stores the OS.
    
*/

#include <stdint.h>
#include <stdbool.h>

#define MAX_FILE_HANDLES 10

#pragma pack(push, 1)
typedef struct 
{
    uint8_t Name[11];
    uint8_t Attributes;
    uint8_t _Reserved;
    uint8_t CreatedTimeTenths;
    uint16_t CreatedTime;
    uint16_t CreatedDate;
    uint16_t AccessedDate;
    uint16_t FirstClusterHigh;
    uint16_t ModifiedTime;
    uint16_t ModifiedDate;
    uint16_t FirstClusterLow;
    uint32_t Size;
} FAT12_DirectoryEntry;
#pragma pack(pop)

typedef struct
{
    int Handle;
    bool IsDirectory;
    uint32_t Position;
    uint32_t Size;
} FAT12_File;

enum FAT12_Attributes
{
    FAT12_ATTRIBUTE_READ_ONLY     = 0x01,
    FAT12_ATTRIBUTE_HIDDEN        = 0x02,
    FAT12_ATTRIBUTE_SYSTEM        = 0x04,
    FAT12_ATTRIBUTE_VOLUME_ID     = 0x08,
    FAT12_ATTRIBUTE_DIRECTORY     = 0x10,
    FAT12_ATTRIBUTE_ARCHIVE       = 0x20,
    FAT12_ATTRIBUTE_LFN = FAT12_ATTRIBUTE_READ_ONLY | FAT12_ATTRIBUTE_HIDDEN | FAT12_ATTRIBUTE_SYSTEM | FAT12_ATTRIBUTE_VOLUME_ID | FAT12_ATTRIBUTE_DIRECTORY | FAT12_ATTRIBUTE_ARCHIVE
};


#pragma pack(push, 1)

typedef struct 
{
    uint8_t BootJumpInstruction[3];
    uint8_t OemIdentifier[8];
    uint16_t BytesPerSector;
    uint8_t SectorsPerCluster;
    uint16_t ReservedSectors;
    uint8_t FatCount;
    uint16_t DirEntryCount;
    uint16_t TotalSectors;
    uint8_t MediaDescriptorType;
    uint16_t SectorsPerFat;
    uint16_t SectorsPerTrack;
    uint16_t Heads;
    uint32_t HiddenSectors;
    uint32_t LargeSectorCount;

    // extended boot record
    uint8_t DriveNumber;
    uint8_t _Reserved;
    uint8_t Signature;
    uint32_t VolumeId;          // serial number, value doesn't matter
    uint8_t VolumeLabel[11];    // 11 bytes, padded with spaces
    uint8_t SystemId[8];

} FAT12_BootSector;
#pragma pack(pop)

typedef struct
{
    FAT12_File Public;
    bool Opened;
    uint32_t FirstCluster;
    uint32_t CurrentCluster;
    uint32_t CurrentSectorInCluster;

} FAT12_FileData;

typedef struct
{
    union
    {
        FAT12_BootSector BootSector;
        uint8_t BootSectorBytes[512];
    } BS;

    FAT12_FileData RootDirectory;

    FAT12_FileData OpenedFiles[MAX_FILE_HANDLES];

} FAT12_Data;


void FAT12_Initialize();

FAT12_File* FAT12_Open(const char* path);
uint32_t FAT12_Read(FAT12_File* file, uint32_t byte_count, void* dest);
bool FAT12_ReadEntry(FAT12_File* file, FAT12_DirectoryEntry* entry);
void FAT12_Close(FAT12_File* file);

#endif