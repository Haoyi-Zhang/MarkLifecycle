	.file	"kernel.c"
	.text
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB4:
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
	movl	$-1, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	$1, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	leaq	31(%rsp), %rbx
.L2:
	leal	127(%r12), %eax
	movl	%r12d, %r15d
	leal	-1(%r12), %ebp
	xorl	%r14d, %r14d
	movb	%al, 15(%rsp)
.L13:
	movl	%r14d, %eax
	cmpl	$34, %r14d
	je	.L3
.L29:
	jbe	.L28
	cmpl	$123, %r14d
	je	.L19
	ja	.L8
	cmpl	$91, %r14d
	je	.L19
	cmpl	$93, %r14d
	jne	.L7
.L9:
	movl	%r13d, %edx
.L5:
	movq	stdout(%rip), %rcx
	movb	%dl, 31(%rsp)
	movl	$1, %esi
	movq	%rbx, %rdi
	movl	$1, %edx
	call	fwrite@PLT
	cmpq	$1, %rax
	jne	.L14
	addl	$1, %r14d
	movl	%r14d, %eax
	cmpl	$34, %r14d
	jne	.L29
.L3:
	movzbl	15(%rsp), %edx
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L28:
	cmpl	$13, %r14d
	je	.L16
	ja	.L6
	leal	-9(%rax), %edx
	cmpb	$1, %dl
	ja	.L7
.L16:
	movl	%ebp, %edx
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L6:
	movl	%ebp, %edx
	cmpl	$32, %r14d
	je	.L5
.L7:
	andl	$3, %eax
	movl	$1, %edx
	movl	$1, %esi
	movq	%rbx, %rdi
	movq	stdout(%rip), %rcx
	addl	%ebp, %eax
	movb	%al, 31(%rsp)
	call	fwrite@PLT
	cmpq	$1, %rax
	jne	.L14
	addl	$1, %r14d
	cmpl	$256, %r14d
	jne	.L13
	addl	$1, %r12d
	addl	$1, %r13d
	cmpl	$257, %r12d
	jne	.L2
	xorl	%eax, %eax
	jmp	.L1
	.p2align 4,,10
	.p2align 3
.L19:
	movl	%r15d, %edx
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L8:
	cmpl	$125, %r14d
	je	.L9
	jmp	.L7
	.p2align 4,,10
	.p2align 3
.L14:
	movl	$2, %eax
.L1:
	addq	$40, %rsp
	.cfi_def_cfa_offset 56
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
	.cfi_endproc
.LFE4:
	.size	main, .-main
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
