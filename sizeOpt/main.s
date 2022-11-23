	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"Print accuracy < %f and > 10^-15 \n"
.LC2:
	.string	"%lf"
.LC4:
	.string	"r"
.LC5:
	.string	"input.txt"
.LC10:
	.string	"w"
.LC11:
	.string	"output.txt"
.LC12:
	.string	"time spent: %lf sec\n"
.LC13:
	.string	"exp = %.15lf \n"
.LC14:
	.string	"accuracy = %.15lf \n"
	.section	.text.startup.main,"ax",@progbits
	.globl	main
	.type	main, @function
main:
	endbr64
	push	r14
	push	r13
	push	r12
	push	rbp
	mov	ebp, edi
	push	rbx
	mov	rbx, rsi
	sub	rsp, 16
	dec	edi
	jle	.L20
	mov	rdi, QWORD PTR 8[rsi]
	call	atoi@PLT
	test	eax, eax
	jne	.L3
.L20:
	mov	rax, QWORD PTR .LC0[rip]
	lea	rsi, .LC1[rip]
	mov	edi, 1
	movq	xmm0, rax
	mov	al, 1
	call	__printf_chk@PLT
	xor	eax, eax
	lea	rsi, 8[rsp]
	lea	rdi, .LC2[rip]
	call	__isoc99_scanf@PLT
	movsd	xmm0, QWORD PTR 8[rsp]
	comisd	xmm0, QWORD PTR .LC0[rip]
	ja	.L20
	movsd	xmm1, QWORD PTR .LC3[rip]
	comisd	xmm1, xmm0
	ja	.L20
	jmp	.L5
.L3:
	cmp	eax, 1
	jne	.L6
	cmp	ebp, 2
	lea	rdi, .LC5[rip]
	lea	rsi, .LC4[rip]
	je	.L23
	mov	rdi, QWORD PTR 16[rbx]
.L23:
	call	fopen@PLT
	mov	rdi, rax
	test	rax, rax
	jne	.L9
.L11:
	mov	eax, 1
	jmp	.L1
.L9:
	xor	eax, eax
	lea	rdx, 8[rsp]
	lea	rsi, .LC2[rip]
	call	__isoc99_fscanf@PLT
	movsd	xmm0, QWORD PTR 8[rsp]
	comisd	xmm0, QWORD PTR .LC0[rip]
	ja	.L11
	movsd	xmm1, QWORD PTR .LC3[rip]
	comisd	xmm1, xmm0
	jbe	.L5
	jmp	.L11
.L6:
	cmp	eax, 2
	jne	.L5
	xor	edi, edi
	call	time@PLT
	mov	edi, eax
	call	srand@PLT
	call	rand@PLT
	cvtsi2sd	xmm0, eax
	divsd	xmm0, QWORD PTR .LC6[rip]
	cvttsd2si	eax, xmm0
	cvtsi2sd	xmm1, eax
	subsd	xmm0, xmm1
	divsd	xmm0, QWORD PTR .LC7[rip]
	addsd	xmm0, QWORD PTR .LC8[rip]
	movsd	QWORD PTR 8[rsp], xmm0
.L5:
	call	clock@PLT
	mov	r13d, 200000000
	mov	r12, rax
.L13:
	movsd	xmm0, QWORD PTR 8[rsp]
	call	countExp@PLT
	movq	r14, xmm0
	dec	r13d
	jne	.L13
	call	clock@PLT
	sub	rax, r12
	cvtsi2sd	xmm0, rax
	divsd	xmm0, QWORD PTR .LC9[rip]
	movq	r12, xmm0
	cmp	ebp, 1
	jle	.L14
	mov	rdi, QWORD PTR 8[rbx]
	call	atoi@PLT
	dec	eax
	jne	.L14
	cmp	ebp, 3
	lea	rdi, .LC11[rip]
	lea	rsi, .LC10[rip]
	jle	.L24
	mov	rdi, QWORD PTR 24[rbx]
.L24:
	call	fopen@PLT
	mov	rbp, rax
	test	rax, rax
	je	.L11
	movq	xmm0, r12
	mov	rdi, rax
	mov	esi, 1
	mov	al, 1
	lea	rdx, .LC12[rip]
	call	__fprintf_chk@PLT
	movq	xmm0, r14
	mov	rdi, rbp
	mov	al, 1
	lea	rdx, .LC13[rip]
	mov	esi, 1
	call	__fprintf_chk@PLT
	movsd	xmm0, QWORD PTR 8[rsp]
	mov	rdi, rbp
	mov	al, 1
	lea	rdx, .LC14[rip]
	mov	esi, 1
	call	__fprintf_chk@PLT
	jmp	.L25
.L14:
	movq	xmm0, r12
	lea	rsi, .LC12[rip]
	mov	edi, 1
	mov	al, 1
	call	__printf_chk@PLT
	movq	xmm0, r14
	lea	rsi, .LC13[rip]
	mov	al, 1
	mov	edi, 1
	call	__printf_chk@PLT
	movsd	xmm0, QWORD PTR 8[rsp]
	lea	rsi, .LC14[rip]
	mov	al, 1
	mov	edi, 1
	call	__printf_chk@PLT
.L25:
	xor	eax, eax
.L1:
	add	rsp, 16
	pop	rbx
	pop	rbp
	pop	r12
	pop	r13
	pop	r14
	ret
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1071644672
	.align 8
.LC3:
	.long	-1629006314
	.long	1020396463
	.align 8
.LC6:
	.long	0
	.long	1084847616
	.align 8
.LC7:
	.long	0
	.long	1074266112
	.align 8
.LC8:
	.long	-2036257893
	.long	1023837339
	.align 8
.LC9:
	.long	0
	.long	1093567616
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
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
