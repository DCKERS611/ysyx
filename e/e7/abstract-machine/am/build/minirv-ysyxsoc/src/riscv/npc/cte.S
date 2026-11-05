#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"cte.c"
	.option nopic
	.text
	.section	.rodata.__am_irq_handle.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"AM Panic: "
	.align	2
.LC1:
	.string	"Assertion `c != ((void *)0)' failed"
	.align	2
.LC2:
	.string	" @ /home/ysyx/ysyx-workbench/abstract-machine/am/src/riscv/npc/cte.c:15  \n"
	.section	.text.__am_irq_handle,"ax",@progbits
	.align	2
	.globl	__am_irq_handle
	.hidden	__am_irq_handle
	.type	__am_irq_handle, @function
__am_irq_handle:
	la a5, .LANCHOR0; lw a5, 0(a5);
	mv	a1,a0
	beq	a5,zero,.L7
	addi	sp,sp,-44
	li	a4,4
	sw	ra,40(sp)
	sw	s0,36(sp)
	sw	a4,0(sp)
	sw	zero,4(sp)
	sw	zero,8(sp)
	sw	zero,12(sp)
	mv	a0,sp
	jalr	a5
	beq	a0,zero,.L16
	lw	ra,40(sp)
	lw	s0,36(sp)
	addi	sp,sp,44
	jr	ra
.L7:
	ret
.L16:
	lla	s0,.LC0
	li	a0,65
.L4:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L4
	lla	s0,.LC1
	li	a0,65
.L5:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L5
	lla	s0,.LC2
	li	a0,32
.L6:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L6
	li	a0,1
	call	halt
	.size	__am_irq_handle, .-__am_irq_handle
	.section	.text.cte_init,"ax",@progbits
	.align	2
	.globl	cte_init
	.hidden	cte_init
	.type	cte_init, @function
cte_init:
	mv	a5,a0
	lla	a4,__am_asm_trap
#APP
# 25 "/home/ysyx/ysyx-workbench/abstract-machine/am/src/riscv/npc/cte.c" 1
	csrw mtvec, a4
# 0 "" 2
#NO_APP
	li	a0,1
	la a4, .LANCHOR0; sw a5, 0(a4);
	ret
	.size	cte_init, .-cte_init
	.section	.text.kcontext,"ax",@progbits
	.align	2
	.globl	kcontext
	.hidden	kcontext
	.type	kcontext, @function
kcontext:
	addi	sp,sp,-8
	li	a0,0
	addi	sp,sp,8
	jr	ra
	.size	kcontext, .-kcontext
	.section	.text.yield,"ax",@progbits
	.align	2
	.globl	yield
	.hidden	yield
	.type	yield, @function
yield:
#APP
# 39 "/home/ysyx/ysyx-workbench/abstract-machine/am/src/riscv/npc/cte.c" 1
	li a5, -1; ecall
# 0 "" 2
#NO_APP
	ret
	.size	yield, .-yield
	.section	.text.ienabled,"ax",@progbits
	.align	2
	.globl	ienabled
	.hidden	ienabled
	.type	ienabled, @function
ienabled:
	li	a0,0
	ret
	.size	ienabled, .-ienabled
	.section	.text.iset,"ax",@progbits
	.align	2
	.globl	iset
	.hidden	iset
	.type	iset, @function
iset:
	ret
	.size	iset, .-iset
	.section	.sbss.user_handler,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	user_handler, @object
	.size	user_handler, 4
user_handler:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
