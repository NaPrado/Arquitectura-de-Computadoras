	.file	"4.c"
	.intel_syntax noprefix
	.text
	.globl	fooFighters
	.type	fooFighters, @function
fooFighters:
	push	ebp
	mov	ebp, esp
	push	edi
	sub	esp, 100
	call	__x86.get_pc_thunk.ax
	add	eax, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	eax, DWORD PTR gs:20
	mov	DWORD PTR -12[ebp], eax
	xor	eax, eax
	lea	edx, -92[ebp]
	mov	eax, 0
	mov	ecx, 20
	mov	edi, edx
	rep stosd
	mov	DWORD PTR -52[ebp], 1
	nop
	mov	edx, DWORD PTR -12[ebp]
	sub	edx, DWORD PTR gs:20
	je	.L2
	call	__stack_chk_fail_local
.L2:
	mov	edi, DWORD PTR -4[ebp]
	leave
	ret
	.size	fooFighters, .-fooFighters
	.section	.text.__x86.get_pc_thunk.ax,"axG",@progbits,__x86.get_pc_thunk.ax,comdat
	.globl	__x86.get_pc_thunk.ax
	.hidden	__x86.get_pc_thunk.ax
	.type	__x86.get_pc_thunk.ax, @function
__x86.get_pc_thunk.ax:
	mov	eax, DWORD PTR [esp]
	ret
	.hidden	__stack_chk_fail_local
	.ident	"GCC: (Ubuntu 13.2.0-23ubuntu4) 13.2.0"
	.section	.note.GNU-stack,"",@progbits
