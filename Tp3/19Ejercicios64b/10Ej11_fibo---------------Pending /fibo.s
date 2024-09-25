	.file	"fibo.c"
	.intel_syntax noprefix
	.text
	.globl	fibo
	.type	fibo, @function
fibo:
	endbr64
	push	rbp
	mov	rbp, rsp
	push	rbx
	sub	rsp, 24
	mov	DWORD PTR -20[rbp], edi
	cmp	DWORD PTR -20[rbp], 0
	jne	.L2
	mov	eax, 0
	jmp	.L3
.L2:
	cmp	DWORD PTR -20[rbp], 1
	jne	.L4
	mov	eax, 1
	jmp	.L3
.L4:
	mov	eax, DWORD PTR -20[rbp]
	sub	eax, 1
	mov	edi, eax
	call	fibo
	mov	ebx, eax
	mov	eax, DWORD PTR -20[rbp]
	sub	eax, 2
	mov	edi, eax
	call	fibo
	add	eax, ebx
.L3:
	mov	rbx, QWORD PTR -8[rbp]
	leave
	ret
	.size	fibo, .-fibo
	.ident	"GCC: (Ubuntu 13.2.0-23ubuntu4) 13.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
