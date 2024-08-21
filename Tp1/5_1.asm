080484cb <fillpassword>:
 80484cb:	55                   	push   ebp
 80484cc:	89 e5                	mov    ebp,esp

 80484ce:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
;en eax se carga el primer valor de la pila
 80484d1:	c6 00 53             	mov    BYTE PTR [eax],0x53
;resulta que era un puntero en el cual se carga 0x53 (S)
 80484d4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
;no afecta?
 80484d7:	83 c0 01             	add    eax,0x1
;eax se mueve a la siguiente posision
 80484da:	c6 00 30             	mov    BYTE PTR [eax],0x30
;le cargo 0x30 (0)
 80484dd:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 80484e0:	83 c0 02             	add    eax,0x2
;avanzo un lugar en el "vector"
 80484e3:	c6 00 52             	mov    BYTE PTR [eax],0x52
;cargo 0x52 (R)
 80484e6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 80484e9:	83 c0 03             	add    eax,0x3
;avanzo un lugar en el "vector"
 80484ec:	c6 00 50             	mov    BYTE PTR [eax],0x50
;cargo 0x50 (P)
 80484ef:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 80484f2:	83 c0 04             	add    eax,0x4
;avanzo un lugar en el "vector"
 80484f5:	c6 00 52             	mov    BYTE PTR [eax],0x52
;cargo 0x52 (R)
 80484f8:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 80484fb:	83 c0 05             	add    eax,0x5
;avanzo un lugar en el "vector"
 80484fe:	c6 00 33             	mov    BYTE PTR [eax],0x33
;cargo 0x33 (3)
 8048501:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 8048504:	83 c0 06             	add    eax,0x6
;avanzo un lugar en el "vector"
 8048507:	c6 00 53             	mov    BYTE PTR [eax],0x53
;cargo 0x53 (S)
 804850a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 804850d:	83 c0 07             	add    eax,0x7
;avanzo un lugar en el "vector"
 8048510:	c6 00 34             	mov    BYTE PTR [eax],0x34
;cargo 0x34 (4)
 8048513:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 8048516:	83 c0 08             	add    eax,0x8
;avanzo un lugar en el "vector"
 8048519:	c6 00 00             	mov    BYTE PTR [eax],0x0
;en ultima posision pone un 0 
 804851c:	90                   	nop
 804851d:	5d                   	pop    ebp
 804851e:	c3                   	ret
