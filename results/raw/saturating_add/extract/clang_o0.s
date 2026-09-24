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
	movl	$1259933547, %esi               # imm = 0x4B190F6B
	callq	tc_add_v1
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$3051870685, %esi               # imm = 0xB5E7D9DD
	callq	tc_add_v1
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$2616549851, %esi               # imm = 0x9BF561DB
	callq	tc_xor_v1
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$931241453, %esi                # imm = 0x37819DED
	callq	tc_xor_v1
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$2065548177, %esi               # imm = 0x7B1DC391
	callq	tc_xor_v1
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$18566943, %esi                 # imm = 0x11B4F1F
	callq	tc_xor_v1
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$4122288439, %esi               # imm = 0xF5B52137
	callq	tc_xor_v1
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$3284109257, %esi               # imm = 0xC3BF87C9
	callq	tc_add_v1
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$535510907, %esi                # imm = 0x1FEB3F7B
	callq	tc_add_v1
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$1869967645, %esi               # imm = 0x6F75711D
	callq	tc_add_v1
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$3305578443, %esi               # imm = 0xC5071FCB
	callq	tc_add_v1
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$2535697823, %esi               # imm = 0x9723AD9F
	callq	tc_add_v1
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$3951259105, %esi               # imm = 0xEB836DE1
	callq	tc_add_v1
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$2613775823, %esi               # imm = 0x9BCB0DCF
	callq	tc_xor_v1
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$1203356553, %esi               # imm = 0x47B9C389
	callq	tc_xor_v1
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$1474810707, %esi               # imm = 0x57E7D353
	callq	tc_add_v1
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$2913803113, %esi               # imm = 0xADAD1B69
	callq	tc_add_v1
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$930970891, %esi                # imm = 0x377D7D0B
	callq	tc_xor_v1
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$2603466049, %esi               # imm = 0x9B2DBD41
	callq	tc_xor_v1
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$2101299129, %esi               # imm = 0x7D3F47B9
	callq	tc_xor_v1
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$256218965, %esi                # imm = 0xF459755
	callq	tc_xor_v1
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$3085020659, %esi               # imm = 0xB7E1ADF3
	callq	tc_add_v1
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$2435559195, %esi               # imm = 0x912BAF1B
	callq	tc_add_v1
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$4223883025, %esi               # imm = 0xFBC35711
	callq	tc_add_v1
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$2038822359, %esi               # imm = 0x7985F5D7
	callq	tc_xor_v1
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$1462718311, %esi               # imm = 0x572F4F67
	callq	tc_add_v1
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$3176496947, %esi               # imm = 0xBD557F33
	callq	tc_add_v1
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$1408579397, %esi               # imm = 0x53F53745
	callq	tc_xor_v1
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
