GLOBAL _start
EXTERN main

_start:
    mov rdi, [rsp]
    mov rsi, [rsp+8]
    call main
    mov rdi,rax
    mov rax, 60
    syscall