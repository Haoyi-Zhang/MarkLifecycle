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
	subq	$16, %rsp
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
	movzbl	-1(%rbp), %eax
	cmpl	$66, %eax
	jne	.LBB1_7
# %bb.5:
	movzbl	-2(%rbp), %eax
	cmpl	$153, %eax
	jne	.LBB1_7
# %bb.6:
	movl	-12(%rbp), %eax
	xorl	$1, %eax
	movl	%eax, -12(%rbp)
.LBB1_7:
	movl	-12(%rbp), %edi
	movl	$4211281753, %esi               # imm = 0xFB030F59
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$935303521, %esi                # imm = 0x37BF9961
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$3784569275, %esi               # imm = 0xE193F1BB
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$433139003, %esi                # imm = 0x19D12D3B
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$1137379771, %esi               # imm = 0x43CB09BB
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$4192722871, %esi               # imm = 0xF9E7DFB7
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$960600025, %esi                # imm = 0x394197D9
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$1576614349, %esi               # imm = 0x5DF939CD
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$1329722853, %esi               # imm = 0x4F41F5E5
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$1571671449, %esi               # imm = 0x5DADCD99
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$1461272437, %esi               # imm = 0x57193F75
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$1003069783, %esi               # imm = 0x3BC9A157
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$2169614739, %esi               # imm = 0x8151B193
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$3883906023, %esi               # imm = 0xE77FB3E7
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$1704163195, %esi               # imm = 0x6593777B
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$3181091613, %esi               # imm = 0xBD9B9B1D
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$2780161979, %esi               # imm = 0xA5B5E7BB
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$3816101689, %esi               # imm = 0xE3751739
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$4219834333, %esi               # imm = 0xFB858FDD
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$2070669691, %esi               # imm = 0x7B6BE97B
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$4250354435, %esi               # imm = 0xFD574303
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$4224156573, %esi               # imm = 0xFBC7839D
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$3781235497, %esi               # imm = 0xE1611329
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$3153827227, %esi               # imm = 0xBBFB959B
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$905158615, %esi                # imm = 0x35F39FD7
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$1762651575, %esi               # imm = 0x690FEDB7
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$1407657395, %esi               # imm = 0x53E725B3
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$1392602955, %esi               # imm = 0x53016F4B
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	andl	$255, %eax
                                        # kill: def $al killed $al killed $eax
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	kernel, .Lfunc_end1-kernel
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function tc_xor_v2
	.type	tc_xor_v2,@function
tc_xor_v2:                              # @tc_xor_v2
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-4(%rbp), %eax
	movl	-8(%rbp), %ecx
	xorl	-8(%rbp), %ecx
	xorl	%ecx, %eax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end2:
	.size	tc_xor_v2, .Lfunc_end2-tc_xor_v2
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function tc_add_v2
	.type	tc_add_v2,@function
tc_add_v2:                              # @tc_add_v2
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-4(%rbp), %eax
	subl	-8(%rbp), %eax
	addl	-8(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end3:
	.size	tc_add_v2, .Lfunc_end3-tc_add_v2
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 17.0.0 (https://github.com/swiftlang/llvm-project.git 10999b6d034fe318f3d56c83bddb6572593a8bb0)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym kernel
	.addrsig_sym fwrite
	.addrsig_sym tc_xor_v2
	.addrsig_sym tc_add_v2
	.addrsig_sym stdout
