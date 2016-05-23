	.file	"figura1-modificado-b.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"R[0] = %i, R[39999] = %i\n"
.LC2:
	.string	"\nTiempo (seg.) = %11.9f\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB24:
	.cfi_startproc
	subq	$160056, %rsp
	.cfi_def_cfa_offset 160064
	xorl	%edi, %edi
	leaq	16(%rsp), %rsi
	call	clock_gettime
	leaq	52(%rsp), %r11
	movl	$1, %edx
	.p2align 4,,10
	.p2align 3
.L2:
	movl	$s, %eax
	xorl	%ecx, %ecx
	xorl	%r10d, %r10d
	.p2align 4,,10
	.p2align 3
.L5:
	movl	4(%rax), %r9d
	movl	(%rax), %esi
	addq	$32, %rax
	leal	(%r9,%r9,2), %r8d
	movl	-20(%rax), %r9d
	leal	(%rdx,%rsi,2), %esi
	subl	%edx, %r8d
	addl	%esi, %r10d
	movl	-24(%rax), %esi
	leal	(%r9,%r9,2), %edi
	addl	%r8d, %ecx
	movl	-12(%rax), %r9d
	subl	%edx, %edi
	leal	(%rdx,%rsi,2), %esi
	addl	%ecx, %edi
	movl	-16(%rax), %ecx
	addl	%esi, %r10d
	leal	(%r9,%r9,2), %esi
	movl	-4(%rax), %r9d
	leal	(%rdx,%rcx,2), %ecx
	subl	%edx, %esi
	addl	%edi, %esi
	addl	%ecx, %r10d
	movl	-8(%rax), %ecx
	leal	(%rdx,%rcx,2), %ecx
	addl	%ecx, %r10d
	leal	(%r9,%r9,2), %ecx
	subl	%edx, %ecx
	addl	%esi, %ecx
	cmpq	$s+40000, %rax
	jne	.L5
	cmpl	%ecx, %r10d
	cmovle	%r10d, %ecx
	addl	$1, %edx
	addq	$4, %r11
	movl	%ecx, -4(%r11)
	cmpl	$40001, %edx
	jne	.L2
	leaq	32(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	32(%rsp), %rax
	subq	16(%rsp), %rax
	movl	$.LC1, %esi
	movl	160044(%rsp), %ecx
	movl	48(%rsp), %edx
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm0
	movq	40(%rsp), %rax
	subq	24(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	xorl	%eax, %eax
	divsd	.LC0(%rip), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, 8(%rsp)
	call	__printf_chk
	movsd	8(%rsp), %xmm0
	movl	$.LC2, %esi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk
	xorl	%eax, %eax
	addq	$160056, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE24:
	.size	main, .-main
	.comm	s,40000,32
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.3) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
