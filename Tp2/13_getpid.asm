section .text
GLOBAL _start
EXTERN exit
EXTERN intToString
EXTERN getpid
EXTERN print
_start:
    call getpid
    mov ebx,string
    call intToString
    call print
    mov ebx,nl
    call print
    mov ebx,0
    call exit
section .rodata
    nl db 10,0
section .bss
    string resb 50 