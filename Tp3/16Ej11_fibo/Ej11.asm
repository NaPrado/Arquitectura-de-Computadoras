GLOBAL _start
;No funca pero es para plantear la idea
fibo:
    push ebp
    mov ebp,esp
    cmp byte[ebp+8],0
    je .return0
    cmp byte[ebp+8],1
    je .return1
    mov eax,[ebp+8]
    dec eax
    push eax
    call fibo
    push eax
    mov eax,[ebp+8]
    sub eax,2
    push eax
    call fibo
    pop ecx
    add eax,ecx
    jmp .fin
.return0:
    mov eax,0
    jmp .fin
.return1:
    mov eax,1
.fin:
    mov esp,ebp
    pop ebp
    ret
_start:
    push 3
    push 3
    call fibo
    leave
    ret