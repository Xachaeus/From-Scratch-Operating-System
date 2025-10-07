
ENTRY(kernel_start)

MEMORY
{
    RAM (rwx) : ORIGIN = 0x30000, LENGTH = 0x50000
}

SECTIONS
{

    . = 0x30000;
    .text  :  
    {
        *(.text)
    } > RAM


    .rodata  : 
    {
        *(.rodata)
    } > RAM


    .data  :  {
        *(.data)
    } > RAM


    .bss  :  {
        *(COMMON)
        *(.bss)
    } > RAM
}