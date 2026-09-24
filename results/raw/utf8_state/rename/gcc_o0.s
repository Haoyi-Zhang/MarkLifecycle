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
	cmpb	$0, -20(%rbp)
	je	.L2
	movzbl	-24(%rbp), %eax
	andl	$192, %eax
	cmpl	$128, %eax
	jne	.L3
	movzbl	-20(%rbp), %eax
	subl	$1, %eax
	movzbl	%al, %eax
	jmp	.L4
.L3:
	movl	$255, %eax
.L4:
	movl	%eax, -4(%rbp)
	jmp	.L5
.L2:
	movzbl	-24(%rbp), %eax
	testb	%al, %al
	js	.L6
	movl	$0, -4(%rbp)
	jmp	.L5
.L6:
	cmpb	$-63, -24(%rbp)
	jbe	.L7
	cmpb	$-33, -24(%rbp)
	ja	.L7
	movl	$1, -4(%rbp)
	jmp	.L5
.L7:
	cmpb	$-33, -24(%rbp)
	jbe	.L8
	cmpb	$-17, -24(%rbp)
	ja	.L8
	movl	$2, -4(%rbp)
	jmp	.L5
.L8:
	cmpb	$-17, -24(%rbp)
	jbe	.L9
	cmpb	$-12, -24(%rbp)
	ja	.L9
	movl	$3, -4(%rbp)
	jmp	.L5
.L9:
	movl	$255, -4(%rbp)
.L5:
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
