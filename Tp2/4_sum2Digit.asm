section .text

GLOBAL _start
EXTERN sumFirst2Digit
EXTERN intToString
EXTERN print
EXTERN exit

_start:
    mov ax,124
    call sumFirst2Digit
    mov ebx, string
    call intToString
    call print
    mov ebx, nl
    call print
    mov ebx,0
    call exit

section .data
nl db 10,0
num equ 15

section .bss
string resb 50