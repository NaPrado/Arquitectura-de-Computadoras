#include "Ej10.h"
int main(int argc, char const *argv[]){
    char vendor[13];
    vendor[12]='\n';
    cpudata(vendor);
    write(1,vendor,13);
    return 0;
}