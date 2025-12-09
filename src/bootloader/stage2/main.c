#include "stdint.h"
#include "stdio.h"
#include "disk.h"
#include "fat.h"

void _cdecl cstart_(uint16_t bootDrive, void far* kernel_address)
{
    DISK disk;
    if (!DISK_Initialize(&disk, bootDrive))
    {
        printf("MAIN: disk init error!\r\n");
        goto end;
    }

    if (!FAT_Initialize(&disk))
    {
        printf("MAIN: fat init error!\r\n");
        goto end;
    }

    // browse files in root
    FAT_File far* fd = FAT_Open(&disk, "/");
    FAT_DirectoryEntry entry;
    int i = 0;
    while (FAT_ReadEntry(&disk, fd, &entry) && i++<5)
    {
        printf("  ");
        for (int i=0; i<11; i++){putc(entry.Name[i]);}
        printf("\r\n");
    }
    FAT_Close(fd);

    // /*
    // Load kernel into memory
    #define max_kernel_sz 0x10000
    fd = FAT_Open(&disk, "/boot/kernel.bin");
    uint32_t read = FAT_Read(&disk, fd, max_kernel_sz, kernel_address);
    FAT_Close(fd);

    printf("End of file read! Read %d bytes of kernel.bin into memory!\n\r", read);

    // */

end:
    return;
}
