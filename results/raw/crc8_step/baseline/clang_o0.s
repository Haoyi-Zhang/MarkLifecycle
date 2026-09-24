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
	movl	-8(%rbp), %eax
	addl	$-1042947711, %eax              # imm = 0xC1D5E181
	subl	$-1042947711, %eax              # imm = 0xC1D5E181
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-1959546961, %eax              # imm = 0x8B33AFAF
	subl	$-1959546961, %eax              # imm = 0x8B33AFAF
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$-170156251, %eax               # imm = 0xF5DB9F25
	xorl	$-170156251, %eax               # imm = 0xF5DB9F25
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$356058095, %eax                # imm = 0x153903EF
	subl	$356058095, %eax                # imm = 0x153903EF
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$388467663, %eax                # imm = 0x17278BCF
	xorl	$388467663, %eax                # imm = 0x17278BCF
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$-1492708973, %eax              # imm = 0xA7071193
	xorl	$-1492708973, %eax              # imm = 0xA7071193
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$201313723, %eax                # imm = 0xBFFCDBB
	subl	$201313723, %eax                # imm = 0xBFFCDBB
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$1298882847, %eax               # imm = 0x4D6B611F
	xorl	$1298882847, %eax               # imm = 0x4D6B611F
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$-1179548917, %eax              # imm = 0xB9B1830B
	xorl	$-1179548917, %eax              # imm = 0xB9B1830B
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$930155503, %eax                # imm = 0x37710BEF
	xorl	$930155503, %eax                # imm = 0x37710BEF
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-578321115, %eax               # imm = 0xDD878525
	subl	$-578321115, %eax               # imm = 0xDD878525
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-543819457, %eax               # imm = 0xDF95F93F
	subl	$-543819457, %eax               # imm = 0xDF95F93F
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-678465101, %eax               # imm = 0xD78F71B3
	subl	$-678465101, %eax               # imm = 0xD78F71B3
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$1196140995, %eax               # imm = 0x474BA9C3
	subl	$1196140995, %eax               # imm = 0x474BA9C3
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$1024952803, %eax               # imm = 0x3D1789E3
	subl	$1024952803, %eax               # imm = 0x3D1789E3
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-1313345099, %eax              # imm = 0xB1B7F1B5
	subl	$-1313345099, %eax              # imm = 0xB1B7F1B5
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$91839871, %eax                 # imm = 0x5795D7F
	subl	$91839871, %eax                 # imm = 0x5795D7F
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$905018877, %eax                # imm = 0x35F17DFD
	subl	$905018877, %eax                # imm = 0x35F17DFD
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-145414811, %eax               # imm = 0xF7552565
	subl	$-145414811, %eax               # imm = 0xF7552565
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$1338234289, %eax               # imm = 0x4FC3D5B1
	subl	$1338234289, %eax               # imm = 0x4FC3D5B1
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$661124463, %eax                # imm = 0x2767F56F
	subl	$661124463, %eax                # imm = 0x2767F56F
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$-647656617, %eax               # imm = 0xD9658B57
	xorl	$-647656617, %eax               # imm = 0xD9658B57
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$54869835, %eax                 # imm = 0x3453F4B
	xorl	$54869835, %eax                 # imm = 0x3453F4B
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-1117542501, %eax              # imm = 0xBD63A79B
	subl	$-1117542501, %eax              # imm = 0xBD63A79B
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$-1495245, %eax                 # imm = 0xFFE92F33
	xorl	$-1495245, %eax                 # imm = 0xFFE92F33
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$764233665, %eax                # imm = 0x2D8D47C1
	subl	$764233665, %eax                # imm = 0x2D8D47C1
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$499630873, %eax                # imm = 0x1DC7C319
	subl	$499630873, %eax                # imm = 0x1DC7C319
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$-280158327, %eax               # imm = 0xEF4D1F89
	xorl	$-280158327, %eax               # imm = 0xEF4D1F89
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
