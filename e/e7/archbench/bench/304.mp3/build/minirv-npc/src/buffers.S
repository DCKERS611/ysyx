#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"buffers.c"
	.option nopic
	.text
	.section	.text.FreeBuffers,"ax",@progbits
	.align	2
	.globl	FreeBuffers
	.hidden	FreeBuffers
	.type	FreeBuffers, @function
FreeBuffers:
	beq	a0,zero,.L1
	addi	sp,sp,-12
	sw	s0,4(sp)
	mv	s0,a0
	lw	a0,0(a0)
	sw	ra,8(sp)
	beq	a0,zero,.L3
	call	free
.L3:
	lw	a0,4(s0)
	sw	zero,0(s0)
	beq	a0,zero,.L4
	call	free
.L4:
	lw	a0,8(s0)
	sw	zero,4(s0)
	beq	a0,zero,.L5
	call	free
.L5:
	lw	a0,12(s0)
	sw	zero,8(s0)
	beq	a0,zero,.L6
	call	free
.L6:
	lw	a0,16(s0)
	sw	zero,12(s0)
	beq	a0,zero,.L7
	call	free
.L7:
	lw	a0,20(s0)
	sw	zero,16(s0)
	beq	a0,zero,.L8
	call	free
.L8:
	lw	a0,24(s0)
	sw	zero,20(s0)
	beq	a0,zero,.L9
	call	free
.L9:
	sw	zero,24(s0)
	mv	a0,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	free
.L1:
	ret
	.size	FreeBuffers, .-FreeBuffers
	.section	.text.AllocateBuffers,"ax",@progbits
	.align	2
	.globl	AllocateBuffers
	.hidden	AllocateBuffers
	.type	AllocateBuffers, @function
AllocateBuffers:
	addi	sp,sp,-32
	li	a0,2032
	sw	ra,28(sp)
	sw	s0,24(sp)
	sw	s1,20(sp)
	call	malloc
	mv	a1,a0
	beq	a0,zero,.L35
	mv	a5,a0
	addi	a4,a0,2032
.L37:
	sb	zero,0(a5)
	addi	a5,a5,1
	bne	a5,a4,.L37
	li	a0,56
	sw	a1,16(sp)
	call	malloc
	mv	a4,a0
	li	a0,328
	sw	a4,12(sp)
	call	malloc
	mv	s0,a0
	li	a0,284
	call	malloc
	mv	t0,a0
	li	a0,4096
	addi	a0,a0,528
	sw	t0,8(sp)
	call	malloc
	mv	t1,a0
	li	a0,840
	sw	t1,4(sp)
	li	s1,8192
	call	malloc
	mv	a2,a0
	addi	a0,s1,-1248
	sw	a2,0(sp)
	call	malloc
	mv	a5,a0
	addi	a0,s1,516
	mv	s1,a5
	call	malloc
	lw	a1,16(sp)
	lw	a4,12(sp)
	lw	t0,8(sp)
	lw	t1,4(sp)
	lw	a2,0(sp)
	sw	a4,0(a1)
	sw	s0,4(a1)
	sw	t0,8(a1)
	sw	t1,12(a1)
	sw	a2,16(a1)
	sw	s1,20(a1)
	sw	a0,24(a1)
	mv	a3,a0
	beq	a4,zero,.L38
	beq	s0,zero,.L38
	beq	t0,zero,.L38
	beq	t1,zero,.L38
	beq	a2,zero,.L38
	beq	s1,zero,.L38
	mv	a5,a4
	addi	a4,a4,56
	beq	a0,zero,.L38
.L40:
	sb	zero,0(a5)
	addi	a5,a5,1
	bne	a5,a4,.L40
	mv	a5,s0
	addi	a4,s0,328
.L41:
	sb	zero,0(a5)
	addi	a5,a5,1
	bne	a5,a4,.L41
	addi	a5,t0,284
.L42:
	sb	zero,0(t0)
	addi	t0,t0,1
	bne	a5,t0,.L42
	li	a5,4096
	addi	a5,a5,528
	add	a5,t1,a5
.L43:
	sb	zero,0(t1)
	addi	t1,t1,1
	bne	a5,t1,.L43
	addi	a5,a2,840
.L44:
	sb	zero,0(a2)
	addi	a2,a2,1
	bne	a2,a5,.L44
	li	a4,8192
	addi	a4,a4,-1248
	mv	a5,s1
	add	a4,s1,a4
.L45:
	sb	zero,0(a5)
	addi	a5,a5,1
	bne	a4,a5,.L45
	li	a4,8192
	addi	a4,a4,516
	mv	a5,a3
	add	a4,a3,a4
.L46:
	sb	zero,0(a5)
	addi	a5,a5,1
	bne	a5,a4,.L46
.L35:
	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	s1,20(sp)
	mv	a0,a1
	addi	sp,sp,32
	jr	ra
.L38:
	mv	a0,a1
	call	FreeBuffers
	li	a1,0
	j	.L35
	.size	AllocateBuffers, .-AllocateBuffers
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
