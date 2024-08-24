section .text
GLOBAL _start
EXTERN intToString
EXTERN print
EXTERN exit
EXTERN fact

_start:
    mov ax, 6
    call fact
    mov ebx,string
    call intToString
    call print
    mov ebx,nl
    call print
    mov bx,0
    call exit
section .data
    nl db 10,0
section .bss
    string resb 50