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
	andl	$255, %eax
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	-8(%rbp), %ecx
	shll	$3, %ecx
	andl	$255, %ecx
	addl	%ecx, %eax
	andl	$255, %eax
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	shrl	$4, %eax
	xorl	-8(%rbp), %eax
	movl	%eax, -8(%rbp)
	imull	$27, -8(%rbp), %eax
	andl	$255, %eax
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	shrl	$3, %eax
	xorl	-8(%rbp), %eax
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-1150866011, %eax              # imm = 0xBB672DA5
	subl	$-1150866011, %eax              # imm = 0xBB672DA5
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$1907312955, %eax               # imm = 0x71AF493B
	xorl	$1907312955, %eax               # imm = 0x71AF493B
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$1972313595, %eax               # imm = 0x758F1DFB
	subl	$1972313595, %eax               # imm = 0x758F1DFB
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-450137787, %eax               # imm = 0xE52B7145
	subl	$-450137787, %eax               # imm = 0xE52B7145
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$-180391137, %eax               # imm = 0xF53F731F
	xorl	$-180391137, %eax               # imm = 0xF53F731F
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$188864409, %eax                # imm = 0xB41D799
	subl	$188864409, %eax                # imm = 0xB41D799
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$1730107341, %eax               # imm = 0x671F57CD
	xorl	$1730107341, %eax               # imm = 0x671F57CD
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$-1141768301, %eax              # imm = 0xBBF1FF93
	xorl	$-1141768301, %eax              # imm = 0xBBF1FF93
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$-685789229, %eax               # imm = 0xD71FAFD3
	xorl	$-685789229, %eax               # imm = 0xD71FAFD3
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-2061370611, %eax              # imm = 0x8521FB0D
	subl	$-2061370611, %eax              # imm = 0x8521FB0D
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$1334528257, %eax               # imm = 0x4F8B4901
	subl	$1334528257, %eax               # imm = 0x4F8B4901
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$1868648363, %eax               # imm = 0x6F614FAB
	xorl	$1868648363, %eax               # imm = 0x6F614FAB
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$-1087136327, %eax              # imm = 0xBF339DB9
	xorl	$-1087136327, %eax              # imm = 0xBF339DB9
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-503448739, %eax               # imm = 0xE1FDFB5D
	subl	$-503448739, %eax               # imm = 0xE1FDFB5D
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$1328243659, %eax               # imm = 0x4F2B63CB
	xorl	$1328243659, %eax               # imm = 0x4F2B63CB
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-1749970165, %eax              # imm = 0x97B1930B
	subl	$-1749970165, %eax              # imm = 0x97B1930B
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$1364841403, %eax               # imm = 0x5159D3BB
	subl	$1364841403, %eax               # imm = 0x5159D3BB
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$763564853, %eax                # imm = 0x2D831335
	xorl	$763564853, %eax                # imm = 0x2D831335
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$858121545, %eax                # imm = 0x3325E549
	xorl	$858121545, %eax                # imm = 0x3325E549
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$1441486773, %eax               # imm = 0x55EB57B5
	subl	$1441486773, %eax               # imm = 0x55EB57B5
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-921467393, %eax               # imm = 0xC91385FF
	subl	$-921467393, %eax               # imm = 0xC91385FF
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$-302957583, %eax               # imm = 0xEDF13BF1
	xorl	$-302957583, %eax               # imm = 0xEDF13BF1
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$789667163, %eax                # imm = 0x2F115D5B
	xorl	$789667163, %eax                # imm = 0x2F115D5B
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$1232328535, %eax               # imm = 0x4973D757
	subl	$1232328535, %eax               # imm = 0x4973D757
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$1699076921, %eax               # imm = 0x6545DB39
	xorl	$1699076921, %eax               # imm = 0x6545DB39
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$255423947, %eax                # imm = 0xF3975CB
	subl	$255423947, %eax                # imm = 0xF3975CB
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-1748168355, %eax              # imm = 0x97CD115D
	subl	$-1748168355, %eax              # imm = 0x97CD115D
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$-239393475, %eax               # imm = 0xF1BB253D
	xorl	$-239393475, %eax               # imm = 0xF1BB253D
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
