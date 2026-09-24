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
	andl	$255, %eax
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	-8(%rbp), %ecx
	shll	$3, %ecx
	andl	$255, %ecx
	addl	%ecx, %eax
	andl	$255, %eax
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	shrl	$4, %eax
	xorl	-8(%rbp), %eax
	movl	%eax, -8(%rbp)
	imull	$27, -8(%rbp), %eax
	andl	$255, %eax
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	shrl	$3, %eax
	xorl	-8(%rbp), %eax
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$1774387511, %esi               # imm = 0x69C30137
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$2233169187, %esi               # imm = 0x851B7523
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$1401235927, %esi               # imm = 0x538529D7
	callq	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$2881468881, %esi               # imm = 0xABBFB9D1
	callq	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$3987448651, %esi               # imm = 0xEDABA34B
	callq	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$2004041067, %esi               # imm = 0x77733D6B
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$2878561787, %esi               # imm = 0xAB935DFB
	callq	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$2602034153, %esi               # imm = 0x9B17E3E9
	callq	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$3140858865, %esi               # imm = 0xBB35B3F1
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$1942706003, %esi               # imm = 0x73CB5753
	callq	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$1906270511, %esi               # imm = 0x719F612F
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$860687769, %esi                # imm = 0x334D0D99
	callq	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$26045931, %esi                 # imm = 0x18D6DEB
	callq	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$893602063, %esi                # imm = 0x3543490F
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$2772947257, %esi               # imm = 0xA547D139
	callq	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$2885547305, %esi               # imm = 0xABFDF529
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$455733749, %esi                # imm = 0x1B29F1F5
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$3280189275, %esi               # imm = 0xC383B75B
	callq	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$4291934675, %esi               # imm = 0xFFD1B9D3
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$836226473, %esi                # imm = 0x31D7CDA9
	callq	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$3273104243, %esi               # imm = 0xC3179B73
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$2505561509, %esi               # imm = 0x9557D5A5
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$3747037115, %esi               # imm = 0xDF573FBB
	callq	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$2774348131, %esi               # imm = 0xA55D3163
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$3517947307, %esi               # imm = 0xD1AF9DAB
	callq	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$827168047, %esi                # imm = 0x314D952F
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$800827141, %esi                # imm = 0x2FBBA705
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$3079660297, %esi               # imm = 0xB78FE309
	callq	tc_xor_v2
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
