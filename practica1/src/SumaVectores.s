	.file	"SumaVectores.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Faltan n\302\272 componentes del vector"
	.align 8
.LC1:
	.string	"Error en la reserva de espacio para los vectores"
	.align 8
.LC4:
	.string	"Tiempo(seg.):%11.9f\t Tama\303\261o Vectores:%u\t V1[0]+V2[0]=V3[0](%8.6f+%8.6f=%8.6f) V1[%d]+V2[%d]=V3[%d](%8.6f+%8.6f=%8.6f) \n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB18:
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
	jle	.L20
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	movl	%eax, %r13d
	movl	%eax, %r12d
	salq	$3, %r13
	movq	%r13, %rdi
	call	malloc
	movq	%r13, %rdi
	movq	%rax, %rbx
	call	malloc
	movq	%r13, %rdi
	movq	%rax, %rbp
	call	malloc
	testq	%rbp, %rbp
	movq	%rax, %r13
	je	.L3
	testq	%rbx, %rbx
	je	.L3
	testq	%rax, %rax
	je	.L3
	testl	%r12d, %r12d
	.p2align 4,,2
	je	.L21
	movl	%r12d, %eax
	movsd	.LC2(%rip), %xmm3
	cvtsi2sdq	%rax, %xmm1
	xorl	%edx, %edx
	mulsd	%xmm3, %xmm1
	.p2align 4,,10
	.p2align 3
.L8:
	cvtsi2sd	%edx, %xmm0
	mulsd	%xmm3, %xmm0
	movapd	%xmm0, %xmm2
	addsd	%xmm1, %xmm2
	movsd	%xmm2, (%rbx,%rdx,8)
	movapd	%xmm1, %xmm2
	subsd	%xmm0, %xmm2
	movsd	%xmm2, 0(%rbp,%rdx,8)
	addq	$1, %rdx
	cmpl	%edx, %r12d
	ja	.L8
	movq	%rsp, %rsi
	xorl	%edi, %edi
	call	clock_gettime
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L9:
	movsd	(%rbx,%rdx,8), %xmm0
	addsd	0(%rbp,%rdx,8), %xmm0
	movsd	%xmm0, 0(%r13,%rdx,8)
	addq	$1, %rdx
	cmpl	%edx, %r12d
	ja	.L9
.L10:
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	16(%rsp), %rcx
	subq	(%rsp), %rcx
	leal	-1(%r12), %edx
	movsd	0(%r13), %xmm3
	movl	%r12d, %esi
	movl	%edx, %eax
	movsd	0(%rbp), %xmm2
	movsd	0(%r13,%rax,8), %xmm6
	movl	%edx, %r8d
	cvtsi2sdq	%rcx, %xmm0
	movq	24(%rsp), %rcx
	subq	8(%rsp), %rcx
	movsd	0(%rbp,%rax,8), %xmm5
	movsd	(%rbx,%rax,8), %xmm4
	movl	$.LC4, %edi
	movl	$7, %eax
	cvtsi2sdq	%rcx, %xmm1
	movl	%edx, %ecx
	divsd	.LC3(%rip), %xmm1
	addsd	%xmm1, %xmm0
	movsd	(%rbx), %xmm1
	call	printf
	movq	%rbx, %rdi
	call	free
	movq	%rbp, %rdi
	call	free
	movq	%r13, %rdi
	call	free
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
.L21:
	.cfi_restore_state
	movq	%rsp, %rsi
	xorl	%edi, %edi
	call	clock_gettime
	jmp	.L10
.L3:
	movl	$.LC1, %edi
	call	puts
	movl	$-2, %edi
	call	exit
.L20:
	movl	$.LC0, %edi
	call	puts
	orl	$-1, %edi
	call	exit
	.cfi_endproc
.LFE18:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC2:
	.long	2576980378
	.long	1069128089
	.align 8
.LC3:
	.long	0
	.long	1104006501
	.ident	"GCC: (Debian 4.7.2-5) 4.7.2"
	.section	.note.GNU-stack,"",@progbits
