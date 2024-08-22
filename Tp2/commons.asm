GLOBAL print
GLOBAL exit
GLOBAL toUpperCase
GLOBAL strlen
GLOBAL intToString
GLOBAL sumFirst2Digit
GLOBAL fact
GLOBAL menor
GLOBAL sort

section .text
;===============================================================================
;Recibe un array de longitud ax bytes en ebx y lo ordena
;===============================================================================

sort:
;===============================================================================
;Recibe un array de longitud ax bytes en ebx y retorna en ax el menor
;===============================================================================
menor:
    push ebx
    push ecx
    push edx
    mov dx,0
.m:
    mov cl,byte[ebx]
.next:
    inc ebx
    inc dx
    cmp dx,ax
    je .exit
    cmp cl,byte[ebx]
    jl .next
    jmp .m
.exit:
    mov ax,cx
    pop edx
    pop ecx
    pop ebx
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
;recibe un numero en AX y una direccion de memoria en EBX
;luego esa direccion es un string null terminated del numero
;===============================================================================
intToString:
    pushad ; guardo los registros
    mov dx, 0 ;inicializo un contador
    cmp ax,0 ;me fijo si el numero es positivo
    jns .positive ; si lo es empieza el algoritmo
    mov byte[ebx],'-' ;si no añado el - 
    inc ebx ;y luego empieza el algoritmo
    mov cx,-1
    imul cx
.positive: ;calcular numero
;num=(num)/10, el resto lo cargo en la pila asi o +'0' luego cuando termino de leer el numero(cuando num==0) popeo la pila y la cargo en ebx luego cargo un 0
    inc dx
    mov cl,10
    cmp ax,10
    jl .oneDigit
    idiv cl
    add ah,'0'
    mov cl,ah
    mov ch,0
    push cx
    mov ah,0
    jmp .positive
.oneDigit:
    add al,'0'
    mov byte[ebx], al
    inc ebx
.finish:
    dec dx
    cmp dx,0
    je .end
    pop cx
    mov byte[ebx], cl
    inc ebx
    jmp .finish
.end:
    mov byte[ebx],0
    popad
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
;	ebx: cadena a imprimer en pantalla, terminada con 0
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

