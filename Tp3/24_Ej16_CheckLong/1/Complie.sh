gcc principal.c -fno-builtin -c -m32 -o principal.o
nasm -f elf32 checkLong.asm -o checkLong.o 
gcc -m32 *.o -fno-builtin -o checkLong.out
./checkLong.out
echo $?