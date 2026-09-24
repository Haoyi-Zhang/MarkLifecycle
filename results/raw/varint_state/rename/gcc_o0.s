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
	movzbl	-24(%rbp), %eax
	testb	%al, %al
	jns	.L2
	movzbl	-20(%rbp), %eax
	leal	(%rax,%rax), %edx
	movzbl	-24(%rbp), %eax
	andl	$127, %eax
	xorl	%edx, %eax
	movzbl	%al, %eax
	jmp	.L3
.L2:
	movzbl	-20(%rbp), %edx
	movzbl	-24(%rbp), %eax
	addl	%edx, %eax
	movzbl	%al, %eax
.L3:
	movl	%eax, -4(%rbp)
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
	jmp	.L6
.L12:
	movl	$0, -8(%rbp)
	jmp	.L7
.L11:
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
	je	.L8
	movl	$2, %eax
	jmp	.L10
.L8:
	addl	$1, -8(%rbp)
.L7:
	cmpl	$255, -8(%rbp)
	jbe	.L11
	addl	$1, -4(%rbp)
.L6:
	cmpl	$255, -4(%rbp)
	jbe	.L12
	movl	$0, %eax
.L10:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
