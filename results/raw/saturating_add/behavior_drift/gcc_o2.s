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
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	xorl	%ebp, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$24, %rsp
	.cfi_def_cfa_offset 64
	leaq	15(%rsp), %r13
.L4:
	cmpl	$66, %ebp
	sete	%r12b
	xorl	%ebx, %ebx
	jmp	.L7
	.p2align 4,,10
	.p2align 3
.L5:
	addl	$1, %ebx
	cmpl	$256, %ebx
	je	.L11
.L7:
	movl	$255, %eax
	leal	(%rbx,%rbp), %edi
	movl	$1, %edx
	movl	$1, %esi
	cmpl	%eax, %edi
	cmova	%eax, %edi
	xorl	%eax, %eax
	cmpl	$153, %ebx
	sete	%al
	andl	%r12d, %eax
	xorl	%eax, %edi
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
	movl	%eax, %edi
	call	tc_add_v2.isra.0
	movq	stdout(%rip), %rcx
	movq	%r13, %rdi
	movb	%al, 15(%rsp)
	call	fwrite@PLT
	cmpq	$1, %rax
	je	.L5
	movl	$2, %eax
.L3:
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
.L11:
	.cfi_restore_state
	addl	$1, %ebp
	cmpl	$256, %ebp
	jne	.L4
	xorl	%eax, %eax
	jmp	.L3
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
