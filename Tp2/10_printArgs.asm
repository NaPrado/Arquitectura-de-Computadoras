section .text
GLOBAL _start
EXTERN intToString
EXTERN exit
EXTERN print
_start:
    mov ebp,esp
    mov eax,[ebp]
    mov edx,eax
    mov ebx, cant
    call print
    call intToString
    call print
    mov ebx,nl
    call print
    mov eax,0
.args:
    mov ebx, argc
    call print
    mov ebx,string
    call intToString
    call print
    mov ebx,c
    call print
    
    add ebp,4
    mov ebx,[ebp]
    call print
    mov ebx,nl
    call print
    inc eax
    cmp edx,eax
    jne .args
.end:
    mov ebx,0
    leave
    call exit
section .data
    nl db 10,0
    argc db "argv[",0
    c db "]: ",0
    cant db "Cantidad de argumentos: ",0
section .bss
    string resb 50