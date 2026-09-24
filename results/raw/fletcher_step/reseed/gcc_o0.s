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
	movl	$-1007970535, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-1686787143, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$1438102959, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$602101233, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$1800915869, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-318411799, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-1248607997, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-1516817609, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$1235582431, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-513336501, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-83532829, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-615153397, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-1187441313, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-1746172041, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$1838898543, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-1717982291, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-1286229135, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-2021021843, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$856669527, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$1130484119, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$1375713247, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$324346361, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-1893993497, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-2087774341, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$767021927, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-1892682939, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-382629031, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$58414339, %esi
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
