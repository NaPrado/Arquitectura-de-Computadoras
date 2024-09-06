;main.asm 
GLOBAL main 
EXTERN printf 

section .rodata 
fmt db "Cantidad de argumentos: %d",10, 0 ;Con '\n' no me funciona por eso uso 10 literal
 
section .text 
main: 
  push ebp    ;Armado de stack frame 
  mov ebp, esp  ; 
 
  push dword [ebp+8] 
  push fmt 
  call printf 
  add esp, 2*4 
 
  mov eax, 0 
 
  mov esp, ebp  ;Desarmado de stack frame 
  pop ebp    ; 
  ret 