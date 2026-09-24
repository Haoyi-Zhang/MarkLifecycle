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
	cmpb	$9, -24(%rbp)
	je	.L6
	cmpb	$10, -24(%rbp)
	je	.L6
	cmpb	$13, -24(%rbp)
	je	.L6
	cmpb	$32, -24(%rbp)
	jne	.L7
.L6:
	movzbl	-20(%rbp), %eax
	movl	%eax, -4(%rbp)
	jmp	.L8
.L7:
	cmpb	$123, -24(%rbp)
	je	.L9
	cmpb	$91, -24(%rbp)
	jne	.L10
.L9:
	movzbl	-20(%rbp), %eax
	addl	$1, %eax
	andl	$255, %eax
	movl	%eax, -4(%rbp)
	jmp	.L8
.L10:
	cmpb	$125, -24(%rbp)
	je	.L11
	cmpb	$93, -24(%rbp)
	jne	.L12
.L11:
	movzbl	-20(%rbp), %eax
	subl	$1, %eax
	andl	$255, %eax
	movl	%eax, -4(%rbp)
	jmp	.L8
.L12:
	cmpb	$34, -24(%rbp)
	jne	.L13
	movzbl	-20(%rbp), %eax
	xorl	$-128, %eax
	movzbl	%al, %eax
	movl	%eax, -4(%rbp)
	jmp	.L8
.L13:
	movzbl	-20(%rbp), %eax
	movzbl	-24(%rbp), %edx
	andl	$3, %edx
	addl	%edx, %eax
	andl	$255, %eax
	movl	%eax, -4(%rbp)
.L8:
	movl	-4(%rbp), %eax
	movl	$-1217953973, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-149612731, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-1688889893, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-1120014413, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$925448607, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-370074307, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$659145059, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-2115648137, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$1841894881, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$435643767, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$1271503267, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$1025349565, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$464207355, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$569763237, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-1150717155, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-349752881, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-1652191791, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$222156219, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-1782770257, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-45247529, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-471520789, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-1644452027, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$999902141, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-1146404539, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-908235913, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$2030794161, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-444741685, %esi
	movl	%eax, %edi
	call	tc_add_v2
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
	jmp	.L16
.L22:
	movl	$0, -8(%rbp)
	jmp	.L17
.L21:
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
	je	.L18
	movl	$2, %eax
	jmp	.L20
.L18:
	addl	$1, -8(%rbp)
.L17:
	cmpl	$255, -8(%rbp)
	jbe	.L21
	addl	$1, -4(%rbp)
.L16:
	cmpl	$255, -4(%rbp)
	jbe	.L22
	movl	$0, %eax
.L20:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
