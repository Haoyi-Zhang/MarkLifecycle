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
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movl	$1, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movl	$-1, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	leaq	31(%rsp), %rbx
.L4:
	leal	-127(%rbp), %eax
	leal	1(%rbp), %r12d
	xorl	%r14d, %r14d
	movb	%al, 15(%rsp)
	leal	1(%rbp), %r15d
	jmp	.L15
	.p2align 4,,10
	.p2align 3
.L6:
	cmpl	$123, %r14d
	je	.L10
	ja	.L11
	cmpl	$91, %r14d
	je	.L10
	cmpl	$93, %r14d
	jne	.L9
.L12:
	movzbl	%bpl, %edi
.L7:
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
	movq	stdout(%rip), %rcx
	movq	%rbx, %rdi
	movb	%al, 31(%rsp)
	call	fwrite@PLT
	cmpq	$1, %rax
	jne	.L35
	addl	$1, %r14d
	cmpl	$256, %r14d
	je	.L36
.L15:
	movl	%r14d, %eax
	cmpl	$34, %r14d
	je	.L5
	ja	.L6
	movl	%r12d, %edi
	cmpl	$13, %r14d
	je	.L7
	ja	.L8
	leal	-9(%rax), %edx
	cmpb	$1, %dl
	jbe	.L7
.L9:
	andl	$3, %eax
	addl	%r15d, %eax
	movzbl	%al, %edi
	jmp	.L7
	.p2align 4,,10
	.p2align 3
.L5:
	movzbl	15(%rsp), %edi
	jmp	.L7
	.p2align 4,,10
	.p2align 3
.L10:
	movzbl	%r13b, %edi
	jmp	.L7
	.p2align 4,,10
	.p2align 3
.L11:
	cmpl	$125, %r14d
	je	.L12
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L8:
	cmpl	$32, %r14d
	je	.L7
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L35:
	movl	$2, %eax
.L3:
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L36:
	.cfi_restore_state
	addl	$1, %r13d
	cmpl	$255, %r12d
	je	.L18
	movl	%r12d, %ebp
	jmp	.L4
.L18:
	xorl	%eax, %eax
	jmp	.L3
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
