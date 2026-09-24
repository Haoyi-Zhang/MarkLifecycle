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
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	xorl	%r14d, %r14d
	movq	stdout@GOTPCREL(%rip), %r15
	leaq	11(%rsp), %rbx
	movabsq	$4294977024, %r12               # imm = 0x100002600
.LBB0_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
	leal	-1(%r14), %eax
	movl	%eax, 16(%rsp)                  # 4-byte Spill
	leal	1(%r14), %eax
	movl	%eax, 20(%rsp)                  # 4-byte Spill
	leal	-128(%r14), %eax
	movl	%eax, 12(%rsp)                  # 4-byte Spill
	movl	%r14d, %ebp
	xorl	$66, %ebp
	xorl	%r13d, %r13d
	.p2align	4, 0x90
.LBB0_3:                                #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpb	$32, %r13b
	ja	.LBB0_5
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=2
	movzbl	%r13b, %eax
	btq	%rax, %r12
	movl	%r14d, %eax
	jae	.LBB0_5
.LBB0_9:                                #   in Loop: Header=BB0_3 Depth=2
	movl	%r13d, %ecx
	xorl	$153, %ecx
	orl	%ebp, %ecx
	sete	%cl
	xorb	%al, %cl
	movb	%cl, 11(%rsp)
	movq	(%r15), %rcx
	movl	$1, %esi
	movl	$1, %edx
	movq	%rbx, %rdi
	callq	fwrite@PLT
	cmpq	$1, %rax
	jne	.LBB0_10
# %bb.2:                                #   in Loop: Header=BB0_3 Depth=2
	incl	%r13d
	cmpl	$256, %r13d                     # imm = 0x100
	jne	.LBB0_3
	jmp	.LBB0_11
.LBB0_5:                                #   in Loop: Header=BB0_3 Depth=2
	movl	%r13d, %ecx
	andb	$-33, %cl
	movl	20(%rsp), %eax                  # 4-byte Reload
                                        # kill: def $al killed $al killed $eax
	cmpb	$91, %cl
	je	.LBB0_9
# %bb.6:                                #   in Loop: Header=BB0_3 Depth=2
	movl	%r13d, %ecx
	andl	$223, %ecx
	movl	16(%rsp), %eax                  # 4-byte Reload
                                        # kill: def $al killed $al killed $eax
	cmpl	$93, %ecx
	je	.LBB0_9
# %bb.7:                                #   in Loop: Header=BB0_3 Depth=2
	movl	12(%rsp), %eax                  # 4-byte Reload
                                        # kill: def $al killed $al killed $eax
	cmpl	$34, %r13d
	je	.LBB0_9
# %bb.8:                                #   in Loop: Header=BB0_3 Depth=2
	movl	%r13d, %eax
	andb	$3, %al
	addb	%r14b, %al
	jmp	.LBB0_9
	.p2align	4, 0x90
.LBB0_11:                               #   in Loop: Header=BB0_1 Depth=1
	incl	%r14d
	cmpl	$256, %r14d                     # imm = 0x100
	jne	.LBB0_1
# %bb.12:
	xorl	%eax, %eax
	jmp	.LBB0_13
.LBB0_10:
	movl	$2, %eax
.LBB0_13:
	addq	$24, %rsp
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
