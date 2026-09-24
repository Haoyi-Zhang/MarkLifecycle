	.file	"kernel.c"
	.text
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB4:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	xorl	%ebx, %ebx
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	leaq	15(%rsp), %rbp
.L2:
	xorl	%r12d, %r12d
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L3:
	addl	$1, %r12d
	cmpl	$256, %r12d
	je	.L10
.L5:
	leal	(%rbx,%r12), %eax
	movq	stdout(%rip), %rcx
	movl	$1, %esi
	movq	%rbp, %rdi
	leal	(%rax,%rax,8), %eax
	movzbl	%al, %eax
	movl	%eax, %edx
	shrl	$4, %edx
	xorl	%edx, %eax
	leal	(%rax,%rax,2), %eax
	leal	(%rax,%rax,8), %eax
	movzbl	%al, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	xorl	%edx, %eax
	movl	$1, %edx
	movb	%al, 15(%rsp)
	call	fwrite@PLT
	cmpq	$1, %rax
	je	.L3
	movl	$2, %eax
.L1:
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L10:
	.cfi_restore_state
	addl	$1, %ebx
	cmpl	$256, %ebx
	jne	.L2
	xorl	%eax, %eax
	jmp	.L1
	.cfi_endproc
.LFE4:
	.size	main, .-main
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
