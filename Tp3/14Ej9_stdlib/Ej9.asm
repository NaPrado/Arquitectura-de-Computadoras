GLOBAL exit
GLOBAL read
GLOBAL write
GLOBAL open
GLOBAL close
exit:
    mov ebx,[esp+8]
	mov eax, 1		; ID del Syscall EXIT
	int 80h		; Ejecucion de la llamada
;===============================================================================
; read - lee una cadena de count longitud de un
; filedescriptor dado (int fd, char[]buf, int count)
;===============================================================================
read:
    push ebp                    
    mov ebp,esp 
    pushad 
    mov eax,3
    mov ebx,[ebp+8]
    mov ecx,[ebp+12]
    mov edx,[ebp+16]
    int 80h
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
;===============================================================================
; open(const char * filename)
;===============================================================================
open:
    push ebp
    mov ebp,esp
    push ebx
    push ecx
    push edx

    mov eax, 5 
    mov ebx, [ebp+8]
    mov ecx, 2
    int 80h
    
    pop edx
    pop ecx
    pop ebx
    mov esp,ebp
    pop ebp
    ret
;===============================================================================
; close(unsigned int fd)
;===============================================================================
close:
    push ebp
    mov ebp,esp
    push ebx

    mov eax, 6
    mov ebx,[ebp+8]
    int 80h

    pop ebx
    mov esp,ebp
    pop ebp
    ret
