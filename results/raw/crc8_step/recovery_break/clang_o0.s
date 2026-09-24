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
	andl	$255, %eax
	movl	%eax, -8(%rbp)
	movl	$0, -12(%rbp)
.LBB1_1:                                # =>This Inner Loop Header: Depth=1
	cmpl	$8, -12(%rbp)
	jae	.LBB1_7
# %bb.2:                                #   in Loop: Header=BB1_1 Depth=1
	movl	-8(%rbp), %eax
	andl	$128, %eax
	cmpl	$0, %eax
	je	.LBB1_4
# %bb.3:                                #   in Loop: Header=BB1_1 Depth=1
	movl	-8(%rbp), %eax
	shll	%eax
	xorl	$7, %eax
	andl	$255, %eax
	movl	%eax, -16(%rbp)                 # 4-byte Spill
	jmp	.LBB1_5
.LBB1_4:                                #   in Loop: Header=BB1_1 Depth=1
	movl	-8(%rbp), %eax
	shll	%eax
	andl	$255, %eax
	movl	%eax, -16(%rbp)                 # 4-byte Spill
.LBB1_5:                                #   in Loop: Header=BB1_1 Depth=1
	movl	-16(%rbp), %eax                 # 4-byte Reload
	movl	%eax, -8(%rbp)
# %bb.6:                                #   in Loop: Header=BB1_1 Depth=1
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	jmp	.LBB1_1
.LBB1_7:
	movl	-8(%rbp), %edi
	movl	$2335420335, %esi               # imm = 0x8B33AFAF
	callq	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$356058095, %esi                # imm = 0x153903EF
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$2802258323, %esi               # imm = 0xA7071193
	callq	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$1298882847, %esi               # imm = 0x4D6B611F
	callq	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$930155503, %esi                # imm = 0x37710BEF
	callq	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$3751147839, %esi               # imm = 0xDF95F93F
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$1196140995, %esi               # imm = 0x474BA9C3
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$2981622197, %esi               # imm = 0xB1B7F1B5
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$905018877, %esi                # imm = 0x35F17DFD
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$1338234289, %esi               # imm = 0x4FC3D5B1
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$3647310679, %esi               # imm = 0xD9658B57
	callq	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$3177424795, %esi               # imm = 0xBD63A79B
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$764233665, %esi                # imm = 0x2D8D47C1
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$4014808969, %esi               # imm = 0xEF4D1F89
	callq	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$4124811045, %esi               # imm = 0xF5DB9F25
	callq	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$388467663, %esi                # imm = 0x17278BCF
	callq	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$201313723, %esi                # imm = 0xBFFCDBB
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$3115418379, %esi               # imm = 0xB9B1830B
	callq	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$3716646181, %esi               # imm = 0xDD878525
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$3616502195, %esi               # imm = 0xD78F71B3
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$1024952803, %esi               # imm = 0x3D1789E3
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$91839871, %esi                 # imm = 0x5795D7F
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$4149552485, %esi               # imm = 0xF7552565
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$661124463, %esi                # imm = 0x2767F56F
	callq	tc_add_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$54869835, %esi                 # imm = 0x3453F4B
	callq	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$4293472051, %esi               # imm = 0xFFE92F33
	callq	tc_xor_v2
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	$499630873, %esi                # imm = 0x1DC7C319
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
