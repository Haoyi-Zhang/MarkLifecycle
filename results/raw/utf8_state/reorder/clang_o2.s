	.text
	.file	"kernel.c"
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	subq	$16, %rsp
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	xorl	%r14d, %r14d
	movq	stdout@GOTPCREL(%rip), %r15
	leaq	15(%rsp), %rbx
.LBB0_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
	leal	-1(%r14), %eax
	movzbl	%al, %ebp
	xorl	%r12d, %r12d
	.p2align	4, 0x90
.LBB0_3:                                #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	testl	%r14d, %r14d
	je	.LBB0_5
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=2
	movl	%r12d, %eax
	andb	$-64, %al
	negb	%al
	movl	$255, %eax
	cmovol	%ebp, %eax
	jmp	.LBB0_10
	.p2align	4, 0x90
.LBB0_5:                                #   in Loop: Header=BB0_3 Depth=2
	testb	%r12b, %r12b
	js	.LBB0_7
# %bb.6:                                #   in Loop: Header=BB0_3 Depth=2
	xorl	%eax, %eax
	jmp	.LBB0_10
.LBB0_7:                                #   in Loop: Header=BB0_3 Depth=2
	leal	62(%r12), %ecx
	movb	$1, %al
	cmpb	$30, %cl
	jb	.LBB0_10
# %bb.8:                                #   in Loop: Header=BB0_3 Depth=2
	movl	%r12d, %ecx
	andb	$-16, %cl
	movb	$2, %al
	cmpb	$-32, %cl
	je	.LBB0_10
# %bb.9:                                #   in Loop: Header=BB0_3 Depth=2
	leal	16(%r12), %eax
	cmpb	$5, %al
	movl	$0, %eax
	adcb	$-1, %al
	orb	$3, %al
	.p2align	4, 0x90
.LBB0_10:                               #   in Loop: Header=BB0_3 Depth=2
	movb	%al, 15(%rsp)
	movq	(%r15), %rcx
	movl	$1, %esi
	movl	$1, %edx
	movq	%rbx, %rdi
	callq	fwrite@PLT
	cmpq	$1, %rax
	jne	.LBB0_11
# %bb.2:                                #   in Loop: Header=BB0_3 Depth=2
	incl	%r12d
	cmpl	$256, %r12d                     # imm = 0x100
	jne	.LBB0_3
# %bb.12:                               #   in Loop: Header=BB0_1 Depth=1
	incl	%r14d
	cmpl	$256, %r14d                     # imm = 0x100
	jne	.LBB0_1
# %bb.13:
	xorl	%eax, %eax
	jmp	.LBB0_14
.LBB0_11:
	movl	$2, %eax
.LBB0_14:
	addq	$16, %rsp
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 17.0.0 (https://github.com/swiftlang/llvm-project.git 10999b6d034fe318f3d56c83bddb6572593a8bb0)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
