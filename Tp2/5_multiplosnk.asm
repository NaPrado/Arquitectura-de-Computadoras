section .text

GLOBAL _start
EXTERN nkMultiplos
EXTERN intToString
EXTERN print
EXTERN exit

_start:
    mov bl,3
    mov cl,10
    call nkMultiplos
    mov bx, 0
    call exit
;===============================================================================
;Recibe un numero n en Bl y un numero k en CX
;imprime los multiplos de n desde 1 a k
;===============================================================================
nkMultiplos:
    pushad
    mov bh,0
    mov dl,0
.loop:
    inc dl
    mov ax,bx
    mul dl
    cmp ax,cx
    jg .end
    push bx
    mov ebx,string
    call intToString
    call print 
    mov ebx, nl
    call print
    pop bx
    jmp .loop
.end:
    popad
    ret
section .data
nl db 10,0

section .bss
string resb 50