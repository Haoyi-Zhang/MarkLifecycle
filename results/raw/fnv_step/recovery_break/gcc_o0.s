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
	xorb	-24(%rbp), %al
	movzbl	%al, %eax
	imull	$147, %eax, %eax
	andl	$255, %eax
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-977200717, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-414456531, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$1401361235, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$1703795523, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$1965803305, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-2115390081, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-1153706065, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$2010892099, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-642826815, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-648448241, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-1216875681, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$1866983815, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$85008877, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-2052502133, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$1530525021, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$2040369643, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-578578959, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$2032864067, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-1724675625, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-1491915855, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-43388111, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-1010053347, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-906019959, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$2069880657, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$1192321361, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$1333491605, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$2038785847, %esi
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
