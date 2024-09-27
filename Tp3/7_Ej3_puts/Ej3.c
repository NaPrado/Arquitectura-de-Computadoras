//libc.c 
#define STDOUT 1 
#include <string.h>
 
int sys_write(int fd, void *buffer, int size); 
 
int puts(const char* str) { 
  int len = strlen(str); 
  return sys_write(STDOUT, (void *) str, len); 
} 
int main(void){
    puts("De esto se enecarga asm\n");
    return 0;
}