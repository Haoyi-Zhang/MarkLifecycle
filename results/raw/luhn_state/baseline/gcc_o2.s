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
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movl	$-51, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	xorl	%ebx, %ebx
	subq	$16, %rsp
	.cfi_def_cfa_offset 64
	leaq	15(%rsp), %r13
.L2:
	movl	%ebx, %ebp
	xorl	%r14d, %r14d
	andl	$1, %ebp
	jmp	.L6
	.p2align 4,,10
	.p2align 3
.L4:
	addl	$1, %r14d
	cmpl	$256, %r14d
	je	.L14
.L6:
	movl	%r14d, %eax
	mulb	%r12b
	shrw	$11, %ax
	leal	(%rax,%rax,4), %eax
	leal	(%rax,%rax), %edx
	movl	%r14d, %eax
	subl	%edx, %eax
	movzbl	%al, %eax
	testb	%bpl, %bpl
	je	.L3
	addl	%eax, %eax
	leal	-9(%rax), %edx
	cmpl	$9, %eax
	cmova	%edx, %eax
.L3:
	movq	stdout(%rip), %rcx
	addl	%ebx, %eax
	movl	$1, %edx
	movq	%r13, %rdi
	movl	$1, %esi
	movb	%al, 15(%rsp)
	call	fwrite@PLT
	cmpq	$1, %rax
	je	.L4
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
.L14:
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
