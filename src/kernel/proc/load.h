
#ifndef LOAD_H
#define LOAD_H

#include <stdint.h>
#include <proc/proc.h>

typedef enum {
    EXECUTABLE = 0x1,
    WRITEABLE   = 0x2,
    READABLE   = 0x4,
} ProgramHeaderFlags;

typedef struct {
    uint32_t segment_type;
    uint32_t p_offset;
    uint32_t p_vaddr;
    uint32_t p_paddr;
    uint32_t p_filesz;
    uint32_t p_memsz;
    uint32_t flags;
    uint32_t alignment;
} __attribute__((packed)) ProgramHeader;

int LoadProc(const char* path, ProcessControlBlock* proc);

#endif