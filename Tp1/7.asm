080484cb <check_password>:
 80484cb:	55                   	push   ebp
 80484cc:	89 e5                	mov    ebp,esp
 80484ce:	83 ec 18             	sub    esp,0x18
 80484d1:	c7 45 f0 01 00 00 00 	mov    DWORD PTR [ebp-0x10],0x1

; Llamada a strlen para saber la long de la contraseña ingresada

 80484d8:	83 ec 0c             	sub    esp,0xc
 80484db:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 80484de:	e8 ad fe ff ff       	call   8048390 <strlen@plt>
 80484e3:	83 c4 10             	add    esp,0x10
 80484e6:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax

; Si la long.eql(8) bien, sino a fuera

 80484e9:	83 7d ec 08          	cmp    DWORD PTR [ebp-0x14],0x8
 80484ed:	74 07                	je     80484f6 <check_password+0x2b> ;si son iguales skip

 80484ef:	b8 00 00 00 00       	mov    eax,0x0 ;carga el 0 para hacer el return
 80484f4:	eb 34                	jmp    804852a <check_password+0x5f> ;return 0

 80484f6:	c6 45 f7 00          	mov    BYTE PTR [ebp-0x9],0x0 ;inicializa en 0
 80484fa:	eb 1f                	jmp    804851b <check_password+0x50> 

 80484fc:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8];Carga el puntero a la cadena de la contraseña en eax
 80484ff:	0f b6 00             	movzx  eax,BYTE PTR [eax];Carga el primer carácter de la contraseña en eax
 8048502:	3a 45 f7             	cmp    al,BYTE PTR [ebp-0x9];Compara este carácter con el carácter previo almacenado
 8048505:	7d 07                	jge    804850e <check_password+0x43>;Si el carácter actual es mayor o igual al anterior, hace el salto

 8048507:	b8 00 00 00 00       	mov    eax,0x0;el caracter era menor q el anterior
 804850c:	eb 1c                	jmp    804852a <check_password+0x5f> ;return 0

 804850e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 8048511:	0f b6 00             	movzx  eax,BYTE PTR [eax];Carga el carácter actual
 8048514:	88 45 f7             	mov    BYTE PTR [ebp-0x9],al;Guarda este carácter en la variable temporal
 8048517:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1;Avanza al siguiente carecter

 804851b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8];
 804851e:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 8048521:	84 c0                	test   al,al ;verifica si es NULL
 8048523:	75 d7                	jne    80484fc <check_password+0x31>
 8048525:	b8 01 00 00 00       	mov    eax,0x1
 804852a:	c9                   	leave
 804852b:	c3                   	ret

0804852c <main>:
 804852c:	8d 4c 24 04          	lea    ecx,[esp+0x4]
 8048530:	83 e4 f0             	and    esp,0xfffffff0
 8048533:	ff 71 fc             	push   DWORD PTR [ecx-0x4]
 8048536:	55                   	push   ebp
 8048537:	89 e5                	mov    ebp,esp
 8048539:	51                   	push   ecx
 804853a:	83 ec 44             	sub    esp,0x44
 804853d:	83 ec 0c             	sub    esp,0xc
 8048540:	68 30 86 04 08       	push   0x8048630
 8048545:	e8 26 fe ff ff       	call   8048370 <printf@plt>
 804854a:	83 c4 10             	add    esp,0x10
 804854d:	83 ec 08             	sub    esp,0x8
 8048550:	8d 45 da             	lea    eax,[ebp-0x26]
 8048553:	50                   	push   eax
 8048554:	68 47 86 04 08       	push   0x8048647
 8048559:	e8 52 fe ff ff       	call   80483b0 <__isoc99_scanf@plt>
 804855e:	83 c4 10             	add    esp,0x10
 8048561:	83 ec 0c             	sub    esp,0xc
 8048564:	8d 45 da             	lea    eax,[ebp-0x26]
 8048567:	50                   	push   eax
 8048568:	e8 5e ff ff ff       	call   80484cb <check_password>
 804856d:	83 c4 10             	add    esp,0x10
 8048570:	85 c0                	test   eax,eax
 8048572:	74 12                	je     8048586 <main+0x5a>
 8048574:	83 ec 0c             	sub    esp,0xc
 8048577:	68 4a 86 04 08       	push   0x804864a
 804857c:	e8 ff fd ff ff       	call   8048380 <puts@plt>
 8048581:	83 c4 10             	add    esp,0x10
 8048584:	eb 10                	jmp    8048596 <main+0x6a>
 8048586:	83 ec 0c             	sub    esp,0xc
 8048589:	68 5e 86 04 08       	push   0x804865e
 804858e:	e8 ed fd ff ff       	call   8048380 <puts@plt>
 8048593:	83 c4 10             	add    esp,0x10
 8048596:	b8 00 00 00 00       	mov    eax,0x0
 804859b:	8b 4d fc             	mov    ecx,DWORD PTR [ebp-0x4]
 804859e:	c9                   	leave
 804859f:	8d 61 fc             	lea    esp,[ecx-0x4]
 80485a2:	c3                   	ret
 80485a3:	66 90                	xchg   ax,ax
 80485a5:	66 90                	xchg   ax,ax
 80485a7:	66 90                	xchg   ax,ax
 80485a9:	66 90                	xchg   ax,ax
 80485ab:	66 90                	xchg   ax,ax
 80485ad:	66 90                	xchg   ax,ax
 80485af:	90                   	nop