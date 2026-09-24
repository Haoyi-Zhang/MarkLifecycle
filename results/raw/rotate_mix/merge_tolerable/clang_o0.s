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
	subq	$16, %rsp
	movb	%sil, %al
	movb	%dil, %cl
	movb	%cl, -1(%rbp)
	movb	%al, -2(%rbp)
	movzbl	-1(%rbp), %eax
	shll	$3, %eax
	movzbl	-1(%rbp), %ecx
	shrl	$5, %ecx
	orl	%ecx, %eax
	andl	$255, %eax
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movzbl	-2(%rbp), %ecx
	xorl	%ecx, %eax
	movzbl	-2(%rbp), %ecx
	shrl	$2, %ecx
	xorl	%ecx, %eax
	andl	$255, %eax
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$86328191, %esi                 # imm = 0x525437F
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$2100637661, %esi               # imm = 0x7D352FDD
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$990868259, %esi                # imm = 0x3B0F7323
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$226689851, %esi                # imm = 0xD83033B
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$1912464321, %esi               # imm = 0x71FDE3C1
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$1840375703, %esi               # imm = 0x6DB1E797
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$1500729343, %esi               # imm = 0x59734FFF
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$30615839, %esi                 # imm = 0x1D3291F
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$2735419237, %esi               # imm = 0xA30B2F65
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$3648376141, %esi               # imm = 0xD975CD4D
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$3082657229, %esi               # imm = 0xB7BD9DCD
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$1271904739, %esi               # imm = 0x4BCFB9E3
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$1673888089, %esi               # imm = 0x63C58159
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$3855583115, %esi               # imm = 0xE5CF878B
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$1604710829, %esi               # imm = 0x5FA5F1AD
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$2135894891, %esi               # imm = 0x7F4F2B6B
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$1297969533, %esi               # imm = 0x4D5D717D
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$1541615917, %esi               # imm = 0x5BE3312D
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$603714977, %esi                # imm = 0x23FBF5A1
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$3747941637, %esi               # imm = 0xDF650D05
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$2511802327, %esi               # imm = 0x95B70FD7
	callq	tc_add_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$2098281881, %esi               # imm = 0x7D113D99
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$2000804181, %esi               # imm = 0x7741D955
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$3987151293, %esi               # imm = 0xEDA719BD
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$2242063165, %esi               # imm = 0x85A32B3D
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	$661354357, %esi                # imm = 0x276B7775
	callq	tc_xor_v2
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	andl	$255, %eax
                                        # kill: def $al killed $al killed $eax
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	kernel, .Lfunc_end1-kernel
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function tc_xor_v2
	.type	tc_xor_v2,@function
tc_xor_v2:                              # @tc_xor_v2
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-4(%rbp), %eax
	movl	-8(%rbp), %ecx
	xorl	-8(%rbp), %ecx
	xorl	%ecx, %eax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end2:
	.size	tc_xor_v2, .Lfunc_end2-tc_xor_v2
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function tc_add_v2
	.type	tc_add_v2,@function
tc_add_v2:                              # @tc_add_v2
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-4(%rbp), %eax
	subl	-8(%rbp), %eax
	addl	-8(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end3:
	.size	tc_add_v2, .Lfunc_end3-tc_add_v2
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 17.0.0 (https://github.com/swiftlang/llvm-project.git 10999b6d034fe318f3d56c83bddb6572593a8bb0)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym kernel
	.addrsig_sym fwrite
	.addrsig_sym tc_xor_v2
	.addrsig_sym tc_add_v2
	.addrsig_sym stdout
