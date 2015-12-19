C_COMPILER=arm-none-eabi-gcc
CXX_COMPILER=arm-none-eabi-g++
OBJCOPY=arm-none-eabi-objcopy

BOOT_S="src/boot.S"
BOOT_O="boot.o"

KERNEL_C="src/kernel.c"
KERNEL_O="kernel.o"

LINKER_LD="src/linker.ld"

PICOS_ELF="picos.elf"

PICOS_BIN="picos.bin"

default: build

build:
	@${C_COMPILER} -mcpu=arm1176jzf-s -fpic -ffreestanding -c ${BOOT_S} -o ${BOOT_O}
	@echo "Compiled BOOT_S"
	@${C_COMPILER} -mcpu=arm1176jzf-s -fpic -ffreestanding -std=gnu99 -c ${KERNEL_C} -o ${KERNEL_O} -O2 -Wall -Wextra
	@echo "Compiled KERNEL_C"
	@${C_COMPILER} -T ${LINKER_LD} -o ${PICOS_ELF} -ffreestanding -O2 -nostdlib ${BOOT_O} ${KERNEL_O}
	@${OBJCOPY} ${PICOS_ELF} -O binary ${PICOS_BIN}
	@echo "Compiled KERNEL_C"
