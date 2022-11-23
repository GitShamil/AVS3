	.file	"countExp.c"
	.intel_syntax noprefix
	.text
	.globl	countExp
	.type	countExp, @function
countExp:
	endbr64
	push	rbp
	mov	rbp, rsp
	movsd 	xmm3, QWORD PTR .LC1[rip]	#xmm3 = 1.0
	movsd 	xmm4, QWORD PTR .LC2[rip]	# xmm4 = 4.0
	movsd	xmm5, xmm0			#xmm5 = accuracy
	pxor	xmm0, xmm0			
	movsd	xmm6, xmm0			# exp = 0
	mov	r13d, 1				# n = 1
	movsd	xmm7, xmm3			# xmm7 = fact = 1.0

	jmp	.L2
.L3:
	movsd	xmm0, xmm3			# xmm0 = 1.0
	divsd	xmm0, xmm7			# xmm0 = 1.0 / fact
	addsd	xmm6, xmm0			# exp += xmm0
	cvtsi2sd	xmm0, r13d		# xmm0 = double(r13d)
	mulsd	xmm7, xmm0			# xmm7 *= n
	add	r13d, 1				# ++n
.L2:
	movsd	xmm0, xmm4			# xmm0 =4
	divsd	xmm0, xmm7			# xmm0 /= fact
	comisd	xmm0, xmm5			# compare xmm0 and accuracy
	ja	.L3				# if xmm0 > accuracy then continue cycle
	movsd	xmm0, xmm6
	movq	rax, xmm0
	movq	xmm0, rax
	pop	rbp
	ret
.LC1:
	.long	0
	.long	1072693248
.LC2:
	.long	0
	.long	1074790400
