#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"video.c"
	.option nopic
	.text
	.section	.rodata.redraw.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"AM Panic: "
	.align	2
.LC1:
	.string	"Assertion `(uint32_t)block_size <= (sizeof(color_buf) / sizeof((color_buf)[0]))' failed"
	.align	2
.LC2:
	.string	" @ /home/ysyx/ysyx-workbench/am-kernels/tests/am-tests/src/tests/video.c:22  \n"
	.globl	__mulsi3
	.section	.text.redraw,"ax",@progbits
	.align	2
	.globl	redraw
	.hidden	redraw
	.type	redraw, @function
redraw:
	addi	sp,sp,-60
	addi	a1,sp,24
	li	a0,9
	sw	ra,56(sp)
	sw	s0,52(sp)
	sw	s1,48(sp)
	call	ioe_read
	lw	a5,28(sp)
	addi	a1,sp,24
	li	a0,9
	srai	s0,a5,31
	andi	s0,s0,31
	add	s0,s0,a5
	call	ioe_read
	lw	a4,32(sp)
	srai	s0,s0,5
	mv	a0,s0
	srai	a5,a4,31
	andi	a5,a5,31
	add	a5,a5,a4
	srai	a5,a5,5
	mv	a1,a5
	sw	a5,16(sp)
	call	__mulsi3
	sw	a0,20(sp)
	li	a5,1024
	bgtu	a0,a5,.L12
	lla	a5,canvas+128
	slli	a3,a0,2
	sw	a5,12(sp)
	lla	a5,color_buf
	add	s1,a5,a3
	sw	zero,8(sp)
.L3:
	lw	a5,12(sp)
	mv	t0,s0
	li	t1,0
	addi	a2,a5,-128
	mv	s0,s1
	mv	s1,a2
.L11:
	lw	a5,20(sp)
	beq	a5,zero,.L9
	lw	a4,0(s1)
	lla	a5,color_buf
.L6:
	sw	a4,0(a5)
	addi	a5,a5,4
	bne	s0,a5,.L6
.L9:
	lw	a5,8(sp)
	sw	t1,24(sp)
	addi	a1,sp,24
	sw	a5,28(sp)
	lla	a5,color_buf
	sw	a5,32(sp)
	lw	a5,16(sp)
	add	t1,t1,t0
	li	a0,11
	sw	t0,36(sp)
	sw	a5,40(sp)
	sw	t0,4(sp)
	sw	t1,0(sp)
	sb	zero,44(sp)
	call	ioe_write
	lw	a5,12(sp)
	addi	s1,s1,4
	lw	t1,0(sp)
	lw	t0,4(sp)
	bne	s1,a5,.L11
	lw	a4,8(sp)
	lw	a3,16(sp)
	mv	a2,s1
	addi	a5,a2,128
	add	a4,a4,a3
	sw	a4,8(sp)
	sw	a5,12(sp)
	lla	a4,canvas+4224
	mv	s1,s0
	mv	s0,t0
	bne	a5,a4,.L3
	addi	a1,sp,24
	li	a5,1
	li	a0,11
	sw	zero,24(sp)
	sw	zero,28(sp)
	sw	zero,32(sp)
	sw	zero,36(sp)
	sw	zero,40(sp)
	sb	a5,44(sp)
	call	ioe_write
	lw	ra,56(sp)
	lw	s0,52(sp)
	lw	s1,48(sp)
	addi	sp,sp,60
	jr	ra
.L12:
	lla	s0,.LC0
	li	a0,65
.L2:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L2
	lla	s0,.LC1
	li	a0,65
.L4:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L4
	lla	s0,.LC2
	li	a0,32
.L5:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L5
	li	a0,1
	call	halt
	.size	redraw, .-redraw
	.section	.text.update,"ax",@progbits
	.align	2
	.globl	update
	.hidden	update
	.type	update, @function
update:
	lla	a5,.LANCHOR0
	lw	a2,0(a5)
	addi	sp,sp,-24
	sw	s0,20(sp)
	addi	a2,a2,1
	sw	s1,16(sp)
	lla	a4,used+128
	lla	a3,used+4224
	sw	a2,12(sp)
	sw	a2,0(a5)
.L20:
	addi	a5,a4,-128
.L21:
	sw	zero,0(a5)
	addi	a5,a5,4
	bne	a4,a5,.L21
	addi	a4,a4,128
	bne	a4,a3,.L20
	lw	a2,12(sp)
	li	a1,0
	sw	zero,4(sp)
	andi	a3,a2,0xff
	slli	a5,a3,1
	add	a5,a3,a5
	slli	a4,a3,3
	sub	a4,a4,a3
	slli	a5,a5,1
	andi	a5,a5,0xff
	andi	a4,a4,0xff
	slli	a4,a4,8
	slli	a5,a5,16
	or	a5,a5,a4
	andi	a4,a2,255
	or	a5,a5,a4
	lla	a4,canvas
	sw	a5,0(a4)
	li	a5,1
	lla	a4,used
	sw	a5,0(a4)
	li	a3,1
	li	a4,0
	sw	a5,8(sp)
	li	s0,0
	lla	t0,.LANCHOR1
	lla	s1,.LANCHOR2
.L23:
	li	a2,4
.L28:
	lw	a5,4(sp)
	add	a4,s0,a4
	lla	a0,used
	add	a3,a5,a3
	slli	a5,a3,5
	add	a5,a5,a4
	slli	a5,a5,2
	add	a0,a0,a5
	sw	a0,0(sp)
	li	t2,31
	or	a0,a4,a3
	addi	t1,a1,1
	addi	a2,a2,-1
	bgtu	a0,t2,.L24
	lw	a0,0(sp)
	lw	a0,0(a0)
	beq	a0,zero,.L31
.L24:
	andi	a1,t1,3
	slli	a5,a1,2
	add	a4,t0,a5
	add	a5,s1,a5
	beq	a2,zero,.L25
	lw	a4,0(a4)
	lw	a3,0(a5)
	j	.L28
.L31:
	lw	a2,8(sp)
	lw	a0,12(sp)
	lw	t2,0(sp)
	srai	a2,a2,1
	add	s0,a2,a0
	andi	t1,s0,0xff
	slli	a0,t1,1
	add	a0,t1,a0
	slli	a2,t1,3
	sub	a2,a2,t1
	slli	a0,a0,1
	andi	a0,a0,0xff
	andi	a2,a2,0xff
	slli	a0,a0,16
	slli	a2,a2,8
	or	a2,a0,a2
	lla	t1,canvas
	andi	a0,s0,255
	or	a2,a2,a0
	add	a5,t1,a5
	li	a0,1
	sw	a0,0(t2)
	sw	a2,0(a5)
	sw	a3,4(sp)
	mv	s0,a4
.L25:
	lw	a5,8(sp)
	li	a4,1024
	addi	a5,a5,1
	sw	a5,8(sp)
	beq	a5,a4,.L19
	slli	a5,a1,2
	add	a4,t0,a5
	add	a5,s1,a5
	lw	a4,0(a4)
	lw	a3,0(a5)
	j	.L23
.L19:
	lw	s0,20(sp)
	lw	s1,16(sp)
	addi	sp,sp,24
	jr	ra
	.size	update, .-update
	.globl	__udivdi3
	.section	.rodata.video_test.str1.4,"aMS",@progbits,1
	.align	2
.LC3:
	.string	"%d: FPS = %d\n"
	.section	.text.video_test,"ax",@progbits
	.align	2
	.globl	video_test
	.hidden	video_test
	.type	video_test, @function
video_test:
	addi	sp,sp,-32
	sw	s0,24(sp)
	addi	s0,sp,15
	sw	s1,20(sp)
	sw	ra,28(sp)
	andi	s0,s0,-8
	li	s1,0
	sw	zero,4(sp)
	sw	zero,0(sp)
.L33:
	mv	a1,s0
	li	a0,6
	call	ioe_read
	lw	a0,0(s0)
	lw	a1,4(s0)
	li	a2,1000
	li	a3,0
	call	__udivdi3
	lw	a5,0(sp)
	li	a4,33
	mv	a1,a0
	sub	a5,a0,a5
	bgtu	a5,a4,.L37
.L34:
	lw	a5,4(sp)
	li	a4,1000
	sub	a5,a1,a5
	bleu	a5,a4,.L33
	mv	a2,s1
	lla	a0,.LC3
	sw	a1,4(sp)
	li	s1,0
	call	printf
	j	.L33
.L37:
	sw	a0,0(sp)
	call	update
	call	redraw
	lw	a1,0(sp)
	addi	s1,s1,1
	j	.L34
	.size	video_test, .-video_test
	.section	.bss.canvas,"aw",@nobits
	.align	2
	.type	canvas, @object
	.size	canvas, 4096
canvas:
	.zero	4096
	.section	.bss.color_buf,"aw",@nobits
	.align	2
	.type	color_buf, @object
	.size	color_buf, 4096
color_buf:
	.zero	4096
	.section	.bss.used,"aw",@nobits
	.align	2
	.type	used, @object
	.size	used, 4096
used:
	.zero	4096
	.section	.rodata.dx.1,"a"
	.align	2
	.set	.LANCHOR1,. + 0
	.type	dx.1, @object
	.size	dx.1, 16
dx.1:
	.word	0
	.word	1
	.word	0
	.word	-1
	.section	.rodata.dy.0,"a"
	.align	2
	.set	.LANCHOR2,. + 0
	.type	dy.0, @object
	.size	dy.0, 16
dy.0:
	.word	1
	.word	0
	.word	-1
	.word	0
	.section	.sbss.tsc.2,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	tsc.2, @object
	.size	tsc.2, 4
tsc.2:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
