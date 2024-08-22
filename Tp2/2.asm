; este esta hecho a lo boca, hay otro con una funcion toUpperCase
section .text

GLOBAL _start

_start:
    mov eax, 0
restart:
    mov ecx, string ;cargo el puntero al string
    add ecx, eax
    cmp byte [ecx],'a' 
    jnge next
    cmp byte [ecx], 'z'
    jnle next
    sub byte [ecx], 'a'-'A'
next:
    inc eax
    cmp byte [ecx], 0h
    je end
    jmp restart
end:
    mov ecx, string
    mov edx, longitud
    call print

    mov eax, 1		; ID del Syscall EXIT
	mov ebx, 0		; Valor de Retorno
	int 80h		; Ejecucion de la llamada


;===============================================================================
;Funcion print
;Recibe en ECX, la cadena a imprimir y en EDX el largo de la misma.
;===============================================================================
print:
	mov ebx, 1		; FileDescriptor (STDOUT)
	mov eax, 4		; ID del Syscall WRITE
	int 80h		; Ejecucion de la llamada
	ret			; retorno de la funcion

section .data

string db "h4ppy c0d1ng", 10, 0
longitud equ $-string
