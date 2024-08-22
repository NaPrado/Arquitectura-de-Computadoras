#include<stdio.h>
#include<stdlib.h>

int main(int argc, char const *argv[]){
    int charBytes=sizeof(char);
    int charBits=charBytes*8;
    printf("El tamaño de un char es %d bits o %d Byte\n",charBits,charBytes);
    return 0;
}
