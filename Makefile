# $@ = target file
# $< = first dependency
# $^ = all dependencies
C_SOURCES = $(wildcard kernel/*.c drivers/*.c cpu/*.c)
HEADERS = $(wildcard kernel/*.h drivers/*.h cpu/*.h)

OBJ = ${C_SOURCES:.c=.o cpu/interrupt.o}

CC = /usr/bin/gcc
GDB = /usr/bin/gdb
CFLAGS = -g


os-image.bin: boot/bootsect.bin kernel.bin
	cat $^ > $@
	#cat bootsect.bin kernel.bin > os-image.bin

kernel.bin: boot/kernel_entry.o ${OBJ}
	ld -m elf_i386 -o $@ -Ttext 0x1000 $^ --oformat binary
	#ld -m elf_i386 -o kernel.bin -Ttext 0x1000 kernel_entry.o kernel.o --oformat binary

kernel.elf: boot/kernel_entry.o ${OBJ}
	ld -m elf_i386 -o $@ -Ttext 0x1000 $^
	#ld -m elf_i386 -o kernel.bin -Ttext 0x1000 kernel_entry.o kernel.o

run: os-image.bin
	qemu-system-i386 -drive file=$<,format=raw
	#qemu-system-x86_64 -fda $<
	#qemu-system-x86_64 os-image.bin

debug: os-image.bin kernel.elf
	qemu-system-i386 -s os-image.bin &
	${GDB} -ex "target remote localhost:1234" -ex "symbol-file kernel.elf"

%.o: %.c ${HEADERS}
	${CC} -m32 ${CFLAGS} -ffreestanding -fno-pie -c $< -o $@
	#gcc -ffreestanding -kernel kernel.kernel -o kernel.o

%.o: %.asm
	nasm $< -f elf32 -o $@
	#nasm kernel_entry.asm -f elf64 -o kernel_entry.o

%.bin: %.asm
	nasm $< -f bin -o $@
	# nasm bootsect.asm -f bin -o bootsect.o

clean:
	rm -rf *.bin *.dis *.o os-image.bin *.elf
	rm -rf kernel/*.o boot/*.bin drivers/*.o boot/*.o cpu/*.o

all: run

kernel.dis: kernel.bin
	ndisasm -b 32 $< > $@
	#ndisasm -b 32 kernel.bin > kernel.dis
