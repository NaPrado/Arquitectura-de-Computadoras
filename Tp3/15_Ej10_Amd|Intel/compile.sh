nasm -f elf32 Ej10.asm -o Ej10asm.o
gcc Ej10.c  -fno-builtin -c -m32 -o Ej10c.o
gcc -m32 *.o -fno-builtin -o Ej10
./Ej10
echo "Exit value $?"