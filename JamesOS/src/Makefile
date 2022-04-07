SOURCES=boot.o main.o
CFLAGS=-nostdlib -nostdinc -fno-builtin -fno-stack-protector
LDFLAGS=-Tlink.ld
ASFLAGS=-felf64

all: $(SOURCES) link

clean:
	-rm *.o kernel.elf

link:
	ld $(LDFLAGS) -o kernel.elf $(SOURCES)

.s.o:
	nasm $(ASFLAGS) $<
