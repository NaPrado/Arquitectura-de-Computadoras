#include <stdio.h>

void append(char * dest,int size, char org){
    dest[size]=org;
    dest[size+1]=0;
}

int main(int argc, char const *argv[]){
    FILE* file=fopen(argv[1],"rt");
    char toPrint[500]={0};
    if (file!=NULL){
        int amount=0;
        while (!feof(file)){
            int c=getc(file);
            if (c >= 32 && c <= 126){
                append(toPrint,amount,c);
                amount++;
            }else if (amount){
                if (amount >= 4){
                    printf("%s\n",toPrint);
                }
                toPrint[0]=0;
                amount=0;
            }
        }
    }
    return 0;
}