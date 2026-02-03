#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include <filesys/drive.h>

#ifndef FILE_H
#define FILE_H

#define FILESYS_COUNT 5

typedef struct {
    int handle;
    void* mapped_handle;
    FILESYS filesys;
} File;


void File_Initialize();

int open(const char* path);
int read(int file, uint32_t byte_count, void* dest);
int write(int file, uint32_t byte_count, void* src);
void close(int file);

#endif