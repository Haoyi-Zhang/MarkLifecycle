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
	xorl	%ecx, %eax
	imull	$147, %eax, %eax
	andl	$255, %eax
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$28265301, %eax                 # imm = 0x1AF4B55
	xorl	$28265301, %eax                 # imm = 0x1AF4B55
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$1530525021, %eax               # imm = 0x5B39F55D
	xorl	$1530525021, %eax               # imm = 0x5B39F55D
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$2040369643, %eax               # imm = 0x799D91EB
	xorl	$2040369643, %eax               # imm = 0x799D91EB
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$-578578959, %eax               # imm = 0xDD8395F1
	xorl	$-578578959, %eax               # imm = 0xDD8395F1
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$2032864067, %eax               # imm = 0x792B0B43
	xorl	$2032864067, %eax               # imm = 0x792B0B43
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$-1724675625, %eax              # imm = 0x993389D7
	xorl	$-1724675625, %eax              # imm = 0x993389D7
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$-1491915855, %eax              # imm = 0xA7132BB1
	xorl	$-1491915855, %eax              # imm = 0xA7132BB1
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-43388111, %eax                # imm = 0xFD69F331
	subl	$-43388111, %eax                # imm = 0xFD69F331
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-1010053347, %eax              # imm = 0xC3CBCF1D
	subl	$-1010053347, %eax              # imm = 0xC3CBCF1D
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-906019959, %eax               # imm = 0xC9FF3B89
	subl	$-906019959, %eax               # imm = 0xC9FF3B89
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$2069880657, %eax               # imm = 0x7B5FDF51
	subl	$2069880657, %eax               # imm = 0x7B5FDF51
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$1192321361, %eax               # imm = 0x47116151
	xorl	$1192321361, %eax               # imm = 0x47116151
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$1333491605, %eax               # imm = 0x4F7B7795
	xorl	$1333491605, %eax               # imm = 0x4F7B7795
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$2038785847, %eax               # imm = 0x79856737
	xorl	$2038785847, %eax               # imm = 0x79856737
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-977200717, %eax               # imm = 0xC5C119B3
	subl	$-977200717, %eax               # imm = 0xC5C119B3
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-414456531, %eax               # imm = 0xE74BE52D
	subl	$-414456531, %eax               # imm = 0xE74BE52D
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$1401361235, %eax               # imm = 0x53871353
	subl	$1401361235, %eax               # imm = 0x53871353
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$1703795523, %eax               # imm = 0x658DDB43
	subl	$1703795523, %eax               # imm = 0x658DDB43
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$1965803305, %eax               # imm = 0x752BC729
	subl	$1965803305, %eax               # imm = 0x752BC729
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-2115390081, %eax              # imm = 0x81E9B57F
	subl	$-2115390081, %eax              # imm = 0x81E9B57F
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-1153706065, %eax              # imm = 0xBB3BD7AF
	subl	$-1153706065, %eax              # imm = 0xBB3BD7AF
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$2010892099, %eax               # imm = 0x77DBC743
	subl	$2010892099, %eax               # imm = 0x77DBC743
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-642826815, %eax               # imm = 0xD9AF3DC1
	subl	$-642826815, %eax               # imm = 0xD9AF3DC1
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-648448241, %eax               # imm = 0xD959770F
	subl	$-648448241, %eax               # imm = 0xD959770F
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$-1216875681, %eax              # imm = 0xB777F35F
	xorl	$-1216875681, %eax              # imm = 0xB777F35F
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$1866983815, %eax               # imm = 0x6F47E987
	xorl	$1866983815, %eax               # imm = 0x6F47E987
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$85008877, %eax                 # imm = 0x51121ED
	xorl	$85008877, %eax                 # imm = 0x51121ED
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$-2052502133, %eax              # imm = 0x85A94D8B
	xorl	$-2052502133, %eax              # imm = 0x85A94D8B
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
