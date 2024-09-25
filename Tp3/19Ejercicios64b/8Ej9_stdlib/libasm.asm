GLOBAL exit
GLOBAL read
GLOBAL write
GLOBAL open
GLOBAL close
exit:
    mov rax, 60
    jmp jumpsys
read:
    mov rax,0
    jmp jumpsys
write:
    mov rax,1
    jmp jumpsys
open:
    mov rax,2 
    mov rsi,2
    mov rdx,0
    jmp jumpsys
close:
    mov rax,3
jumpsys:
    syscall
    ret