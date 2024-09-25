#include"test.h"

int main(void){
    unsigned int fd1=open("write.txt");
    unsigned int fd2=open("read.txt");
    char* toPrint="Hola\n";
    write(fd1,toPrint,5);
    char buff[10]={0};
    read(fd2,buff,6);
    write(1,buff,6);
    close(fd1);
    close(fd2);
    exit(55);
}