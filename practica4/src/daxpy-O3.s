	.file	"daxpy.c"
	.text
	.p2align 4,,15
	.globl	daxpy
	.type	daxpy, @function
daxpy:
.LFB39:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movq	%r9, %r14
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movl	%edx, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movl	%ecx, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rsi, %rbp
	movq	%r8, %rsi
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	%rdi, %rbx
	xorl	%edi, %edi
	subq	$16, %rsp
	.cfi_def_cfa_offset 64
	call	clock_gettime
	testl	%r12d, %r12d
	je	.L8
	leaq	16(%rbx), %rax
	cmpq	%rax, %rbp
	leaq	16(%rbp), %rax
	setnb	%dl
	cmpq	%rax, %rbx
	setnb	%al
	orb	%al, %dl
	je	.L3
	cmpl	$4, %r12d
	jbe	.L3
	movl	%r13d, 12(%rsp)
	movl	%r12d, %esi
	xorl	%eax, %eax
	movd	12(%rsp), %xmm6
	shrl	$2, %esi
	xorl	%edx, %edx
	leal	0(,%rsi,4), %ecx
	pshufd	$0, %xmm6, %xmm2
	movdqa	%xmm2, %xmm4
	psrlq	$32, %xmm4
.L9:
	movdqu	0(%rbp,%rax), %xmm1
	addl	$1, %edx
	movdqa	%xmm1, %xmm5
	psrlq	$32, %xmm1
	pmuludq	%xmm4, %xmm1
	pshufd	$8, %xmm1, %xmm1
	movdqu	(%rbx,%rax), %xmm3
	pmuludq	%xmm2, %xmm5
	pshufd	$8, %xmm5, %xmm0
	punpckldq	%xmm1, %xmm0
	paddd	%xmm3, %xmm0
	movdqu	%xmm0, (%rbx,%rax)
	addq	$16, %rax
	cmpl	%esi, %edx
	jb	.L9
	cmpl	%ecx, %r12d
	je	.L8
	movl	%ecx, %eax
	movl	0(%rbp,%rax,4), %edx
	imull	%r13d, %edx
	addl	%edx, (%rbx,%rax,4)
	leal	1(%rcx), %eax
	cmpl	%eax, %r12d
	jbe	.L8
	movl	0(%rbp,%rax,4), %edx
	addl	$2, %ecx
	imull	%r13d, %edx
	addl	%edx, (%rbx,%rax,4)
	cmpl	%ecx, %r12d
	jbe	.L8
	imull	0(%rbp,%rcx,4), %r13d
	addl	%r13d, (%rbx,%rcx,4)
.L8:
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	movq	%r14, %rsi
	xorl	%edi, %edi
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	jmp	clock_gettime
	.p2align 4,,10
	.p2align 3
.L3:
	.cfi_restore_state
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L11:
	movl	0(%rbp,%rax,4), %edx
	imull	%r13d, %edx
	addl	%edx, (%rbx,%rax,4)
	addq	$1, %rax
	cmpl	%eax, %r12d
	ja	.L11
	jmp	.L8
	.cfi_endproc
.LFE39:
	.size	daxpy, .-daxpy
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"ERROR: falta tam del vector y constante\n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"y[0] = %i, y[%i] = %i\n"
.LC3:
	.string	"\nTiempo (seg.) = %11.9f\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB40:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$56, %rsp
	.cfi_def_cfa_offset 96
	cmpl	$2, %edi
	jle	.L48
	movq	8(%rsi), %rdi
	movq	%rsi, %rbx
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	movq	16(%rbx), %rdi
	movq	%rax, %rbp
	xorl	%esi, %esi
	movl	%ebp, %r12d
	movl	$10, %edx
	salq	$2, %r12
	call	strtol
	movq	%r12, %rdi
	movq	%rax, %r13
	call	malloc
	movq	%r12, %rdi
	movq	%rax, %rbx
	call	malloc
	testl	%ebp, %ebp
	movq	%rax, %r12
	je	.L33
	movq	%rbx, %rcx
	movl	%ebp, %esi
	andl	$15, %ecx
	shrq	$2, %rcx
	negq	%rcx
	andl	$3, %ecx
	cmpl	%ecx, %ebp
	movl	%ecx, %eax
	cmovbe	%ebp, %eax
	cmpl	$5, %ebp
	ja	.L49
.L24:
	cmpl	$1, %esi
	movl	$2, (%rbx)
	movl	$0, (%r12)
	jbe	.L37
	cmpl	$2, %esi
	movl	$3, 4(%rbx)
	movl	$2, 4(%r12)
	jbe	.L38
	cmpl	$3, %esi
	movl	$4, 8(%rbx)
	movl	$4, 8(%r12)
	jbe	.L39
	cmpl	$4, %esi
	movl	$5, 12(%rbx)
	movl	$6, 12(%r12)
	jbe	.L40
	movl	$6, 16(%rbx)
	movl	$8, 16(%r12)
	movl	$5, %ecx
.L26:
	cmpl	%esi, %ebp
	je	.L33
.L25:
	movl	%ebp, %r8d
	movl	%esi, %r9d
	subl	%esi, %r8d
	movl	%r8d, %esi
	shrl	$2, %esi
	leal	0(,%rsi,4), %edi
	testl	%edi, %edi
	je	.L28
	leal	1(%rcx), %eax
	salq	$2, %r9
	xorl	%edx, %edx
	movdqa	.LC4(%rip), %xmm3
	leaq	(%rbx,%r9), %r10
	movl	%eax, (%rsp)
	leal	2(%rcx), %eax
	addq	%r12, %r9
	movd	(%rsp), %xmm6
	movl	%eax, 8(%rsp)
	leal	3(%rcx), %eax
	movd	8(%rsp), %xmm1
	movl	%ecx, 8(%rsp)
	movl	%eax, 12(%rsp)
	movd	8(%rsp), %xmm0
	xorl	%eax, %eax
	movd	12(%rsp), %xmm5
	punpckldq	%xmm6, %xmm0
	movdqa	.LC5(%rip), %xmm2
	punpckldq	%xmm5, %xmm1
	punpcklqdq	%xmm1, %xmm0
.L34:
	movdqa	%xmm0, %xmm1
	movdqa	%xmm0, %xmm4
	pslld	$1, %xmm0
	addl	$1, %edx
	paddd	%xmm2, %xmm1
	movdqu	%xmm0, (%r9,%rax)
	paddd	%xmm3, %xmm4
	movdqa	%xmm1, (%r10,%rax)
	addq	$16, %rax
	cmpl	%edx, %esi
	jbe	.L50
	movdqa	%xmm4, %xmm0
	jmp	.L34
.L50:
	addl	%edi, %ecx
	cmpl	%edi, %r8d
	je	.L33
.L28:
	leal	2(%rcx), %eax
	leal	(%rcx,%rcx), %esi
	movl	%ecx, %edx
	movl	%eax, (%rbx,%rdx,4)
	movl	%esi, (%r12,%rdx,4)
	leal	1(%rcx), %edx
	cmpl	%edx, %ebp
	jbe	.L33
	leal	3(%rcx), %edi
	movl	%edx, %esi
	addl	%edx, %edx
	cmpl	%eax, %ebp
	movl	%edx, (%r12,%rsi,4)
	movl	%edi, (%rbx,%rsi,4)
	jbe	.L33
	movl	%eax, %edx
	addl	$4, %ecx
	addl	%eax, %eax
	movl	%ecx, (%rbx,%rdx,4)
	movl	%eax, (%r12,%rdx,4)
.L33:
	leaq	32(%rsp), %r9
	leaq	16(%rsp), %r8
	movl	%ebp, %ecx
	movl	%r13d, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	daxpy
	movq	32(%rsp), %rax
	subq	16(%rsp), %rax
	leal	-1(%rbp), %ecx
	movl	(%rbx), %edx
	movl	$.LC2, %esi
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm0
	movq	40(%rsp), %rax
	subq	24(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	movl	%ecx, %eax
	movl	(%rbx,%rax,4), %r8d
	xorl	%eax, %eax
	divsd	.LC1(%rip), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, (%rsp)
	call	__printf_chk
	movsd	(%rsp), %xmm0
	movl	$.LC3, %esi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk
	movq	%rbx, %rdi
	call	free
	movq	%r12, %rdi
	call	free
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L49:
	.cfi_restore_state
	xorl	%esi, %esi
	xorl	%ecx, %ecx
	testl	%eax, %eax
	je	.L25
	movl	%eax, %esi
	jmp	.L24
.L40:
	movl	$4, %ecx
	jmp	.L26
.L37:
	movl	$1, %ecx
	jmp	.L26
.L38:
	movl	$2, %ecx
	jmp	.L26
.L39:
	movl	$3, %ecx
	jmp	.L26
.L48:
	movq	stderr(%rip), %rcx
	movl	$.LC0, %edi
	movl	$40, %edx
	movl	$1, %esi
	call	fwrite
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE40:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	0
	.long	1104006501
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC4:
	.long	4
	.long	4
	.long	4
	.long	4
	.align 16
.LC5:
	.long	2
	.long	2
	.long	2
	.long	2
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.3) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
