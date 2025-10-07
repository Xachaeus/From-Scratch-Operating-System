BUILD_DIR?=build/
ASM=i686-elf-as
CC=i686-elf-gcc
LD=i686-elf-ld
CFLAGS=-m32 -nostdlib -nostartfiles -static -std=gnu99 -ffreestanding -I.
ASMFLAGS=--32 -msyntax=intel
LDFLAGS=-T linker.ld --oformat=binary -nostdlib -Map output.map

LINKER_LIB_PATHS=-L/home/zack/opt/cross/lib/gcc/i686-elf/12.1.0/
LINKER_LIBS=-lgcc

#SOURCES_C=$(shell find . -name "*.c")
#SOURCES_S=$(shell find . -name "*.s")
SOURCES_C=$(wildcard *.c) $(wildcard */*.c) $(wildcard */*/*.c)
SOURCES_S=$(wildcard *.s) $(wildcard */*.s) $(wildcard */*/*.s)
OBJECTS_C=$(patsubst %.c, $(BUILD_DIR)/kernel/c/%.o, $(SOURCES_C))
OBJECTS_S=$(patsubst %.s, $(BUILD_DIR)/kernel/s/%.o, $(SOURCES_S))
# OBJECTS_C=$(subst ., $(BUILD_DIR)/kernel/c, $(SOURCES_C:.c=.o))
# OBJECTS_S=$(subst ., $(BUILD_DIR)/kernel/s, $(SOURCES_S:.c=.o))

.PHONY: all always kernel clean

all: kernel

kernel: $(BUILD_DIR)/kernel.bin

$(BUILD_DIR)/kernel.bin: $(OBJECTS_C) $(OBJECTS_S)
	$(LD) ${LDFLAGS} -o $(BUILD_DIR)/kernel.bin ${OBJECTS_S} ${OBJECTS_C} ${LINKER_LIB_PATHS} ${LINKER_LIBS}


$(BUILD_DIR)/kernel/c/%.o: %.c always
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) -o $@ -c $<

$(BUILD_DIR)/kernel/s/%.o: %.s always
	@mkdir -p $(@D)
	$(ASM) $(ASMFLAGS) -o $@ -c $<



always:
	mkdir -p $(BUILD_DIR)/kernel/c
	mkdir -p $(BUILD_DIR)/kernel/s

clean:
	rm -f $(BUILD_DIR)/kernel.bin