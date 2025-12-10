#include <stdint.h>

#ifndef GDT_H
#define GDT_H

#define i686_GDT_CODE_SEGMENT 0x08
#define i686_GDT_DATA_SEGMENT 0x10
#define i686_GDT_TSS_SEGMENT 0x28

typedef struct
{
    uint16_t LINK;                  
    uint16_t LINK_RESERVED;
    uint32_t ESP0;
    uint16_t SS0;
    uint16_t SS0_RESERVED;
    uint32_t ESP1;
    uint16_t SS1;
    uint16_t SS1_RESERVED;
    uint32_t ESP2;
    uint16_t SS2;
    uint16_t SS2_RESERVED;

    uint32_t CR3; uint32_t EIP; uint32_t EFLAGS;
    uint32_t EAX; uint32_t ECX; uint32_t EDX; uint32_t EBX;
    uint32_t ESP; uint32_t EBP; uint32_t ESI; uint32_t EDI;

    uint16_t ES; uint16_t ES_RESERVED; uint16_t CS; uint16_t CS_RESERVED;
    uint16_t SS; uint16_t SS_RESERVED; uint16_t DS; uint16_t DS_RESERVED;
    uint16_t FS; uint16_t FS_RESERVED; uint16_t GS; uint16_t GS_RESERVED;
    uint16_t LDTR; uint16_t LDTR_RESERVED;

    uint16_t IOPB_RESERVED; uint16_t IOPB;

    uint32_t SSP;

} __attribute__((packed)) TSSEntry;


TSSEntry* GDT_GetTSS();

void i686_GDT_Initialize();
void i686_SetInterruptStack(void* address);

#endif