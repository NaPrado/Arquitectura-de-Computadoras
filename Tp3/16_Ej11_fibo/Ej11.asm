GLOBAL _start
;No funca pero es para plantear la idea
fibo:
    push ebp
    mov ebp,esp
    push ebx
    cmp DWORD[ebp+8],0
    je .return0
    cmp DWORD[ebp+8],1
    je .return1
    mov eax,[ebp+8]
    dec eax
    push eax
    call fibo
    add esp, 4
    mov ebx,eax
    mov eax,[ebp+8]
    sub eax,2
    push eax
    call fibo
    add esp, 4
    add eax,ebx
    jmp .fin
.return0:
    mov eax,0
    jmp .fin
.return1:
    mov eax,1
.fin:
    mov ebx, DWORD [ebp-4]
    leave
    ret
_start:
    push ebp
    mov ebp,esp
    push 3
    call fibo
    leave
    mov ebx,eax
    mov eax, 1
    int 80h