#include<stdio.h> 
int calculo(int param1, int param2, char tipo){ 
  int resul; 
  if(tipo=='s') 
    resul = param1 + param2; 
  else 
    resul = param1 * param2; 
return resul; 
}
int main(void){ 
  int valor1 = 7; 
  int valor2 = 3; 
  char operacion; 
  printf("Ingrese  el  tipo  de  operación:  's'  suma  y  'm' multiplicar:\n"); 
  scanf("%c", &operacion); 
  printf("Resultado: %d\n", calculo(valor1, valor2, operacion)); 
  return 0; 
}

