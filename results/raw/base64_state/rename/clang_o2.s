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
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	xorl	%ebp, %ebp
	movq	stdout@GOTPCREL(%rip), %r14
	leaq	7(%rsp), %rbx
	movl	$62, %r15d
.LBB0_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
	movl	$-256, %r12d
	xorl	%r13d, %r13d
	.p2align	4, 0x90
.LBB0_3:                                #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leal	-65(%r12), %eax
	cmpb	$26, %al
	jae	.LBB0_5
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=2
	leal	-65(%r13), %eax
	jmp	.LBB0_10
	.p2align	4, 0x90
.LBB0_5:                                #   in Loop: Header=BB0_3 Depth=2
	leal	-97(%r12), %eax
	cmpb	$25, %al
	ja	.LBB0_7
# %bb.6:                                #   in Loop: Header=BB0_3 Depth=2
	leal	-71(%r12), %eax
	jmp	.LBB0_10
	.p2align	4, 0x90
.LBB0_7:                                #   in Loop: Header=BB0_3 Depth=2
	leal	-48(%r12), %eax
	cmpb	$9, %al
	ja	.LBB0_9
# %bb.8:                                #   in Loop: Header=BB0_3 Depth=2
	leal	4(%r13), %eax
	jmp	.LBB0_10
.LBB0_9:                                #   in Loop: Header=BB0_3 Depth=2
	cmpl	$-209, %r12d
	setne	%al
	negb	%al
	orb	$63, %al
	cmpl	$-213, %r12d
	movzbl	%al, %eax
	cmovel	%r15d, %eax
	.p2align	4, 0x90
.LBB0_10:                               #   in Loop: Header=BB0_3 Depth=2
	xorb	%bpl, %al
	movb	%al, 7(%rsp)
	movq	(%r14), %rcx
	movl	$1, %esi
	movl	$1, %edx
	movq	%rbx, %rdi
	callq	fwrite@PLT
	cmpq	$1, %rax
	jne	.LBB0_11
# %bb.2:                                #   in Loop: Header=BB0_3 Depth=2
	incl	%r13d
	incl	%r12d
	jne	.LBB0_3
# %bb.12:                               #   in Loop: Header=BB0_1 Depth=1
	incl	%ebp
	cmpl	$256, %ebp                      # imm = 0x100
	jne	.LBB0_1
# %bb.13:
	xorl	%eax, %eax
	jmp	.LBB0_14
.LBB0_11:
	movl	$2, %eax
.LBB0_14:
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
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
