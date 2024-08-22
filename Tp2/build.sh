nasm -f elf32 $1.asm -o $1.o
nasm -f elf32 commons.asm -o commons.o
ld -m elf_i386 $1.o commons.o -o $1
rm *.o
./$1