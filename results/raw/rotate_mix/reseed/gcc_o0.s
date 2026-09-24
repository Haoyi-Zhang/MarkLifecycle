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
	movzbl	-20(%rbp), %eax
	leal	0(,%rax,8), %edx
	movzbl	-20(%rbp), %eax
	shrb	$5, %al
	movzbl	%al, %eax
	orl	%edx, %eax
	andl	$255, %eax
	movl	%eax, -4(%rbp)
	movzbl	-24(%rbp), %eax
	xorl	-4(%rbp), %eax
	movl	%eax, %edx
	movzbl	-24(%rbp), %eax
	shrb	$2, %al
	movzbl	%al, %eax
	xorl	%edx, %eax
	andl	$255, %eax
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-805751551, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-1424415941, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-949378737, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-269403341, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-1551402053, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-345275443, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$363005697, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-1481150587, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$1608872307, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-1149295623, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-1422013597, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$1803651869, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-1418605201, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-1056073753, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$791890179, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$158302069, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-508595441, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-448433333, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-2026251795, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$151893463, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-1611327581, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-548573193, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$1136625055, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-1510516305, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-1047976505, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-715432023, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$394626949, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-35683983, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
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
