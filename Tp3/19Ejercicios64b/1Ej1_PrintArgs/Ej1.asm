GLOBAL main 
EXTERN printf 
EXTERN puts
EXTERN exit
 
section .text 
main:
    push rbp
    mov rbp,rsp

    mov r10,rsi
    mov rbx,rdi
    mov rsi, rdi
    mov rdi,fmt
    push r10
    push rbx
    call printf
    pop rbx
    pop r10
    mov rax, 0
.loop:
    push rbx
    push r10
    mov rdi, args
    mov rsi, rax
    mov rdx, [r10 + rax*8]
    push rax
    mov eax,0   ;que divertido el printf fue hecho por tarados
                ;si eax no esta en cero falla delulu hasta que me di cuenta
                ;no hay registro que vos sepas que se va a preservar (*_*)
                ;Mi vieja me dio la vida, printf las ganas de no vivir
    call printf
    pop rax
    pop r10
    pop rbx
    inc rax
    cmp rax,rbx
    jne .loop


    mov rdi, 0
    call exit
    leave
    ret
section .rodata 
fmt db "Cantidad de argumentos: %d",10, 0 ;Con '\n' no me funciona por eso uso 10 literal
args db "Arg[%ld] = %s",10,0
 