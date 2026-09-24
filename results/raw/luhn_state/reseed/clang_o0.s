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
	movl	-12(%rbp), %edi
	movl	$3339302807, %esi               # imm = 0xC709B797
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$2645399417, %esi               # imm = 0x9DAD9779
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$2582612959, %esi               # imm = 0x99EF8BDF
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$3254208979, %esi               # imm = 0xC1F749D3
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$4293756301, %esi               # imm = 0xFFED858D
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$3814918609, %esi               # imm = 0xE36309D1
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$2675903475, %esi               # imm = 0x9F7F0BF3
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$3876410263, %esi               # imm = 0xE70D5397
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$2815911405, %esi               # imm = 0xA7D765ED
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$725163935, %esi                # imm = 0x2B391F9F
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$3983249907, %esi               # imm = 0xED6B91F3
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$2213363153, %esi               # imm = 0x83ED3DD1
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$1873105747, %esi               # imm = 0x6FA55353
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$231464815, %esi                # imm = 0xDCBDF6F
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$534086103, %esi                # imm = 0x1FD581D7
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$3753328483, %esi               # imm = 0xDFB73F63
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$4256037289, %esi               # imm = 0xFDADF9A9
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$2143886737, %esi               # imm = 0x7FC91D91
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$3487802355, %esi               # imm = 0xCFE3A3F3
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$1935259581, %esi               # imm = 0x7359B7BD
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$4155349813, %esi               # imm = 0xF7AD9B35
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$735310249, %esi                # imm = 0x2BD3F1A9
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$389747629, %esi                # imm = 0x173B13AD
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$3914704173, %esi               # imm = 0xE955A52D
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$1272796119, %esi               # imm = 0x4BDD53D7
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$894540037, %esi                # imm = 0x35519905
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$1439810927, %esi               # imm = 0x55D1C56F
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$830843303, %esi                # imm = 0x3185A9A7
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
