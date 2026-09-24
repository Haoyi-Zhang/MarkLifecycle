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
	movzbl	-24(%rbp), %ecx
	movl	$-51, %edx
	movl	%edx, %eax
	mulb	%cl
	shrw	$8, %ax
	movl	%eax, %edx
	shrb	$3, %dl
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	movzbl	%dl, %eax
	movl	%eax, -4(%rbp)
	movzbl	-20(%rbp), %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	.L6
	sall	-4(%rbp)
	cmpl	$9, -4(%rbp)
	jbe	.L6
	subl	$9, -4(%rbp)
.L6:
	movzbl	-20(%rbp), %edx
	movl	-4(%rbp), %eax
	addl	%edx, %eax
	andl	$255, %eax
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-955664489, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-1649567879, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-1712354337, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-1040758317, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-1210995, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-480048687, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-1619063821, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-418557033, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-1479055891, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$725163935, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-311717389, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-2081604143, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$1873105747, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$231464815, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$534086103, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-541638813, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-38930007, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$2143886737, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-807164941, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$1935259581, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-139617483, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$735310249, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$389747629, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-380263123, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$1272796119, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$894540037, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$1439810927, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$830843303, %esi
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
	jmp	.L9
.L15:
	movl	$0, -8(%rbp)
	jmp	.L10
.L14:
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
	je	.L11
	movl	$2, %eax
	jmp	.L13
.L11:
	addl	$1, -8(%rbp)
.L10:
	cmpl	$255, -8(%rbp)
	jbe	.L14
	addl	$1, -4(%rbp)
.L9:
	cmpl	$255, -4(%rbp)
	jbe	.L15
	movl	$0, %eax
.L13:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
