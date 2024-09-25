	.file	"3.c"
	.intel_syntax noprefix
	.text
	.globl	fooFighters
	.type	fooFighters, @function
fooFighters:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 96
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	mov	DWORD PTR -56[rbp], 1
	nop
	mov	rdx, QWORD PTR -8[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L2
	call	__stack_chk_fail@PLT
.L2:
	leave
	ret
	.size	fooFighters, .-fooFighters
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
