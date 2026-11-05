#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"vm.c"
	.option nopic
	.text
	.globl	__umodsi3
	.section	.text.simple_pgalloc,"ax",@progbits
	.align	2
	.globl	simple_pgalloc
	.hidden	simple_pgalloc
	.type	simple_pgalloc, @function
simple_pgalloc:
	lla	a5,.LANCHOR0
	lw	a5,0(a5)
	addi	sp,sp,-16
	sw	s1,4(sp)
	sw	ra,12(sp)
	sw	s0,8(sp)
	mv	s1,a0
	bne	a5,zero,.L2
	la a5, heap; lw a5, 0(a5);
.L2:
	mv	a0,a5
	mv	a1,s1
	sw	a5,0(sp)
	call	__umodsi3
	lw	a5,0(sp)
	beq	a0,zero,.L3
	addi	s0,a5,1
.L4:
	mv	a0,s0
	mv	a1,s1
	call	__umodsi3
	mv	a5,s0
	addi	s0,s0,1
	bne	a0,zero,.L4
.L3:
	lw	ra,12(sp)
	lw	s0,8(sp)
	add	a1,s1,a5
	lla	a4,.LANCHOR0
	sw	a1,0(a4)
	lw	s1,4(sp)
	mv	a0,a5
	addi	sp,sp,16
	jr	ra
	.size	simple_pgalloc, .-simple_pgalloc
	.section	.text.simple_pgfree,"ax",@progbits
	.align	2
	.globl	simple_pgfree
	.hidden	simple_pgfree
	.type	simple_pgfree, @function
simple_pgfree:
	ret
	.size	simple_pgfree, .-simple_pgfree
	.section	.rodata.vm_handler.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"[read fail]"
	.align	2
.LC1:
	.string	""
	.align	2
.LC2:
	.string	"[write fail]"
	.align	2
.LC3:
	.string	"AM Panic: "
	.align	2
.LC4:
	.string	"Assertion `0' failed"
	.align	2
.LC5:
	.string	" @ /home/ysyx/ysyx-workbench/am-kernels/tests/am-tests/src/tests/vm.c:40  \n"
	.align	2
.LC6:
	.string	"==== interrupt (%s)  ====\n"
	.align	2
.LC7:
	.string	"PF: %x %s%s%s\n"
	.align	2
.LC8:
	.string	"%d "
	.section	.text.vm_handler,"ax",@progbits
	.align	2
	.globl	vm_handler
	.hidden	vm_handler
	.type	vm_handler, @function
vm_handler:
	lw	a5,0(a0)
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	ra,12(sp)
	li	a4,3
	lw	a2,4(a0)
	mv	s0,a1
	beq	a5,a4,.L13
	bgtu	a5,a4,.L14
	li	a4,1
	beq	a5,a4,.L15
	li	a4,2
	bne	a5,a4,.L26
	li	a0,1
	call	iset
	sw	zero,0(sp)
	lw	a5,0(sp)
	li	a4,999424
	addi	a4,a4,575
	bgt	a5,a4,.L20
.L21:
	lw	a5,0(sp)
	addi	a5,a5,1
	sw	a5,0(sp)
	lw	a5,0(sp)
	ble	a5,a4,.L21
.L20:
	lw	a1,8(s0)
	lla	a0,.LC8
	call	printf
	la a5, .LANCHOR1; lw a5, 0(a5);
	beq	a5,zero,.L25
	la a5, .LANCHOR1; sw zero, 0(a5);
	la s0, .LANCHOR2; lw s0, 0(s0);
.L25:
	lw	ra,12(sp)
	mv	a0,s0
	lw	s0,8(sp)
	addi	sp,sp,16
	jr	ra
.L14:
	addi	a5,a5,-5
	li	a4,1
	bgtu	a5,a4,.L26
	lw	a1,12(a0)
	lla	a0,.LC6
	call	printf
.L15:
	la a5, .LANCHOR1; lw a5, 0(a5);
	beq	a5,zero,.L25
	la a5, .LANCHOR1; sw zero, 0(a5);
	la s0, .LANCHOR2; lw s0, 0(s0);
	j	.L25
.L13:
	andi	a5,a2,1
	lw	a1,8(a0)
	lla	a3,.LC0
	beq	a5,zero,.L37
	andi	a2,a2,2
	lla	a4,.LC2
	beq	a2,zero,.L38
.L19:
	lla	a2,.LC1
	lla	a0,.LC7
	call	printf
	j	.L15
.L38:
	lla	a4,.LC1
	lla	a2,.LC1
	lla	a0,.LC7
	call	printf
	j	.L15
.L37:
	andi	a2,a2,2
	lla	a3,.LC1
	lla	a4,.LC2
	bne	a2,zero,.L19
	j	.L38
.L26:
	lla	s0,.LC3
	li	a0,65
.L22:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L22
	lla	s0,.LC4
	li	a0,65
.L23:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L23
	lla	s0,.LC5
	li	a0,32
.L24:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L24
	li	a0,1
	call	halt
	.size	vm_handler, .-vm_handler
	.section	.rodata.vm_test.str1.4,"aMS",@progbits,1
	.align	2
.LC9:
	.string	"x86"
	.align	2
.LC10:
	.string	"minirv"
	.align	2
.LC11:
	.string	"native"
	.align	2
.LC12:
	.string	"Not supported architecture.\n"
	.align	2
.LC13:
	.string	"Protected address space: [%p, %p)\n"
	.align	2
.LC14:
	.string	"Code copied to %p (physical %p) execute\n"
	.section	.text.vm_test,"ax",@progbits
	.align	2
	.globl	vm_test
	.hidden	vm_test
	.type	vm_test, @function
vm_test:
	addi	sp,sp,-24
	li	a2,3
	lla	a1,.LC9
	lla	a0,.LC10
	sw	ra,20(sp)
	sw	s0,16(sp)
	sw	s1,12(sp)
	call	strncmp
	beq	a0,zero,.L40
	lla	a1,.LC11
	lla	a0,.LC10
	call	strcmp
	bne	a0,zero,.L56
.L40:
	lla	s0,.LANCHOR3
	mv	a0,s0
	call	protect
	lw	a2,8(s0)
	lw	a1,4(s0)
	lla	a0,.LC13
	call	printf
	lw	a3,4(s0)
	lw	a4,8(s0)
	lla	a5,.LANCHOR0
	lw	s1,0(a5)
	sub	a5,a4,a3
	srli	a5,a5,1
	add	a5,a5,a3
	sw	a5,0(sp)
	lw	s0,0(s0)
	bne	s1,zero,.L55
	la s1, heap; lw s1, 0(s1);
	mv	a1,s0
	mv	a0,s1
	call	__umodsi3
	beq	a0,zero,.L57
.L43:
	addi	s1,s1,1
.L55:
	mv	a1,s0
	mv	a0,s1
	call	__umodsi3
	bne	a0,zero,.L43
.L57:
	add	a4,s0,s1
	lla	a5,.LANCHOR0
	li	a2,15
	lla	a1,.LANCHOR4
	mv	a0,s1
	sw	a4,0(a5)
	call	memcpy
	lw	s0,0(sp)
	li	a3,3
	mv	a2,s1
	mv	a1,s0
	lla	a0,.LANCHOR3
	call	map
	mv	a2,s1
	mv	a1,s0
	lla	a0,.LC14
	call	printf
	mv	a3,s0
	lla	a1,stack.0
	lla	a2,stack.0+4096
	lla	a0,.LANCHOR3
	call	ucontext
	mv	a5,a0
	li	a0,1
	la a4, .LANCHOR2; sw a5, 0(a4);
	call	iset
	lw	s0,16(sp)
	lw	ra,20(sp)
	lw	s1,12(sp)
	addi	sp,sp,24
	tail	yield
.L56:
	lw	s0,16(sp)
	lw	ra,20(sp)
	lw	s1,12(sp)
	lla	a0,.LC12
	addi	sp,sp,24
	tail	printf
	.size	vm_test, .-vm_test
	.hidden	code
	.globl	code
	.section	.bss.prot,"aw",@nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	prot, @object
	.size	prot, 16
prot:
	.zero	16
	.section	.bss.stack.0,"aw",@nobits
	.align	2
	.type	stack.0, @object
	.size	stack.0, 4096
stack.0:
	.zero	4096
	.section	.data.code,"aw"
	.align	2
	.set	.LANCHOR4,. + 0
	.type	code, @object
	.size	code, 15
code:
	.string	"1\300\215\266"
	.string	""
	.string	""
	.string	""
	.ascii	"\203\300\001\315\200\353\371"
	.section	.sbss.st,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	st, @object
	.size	st, 4
st:
	.zero	4
	.section	.sbss.uctx,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	uctx, @object
	.size	uctx, 4
uctx:
	.zero	4
	.section	.sdata.first_trap,"aw"
	.align	2
	.set	.LANCHOR1,. + 0
	.type	first_trap, @object
	.size	first_trap, 4
first_trap:
	.word	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
