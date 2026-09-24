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
	andl	$128, %eax
	cmpl	$0, %eax
	je	.LBB1_2
# %bb.1:
	movzbl	-1(%rbp), %eax
	shll	%eax
	movzbl	-2(%rbp), %ecx
	andl	$127, %ecx
	xorl	%ecx, %eax
	andl	$255, %eax
	movl	%eax, -12(%rbp)                 # 4-byte Spill
	jmp	.LBB1_3
.LBB1_2:
	movzbl	-1(%rbp), %eax
	movzbl	-2(%rbp), %ecx
	addl	%ecx, %eax
	andl	$255, %eax
	movl	%eax, -12(%rbp)                 # 4-byte Spill
.LBB1_3:
	movl	-12(%rbp), %eax                 # 4-byte Reload
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$399312325, %esi                # imm = 0x17CD05C5
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$1407826691, %esi               # imm = 0x53E9BB03
	callq	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$3523164441, %esi               # imm = 0xD1FF3919
	callq	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$1911238983, %esi               # imm = 0x71EB3147
	callq	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$3385159135, %esi               # imm = 0xC9C56DDF
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$2543672623, %esi               # imm = 0x979D5D2F
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$2983945989, %esi               # imm = 0xB1DB6705
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$566360861, %esi                # imm = 0x21C1FB1D
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$2606999033, %esi               # imm = 0x9B63A5F9
	callq	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$802809271, %esi                # imm = 0x2FD9E5B7
	callq	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$393690455, %esi                # imm = 0x17773D57
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$1929446391, %esi               # imm = 0x730103F7
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$1295902547, %esi               # imm = 0x4D3DE753
	callq	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$870534993, %esi                # imm = 0x33E34F51
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$2042206477, %esi               # imm = 0x79B9990D
	callq	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$3076635411, %esi               # imm = 0xB761BB13
	callq	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$3082008369, %esi               # imm = 0xB7B3B731
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$4079974215, %esi               # imm = 0xF32F7747
	callq	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$292640693, %esi                # imm = 0x117157B5
	callq	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$1061536133, %esi               # imm = 0x3F45C185
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$399482283, %esi                # imm = 0x17CF9DAB
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$3855349749, %esi               # imm = 0xE5CBF7F5
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$3312394735, %esi               # imm = 0xC56F21EF
	callq	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$2375374783, %esi               # imm = 0x8D9557BF
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$4018122509, %esi               # imm = 0xEF7FAF0D
	callq	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$2178525665, %esi               # imm = 0x81D9A9E1
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
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
.Lfunc_end2:
	.size	tc_add_v2, .Lfunc_end2-tc_add_v2
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
.Lfunc_end3:
	.size	tc_xor_v2, .Lfunc_end3-tc_xor_v2
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 17.0.0 (https://github.com/swiftlang/llvm-project.git 10999b6d034fe318f3d56c83bddb6572593a8bb0)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym kernel
	.addrsig_sym fwrite
	.addrsig_sym tc_add_v2
	.addrsig_sym tc_xor_v2
	.addrsig_sym stdout
