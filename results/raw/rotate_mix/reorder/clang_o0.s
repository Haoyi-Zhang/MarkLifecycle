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
	movl	-12(%rbp), %eax
	xorl	$-2059277045, %eax              # imm = 0x8541ED0B
	xorl	$-2059277045, %eax              # imm = 0x8541ED0B
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	xorl	$-439384181, %eax               # imm = 0xE5CF878B
	xorl	$-439384181, %eax               # imm = 0xE5CF878B
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addl	$1604710829, %eax               # imm = 0x5FA5F1AD
	subl	$1604710829, %eax               # imm = 0x5FA5F1AD
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addl	$2135894891, %eax               # imm = 0x7F4F2B6B
	subl	$2135894891, %eax               # imm = 0x7F4F2B6B
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	xorl	$226689851, %eax                # imm = 0xD83033B
	xorl	$226689851, %eax                # imm = 0xD83033B
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	xorl	$1912464321, %eax               # imm = 0x71FDE3C1
	xorl	$1912464321, %eax               # imm = 0x71FDE3C1
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addl	$1840375703, %eax               # imm = 0x6DB1E797
	subl	$1840375703, %eax               # imm = 0x6DB1E797
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addl	$1500729343, %eax               # imm = 0x59734FFF
	subl	$1500729343, %eax               # imm = 0x59734FFF
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	xorl	$30615839, %eax                 # imm = 0x1D3291F
	xorl	$30615839, %eax                 # imm = 0x1D3291F
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	xorl	$-1559548059, %eax              # imm = 0xA30B2F65
	xorl	$-1559548059, %eax              # imm = 0xA30B2F65
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addl	$-646591155, %eax               # imm = 0xD975CD4D
	subl	$-646591155, %eax               # imm = 0xD975CD4D
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	xorl	$-1212310067, %eax              # imm = 0xB7BD9DCD
	xorl	$-1212310067, %eax              # imm = 0xB7BD9DCD
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	xorl	$1271904739, %eax               # imm = 0x4BCFB9E3
	xorl	$1271904739, %eax               # imm = 0x4BCFB9E3
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	xorl	$1673888089, %eax               # imm = 0x63C58159
	xorl	$1673888089, %eax               # imm = 0x63C58159
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	xorl	$86328191, %eax                 # imm = 0x525437F
	xorl	$86328191, %eax                 # imm = 0x525437F
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addl	$2100637661, %eax               # imm = 0x7D352FDD
	subl	$2100637661, %eax               # imm = 0x7D352FDD
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addl	$990868259, %eax                # imm = 0x3B0F7323
	subl	$990868259, %eax                # imm = 0x3B0F7323
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	xorl	$2064232259, %eax               # imm = 0x7B09AF43
	xorl	$2064232259, %eax               # imm = 0x7B09AF43
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addl	$1297969533, %eax               # imm = 0x4D5D717D
	subl	$1297969533, %eax               # imm = 0x4D5D717D
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addl	$1541615917, %eax               # imm = 0x5BE3312D
	subl	$1541615917, %eax               # imm = 0x5BE3312D
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	xorl	$603714977, %eax                # imm = 0x23FBF5A1
	xorl	$603714977, %eax                # imm = 0x23FBF5A1
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addl	$-547025659, %eax               # imm = 0xDF650D05
	subl	$-547025659, %eax               # imm = 0xDF650D05
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addl	$-1783164969, %eax              # imm = 0x95B70FD7
	subl	$-1783164969, %eax              # imm = 0x95B70FD7
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	xorl	$2098281881, %eax               # imm = 0x7D113D99
	xorl	$2098281881, %eax               # imm = 0x7D113D99
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	xorl	$2000804181, %eax               # imm = 0x7741D955
	xorl	$2000804181, %eax               # imm = 0x7741D955
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	xorl	$-307816003, %eax               # imm = 0xEDA719BD
	xorl	$-307816003, %eax               # imm = 0xEDA719BD
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	xorl	$-2052904131, %eax              # imm = 0x85A32B3D
	xorl	$-2052904131, %eax              # imm = 0x85A32B3D
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	xorl	$661354357, %eax                # imm = 0x276B7775
	xorl	$661354357, %eax                # imm = 0x276B7775
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
