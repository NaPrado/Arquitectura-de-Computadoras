section .text

GLOBAL _start
EXTERN toUpperCase
EXTERN print
EXTERN exit

_start:
    mov ecx, string
    call toUpperCase
    mov edx, longitud
    mov ebx, ecx
    call print

    mov eax, 1		; ID del Syscall EXIT
	mov ebx, 0		; Valor de Retorno
	int 80h		; Ejecucion de la llamada

section .data

string db "h4ppy c0d1ng", 10, 0
longitud equ $-string
