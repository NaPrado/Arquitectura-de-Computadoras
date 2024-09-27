GLOBAL cpudata
GLOBAL write
cpudata:
    push ebp
    mov ebp,esp
    pushad
    mov eax,0
    cpuid
    mov esi,[ebp+8]
    mov [esi],ebx
    mov [esi+4],edx
    mov [esi+8],ecx
    popad
    mov esp,ebp
    pop ebp
    ret
;===============================================================================
; write - recibe una cadena null terminated y la escribe en un 
; filedescriptor tambien dado (segundo arg)
;===============================================================================
write:
    push ebp                    
    mov ebp,esp  
	pushad		; hago backup de los registros

	mov ecx, [ebp+8]	; la cadena esta en ebx
	mov edx, [ebp+16]	; en eax viene el largo de la cadena
	mov ebx, [ebp+12]	; FileDescriptor (STDOUT)
	mov eax, 4	; ID del Syscall WRITE
	int 80h
	
	popad 		; restauro los registros
    mov esp,ebp
    pop ebp
	ret	