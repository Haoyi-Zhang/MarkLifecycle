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
	xorl	%r13d, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	xorl	%r12d, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	leaq	15(%rsp), %rbp
.L2:
	movl	%r13d, %ebx
	movl	%r13d, %r15d
	xorl	%r14d, %r14d
	jmp	.L7
	.p2align 4,,10
	.p2align 3
.L14:
	leal	(%r14,%r12), %eax
	xorl	$90, %eax
	movzbl	%al, %eax
.L4:
	movq	stdout(%rip), %rcx
	movl	$1, %edx
	movl	$1, %esi
	movq	%rbp, %rdi
	movb	%al, 15(%rsp)
	call	fwrite@PLT
	cmpq	$1, %rax
	jne	.L12
	addl	$1, %r14d
	addl	$29, %r15d
	cmpl	$256, %r14d
	je	.L13
.L7:
	movl	%ebx, %eax
	xorl	%r14d, %eax
	testb	$1, %al
	jne	.L14
	movl	%r15d, %eax
	xorb	$-91, %al
	movzbl	%al, %eax
	jmp	.L4
	.p2align 4,,10
	.p2align 3
.L12:
	movl	$2, %eax
.L1:
	addq	$24, %rsp
	.cfi_remember_state
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
.L13:
	.cfi_restore_state
	addl	$1, %r13d
	addl	$17, %r12d
	cmpl	$256, %r13d
	jne	.L2
	xorl	%eax, %eax
	jmp	.L1
	.cfi_endproc
.LFE4:
	.size	main, .-main
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
