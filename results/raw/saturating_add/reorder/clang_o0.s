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
	movl	-12(%rbp), %eax
	addl	$1259933547, %eax               # imm = 0x4B190F6B
	subl	$1259933547, %eax               # imm = 0x4B190F6B
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addl	$-1243096611, %eax              # imm = 0xB5E7D9DD
	subl	$-1243096611, %eax              # imm = 0xB5E7D9DD
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	xorl	$-1678417445, %eax              # imm = 0x9BF561DB
	xorl	$-1678417445, %eax              # imm = 0x9BF561DB
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	xorl	$931241453, %eax                # imm = 0x37819DED
	xorl	$931241453, %eax                # imm = 0x37819DED
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	xorl	$2065548177, %eax               # imm = 0x7B1DC391
	xorl	$2065548177, %eax               # imm = 0x7B1DC391
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	xorl	$18566943, %eax                 # imm = 0x11B4F1F
	xorl	$18566943, %eax                 # imm = 0x11B4F1F
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	xorl	$-172678857, %eax               # imm = 0xF5B52137
	xorl	$-172678857, %eax               # imm = 0xF5B52137
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addl	$-1010858039, %eax              # imm = 0xC3BF87C9
	subl	$-1010858039, %eax              # imm = 0xC3BF87C9
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addl	$535510907, %eax                # imm = 0x1FEB3F7B
	subl	$535510907, %eax                # imm = 0x1FEB3F7B
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addl	$1869967645, %eax               # imm = 0x6F75711D
	subl	$1869967645, %eax               # imm = 0x6F75711D
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addl	$-989388853, %eax               # imm = 0xC5071FCB
	subl	$-989388853, %eax               # imm = 0xC5071FCB
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addl	$-1759269473, %eax              # imm = 0x9723AD9F
	subl	$-1759269473, %eax              # imm = 0x9723AD9F
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addl	$-343708191, %eax               # imm = 0xEB836DE1
	subl	$-343708191, %eax               # imm = 0xEB836DE1
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	xorl	$-1681191473, %eax              # imm = 0x9BCB0DCF
	xorl	$-1681191473, %eax              # imm = 0x9BCB0DCF
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	xorl	$1203356553, %eax               # imm = 0x47B9C389
	xorl	$1203356553, %eax               # imm = 0x47B9C389
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addl	$1474810707, %eax               # imm = 0x57E7D353
	subl	$1474810707, %eax               # imm = 0x57E7D353
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addl	$-1381164183, %eax              # imm = 0xADAD1B69
	subl	$-1381164183, %eax              # imm = 0xADAD1B69
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	xorl	$930970891, %eax                # imm = 0x377D7D0B
	xorl	$930970891, %eax                # imm = 0x377D7D0B
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	xorl	$-1691501247, %eax              # imm = 0x9B2DBD41
	xorl	$-1691501247, %eax              # imm = 0x9B2DBD41
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	xorl	$2101299129, %eax               # imm = 0x7D3F47B9
	xorl	$2101299129, %eax               # imm = 0x7D3F47B9
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	xorl	$256218965, %eax                # imm = 0xF459755
	xorl	$256218965, %eax                # imm = 0xF459755
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addl	$-1209946637, %eax              # imm = 0xB7E1ADF3
	subl	$-1209946637, %eax              # imm = 0xB7E1ADF3
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addl	$-1859408101, %eax              # imm = 0x912BAF1B
	subl	$-1859408101, %eax              # imm = 0x912BAF1B
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addl	$-71084271, %eax                # imm = 0xFBC35711
	subl	$-71084271, %eax                # imm = 0xFBC35711
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	xorl	$2038822359, %eax               # imm = 0x7985F5D7
	xorl	$2038822359, %eax               # imm = 0x7985F5D7
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addl	$1462718311, %eax               # imm = 0x572F4F67
	subl	$1462718311, %eax               # imm = 0x572F4F67
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addl	$-1118470349, %eax              # imm = 0xBD557F33
	subl	$-1118470349, %eax              # imm = 0xBD557F33
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	xorl	$1408579397, %eax               # imm = 0x53F53745
	xorl	$1408579397, %eax               # imm = 0x53F53745
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	andl	$255, %eax
                                        # kill: def $al killed $al killed $eax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	kernel, .Lfunc_end1-kernel
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 17.0.0 (https://github.com/swiftlang/llvm-project.git 10999b6d034fe318f3d56c83bddb6572593a8bb0)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym kernel
	.addrsig_sym fwrite
	.addrsig_sym stdout
