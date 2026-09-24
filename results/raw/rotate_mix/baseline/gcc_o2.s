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
	movl	%r12d, %ebx
	leal	0(,%r12,8), %eax
	xorl	%r13d, %r13d
	shrb	$5, %bl
	movzbl	%bl, %ebx
	orl	%eax, %ebx
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L3:
	addl	$1, %r13d
	cmpl	$256, %r13d
	je	.L10
.L5:
	movl	%ebx, %eax
	movl	%r13d, %edx
	movq	stdout(%rip), %rcx
	movq	%rbp, %rdi
	xorl	%r13d, %eax
	shrb	$2, %dl
	movl	$1, %esi
	movzbl	%dl, %edx
	movzbl	%al, %eax
	xorl	%edx, %eax
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
	addl	$1, %r12d
	cmpl	$256, %r12d
	jne	.L2
	xorl	%eax, %eax
	jmp	.L1
	.cfi_endproc
.LFE4:
	.size	main, .-main
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
