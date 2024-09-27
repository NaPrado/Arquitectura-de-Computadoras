#include"Ej10.h"
int main(int argc, char const *argv[]){
    char vendor[13];
    vendor[12]='\n';
    cpudata(vendor);
    write(vendor,1,13);
    return 0;
}