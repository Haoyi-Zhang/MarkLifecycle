	.file	"kernel.c"
	.text
	.p2align 4
	.type	tc_add_v1.isra.0, @function
tc_add_v1.isra.0:
.LFB7:
	.cfi_startproc
	movl	%edi, %eax
	ret
	.cfi_endproc
.LFE7:
	.size	tc_add_v1.isra.0, .-tc_add_v1.isra.0
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB6:
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
.L4:
	movl	%ebx, %ebp
	xorl	%r14d, %r14d
	andl	$1, %ebp
	jmp	.L8
	.p2align 4,,10
	.p2align 3
.L6:
	addl	$1, %r14d
	cmpl	$256, %r14d
	je	.L15
.L8:
	movl	%r14d, %eax
	movl	%r14d, %edi
	mulb	%r12b
	shrw	$11, %ax
	leal	(%rax,%rax,4), %eax
	addl	%eax, %eax
	subl	%eax, %edi
	movzbl	%dil, %edi
	testb	%bpl, %bpl
	je	.L5
	addl	%edi, %edi
	leal	-9(%rdi), %eax
	cmpl	$9, %edi
	cmova	%eax, %edi
.L5:
	addl	%ebx, %edi
	movl	$1, %edx
	movl	$1, %esi
	movzbl	%dil, %edi
	call	tc_add_v1.isra.0
	movl	%eax, %edi
	call	tc_add_v1.isra.0
	movl	%eax, %edi
	call	tc_add_v1.isra.0
	movl	%eax, %edi
	call	tc_add_v1.isra.0
	movl	%eax, %edi
	call	tc_add_v1.isra.0
	movl	%eax, %edi
	call	tc_add_v1.isra.0
	movl	%eax, %edi
	call	tc_add_v1.isra.0
	movl	%eax, %edi
	call	tc_add_v1.isra.0
	movl	%eax, %edi
	call	tc_add_v1.isra.0
	movl	%eax, %edi
	call	tc_add_v1.isra.0
	movl	%eax, %edi
	call	tc_add_v1.isra.0
	movl	%eax, %edi
	call	tc_add_v1.isra.0
	movl	%eax, %edi
	call	tc_add_v1.isra.0
	movl	%eax, %edi
	call	tc_add_v1.isra.0
	movl	%eax, %edi
	call	tc_add_v1.isra.0
	movl	%eax, %edi
	call	tc_add_v1.isra.0
	movl	%eax, %edi
	call	tc_add_v1.isra.0
	movl	%eax, %edi
	call	tc_add_v1.isra.0
	movl	%eax, %edi
	call	tc_add_v1.isra.0
	movl	%eax, %edi
	call	tc_add_v1.isra.0
	movl	%eax, %edi
	call	tc_add_v1.isra.0
	movl	%eax, %edi
	call	tc_add_v1.isra.0
	movl	%eax, %edi
	call	tc_add_v1.isra.0
	movl	%eax, %edi
	call	tc_add_v1.isra.0
	movl	%eax, %edi
	call	tc_add_v1.isra.0
	movl	%eax, %edi
	call	tc_add_v1.isra.0
	movl	%eax, %edi
	call	tc_add_v1.isra.0
	movl	%eax, %edi
	call	tc_add_v1.isra.0
	movq	stdout(%rip), %rcx
	movq	%r13, %rdi
	movb	%al, 15(%rsp)
	call	fwrite@PLT
	cmpq	$1, %rax
	je	.L6
	movl	$2, %eax
.L3:
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
.L15:
	.cfi_restore_state
	addl	$1, %ebx
	cmpl	$256, %ebx
	jne	.L4
	xorl	%eax, %eax
	jmp	.L3
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
