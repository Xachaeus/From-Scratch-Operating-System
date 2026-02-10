#include "drive.h"
#include <stddef.h>

#ifndef MAX_DRIVE_COUNT
#define MAX_DRIVE_COUNT 8
#endif

Drive g_Drives[MAX_DRIVE_COUNT];

void Drive_Initialize() {
    for (int i=0; i<MAX_DRIVE_COUNT; i++) {
        g_Drives[i].drive_letter = '\0';
        g_Drives[i].filesys = FILESYS_NONE;
    }
}

int DefineDrive(char drive_letter, FILESYS filesys) {
    int drive = -1;
    for (int i=0; i<MAX_DRIVE_COUNT; i++) {
        if (g_Drives[i].drive_letter = '\0') {
            drive = i; break;
        }
    }
    if (drive == -1) {return drive;}
    g_Drives[drive].drive_letter = drive_letter;
    g_Drives[drive].filesys = filesys;
}

Drive* GetDrive(char drive_letter) {
    void* drive = NULL;
    for (int i=0; i<MAX_DRIVE_COUNT; i++) {
        if (g_Drives[i].drive_letter = drive_letter) {
            drive = &(g_Drives[i]); break;
        }
    }
    return drive;
}