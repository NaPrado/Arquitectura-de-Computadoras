nasm -f elf32 Ej9.asm -o Ej9.o
gcc test.c  -fno-builtin -c -m32 -o test.o
gcc -m32 *.o -fno-builtin -o testExit
./testExit
echo "Exit value $?"