Cflags = -g -c -ansi -Wall
CC = gcc
ASM = yasm
LINKER = gcc

all: project3

project3: main.o str2long.o add_long.o
	$(LINKER) -g main.o str2long.o add_long.o -o project3

main.o: main.c
	$(CC) $(Cflags) main.c -o main.o

str2long.o: str2long.s
	$(ASM) -f elf64 -dwarf2 str2long.s -o str2long.o

add_long.o: add_long.s
	$(ASM) -f elf64 -dwarf2 add_long.s -o add_long.o

clean:
	rm -f *.o project3