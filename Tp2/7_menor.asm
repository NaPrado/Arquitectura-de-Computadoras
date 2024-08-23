section .text
GLOBAL _start
EXTERN intToString
EXTERN print
EXTERN exit
EXTERN menorArr

_start:
    mov ebx,array
    mov ax,4
    call menorArr
    mov ax,dx
    mov ebx,string
    call intToString
    call print
    mov ebx,nl
    call print
    mov bx,0
    call exit
section .data
    nl db 10,0
    array db 0,3,5,1
section .bss
    string resb 50
