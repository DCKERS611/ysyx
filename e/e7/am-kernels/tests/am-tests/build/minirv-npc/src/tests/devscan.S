#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"devscan.c"
	.option nopic
	.text
	.section	.rodata.devscan.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"heap = [%08x, %08x)\n"
	.align	2
.LC1:
	.string	"Input device test skipped.\n"
	.globl	__udivdi3
	.align	2
.LC2:
	.string	"Loop 10^7 time elapse: %d ms\n"
	.align	2
.LC3:
	.string	"Screen size: %d x %d\n"
	.align	2
.LC4:
	.string	"Storage: %d blocks of %d size. Show first 512 bytes\n"
	.globl	__divsi3
	.align	2
.LC5:
	.string	"%02x%02x "
	.align	2
.LC6:
	.string	"\n"
	.align	2
.LC7:
	.string	"Test End!\n"
	.section	.text.devscan,"ax",@progbits
	.align	2
	.globl	devscan
	.hidden	devscan
	.type	devscan, @function
devscan:
	lla	a5,heap
	lw	a2,4(a5)
	lw	a1,0(a5)
	addi	sp,sp,-52
	lla	a0,.LC0
	sw	ra,48(sp)
	sw	s0,44(sp)
	sw	s1,40(sp)
	call	printf
	addi	s0,sp,35
	lla	a0,.LC1
	call	printf
	andi	s0,s0,-8
	mv	a1,s0
	li	a0,6
	call	ioe_read
	lw	a0,0(s0)
	lw	a1,4(s0)
	li	a2,1000
	li	a3,0
	call	__udivdi3
	sw	zero,8(sp)
	lw	a5,8(sp)
	li	a4,9998336
	addi	a4,a4,1663
	mv	s1,a0
	bgt	a5,a4,.L2
.L3:
	lw	a5,8(sp)
	addi	a5,a5,1
	sw	a5,8(sp)
	lw	a5,8(sp)
	ble	a5,a4,.L3
.L2:
	mv	a1,s0
	li	a0,6
	call	ioe_read
	lw	a0,0(s0)
	lw	a1,4(s0)
	li	a2,1000
	li	a3,0
	call	__udivdi3
	sub	a1,a0,s1
	lla	a0,.LC2
	call	printf
	addi	a1,sp,12
	li	a0,9
	call	ioe_read
	lw	a5,20(sp)
	lw	a1,16(sp)
	lla	a0,.LC3
	mv	a2,a5
	sw	a1,0(sp)
	sw	a5,4(sp)
	lla	s1,vmem+208
	call	printf
	lla	s0,vmem+524288
.L4:
	call	rand
	sb	a0,0(s1)
	addi	s1,s1,1
	bne	s1,s0,.L4
	lw	a5,0(sp)
	lw	a2,4(sp)
	li	t0,-65536
	srai	a4,a5,31
	andi	a4,a4,3
	srli	a3,a5,31
	add	a4,a4,a5
	srai	a4,a4,2
	add	a3,a3,a5
	lla	a5,vmem
	sh	a4,6(a5)
	la a4, vmem+8; sh zero, 0(a4);
	li	a4,37
	sh	a4,18(a5)
	li	a4,10
	li	t1,-1
	srai	a3,a3,1
	addi	t0,t0,1
	addi	a2,a2,-100
	sh	a4,20(a5)
	li	a4,208
	sh	a4,22(a5)
	sw	t0,0(a5)
	sh	t1,4(a5)
	sh	a3,10(a5)
	sh	t1,14(a5)
	sh	t1,16(a5)
	sh	a2,12(a5)
	addi	a1,sp,12
	li	a0,12
	sw	a5,16(sp)
	li	a5,524288
	sw	a5,20(sp)
	la a4, vmem+24; sh zero, 0(a4);
	sw	zero,12(sp)
	call	ioe_write
	li	a0,13
	addi	a1,sp,12
	sw	zero,12(sp)
	call	ioe_write
	addi	a1,sp,12
	li	a0,18
	call	ioe_read
	lw	s1,16(sp)
	lw	a1,20(sp)
	lla	a0,.LC4
	mv	a2,s1
	call	printf
	lla	s0,.LANCHOR0
	mv	a1,s1
	li	a0,512
	sw	s0,16(sp)
	sb	zero,12(sp)
	sw	zero,20(sp)
	call	__divsi3
	mv	a5,a0
	addi	a1,sp,12
	li	a0,20
	sw	a5,24(sp)
	call	ioe_write
	lbu	a2,1(s0)
	lbu	a1,0(s0)
	lla	a0,.LC5
	lla	s1,.LC5
	call	printf
	lla	s0,.LANCHOR0+2
	lla	a5,.LANCHOR0+512
	mv	a0,s1
	beq	s0,a5,.L13
.L7:
	lbu	a2,1(s0)
	lbu	a1,0(s0)
	call	printf
	lla	a5,.LANCHOR0
	sub	a4,s0,a5
	addi	a4,a4,2
	andi	a4,a4,31
	beq	a4,zero,.L14
	addi	s0,s0,2
.L15:
	lla	a5,.LANCHOR0+512
	mv	a0,s1
	bne	s0,a5,.L7
.L13:
	lla	a0,.LC7
	call	printf
.L8:
	j	.L8
.L14:
	lla	a0,.LC6
	call	printf
	addi	s0,s0,2
	j	.L15
	.size	devscan, .-devscan
	.section	.bss.buf.0,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	buf.0, @object
	.size	buf.0, 512
buf.0:
	.zero	512
	.section	.bss.vmem,"aw",@nobits
	.align	2
	.type	vmem, @object
	.size	vmem, 524288
vmem:
	.zero	524288
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
