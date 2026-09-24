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
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movl	$2155905153, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movl	$256, %ebx
	subq	$24, %rsp
	.cfi_def_cfa_offset 64
	leaq	15(%rsp), %r12
.L2:
	leal	-256(%rbx), %r13d
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L3:
	addl	$1, %r13d
	cmpl	%r13d, %ebx
	je	.L10
.L5:
	movl	%r13d, %eax
	movq	stdout(%rip), %rcx
	movl	$1, %esi
	movq	%r12, %rdi
	imulq	%rbp, %rax
	shrq	$39, %rax
	movl	%eax, %edx
	sall	$8, %edx
	subl	%eax, %edx
	movl	%r13d, %eax
	subl	%edx, %eax
	movl	$1, %edx
	movb	%al, 15(%rsp)
	call	fwrite@PLT
	cmpq	$1, %rax
	je	.L3
	movl	$2, %eax
.L1:
	addq	$24, %rsp
	.cfi_remember_state
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
.L10:
	.cfi_restore_state
	addl	$1, %ebx
	cmpl	$512, %ebx
	jne	.L2
	xorl	%eax, %eax
	jmp	.L1
	.cfi_endproc
.LFE4:
	.size	main, .-main
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
