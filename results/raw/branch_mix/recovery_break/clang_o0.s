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
	andl	$1, %eax
	cmpl	$0, %eax
	je	.LBB1_2
# %bb.1:
	movzbl	-1(%rbp), %eax
	imull	$17, %eax, %eax
	movzbl	-2(%rbp), %ecx
	addl	%ecx, %eax
	xorl	$90, %eax
	andl	$255, %eax
	movl	%eax, -8(%rbp)
	jmp	.LBB1_3
.LBB1_2:
	movzbl	-2(%rbp), %eax
	imull	$29, %eax, %eax
	movzbl	-1(%rbp), %ecx
	addl	%ecx, %eax
	xorl	$165, %eax
	andl	$255, %eax
	movl	%eax, -8(%rbp)
.LBB1_3:
	movl	-8(%rbp), %edi
	movl	$4014704519, %esi               # imm = 0xEF4B8787
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$321616169, %esi                # imm = 0x132B7929
	callq	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$3239819203, %esi               # imm = 0xC11BB7C3
	callq	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$1398654359, %esi               # imm = 0x535DC597
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$2433454037, %esi               # imm = 0x910B8FD5
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$228394381, %esi                # imm = 0xD9D058D
	callq	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$1270822821, %esi               # imm = 0x4BBF37A5
	callq	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$3682434365, %esi               # imm = 0xDB7D7D3D
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$3386738067, %esi               # imm = 0xC9DD8593
	callq	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$3179406119, %esi               # imm = 0xBD81E327
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$1202963299, %esi               # imm = 0x47B3C363
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$3589777803, %esi               # imm = 0xD5F7A98B
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$3951287199, %esi               # imm = 0xEB83DB9F
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$1326528861, %esi               # imm = 0x4F11395D
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$4287364399, %esi               # imm = 0xFF8BFD2F
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$1596444573, %esi               # imm = 0x5F27CF9D
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$2883130703, %esi               # imm = 0xABD9154F
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$3213300207, %esi               # imm = 0xBF8711EF
	callq	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$3513338651, %esi               # imm = 0xD1694B1B
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$703449993, %esi                # imm = 0x29EDCB89
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$4227198761, %esi               # imm = 0xFBF5EF29
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$292668855, %esi                # imm = 0x1171C5B7
	callq	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$1264941045, %esi               # imm = 0x4B6577F5
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$2135421763, %esi               # imm = 0x7F47F343
	callq	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$50709419, %esi                 # imm = 0x305C3AB
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$4290602463, %esi               # imm = 0xFFBD65DF
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$1762629921, %esi               # imm = 0x690F9921
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
