GLOBAL print
GLOBAL exit
GLOBAL toUpperCase
GLOBAL strlen
GLOBAL intToString
GLOBAL sumFirst2Digit
GLOBAL fact
GLOBAL menorArr
GLOBAL sort
GLOBAL printArr
GLOBAL getArgsCant
GLOBAL strcmp
GLOBAL startWith
GLOBAL getUser

section .text
;===============================================================================
;ebx=$USER, se debe llamar desde _start, creo
;===============================================================================
getUser:
    push ebp
    mov ebp,esp
    mov ecx,ebp
.loop:
    mov ebx,user
    call startWith
    inc ecx
    cmp edx,0
    je .loop 
    mov ebx,ecx
    add ebx,4
    leave
    ret
;===============================================================================
;compara una cadena de texto ebx null terminated con otra ecx y 
;si ecx empieza con ebx, edx=1 sino edx=0
;===============================================================================
startWith:
    push ebp
    mov ebp,esp
    sub esp,0x50
    push ebx
    push ecx
    mov dword[ebp-0x4],ebx
    mov dword[ebp-0x8],ecx
    mov edx,1
.loop:
    mov ebx,dword[ebp-0x4];cargo donde tengo guardado el string
    mov ecx,dword[ebp-0x8];cargo donde tengo guardado el string
    mov bl,byte[ebx];cargo el caracter
    mov cl,byte[ecx];cargo el caracter

    cmp bl,cl ;comparo si son iguales
    je .iguales
    and edx,0
.iguales:
    and edx,1
    inc dword[ebp-0x4];cargo donde tengo guardado el string
    inc dword[ebp-0x8];cargo donde tengo guardado el string
    mov ebx,dword[ebp-0x4]
    mov bl,byte[ebx]
    cmp bl,0 ;me fijo si b termino
    jne .loop
    pop ecx
    pop ebx
    leave
    ret

;===============================================================================
;ax=strcmp(ebx,ecx);no hacia falta :(
;===============================================================================
strcmp:
    push ebp
    mov ebp,esp
    sub esp,0x50
    push ebx
    push ecx
    mov dword[ebp-0x4],ebx
    mov dword[ebp-0x8],ecx
    mov eax,1
.loop:
    mov ebx,dword[ebp-0x4];cargo donde tengo guardado el string
    mov ecx,dword[ebp-0x8];cargo donde tengo guardado el string
    mov bl,byte[ebx];cargo el caracter
    mov cl,byte[ecx];cargo el caracter

    cmp bl,cl ;comparo si son iguales
    je .iguales
    and eax,0
.iguales:
    and eax,1
    inc dword[ebp-0x4];cargo donde tengo guardado el string
    inc dword[ebp-0x8];cargo donde tengo guardado el string
    and bl,cl ;me fijo si alguno es cero
    jnz .loop
    pop ecx
    pop ebx
    leave
    ret
;===============================================================================
;Recibe un array de longitud ax bytes en ebx y lo imprime
;===============================================================================
printArr:
    push ebp
    mov ebp,esp
    sub esp,0x50
    pushad
    mov dword[ebp-0x4],eax
    mov dword[ebp-0x8],ebx
    mov dword[ebp-0xc],40; ascii del parentesis
    mov edx,0
    mov ebx,ebp
    sub ebx,0xc
    call print 
.printNums:
    mov ebx,dword[ebp-0x8]
    mov al,byte[ebx]
    mov ah,0
    mov bl,byte[ebp-0xc]
    call intToString
    call print
    cmp edx,dword[ebp-0x4]
    jg .printParentesis
.printComa:
    mov dword[ebp-0xc],','
    mov dword[ebp-0x10],0
    mov ebx,ebp
    sub ebx,0xc
    call print
    inc dword[ebp-0x8]
    dec dword[ebp-0x4]
    inc edx
    jg .printNums
.printParentesis:
    mov dword[ebp-0xc],41; ascii del parentesis
    mov ebx,ebp
    sub ebx,0xc
    call print 
    popad
    leave
    ret
;===============================================================================
;Recibe un array de longitud ax bytes en ebx y lo ordena
;===============================================================================
sort:
    push ebp
    mov ebp,esp
    sub esp,0x10
    mov dword[ebp-0x4],eax
    mov dword[ebp-0x8],ebx
    mov dword[ebp-0xc],0
    pushad
.loop:
    call menorArr
    mov al, byte[ebx]
    mov byte[ebx],cl
    add ebx,edx
    mov byte[ebx],al
    mov ebx,dword[ebp-0x8]
    inc dword[ebp-0xc]
    add ebx,dword[ebp-0xc]
    dec dword[ebp-0x4] 
    mov eax,dword[ebp-0x4]
    cmp eax,0
    jne .loop
    popad
    leave
    ret

;===============================================================================
;Recibe un array de longitud ax bytes en ebx y retorna en cx el menor, en dx su pos
;===============================================================================
menorArr:
    push ebp
    mov ebp,esp
    sub esp,0x4
    mov byte [ebp-0x4],0
    push ebx
.m:
    mov edx,dword[ebp-0x4] 
    mov cl,byte[ebx]
.next:
    inc ebx
    inc byte [ebp-0x4]
    cmp dword[ebp-0x4],eax
    je .exit
    cmp cl,byte[ebx]
    jl .next
    jmp .m
.exit:
    pop ebx
    leave
    ret
;===============================================================================
;Retorna factorial de Al
;===============================================================================
fact:
    push bx
    cmp al,0
    je .load0
    mov ah,0
    push ax
    dec al
    call fact
    pop bx
    mul bl
    jmp .exit
.load0:
    mov al,1
.exit:
    pop bx
    ret
;===============================================================================
;Recibe un numero natural en AX y sus primeros 2 digitos se suman y seguardan en AX
;===============================================================================
sumFirst2Digit:
    push cx
    push ebp                    
    mov ebp,esp  
    cmp ax,10
    jle .1Digit
.loop:
    mov cl,10
    div cl
    mov cl,ah
    mov ch,0
    mov ah,0
    push cx
    cmp ax,10
    jge .loop
    jmp .2Digits
.end:
    pop cx
    mov ax,0
    add ax,cx
.2Digits:
    pop cx
    add ax,cx
.1Digit:
    leave
    pop cx
    ret    
;===============================================================================
;recibe un numero en EAX y una direccion de memoria en EBX
;luego esa direccion es un string null terminated del numero
;===============================================================================
intToString:
    push ebp
    mov ebp,esp
    sub esp,0x50
    pushad ; guardo los registros
    mov byte [ebp-0x4], 0 ;inicializo un contador
    mov edx,0
    cmp eax,0
    jge .positive
    neg eax
    mov byte[ebx],'-' 
    inc ebx
    cmp eax,10
    jl .saveState
.positive:
    mov ecx,10
    div ecx
    mov cx,dx
    mov edx,0
    mov dx,cx
    push edx
    mov edx,0
    inc byte [ebp-0x4]
    cmp eax,10
    jnle .positive
.saveState:
    add al,'0'
    mov byte[ebx],al
    inc ebx
    cmp byte [ebp-0x4],0
    je .finish  
    pop eax
    dec byte [ebp-0x4]
    jmp .saveState
.finish:
    mov byte[ebx],0
    popad
    leave
    ret

;===============================================================================
;Funcion toUpperCase
;Recibe en ECX, la cadena a transformar
;===============================================================================
toUpperCase:
    pushad
    mov ebx,ecx
    mov eax, 0
restart:
    mov ecx, ebx ;cargo el puntero al string
    add ecx, eax
    cmp byte [ecx],'a' 
    jnge next
    cmp byte [ecx], 'z'
    jnle next
    sub byte [ecx], 'a'-'A'
next:
    inc eax
    cmp byte [ecx], 0h
    jne restart
    mov ecx,ebx
    popad
    ret
;===============================================================================
; print - imprime una cadena en la salida estandar
;===============================================================================
; Argumentos:
;	ebx: cadena a imprimir en pantalla, terminada con 0
;===============================================================================
print:
	pushad		; hago backup de los registros

	call strlen
	mov ecx, ebx	; la cadena esta en ebx
	mov edx, eax	; en eax viene el largo de la cadena

	mov ebx, 1	; FileDescriptor (STDOUT)
	mov eax, 4	; ID del Syscall WRITE
	int 80h
	
	popad 		; restauro los registros
	ret	
;===============================================================================
; exit - termina el programa
;===============================================================================
; Argumentos:
;	ebx: valor de retorno al sistema operativo
;===============================================================================
exit:
	mov eax, 1		; ID del Syscall EXIT
	int 80h		; Ejecucion de la llamada


;===============================================================================
; strlen - calcula la longitud de una cadena terminada con 0
;===============================================================================
; Argumentos:
;	ebx: puntero a la cadena
; Retorno:
;	eax: largo de la cadena
;===============================================================================
strlen:
	push ecx	; preservo ecx	
	push ebx	; preservo ebx
	pushf		; preservo los flags

	mov ecx, 0	; inicializo el contador en 0
.loop:			; etiqueta local a strlen
	mov al, [ebx] 	; traigo al registo AL el valor apuntado por ebx
	cmp al, 0	; lo comparo con 0 o NULL
	jz .fin 	; Si es cero, termino.
	inc ecx	; Incremento el contador
	inc ebx
	jmp .loop
.fin:			; etiqueta local a strlen
	mov eax, ecx	
	
	popf
	pop ebx	; restauro ebx	
	pop ecx	; restauro ecx
	ret
section .rodata
    user db "USER=",0