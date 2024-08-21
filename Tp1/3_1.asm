0804848b <fortune>:
 804848b:	55                   	push   ebp 
; ebp es el registro que mide la distancia relativa entre el sp y la siguiente instruccion 
; me guardo eso en la pila para saber donde volver
 804848c:	89 e5                	mov    ebp,esp 
; Ahora cargo en ebp la direccion del actual sp
 804848e:	83 ec 10             	sub    esp,0x10
; Seteo el sp 16 bytes más atras, de esta forma seteando un 
; espacio de 16Bytes para el stack de la "funcion"
 8048491:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
; Voy 4Bytes atras del comienzo de mi pila y seteo un puntero a Double Word (16 bits / 2 Bytes) en 0
 8048498:	eb 08                	jmp    salto1 ;80484a2 <fortune+0x17> 
; Hago un salto incondicional a 80484a2 por claridad le voy a cambiar el nombre al rotulo
 salto2:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
; en mi "variable" ya declarada acumulo 1
 804849e:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
; tambien le cargo 1 a ebp+8
 salto1:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8] ;80484a2 <fortune+0x17> 
; Cargo en eax un puntero, ubicado 8Bytes adelante de mi pila, a Double Word (16 bits / 2 Bytes)
 80484a5:	0f b6 00             	movzx  eax,BYTE PTR [eax]
; Por lo que entiendo carga en eax lo que apunta eax ?
 80484a8:	84 c0                	test   al,al
; agarra la parte baja de eax y si es cero setea la ZF flag en 1
 80484aa:	75 ee                	jne    salto2 ;804849a <fortune+0xf>
; si ZF esta en 0 salta cambio el rotulo por comodidad 
; entonce si la parte baja de eax no es cero salto
; si no entiendo mal es como un bluce hasta que termine algo null terminated? creo
 80484ac:	8b 4d fc             	mov    ecx,DWORD PTR [ebp-0x4]
; cargo en ecx la cantidad de veces que hice el "bucle"
 80484af:	ba ab aa aa aa       	mov    edx,0xaaaaaaab
; cargo un numero muy grande en edx
 80484b4:	89 c8                	mov    eax,ecx
; cargo en eax el contador
 80484b6:	f7 e2                	mul    edx
; edx:eax=eax*edx 
; se guarda la multiplicacion en 2 registros porque puede que de muy grande y no entre
 80484b8:	c1 ea 02             	shr    edx,0x2
; es como dividir por 4 (desplaza los bits 2 bits a la derecha)
 80484bb:	89 d0                	mov    eax,edx
; cargo en eax edx
 80484bd:	01 c0                	add    eax,eax ; eax= 2*edx
 80484bf:	01 d0                	add    eax,edx ; eax= 3*edx
 80484c1:	01 c0                	add    eax,eax ; eax= 6*edx

 80484c3:	29 c1                	sub    ecx,eax
; a la cantidad de veces que hice el bucle le resto eax
 80484c5:	89 ca                	mov    edx,ecx

 80484c7:	8b 04 95 24 a0 04 08 	mov    eax,DWORD PTR [edx*4+0x804a024]
;?
 80484ce:	c9                   	leave
; Restaura el puntero base (ebp) y la pila.
 80484cf:	c3                   	ret
; vuelve