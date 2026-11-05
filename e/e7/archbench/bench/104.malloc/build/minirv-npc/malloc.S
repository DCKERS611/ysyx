#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"malloc.c"
	.option nopic
	.text
	.section	.text.my_free,"ax",@progbits
	.align	2
	.globl	my_free
	.hidden	my_free
	.type	my_free, @function
my_free:
	beq	a0,zero,.L1
	lla	a1,.LANCHOR0
	lw	a5,0(a1)
	addi	a3,a0,-8
.L13:
	mv	a4,a5
	lw	a5,0(a5)
	bgeu	a4,a3,.L5
	bltu	a3,a5,.L4
	bltu	a4,a5,.L13
.L4:
	lw	t1,-4(a0)
	slli	a2,t1,3
	add	a2,a3,a2
	beq	a5,a2,.L16
.L7:
	lw	t1,4(a4)
	sw	a5,-8(a0)
	slli	a2,t1,3
	add	a2,a4,a2
	beq	a3,a2,.L17
.L8:
	sw	a3,0(a4)
	sw	a4,0(a1)
	ret
.L5:
	bltu	a4,a5,.L13
	bgeu	a3,a5,.L13
	lw	t1,-4(a0)
	slli	a2,t1,3
	add	a2,a3,a2
	bne	a5,a2,.L7
.L16:
	lw	a2,4(a5)
	lw	a5,0(a5)
	add	a2,a2,t1
	sw	a2,-4(a0)
	lw	t1,4(a4)
	sw	a5,-8(a0)
	slli	a2,t1,3
	add	a2,a4,a2
	bne	a3,a2,.L8
.L17:
	lw	a2,-4(a0)
	mv	a3,a5
	sw	a3,0(a4)
	add	a5,a2,t1
	sw	a5,4(a4)
	sw	a4,0(a1)
	ret
.L1:
	ret
	.size	my_free, .-my_free
	.section	.text.my_malloc,"ax",@progbits
	.align	2
	.globl	my_malloc
	.hidden	my_malloc
	.type	my_malloc, @function
my_malloc:
	addi	sp,sp,-24
	sw	s1,12(sp)
	lla	s1,.LANCHOR0
	lw	a2,0(s1)
	sw	s0,16(sp)
	addi	s0,a0,7
	srli	s0,s0,3
	sw	ra,20(sp)
	addi	s0,s0,1
	beq	a2,zero,.L36
	lw	a5,0(a2)
	lw	a4,4(a5)
	bleu	s0,a4,.L37
.L20:
	li	a4,4096
	sw	s0,8(sp)
	bltu	s0,a4,.L38
	lw	a4,8(sp)
	lla	a3,.LANCHOR2
	mv	t0,s0
	slli	t1,a4,3
.L29:
	beq	a2,a5,.L39
.L25:
	lw	a0,0(a5)
	lw	a4,4(a0)
	bgeu	a4,t0,.L34
	lw	a2,0(s1)
	mv	a5,a0
	bne	a2,a5,.L25
.L39:
	lw	s0,0(a3)
	mv	a2,t1
	li	a1,204
	li	t2,-1
	lla	a5,heap
	beq	s0,zero,.L40
.L26:
	lw	a4,4(a5)
	sw	t0,4(sp)
	add	a5,s0,t1
	sw	t1,0(sp)
	mv	a0,s0
	bgeu	a5,a4,.L27
	sw	a5,0(a3)
	beq	s0,t2,.L27
	call	memset
	lw	a5,8(sp)
	addi	a0,s0,8
	sw	a5,4(s0)
	call	my_free
	lw	a5,0(s1)
	lw	t1,0(sp)
	lw	t0,4(sp)
	lla	a3,.LANCHOR2
	bne	a5,zero,.L25
.L27:
	lw	ra,20(sp)
	lw	s0,16(sp)
	lw	s1,12(sp)
	li	a0,0
	addi	sp,sp,24
	jr	ra
.L34:
	mv	s0,t0
.L28:
	beq	a4,s0,.L41
	sub	a4,a4,s0
	slli	a3,a4,3
	sw	a4,4(a0)
	add	a0,a0,a3
	sw	s0,4(a0)
.L22:
	lw	ra,20(sp)
	lw	s0,16(sp)
	sw	a5,0(s1)
	addi	a0,a0,8
	lw	s1,12(sp)
	addi	sp,sp,24
	jr	ra
.L40:
	lw	s0,0(a5)
	sw	s0,0(a3)
	j	.L26
.L38:
	sw	a4,8(sp)
	lw	a4,8(sp)
	lla	a3,.LANCHOR2
	mv	t0,s0
	slli	t1,a4,3
	j	.L29
.L36:
	lla	a5,.LANCHOR1
	mv	a2,a5
	sw	a5,0(s1)
	sw	a5,0(a5)
	la a5, .LANCHOR1+4; sw zero, 0(a5);
	mv	a5,a2
	j	.L20
.L41:
	lw	a4,0(a0)
	sw	a4,0(a5)
	j	.L22
.L37:
	mv	a0,a5
	mv	a5,a2
	j	.L28
	.size	my_malloc, .-my_malloc
	.globl	__mulsi3
	.section	.text.my_calloc,"ax",@progbits
	.align	2
	.globl	my_calloc
	.hidden	my_calloc
	.type	my_calloc, @function
my_calloc:
	mv	a5,a0
	addi	sp,sp,-12
	mv	a0,a1
	mv	a1,a5
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	call	__mulsi3
	mv	s1,a0
	call	my_malloc
	mv	a2,s1
	li	a1,0
	mv	s0,a0
	call	memset
	lw	ra,8(sp)
	mv	a0,s0
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
	.size	my_calloc, .-my_calloc
	.section	.text.my_realloc,"ax",@progbits
	.align	2
	.globl	my_realloc
	.hidden	my_realloc
	.type	my_realloc, @function
my_realloc:
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	ra,12(sp)
	sw	s1,4(sp)
	mv	s0,a1
	beq	a0,zero,.L53
	beq	a1,zero,.L54
	mv	s1,a0
	mv	a0,a1
	call	my_malloc
	mv	a5,a0
	beq	a0,zero,.L44
	lw	a2,-4(s1)
	addi	a2,a2,-1
	slli	a2,a2,3
	bgtu	a2,s0,.L55
.L48:
	mv	a0,a5
	mv	a1,s1
	sw	a5,0(sp)
	call	memcpy
	mv	a0,s1
	call	my_free
	lw	a5,0(sp)
.L44:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	mv	a0,a5
	addi	sp,sp,16
	jr	ra
.L55:
	mv	a2,s0
	j	.L48
.L54:
	call	my_free
	lw	ra,12(sp)
	lw	s0,8(sp)
	li	a5,0
	lw	s1,4(sp)
	mv	a0,a5
	addi	sp,sp,16
	jr	ra
.L53:
	lw	s0,8(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	mv	a0,a1
	addi	sp,sp,16
	tail	my_malloc
	.size	my_realloc, .-my_realloc
	.section	.sbss.base,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	base, @object
	.size	base, 8
base:
	.zero	8
	.section	.sbss.brk.0,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	brk.0, @object
	.size	brk.0, 4
brk.0:
	.zero	4
	.section	.sbss.freep,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	freep, @object
	.size	freep, 4
freep:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
