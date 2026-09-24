	.file	"kernel.c"
	.text
	.type	tc_add_v1, @function
tc_add_v1:
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
	.size	tc_add_v1, .-tc_add_v1
	.type	tc_xor_v1, @function
tc_xor_v1:
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
	.size	tc_xor_v1, .-tc_xor_v1
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
	movl	%eax, -4(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L6
.L9:
	movl	-4(%rbp), %eax
	andl	$128, %eax
	testl	%eax, %eax
	je	.L7
	movl	-4(%rbp), %eax
	addl	%eax, %eax
	xorl	$7, %eax
	movzbl	%al, %eax
	jmp	.L8
.L7:
	movl	-4(%rbp), %eax
	addl	%eax, %eax
	movzbl	%al, %eax
.L8:
	movl	%eax, -4(%rbp)
	addl	$1, -8(%rbp)
.L6:
	cmpl	$7, -8(%rbp)
	jbe	.L9
	movl	-4(%rbp), %eax
	movl	$-1042947711, %esi
	movl	%eax, %edi
	call	tc_add_v1
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-170156251, %esi
	movl	%eax, %edi
	call	tc_xor_v1
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$388467663, %esi
	movl	%eax, %edi
	call	tc_xor_v1
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$201313723, %esi
	movl	%eax, %edi
	call	tc_add_v1
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-1179548917, %esi
	movl	%eax, %edi
	call	tc_xor_v1
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-578321115, %esi
	movl	%eax, %edi
	call	tc_add_v1
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-678465101, %esi
	movl	%eax, %edi
	call	tc_add_v1
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$1024952803, %esi
	movl	%eax, %edi
	call	tc_add_v1
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$91839871, %esi
	movl	%eax, %edi
	call	tc_add_v1
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-145414811, %esi
	movl	%eax, %edi
	call	tc_add_v1
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$661124463, %esi
	movl	%eax, %edi
	call	tc_add_v1
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$54869835, %esi
	movl	%eax, %edi
	call	tc_xor_v1
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-1495245, %esi
	movl	%eax, %edi
	call	tc_xor_v1
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$499630873, %esi
	movl	%eax, %edi
	call	tc_add_v1
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-1959546961, %esi
	movl	%eax, %edi
	call	tc_add_v1
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$356058095, %esi
	movl	%eax, %edi
	call	tc_add_v1
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-1492708973, %esi
	movl	%eax, %edi
	call	tc_xor_v1
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$1298882847, %esi
	movl	%eax, %edi
	call	tc_xor_v1
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$930155503, %esi
	movl	%eax, %edi
	call	tc_xor_v1
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-543819457, %esi
	movl	%eax, %edi
	call	tc_add_v1
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$1196140995, %esi
	movl	%eax, %edi
	call	tc_add_v1
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-1313345099, %esi
	movl	%eax, %edi
	call	tc_add_v1
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$905018877, %esi
	movl	%eax, %edi
	call	tc_add_v1
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$1338234289, %esi
	movl	%eax, %edi
	call	tc_add_v1
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-647656617, %esi
	movl	%eax, %edi
	call	tc_xor_v1
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-1117542501, %esi
	movl	%eax, %edi
	call	tc_add_v1
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$764233665, %esi
	movl	%eax, %edi
	call	tc_add_v1
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-280158327, %esi
	movl	%eax, %edi
	call	tc_xor_v1
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
.LFE3:
	.size	main, .-main
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
