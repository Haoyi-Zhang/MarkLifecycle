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
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	$0, -4(%rbp)
	movl	$0, -8(%rbp)
.LBB0_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
	cmpl	$256, -8(%rbp)                  # imm = 0x100
	jae	.LBB0_10
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	movl	$0, -12(%rbp)
.LBB0_3:                                #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$256, -12(%rbp)                 # imm = 0x100
	jae	.LBB0_8
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=2
	movl	-8(%rbp), %eax
	movb	%al, %cl
	movl	-12(%rbp), %eax
                                        # kill: def $al killed $al killed $eax
	movzbl	%cl, %edi
	movzbl	%al, %esi
	callq	kernel
	movb	%al, -13(%rbp)
	movq	stdout@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	leaq	-13(%rbp), %rdi
	movl	$1, %edx
	movq	%rdx, %rsi
	callq	fwrite@PLT
	cmpq	$1, %rax
	je	.LBB0_6
# %bb.5:
	movl	$2, -4(%rbp)
	jmp	.LBB0_11
.LBB0_6:                                #   in Loop: Header=BB0_3 Depth=2
	jmp	.LBB0_7
.LBB0_7:                                #   in Loop: Header=BB0_3 Depth=2
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	jmp	.LBB0_3
.LBB0_8:                                #   in Loop: Header=BB0_1 Depth=1
	jmp	.LBB0_9
.LBB0_9:                                #   in Loop: Header=BB0_1 Depth=1
	movl	-8(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -8(%rbp)
	jmp	.LBB0_1
.LBB0_10:
	movl	$0, -4(%rbp)
.LBB0_11:
	movl	-4(%rbp), %eax
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function kernel
	.type	kernel,@function
kernel:                                 # @kernel
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movb	%sil, %al
	movb	%dil, %cl
	movb	%cl, -1(%rbp)
	movb	%al, -2(%rbp)
	movzbl	-2(%rbp), %eax
	movl	$10, %ecx
	xorl	%edx, %edx
	divl	%ecx
	movl	%edx, -8(%rbp)
	movzbl	-1(%rbp), %eax
	andl	$1, %eax
	cmpl	$0, %eax
	je	.LBB1_4
# %bb.1:
	movl	-8(%rbp), %eax
	shll	%eax
	movl	%eax, -8(%rbp)
	cmpl	$9, -8(%rbp)
	jbe	.LBB1_3
# %bb.2:
	movl	-8(%rbp), %eax
	subl	$9, %eax
	movl	%eax, -8(%rbp)
.LBB1_3:
	jmp	.LBB1_4
.LBB1_4:
	movzbl	-1(%rbp), %eax
	addl	-8(%rbp), %eax
	andl	$255, %eax
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	xorl	$-83685543, %eax                # imm = 0xFB030F59
	xorl	$-83685543, %eax                # imm = 0xFB030F59
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	xorl	$1704163195, %eax               # imm = 0x6593777B
	xorl	$1704163195, %eax               # imm = 0x6593777B
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addl	$935303521, %eax                # imm = 0x37BF9961
	subl	$935303521, %eax                # imm = 0x37BF9961
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	xorl	$-1113875683, %eax              # imm = 0xBD9B9B1D
	xorl	$-1113875683, %eax              # imm = 0xBD9B9B1D
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addl	$-510398021, %eax               # imm = 0xE193F1BB
	subl	$-510398021, %eax               # imm = 0xE193F1BB
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addl	$-1514805317, %eax              # imm = 0xA5B5E7BB
	subl	$-1514805317, %eax              # imm = 0xA5B5E7BB
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	xorl	$433139003, %eax                # imm = 0x19D12D3B
	xorl	$433139003, %eax                # imm = 0x19D12D3B
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addl	$-478865607, %eax               # imm = 0xE3751739
	subl	$-478865607, %eax               # imm = 0xE3751739
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	xorl	$1137379771, %eax               # imm = 0x43CB09BB
	xorl	$1137379771, %eax               # imm = 0x43CB09BB
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addl	$-75132963, %eax                # imm = 0xFB858FDD
	subl	$-75132963, %eax                # imm = 0xFB858FDD
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addl	$-102244425, %eax               # imm = 0xF9E7DFB7
	subl	$-102244425, %eax               # imm = 0xF9E7DFB7
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	xorl	$2070669691, %eax               # imm = 0x7B6BE97B
	xorl	$2070669691, %eax               # imm = 0x7B6BE97B
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addl	$960600025, %eax                # imm = 0x394197D9
	subl	$960600025, %eax                # imm = 0x394197D9
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	xorl	$-44612861, %eax                # imm = 0xFD574303
	xorl	$-44612861, %eax                # imm = 0xFD574303
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	xorl	$1576614349, %eax               # imm = 0x5DF939CD
	xorl	$1576614349, %eax               # imm = 0x5DF939CD
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addl	$-70810723, %eax                # imm = 0xFBC7839D
	subl	$-70810723, %eax                # imm = 0xFBC7839D
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	xorl	$1329722853, %eax               # imm = 0x4F41F5E5
	xorl	$1329722853, %eax               # imm = 0x4F41F5E5
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addl	$-513731799, %eax               # imm = 0xE1611329
	subl	$-513731799, %eax               # imm = 0xE1611329
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	xorl	$1571671449, %eax               # imm = 0x5DADCD99
	xorl	$1571671449, %eax               # imm = 0x5DADCD99
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addl	$-1141140069, %eax              # imm = 0xBBFB959B
	subl	$-1141140069, %eax              # imm = 0xBBFB959B
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	xorl	$1461272437, %eax               # imm = 0x57193F75
	xorl	$1461272437, %eax               # imm = 0x57193F75
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addl	$905158615, %eax                # imm = 0x35F39FD7
	subl	$905158615, %eax                # imm = 0x35F39FD7
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	xorl	$1003069783, %eax               # imm = 0x3BC9A157
	xorl	$1003069783, %eax               # imm = 0x3BC9A157
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addl	$1762651575, %eax               # imm = 0x690FEDB7
	subl	$1762651575, %eax               # imm = 0x690FEDB7
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addl	$-2125352557, %eax              # imm = 0x8151B193
	subl	$-2125352557, %eax              # imm = 0x8151B193
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	xorl	$1407657395, %eax               # imm = 0x53E725B3
	xorl	$1407657395, %eax               # imm = 0x53E725B3
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addl	$-411061273, %eax               # imm = 0xE77FB3E7
	subl	$-411061273, %eax               # imm = 0xE77FB3E7
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	xorl	$1392602955, %eax               # imm = 0x53016F4B
	xorl	$1392602955, %eax               # imm = 0x53016F4B
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	andl	$255, %eax
                                        # kill: def $al killed $al killed $eax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	kernel, .Lfunc_end1-kernel
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 17.0.0 (https://github.com/swiftlang/llvm-project.git 10999b6d034fe318f3d56c83bddb6572593a8bb0)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym kernel
	.addrsig_sym fwrite
	.addrsig_sym stdout
