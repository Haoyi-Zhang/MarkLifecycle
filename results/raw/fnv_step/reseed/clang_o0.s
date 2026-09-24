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
	xorl	%ecx, %eax
	imull	$147, %eax, %eax
	andl	$255, %eax
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$2344466917, %esi               # imm = 0x8BBDB9E5
	callq	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$559245251, %esi                # imm = 0x215567C3
	callq	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$635797439, %esi                # imm = 0x25E57FBF
	callq	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$1808243583, %esi               # imm = 0x6BC79B7F
	callq	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$4191389609, %esi               # imm = 0xF9D387A9
	callq	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$234555181, %esi                # imm = 0xDFB072D
	callq	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$3479255395, %esi               # imm = 0xCF613963
	callq	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$2068141049, %esi               # imm = 0x7B4553F9
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$1769594689, %esi               # imm = 0x6979DF41
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$218743561, %esi                # imm = 0xD09C309
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$4246597473, %esi               # imm = 0xFD1DEF61
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$2879744903, %esi               # imm = 0xABA56B87
	callq	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$3579702193, %esi               # imm = 0xD55DEBB1
	callq	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$1970266985, %esi               # imm = 0x756FE369
	callq	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$56955245, %esi                 # imm = 0x365116D
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$3139909573, %esi               # imm = 0xBB2737C5
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$4222593283, %esi               # imm = 0xFBAFA903
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$1139771253, %esi               # imm = 0x43EF8775
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$2046285105, %esi               # imm = 0x79F7D531
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$4150212039, %esi               # imm = 0xF75F35C7
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$3452924345, %esi               # imm = 0xCDCF71B9
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$1473358723, %esi               # imm = 0x57D1AB83
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$59478375, %esi                 # imm = 0x38B9167
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$2315108097, %esi               # imm = 0x89FDBF01
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$3511495453, %esi               # imm = 0xD14D2B1D
	callq	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$3185264037, %esi               # imm = 0xBDDB45A5
	callq	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$59572605, %esi                 # imm = 0x38D017D
	callq	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$1064553899, %esi               # imm = 0x3F73CDAB
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
