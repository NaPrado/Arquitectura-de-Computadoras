section .text
EXTERN print
EXTERN getString
EXTERN toUpperCase
EXTERN exit
GLOBAL _start
section .data
_start:
    mov ecx,string
    call getString
    mov ebx,ecx
    call toUpperCase
    call print
    mov ebx,0
    call exit
section .bss
    string resb 50