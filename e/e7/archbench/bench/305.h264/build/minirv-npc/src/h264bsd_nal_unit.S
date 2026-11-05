#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"h264bsd_nal_unit.c"
	.option nopic
	.text
	.section	.text.h264bsdDecodeNalUnit,"ax",@progbits
	.align	2
	.globl	h264bsdDecodeNalUnit
	.hidden	h264bsdDecodeNalUnit
	.type	h264bsdDecodeNalUnit, @function
h264bsdDecodeNalUnit:
	addi	sp,sp,-12
	sw	s0,4(sp)
	mv	s0,a1
	li	a1,1
	sw	s1,0(sp)
	sw	ra,8(sp)
	mv	s1,a0
	call	h264bsdGetBits
	li	a5,-1
	beq	a0,a5,.L4
	li	a1,2
	mv	a0,s1
	call	h264bsdGetBits
	sw	a0,4(s0)
	li	a1,5
	mv	a0,s1
	call	h264bsdGetBits
	sw	a0,0(s0)
	addi	a4,a0,-2
	li	a5,2
	bleu	a4,a5,.L4
	addi	a5,a0,-7
	li	a4,1
	bleu	a5,a4,.L5
	li	a5,5
	beq	a0,a5,.L19
.L7:
	li	a5,6
	beq	a0,a5,.L8
.L9:
	addi	a5,a0,-9
	li	a4,3
	li	a0,0
	bgtu	a5,a4,.L1
.L8:
	lw	a0,4(s0)
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	snez	a0,a0
	addi	sp,sp,12
	jr	ra
.L5:
	lw	a5,4(s0)
	bne	a5,zero,.L7
.L4:
	li	a0,1
.L1:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L19:
	lw	a5,4(s0)
	bne	a5,zero,.L9
	j	.L4
	.size	h264bsdDecodeNalUnit, .-h264bsdDecodeNalUnit
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
