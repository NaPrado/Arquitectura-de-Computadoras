	.file	"structPorCopia.c"
	.intel_syntax noprefix
	.text
	.globl	foo
	.type	foo, @function
foo:
	push	ebp
	mov	ebp, esp
	call	__x86.get_pc_thunk.ax
	add	eax, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	ecx, DWORD PTR 8[ebp]
	mov	eax, DWORD PTR 12[ebp]
	mov	edx, DWORD PTR 16[ebp]
	mov	DWORD PTR [ecx], eax
	mov	DWORD PTR 4[ecx], edx
	mov	eax, DWORD PTR 8[ebp]
	pop	ebp
	ret	4
	.size	foo, .-foo
	.globl	main
	.type	main, @function
main:
	lea	ecx, 4[esp]
	and	esp, -16
	push	DWORD PTR -4[ecx]
	push	ebp
	mov	ebp, esp
	push	ecx
	sub	esp, 36
	call	__x86.get_pc_thunk.ax
	add	eax, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	eax, ecx
	mov	eax, DWORD PTR 4[eax]
	mov	DWORD PTR -28[ebp], eax
	mov	eax, DWORD PTR gs:20
	mov	DWORD PTR -12[ebp], eax
	xor	eax, eax
	mov	DWORD PTR -20[ebp], 10
	mov	DWORD PTR -16[ebp], 11
	lea	eax, -40[ebp]
	push	DWORD PTR -16[ebp]
	push	DWORD PTR -20[ebp]
	push	eax
	call	foo
	add	esp, 8
	mov	eax, 0
	mov	edx, DWORD PTR -12[ebp]
	sub	edx, DWORD PTR gs:20
	je	.L5
	call	__stack_chk_fail_local
.L5:
	mov	ecx, DWORD PTR -4[ebp]
	leave
	lea	esp, -4[ecx]
	ret
	.size	main, .-main
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
