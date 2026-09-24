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
	cmpl	$9, %eax
	je	.LBB1_4
# %bb.1:
	movzbl	-2(%rbp), %eax
	cmpl	$10, %eax
	je	.LBB1_4
# %bb.2:
	movzbl	-2(%rbp), %eax
	cmpl	$13, %eax
	je	.LBB1_4
# %bb.3:
	movzbl	-2(%rbp), %eax
	cmpl	$32, %eax
	jne	.LBB1_5
.LBB1_4:
	movzbl	-1(%rbp), %eax
	movl	%eax, -8(%rbp)
	jmp	.LBB1_17
.LBB1_5:
	movzbl	-2(%rbp), %eax
	cmpl	$123, %eax
	je	.LBB1_7
# %bb.6:
	movzbl	-2(%rbp), %eax
	cmpl	$91, %eax
	jne	.LBB1_8
.LBB1_7:
	movzbl	-1(%rbp), %eax
	addl	$1, %eax
	andl	$255, %eax
	movl	%eax, -8(%rbp)
	jmp	.LBB1_16
.LBB1_8:
	movzbl	-2(%rbp), %eax
	cmpl	$125, %eax
	je	.LBB1_10
# %bb.9:
	movzbl	-2(%rbp), %eax
	cmpl	$93, %eax
	jne	.LBB1_11
.LBB1_10:
	movzbl	-1(%rbp), %eax
	subl	$1, %eax
	andl	$255, %eax
	movl	%eax, -8(%rbp)
	jmp	.LBB1_15
.LBB1_11:
	movzbl	-2(%rbp), %eax
	cmpl	$34, %eax
	jne	.LBB1_13
# %bb.12:
	movzbl	-1(%rbp), %eax
	xorl	$128, %eax
	andl	$255, %eax
	movl	%eax, -8(%rbp)
	jmp	.LBB1_14
.LBB1_13:
	movzbl	-1(%rbp), %eax
	movzbl	-2(%rbp), %ecx
	andl	$3, %ecx
	addl	%ecx, %eax
	andl	$255, %eax
	movl	%eax, -8(%rbp)
.LBB1_14:
	jmp	.LBB1_15
.LBB1_15:
	jmp	.LBB1_16
.LBB1_16:
	jmp	.LBB1_17
.LBB1_17:
	movl	-8(%rbp), %eax
	xorl	$1401913627, %eax               # imm = 0x538F811B
	xorl	$1401913627, %eax               # imm = 0x538F811B
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$-1150717155, %eax              # imm = 0xBB69731D
	xorl	$-1150717155, %eax              # imm = 0xBB69731D
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-349752881, %eax               # imm = 0xEB2731CF
	subl	$-349752881, %eax               # imm = 0xEB2731CF
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-1652191791, %eax              # imm = 0x9D858DD1
	subl	$-1652191791, %eax              # imm = 0x9D858DD1
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$222156219, %eax                # imm = 0xD3DD5BB
	xorl	$222156219, %eax                # imm = 0xD3DD5BB
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-1782770257, %eax              # imm = 0x95BD15AF
	subl	$-1782770257, %eax              # imm = 0x95BD15AF
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-45247529, %eax                # imm = 0xFD4D93D7
	subl	$-45247529, %eax                # imm = 0xFD4D93D7
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$-471520789, %eax               # imm = 0xE3E529EB
	xorl	$-471520789, %eax               # imm = 0xE3E529EB
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$-1644452027, %eax              # imm = 0x9DFBA745
	xorl	$-1644452027, %eax              # imm = 0x9DFBA745
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$999902141, %eax                # imm = 0x3B994BBD
	xorl	$999902141, %eax                # imm = 0x3B994BBD
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$-1146404539, %eax              # imm = 0xBBAB4145
	xorl	$-1146404539, %eax              # imm = 0xBBAB4145
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-908235913, %eax               # imm = 0xC9DD6B77
	subl	$-908235913, %eax               # imm = 0xC9DD6B77
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$2030794161, %eax               # imm = 0x790B75B1
	xorl	$2030794161, %eax               # imm = 0x790B75B1
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-444741685, %eax               # imm = 0xE57DC7CB
	subl	$-444741685, %eax               # imm = 0xE57DC7CB
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$-1217953973, %eax              # imm = 0xB7677F4B
	xorl	$-1217953973, %eax              # imm = 0xB7677F4B
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-149612731, %eax               # imm = 0xF7151745
	subl	$-149612731, %eax               # imm = 0xF7151745
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-1688889893, %eax              # imm = 0x9B5595DB
	subl	$-1688889893, %eax              # imm = 0x9B5595DB
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$-1120014413, %eax              # imm = 0xBD3DEFB3
	xorl	$-1120014413, %eax              # imm = 0xBD3DEFB3
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$925448607, %eax                # imm = 0x3729399F
	xorl	$925448607, %eax                # imm = 0x3729399F
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-370074307, %eax               # imm = 0xE9F11D3D
	subl	$-370074307, %eax               # imm = 0xE9F11D3D
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$659145059, %eax                # imm = 0x2749C163
	subl	$659145059, %eax                # imm = 0x2749C163
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-2115648137, %eax              # imm = 0x81E5C577
	subl	$-2115648137, %eax              # imm = 0x81E5C577
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$1841894881, %eax               # imm = 0x6DC915E1
	subl	$1841894881, %eax               # imm = 0x6DC915E1
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$435643767, %eax                # imm = 0x19F76577
	subl	$435643767, %eax                # imm = 0x19F76577
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$1271503267, %eax               # imm = 0x4BC999A3
	xorl	$1271503267, %eax               # imm = 0x4BC999A3
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$1025349565, %eax               # imm = 0x3D1D97BD
	subl	$1025349565, %eax               # imm = 0x3D1D97BD
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$464207355, %eax                # imm = 0x1BAB3DFB
	xorl	$464207355, %eax                # imm = 0x1BAB3DFB
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$569763237, %eax                # imm = 0x21F5E5A5
	subl	$569763237, %eax                # imm = 0x21F5E5A5
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
