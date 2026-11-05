#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"h264bsd_util.c"
	.option nopic
	.text
	.section	.text.h264bsdCountLeadingZeros,"ax",@progbits
	.align	2
	.globl	h264bsdCountLeadingZeros
	.hidden	h264bsdCountLeadingZeros
	.type	h264bsdCountLeadingZeros, @function
h264bsdCountLeadingZeros:
	addi	a1,a1,-1
	li	a5,1
	sll	a5,a5,a1
	mv	a3,a0
	beq	a5,zero,.L5
	and	a0,a5,a0
	beq	a0,zero,.L3
	j	.L5
.L13:
	bne	a4,zero,.L12
.L3:
	srli	a5,a5,1
	and	a4,a3,a5
	addi	a0,a0,1
	bne	a5,zero,.L13
	ret
.L12:
	ret
.L5:
	li	a0,0
	ret
	.size	h264bsdCountLeadingZeros, .-h264bsdCountLeadingZeros
	.section	.text.h264bsdRbspTrailingBits,"ax",@progbits
	.align	2
	.globl	h264bsdRbspTrailingBits
	.hidden	h264bsdRbspTrailingBits
	.type	h264bsdRbspTrailingBits, @function
h264bsdRbspTrailingBits:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lw	s0,8(a0)
	li	a1,8
	sw	ra,8(sp)
	sub	a1,a1,s0
	call	h264bsdGetBits
	li	a5,-1
	beq	a0,a5,.L16
	li	a5,7
	sub	a5,a5,s0
	slli	a5,a5,2
	lla	a4,.LANCHOR0
	add	a5,a4,a5
	lw	a5,0(a5)
	lw	ra,8(sp)
	lw	s0,4(sp)
	sub	a0,a5,a0
	snez	a0,a0
	addi	sp,sp,12
	jr	ra
.L16:
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
	.size	h264bsdRbspTrailingBits, .-h264bsdRbspTrailingBits
	.section	.text.h264bsdMoreRbspData,"ax",@progbits
	.align	2
	.globl	h264bsdMoreRbspData
	.hidden	h264bsdMoreRbspData
	.type	h264bsdMoreRbspData, @function
h264bsdMoreRbspData:
	addi	sp,sp,-16
	sw	s0,8(sp)
	lw	s0,12(a0)
	sw	s1,4(sp)
	lw	s1,16(a0)
	slli	s0,s0,3
	sw	ra,12(sp)
	sub	a5,s0,s1
	beq	s0,s1,.L18
	li	a4,8
	sw	a5,0(sp)
	bleu	a5,a4,.L25
	li	a5,1
.L18:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	mv	a0,a5
	addi	sp,sp,16
	jr	ra
.L25:
	call	h264bsdShowBits32
	lw	a5,0(sp)
	addi	s1,s1,32
	sub	s1,s1,s0
	addi	a5,a5,-1
	li	a4,1
	lw	ra,12(sp)
	lw	s0,8(sp)
	srl	a0,a0,s1
	sll	a5,a4,a5
	sub	a0,a0,a5
	snez	a5,a0
	lw	s1,4(sp)
	mv	a0,a5
	addi	sp,sp,16
	jr	ra
	.size	h264bsdMoreRbspData, .-h264bsdMoreRbspData
	.section	.text.h264bsdNextMbAddress,"ax",@progbits
	.align	2
	.globl	h264bsdNextMbAddress
	.hidden	h264bsdNextMbAddress
	.type	h264bsdNextMbAddress, @function
h264bsdNextMbAddress:
	slli	a5,a2,2
	add	a5,a0,a5
	addi	a0,a2,1
	lw	a3,0(a5)
	bltu	a0,a1,.L28
	j	.L27
.L29:
	addi	a0,a0,1
	bleu	a1,a0,.L27
.L28:
	lw	a4,4(a5)
	addi	a5,a5,4
	bne	a4,a3,.L29
	ret
.L27:
	sub	a5,a1,a0
	snez	a5,a5
	neg	a5,a5
	and	a0,a0,a5
	ret
	.size	h264bsdNextMbAddress, .-h264bsdNextMbAddress
	.globl	__umodsi3
	.globl	__udivsi3
	.globl	__mulsi3
	.section	.text.h264bsdSetCurrImageMbPointers,"ax",@progbits
	.align	2
	.globl	h264bsdSetCurrImageMbPointers
	.hidden	h264bsdSetCurrImageMbPointers
	.type	h264bsdSetCurrImageMbPointers, @function
h264bsdSetCurrImageMbPointers:
	lw	a5,4(a0)
	addi	sp,sp,-20
	sw	s0,12(sp)
	mv	s0,a1
	sw	s1,8(sp)
	mv	a1,a5
	mv	s1,a0
	mv	a0,s0
	sw	ra,16(sp)
	sw	a5,0(sp)
	call	__umodsi3
	lw	a5,0(sp)
	mv	a3,a0
	mv	a0,s0
	mv	a1,a5
	sw	a3,4(sp)
	call	__udivsi3
	lw	a5,0(sp)
	mv	a1,a5
	call	__mulsi3
	lw	a5,0(sp)
	lw	a1,8(s1)
	mv	s0,a0
	mv	a0,a5
	call	__mulsi3
	lw	a3,4(sp)
	slli	a5,a0,2
	add	a5,a5,s0
	lw	a2,0(s1)
	slli	a5,a5,3
	slli	s0,s0,4
	add	a5,a5,a3
	add	s0,s0,a3
	slli	s0,s0,4
	slli	a5,a5,3
	add	a5,a2,a5
	lw	ra,16(sp)
	add	a2,a2,s0
	slli	a4,a0,6
	lw	s0,12(sp)
	add	a4,a5,a4
	sw	a2,12(s1)
	sw	a5,16(s1)
	sw	a4,20(s1)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
	.size	h264bsdSetCurrImageMbPointers, .-h264bsdSetCurrImageMbPointers
	.hidden	h264bsdQpC
	.globl	h264bsdQpC
	.section	.rodata.h264bsdQpC,"a"
	.align	2
	.type	h264bsdQpC, @object
	.size	h264bsdQpC, 208
h264bsdQpC:
	.word	0
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	8
	.word	9
	.word	10
	.word	11
	.word	12
	.word	13
	.word	14
	.word	15
	.word	16
	.word	17
	.word	18
	.word	19
	.word	20
	.word	21
	.word	22
	.word	23
	.word	24
	.word	25
	.word	26
	.word	27
	.word	28
	.word	29
	.word	29
	.word	30
	.word	31
	.word	32
	.word	32
	.word	33
	.word	34
	.word	34
	.word	35
	.word	35
	.word	36
	.word	36
	.word	37
	.word	37
	.word	37
	.word	38
	.word	38
	.word	38
	.word	39
	.word	39
	.word	39
	.word	39
	.section	.rodata.stuffingTable,"a"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	stuffingTable, @object
	.size	stuffingTable, 32
stuffingTable:
	.word	1
	.word	2
	.word	4
	.word	8
	.word	16
	.word	32
	.word	64
	.word	128
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
