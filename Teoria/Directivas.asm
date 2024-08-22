
;db(define byte) -> byte
;dw(define word) -> 2 bytes
;dd(define double word) -> 4 bytes
;dq(define q word) -> 8 bytes

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       stack frame         ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Armado de stack frame:
    push ebp                    
    mov ebp,esp                 
;Otra opcion para el armado:
    enter                       ; Macro
;Desarmado de stack frame:
    mov esp,ebp
    pop ebp
;Otra opción de desarmado:
    leave                       ; Macro
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;           Jumps           ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Salto incondicional
    jmp rotulo
;Saltos condicionales
    je rotulo                   ;jump if equals
    jne rotulo                  ;jump if not equals
    jge rotulo                  ;jump if is greater-equal
    jz rotulo                   ;jump if is zero
    jnz rotulo                  ;jump if is not zero
;Call
    Call funcion                ;Hace como un jmp pero en esp guardo la direccion de retorno
;Ret
    ;C deja en eax el valor de retorno de una funcion, si no entra usa tambien edx
    ;si aun asi no entra usa ambos registros para dejar una puntero en algun lugar de la memoria
    ret                         ;Salta a la direccion de memoria cargada en esp
;mov
    mov eax,DWORD PTR [ebp+0x8] ;carga un dato en otro, puede ser un registro o un lugar de la pila
    movzx                       ;?????????????????????
;test
    test al,al                  ;????????????? creo q cambia flags
;stack
;para asignar espacio hay que restar
;para "limpiar" hay que sumar

;Ejemplo de funcion en asm para usar en c
;ASM
[GLOBAL siete]
[SECTION .text]
siete:
    push ebp
    mov ebp,esp
    ;Codigo
    mov eax,7
    ;Codigo
    mov esp,ebp
    pop ebp
    ret
;ASM
;C
#include<stdio.h>
extern unsigned int siete(void);
int main(void){
    printf("Devuelve el numero siete = %d\n",siete());
    return 0;
}
;C