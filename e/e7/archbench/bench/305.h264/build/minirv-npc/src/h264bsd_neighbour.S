#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"h264bsd_neighbour.c"
	.option nopic
	.text
	.section	.text.h264bsdInitMbNeighbours,"ax",@progbits
	.align	2
	.globl	h264bsdInitMbNeighbours
	.hidden	h264bsdInitMbNeighbours
	.type	h264bsdInitMbNeighbours, @function
h264bsdInitMbNeighbours:
	addi	sp,sp,-12
	addi	a5,a1,-1
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	a5,0(sp)
	beq	a2,zero,.L1
	li	t1,0
	li	t2,0
	li	a3,0
.L2:
	beq	t1,zero,.L3
	slli	a5,a3,3
	sub	a5,a5,a3
	slli	a5,a5,2
	sub	a5,a5,a3
	slli	a5,a5,3
	addi	a4,a5,-216
	add	a4,a0,a4
	add	a5,a0,a5
	mv	t0,t1
	sw	a4,200(a5)
	addi	t1,t1,1
.L4:
	beq	t2,zero,.L5
	sub	s0,a3,a1
	slli	a4,s0,3
	sub	a4,a4,s0
	slli	a4,a4,2
	sub	a4,a4,s0
	lw	s0,0(sp)
	slli	a4,a4,3
	add	s1,a0,a4
	bgtu	s0,t0,.L6
	li	s0,0
.L7:
	sw	s1,204(a5)
	sw	s0,208(a5)
	beq	t0,zero,.L8
	addi	a4,a4,-216
	add	a4,a0,a4
	sw	a4,212(a5)
	addi	a3,a3,1
	beq	a1,t1,.L23
.L10:
	bgtu	a2,a3,.L2
.L1:
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,12
	jr	ra
.L5:
	sw	zero,204(a5)
	sw	zero,208(a5)
.L8:
	li	a4,0
	sw	a4,212(a5)
	addi	a3,a3,1
	bne	a1,t1,.L10
.L23:
	addi	t2,t2,1
	bleu	a2,a3,.L1
.L3:
	slli	a5,a3,3
	sub	a5,a5,a3
	slli	a5,a5,2
	sub	a5,a5,a3
	slli	a5,a5,3
	add	a5,a0,a5
	sw	zero,200(a5)
	li	t1,1
	li	t0,0
	j	.L4
.L6:
	addi	s0,a4,216
	add	s0,a0,s0
	j	.L7
	.size	h264bsdInitMbNeighbours, .-h264bsdInitMbNeighbours
	.section	.text.h264bsdGetNeighbourMb,"ax",@progbits
	.align	2
	.globl	h264bsdGetNeighbourMb
	.hidden	h264bsdGetNeighbourMb
	.type	h264bsdGetNeighbourMb, @function
h264bsdGetNeighbourMb:
	li	a5,4
	bgtu	a1,a5,.L25
	lla	a4,.L27
	slli	a1,a1,2
	add	a1,a1,a4
	lw	a5,0(a1)
	add	a5,a5,a4
	jr	a5
	.section	.rodata.h264bsdGetNeighbourMb,"a",@progbits
	.align	2
	.align	2
.L27:
	.word	.L31-.L27
	.word	.L30-.L27
	.word	.L29-.L27
	.word	.L28-.L27
	.word	.L24-.L27
	.section	.text.h264bsdGetNeighbourMb
.L28:
	lw	a0,212(a0)
.L24:
	ret
.L31:
	lw	a0,200(a0)
	ret
.L30:
	lw	a0,204(a0)
	ret
.L29:
	lw	a0,208(a0)
	ret
.L25:
	li	a0,0
	ret
	.size	h264bsdGetNeighbourMb, .-h264bsdGetNeighbourMb
	.section	.text.h264bsdNeighbour4x4BlockA,"ax",@progbits
	.align	2
	.globl	h264bsdNeighbour4x4BlockA
	.hidden	h264bsdNeighbour4x4BlockA
	.type	h264bsdNeighbour4x4BlockA, @function
h264bsdNeighbour4x4BlockA:
	lla	a5,.LANCHOR0
	slli	a0,a0,3
	add	a0,a5,a0
	ret
	.size	h264bsdNeighbour4x4BlockA, .-h264bsdNeighbour4x4BlockA
	.section	.text.h264bsdNeighbour4x4BlockB,"ax",@progbits
	.align	2
	.globl	h264bsdNeighbour4x4BlockB
	.hidden	h264bsdNeighbour4x4BlockB
	.type	h264bsdNeighbour4x4BlockB, @function
h264bsdNeighbour4x4BlockB:
	lla	a5,.LANCHOR1
	slli	a0,a0,3
	add	a0,a5,a0
	ret
	.size	h264bsdNeighbour4x4BlockB, .-h264bsdNeighbour4x4BlockB
	.section	.text.h264bsdNeighbour4x4BlockC,"ax",@progbits
	.align	2
	.globl	h264bsdNeighbour4x4BlockC
	.hidden	h264bsdNeighbour4x4BlockC
	.type	h264bsdNeighbour4x4BlockC, @function
h264bsdNeighbour4x4BlockC:
	lla	a5,.LANCHOR2
	slli	a0,a0,3
	add	a0,a5,a0
	ret
	.size	h264bsdNeighbour4x4BlockC, .-h264bsdNeighbour4x4BlockC
	.section	.text.h264bsdNeighbour4x4BlockD,"ax",@progbits
	.align	2
	.globl	h264bsdNeighbour4x4BlockD
	.hidden	h264bsdNeighbour4x4BlockD
	.type	h264bsdNeighbour4x4BlockD, @function
h264bsdNeighbour4x4BlockD:
	lla	a5,.LANCHOR3
	slli	a0,a0,3
	add	a0,a5,a0
	ret
	.size	h264bsdNeighbour4x4BlockD, .-h264bsdNeighbour4x4BlockD
	.section	.text.h264bsdIsNeighbourAvailable,"ax",@progbits
	.align	2
	.globl	h264bsdIsNeighbourAvailable
	.hidden	h264bsdIsNeighbourAvailable
	.type	h264bsdIsNeighbourAvailable, @function
h264bsdIsNeighbourAvailable:
	beq	a1,zero,.L39
	lw	a0,4(a0)
	lw	a5,4(a1)
	sub	a0,a0,a5
	seqz	a0,a0
	ret
.L39:
	li	a0,0
	ret
	.size	h264bsdIsNeighbourAvailable, .-h264bsdIsNeighbourAvailable
	.section	.rodata.N_A_4x4B,"a"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	N_A_4x4B, @object
	.size	N_A_4x4B, 192
N_A_4x4B:
	.word	0
	.byte	5
	.zero	3
	.word	4
	.byte	0
	.zero	3
	.word	0
	.byte	7
	.zero	3
	.word	4
	.byte	2
	.zero	3
	.word	4
	.byte	1
	.zero	3
	.word	4
	.byte	4
	.zero	3
	.word	4
	.byte	3
	.zero	3
	.word	4
	.byte	6
	.zero	3
	.word	0
	.byte	13
	.zero	3
	.word	4
	.byte	8
	.zero	3
	.word	0
	.byte	15
	.zero	3
	.word	4
	.byte	10
	.zero	3
	.word	4
	.byte	9
	.zero	3
	.word	4
	.byte	12
	.zero	3
	.word	4
	.byte	11
	.zero	3
	.word	4
	.byte	14
	.zero	3
	.word	0
	.byte	17
	.zero	3
	.word	4
	.byte	16
	.zero	3
	.word	0
	.byte	19
	.zero	3
	.word	4
	.byte	18
	.zero	3
	.word	0
	.byte	21
	.zero	3
	.word	4
	.byte	20
	.zero	3
	.word	0
	.byte	23
	.zero	3
	.word	4
	.byte	22
	.zero	3
	.section	.rodata.N_B_4x4B,"a"
	.align	2
	.set	.LANCHOR1,. + 0
	.type	N_B_4x4B, @object
	.size	N_B_4x4B, 192
N_B_4x4B:
	.word	1
	.byte	10
	.zero	3
	.word	1
	.byte	11
	.zero	3
	.word	4
	.byte	0
	.zero	3
	.word	4
	.byte	1
	.zero	3
	.word	1
	.byte	14
	.zero	3
	.word	1
	.byte	15
	.zero	3
	.word	4
	.byte	4
	.zero	3
	.word	4
	.byte	5
	.zero	3
	.word	4
	.byte	2
	.zero	3
	.word	4
	.byte	3
	.zero	3
	.word	4
	.byte	8
	.zero	3
	.word	4
	.byte	9
	.zero	3
	.word	4
	.byte	6
	.zero	3
	.word	4
	.byte	7
	.zero	3
	.word	4
	.byte	12
	.zero	3
	.word	4
	.byte	13
	.zero	3
	.word	1
	.byte	18
	.zero	3
	.word	1
	.byte	19
	.zero	3
	.word	4
	.byte	16
	.zero	3
	.word	4
	.byte	17
	.zero	3
	.word	1
	.byte	22
	.zero	3
	.word	1
	.byte	23
	.zero	3
	.word	4
	.byte	20
	.zero	3
	.word	4
	.byte	21
	.zero	3
	.section	.rodata.N_C_4x4B,"a"
	.align	2
	.set	.LANCHOR2,. + 0
	.type	N_C_4x4B, @object
	.size	N_C_4x4B, 192
N_C_4x4B:
	.word	1
	.byte	11
	.zero	3
	.word	1
	.byte	14
	.zero	3
	.word	4
	.byte	1
	.zero	3
	.word	255
	.byte	4
	.zero	3
	.word	1
	.byte	15
	.zero	3
	.word	2
	.byte	10
	.zero	3
	.word	4
	.byte	5
	.zero	3
	.word	255
	.byte	0
	.zero	3
	.word	4
	.byte	3
	.zero	3
	.word	4
	.byte	6
	.zero	3
	.word	4
	.byte	9
	.zero	3
	.word	255
	.byte	12
	.zero	3
	.word	4
	.byte	7
	.zero	3
	.word	255
	.byte	2
	.zero	3
	.word	4
	.byte	13
	.zero	3
	.word	255
	.byte	8
	.zero	3
	.word	1
	.byte	19
	.zero	3
	.word	2
	.byte	18
	.zero	3
	.word	4
	.byte	17
	.zero	3
	.word	255
	.byte	16
	.zero	3
	.word	1
	.byte	23
	.zero	3
	.word	2
	.byte	22
	.zero	3
	.word	4
	.byte	21
	.zero	3
	.word	255
	.byte	20
	.zero	3
	.section	.rodata.N_D_4x4B,"a"
	.align	2
	.set	.LANCHOR3,. + 0
	.type	N_D_4x4B, @object
	.size	N_D_4x4B, 192
N_D_4x4B:
	.word	3
	.byte	15
	.zero	3
	.word	1
	.byte	10
	.zero	3
	.word	0
	.byte	5
	.zero	3
	.word	4
	.byte	0
	.zero	3
	.word	1
	.byte	11
	.zero	3
	.word	1
	.byte	14
	.zero	3
	.word	4
	.byte	1
	.zero	3
	.word	4
	.byte	4
	.zero	3
	.word	0
	.byte	7
	.zero	3
	.word	4
	.byte	2
	.zero	3
	.word	0
	.byte	13
	.zero	3
	.word	4
	.byte	8
	.zero	3
	.word	4
	.byte	3
	.zero	3
	.word	4
	.byte	6
	.zero	3
	.word	4
	.byte	9
	.zero	3
	.word	4
	.byte	12
	.zero	3
	.word	3
	.byte	19
	.zero	3
	.word	1
	.byte	18
	.zero	3
	.word	0
	.byte	17
	.zero	3
	.word	4
	.byte	16
	.zero	3
	.word	3
	.byte	23
	.zero	3
	.word	1
	.byte	22
	.zero	3
	.word	0
	.byte	21
	.zero	3
	.word	4
	.byte	20
	.zero	3
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
