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
	xorl	%r14d, %r14d
	movl	$218, %r15d
	movq	stdout@GOTPCREL(%rip), %r12
	leaq	7(%rsp), %rbx
.LBB0_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
	movl	%r14d, %r13d
	xorl	$66, %r13d
	xorl	%ebp, %ebp
	.p2align	4, 0x90
.LBB0_3:                                #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leal	(%r14,%rbp), %eax
	cmpl	$255, %eax
	movl	$255, %ecx
	cmovael	%ecx, %eax
	movl	%ebp, %ecx
	xorl	$153, %ecx
	orl	%r13d, %ecx
	cmovel	%r15d, %eax
	movb	%al, 7(%rsp)
	movq	(%r12), %rcx
	movl	$1, %esi
	movl	$1, %edx
	movq	%rbx, %rdi
	callq	fwrite@PLT
	cmpq	$1, %rax
	jne	.LBB0_4
# %bb.2:                                #   in Loop: Header=BB0_3 Depth=2
	incl	%ebp
	cmpl	$256, %ebp                      # imm = 0x100
	jne	.LBB0_3
# %bb.5:                                #   in Loop: Header=BB0_1 Depth=1
	incl	%r14d
	cmpl	$256, %r14d                     # imm = 0x100
	jne	.LBB0_1
# %bb.6:
	xorl	%eax, %eax
	jmp	.LBB0_7
.LBB0_4:
	movl	$2, %eax
.LBB0_7:
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
