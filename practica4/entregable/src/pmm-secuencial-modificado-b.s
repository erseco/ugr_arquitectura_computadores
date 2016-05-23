	.file	"pmm-secuencial-modificado-b.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"falta size\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC2:
	.string	"Tiempo = %11.9f\t Primera = %d\t Ultima=%d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB39:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$104, %rsp
	.cfi_def_cfa_offset 160
	cmpl	$1, %edi
	jle	.L23
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	movl	$3355, %r15d
	call	strtol
	cmpl	$3355, %eax
	cmovbe	%eax, %r15d
	testl	%r15d, %r15d
	je	.L24
	leal	-1(%r15), %eax
	xorl	%edx, %edx
	movl	%eax, 60(%rsp)
	addq	$1, %rax
	imulq	$13420, %rax, %rsi
	leaq	0(,%rax,4), %rcx
	movq	%rax, 24(%rsp)
.L7:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L16:
	movl	$0, a(%rdx,%rax)
	movl	$2, b(%rdx,%rax)
	movl	$2, c(%rdx,%rax)
	addq	$4, %rax
	cmpq	%rcx, %rax
	jne	.L16
	addq	$13420, %rdx
	cmpq	%rsi, %rdx
	jne	.L7
	movl	%r15d, %eax
	leaq	64(%rsp), %rsi
	xorl	%edi, %edi
	shrl	$3, %eax
	movl	%eax, %ebx
	movl	%eax, 32(%rsp)
	call	clock_gettime
	movl	%ebx, %eax
	leal	0(,%rbx,8), %ebx
	movq	$0, 16(%rsp)
	subl	$1, %eax
	movl	$0, 56(%rsp)
	addq	$1, %rax
	movl	%ebx, 36(%rsp)
	imulq	$107360, %rax, %rax
	movq	%rax, 40(%rsp)
.L17:
	movl	56(%rsp), %r14d
	movq	16(%rsp), %rax
	xorl	%r13d, %r13d
	movq	$c+4, (%rsp)
	addq	$b, %rax
	imulq	$3355, %r14, %r14
	movq	%rax, 48(%rsp)
	.p2align 4,,10
	.p2align 3
.L15:
	movl	32(%rsp), %eax
	movl	%r13d, 8(%rsp)
	testl	%eax, %eax
	je	.L18
	movl	%r15d, 12(%rsp)
	movq	(%rsp), %rdx
	xorl	%ecx, %ecx
	movq	48(%rsp), %rax
	movq	40(%rsp), %r15
	xorl	%r12d, %r12d
	xorl	%ebp, %ebp
	xorl	%ebx, %ebx
	xorl	%r11d, %r11d
	xorl	%r10d, %r10d
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edi, %edi
	.p2align 4,,10
	.p2align 3
.L13:
	movl	(%rax), %esi
	addq	$32, %rdx
	addq	$32, %rax
	imull	c(%rcx,%r13,4), %esi
	addq	$107360, %rcx
	addl	%esi, %edi
	movl	-28(%rax), %esi
	imull	-32(%rdx), %esi
	addl	%esi, %r8d
	movl	-24(%rax), %esi
	imull	-28(%rdx), %esi
	addl	%esi, %r9d
	movl	-20(%rax), %esi
	imull	-24(%rdx), %esi
	addl	%esi, %r10d
	movl	-16(%rax), %esi
	imull	-20(%rdx), %esi
	addl	%esi, %r11d
	movl	-12(%rax), %esi
	imull	-16(%rdx), %esi
	addl	%esi, %ebx
	movl	-8(%rax), %esi
	imull	-12(%rdx), %esi
	addl	%esi, %ebp
	movl	-4(%rax), %esi
	imull	-8(%rdx), %esi
	addl	%esi, %r12d
	cmpq	%r15, %rcx
	jne	.L13
	addl	%r8d, %edi
	movl	12(%rsp), %r15d
	addl	%r9d, %edi
	addl	%r10d, %edi
	addl	%r11d, %edi
	addl	%edi, %ebx
	addl	%ebx, %ebp
	addl	%ebp, %r12d
.L12:
	movl	36(%rsp), %eax
	cmpl	%eax, %r15d
	jbe	.L9
	movl	8(%rsp), %esi
	imulq	$3355, %rsi, %rsi
	.p2align 4,,10
	.p2align 3
.L10:
	movl	%eax, %edx
	addl	$1, %eax
	leaq	(%rsi,%rdx), %rcx
	leaq	(%r14,%rdx), %rdi
	movl	b(,%rdi,4), %edx
	imull	c(,%rcx,4), %edx
	addl	%edx, %r12d
	cmpl	%r15d, %eax
	jne	.L10
.L9:
	movq	16(%rsp), %rax
	addq	$13420, (%rsp)
	movl	%r12d, a(%rax,%r13,4)
	addq	$1, %r13
	cmpq	24(%rsp), %r13
	jne	.L15
	addl	$1, 56(%rsp)
	addq	$13420, 16(%rsp)
	cmpl	%r15d, 56(%rsp)
	jne	.L17
	jmp	.L14
.L24:
	leaq	64(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movl	$-1, 60(%rsp)
.L14:
	leaq	80(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	80(%rsp), %rax
	subq	64(%rsp), %rax
	movl	$.LC2, %esi
	movl	60(%rsp), %edx
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm0
	movq	88(%rsp), %rax
	subq	72(%rsp), %rax
	imulq	$13424, %rdx, %rdx
	cvtsi2sdq	%rax, %xmm1
	movl	$1, %eax
	movl	a(%rdx), %ecx
	movl	a(%rip), %edx
	divsd	.LC1(%rip), %xmm1
	addsd	%xmm1, %xmm0
	call	__printf_chk
	addq	$104, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L23:
	.cfi_restore_state
	movq	stderr(%rip), %rcx
	movl	$.LC0, %edi
	movl	$11, %edx
	movl	$1, %esi
	call	fwrite
	movl	$-1, %edi
	call	exit
	.p2align 4,,10
	.p2align 3
.L18:
	xorl	%r12d, %r12d
	jmp	.L12
	.cfi_endproc
.LFE39:
	.size	main, .-main
	.comm	c,45024100,32
	.comm	b,45024100,32
	.comm	a,45024100,32
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.3) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
