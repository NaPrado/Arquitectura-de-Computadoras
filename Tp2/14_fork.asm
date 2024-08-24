section .text
GLOBAL _start
EXTERN exit
EXTERN fork
EXTERN print
_start:
    mov eax,0
    call fork
    cmp eax,0
    je .son
    mov ebx,padre
    call print
    jmp .out
.son:
    mov ebx,hijo
    call print
.out:
    mov ebx,0
    call exit
section .rodata
    padre db "Yo soy tu padre",10,0
    hijo db "Yo soy luke?",10,0
section .bss
    string resb 50 