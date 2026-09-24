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
	xorl	%ebp, %ebp
.LBB0_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
	xorl	%r12d, %r12d
	.p2align	4, 0x90
.LBB0_3:                                #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leal	(%r14,%r12), %eax
	movzbl	%al, %eax
	movl	%eax, %ecx
	shrl	$4, %ecx
	xorl	%eax, %ecx
	leal	(%rcx,%rcx,8), %eax
	leal	(%rax,%rax,2), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	andl	$31, %ecx
	xorl	%eax, %ecx
	movb	%cl, 15(%rsp)
	movq	(%r15), %rcx
	movl	$1, %esi
	movl	$1, %edx
	movq	%rbx, %rdi
	callq	fwrite@PLT
	cmpq	$1, %rax
	jne	.LBB0_4
# %bb.2:                                #   in Loop: Header=BB0_3 Depth=2
	addl	$9, %r12d
	cmpl	$2304, %r12d                    # imm = 0x900
	jne	.LBB0_3
# %bb.5:                                #   in Loop: Header=BB0_1 Depth=1
	incl	%ebp
	addl	$9, %r14d
	cmpl	$256, %ebp                      # imm = 0x100
	jne	.LBB0_1
# %bb.6:
	xorl	%eax, %eax
	jmp	.LBB0_7
.LBB0_4:
	movl	$2, %eax
.LBB0_7:
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
