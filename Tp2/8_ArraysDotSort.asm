section .text
GLOBAL _start
EXTERN intToString
EXTERN printArr
EXTERN exit
EXTERN sort
EXTERN print
_start:
    mov ax,4
    mov ebx,array
    call sort
    call printArr
    mov ebx,nl
    call print
    mov ebx, 0
    call exit
section .data
    nl db 10,0
    array db 2,1,5,0
