section .text

GLOBAL _start
EXTERN intToString
EXTERN print
EXTERN exit

_start:
    mov ax, -10
loop:
    mov ebx, string
    call intToString
    call print
    mov ebx,nl
    call print
    cmp ax,10
    je end
    inc ax
    jmp loop
end:
    mov ebx,0
    call exit

section .data
nl db 10,0
num equ 15

section .bss
string resb 50