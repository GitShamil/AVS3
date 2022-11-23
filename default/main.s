	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
	.align 8
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
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 96
	mov	DWORD PTR -84[rbp], edi
	mov	QWORD PTR -96[rbp], rsi
	cmp	DWORD PTR -84[rbp], 1
	jle	.L4
	mov	rax, QWORD PTR -96[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	test	eax, eax
	jne	.L3
.L4:
	mov	rax, QWORD PTR .LC0[rip]
	movq	xmm0, rax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 1
	call	printf@PLT
	lea	rax, -72[rbp]
	mov	rsi, rax
	lea	rax, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	movsd	xmm0, QWORD PTR -72[rbp]
	comisd	xmm0, QWORD PTR .LC0[rip]
	ja	.L4
	movsd	xmm1, QWORD PTR -72[rbp]
	movsd	xmm0, QWORD PTR .LC3[rip]
	comisd	xmm0, xmm1
	ja	.L4
	jmp	.L5
.L3:
	mov	rax, QWORD PTR -96[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	cmp	eax, 1
	jne	.L6
	cmp	DWORD PTR -84[rbp], 2
	jle	.L7
	mov	rax, QWORD PTR -96[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC4[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -24[rbp], rax
	jmp	.L8
.L7:
	lea	rax, .LC4[rip]
	mov	rsi, rax
	lea	rax, .LC5[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -24[rbp], rax
.L8:
	cmp	QWORD PTR -24[rbp], 0
	jne	.L9
	mov	eax, 1
	jmp	.L19
.L9:
	lea	rdx, -72[rbp]
	mov	rax, QWORD PTR -24[rbp]
	lea	rcx, .LC2[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	movsd	xmm0, QWORD PTR -72[rbp]
	comisd	xmm0, QWORD PTR .LC0[rip]
	ja	.L11
	movsd	xmm1, QWORD PTR -72[rbp]
	movsd	xmm0, QWORD PTR .LC3[rip]
	comisd	xmm0, xmm1
	jbe	.L5
.L11:
	mov	eax, 1
	jmp	.L19
.L6:
	mov	rax, QWORD PTR -96[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	cmp	eax, 2
	jne	.L5
	mov	edi, 0
	call	time@PLT
	mov	edi, eax
	call	srand@PLT
	call	rand@PLT
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	movsd	QWORD PTR -40[rbp], xmm0
	movsd	xmm0, QWORD PTR -40[rbp]
	movsd	xmm1, QWORD PTR .LC6[rip]
	divsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR -40[rbp]
	movsd	xmm2, QWORD PTR .LC6[rip]
	divsd	xmm1, xmm2
	cvttsd2si	eax, xmm1
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, eax
	subsd	xmm0, xmm1
	movsd	xmm2, QWORD PTR .LC7[rip]
	movapd	xmm1, xmm0
	divsd	xmm1, xmm2
	movsd	xmm0, QWORD PTR .LC8[rip]
	addsd	xmm0, xmm1
	movsd	QWORD PTR -72[rbp], xmm0
.L5:
	call	clock@PLT
	mov	QWORD PTR -48[rbp], rax
	mov	DWORD PTR -4[rbp], 0
	jmp	.L13
.L14:
	mov	rax, QWORD PTR -72[rbp]
	movq	xmm0, rax
	call	countExp@PLT
	movq	rax, xmm0
	mov	QWORD PTR -16[rbp], rax
	add	DWORD PTR -4[rbp], 1
.L13:
	cmp	DWORD PTR -4[rbp], 199999999
	jle	.L14
	call	clock@PLT
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR -56[rbp]
	sub	rax, QWORD PTR -48[rbp]
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, rax
	movsd	xmm1, QWORD PTR .LC9[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -64[rbp], xmm0
	cmp	DWORD PTR -84[rbp], 1
	jle	.L15
	mov	rax, QWORD PTR -96[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	cmp	eax, 1
	jne	.L15
	cmp	DWORD PTR -84[rbp], 3
	jle	.L16
	mov	rax, QWORD PTR -96[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC10[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -32[rbp], rax
	jmp	.L17
.L16:
	lea	rax, .LC10[rip]
	mov	rsi, rax
	lea	rax, .LC11[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -32[rbp], rax
.L17:
	cmp	QWORD PTR -32[rbp], 0
	jne	.L18
	mov	eax, 1
	jmp	.L19
.L18:
	mov	rdx, QWORD PTR -64[rbp]
	mov	rax, QWORD PTR -32[rbp]
	movq	xmm0, rdx
	lea	rdx, .LC12[rip]
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -32[rbp]
	movq	xmm0, rdx
	lea	rdx, .LC13[rip]
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
	mov	rdx, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR -32[rbp]
	movq	xmm0, rdx
	lea	rdx, .LC14[rip]
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
	mov	eax, 0
	jmp	.L19
.L15:
	mov	rax, QWORD PTR -64[rbp]
	movq	xmm0, rax
	lea	rax, .LC12[rip]
	mov	rdi, rax
	mov	eax, 1
	call	printf@PLT
	mov	rax, QWORD PTR -16[rbp]
	movq	xmm0, rax
	lea	rax, .LC13[rip]
	mov	rdi, rax
	mov	eax, 1
	call	printf@PLT
	mov	rax, QWORD PTR -72[rbp]
	movq	xmm0, rax
	lea	rax, .LC14[rip]
	mov	rdi, rax
	mov	eax, 1
	call	printf@PLT
	mov	eax, 0
.L19:
	leave
	ret
	.size	main, .-main
	.section	.rodata
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
