GLOBAL _start
EXTERN main
section .text
_start:
    push ebp
    mov ebp, esp
    mov ecx,0
    mov edx,dword[ebp]
    push ebp
.loop:
    inc ecx
    push dword[ebp+ecx*4]
    cmp ecx,edx
    jnge .loop
    
    call main
    mov ebx,eax     ;cargo retorno del main
    mov eax, 1		; ID del Syscall EXIT
	int 80h		; Ejecucion de la llamada