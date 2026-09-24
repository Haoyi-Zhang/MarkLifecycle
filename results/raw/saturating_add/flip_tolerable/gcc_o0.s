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
	movl	$1203356553, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$1474810707, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-1381164183, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$2065548177, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$18566943, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-172678857, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-1010858039, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$535510907, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$1869967645, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-989388853, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-1759269473, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-343708191, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-1681191473, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-1243096611, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-1678417445, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$931241453, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-1691501247, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$2101299129, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$256218965, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-1209946637, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-1859408101, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-71084271, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$2038822359, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$1462718311, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-1118470349, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$1408579397, %esi
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
