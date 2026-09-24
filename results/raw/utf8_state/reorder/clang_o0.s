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
	cmpl	$0, %eax
	je	.LBB1_5
# %bb.1:
	movzbl	-2(%rbp), %eax
	andl	$192, %eax
	cmpl	$128, %eax
	jne	.LBB1_3
# %bb.2:
	movzbl	-1(%rbp), %eax
	subl	$1, %eax
	andl	$255, %eax
	movl	%eax, -12(%rbp)                 # 4-byte Spill
	jmp	.LBB1_4
.LBB1_3:
	movl	$255, %eax
	movl	%eax, -12(%rbp)                 # 4-byte Spill
	jmp	.LBB1_4
.LBB1_4:
	movl	-12(%rbp), %eax                 # 4-byte Reload
	movl	%eax, -8(%rbp)
	jmp	.LBB1_21
.LBB1_5:
	movzbl	-2(%rbp), %eax
	cmpl	$128, %eax
	jae	.LBB1_7
# %bb.6:
	movl	$0, -8(%rbp)
	jmp	.LBB1_20
.LBB1_7:
	movzbl	-2(%rbp), %eax
	cmpl	$194, %eax
	jb	.LBB1_10
# %bb.8:
	movzbl	-2(%rbp), %eax
	cmpl	$223, %eax
	ja	.LBB1_10
# %bb.9:
	movl	$1, -8(%rbp)
	jmp	.LBB1_19
.LBB1_10:
	movzbl	-2(%rbp), %eax
	cmpl	$224, %eax
	jb	.LBB1_13
# %bb.11:
	movzbl	-2(%rbp), %eax
	cmpl	$239, %eax
	ja	.LBB1_13
# %bb.12:
	movl	$2, -8(%rbp)
	jmp	.LBB1_18
.LBB1_13:
	movzbl	-2(%rbp), %eax
	cmpl	$240, %eax
	jb	.LBB1_16
# %bb.14:
	movzbl	-2(%rbp), %eax
	cmpl	$244, %eax
	ja	.LBB1_16
# %bb.15:
	movl	$3, -8(%rbp)
	jmp	.LBB1_17
.LBB1_16:
	movl	$255, -8(%rbp)
.LBB1_17:
	jmp	.LBB1_18
.LBB1_18:
	jmp	.LBB1_19
.LBB1_19:
	jmp	.LBB1_20
.LBB1_20:
	jmp	.LBB1_21
.LBB1_21:
	movl	-8(%rbp), %eax
	addl	$-484049031, %eax               # imm = 0xE325FF79
	subl	$-484049031, %eax               # imm = 0xE325FF79
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$1438507827, %eax               # imm = 0x55BDE333
	subl	$1438507827, %eax               # imm = 0x55BDE333
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-42612445, %eax                # imm = 0xFD75C923
	subl	$-42612445, %eax                # imm = 0xFD75C923
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-1881162471, %eax              # imm = 0x8FDFBD19
	subl	$-1881162471, %eax              # imm = 0x8FDFBD19
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$-1413018723, %eax              # imm = 0xABC70B9D
	xorl	$-1413018723, %eax              # imm = 0xABC70B9D
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-1985775271, %eax              # imm = 0x89A37959
	subl	$-1985775271, %eax              # imm = 0x89A37959
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$-646616173, %eax               # imm = 0xD9756B93
	xorl	$-646616173, %eax               # imm = 0xD9756B93
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$766090119, %eax                # imm = 0x2DA99B87
	xorl	$766090119, %eax                # imm = 0x2DA99B87
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$697422683, %eax                # imm = 0x2991D35B
	xorl	$697422683, %eax                # imm = 0x2991D35B
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$-1214296197, %eax              # imm = 0xB79F4F7B
	xorl	$-1214296197, %eax              # imm = 0xB79F4F7B
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$-921986061, %eax               # imm = 0xC90B9BF3
	xorl	$-921986061, %eax               # imm = 0xC90B9BF3
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$-986983435, %eax               # imm = 0xC52BD3F5
	xorl	$-986983435, %eax               # imm = 0xC52BD3F5
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-1687080691, %eax              # imm = 0x9B71310D
	subl	$-1687080691, %eax              # imm = 0x9B71310D
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$694494155, %eax                # imm = 0x296523CB
	subl	$694494155, %eax                # imm = 0x296523CB
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-982824679, %eax               # imm = 0xC56B4919
	subl	$-982824679, %eax               # imm = 0xC56B4919
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$556369821, %eax                # imm = 0x2129879D
	subl	$556369821, %eax                # imm = 0x2129879D
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-1412462267, %eax              # imm = 0xABCF8945
	subl	$-1412462267, %eax              # imm = 0xABCF8945
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$2134875479, %eax               # imm = 0x7F3F9D57
	xorl	$2134875479, %eax               # imm = 0x7F3F9D57
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$1777458119, %eax               # imm = 0x69F1DBC7
	subl	$1777458119, %eax               # imm = 0x69F1DBC7
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$460271051, %eax                # imm = 0x1B6F2DCB
	xorl	$460271051, %eax                # imm = 0x1B6F2DCB
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-1082950275, %eax              # imm = 0xBF737D7D
	subl	$-1082950275, %eax              # imm = 0xBF737D7D
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$-818676929, %eax               # imm = 0xCF33FB3F
	xorl	$-818676929, %eax               # imm = 0xCF33FB3F
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$-552367193, %eax               # imm = 0xDF138BA7
	xorl	$-552367193, %eax               # imm = 0xDF138BA7
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$-687668419, %eax               # imm = 0xD703033D
	xorl	$-687668419, %eax               # imm = 0xD703033D
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-143672453, %eax               # imm = 0xF76FBB7B
	subl	$-143672453, %eax               # imm = 0xF76FBB7B
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-276752497, %eax               # imm = 0xEF81178F
	subl	$-276752497, %eax               # imm = 0xEF81178F
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$-1449843797, %eax              # imm = 0xA99523AB
	xorl	$-1449843797, %eax              # imm = 0xA99523AB
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	$-2128351953, %eax              # imm = 0x8123ED2F
	xorl	$-2128351953, %eax              # imm = 0x8123ED2F
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
