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
	movzbl	-1(%rbp), %eax
	movzbl	-2(%rbp), %ecx
	addl	%ecx, %eax
	movl	$255, %ecx
	xorl	%edx, %edx
	divl	%ecx
	movl	%edx, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$3141484885, %esi               # imm = 0xBB3F4155
	callq	tc_add_v1
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$3849273229, %esi               # imm = 0xE56F3F8D
	callq	tc_add_v1
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$3250968887, %esi               # imm = 0xC1C5D937
	callq	tc_xor_v1
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$1767084431, %esi               # imm = 0x6953918F
	callq	tc_xor_v1
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$763066311, %esi                # imm = 0x2D7B77C7
	callq	tc_add_v1
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$2247880177, %esi               # imm = 0x85FBEDF1
	callq	tc_add_v1
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$2380387323, %esi               # imm = 0x8DE1D3FB
	callq	tc_add_v1
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$2402256177, %esi               # imm = 0x8F2F8531
	callq	tc_add_v1
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$630404059, %esi                # imm = 0x259333DB
	callq	tc_xor_v1
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$2004685735, %esi               # imm = 0x777D13A7
	callq	tc_add_v1
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$2533427109, %esi               # imm = 0x970107A5
	callq	tc_xor_v1
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$3848273669, %esi               # imm = 0xE55FFF05
	callq	tc_add_v1
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$2241944503, %esi               # imm = 0x85A15BB7
	callq	tc_add_v1
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$1034772943, %esi               # imm = 0x3DAD61CF
	callq	tc_xor_v1
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$655168863, %esi                # imm = 0x270D155F
	callq	tc_xor_v1
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$1329724375, %esi               # imm = 0x4F41FBD7
	callq	tc_add_v1
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$2244962697, %esi               # imm = 0x85CF6989
	callq	tc_add_v1
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$1495392009, %esi               # imm = 0x5921DF09
	callq	tc_add_v1
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$2835584459, %esi               # imm = 0xA90395CB
	callq	tc_add_v1
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$3473754483, %esi               # imm = 0xCF0D4973
	callq	tc_add_v1
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$2707635135, %esi               # imm = 0xA1633BBF
	callq	tc_add_v1
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$3387254667, %esi               # imm = 0xC9E5678B
	callq	tc_xor_v1
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$2374212037, %esi               # imm = 0x8D8399C5
	callq	tc_add_v1
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$3084858235, %esi               # imm = 0xB7DF337B
	callq	tc_xor_v1
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$292626733, %esi                # imm = 0x1171212D
	callq	tc_xor_v1
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$219887905, %esi                # imm = 0xD1B3921
	callq	tc_add_v1
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$837238705, %esi                # imm = 0x31E73FB1
	callq	tc_add_v1
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$4083154295, %esi               # imm = 0xF35FFD77
	callq	tc_xor_v1
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
	.p2align	4, 0x90                         # -- Begin function tc_add_v1
	.type	tc_add_v1,@function
tc_add_v1:                              # @tc_add_v1
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
	addl	-8(%rbp), %eax
	subl	-8(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end2:
	.size	tc_add_v1, .Lfunc_end2-tc_add_v1
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function tc_xor_v1
	.type	tc_xor_v1,@function
tc_xor_v1:                              # @tc_xor_v1
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
	xorl	-8(%rbp), %eax
	xorl	-8(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end3:
	.size	tc_xor_v1, .Lfunc_end3-tc_xor_v1
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 17.0.0 (https://github.com/swiftlang/llvm-project.git 10999b6d034fe318f3d56c83bddb6572593a8bb0)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym kernel
	.addrsig_sym fwrite
	.addrsig_sym tc_add_v1
	.addrsig_sym tc_xor_v1
	.addrsig_sym stdout
