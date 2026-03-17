AS := nasm
ASFLAGS := -f elf64
LD = ld
LDFLAGS =

SOURCES := $(wildcard *.asm)
OBJECTS := $(SOURCES:.asm=.o)
EXECUTABLES := $(SOURCES:.asm=)

all: $(EXECUTABLES)

%.o: %.asm
	$(AS) $(ASFLAGS) $< -o $@

%:%.o
	$(LD) $(LDFLAGS) $< -o $@

clean:
	rm -f *.o $(EXECUTABLES)

.PHONY: all, clean