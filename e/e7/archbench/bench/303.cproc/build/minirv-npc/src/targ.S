#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"targ.c"
	.option nopic
	.text
	.section	.rodata.targinit.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"riscv32"
	.align	2
.LC1:
	.string	"unknown target '%s'"
	.section	.text.targinit,"ax",@progbits
	.align	2
	.globl	targinit
	.hidden	targinit
	.type	targinit, @function
targinit:
	addi	sp,sp,-20
	sw	s0,12(sp)
	sw	ra,16(sp)
	sw	s1,8(sp)
	mv	s0,a0
	beq	a0,zero,.L2
	la a5, .LANCHOR1; sw zero, 0(a5);
	li	s1,0
	lla	a5,.LANCHOR0
.L4:
	bne	s1,zero,.L8
.L6:
	lw	a0,0(a5)
	mv	a1,s0
	mv	s1,a5
	sw	a5,0(sp)
	call	strcmp
	beq	a0,zero,.L5
	addi	a5,s1,16
	lla	a4,.LANCHOR0+64
	bne	a5,a4,.L6
	mv	a1,s0
	lla	a0,.LC1
	call	fatal
	la s1, .LANCHOR1; lw s1, 0(s1);
.L8:
	lw	a0,0(s1)
	lla	a1,.LC0
	call	strcmp
	bne	a0,zero,.L10
.L19:
	li	a2,4
	li	a3,0
	li	t1,4
.L9:
	lw	a5,12(s1)
	lw	a0,4(s1)
	lla	a4,typenullptr
	lla	t2,typelong
	lla	t0,typeulong
	snez	a5,a5
	addi	a1,sp,4
	sw	a2,16(a4)
	sw	a3,20(a4)
	sw	t1,8(a4)
	sw	zero,4(sp)
	la a4, typechar+48; sb a5, 0(a4);
	sw	a2,16(t2)
	sw	a3,20(t2)
	sw	t1,8(t2)
	sw	a2,16(t0)
	sw	a3,20(t0)
	sw	t1,8(t0)
	call	typeadjust
	lw	ra,16(sp)
	lw	s0,12(sp)
	la a5, typeadjvalist; sw a0, 0(a5);
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L5:
	lla	a4,.LANCHOR1
	sw	s1,0(a4)
	addi	a5,s1,16
	lla	a4,.LANCHOR0+64
	bne	a4,a5,.L4
	lw	a0,0(s1)
	lla	a1,.LC0
	call	strcmp
	beq	a0,zero,.L19
.L10:
	li	a2,8
	li	a3,0
	li	t1,8
	j	.L9
.L2:
	lla	a4,.LANCHOR0
	la a5, .LANCHOR1; sw a4, 0(a5);
	mv	s1,a4
	lla	a5,.LANCHOR0
	j	.L4
	.size	targinit, .-targinit
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC2:
	.string	"x86_64-sysv"
	.align	2
.LC3:
	.string	"aarch64"
	.align	2
.LC4:
	.string	"riscv64"
	.align	2
.LC5:
	.string	"va_list"
	.hidden	targ
	.globl	targ
	.section	.data.__compound_literal.0,"aw"
	.align	3
	.type	__compound_literal.0, @object
	.size	__compound_literal.0, 64
__compound_literal.0:
	.word	12
	.zero	4
	.word	8
	.zero	4
	.word	24
	.word	0
	.zero	40
	.section	.data.__compound_literal.1,"aw"
	.align	3
	.type	__compound_literal.1, @object
	.size	__compound_literal.1, 64
__compound_literal.1:
	.word	10
	.zero	4
	.word	8
	.zero	4
	.word	24
	.word	0
	.zero	4
	.word	__compound_literal.0
	.zero	32
	.section	.data.__compound_literal.2,"aw"
	.align	3
	.type	__compound_literal.2, @object
	.size	__compound_literal.2, 64
__compound_literal.2:
	.word	12
	.zero	4
	.word	8
	.zero	4
	.word	32
	.word	0
	.zero	24
	.word	.LC5
	.zero	4
	.zero	4
	.zero	4
	.section	.data.__compound_literal.3,"aw"
	.align	3
	.type	__compound_literal.3, @object
	.size	__compound_literal.3, 64
__compound_literal.3:
	.word	9
	.word	16
	.word	8
	.zero	4
	.word	8
	.word	0
	.zero	4
	.word	typevoid
	.zero	32
	.section	.data.__compound_literal.4,"aw"
	.align	3
	.type	__compound_literal.4, @object
	.size	__compound_literal.4, 64
__compound_literal.4:
	.word	9
	.word	16
	.word	4
	.zero	4
	.word	4
	.word	0
	.zero	4
	.word	typevoid
	.zero	32
	.section	.rodata.alltargs,"a"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	alltargs, @object
	.size	alltargs, 64
alltargs:
	.word	.LC2
	.word	__compound_literal.1
	.word	typeint
	.word	1
	.word	.LC3
	.word	__compound_literal.2
	.word	typeuint
	.zero	4
	.word	.LC4
	.word	__compound_literal.3
	.word	typeint
	.zero	4
	.word	.LC0
	.word	__compound_literal.4
	.word	typeint
	.zero	4
	.section	.sbss.targ,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	targ, @object
	.size	targ, 4
targ:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
