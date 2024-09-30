GLOBAL checkLong
GLOBAL msg
GLOBAL len
GLOBAL write

checkLong:
    push ebp
    mov ebp, esp
    mov eax, [ebp+8]
    mov cl, [ebp+12]
    .bucle:
    mov dl,byte[eax]
    cmp dl,0
    je .fin
    inc eax
    jmp .bucle
    .fin:
    inc eax
    mov dl,byte[eax]
    sub dl,cl
    mov al,dl
    leave
    ret
section .data 
msg:  db "Hola Mundo", 0 
len:  db 10 