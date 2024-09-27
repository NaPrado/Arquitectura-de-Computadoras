gcc Ej8.c -fno-builtin -c -m64 -o Ej8.o
nasm -f elf64 main.asm -o main.o 
ld  *.o -o main.out
