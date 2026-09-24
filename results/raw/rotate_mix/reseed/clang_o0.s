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
	shll	$3, %eax
	movzbl	-1(%rbp), %ecx
	shrl	$5, %ecx
	orl	%ecx, %eax
	andl	$255, %eax
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movzbl	-2(%rbp), %ecx
	xorl	%ecx, %eax
	movzbl	-2(%rbp), %ecx
	shrl	$2, %ecx
	xorl	%ecx, %eax
	andl	$255, %eax
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$3489215745, %esi               # imm = 0xCFF93501
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$2870551355, %esi               # imm = 0xAB19233B
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$3345588559, %esi               # imm = 0xC769A14F
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$4025563955, %esi               # imm = 0xEFF13B33
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$2743565243, %esi               # imm = 0xA3877BBB
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$3949691853, %esi               # imm = 0xEB6B83CD
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$363005697, %esi                # imm = 0x15A30701
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$2813816709, %esi               # imm = 0xA7B76F85
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$1608872307, %esi               # imm = 0x5FE57173
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$3145671673, %esi               # imm = 0xBB7F23F9
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$2872953699, %esi               # imm = 0xAB3DCB63
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$1803651869, %esi               # imm = 0x6B818B1D
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$2876362095, %esi               # imm = 0xAB71CD6F
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$3238893543, %esi               # imm = 0xC10D97E7
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$791890179, %esi                # imm = 0x2F334903
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$158302069, %esi                # imm = 0x96F7F75
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$3786371855, %esi               # imm = 0xE1AF730F
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$3846533963, %esi               # imm = 0xE545734B
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$2268715501, %esi               # imm = 0x8739D9ED
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$151893463, %esi                # imm = 0x90DB5D7
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$2683639715, %esi               # imm = 0x9FF517A3
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$3746394103, %esi               # imm = 0xDF4D6FF7
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$1136625055, %esi               # imm = 0x43BF859F
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$2784450991, %esi               # imm = 0xA5F759AF
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$3246990791, %esi               # imm = 0xC18925C7
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$3579535273, %esi               # imm = 0xD55B5FA9
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$394626949, %esi                # imm = 0x17858785
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$4259283313, %esi               # imm = 0xFDDF8171
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
