	.file	"6.c"
	.intel_syntax noprefix
	.text
	.data
	.align 4
	.type	numero, @object
	.size	numero, 4
numero:
	.long	10
	.text
	.globl	foo
	.type	foo, @function
foo:
	endbr64
	push	rbp
	mov	rbp, rsp
	mov	DWORD PTR numero[rip], 20
	nop
	pop	rbp
	ret
	.size	foo, .-foo
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
