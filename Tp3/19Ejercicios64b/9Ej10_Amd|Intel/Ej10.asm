GLOBAL write
GLOBAL cpudata
write:
    mov rax,1
    syscall
    ret
cpudata:
    push rbx
    push rdx
    push rcx
    mov eax,0
    cpuid
    mov [rdi],ebx
    mov [rdi+4],edx
    mov [rdi+8],ecx
    pop rcx
    pop rdx
    pop rbx
    ret