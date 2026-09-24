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
	movzbl	-2(%rbp), %eax
	andl	$128, %eax
	cmpl	$0, %eax
	je	.LBB1_2
# %bb.1:
	movzbl	-1(%rbp), %eax
	shll	%eax
	movzbl	-2(%rbp), %ecx
	andl	$127, %ecx
	xorl	%ecx, %eax
	andl	$255, %eax
	movl	%eax, -12(%rbp)                 # 4-byte Spill
	jmp	.LBB1_3
.LBB1_2:
	movzbl	-1(%rbp), %eax
	movzbl	-2(%rbp), %ecx
	addl	%ecx, %eax
	andl	$255, %eax
	movl	%eax, -12(%rbp)                 # 4-byte Spill
.LBB1_3:
	movl	-12(%rbp), %eax                 # 4-byte Reload
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-947432157, %eax               # imm = 0xC7875523
	subl	$-947432157, %eax               # imm = 0xC7875523
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$870534993, %eax                # imm = 0x33E34F51
	subl	$870534993, %eax                # imm = 0x33E34F51
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$2042206477, %eax               # imm = 0x79B9990D
	xorl	$2042206477, %eax               # imm = 0x79B9990D
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$-1218331885, %eax              # imm = 0xB761BB13
	xorl	$-1218331885, %eax              # imm = 0xB761BB13
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$1911238983, %eax               # imm = 0x71EB3147
	xorl	$1911238983, %eax               # imm = 0x71EB3147
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-909808161, %eax               # imm = 0xC9C56DDF
	subl	$-909808161, %eax               # imm = 0xC9C56DDF
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-1751294673, %eax              # imm = 0x979D5D2F
	subl	$-1751294673, %eax              # imm = 0x979D5D2F
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-1311021307, %eax              # imm = 0xB1DB6705
	subl	$-1311021307, %eax              # imm = 0xB1DB6705
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$566360861, %eax                # imm = 0x21C1FB1D
	subl	$566360861, %eax                # imm = 0x21C1FB1D
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$-1687968263, %eax              # imm = 0x9B63A5F9
	xorl	$-1687968263, %eax              # imm = 0x9B63A5F9
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$802809271, %eax                # imm = 0x2FD9E5B7
	xorl	$802809271, %eax                # imm = 0x2FD9E5B7
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$393690455, %eax                # imm = 0x17773D57
	xorl	$393690455, %eax                # imm = 0x17773D57
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$1929446391, %eax               # imm = 0x730103F7
	subl	$1929446391, %eax               # imm = 0x730103F7
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$1295902547, %eax               # imm = 0x4D3DE753
	xorl	$1295902547, %eax               # imm = 0x4D3DE753
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$399312325, %eax                # imm = 0x17CD05C5
	subl	$399312325, %eax                # imm = 0x17CD05C5
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$1407826691, %eax               # imm = 0x53E9BB03
	xorl	$1407826691, %eax               # imm = 0x53E9BB03
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$-771802855, %eax               # imm = 0xD1FF3919
	xorl	$-771802855, %eax               # imm = 0xD1FF3919
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$32897923, %eax                 # imm = 0x1F5FB83
	subl	$32897923, %eax                 # imm = 0x1F5FB83
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-1212958927, %eax              # imm = 0xB7B3B731
	subl	$-1212958927, %eax              # imm = 0xB7B3B731
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$-214993081, %eax               # imm = 0xF32F7747
	xorl	$-214993081, %eax               # imm = 0xF32F7747
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$292640693, %eax                # imm = 0x117157B5
	xorl	$292640693, %eax                # imm = 0x117157B5
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$1061536133, %eax               # imm = 0x3F45C185
	xorl	$1061536133, %eax               # imm = 0x3F45C185
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$399482283, %eax                # imm = 0x17CF9DAB
	subl	$399482283, %eax                # imm = 0x17CF9DAB
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-439617547, %eax               # imm = 0xE5CBF7F5
	subl	$-439617547, %eax               # imm = 0xE5CBF7F5
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$-982572561, %eax               # imm = 0xC56F21EF
	xorl	$-982572561, %eax               # imm = 0xC56F21EF
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-1919592513, %eax              # imm = 0x8D9557BF
	subl	$-1919592513, %eax              # imm = 0x8D9557BF
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$-276844787, %eax               # imm = 0xEF7FAF0D
	xorl	$-276844787, %eax               # imm = 0xEF7FAF0D
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-2116441631, %eax              # imm = 0x81D9A9E1
	subl	$-2116441631, %eax              # imm = 0x81D9A9E1
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
