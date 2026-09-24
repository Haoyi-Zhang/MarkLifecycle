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
.L4:
	xorl	%r12d, %r12d
	jmp	.L7
	.p2align 4,,10
	.p2align 3
.L5:
	addl	$1, %r12d
	cmpl	$256, %r12d
	je	.L11
.L7:
	leal	(%r12,%rbx), %eax
	movl	$1, %esi
	leal	(%rax,%rax,8), %eax
	movzbl	%al, %eax
	movl	%eax, %edx
	shrl	$4, %edx
	xorl	%edx, %eax
	movl	$1, %edx
	leal	(%rax,%rax,2), %eax
	leal	(%rax,%rax,8), %edi
	movzbl	%dil, %edi
	movl	%edi, %eax
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
	movq	stdout(%rip), %rcx
	movq	%rbp, %rdi
	movb	%al, 15(%rsp)
	call	fwrite@PLT
	cmpq	$1, %rax
	je	.L5
	movl	$2, %eax
.L3:
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
.L11:
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
