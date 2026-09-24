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
	leaq	15(%rsp), %r12
.L4:
	cmpl	$66, %r13d
	movl	%r13d, %ebp
	sete	%bl
	xorl	%r14d, %r14d
	jmp	.L7
	.p2align 4,,10
	.p2align 3
.L5:
	addl	$1, %r14d
	cmpl	$256, %r14d
	je	.L11
.L7:
	leal	0(%rbp,%r14), %eax
	xorl	%edi, %edi
	movl	$1, %esi
	leal	(%rax,%rax,8), %eax
	movzbl	%al, %eax
	movl	%eax, %edx
	shrl	$4, %edx
	xorl	%edx, %eax
	cmpl	$153, %r14d
	movl	$1, %edx
	leal	(%rax,%rax,2), %eax
	sete	%dil
	leal	(%rax,%rax,8), %eax
	andl	%ebx, %edi
	movzbl	%al, %eax
	xorl	%eax, %edi
	shrl	$3, %eax
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
	movq	%r12, %rdi
	movb	%al, 15(%rsp)
	call	fwrite@PLT
	cmpq	$1, %rax
	je	.L5
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
.L11:
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
