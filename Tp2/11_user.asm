section .text
GLOBAL _start
EXTERN exit
EXTERN print
EXTERN getUser
_start:
    mov ebx,hola
    call print
    call getUser
    call print
    mov ebx,nl
    call print
    mov ebx,0
    call exit
section .data
    nl db 10,0
    hola db "Hola ",0
section .bss
    string resb 50