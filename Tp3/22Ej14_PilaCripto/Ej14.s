	.file	"Ej14.c"
	.intel_syntax noprefix
	.text
	.globl	encrypt
	.type	encrypt, @function
encrypt:
	push	ebp
	mov	ebp, esp
	push	ebx
	sub	esp, 20
	call	__x86.get_pc_thunk.ax
	add	eax, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	edx, DWORD PTR 8[ebp]
	movzx	edx, BYTE PTR [edx]
	test	dl, dl
	jne	.L2
	mov	eax, DWORD PTR 12[ebp]
	mov	BYTE PTR [eax], 0
	jmp	.L1
.L2:
	mov	ebx, eax
	call	get_pad@PLT
	mov	BYTE PTR -9[ebp], al
	mov	eax, DWORD PTR 8[ebp]
	movzx	eax, BYTE PTR [eax]
	mov	edx, eax
	movzx	eax, BYTE PTR -9[ebp]
	add	eax, edx
	mov	edx, eax
	mov	eax, DWORD PTR 12[ebp]
	mov	BYTE PTR [eax], dl
	mov	eax, DWORD PTR 12[ebp]
	lea	edx, 1[eax]
	mov	eax, DWORD PTR 8[ebp]
	add	eax, 1
	sub	esp, 8
	push	edx
	push	eax
	call	encrypt
	add	esp, 16
.L1:
	mov	ebx, DWORD PTR -4[ebp]
	leave
	ret
	.size	encrypt, .-encrypt
	.section	.rodata
.LC0:
	.string	"Ark"
	.text
	.globl	test
	.type	test, @function
test:
	push	ebp
	mov	ebp, esp
	push	ebx
	sub	esp, 36
	call	__x86.get_pc_thunk.bx
	add	ebx, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	eax, DWORD PTR gs:20
	mov	DWORD PTR -12[ebp], eax
	xor	eax, eax
	lea	eax, .LC0@GOTOFF[ebx]
	mov	DWORD PTR -28[ebp], eax
	mov	DWORD PTR -21[ebp], 757935405
	mov	DWORD PTR -17[ebp], 757935405
	mov	BYTE PTR -13[ebp], 0
	mov	BYTE PTR -17[ebp], 48
	sub	esp, 8
	lea	eax, -21[ebp]
	push	eax
	push	DWORD PTR -28[ebp]
	call	encrypt
	add	esp, 16
	sub	esp, 12
	lea	eax, -21[ebp]
	push	eax
	call	printf@PLT
	add	esp, 16
	nop
	mov	eax, DWORD PTR -12[ebp]
	sub	eax, DWORD PTR gs:20
	je	.L5
	call	__stack_chk_fail_local
.L5:
	mov	ebx, DWORD PTR -4[ebp]
	leave
	ret
	.size	test, .-test
	.section	.text.__x86.get_pc_thunk.ax,"axG",@progbits,__x86.get_pc_thunk.ax,comdat
	.globl	__x86.get_pc_thunk.ax
	.hidden	__x86.get_pc_thunk.ax
	.type	__x86.get_pc_thunk.ax, @function
__x86.get_pc_thunk.ax:
	mov	eax, DWORD PTR [esp]
	ret
	.section	.text.__x86.get_pc_thunk.bx,"axG",@progbits,__x86.get_pc_thunk.bx,comdat
	.globl	__x86.get_pc_thunk.bx
	.hidden	__x86.get_pc_thunk.bx
	.type	__x86.get_pc_thunk.bx, @function
__x86.get_pc_thunk.bx:
	mov	ebx, DWORD PTR [esp]
	ret
	.hidden	__stack_chk_fail_local
	.ident	"GCC: (Ubuntu 13.2.0-23ubuntu4) 13.2.0"
	.section	.note.GNU-stack,"",@progbits
