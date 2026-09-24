	.file	"kernel.c"
	.text
	.type	kernel, @function
kernel:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, %edx
	movl	%esi, %eax
	movb	%dl, -20(%rbp)
	movb	%al, -24(%rbp)
	cmpb	$9, -24(%rbp)
	je	.L2
	cmpb	$10, -24(%rbp)
	je	.L2
	cmpb	$13, -24(%rbp)
	je	.L2
	cmpb	$32, -24(%rbp)
	jne	.L3
.L2:
	movzbl	-20(%rbp), %eax
	movl	%eax, -4(%rbp)
	jmp	.L4
.L3:
	cmpb	$123, -24(%rbp)
	je	.L5
	cmpb	$91, -24(%rbp)
	jne	.L6
.L5:
	movzbl	-20(%rbp), %eax
	addl	$1, %eax
	andl	$255, %eax
	movl	%eax, -4(%rbp)
	jmp	.L4
.L6:
	cmpb	$125, -24(%rbp)
	je	.L7
	cmpb	$93, -24(%rbp)
	jne	.L8
.L7:
	movzbl	-20(%rbp), %eax
	subl	$1, %eax
	andl	$255, %eax
	movl	%eax, -4(%rbp)
	jmp	.L4
.L8:
	cmpb	$34, -24(%rbp)
	jne	.L9
	movzbl	-20(%rbp), %eax
	xorl	$-128, %eax
	movzbl	%al, %eax
	movl	%eax, -4(%rbp)
	jmp	.L4
.L9:
	movzbl	-20(%rbp), %eax
	movzbl	-24(%rbp), %edx
	andl	$3, %edx
	addl	%edx, %eax
	andl	$255, %eax
	movl	%eax, -4(%rbp)
.L4:
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	kernel, .-kernel
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$0, -4(%rbp)
	jmp	.L12
.L18:
	movl	$0, -8(%rbp)
	jmp	.L13
.L17:
	movl	-8(%rbp), %eax
	movzbl	%al, %edx
	movl	-4(%rbp), %eax
	movzbl	%al, %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	kernel
	movb	%al, -9(%rbp)
	movq	stdout(%rip), %rdx
	leaq	-9(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$1, %esi
	movq	%rax, %rdi
	call	fwrite@PLT
	cmpq	$1, %rax
	je	.L14
	movl	$2, %eax
	jmp	.L16
.L14:
	addl	$1, -8(%rbp)
.L13:
	cmpl	$255, -8(%rbp)
	jbe	.L17
	addl	$1, -4(%rbp)
.L12:
	cmpl	$255, -4(%rbp)
	jbe	.L18
	movl	$0, %eax
.L16:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
