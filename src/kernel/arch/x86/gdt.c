
#include <stdio.h>
#include <stdint.h>
#include "gdt.h"


typedef struct
{
    uint16_t LimitLow;                  // limit (bits 0-15)
    uint16_t BaseLow;                   // base (bits 0-15)
    uint8_t BaseMiddle;                 // base (bits 16-23)
    uint8_t Access;                     // access
    uint8_t FlagsLimitHi;               // limit (bits 16-19) | flags
    uint8_t BaseHigh;                   // base (bits 24-31)
} __attribute__((packed)) GDTEntry;


typedef struct {
    GDTEntry Descriptors[5];
    TSSEntry TSS;
} __attribute__((packed)) GDT;


typedef struct
{
    uint16_t Limit;                     // sizeof(gdt) - 1
    GDTEntry* Ptr;                      // address of GDT
} __attribute__((packed)) GDTDescriptor;

typedef enum
{
    GDT_ACCESS_CODE_READABLE                = 0x02,
    GDT_ACCESS_DATA_WRITEABLE               = 0x02,

    GDT_ACCESS_CODE_CONFORMING              = 0x04,
    GDT_ACCESS_DATA_DIRECTION_NORMAL        = 0x00,
    GDT_ACCESS_DATA_DIRECTION_DOWN          = 0x04,

    GDT_ACCESS_DATA_SEGMENT                 = 0x10,
    GDT_ACCESS_CODE_SEGMENT                 = 0x18,

    GDT_ACCESS_DESCRIPTOR_TSS               = 0x00,

    GDT_ACCESS_RING0                        = 0x00,
    GDT_ACCESS_RING1                        = 0x20,
    GDT_ACCESS_RING2                        = 0x40,
    GDT_ACCESS_RING3                        = 0x60,

    GDT_ACCESS_PRESENT                      = 0x80,

} GDT_ACCESS;

typedef enum 
{
    GDT_FLAG_64BIT                          = 0x20,
    GDT_FLAG_32BIT                          = 0x40,
    GDT_FLAG_16BIT                          = 0x00,

    GDT_FLAG_GRANULARITY_1B                 = 0x00,
    GDT_FLAG_GRANULARITY_4K                 = 0x80,
} GDT_FLAGS;

// Helper macros
#define GDT_LIMIT_LOW(limit)                (limit & 0xFFFF)
#define GDT_BASE_LOW(base)                  (base & 0xFFFF)
#define GDT_BASE_MIDDLE(base)               ((base >> 16) & 0xFF)
#define GDT_FLAGS_LIMIT_HI(limit, flags)    (((limit >> 16) & 0xF) | (flags & 0xF0))
#define GDT_BASE_HIGH(base)                 ((base >> 24) & 0xFF)

#define GDT_ENTRY(base, limit, access, flags) {                     \
    GDT_LIMIT_LOW(limit),                                           \
    GDT_BASE_LOW(base),                                             \
    GDT_BASE_MIDDLE(base),                                          \
    access,                                                         \
    GDT_FLAGS_LIMIT_HI(limit, flags),                               \
    GDT_BASE_HIGH(base)                                             \
}



TSSEntry g_TSS;

GDTEntry g_GDT[] = {
    // NULL descriptor
    GDT_ENTRY(0, 0, 0, 0),

    // Kernel 32-bit code segment (0x8)
    GDT_ENTRY(0,
              0xFFFFF,
              GDT_ACCESS_PRESENT | GDT_ACCESS_RING0 | GDT_ACCESS_CODE_SEGMENT | GDT_ACCESS_CODE_READABLE,
              GDT_FLAG_32BIT | GDT_FLAG_GRANULARITY_4K),

    // Kernel 32-bit data segment (0x10)
    GDT_ENTRY(0,
              0xFFFFF,
              GDT_ACCESS_PRESENT | GDT_ACCESS_RING0 | GDT_ACCESS_DATA_SEGMENT | GDT_ACCESS_DATA_WRITEABLE,
              GDT_FLAG_32BIT | GDT_FLAG_GRANULARITY_4K),
    
    // User 32-bit code segment (0x18)
    GDT_ENTRY(0,
              0xFFFFF,
              GDT_ACCESS_PRESENT | GDT_ACCESS_RING3 | GDT_ACCESS_CODE_SEGMENT | GDT_ACCESS_CODE_READABLE,
              GDT_FLAG_32BIT | GDT_FLAG_GRANULARITY_4K),

    // User 32-bit data segment (0x20)
    GDT_ENTRY(0,
              0xFFFFF,
              GDT_ACCESS_PRESENT | GDT_ACCESS_RING3 | GDT_ACCESS_DATA_SEGMENT | GDT_ACCESS_DATA_WRITEABLE,
              GDT_FLAG_32BIT | GDT_FLAG_GRANULARITY_4K),

    // Task State Segment (0x28)
    GDT_ENTRY(0,
              0,
              0,
              0),
};



GDTDescriptor g_GDT_Descriptor = { sizeof(g_GDT) - 1, (GDTEntry*)&g_GDT};

void __attribute__((cdecl)) i686_GDT_Load(GDTDescriptor* descriptor, uint16_t codeSegment, uint16_t dataSegment);
void __attribute__((cdecl)) i686_TSS_Load(uint16_t TSS_Segment);



TSSEntry* GDT_GetTSS() {
    return &g_TSS;
}

void i686_GDT_Initialize()
{
    // Fill in information for TSS entry in GDT
    g_GDT[5].BaseLow = (uint16_t)GDT_BASE_LOW((uint32_t)(&g_TSS));
    g_GDT[5].BaseMiddle = (uint16_t)GDT_BASE_MIDDLE((uint32_t)(&g_TSS));
    g_GDT[5].BaseHigh = (uint16_t)GDT_BASE_HIGH((uint32_t)(&g_TSS));
    g_GDT[5].LimitLow = (uint16_t)GDT_LIMIT_LOW((uint16_t)(sizeof(TSSEntry)));
    g_GDT[5].FlagsLimitHi = (uint16_t)GDT_FLAGS_LIMIT_HI((uint16_t)(sizeof(TSSEntry)), (uint16_t)(0x40));
    g_GDT[5].Access = (uint8_t)(0x89);

    // Fill TSS with information necessary for interrupt handling
    g_TSS.SS0 = 0x10; // Kernel Data Segment
    g_TSS.ESP0 = 0x10000; // TODO: Address much higher in the kernel's current stack; potential for collision, but will tackle later with a more elegant solution
    g_TSS.IOPB = 104; // Size of TSS

    i686_GDT_Load(&g_GDT_Descriptor, i686_GDT_CODE_SEGMENT, i686_GDT_DATA_SEGMENT);
    i686_TSS_Load(i686_GDT_TSS_SEGMENT);
}


void i686_SetInterruptStack(void* address) {
    g_TSS.ESP0 = (uint32_t)address;
}
