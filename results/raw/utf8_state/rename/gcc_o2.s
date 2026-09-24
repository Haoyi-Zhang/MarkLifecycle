	.file	"kernel.c"
	.text
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB4:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movl	$-1, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movl	$-1, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	xorl	%r12d, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$16, %rsp
	.cfi_def_cfa_offset 64
	leaq	15(%rsp), %rbp
.L2:
	xorl	%ebx, %ebx
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L25:
	andl	$-64, %eax
	cmpb	$-128, %al
	movl	%r14d, %eax
	cmove	%r13d, %eax
.L4:
	movq	stdout(%rip), %rcx
	movl	$1, %edx
	movl	$1, %esi
	movq	%rbp, %rdi
	movb	%al, 15(%rsp)
	call	fwrite@PLT
	cmpq	$1, %rax
	jne	.L10
	addl	$1, %ebx
	cmpl	$256, %ebx
	je	.L24
.L9:
	movl	%ebx, %eax
	testl	%r12d, %r12d
	jne	.L25
	cmpb	$-17, %al
	ja	.L5
.L26:
	movl	$2, %edx
	cmpb	$-33, %al
	ja	.L6
	xorl	%edx, %edx
	testb	%bl, %bl
	jns	.L6
	addl	$62, %eax
	cmpb	$30, %al
	sbbl	%edx, %edx
	andl	$2, %edx
	subl	$1, %edx
.L6:
	movq	stdout(%rip), %rcx
	movb	%dl, 15(%rsp)
	movl	$1, %esi
	movq	%rbp, %rdi
	movl	$1, %edx
	call	fwrite@PLT
	cmpq	$1, %rax
	jne	.L10
	addl	$1, %ebx
	movl	%ebx, %eax
	cmpb	$-17, %al
	jbe	.L26
.L5:
	addl	$16, %eax
	cmpb	$5, %al
	sbbl	%eax, %eax
	andl	$4, %eax
	subl	$1, %eax
	jmp	.L4
	.p2align 4,,10
	.p2align 3
.L10:
	movl	$2, %eax
.L1:
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
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
.L24:
	.cfi_restore_state
	addl	$1, %r12d
	addl	$1, %r13d
	cmpl	$256, %r12d
	jne	.L2
	xorl	%eax, %eax
	jmp	.L1
	.cfi_endproc
.LFE4:
	.size	main, .-main
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
