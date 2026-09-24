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
	movl	$255, %ecx
	xorl	%edx, %edx
	divl	%ecx
	movl	%edx, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-1153482411, %eax              # imm = 0xBB3F4155
	subl	$-1153482411, %eax              # imm = 0xBB3F4155
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$655168863, %eax                # imm = 0x270D155F
	xorl	$655168863, %eax                # imm = 0x270D155F
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-445694067, %eax               # imm = 0xE56F3F8D
	subl	$-445694067, %eax               # imm = 0xE56F3F8D
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$1329724375, %eax               # imm = 0x4F41FBD7
	subl	$1329724375, %eax               # imm = 0x4F41FBD7
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$-1043998409, %eax              # imm = 0xC1C5D937
	xorl	$-1043998409, %eax              # imm = 0xC1C5D937
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-2050004599, %eax              # imm = 0x85CF6989
	subl	$-2050004599, %eax              # imm = 0x85CF6989
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$1767084431, %eax               # imm = 0x6953918F
	xorl	$1767084431, %eax               # imm = 0x6953918F
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$1495392009, %eax               # imm = 0x5921DF09
	subl	$1495392009, %eax               # imm = 0x5921DF09
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$763066311, %eax                # imm = 0x2D7B77C7
	subl	$763066311, %eax                # imm = 0x2D7B77C7
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-1459382837, %eax              # imm = 0xA90395CB
	subl	$-1459382837, %eax              # imm = 0xA90395CB
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-2047087119, %eax              # imm = 0x85FBEDF1
	subl	$-2047087119, %eax              # imm = 0x85FBEDF1
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-821212813, %eax               # imm = 0xCF0D4973
	subl	$-821212813, %eax               # imm = 0xCF0D4973
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-1914579973, %eax              # imm = 0x8DE1D3FB
	subl	$-1914579973, %eax              # imm = 0x8DE1D3FB
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-1587332161, %eax              # imm = 0xA1633BBF
	subl	$-1587332161, %eax              # imm = 0xA1633BBF
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-1892711119, %eax              # imm = 0x8F2F8531
	subl	$-1892711119, %eax              # imm = 0x8F2F8531
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$-907712629, %eax               # imm = 0xC9E5678B
	xorl	$-907712629, %eax               # imm = 0xC9E5678B
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$630404059, %eax                # imm = 0x259333DB
	xorl	$630404059, %eax                # imm = 0x259333DB
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-1920755259, %eax              # imm = 0x8D8399C5
	subl	$-1920755259, %eax              # imm = 0x8D8399C5
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$2004685735, %eax               # imm = 0x777D13A7
	subl	$2004685735, %eax               # imm = 0x777D13A7
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$-1210109061, %eax              # imm = 0xB7DF337B
	xorl	$-1210109061, %eax              # imm = 0xB7DF337B
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$-1761540187, %eax              # imm = 0x970107A5
	xorl	$-1761540187, %eax              # imm = 0x970107A5
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$292626733, %eax                # imm = 0x1171212D
	xorl	$292626733, %eax                # imm = 0x1171212D
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-446693627, %eax               # imm = 0xE55FFF05
	subl	$-446693627, %eax               # imm = 0xE55FFF05
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$219887905, %eax                # imm = 0xD1B3921
	subl	$219887905, %eax                # imm = 0xD1B3921
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-2053022793, %eax              # imm = 0x85A15BB7
	subl	$-2053022793, %eax              # imm = 0x85A15BB7
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$837238705, %eax                # imm = 0x31E73FB1
	subl	$837238705, %eax                # imm = 0x31E73FB1
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$1034772943, %eax               # imm = 0x3DAD61CF
	xorl	$1034772943, %eax               # imm = 0x3DAD61CF
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$-211813001, %eax               # imm = 0xF35FFD77
	xorl	$-211813001, %eax               # imm = 0xF35FFD77
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
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
