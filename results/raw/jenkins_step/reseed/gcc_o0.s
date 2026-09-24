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
	addl	%edx, %eax
	movzbl	%al, %eax
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	leal	0(,%rax,8), %edx
	movl	-4(%rbp), %eax
	addl	%edx, %eax
	andl	$255, %eax
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	shrl	$4, %eax
	xorl	%eax, -4(%rbp)
	movl	-4(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	leal	0(,%rax,8), %edx
	addl	%edx, %eax
	andl	$255, %eax
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	shrl	$3, %eax
	xorl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$1774387511, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-2061798109, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$1401235927, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-1413498415, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-307518645, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$2004041067, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-1416405509, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-1692933143, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-1154108431, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$1942706003, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$1906270511, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$860687769, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$26045931, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$893602063, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-1522020039, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-1409419991, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$455733749, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-1014778021, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-3032621, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$836226473, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-1021863053, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-1789405787, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-547930181, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-1520619165, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-777019989, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$827168047, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$800827141, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-1215306999, %esi
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
