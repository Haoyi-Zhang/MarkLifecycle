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
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	xorl	%ebp, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$16, %rsp
	.cfi_def_cfa_offset 64
	leaq	15(%rsp), %r12
.L4:
	cmpl	$66, %ebp
	movl	%ebp, %r13d
	sete	%r14b
	xorl	%ebx, %ebx
	xorl	$62, %r13d
	jmp	.L16
	.p2align 4,,10
	.p2align 3
.L24:
	cmpl	$47, %ebx
	ja	.L6
	movl	%r13d, %edi
	cmpl	$43, %ebx
	je	.L13
	movl	%ebp, %edi
	xorl	$63, %edi
	cmpl	$47, %ebx
	jne	.L9
	.p2align 4
	.p2align 3
.L13:
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
	movq	%r12, %rdi
	movb	%al, 15(%rsp)
	call	fwrite@PLT
	cmpq	$1, %rax
	jne	.L22
	addl	$1, %ebx
	cmpl	$256, %ebx
	je	.L23
.L16:
	cmpl	$57, %ebx
	jbe	.L24
	cmpl	$90, %ebx
	ja	.L10
	leal	-65(%rbx), %edi
	xorl	%ebp, %edi
	cmpl	$64, %ebx
	ja	.L13
.L9:
	xorl	%edi, %edi
	cmpl	$153, %ebx
	sete	%dil
	andl	%r14d, %edi
	xorl	%ebp, %edi
	xorb	$-1, %dil
	jmp	.L13
	.p2align 4,,10
	.p2align 3
.L10:
	leal	-97(%rbx), %eax
	cmpb	$25, %al
	ja	.L9
	leal	-71(%rbx), %edi
	xorl	%ebp, %edi
	jmp	.L13
	.p2align 4,,10
	.p2align 3
.L6:
	leal	4(%rbx), %edi
	xorl	%ebp, %edi
	jmp	.L13
	.p2align 4,,10
	.p2align 3
.L22:
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
.L23:
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
