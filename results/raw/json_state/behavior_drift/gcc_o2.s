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
	movl	$1, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	xorl	%ebp, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	leaq	31(%rsp), %rbx
.L4:
	movl	%ebp, %eax
	cmpl	$66, %ebp
	leal	-1(%rbp), %r12d
	movb	%bpl, 15(%rsp)
	leal	-128(%rax), %r13d
	sete	14(%rsp)
	movzbl	%r12b, %r12d
	xorl	%r15d, %r15d
	movzbl	%r13b, %r13d
	jmp	.L17
	.p2align 4,,10
	.p2align 3
.L6:
	cmpl	$123, %r15d
	je	.L10
	ja	.L11
	cmpl	$91, %r15d
	je	.L10
	cmpl	$93, %r15d
	jne	.L9
.L12:
	movl	%r12d, %edi
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
	movl	%eax, %edi
	call	tc_add_v2.isra.0
	movl	%eax, %edi
	call	tc_add_v2.isra.0
	movq	stdout(%rip), %rcx
	movq	%rbx, %rdi
	movb	%al, 31(%rsp)
	call	fwrite@PLT
	cmpq	$1, %rax
	jne	.L42
	addl	$1, %r15d
	cmpl	$256, %r15d
	je	.L43
.L17:
	movl	%r15d, %eax
	cmpl	$34, %r15d
	je	.L5
	ja	.L6
	movl	%ebp, %edi
	cmpl	$13, %r15d
	je	.L7
	ja	.L8
	leal	-9(%rax), %edx
	cmpb	$1, %dl
	jbe	.L7
.L9:
	andl	$3, %eax
	addb	15(%rsp), %al
	movzbl	%al, %edi
	jmp	.L7
	.p2align 4,,10
	.p2align 3
.L5:
	movl	%r13d, %edi
	jmp	.L7
	.p2align 4,,10
	.p2align 3
.L10:
	movzbl	%r14b, %edi
	jmp	.L7
	.p2align 4,,10
	.p2align 3
.L11:
	cmpl	$125, %r15d
	je	.L12
	cmpl	$153, %r15d
	jne	.L9
	cmpb	$0, 14(%rsp)
	je	.L9
	movl	$66, %edi
	jmp	.L7
	.p2align 4,,10
	.p2align 3
.L8:
	cmpl	$32, %r15d
	je	.L7
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L42:
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
.L43:
	.cfi_restore_state
	addl	$1, %ebp
	addl	$1, %r14d
	cmpl	$256, %ebp
	jne	.L4
	xorl	%eax, %eax
	jmp	.L3
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
