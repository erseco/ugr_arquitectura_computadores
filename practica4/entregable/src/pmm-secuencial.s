	.file	"pmm-secuencial.c"
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
	subq	$40, %rsp
	.cfi_def_cfa_offset 80
	cmpl	$1, %edi
	jle	.L19
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	movl	$3355, %ebx
	call	strtol
	cmpl	$3355, %eax
	cmovbe	%eax, %ebx
	testl	%ebx, %ebx
	je	.L20
	subl	$1, %ebx
	xorl	%edx, %edx
	movl	%ebx, %r13d
	leaq	1(%r13), %rbp
	imulq	$13420, %rbp, %r12
	salq	$2, %rbp
.L7:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L13:
	movl	$0, a(%rdx,%rax)
	movl	$2, b(%rdx,%rax)
	movl	$2, c(%rdx,%rax)
	addq	$4, %rax
	cmpq	%rbp, %rax
	jne	.L13
	addq	$13420, %rdx
	cmpq	%r12, %rdx
	jne	.L7
	movq	%rsp, %rsi
	xorl	%edi, %edi
	call	clock_gettime
	leaq	b+4(,%r13,4), %r11
	xorl	%r9d, %r9d
.L14:
	leaq	(%r11,%r9), %rdi
	leaq	b(%r9), %r10
	xorl	%r8d, %r8d
	.p2align 4,,10
	.p2align 3
.L12:
	movl	a(%r9,%r8), %esi
	leaq	c(%r8), %rcx
	movq	%r10, %rax
	.p2align 4,,10
	.p2align 3
.L10:
	movl	(%rax), %edx
	addq	$4, %rax
	addq	$13420, %rcx
	imull	-13420(%rcx), %edx
	addl	%edx, %esi
	cmpq	%rdi, %rax
	jne	.L10
	movl	%esi, a(%r9,%r8)
	addq	$4, %r8
	cmpq	%rbp, %r8
	jne	.L12
	addq	$13420, %r9
	cmpq	%r12, %r9
	jne	.L14
.L11:
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	16(%rsp), %rax
	subq	(%rsp), %rax
	movl	%ebx, %edx
	imulq	$13424, %rdx, %rdx
	movl	$.LC2, %esi
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm0
	movq	24(%rsp), %rax
	subq	8(%rsp), %rax
	movl	a(%rdx), %ecx
	movl	a(%rip), %edx
	cvtsi2sdq	%rax, %xmm1
	movl	$1, %eax
	divsd	.LC1(%rip), %xmm1
	addsd	%xmm1, %xmm0
	call	__printf_chk
	addq	$40, %rsp
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
.L20:
	.cfi_restore_state
	movq	%rsp, %rsi
	xorl	%edi, %edi
	movl	$-1, %ebx
	call	clock_gettime
	jmp	.L11
.L19:
	movq	stderr(%rip), %rcx
	movl	$.LC0, %edi
	movl	$11, %edx
	movl	$1, %esi
	call	fwrite
	movl	$-1, %edi
	call	exit
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
