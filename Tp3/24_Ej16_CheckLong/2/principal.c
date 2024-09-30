#include<stdio.h>
char checkLong(char * vec,char dim);
int main(int argc, char const *argv[]){
    extern char msg[];
    extern char len;
    int a=checkLong(msg,11);
    if (a!=0) {
        printf("Chequeo fallido\n");
    } else{
        printf("Chequeo exitoso\n");
    }
    return a;
}