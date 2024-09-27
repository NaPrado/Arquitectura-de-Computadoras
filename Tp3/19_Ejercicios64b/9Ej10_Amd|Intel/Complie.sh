gcc Ej10.c -fno-builtin -c -m64 -o Ej10c.o
nasm -f elf64 Ej10.asm -o Ej10asm.o 
gcc -m64 -no-pie *.o -o Ej10.out
