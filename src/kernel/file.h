/*
  Zachariah Sollenberger, 2026

    The "file" submodule is responsible for abstracting away any references
  to the specific disk that a file may exist on, or what file system that disk
  is formatted with. It does this by creating a universal wrapper over all of
  the objects/formats implemented in the filesys and disk modules. It includes
  an initialization function to be called by the kernel on startup, a set_active
  function to simplify system calls for whatever process is currently running,
  and the four basic file operations: open, read, write, and close.
    The file descriptor object here only stores enough information to adequately
  wrap the versions of these file operations that are implemented for each filesystem
  individually. Namely, this is simply an integer handle that can be used by the file
  operation wrappers defined here, an enum to specify what the underlying filesystem 
  for the given file is, and a void pointer to the data structure that the underlying
  filesystem actually needs to perform the file operation.
*/


#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include <filesys/drive.h>
#include <proc/proc.h>

#ifndef FILE_H
#define FILE_H

#ifndef FILESYS_COUNT
#define FILESYS_COUNT 5
#endif

typedef struct {
    int handle;
    void* mapped_handle;
    FILESYS filesys;
} File;


void File_Initialize();
void SetActiveFileDescriptors(FileDescriptor* fd);

int open(const char* path);
int read(int file, uint32_t byte_count, void* dest);
int write(int file, uint32_t byte_count, void* src);
void close(int file);

#endif