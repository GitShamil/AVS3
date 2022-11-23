	.file	"countExp.c"
	.intel_syntax noprefix
	.text
	.section	.text.countExp,"ax",@progbits
	.globl	countExp
	.type	countExp, @function
countExp:
	endbr64
	movsd	xmm1, QWORD PTR .LC0[rip]
	movsd	xmm4, QWORD PTR .LC2[rip]
	movaps	xmm2, xmm0
	mov	eax, 1
	xorps	xmm0, xmm0
	movaps	xmm5, xmm1
.L2:
	movaps	xmm3, xmm4
	divsd	xmm3, xmm1
	comisd	xmm3, xmm2
	jbe	.L5
	movaps	xmm3, xmm5
	divsd	xmm3, xmm1
	addsd	xmm0, xmm3
	cvtsi2sd	xmm3, eax
	inc	eax
	mulsd	xmm1, xmm3
	jmp	.L2
.L5:
	ret
	.size	countExp, .-countExp
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1072693248
	.align 8
.LC2:
	.long	0
	.long	1074790400
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
