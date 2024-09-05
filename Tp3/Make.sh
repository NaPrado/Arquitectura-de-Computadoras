#!/bin/bash
num=0
# Iterar sobre los argumentos pasados al script
for i in "$@"; do
    # Ignorar el nombre del script y el primer argumento
    if [ "$i" != "$0" ];then
        let num+=1
        if echo "$i" | grep -E -q '\.asm$'; then
            nasm -f elf32 "$i" -o "$num .o"
        elif echo "$i" | grep -E -q '\.c$'; then
            gcc -c -m32 "$i" -o "$num .o" 
        else
            echo "No sé qué es $i"
        fi
    fi
done

# Preguntar al usuario por el tipo de enlace y el nombre del archivo de salida
#echo -n "(c|asm): "
#read linker
linker=c
#echo -n "Nombre del archivo de salida: "
#read name
name=Ej2

# Vincular los archivos objeto según el tipo de archivo de entrada
if echo "$linker" | grep -E -q 'c'; then
    gcc -m32 *.o -o "$name" &> /dev/null
else
    ld -m elf_i386 *.o -o "$name"
fi

# Eliminar los archivos objeto y ejecutar el programa resultante
rm *.o
clear
echo "Salida Std de \"$name\" :"
./"$name" hola
#echo "Process finished with exit code $?"