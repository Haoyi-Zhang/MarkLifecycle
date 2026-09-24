	.file	"kernel.c"
	.text
	.type	tc_add_v2, @function
tc_add_v2:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	tc_add_v2, .-tc_add_v2
	.type	tc_xor_v2, @function
tc_xor_v2:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	tc_xor_v2, .-tc_xor_v2
	.type	kernel, @function
kernel:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$24, %rsp
	movl	%edi, %edx
	movl	%esi, %eax
	movb	%dl, -20(%rbp)
	movb	%al, -24(%rbp)
	movzbl	-20(%rbp), %edx
	movzbl	-24(%rbp), %eax
	leal	(%rdx,%rax), %ecx
	movl	%ecx, %edx
	movl	$2155905153, %eax
	imulq	%rdx, %rax
	shrq	$32, %rax
	shrl	$7, %eax
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %edx
	movl	%edx, %eax
	sall	$8, %eax
	subl	%edx, %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	movl	%edx, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$655168863, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$1329724375, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-2050004599, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$763066311, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-2047087119, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-1914579973, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-1892711119, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$630404059, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$2004685735, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-1761540187, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-446693627, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-2053022793, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$1034772943, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-445694067, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-1043998409, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$1767084431, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-1459382837, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-821212813, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-1587332161, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-907712629, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-1920755259, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-1210109061, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$292626733, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$219887905, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$837238705, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-211813001, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	kernel, .-kernel
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$0, -4(%rbp)
	jmp	.L8
.L14:
	movl	$0, -8(%rbp)
	jmp	.L9
.L13:
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
	je	.L10
	movl	$2, %eax
	jmp	.L12
.L10:
	addl	$1, -8(%rbp)
.L9:
	cmpl	$255, -8(%rbp)
	jbe	.L13
	addl	$1, -4(%rbp)
.L8:
	cmpl	$255, -4(%rbp)
	jbe	.L14
	movl	$0, %eax
.L12:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
