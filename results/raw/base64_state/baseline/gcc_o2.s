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
	movl	$255, %r13d
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
	leaq	15(%rsp), %r12
.L2:
	xorl	%ebx, %ebx
.L13:
	cmpl	$57, %ebx
	ja	.L3
.L24:
	leal	4(%rbx), %eax
	cmpl	$47, %ebx
	ja	.L5
	movl	$62, %eax
	cmpl	$43, %ebx
	je	.L5
	cmpl	$47, %ebx
	movl	$63, %eax
	cmovne	%r13d, %eax
.L5:
	movq	stdout(%rip), %rcx
	xorl	%ebp, %eax
	movl	$1, %edx
	movq	%r12, %rdi
	movl	$1, %esi
	movb	%al, 15(%rsp)
	call	fwrite@PLT
	cmpq	$1, %rax
	jne	.L14
	addl	$1, %ebx
	cmpl	$57, %ebx
	jbe	.L24
.L3:
	cmpl	$90, %ebx
	ja	.L6
	leal	-65(%rbx), %eax
	cmpl	$64, %ebx
	cmovbe	%r13d, %eax
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L6:
	leal	-97(%rbx), %edx
	leal	-71(%rbx), %eax
	movq	stdout(%rip), %rcx
	movq	%r12, %rdi
	cmpb	$26, %dl
	movl	$1, %esi
	movl	$1, %edx
	cmovnb	%r13d, %eax
	xorl	%ebp, %eax
	movb	%al, 15(%rsp)
	call	fwrite@PLT
	cmpq	$1, %rax
	jne	.L14
	addl	$1, %ebx
	cmpl	$256, %ebx
	jne	.L13
	addl	$1, %ebp
	cmpl	$256, %ebp
	jne	.L2
	xorl	%eax, %eax
	jmp	.L1
	.p2align 4,,10
	.p2align 3
.L14:
	movl	$2, %eax
.L1:
	addq	$24, %rsp
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
	.cfi_endproc
.LFE4:
	.size	main, .-main
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
