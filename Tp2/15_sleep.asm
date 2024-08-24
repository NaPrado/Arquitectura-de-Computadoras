section .text
GLOBAL _start
EXTERN nanoSleep
EXTERN exit
_start:
    mov ebx, timespec
    call nanoSleep
    mov ebx,0
    call exit
section .data
timespec:
    dd 5         ; 1 segundo
    dd 500000000 ; 500 millones de nanosegundos (500 ms)