GLOBAL checkLong

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