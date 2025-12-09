OUTPUT_FORMAT(elf32-i386)
OUTPUT_ARCH(i386)

ENTRY(_start)

MEMORY
{
    reserved (rwx) : ORIGIN = 0x00000000, LENGTH = 0x200000
    ram      (rwx) : ORIGIN = 0x200000,   LENGTH = 0x8000000  /* or whatever is available */
}

SECTIONS
{
    /* Place all your kernel code/data into "ram" */
    . = ORIGIN(ram);

    .text : ALIGN(4) {
        _text = .;
        *(.text*)
        *(.rodata*)
        _text_end = .;

    } > ram

    .data : ALIGN(4) {
        _data = .;
        *(.data*)
        _data_end = .;
    } > ram

    .bss : {
        _bss = .;
        *(.bss*)
        *(COMMON)
        _bss_end = .;
    } > ram
}