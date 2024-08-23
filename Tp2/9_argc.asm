section .text
GLOBAL _start
EXTERN intToString
EXTERN exit
EXTERN print
EXTERN getArgsCant
_start:
    mov ebp,esp
    mov eax,[ebp]
    mov ebx,string
    call intToString
    call print
    mov ebx,nl
    call print
    mov eax,0
    call exit
section .data
    nl db 10,0
section .bss
    string resb 50