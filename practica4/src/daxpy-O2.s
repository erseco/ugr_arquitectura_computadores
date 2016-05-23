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
	movq	%rsi, %r12
	movq	%r8, %rsi
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movl	%ecx, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	%rdi, %rbx
	xorl	%edi, %edi
	call	clock_gettime
	xorl	%eax, %eax
	testl	%ebp, %ebp
	je	.L3
	.p2align 4,,10
	.p2align 3
.L5:
	movl	(%r12,%rax,4), %edi
	imull	%r13d, %edi
	addl	%edi, (%rbx,%rax,4)
	addq	$1, %rax
	cmpl	%eax, %ebp
	ja	.L5
.L3:
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	movq	%r14, %rsi
	xorl	%edi, %edi
	popq	%r14
	.cfi_def_cfa_offset 8
	jmp	clock_gettime
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
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$48, %rsp
	.cfi_def_cfa_offset 96
	cmpl	$2, %edi
	jle	.L16
	movq	8(%rsi), %rdi
	movq	%rsi, %rbx
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	movq	16(%rbx), %rdi
	movq	%rax, %r12
	xorl	%esi, %esi
	movl	%r12d, %ebp
	movl	$10, %edx
	movl	%eax, %r14d
	salq	$2, %rbp
	call	strtol
	movq	%rbp, %rdi
	movq	%rax, %r13
	call	malloc
	movq	%rbp, %rdi
	movq	%rax, %rbx
	call	malloc
	xorl	%r8d, %r8d
	testl	%r12d, %r12d
	movq	%rax, %rbp
	je	.L11
	.p2align 4,,10
	.p2align 3
.L13:
	leal	2(%r8), %r9d
	movl	%r9d, (%rbx,%r8,4)
	leal	(%r8,%r8), %r9d
	movl	%r9d, 0(%rbp,%r8,4)
	addq	$1, %r8
	cmpl	%r8d, %r14d
	ja	.L13
.L11:
	leaq	32(%rsp), %r9
	leaq	16(%rsp), %r8
	movl	%r12d, %ecx
	movl	%r13d, %edx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	daxpy
	movq	32(%rsp), %rax
	subq	16(%rsp), %rax
	leal	-1(%r12), %ecx
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
	movsd	%xmm0, 8(%rsp)
	call	__printf_chk
	movsd	8(%rsp), %xmm0
	movl	$.LC3, %esi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk
	movq	%rbx, %rdi
	call	free
	movq	%rbp, %rdi
	call	free
	addq	$48, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	xorl	%eax, %eax
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
	ret
.L16:
	.cfi_restore_state
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
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.3) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
