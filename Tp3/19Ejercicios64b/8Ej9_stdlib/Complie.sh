gcc test.c -fno-builtin -c -m64 -o test.o
nasm -f elf64 libasm.asm -o libasm.o 
gcc -m64 -no-pie *.o -o libasm.out
