#include <stdint.h>
#ifndef DRIVE_H
#define DRIVE_H

typedef enum {
    FILESYS_NONE  = 0,
    FILESYS_FAT12 = 1,
    FILESYS_FAT16 = 2,
    FILESYS_FAT32 = 3,
    FILESYS_exFAT = 4,
    FILESYS_ext4  = 5
} FILESYS;


typedef struct {
    char drive_letter;
    FILESYS filesys;
} Drive;

void Drive_Initialize();

int DefineDrive(char drive_letter, FILESYS filesys);
Drive* GetDrive(char drive_letter);

#endif