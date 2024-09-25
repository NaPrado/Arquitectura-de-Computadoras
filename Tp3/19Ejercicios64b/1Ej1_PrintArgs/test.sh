nasm -f elf64 Ej1.asm  -o Ej1.o
gcc -m64 -no-pie *.o -o Ej1.out &> /dev/null
./Ej1.out $1
# usar ./test.sh "todos los argumentos encerrados en las mismas comillas"
# ejemplo ./test.sh "1 2 3 4"
# sin comillas es como hacer ./test.sh 1