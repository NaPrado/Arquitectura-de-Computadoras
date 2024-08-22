section .text
GLOBAL _start
EXTERN intToString
EXTERN print
EXTERN exit
EXTERN menor

_start:
    mov ebx,array
    mov ax,4
    call menor
    mov ebx,string
    call intToString
    call print
    mov ebx,nl
    call print
    mov bx,0
    call exit
section .data
    nl db 10,0
    array db 4,0,5,1
section .bss
    string resb 50
