	.file	"kernel.c"
	.text
	.p2align 4
	.type	tc_add_v2.isra.0, @function
tc_add_v2.isra.0:
.LFB7:
	.cfi_startproc
	movl	%edi, %eax
	ret
	.cfi_endproc
.LFE7:
	.size	tc_add_v2.isra.0, .-tc_add_v2.isra.0
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
	xorl	%r13d, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$16, %rsp
	.cfi_def_cfa_offset 64
	leaq	15(%rsp), %rbx
.L4:
	cmpl	$66, %r13d
	movl	%r13d, %r12d
	sete	%bpl
	xorl	%r14d, %r14d
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L5:
	call	tc_add_v2.isra.0
	movl	$1, %edx
	movl	$1, %esi
	movl	%eax, %edi
	call	tc_add_v2.isra.0
	movl	%eax, %edi
	call	tc_add_v2.isra.0
	movl	%eax, %edi
	call	tc_add_v2.isra.0
	movl	%eax, %edi
	call	tc_add_v2.isra.0
	movl	%eax, %edi
	call	tc_add_v2.isra.0
	movl	%eax, %edi
	call	tc_add_v2.isra.0
	movl	%eax, %edi
	call	tc_add_v2.isra.0
	movl	%eax, %edi
	call	tc_add_v2.isra.0
	movl	%eax, %edi
	call	tc_add_v2.isra.0
	movl	%eax, %edi
	call	tc_add_v2.isra.0
	movl	%eax, %edi
	call	tc_add_v2.isra.0
	movl	%eax, %edi
	call	tc_add_v2.isra.0
	movl	%eax, %edi
	call	tc_add_v2.isra.0
	movl	%eax, %edi
	call	tc_add_v2.isra.0
	movl	%eax, %edi
	call	tc_add_v2.isra.0
	movl	%eax, %edi
	call	tc_add_v2.isra.0
	movl	%eax, %edi
	call	tc_add_v2.isra.0
	movl	%eax, %edi
	call	tc_add_v2.isra.0
	movl	%eax, %edi
	call	tc_add_v2.isra.0
	movl	%eax, %edi
	call	tc_add_v2.isra.0
	movl	%eax, %edi
	call	tc_add_v2.isra.0
	movl	%eax, %edi
	call	tc_add_v2.isra.0
	movl	%eax, %edi
	call	tc_add_v2.isra.0
	movl	%eax, %edi
	call	tc_add_v2.isra.0
	movl	%eax, %edi
	call	tc_add_v2.isra.0
	movl	%eax, %edi
	call	tc_add_v2.isra.0
	movl	%eax, %edi
	call	tc_add_v2.isra.0
	movq	stdout(%rip), %rcx
	movq	%rbx, %rdi
	movb	%al, 15(%rsp)
	call	fwrite@PLT
	cmpq	$1, %rax
	jne	.L18
	addl	$1, %r14d
	cmpl	$256, %r14d
	je	.L19
.L9:
	cmpl	$153, %r14d
	jne	.L12
	movl	$192, %edi
	testb	%bpl, %bpl
	jne	.L5
.L12:
	movl	%r12d, %edi
	xorl	%r14d, %edi
	movzbl	%dil, %edi
	imull	$147, %edi, %edi
	movzbl	%dil, %edi
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L18:
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
.L19:
	.cfi_restore_state
	addl	$1, %r13d
	cmpl	$256, %r13d
	jne	.L4
	xorl	%eax, %eax
	jmp	.L3
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
