	.file	"kernel.c"
	.text
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB4:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	xorl	%r13d, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	xorl	%r12d, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$24, %rsp
	.cfi_def_cfa_offset 64
	leaq	15(%rsp), %rbp
.L2:
	xorl	%ebx, %ebx
	.p2align 4
	.p2align 3
.L9:
	testb	%bl, %bl
	js	.L14
.L3:
	movq	stdout(%rip), %rcx
	leal	(%rbx,%r12), %eax
	movl	$1, %edx
	movq	%rbp, %rdi
	movl	$1, %esi
	movb	%al, 15(%rsp)
	call	fwrite@PLT
	cmpq	$1, %rax
	jne	.L4
	addl	$1, %ebx
	testb	%bl, %bl
	jns	.L3
.L14:
	movl	%ebx, %eax
	movl	$1, %edx
	movl	$1, %esi
	movq	%rbp, %rdi
	andl	$127, %eax
	movq	stdout(%rip), %rcx
	xorl	%r13d, %eax
	movb	%al, 15(%rsp)
	call	fwrite@PLT
	cmpq	$1, %rax
	jne	.L4
	addl	$1, %ebx
	cmpl	$256, %ebx
	jne	.L9
	addl	$1, %r12d
	addl	$2, %r13d
	cmpl	$256, %r12d
	jne	.L2
	xorl	%eax, %eax
	jmp	.L1
	.p2align 4,,10
	.p2align 3
.L4:
	movl	$2, %eax
.L1:
	addq	$24, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE4:
	.size	main, .-main
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
