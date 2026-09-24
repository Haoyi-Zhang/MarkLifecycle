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
	cmpl	$65, %eax
	jb	.LBB1_3
# %bb.1:
	movzbl	-2(%rbp), %eax
	cmpl	$90, %eax
	ja	.LBB1_3
# %bb.2:
	movzbl	-2(%rbp), %eax
	subl	$65, %eax
	movl	%eax, -8(%rbp)
	jmp	.LBB1_18
.LBB1_3:
	movzbl	-2(%rbp), %eax
	cmpl	$97, %eax
	jb	.LBB1_6
# %bb.4:
	movzbl	-2(%rbp), %eax
	cmpl	$122, %eax
	ja	.LBB1_6
# %bb.5:
	movzbl	-2(%rbp), %eax
	subl	$71, %eax
	movl	%eax, -8(%rbp)
	jmp	.LBB1_17
.LBB1_6:
	movzbl	-2(%rbp), %eax
	cmpl	$48, %eax
	jb	.LBB1_9
# %bb.7:
	movzbl	-2(%rbp), %eax
	cmpl	$57, %eax
	ja	.LBB1_9
# %bb.8:
	movzbl	-2(%rbp), %eax
	addl	$4, %eax
	movl	%eax, -8(%rbp)
	jmp	.LBB1_16
.LBB1_9:
	movzbl	-2(%rbp), %eax
	cmpl	$43, %eax
	jne	.LBB1_11
# %bb.10:
	movl	$62, -8(%rbp)
	jmp	.LBB1_15
.LBB1_11:
	movzbl	-2(%rbp), %eax
	cmpl	$47, %eax
	jne	.LBB1_13
# %bb.12:
	movl	$63, -8(%rbp)
	jmp	.LBB1_14
.LBB1_13:
	movl	$255, -8(%rbp)
.LBB1_14:
	jmp	.LBB1_15
.LBB1_15:
	jmp	.LBB1_16
.LBB1_16:
	jmp	.LBB1_17
.LBB1_17:
	jmp	.LBB1_18
.LBB1_18:
	movl	-8(%rbp), %eax
	movzbl	-1(%rbp), %ecx
	xorl	%ecx, %eax
	andl	$255, %eax
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addl	$-1754324589, %eax              # imm = 0x976F2193
	subl	$-1754324589, %eax              # imm = 0x976F2193
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	xorl	$-43913373, %eax                # imm = 0xFD61EF63
	xorl	$-43913373, %eax                # imm = 0xFD61EF63
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	xorl	$-1857051175, %eax              # imm = 0x914FA5D9
	xorl	$-1857051175, %eax              # imm = 0x914FA5D9
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addl	$-1420225749, %eax              # imm = 0xAB59132B
	subl	$-1420225749, %eax              # imm = 0xAB59132B
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	xorl	$-552384727, %eax               # imm = 0xDF134729
	xorl	$-552384727, %eax               # imm = 0xDF134729
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	xorl	$-1649842339, %eax              # imm = 0x9DA9675D
	xorl	$-1649842339, %eax              # imm = 0x9DA9675D
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	xorl	$-443310283, %eax               # imm = 0xE5939F35
	xorl	$-443310283, %eax               # imm = 0xE5939F35
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addl	$-1686135339, %eax              # imm = 0x9B7F9DD5
	subl	$-1686135339, %eax              # imm = 0x9B7F9DD5
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addl	$-1850218087, %eax              # imm = 0x91B7E999
	subl	$-1850218087, %eax              # imm = 0x91B7E999
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addl	$-985674837, %eax               # imm = 0xC53FCBAB
	subl	$-985674837, %eax               # imm = 0xC53FCBAB
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addl	$1576341773, %eax               # imm = 0x5DF5110D
	subl	$1576341773, %eax               # imm = 0x5DF5110D
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addl	$-1175622881, %eax              # imm = 0xB9ED6B1F
	subl	$-1175622881, %eax              # imm = 0xB9ED6B1F
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	xorl	$1330379609, %eax               # imm = 0x4F4BFB59
	xorl	$1330379609, %eax               # imm = 0x4F4BFB59
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addl	$-1421365811, %eax              # imm = 0xAB47ADCD
	subl	$-1421365811, %eax              # imm = 0xAB47ADCD
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addl	$836893615, %eax                # imm = 0x31E1FBAF
	subl	$836893615, %eax                # imm = 0x31E1FBAF
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addl	$-48819807, %eax                # imm = 0xFD1711A1
	subl	$-48819807, %eax                # imm = 0xFD1711A1
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	xorl	$1369794969, %eax               # imm = 0x51A56999
	xorl	$1369794969, %eax               # imm = 0x51A56999
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addl	$-1246764261, %eax              # imm = 0xB5AFE31B
	subl	$-1246764261, %eax              # imm = 0xB5AFE31B
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addl	$-1584025319, %eax              # imm = 0xA195B119
	subl	$-1584025319, %eax              # imm = 0xA195B119
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addl	$-1384962105, %eax              # imm = 0xAD7327C7
	subl	$-1384962105, %eax              # imm = 0xAD7327C7
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addl	$-44961853, %eax                # imm = 0xFD51EFC3
	subl	$-44961853, %eax                # imm = 0xFD51EFC3
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addl	$2138278765, %eax               # imm = 0x7F738B6D
	subl	$2138278765, %eax               # imm = 0x7F738B6D
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addl	$-1389500551, %eax              # imm = 0xAD2DE779
	subl	$-1389500551, %eax              # imm = 0xAD2DE779
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addl	$-473743061, %eax               # imm = 0xE3C3412B
	subl	$-473743061, %eax               # imm = 0xE3C3412B
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addl	$-1717999229, %eax              # imm = 0x99996983
	subl	$-1717999229, %eax              # imm = 0x99996983
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	xorl	$-1990099705, %eax              # imm = 0x89617D07
	xorl	$-1990099705, %eax              # imm = 0x89617D07
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addl	$1744525667, %eax               # imm = 0x67FB5963
	subl	$1744525667, %eax               # imm = 0x67FB5963
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	xorl	$-1989422163, %eax              # imm = 0x896BD3AD
	xorl	$-1989422163, %eax              # imm = 0x896BD3AD
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
