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
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$255, %edx
	cmpl	%edx, %eax
	cmova	%edx, %eax
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$690708857, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$1468885793, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$996500409, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-1078873699, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-1353627351, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$1564202985, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$934494485, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-610589949, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-711637207, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-1019892835, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-1444984399, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$459232043, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$1534181691, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$895558051, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-850177125, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$361462267, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$55142201, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-135280647, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$900665731, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$63130965, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-378826375, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$1739407645, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$1644152221, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$1699309459, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-939937481, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$32088881, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$157352421, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$1063329193, %esi
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
