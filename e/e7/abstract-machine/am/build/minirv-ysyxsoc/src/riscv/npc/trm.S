#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"trm.c"
	.option nopic
	.text
	.section	.text.putch,"ax",@progbits
	.align	2
	.globl	putch
	.hidden	putch
	.type	putch, @function
putch:
	li	a4,268435456
.L2:
	lw	a5,4(a4)
	andi	a5,a5,1
	beq	a5,zero,.L2
	sb	a0,0(a4)
	ret
	.size	putch, .-putch
	.section	.text.halt,"ax",@progbits
	.align	2
	.globl	halt
	.hidden	halt
	.type	halt, @function
halt:
#APP
# 24 "/home/ysyx/ysyx-workbench/abstract-machine/am/src/riscv/npc/trm.c" 1
	mv a0, a0; ebreak
# 0 "" 2
#NO_APP
.L7:
	j	.L7
	.size	halt, .-halt
	.section	.text._trm_init,"ax",@progbits
	.align	2
	.globl	_trm_init
	.hidden	_trm_init
	.type	_trm_init, @function
_trm_init:
	addi	sp,sp,-12
	lla	a0,.LANCHOR0
	sw	ra,8(sp)
	call	main
#APP
# 24 "/home/ysyx/ysyx-workbench/abstract-machine/am/src/riscv/npc/trm.c" 1
	mv a0, a0; ebreak
# 0 "" 2
#NO_APP
.L9:
	j	.L9
	.size	_trm_init, .-_trm_init
	.hidden	heap
	.globl	heap
	.section	.rodata.mainargs,"a"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	mainargs, @object
	.size	mainargs, 64
mainargs:
	.string	"the_insert-arg_rule_in_Makefile_will_insert_mainargs_here"
	.zero	6
	.section	.sdata.heap,"aw"
	.align	2
	.type	heap, @object
	.size	heap, 8
heap:
	.word	_heap_start
	.word	_pmem_start+134217728
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
