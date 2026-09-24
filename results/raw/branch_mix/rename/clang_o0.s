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
	movl	-8(%rbp), %eax
	addl	$-1824959703, %eax              # imm = 0x93395329
	subl	$-1824959703, %eax              # imm = 0x93395329
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$-280262777, %eax               # imm = 0xEF4B8787
	xorl	$-280262777, %eax               # imm = 0xEF4B8787
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-7602897, %eax                 # imm = 0xFF8BFD2F
	subl	$-7602897, %eax                 # imm = 0xFF8BFD2F
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$321616169, %eax                # imm = 0x132B7929
	xorl	$321616169, %eax                # imm = 0x132B7929
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$1596444573, %eax               # imm = 0x5F27CF9D
	subl	$1596444573, %eax               # imm = 0x5F27CF9D
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$-1055148093, %eax              # imm = 0xC11BB7C3
	xorl	$-1055148093, %eax              # imm = 0xC11BB7C3
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-1411836593, %eax              # imm = 0xABD9154F
	subl	$-1411836593, %eax              # imm = 0xABD9154F
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$1398654359, %eax               # imm = 0x535DC597
	subl	$1398654359, %eax               # imm = 0x535DC597
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$-1081667089, %eax              # imm = 0xBF8711EF
	xorl	$-1081667089, %eax              # imm = 0xBF8711EF
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-1861513259, %eax              # imm = 0x910B8FD5
	subl	$-1861513259, %eax              # imm = 0x910B8FD5
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-781628645, %eax               # imm = 0xD1694B1B
	subl	$-781628645, %eax               # imm = 0xD1694B1B
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$228394381, %eax                # imm = 0xD9D058D
	xorl	$228394381, %eax                # imm = 0xD9D058D
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$703449993, %eax                # imm = 0x29EDCB89
	subl	$703449993, %eax                # imm = 0x29EDCB89
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$1270822821, %eax               # imm = 0x4BBF37A5
	xorl	$1270822821, %eax               # imm = 0x4BBF37A5
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-67768535, %eax                # imm = 0xFBF5EF29
	subl	$-67768535, %eax                # imm = 0xFBF5EF29
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-612532931, %eax               # imm = 0xDB7D7D3D
	subl	$-612532931, %eax               # imm = 0xDB7D7D3D
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$292668855, %eax                # imm = 0x1171C5B7
	xorl	$292668855, %eax                # imm = 0x1171C5B7
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$-908229229, %eax               # imm = 0xC9DD8593
	xorl	$-908229229, %eax               # imm = 0xC9DD8593
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$1264941045, %eax               # imm = 0x4B6577F5
	subl	$1264941045, %eax               # imm = 0x4B6577F5
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-1115561177, %eax              # imm = 0xBD81E327
	subl	$-1115561177, %eax              # imm = 0xBD81E327
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$2135421763, %eax               # imm = 0x7F47F343
	xorl	$2135421763, %eax               # imm = 0x7F47F343
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$1202963299, %eax               # imm = 0x47B3C363
	subl	$1202963299, %eax               # imm = 0x47B3C363
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$50709419, %eax                 # imm = 0x305C3AB
	subl	$50709419, %eax                 # imm = 0x305C3AB
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-705189493, %eax               # imm = 0xD5F7A98B
	subl	$-705189493, %eax               # imm = 0xD5F7A98B
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-4364833, %eax                 # imm = 0xFFBD65DF
	subl	$-4364833, %eax                 # imm = 0xFFBD65DF
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-343680097, %eax               # imm = 0xEB83DB9F
	subl	$-343680097, %eax               # imm = 0xEB83DB9F
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$1762629921, %eax               # imm = 0x690F9921
	subl	$1762629921, %eax               # imm = 0x690F9921
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$1326528861, %eax               # imm = 0x4F11395D
	subl	$1326528861, %eax               # imm = 0x4F11395D
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
