section .text
GLOBAL _start
EXTERN exit
EXTERN print
EXTERN intToString
_start:
    mov eax,0
    mov bl,8
    mov edx,0
.loop:
    inc ebp
    inc eax
    div bl
    mov al,ah
    mov ah,0
    cmp al,0
    jne .loop
    inc edx
    push eax
    push ebx
    mov eax,edx
    mov ebx,string
    call intToString
    call print
    mov ebx,nl
    call print
    push ebx
    push eax
    jmp .loop


section .data
    nl db 10,0
section .bss
    string resb 50