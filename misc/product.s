	.file	"product.c"
	.text
	.globl	rproduct
	.type	rproduct, @function
rproduct:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp # same
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp # rrmovq %rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx # same
	subq	$24, %rsp # irmovq $24, %r11; subq %r11, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -24(%rbp) # rmmovq %rdi, -24(%rbp)
	movq	%rsi, -32(%rbp) # rmmovq %rsi, -32(%rbp)
	cmpq	$1, -32(%rbp) # irmovq $1, %r9; andq %r9, -32(%rbp)
	jg	.L2
	movl	$1, %eax
	jmp	.L3
.L2:
	movq	-24(%rbp), %rax
	movq	(%rax), %rbx
	movq	-32(%rbp), %rax
	leaq	-1(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	$8, %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	rproduct
	imulq	%rbx, %rax
.L3:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	rproduct, .-rproduct
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
