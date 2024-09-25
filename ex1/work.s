	.file	"work.c"
	.text
	.section	.rodata
.LC0:                       ; Label to the string "Hello World"
	.string	"Hello World"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp ; Save address of previous stack frame
	.cfi_def_cfa_offset 16
	.cfi_offet 6, -16
	movq	%rsp, %rbp ; Address of current stack frame ?? Save the address of current stack into rbp
	.cfi_def_cfa_register 6
    ; leaq = Load Effective Address 
    ; Computes the address without accessing the memory and stores the address value to rax register
    ; (%rip) = relative addressing - the address of .LC0 is calculated relative to %rip
	leaq	.LC0(%rip), %rax   ; Load the address from LC0 into rax registry. 
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
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
