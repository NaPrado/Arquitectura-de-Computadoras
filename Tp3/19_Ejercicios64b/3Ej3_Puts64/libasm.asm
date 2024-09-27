; libasm.asm 
GLOBAL sys_write

sys_write:
    mov rax, 1 ; syscall write
    syscall
    ret
