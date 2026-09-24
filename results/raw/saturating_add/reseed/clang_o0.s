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
	movl	%eax, -8(%rbp)
	cmpl	$255, -8(%rbp)
	jbe	.LBB1_2
# %bb.1:
	movl	$255, %eax
	movl	%eax, -16(%rbp)                 # 4-byte Spill
	jmp	.LBB1_3
.LBB1_2:
	movl	-8(%rbp), %eax
	movl	%eax, -16(%rbp)                 # 4-byte Spill
.LBB1_3:
	movl	-16(%rbp), %eax                 # 4-byte Reload
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$690708857, %esi                # imm = 0x292B6179
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$1468885793, %esi               # imm = 0x578D6B21
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$996500409, %esi                # imm = 0x3B6563B9
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$3216093597, %esi               # imm = 0xBFB1B19D
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$2941339945, %esi               # imm = 0xAF514929
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$1564202985, %esi               # imm = 0x5D3BD7E9
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$934494485, %esi                # imm = 0x37B34115
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$3684377347, %esi               # imm = 0xDB9B2303
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$3583330089, %esi               # imm = 0xD5954729
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$3275074461, %esi               # imm = 0xC335AB9D
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$2849982897, %esi               # imm = 0xA9DF49B1
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$459232043, %esi                # imm = 0x1B5F532B
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$1534181691, %esi               # imm = 0x5B71C13B
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$895558051, %esi                # imm = 0x356121A3
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$3444790171, %esi               # imm = 0xCD53539B
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$361462267, %esi                # imm = 0x158B79FB
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$55142201, %esi                 # imm = 0x3496739
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$4159686649, %esi               # imm = 0xF7EFC7F9
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$900665731, %esi                # imm = 0x35AF1183
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$63130965, %esi                 # imm = 0x3C34D55
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$3916140921, %esi               # imm = 0xE96B9179
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$1739407645, %esi               # imm = 0x67AD411D
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$1644152221, %esi               # imm = 0x61FFC59D
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$1699309459, %esi               # imm = 0x65496793
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$3355029815, %esi               # imm = 0xC7F9B137
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$32088881, %esi                 # imm = 0x1E9A331
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$157352421, %esi                # imm = 0x96101E5
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$1063329193, %esi               # imm = 0x3F611DA9
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
