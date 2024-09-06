;main.asm 
GLOBAL main 
EXTERN printf 

section .rodata 
fmt db "Cantidad de argumentos: %d",10, 0 ;Con '\n' no me funciona por eso uso 10 literal
args db "Arg[%d]=%s",10,0
 
section .text 
main: 
  push ebp    ;Armado de stack frame 
  mov ebp, esp  ; 

  mov edi,dword [ebp+8]
  push edi 
  push fmt 
  call printf 

  add esp, 2*4 
  mov ebx,dword [ebp+12] 
  mov esi, 0
.loop:
  cmp esi,edi
  jae .fin

  push dword [ebx + esi * 4]
  push esi
  push args
  call printf

  add esp,3*4
  inc esi
  jmp .loop
.fin:
  mov eax, 0 
 
  mov esp, ebp  ;Desarmado de stack frame 
  pop ebp    ; 
  ret 