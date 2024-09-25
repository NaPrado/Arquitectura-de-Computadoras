	.file	"6.c"
	.intel_syntax noprefix
	.text
	.globl	arr
	.data
	.align 8
	.type	arr, @object
	.size	arr, 12
arr:
	.long	13
	.long	10
	.long	2002
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
