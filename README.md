# From-Scratch Operating System

## Requirements
To run, you'll need to either a) burn the OS image located at build/main_floppy.img onto a floppy disk and boot from that (not recommended) or b) Use Qemu's
builtin i386 simulator (qemu-system-i386) to emulate the image. To build the OS yourself, you'll need OpenWatcom, a GCC cross-compiler, and NASM 
(installation instructions can be found on the osdev wiki).
## Quickstart
To run the existing image without building, you can navigate to the project directory and run:

```qemu-system-i386 -m 512M -no-shutdown -no-reboot -drive file=$(BUILD_DIR)/main_floppy.img,format=raw,index=0,if=floppy```

This project was inspired by the Nanobyte OS video tutorial available on Youtube.


Notes for future changes:

Physical Memory Allocation via bitmap with Available Spots Optimization
Explanation: Initialize an array of N wedges, where each wedge contains a pointer to some block index, and a number representing
the total number of free blocks prior to that index. Have each wedge start at index 0 and count 0. When allocating a block or number
of blocks, begin wedge-checking at wedge n=0. Wedge-checking goes as follows:
 - If there are not enough total free blocks prior to wedge n,  begin first fit search at the index in wedge n, and when completed, 
 update all wedges prior to and including wedge n to point to the end of the found block (as appropriate; some wedges may not need pushing)
 - If there are enough total free blocks, restart wedge check at wedge n+1.
When freeing a region of blocks, update the "total free blocks" field of all wedges after the end of that region. If any
wedges align to the end of that region, relocate them to the beginning of that region.


Virtual Memory Management: For now, let's have an identity mapping for everything up to address 0x100000 (the first megabyte), and two additional mappings: one for the page directory, so the kernel can always access it, and one for an active page table, which can be modified to point to any page table that the kernel may need to access. That way, when an interrupt occurs, there's no inherent need to reset the kernel pages in order to run the interrupt handler. When I write the loader, I'll have it start all code at 0x102000, so user-space programs will be able to access the (virtual) address range 0x00102000 - 0xFFFFFFFF.

