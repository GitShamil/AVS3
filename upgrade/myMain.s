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
.LC15:
	.string	"exp = %.15lf \n"
.LC16:
	.string	"accuracy = %.15lf \n"
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp				# start of programm
	mov	rbp, rsp
	sub	rsp, 96
	mov	DWORD PTR -84[rbp], edi		# -84[rbp] = argc
	mov	QWORD PTR -96[rbp], rsi		# -96[rbp] = argv
	cmp	DWORD PTR -84[rbp], 1		# compare argc and 1, if argc<=1 then input from console
	jle	.L4				# if (argc<2) then input from console
	mov	rax, QWORD PTR -96[rbp]		
	add	rax, 8
	mov	rdi, QWORD PTR [rax]		# rax = argv[1]
	call	atoi@PLT			# eax = argv[1]
	test	eax, eax
	jne	.L3				# if abs(argv[1]) !=0
.L4:						# input from console
	movq	xmm0, QWORD PTR .LC0[rip]	# xmm0 = max_accuracy 0.5
	lea	rdi, .LC1[rip]
	mov	eax, 1				# show that there's some double parametres in function
	call	printf@PLT
	lea	rsi, -72[rbp]			# accuracy = -72[rbp]
	lea	rdi, .LC2[rip]			
	mov	eax, 0
	call	__isoc99_scanf@PLT
	movsd	xmm0, QWORD PTR -72[rbp]	# xmm0 = accuracy
	comisd	xmm0, QWORD PTR .LC0[rip]	# compare accuracy and max_accuracy
	ja	.L4				# if accuracy > max_accuracy then go cycle again
	movsd	xmm1, QWORD PTR -72[rbp]	
	movsd	xmm0, QWORD PTR .LC3[rip]
	comisd	xmm0, xmm1			# compare 1e-15 and accuracy
	ja	.L4
	jmp	.L5
.L3:
	mov	rax, QWORD PTR -96[rbp]
	add	rax, 8
	mov	rdi, QWORD PTR [rax]		# rdi = argv[1]
	call	atoi@PLT
	cmp	eax, 1				# argv[1] == 1
	jne	.L6			
	cmp	DWORD PTR -84[rbp], 2		# start input from file
	jle	.L7
	mov	rax, QWORD PTR -96[rbp]
	add	rax, 16				
	mov	rax, QWORD PTR [rax]		# rax = argv[2]
	lea	rdx, .LC4[rip]
	mov	rsi, rdx			# rsi = "r"
	mov	rdi, rax			# rdi = argv[2]
	call	fopen@PLT			# open file
	mov	QWORD PTR -24[rbp], rax
	jmp	.L8
.L7:						# standart input.txt
	lea	rsi, .LC4[rip]			# "r"
	lea	rdi, .LC5[rip]			# "input.txt"
	call	fopen@PLT
	mov	QWORD PTR -24[rbp], rax
.L8:
	cmp	QWORD PTR -24[rbp], 0		# compare input and 0
	jne	.L9	
	mov	eax, 1				# if input = 0 then file didn't open then return 1
	jmp	.L19
.L9:
	lea	rdx, -72[rbp]			# rdx = accuracy
	mov	rdi, QWORD PTR -24[rbp]		# rdi = input
	lea	rsi, .LC2[rip]		
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	movsd	xmm0, QWORD PTR -72[rbp]	# xmm0 = accuracy
	comisd	xmm0, QWORD PTR .LC0[rip]	# compare accuracy and max_accuracy
	ja	.L11
	movsd	xmm1, QWORD PTR -72[rbp]
	movsd	xmm0, QWORD PTR .LC3[rip]
	comisd	xmm0, xmm1			# compare accuracy and 1e-15
	jbe	.L5
.L11:
	mov	eax, 1
	jmp	.L19				# if accuracy isn't available then return 1
.L6:
	mov	rax, QWORD PTR -96[rbp]		# input from random
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
	pxor	xmm0, xmm0			# xmm0 = 0
	cvtsi2sd	xmm0, eax		# xmm0 = double(eax)
	movsd	QWORD PTR -40[rbp], xmm0	# rand_number = xmm0
	movsd	xmm1, QWORD PTR .LC6[rip]	# xmm1 = 3259.0
	divsd	xmm0, xmm1			# xmm0 = rand_number / 3259.0
	movsd	xmm1, QWORD PTR -40[rbp]	# xmm1 = rand_number
	movsd	xmm2, QWORD PTR .LC6[rip]
	divsd	xmm1, xmm2			# xmm1 = rand_number /3259.0
	cvttsd2si	eax, xmm1		# eax = int(xmm1)
	pxor	xmm1, xmm1			# xmm1 = 0
	cvtsi2sd	xmm1, eax		# xmm1 = int(rand_number /3259.0)
	subsd	xmm0, xmm1			# xmm0 -= xmm1
	movsd	xmm2, QWORD PTR .LC7[rip]	# xmm2 = 3.0
	movapd	xmm1, xmm0			
	divsd	xmm1, xmm2			# xmm1 / 3.0
	movsd	xmm0, QWORD PTR .LC8[rip]	# 1e-14
	addsd	xmm0, xmm1			# xmm1 + 1e-14
	movsd	QWORD PTR -72[rbp], xmm0	# accuracy = ...
.L5:
	call	clock@PLT
	mov	QWORD PTR -48[rbp], rax		# begin = clock()
	mov	r12d, 0				# i = 0
	jmp	.L13
.L14:
	movq	xmm0, QWORD PTR -72[rbp]	# xmm0 = accuracy 
	call	countExp@PLT			# call acuracy
	movq	QWORD PTR -16[rbp], xmm0	# exp = countExp(accuracy)
	add	r12d, 1				#++i
.L13:
	cmp	r12d, 199999999
	jle	.L14
	call	clock@PLT
	mov	QWORD PTR -56[rbp], rax		# end = clock()
	sub	rax, QWORD PTR -48[rbp]		# rax = end - begin
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, rax
	movsd	xmm1, QWORD PTR .LC9[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -64[rbp], xmm0	# time_spent = end - begin
	cmp	DWORD PTR -84[rbp], 1		# compare argc and 1
	jle	.L15				# if <= then go output to console
	mov	rax, QWORD PTR -96[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	cmp	eax, 1
	jne	.L15				# if argv[1] != 1 then output to console
	cmp	DWORD PTR -84[rbp], 3		# compare argc and 3
	jle	.L16				
	mov	rax, QWORD PTR -96[rbp]		# output fron console arguments
	add	rax, 24
	mov	rdi, QWORD PTR [rax]		# rax = argv[3]
	lea	rsi, .LC10[rip]			# rsi = "w"
	call	fopen@PLT
	mov	QWORD PTR -32[rbp], rax		#
	jmp	.L17
.L16:						# output.txt
	lea	rsi, .LC10[rip]			# "w"	
	lea	rdi, .LC11[rip]			# output.txt
	call	fopen@PLT
	mov	QWORD PTR -32[rbp], rax		# output = fopen
.L17:
	cmp	QWORD PTR -32[rbp], 0		# compare output and 0 for cheking that file opened well
	jne	.L18
	mov	eax, 1
	jmp	.L19
.L18:
	movq	xmm0, QWORD PTR -64[rbp]	# xmm0 = time_spent
	mov	rdi, QWORD PTR -32[rbp]		# rdi = output
	lea	rsi, .LC12[rip]			# rsi = "time spent..."
	mov	eax, 1				# show that there are double arguments	
	call	fprintf@PLT
	movq	xmm0, QWORD PTR -16[rbp]	# xmm0 = exp
	mov	rdi, QWORD PTR -32[rbp]		# rdi = ouput
	lea	rsi, .LC15[rip]			# exp spent...
	mov	eax, 1				#  show that there are double arguments	
	call	fprintf@PLT
	movq	xmm0, QWORD PTR -72[rbp]	# xmm0 = accuracy 
	mov	rdi, QWORD PTR -32[rbp]		# rdi = output
	lea	rsi, .LC16[rip]			# rdx = "accuracy is ..."
	mov	eax, 1				#  show that there are double arguments	
	call	fprintf@PLT
	mov	eax, 0
	jmp	.L19
.L15:
	movq	xmm0, QWORD PTR -64[rbp]	# the same thing with console
	lea	rdi, .LC12[rip]
	mov	eax, 1				# show that there are double arguments	
	call	printf@PLT			
	movq	xmm0, QWORD PTR -16[rbp]
	lea	rdi, .LC15[rip]
	mov	eax, 1				# show that there are double arguments	
	call	printf@PLT
	movq	xmm0, QWORD PTR -72[rbp]	
	lea	rdi, .LC16[rip]
	mov	eax, 1				# show that there are double arguments	
	call	printf@PLT
	mov	eax, 0
.L19:
	leave
	ret
.LC0:
	.long	0
	.long	1071644672
.LC3:
	.long	-1629006314
	.long	1020396463
.LC6:
	.long	0
	.long	1084847616
.LC7:
	.long	0
	.long	1074266112
.LC8:
	.long	-2036257893
	.long	1023837339
.LC9:
	.long	0
	.long	1093567616
