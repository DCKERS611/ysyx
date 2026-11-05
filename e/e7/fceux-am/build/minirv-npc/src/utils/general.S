#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"general.cpp"
	.option nopic
	.text
	.section	.text._Z6uppow2j,"ax",@progbits
	.align	2
	.globl	_Z6uppow2j
	.hidden	_Z6uppow2j
	.type	_Z6uppow2j, @function
_Z6uppow2j:
	li	a5,31
	li	a2,1
	li	a1,-1
	j	.L4
.L2:
	addi	a5,a5,-1
	beq	a5,a1,.L3
.L4:
	sll	a4,a2,a5
	and	a3,a4,a0
	beq	a3,zero,.L2
	beq	a4,a0,.L3
	addi	a5,a5,1
	sll	a0,a2,a5
	ret
.L3:
	ret
	.size	_Z6uppow2j, .-_Z6uppow2j
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
