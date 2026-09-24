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
	cmpb	$64, -24(%rbp)
	jbe	.L6
	cmpb	$90, -24(%rbp)
	ja	.L6
	movzbl	-24(%rbp), %eax
	subl	$65, %eax
	movl	%eax, -4(%rbp)
	jmp	.L7
.L6:
	cmpb	$96, -24(%rbp)
	jbe	.L8
	cmpb	$122, -24(%rbp)
	ja	.L8
	movzbl	-24(%rbp), %eax
	subl	$71, %eax
	movl	%eax, -4(%rbp)
	jmp	.L7
.L8:
	cmpb	$47, -24(%rbp)
	jbe	.L9
	cmpb	$57, -24(%rbp)
	ja	.L9
	movzbl	-24(%rbp), %eax
	addl	$4, %eax
	movl	%eax, -4(%rbp)
	jmp	.L7
.L9:
	cmpb	$43, -24(%rbp)
	jne	.L10
	movl	$62, -4(%rbp)
	jmp	.L7
.L10:
	cmpb	$47, -24(%rbp)
	jne	.L11
	movl	$63, -4(%rbp)
	jmp	.L7
.L11:
	movl	$255, -4(%rbp)
.L7:
	movzbl	-20(%rbp), %eax
	xorl	-4(%rbp), %eax
	andl	$255, %eax
	movl	%eax, -8(%rbp)
	cmpb	$66, -20(%rbp)
	jne	.L12
	cmpb	$-103, -24(%rbp)
	jne	.L12
	xorl	$1, -8(%rbp)
.L12:
	movl	-8(%rbp), %eax
	movl	$-1754324589, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-43913373, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-1857051175, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-1420225749, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-552384727, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-1649842339, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-443310283, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-1686135339, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-1850218087, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-985674837, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$1576341773, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-1175622881, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$1330379609, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-1421365811, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$836893615, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-48819807, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$1369794969, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-1246764261, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-1584025319, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-1384962105, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-44961853, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$2138278765, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-1389500551, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-473743061, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-1717999229, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-1990099705, %esi
	movl	%eax, %edi
	call	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$1744525667, %esi
	movl	%eax, %edi
	call	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$-1989422163, %esi
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
	jmp	.L15
.L21:
	movl	$0, -8(%rbp)
	jmp	.L16
.L20:
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
	je	.L17
	movl	$2, %eax
	jmp	.L19
.L17:
	addl	$1, -8(%rbp)
.L16:
	cmpl	$255, -8(%rbp)
	jbe	.L20
	addl	$1, -4(%rbp)
.L15:
	cmpl	$255, -4(%rbp)
	jbe	.L21
	movl	$0, %eax
.L19:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
