ASM=nasm
CC=gcc
CC16=/usr/bin/watcom/binl/wcc
LD16=/usr/bin/watcom/binl/wlink

SRC_DIR=src
BUILD_DIR=build
EXPORT_DIR=/media/sf_VM_Sharing

CROSS_SRC_DIR=cross_src
CROSS_BUILD_DIR=cross_build
CROSS_LIB_DIR=cross_lib
CROSS_BIN_DIR=cross_bin

CROSS_SOURCES_C=$(wildcard $(CROSS_SRC_DIR)/*.c) $(wildcard $(CROSS_SRC_DIR)/*/*.c) $(wildcard $(CROSS_SRC_DIR)/*/*/*.c)
CROSS_SOURCES_S=$(wildcard $(CROSS_SRC_DIR)/*.s) $(wildcard $(CROSS_SRC_DIR)/*/*.s) $(wildcard $(CROSS_SRC_DIR)/*/*/*.s)
CROSS_LIB_SOURCES_C=$(wildcard $(CROSS_LIB_DIR)/*.c) $(wildcard $(CROSS_LIB_DIR)/*/*.c) $(wildcard $(CROSS_LIB_DIR)/*/*/*.c)
CROSS_LIB_SOURCES_S=$(wildcard $(CROSS_LIB_DIR)/*.s) $(wildcard $(CROSS_LIB_DIR)/*/*.s) $(wildcard $(CROSS_LIB_DIR)/*/*/*.s)
CROSS_OBJECTS_C=$(patsubst %.c, $(CROSS_BUILD_DIR)/$(notdir %), $(CROSS_SOURCES_C))
CROSS_OBJECTS_S=$(patsubst %.s, $(CROSS_BUILD_DIR)/$(notdir %), $(CROSS_SOURCES_S))
CROSS_LIB_OBJECTS_C=$(patsubst %.c, $(CROSS_BIN_DIR)/%.o, $(CROSS_LIB_SOURCES_C))
CROSS_LIB_OBJECTS_S=$(patsubst %.s, $(CROSS_BIN_DIR)/%.o, $(CROSS_LIB_SOURCES_S))

.PHONY: all floppy_image kernel bootloader clean always run run_debug 

#
# Floppy Disk Image
#
floppy_image: $(BUILD_DIR)/main_floppy.img

$(BUILD_DIR)/main_floppy.img: bootloader kernel
	dd if=/dev/zero of=$(BUILD_DIR)/main_floppy.img bs=512 count=2880
	mkfs.fat -F 12 -n "SOLOS" $(BUILD_DIR)/main_floppy.img
	dd if=$(BUILD_DIR)/stage1.bin of=$(BUILD_DIR)/main_floppy.img conv=notrunc
	mcopy -i $(BUILD_DIR)/main_floppy.img $(BUILD_DIR)/stage2.bin "::stage2.bin"
	mcopy -i $(BUILD_DIR)/main_floppy.img $(BUILD_DIR)/kernel.bin "::kernel.bin"
	mcopy -i $(BUILD_DIR)/main_floppy.img test.txt "::test.txt"
	mmd -i $(BUILD_DIR)/main_floppy.img "::mydir"
	mmd -i $(BUILD_DIR)/main_floppy.img "::mydir/secdir"
	mcopy -i $(BUILD_DIR)/main_floppy.img bigtext.txt "::mydir/secdir/test.txt"
	cp $(BUILD_DIR)/main_floppy.img $(EXPORT_DIR)
    
	

#
# Bootloader
#

bootloader: stage1 stage2


stage1: $(BUILD_DIR)/stage1.bin

$(BUILD_DIR)/stage1.bin: always
	$(MAKE) -C $(SRC_DIR)/bootloader/stage1 BUILD_DIR=$(abspath $(BUILD_DIR))


stage2: $(BUILD_DIR)/stage2.bin

$(BUILD_DIR)/stage2.bin: always
	$(MAKE) -C $(SRC_DIR)/bootloader/stage2 BUILD_DIR=$(abspath $(BUILD_DIR))



#
# Kernel
#
kernel: $(BUILD_DIR)/kernel.bin

$(BUILD_DIR)/kernel.bin: always
	$(MAKE) -C $(SRC_DIR)/kernel BUILD_DIR=$(abspath $(BUILD_DIR))



#
# Cross-Compiled executables
#
cross: $(CROSS_LIB_OBJECTS_C) $(CROSS_LIB_OBJECTS_S) $(CROSS_OBJECTS_C) $(CROSS_OBJECTS_S)
	mmd -i $(BUILD_DIR)/main_floppy.img "::cross"
	mcopy -i $(BUILD_DIR)/main_floppy.img cross_build/cross_src/helloworld "::cross/hello"

$(CROSS_BUILD_DIR)/%: %.c always
	@mkdir -p $(@D)
	i686-elf-gcc -m32 -nostdlib -nostartfiles -static -std=gnu99 -ffreestanding -I$(CROSS_LIB_DIR) -L$(CROSS_BIN_DIR)/$(CROSS_LIB_DIR) -o $@ cross_bin/cross_lib/stdio.o -emain $<

$(CROSS_BUILD_DIR)/%: %.s always
	@mkdir -p $(@D)
	i686-elf-as --32 -msyntax=intel -o $@ $<

$(CROSS_BIN_DIR)/%.o: %.c always
	@mkdir -p $(@D)
	i686-elf-gcc -m32 -nostdlib -nostartfiles -static -std=gnu99 -ffreestanding -I$(CROSS_LIB_DIR) -o -c $@ $<

$(CROSS_BIN_DIR)/%.o: %.s always
	@mkdir -p $(@D)
	i686-elf-as --32 -msyntax=intel -o $@ -c $<


#
# Always
#
always:
	mkdir -p $(BUILD_DIR)

#
# Clean
#
clean:
	$(MAKE) -C $(SRC_DIR)/bootloader/stage1 BUILD_DIR=$(abspath $(BUILD_DIR)) clean
	$(MAKE) -C $(SRC_DIR)/bootloader/stage2 BUILD_DIR=$(abspath $(BUILD_DIR)) clean
	$(MAKE) -C $(SRC_DIR)/kernel BUILD_DIR=$(abspath $(BUILD_DIR)) clean
	rm -rf $(BUILD_DIR)/*

#
# Run
#
run_debug: clean floppy_image
	qemu-system-i386 -d int -no-shutdown -no-reboot -monitor stdio -drive file=$(BUILD_DIR)/main_floppy.img,format=raw,index=0,if=floppy

run: floppy_image cross
	sudo nice -n -20 qemu-system-i386 -m 2G -no-shutdown -no-reboot -drive file=$(BUILD_DIR)/main_floppy.img,format=raw,index=0,if=floppy

run64: floppy_image
	qemu-system-x86_64 -no-shutdown -no-reboot -drive file=$(BUILD_DIR)/main_floppy.img,format=raw,index=0,if=floppy