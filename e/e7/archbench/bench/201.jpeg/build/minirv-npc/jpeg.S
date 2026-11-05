#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"jpeg.c"
	.option nopic
	.text
	.section	.text.stbi__grow_buffer_unsafe,"ax",@progbits
	.align	2
	.type	stbi__grow_buffer_unsafe, @function
stbi__grow_buffer_unsafe:
	li	a3,16384
	add	a3,a0,a3
	lw	t1,1992(a3)
	addi	sp,sp,-4
	sw	s0,0(sp)
	li	a1,255
	li	a2,24
	neg	t0,t1
.L7:
	beq	t1,zero,.L8
	lw	t2,0(a0)
	lw	a5,20(t2)
	lbu	a4,0(a5)
	add	a5,a5,t0
	beq	a4,a1,.L3
	sw	a5,20(t2)
.L2:
	lw	a5,1984(a3)
	lw	t2,1980(a3)
	sub	s0,a2,a5
	sll	a4,a4,s0
	or	a4,a4,t2
	addi	a5,a5,8
	sw	a4,1980(a3)
	sw	a5,1984(a3)
	ble	a5,a2,.L7
	lw	s0,0(sp)
	addi	sp,sp,4
	jr	ra
.L8:
	li	a4,0
	j	.L2
.L3:
	addi	s0,a5,1
	sw	s0,20(t2)
	lbu	s0,0(a5)
	bne	s0,a1,.L4
	addi	a5,a5,2
.L5:
	sw	a5,20(t2)
	lbu	s0,-1(a5)
	addi	a5,a5,1
	beq	s0,a1,.L5
.L4:
	beq	s0,zero,.L2
	li	a5,16384
	add	a0,a0,a5
	sb	s0,1988(a0)
	lw	s0,0(sp)
	sw	zero,1992(a0)
	addi	sp,sp,4
	jr	ra
	.size	stbi__grow_buffer_unsafe, .-stbi__grow_buffer_unsafe
	.section	.text.stbi__idct_block,"ax",@progbits
	.align	2
	.type	stbi__idct_block, @function
stbi__idct_block:
	addi	sp,sp,-352
	addi	a5,a2,16
	sw	a5,80(sp)
	addi	a5,sp,88
	sw	s0,348(sp)
	sw	s1,344(sp)
	sw	a2,52(sp)
	sw	a0,0(sp)
	sw	a1,84(sp)
	sw	a5,48(sp)
.L19:
	lw	a4,52(sp)
	lh	a3,32(a4)
	lh	a5,16(a4)
	lh	t1,48(a4)
	lh	a2,64(a4)
	lh	a1,80(a4)
	sw	a5,4(sp)
	or	a5,a5,a3
	lh	a0,96(a4)
	or	a5,t1,a5
	sw	a3,12(sp)
	or	a5,a2,a5
	lh	a3,112(a4)
	lh	a4,0(a4)
	or	a5,a1,a5
	or	a5,a0,a5
	sw	t1,16(sp)
	sw	a2,64(sp)
	sw	a1,20(sp)
	sw	a0,8(sp)
	sw	a3,24(sp)
	or	a5,a3,a5
	sw	a4,68(sp)
	bne	a5,zero,.L17
	slli	a5,a4,2
	lw	a4,48(sp)
	sw	a5,224(a4)
	sw	a5,192(a4)
	sw	a5,160(a4)
	sw	a5,128(a4)
	sw	a5,96(a4)
	sw	a5,64(a4)
	sw	a5,32(a4)
	sw	a5,0(a4)
	lw	a4,48(sp)
	lw	a5,52(sp)
	addi	a4,a4,4
	sw	a4,48(sp)
	lw	a4,80(sp)
	addi	a5,a5,2
	sw	a5,52(sp)
	bne	a5,a4,.L19
.L48:
	addi	t0,sp,88
	mv	s0,t0
.L36:
	lw	a5,20(s0)
	lw	a4,4(s0)
	lw	t2,24(s0)
	lw	a3,4(s0)
	add	a2,a5,a4
	lw	a5,8(s0)
	lw	a4,24(s0)
	mv	a0,a2
	sw	a0,12(sp)
	add	t0,a5,a4
	lw	a4,12(s0)
	lw	a5,28(s0)
	slli	a1,t0,4
	add	a1,a1,t0
	add	a5,a5,a4
	slli	a1,a1,2
	add	s1,a5,a2
	add	a1,a1,t0
	slli	a2,a2,1
	sw	a1,20(sp)
	add	a2,a2,a0
	lw	a1,12(s0)
	lw	a0,20(s0)
	lw	a4,28(s0)
	lw	t1,8(s0)
	sw	t0,16(sp)
	add	a0,a0,a1
	slli	t0,t2,4
	lw	t2,8(s0)
	add	a4,a4,a3
	sw	a0,8(sp)
	slli	a3,s1,2
	lw	a0,24(s0)
	add	a3,a3,s1
	slli	t1,t1,1
	add	t1,t1,t2
	slli	t2,a3,4
	sub	t0,t0,a0
	sub	t2,t2,a3
	lw	a0,12(s0)
	lw	a3,20(s0)
	slli	a2,a2,3
	slli	a0,a0,1
	slli	a3,a3,5
	sw	a3,28(sp)
	mv	a3,a0
	lw	a0,4(s0)
	sw	a5,4(sp)
	slli	a5,a4,1
	slli	a0,a0,1
	sw	a0,32(sp)
	lw	a0,12(sp)
	add	a5,a5,a4
	slli	a5,a5,3
	add	a2,a2,a0
	mv	a0,a3
	lw	a3,12(s0)
	sub	a5,a5,a4
	slli	a5,a5,5
	add	a0,a0,a3
	lw	a3,8(s0)
	add	a4,a5,a4
	slli	t1,t1,4
	slli	t2,t2,2
	lw	a1,20(sp)
	lw	a5,16(sp)
	sw	a0,20(sp)
	add	t1,t1,a3
	add	t2,t2,s1
	lw	a3,20(s0)
	sw	a4,24(sp)
	lw	a4,28(sp)
	lw	s1,20(sp)
	slli	a1,a1,2
	add	a3,a4,a3
	slli	s1,s1,4
	sw	s1,40(sp)
	lw	a4,4(s0)
	lw	s1,24(sp)
	add	a1,a1,a5
	lw	a5,32(sp)
	slli	s1,s1,2
	sw	s1,44(sp)
	add	a0,a5,a4
	lw	a4,8(sp)
	lw	s1,8(sp)
	lw	a5,4(sp)
	slli	a4,a4,2
	add	a4,a4,s1
	lw	s1,4(sp)
	slli	a5,a5,6
	sw	a3,28(sp)
	sub	a5,a5,s1
	lw	a3,24(s0)
	lw	s1,12(sp)
	slli	t0,t0,2
	slli	a2,a2,4
	sub	t0,t0,a3
	sub	a2,a2,s1
	slli	t2,t2,4
	lw	s1,16(sp)
	sw	t2,32(sp)
	slli	t2,t0,3
	lw	t0,8(s0)
	slli	a1,a1,3
	add	a1,a1,s1
	slli	t1,t1,6
	lw	a3,28(sp)
	sub	t1,t1,t0
	sw	a1,28(sp)
	lw	t0,0(s0)
	lw	a1,16(s0)
	slli	a3,a3,3
	lw	s1,20(sp)
	add	t0,t0,a1
	lw	a1,28(s0)
	slli	a0,a0,9
	slli	t0,t0,12
	slli	a1,a1,3
	sw	a1,36(sp)
	lw	a1,20(s0)
	slli	a2,a2,2
	slli	a5,a5,2
	sub	a3,a3,a1
	lw	a1,40(sp)
	slli	a4,a4,3
	slli	a3,a3,2
	add	a1,s1,a1
	sw	a1,40(sp)
	lw	a1,4(s0)
	lw	s1,24(sp)
	add	a0,a0,a1
	lw	a1,44(sp)
	slli	a0,a0,2
	add	s1,s1,a1
	lw	a1,28(sp)
	add	t1,t1,a1
	sw	t1,16(sp)
	sw	t0,20(sp)
	lw	t1,28(s0)
	lw	a1,36(sp)
	add	a1,a1,t1
	lw	t1,32(sp)
	sub	t1,t1,s1
	lw	s1,12(sp)
	sw	t1,24(sp)
	add	a2,a2,s1
	lw	s1,40(sp)
	mv	t0,a2
	lw	a2,24(s0)
	slli	t1,s1,2
	lw	s1,4(sp)
	add	a2,t2,a2
	lw	t2,8(sp)
	sub	a5,a5,s1
	lw	s1,12(s0)
	add	a4,a4,t2
	lw	t2,20(sp)
	sub	s1,t1,s1
	lw	t1,16(sp)
	slli	a2,a2,4
	sw	t0,40(sp)
	add	t1,t1,t2
	lw	t2,20(s0)
	slli	a4,a4,8
	slli	a5,a5,4
	sub	a3,a3,t2
	lw	t2,4(s0)
	sw	t1,12(sp)
	slli	t1,a1,4
	add	a0,a0,t2
	sw	a0,36(sp)
	lw	a0,24(sp)
	add	t1,a1,t1
	slli	a1,s1,5
	sub	t2,a0,t0
	lw	a0,24(s0)
	lw	t0,16(s0)
	sub	a1,a1,s1
	sub	a2,a0,a2
	lw	a0,0(s0)
	slli	a3,a3,2
	slli	t1,t1,3
	sub	a0,a0,t0
	mv	t0,a0
	lw	a0,8(sp)
	slli	a1,a1,1
	add	a4,a4,a0
	lw	a0,4(sp)
	add	a5,a5,a0
	lw	a0,36(sp)
	slli	a5,a5,1
	add	a0,t2,a0
	lw	t2,12(sp)
	sw	a0,4(sp)
	li	a0,16842752
	add	a0,t2,a0
	lw	t2,28(sp)
	sw	a0,8(sp)
	lw	s1,4(sp)
	add	a2,a2,t2
	lw	t2,32(sp)
	slli	a0,t0,12
	lw	t0,20(s0)
	sub	a4,t2,a4
	lw	t2,8(sp)
	add	a3,a3,t0
	slli	a3,a3,1
	add	s1,s1,t2
	lw	t2,16(sp)
	lw	t0,20(sp)
	srai	s1,s1,17
	sub	t0,t0,t2
	add	t2,a2,a0
	sub	a2,a0,a2
	sw	a2,12(sp)
	lw	a0,28(s0)
	lw	a2,40(sp)
	sub	t1,t1,a0
	sub	a0,a4,a5
	sub	a4,a4,a2
	lw	a2,24(sp)
	add	a4,a4,a3
	li	a3,16842752
	sub	a5,a2,a5
	lw	a2,12(sp)
	add	t2,t2,a3
	add	t0,t0,a3
	add	a2,a2,a3
	li	a3,255
	add	a1,a0,a1
	add	a5,a5,t1
	bleu	s1,a3,.L40
	srli	s1,s1,31
	addi	s1,s1,-1
.L40:
	lw	a0,4(sp)
	lw	a3,8(sp)
	andi	s1,s1,0xff
	sub	a3,a3,a0
	lw	a0,0(sp)
	srai	a3,a3,17
	sb	s1,0(a0)
	li	a0,255
	bleu	a3,a0,.L41
	srli	a3,a3,31
	addi	a3,a3,-1
.L41:
	lw	t1,0(sp)
	andi	a3,a3,0xff
	add	a0,a1,t2
	sb	a3,7(t1)
	srai	a3,a0,17
	li	a0,255
	bleu	a3,a0,.L42
	srli	a3,a3,31
	addi	a3,a3,-1
.L42:
	sub	t2,t2,a1
	lw	a1,0(sp)
	andi	a3,a3,0xff
	srai	t2,t2,17
	sb	a3,1(a1)
	li	a3,255
	bleu	t2,a3,.L43
	srli	t2,t2,31
	addi	t2,t2,-1
.L43:
	lw	a1,0(sp)
	andi	t2,t2,0xff
	add	a3,a4,a2
	sb	t2,6(a1)
	srai	a3,a3,17
	li	a1,255
	bleu	a3,a1,.L44
	srli	a3,a3,31
	addi	a3,a3,-1
.L44:
	sub	a2,a2,a4
	lw	a4,0(sp)
	andi	a3,a3,0xff
	srai	a2,a2,17
	sb	a3,2(a4)
	li	a4,255
	bleu	a2,a4,.L45
	srli	a2,a2,31
	addi	a2,a2,-1
.L45:
	lw	a3,0(sp)
	andi	a2,a2,0xff
	add	a4,a5,t0
	sb	a2,5(a3)
	srai	a4,a4,17
	li	a3,255
	bleu	a4,a3,.L46
	srli	a4,a4,31
	addi	a4,a4,-1
.L46:
	sub	t0,t0,a5
	lw	a5,0(sp)
	andi	a4,a4,0xff
	srai	t0,t0,17
	sb	a4,3(a5)
	li	a5,255
	bleu	t0,a5,.L47
	srli	t0,t0,31
	addi	t0,t0,-1
.L47:
	lw	a5,0(sp)
	lw	a4,84(sp)
	andi	t0,t0,0xff
	sb	t0,4(a5)
	add	a5,a5,a4
	sw	a5,0(sp)
	addi	s0,s0,32
	addi	a5,sp,344
	bne	s0,a5,.L36
	lw	s0,348(sp)
	lw	s1,344(sp)
	addi	sp,sp,352
	jr	ra
.L17:
	lw	a3,20(sp)
	lw	a5,4(sp)
	lw	a2,24(sp)
	lw	t0,16(sp)
	lw	t2,12(sp)
	lw	a0,8(sp)
	add	s1,a2,t0
	add	t1,a3,a5
	add	a4,t2,a0
	add	t0,a2,a5
	add	a1,s1,t1
	sw	t0,44(sp)
	mv	s0,a1
	slli	a2,a4,4
	mv	a1,a4
	slli	a4,t0,1
	lw	t0,16(sp)
	slli	a5,a0,4
	sw	s0,56(sp)
	add	a0,a3,t0
	sw	a0,32(sp)
	lw	a0,8(sp)
	sw	a1,40(sp)
	mv	t0,a3
	sub	a5,a5,a0
	lw	a0,44(sp)
	add	a2,a2,a1
	slli	s0,s0,2
	add	a4,a4,a0
	lw	a0,56(sp)
	slli	a1,a3,5
	lw	a3,16(sp)
	add	s0,s0,a0
	lw	a0,16(sp)
	sw	t1,28(sp)
	slli	a3,a3,1
	add	a3,a3,a0
	sw	s1,36(sp)
	lw	a0,32(sp)
	add	a1,a1,t0
	slli	t0,s1,6
	lw	s1,28(sp)
	slli	t1,t1,1
	sw	a3,60(sp)
	add	t1,t1,s1
	slli	a3,t2,1
	lw	s1,40(sp)
	slli	t2,a0,2
	lw	a0,8(sp)
	slli	a2,a2,2
	slli	a5,a5,2
	add	a2,a2,s1
	sub	a5,a5,a0
	lw	s1,12(sp)
	lw	a0,60(sp)
	slli	a4,a4,3
	add	a3,a3,s1
	slli	s1,a0,4
	sw	s1,76(sp)
	lw	s1,36(sp)
	lw	a0,44(sp)
	slli	a1,a1,3
	sub	t0,t0,s1
	slli	s1,s0,4
	sub	s0,s1,s0
	sw	s0,72(sp)
	lw	s0,24(sp)
	sub	a4,a4,a0
	lw	a0,32(sp)
	slli	s0,s0,3
	slli	t1,t1,3
	add	t2,t2,a0
	mv	a0,s0
	lw	s0,20(sp)
	slli	a4,a4,5
	slli	a2,a2,2
	sub	a1,a1,s0
	lw	s0,60(sp)
	lw	s1,76(sp)
	slli	a5,a5,3
	slli	a3,a3,4
	add	s0,s0,s1
	lw	s1,28(sp)
	sw	s0,76(sp)
	lw	s0,4(sp)
	add	t1,t1,s1
	lw	s1,24(sp)
	slli	t2,t2,3
	slli	s0,s0,1
	add	a0,a0,s1
	sw	a0,60(sp)
	lw	a0,44(sp)
	lw	s1,76(sp)
	slli	t0,t0,2
	add	a4,a4,a0
	sw	a4,44(sp)
	lw	a4,40(sp)
	slli	s1,s1,2
	lw	a0,32(sp)
	add	a2,a2,a4
	lw	a4,8(sp)
	slli	a1,a1,2
	slli	a2,a2,3
	add	a5,a5,a4
	lw	a4,12(sp)
	slli	a5,a5,4
	slli	t1,t1,4
	add	a3,a3,a4
	lw	a4,72(sp)
	sw	s1,72(sp)
	lw	s1,4(sp)
	slli	a4,a4,2
	slli	a3,a3,6
	add	s0,s0,s1
	add	s1,t2,a0
	lw	t2,36(sp)
	lw	a0,16(sp)
	slli	s0,s0,9
	sub	t0,t0,t2
	lw	t2,72(sp)
	sw	s0,72(sp)
	slli	t0,t0,4
	sub	t2,t2,a0
	sw	t2,16(sp)
	lw	t2,20(sp)
	lw	a0,56(sp)
	sub	a1,a1,t2
	lw	t2,44(sp)
	add	a4,a4,a0
	lw	a0,60(sp)
	slli	s0,t2,2
	sw	s0,76(sp)
	lw	s0,40(sp)
	slli	t2,s1,8
	lw	s1,28(sp)
	add	a2,a2,s0
	slli	s0,a4,4
	lw	a4,8(sp)
	sw	s0,40(sp)
	sub	t1,t1,s1
	sub	a5,a4,a5
	lw	a4,12(sp)
	lw	s0,64(sp)
	slli	a1,a1,2
	sub	a3,a3,a4
	lw	a4,68(sp)
	slli	a0,a0,4
	sw	a1,56(sp)
	add	s1,s0,a4
	sub	s0,a4,s0
	lw	a4,60(sp)
	lw	a1,72(sp)
	add	a5,a5,a2
	add	a0,a4,a0
	lw	a4,4(sp)
	add	a3,a3,a2
	lw	a2,40(sp)
	add	a1,a1,a4
	sw	a1,60(sp)
	lw	a4,44(sp)
	lw	a1,76(sp)
	sw	a0,12(sp)
	lw	a0,16(sp)
	add	a1,a4,a1
	lw	a4,32(sp)
	slli	s1,s1,12
	slli	a0,a0,5
	add	a4,t2,a4
	sw	a4,8(sp)
	lw	t2,36(sp)
	sub	a4,a2,a1
	lw	a1,8(sp)
	sw	a4,32(sp)
	add	t0,t0,t2
	sub	a4,a2,a1
	slli	t2,t1,2
	lw	a1,56(sp)
	lw	t1,20(sp)
	lw	a2,28(sp)
	slli	t0,t0,1
	add	a1,a1,t1
	lw	t1,16(sp)
	sw	t0,8(sp)
	slli	s0,s0,12
	add	t0,a3,s1
	sub	a0,a0,t1
	lw	t1,60(sp)
	add	t2,t2,a2
	sub	s1,s1,a3
	lw	a2,12(sp)
	add	a3,a5,s0
	sw	t0,12(sp)
	sub	t0,s0,a5
	lw	a5,4(sp)
	slli	t1,t1,2
	lw	s0,24(sp)
	add	t1,t1,a5
	sw	t0,16(sp)
	lw	a5,8(sp)
	lw	t0,32(sp)
	slli	a2,a2,3
	sub	a2,a2,s0
	sub	a5,a4,a5
	sub	s0,t0,t2
	sub	a4,a4,t2
	mv	t2,t0
	lw	t0,8(sp)
	slli	a1,a1,1
	add	a4,a4,a1
	sub	t0,t2,t0
	add	t0,t0,a2
	lw	a2,12(sp)
	slli	a0,a0,1
	add	a5,a5,a0
	addi	a1,a2,512
	lw	a2,16(sp)
	addi	a3,a3,512
	add	t2,a5,a3
	addi	a0,a2,512
	addi	a2,s1,512
	sub	a3,a3,a5
	add	a5,a4,a0
	sub	a0,a0,a4
	add	a4,t0,a2
	sub	a2,a2,t0
	lw	t0,48(sp)
	srai	a4,a4,10
	srai	a5,a5,10
	sw	a4,96(t0)
	lw	a4,48(sp)
	sw	a5,64(t0)
	lw	a5,52(sp)
	add	s0,s0,t1
	addi	a4,a4,4
	add	t1,s0,a1
	sw	a4,48(sp)
	sub	a1,a1,s0
	lw	a4,80(sp)
	srai	t1,t1,10
	srai	a1,a1,10
	srai	t2,t2,10
	srai	a3,a3,10
	srai	a0,a0,10
	srai	a2,a2,10
	addi	a5,a5,2
	sw	t1,0(t0)
	sw	a1,224(t0)
	sw	t2,32(t0)
	sw	a3,192(t0)
	sw	a0,160(t0)
	sw	a2,128(t0)
	sw	a5,52(sp)
	bne	a5,a4,.L19
	j	.L48
	.size	stbi__idct_block, .-stbi__idct_block
	.section	.text.resample_row_1,"ax",@progbits
	.align	2
	.type	resample_row_1, @function
resample_row_1:
	mv	a0,a1
	ret
	.size	resample_row_1, .-resample_row_1
	.section	.text.stbi__resample_row_v_2,"ax",@progbits
	.align	2
	.type	stbi__resample_row_v_2, @function
stbi__resample_row_v_2:
	ble	a3,zero,.L51
	li	a4,0
.L52:
	add	a5,a1,a4
	lbu	t1,0(a5)
	add	a5,a2,a4
	lbu	t0,0(a5)
	slli	a5,t1,1
	add	a5,a5,t1
	add	a5,a5,t0
	addi	a5,a5,2
	add	t1,a0,a4
	srai	a5,a5,2
	sb	a5,0(t1)
	addi	a4,a4,1
	bne	a3,a4,.L52
.L51:
	ret
	.size	stbi__resample_row_v_2, .-stbi__resample_row_v_2
	.section	.text.stbi__resample_row_hv_2,"ax",@progbits
	.align	2
	.type	stbi__resample_row_hv_2, @function
stbi__resample_row_hv_2:
	lbu	a4,0(a1)
	lbu	t1,0(a2)
	slli	a5,a4,1
	add	a5,a5,a4
	add	a5,a5,t1
	addi	a4,a5,2
	srai	a4,a4,2
	li	t1,1
	andi	a4,a4,0xff
	beq	a3,t1,.L65
	sb	a4,0(a0)
	ble	a3,t1,.L62
	addi	sp,sp,-4
	addi	t0,a1,1
	sw	s0,0(sp)
	addi	a2,a2,1
	addi	t1,a0,1
	add	a1,a1,a3
.L58:
	lbu	t2,0(t0)
	lbu	a4,0(a2)
	mv	s0,a5
	slli	a5,t2,1
	add	a5,a5,t2
	add	a5,a5,a4
	slli	t2,s0,1
	slli	a4,a5,1
	add	t2,t2,s0
	add	a4,a4,a5
	add	t2,t2,a5
	add	a4,a4,s0
	addi	t2,t2,8
	addi	a4,a4,8
	srai	t2,t2,4
	srai	a4,a4,4
	sb	t2,0(t1)
	sb	a4,1(t1)
	addi	t0,t0,1
	addi	a2,a2,1
	addi	t1,t1,2
	bne	a1,t0,.L58
	addi	a5,a5,2
	srai	a5,a5,2
	slli	a3,a3,1
	andi	a4,a5,0xff
	add	a3,a0,a3
	sb	a4,-1(a3)
	lw	s0,0(sp)
	addi	sp,sp,4
	jr	ra
.L65:
	sb	a4,1(a0)
	sb	a4,0(a0)
	ret
.L62:
	slli	a3,a3,1
	add	a3,a0,a3
	sb	a4,-1(a3)
	ret
	.size	stbi__resample_row_hv_2, .-stbi__resample_row_hv_2
	.section	.text.stbi__resample_row_generic,"ax",@progbits
	.align	2
	.type	stbi__resample_row_generic, @function
stbi__resample_row_generic:
	ble	a3,zero,.L67
	add	a2,a4,a0
	add	t0,a1,a3
	li	t1,0
.L68:
	add	a5,a0,t1
	ble	a4,zero,.L71
.L69:
	lbu	a3,0(a1)
	addi	a5,a5,1
	sb	a3,-1(a5)
	bne	a5,a2,.L69
.L71:
	addi	a1,a1,1
	add	t1,t1,a4
	add	a2,a2,a4
	bne	a1,t0,.L68
.L67:
	ret
	.size	stbi__resample_row_generic, .-stbi__resample_row_generic
	.section	.text.stbi__YCbCr_to_RGB_row,"ax",@progbits
	.align	2
	.type	stbi__YCbCr_to_RGB_row, @function
stbi__YCbCr_to_RGB_row:
	addi	sp,sp,-28
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	a4,12(sp)
	sw	a1,0(sp)
	sw	a2,4(sp)
	sw	a3,8(sp)
	sw	a5,16(sp)
	ble	a4,zero,.L74
	li	t2,0
	li	s1,255
.L82:
	lw	a5,4(sp)
	add	a5,a5,t2
	lbu	a1,0(a5)
	lw	a5,8(sp)
	addi	a1,a1,-128
	add	a5,a5,t2
	lbu	t0,0(a5)
	slli	a5,a1,3
	sub	a5,a5,a1
	addi	t0,t0,-128
	slli	a3,t0,1
	add	a3,a3,t0
	slli	s0,a3,4
	sub	s0,s0,a3
	lw	a3,0(sp)
	slli	a4,a1,1
	slli	a5,a5,3
	add	a3,a3,t2
	lbu	t1,0(a3)
	add	a4,a4,a1
	add	a5,a5,a1
	slli	a3,s0,3
	sub	a3,a3,t0
	slli	a4,a4,2
	slli	a5,a5,2
	sub	a4,a4,a1
	sub	a5,a5,a1
	slli	a3,a3,4
	sub	a3,a3,t0
	slli	a4,a4,6
	slli	a5,a5,2
	slli	t1,t1,20
	li	t0,524288
	add	t1,t1,t0
	add	a4,a4,a1
	sub	a5,a5,a1
	slli	a2,s0,6
	slli	a3,a3,8
	add	a2,s0,a2
	slli	a4,a4,9
	slli	a5,a5,2
	add	a3,a3,t1
	add	a5,a5,a1
	slli	a2,a2,8
	li	a1,-65536
	neg	a4,a4
	srai	a3,a3,20
	and	a4,a4,a1
	sub	a2,t1,a2
	slli	a5,a5,9
	not	a1,a3
	add	a2,a2,a4
	add	a5,a5,t1
	srai	a1,a1,31
	srai	a2,a2,20
	srai	a5,a5,20
	andi	a1,a1,0xff
	bgtu	a3,s1,.L77
	andi	a1,a3,0xff
.L77:
	not	a3,a2
	srai	a3,a3,31
	andi	a3,a3,0xff
	bgtu	a2,s1,.L79
	andi	a3,a2,0xff
.L79:
	not	a4,a5
	srai	a4,a4,31
	andi	a4,a4,0xff
	bgtu	a5,s1,.L81
	andi	a4,a5,0xff
.L81:
	li	a5,-1
	sb	a5,3(a0)
	lw	a5,16(sp)
	sb	a1,0(a0)
	sb	a3,1(a0)
	sb	a4,2(a0)
	add	a0,a0,a5
	lw	a5,12(sp)
	addi	t2,t2,1
	bne	a5,t2,.L82
.L74:
	lw	s0,24(sp)
	lw	s1,20(sp)
	addi	sp,sp,28
	jr	ra
	.size	stbi__YCbCr_to_RGB_row, .-stbi__YCbCr_to_RGB_row
	.section	.rodata.stbi__jpeg_huff_decode.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"AM Panic: "
	.align	2
.LC1:
	.string	"Assertion `(j->code_buffer >> (32 - h->size[c])) == h->code[c]' failed"
	.align	2
.LC2:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/201.jpeg/jpeg.c:843  \n"
	.section	.text.stbi__jpeg_huff_decode,"ax",@progbits
	.align	2
	.type	stbi__jpeg_huff_decode, @function
stbi__jpeg_huff_decode:
	li	a5,16384
	add	a5,a0,a5
	lw	t1,1984(a5)
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	li	a4,15
	mv	s1,a0
	mv	s0,a1
	ble	t1,a4,.L105
.L88:
	li	a5,16384
	add	a5,s1,a5
	lw	a3,1980(a5)
	li	a2,255
	srli	a4,a3,23
	add	a4,s0,a4
	lbu	a4,0(a4)
	beq	a4,a2,.L89
	add	a4,s0,a4
	lbu	a2,1280(a4)
	blt	t1,a2,.L99
	sll	a3,a3,a2
	sub	a2,t1,a2
	sw	a3,1980(a5)
	sw	a2,1984(a5)
	lbu	a0,1024(a4)
.L87:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L89:
	lw	a5,1580(s0)
	srli	a1,a3,16
	bltu	a1,a5,.L98
	addi	a5,s0,1584
	li	a4,10
.L92:
	lw	a2,0(a5)
	addi	a4,a4,1
	addi	a5,a5,4
	bleu	a2,a1,.L92
	li	a5,17
	beq	a4,a5,.L106
.L91:
	blt	t1,a4,.L99
	addi	a5,a4,400
	slli	a5,a5,2
	add	a5,s0,a5
	lw	a2,12(a5)
	li	a1,32
	sub	a5,a1,a4
	srl	a5,a3,a5
	add	a5,a5,a2
	add	a2,s0,a5
	addi	a5,a5,256
	slli	a5,a5,1
	lbu	a0,1280(a2)
	add	s0,s0,a5
	lhu	a5,0(s0)
	sub	a1,a1,a0
	srl	a1,a3,a1
	bne	a1,a5,.L107
	lw	ra,12(sp)
	lw	s0,8(sp)
	li	a5,16384
	add	s1,s1,a5
	sll	a3,a3,a4
	sub	a5,t1,a4
	sw	a5,1984(s1)
	sw	a3,1980(s1)
	lbu	a0,1024(a2)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L105:
	sw	a5,0(sp)
	call	stbi__grow_buffer_unsafe
	lw	a5,0(sp)
	lw	t1,1984(a5)
	j	.L88
.L106:
	li	a4,16384
	add	a4,s1,a4
	addi	a5,t1,-16
	sw	a5,1984(a4)
	li	a0,-1
	j	.L87
.L98:
	li	a4,10
	j	.L91
.L99:
	li	a0,-1
	j	.L87
.L107:
	lla	s0,.LC0
	li	a0,65
.L94:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L94
	lla	s0,.LC1
	li	a0,65
.L95:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L95
	lla	s0,.LC2
	li	a0,32
.L96:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L96
	li	a0,1
	call	halt
	.size	stbi__jpeg_huff_decode, .-stbi__jpeg_huff_decode
	.section	.rodata.stbi__build_huffman.str1.4,"aMS",@progbits,1
	.align	2
.LC3:
	.string	"bad code lengths"
	.section	.text.stbi__build_huffman,"ax",@progbits
	.align	2
	.type	stbi__build_huffman, @function
stbi__build_huffman:
	addi	sp,sp,-12
	sw	s1,0(sp)
	sw	ra,8(sp)
	sw	s0,4(sp)
	mv	s1,a0
	li	a2,1
	li	t1,0
	li	t0,17
.L109:
	lw	a0,0(a1)
	add	a5,s1,t1
	andi	a3,a2,0xff
	add	a4,a5,a0
	ble	a0,zero,.L113
.L110:
	sb	a3,1280(a5)
	addi	a5,a5,1
	bne	a5,a4,.L110
	add	t1,t1,a0
.L113:
	addi	a2,a2,1
	addi	a1,a1,4
	bne	a2,t0,.L109
	add	t1,s1,t1
	sb	zero,1280(t1)
	addi	a2,s1,1544
	li	a5,0
	li	s0,0
	li	a4,1
	mv	a1,s1
	li	t2,16
	j	.L117
.L114:
	sub	a3,t2,a4
	sll	a3,a5,a3
	sw	a3,0(a2)
	addi	a4,a4,1
	li	a3,17
	slli	a5,a5,1
	addi	a2,a2,4
	beq	a4,a3,.L136
.L117:
	sub	a0,s0,a5
	sw	a0,72(a2)
	lbu	a3,1280(a1)
	bne	a3,a4,.L114
	slli	a3,s0,1
	add	a3,s1,a3
.L115:
	mv	t0,a5
	addi	a5,a5,1
	addi	a1,a5,-1
	add	s0,a0,a5
	sh	a1,512(a3)
	add	a1,s1,s0
	lbu	t1,1280(a1)
	addi	a3,a3,2
	beq	t1,a4,.L115
	srl	t0,t0,a4
	beq	t0,zero,.L114
	lw	ra,8(sp)
	lw	s0,4(sp)
	lla	a5,.LC3
	la a4, .LANCHOR0; sw a5, 0(a4);
	lw	s1,0(sp)
	li	a0,0
	addi	sp,sp,12
	jr	ra
.L136:
	li	a5,-1
	li	a2,512
	li	a1,255
	sw	a5,1608(s1)
	mv	a0,s1
	call	memset
	addi	a2,s1,512
	li	a4,0
	li	a1,9
	li	a0,1
	bne	s0,zero,.L120
	j	.L121
.L137:
	addi	a4,a4,1
	addi	a2,a2,2
	beq	s0,a4,.L121
.L120:
	add	a5,s1,a4
	lbu	a3,1280(a5)
	bgt	a3,a1,.L137
	lhu	a5,0(a2)
	sub	t1,a1,a3
	sll	a3,a0,t1
	sll	a5,a5,t1
	add	a3,a3,a5
	andi	t1,a4,0xff
	add	a5,s1,a5
	add	a3,s1,a3
.L122:
	sb	t1,0(a5)
	addi	a5,a5,1
	bne	a5,a3,.L122
	addi	a4,a4,1
	addi	a2,a2,2
	bne	s0,a4,.L120
.L121:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
	.size	stbi__build_huffman, .-stbi__build_huffman
	.section	.rodata.stbi__process_marker.str1.4,"aMS",@progbits,1
	.align	2
.LC4:
	.string	"expected marker"
	.align	2
.LC5:
	.string	"bad DRI len"
	.align	2
.LC6:
	.string	"bad DQT type"
	.align	2
.LC7:
	.string	"bad DQT table"
	.align	2
.LC8:
	.string	"bad DHT header"
	.align	2
.LC9:
	.string	"bad COM len"
	.align	2
.LC10:
	.string	"bad APP len"
	.align	2
.LC11:
	.string	"unknown marker"
	.section	.text.stbi__process_marker,"ax",@progbits
	.align	2
	.type	stbi__process_marker, @function
stbi__process_marker:
	addi	sp,sp,-96
	sw	s1,84(sp)
	sw	ra,92(sp)
	sw	s0,88(sp)
	li	a5,221
	mv	s1,a0
	beq	a1,a5,.L139
	bgt	a1,a5,.L140
	li	a5,196
	beq	a1,a5,.L141
	li	a5,219
	bne	a1,a5,.L143
	lw	a2,0(a0)
	lw	a4,20(a2)
	addi	a5,a4,1
	sw	a5,20(a2)
	addi	a5,a4,2
	lbu	a3,0(a4)
	sw	a5,20(a2)
	lbu	a4,1(a4)
	slli	a3,a3,8
	add	a4,a4,a3
	addi	a4,a4,-2
	sw	a4,0(sp)
	ble	a4,zero,.L147
	li	t2,8192
	lla	s0,.LANCHOR1+64
	addi	t2,t2,-1472
.L155:
	addi	a4,a5,1
	sw	a4,20(a2)
	lbu	a5,0(a5)
	li	a3,1
	srai	t1,a5,4
	andi	t0,a5,15
	bgt	t1,a3,.L218
	andi	a5,a5,12
	bne	a5,zero,.L149
	lla	a3,.LANCHOR1+1
	slli	t0,t0,6
	j	.L150
.L219:
	lbu	a1,0(a4)
	sw	a0,20(a2)
	lbu	a4,1(a4)
	slli	a1,a1,8
	add	a5,t0,a5
	add	a4,a4,a1
	add	a5,a5,t2
	slli	a4,a4,16
	slli	a5,a5,1
	srli	a4,a4,16
	add	a5,s1,a5
	sh	a4,4(a5)
	beq	a3,s0,.L153
.L220:
	lw	a4,20(a2)
	lbu	a5,0(a3)
	addi	a3,a3,1
.L150:
	addi	a1,a4,1
	sw	a1,20(a2)
	addi	a0,a4,2
	bne	t1,zero,.L219
	add	a5,t0,a5
	lbu	a4,0(a4)
	add	a5,a5,t2
	slli	a5,a5,1
	add	a5,s1,a5
	sh	a4,4(a5)
	bne	a3,s0,.L220
.L153:
	lw	a4,0(sp)
	snez	a5,t1
	slli	a5,a5,6
	addi	a5,a5,65
	sub	a5,a4,a5
	sw	a5,0(sp)
	ble	a5,zero,.L147
	lw	a5,20(a2)
	j	.L155
.L140:
	li	a5,255
	bne	a1,a5,.L144
	lla	a5,.LC4
	la a4, .LANCHOR0; sw a5, 0(a4);
	li	a0,0
.L138:
	lw	ra,92(sp)
	lw	s0,88(sp)
	lw	s1,84(sp)
	addi	sp,sp,96
	jr	ra
.L144:
	addi	a5,a1,-224
	li	a4,15
	bgtu	a5,a4,.L221
	lw	a4,0(a0)
	li	t1,1
	lw	a3,20(a4)
	addi	a5,a3,1
	sw	a5,20(a4)
	addi	a0,a3,2
	lbu	a5,0(a3)
	sw	a0,20(a4)
	lbu	a2,1(a3)
	slli	a5,a5,8
	add	a2,a2,a5
	bgt	a2,t1,.L222
	lla	a5,.LC10
	la a4, .LANCHOR0; sw a5, 0(a4);
	li	a0,0
	j	.L138
.L141:
	lw	a2,0(a0)
	lw	a5,20(a2)
	addi	a4,a5,1
	sw	a4,20(a2)
	addi	a4,a5,2
	lbu	a3,0(a5)
	sw	a4,20(a2)
	lbu	a0,1(a5)
	slli	a5,a3,8
	add	a0,a0,a5
	addi	a0,a0,-2
	ble	a0,zero,.L156
	mv	a5,a4
	sw	s1,0(sp)
.L171:
	addi	a4,a5,1
	sw	a4,20(a2)
	lbu	a4,0(a5)
	li	a3,1
	srai	t0,a4,4
	andi	t1,a4,15
	bgt	t0,a3,.L157
	andi	a4,a4,12
	bne	a4,zero,.L157
	addi	a5,a5,2
	addi	a4,sp,20
	addi	a1,sp,84
	li	s1,0
.L160:
	sw	a5,20(a2)
	lbu	a3,-1(a5)
	addi	a4,a4,4
	addi	a5,a5,1
	sw	a3,-4(a4)
	add	s1,s1,a3
	bne	a1,a4,.L160
	slli	a5,t1,3
	sub	a5,a5,t1
	slli	a2,a5,4
	sub	a2,a2,a5
	addi	a5,a0,-17
	sw	a5,4(sp)
	sw	t0,16(sp)
	sw	t1,12(sp)
	slli	a2,a2,4
	bne	t0,zero,.L161
	lw	s0,0(sp)
	addi	a1,sp,20
	sw	a2,8(sp)
	addi	a0,s0,4
	add	a0,a0,a2
	call	stbi__build_huffman
	beq	a0,zero,.L217
	lw	a2,8(sp)
	lw	t1,12(sp)
	lw	t0,16(sp)
	addi	a0,a2,1028
	add	a0,s0,a0
	beq	s1,zero,.L167
.L163:
	lw	t2,0(sp)
	li	a5,0
.L166:
	lw	a3,0(t2)
	add	a1,a0,a5
	addi	a5,a5,1
	lw	a4,20(a3)
	addi	s0,a4,1
	sw	s0,20(a3)
	lbu	a4,0(a4)
	sb	a4,0(a1)
	blt	a5,s1,.L166
	bne	t0,zero,.L223
.L167:
	lw	a5,4(sp)
	sub	a0,a5,s1
	ble	a0,zero,.L156
	lw	a5,0(sp)
	lw	a2,0(a5)
	lw	a5,20(a2)
	j	.L171
.L139:
	lw	a4,0(a0)
	li	a1,4
	lw	a5,20(a4)
	addi	a3,a5,1
	sw	a3,20(a4)
	addi	a3,a5,2
	lbu	a2,0(a5)
	sw	a3,20(a4)
	lbu	a3,1(a5)
	slli	a2,a2,8
	add	a3,a3,a2
	beq	a3,a1,.L146
	lw	ra,92(sp)
	lw	s0,88(sp)
	lla	a5,.LC5
	la a4, .LANCHOR0; sw a5, 0(a4);
	lw	s1,84(sp)
	li	a0,0
	addi	sp,sp,96
	jr	ra
.L221:
	li	a5,254
	beq	a1,a5,.L224
.L143:
	lla	a5,.LC11
	la a4, .LANCHOR0; sw a5, 0(a4);
	li	a0,0
	j	.L138
.L146:
	addi	a3,a5,3
	sw	a3,20(a4)
	addi	a2,a5,4
	lbu	a3,2(a5)
	sw	a2,20(a4)
	lbu	a4,3(a5)
	lw	ra,92(sp)
	lw	s0,88(sp)
	slli	a3,a3,8
	li	a5,20480
	add	a5,a0,a5
	add	a4,a4,a3
	sw	a4,-2044(a5)
	lw	s1,84(sp)
	li	a0,1
	addi	sp,sp,96
	jr	ra
.L147:
	lw	a5,0(sp)
	seqz	a0,a5
	j	.L138
.L161:
	li	a5,8192
	addi	s0,a5,-1468
	lw	a5,0(sp)
	addi	a1,sp,20
	sw	a2,8(sp)
	add	s0,a5,s0
	add	s0,s0,a2
	mv	a0,s0
	call	stbi__build_huffman
	beq	a0,zero,.L217
	li	a5,8192
	lw	a2,8(sp)
	addi	a0,a5,-444
	lw	a5,0(sp)
	add	a0,a2,a0
	lw	t1,12(sp)
	lw	t0,16(sp)
	add	a0,a5,a0
	bne	s1,zero,.L163
.L165:
	li	a5,12288
	addi	a5,a5,1668
	slli	a4,t1,10
	add	a4,a4,a5
	lw	a5,0(sp)
	li	t0,255
	add	a4,a5,a4
	li	a5,0
.L170:
	add	a3,s0,a5
	lbu	a3,0(a3)
	sh	zero,0(a4)
	add	a2,s0,a3
	beq	a3,t0,.L168
	lbu	a0,1024(a2)
	andi	a3,a0,15
	beq	a3,zero,.L168
	lbu	a1,1280(a2)
	li	a2,9
	sub	t2,a2,a3
	sll	a2,a5,a1
	andi	a2,a2,511
	addi	t1,a3,-1
	sra	a2,a2,t2
	li	t2,1
	sll	t1,t2,t1
	add	a1,a3,a1
	li	t2,9
	bgt	a1,t2,.L168
	li	t2,-1
	sll	a3,t2,a3
	srai	a0,a0,4
	addi	a3,a3,1
	bge	a2,t1,.L169
	add	a2,a2,a3
.L169:
	slli	a3,a2,4
	add	a3,a3,a0
	slli	a3,a3,4
	addi	a2,a2,128
	add	a3,a3,a1
	bgtu	a2,t0,.L168
	sh	a3,0(a4)
.L168:
	addi	a5,a5,1
	li	a3,512
	addi	a4,a4,2
	bne	a5,a3,.L170
	j	.L167
.L223:
	lw	a5,0(sp)
	li	s0,8192
	addi	s0,s0,-1468
	add	s0,a5,s0
	add	s0,s0,a2
	j	.L165
.L157:
	lla	a5,.LC8
	la a4, .LANCHOR0; sw a5, 0(a4);
.L217:
	li	a0,0
.L228:
	lw	ra,92(sp)
	lw	s0,88(sp)
	lw	s1,84(sp)
	addi	sp,sp,96
	jr	ra
.L149:
	lla	a5,.LC7
	la a4, .LANCHOR0; sw a5, 0(a4);
	li	a0,0
	j	.L138
.L218:
	lla	a5,.LC6
	la a4, .LANCHOR0; sw a5, 0(a4);
	li	a0,0
	j	.L138
.L156:
	seqz	a0,a0
	j	.L138
.L222:
	li	t1,224
	addi	a5,a2,-2
	beq	a1,t1,.L225
	li	t1,238
	bne	a1,t1,.L177
	li	a1,11
	ble	a5,a1,.L177
	addi	a1,a3,3
	addi	a5,a3,9
	li	a3,65
	lla	t0,.LANCHOR3
	li	t1,1
	mv	t2,a3
	j	.L184
.L226:
	lbu	t2,0(t0)
.L184:
	sw	a1,20(a4)
	lbu	a3,-1(a1)
	addi	a1,a1,1
	addi	t0,t0,1
	sub	a3,a3,t2
	seqz	a3,a3
	neg	a3,a3
	and	t1,t1,a3
	bne	a1,a5,.L226
	addi	a5,a2,-8
	beq	t1,zero,.L181
	addi	a5,a0,12
	sw	a5,20(a4)
	lbu	a3,11(a0)
	li	a5,16384
	add	a5,s1,a5
	sw	a3,2024(a5)
	addi	a5,a2,-14
.L181:
	beq	a5,zero,.L188
	bge	a5,zero,.L187
	lw	a5,24(a4)
	li	a0,1
	sw	a5,20(a4)
	j	.L138
.L227:
	addi	a5,a5,-2
.L177:
	beq	a5,zero,.L188
.L187:
	lw	a3,20(a4)
	li	a0,1
	add	a5,a3,a5
	sw	a5,20(a4)
	j	.L138
.L224:
	lw	a4,0(a0)
	li	a2,1
	lw	a5,20(a4)
	addi	a3,a5,1
	sw	a3,20(a4)
	addi	a1,a5,2
	lbu	a3,0(a5)
	sw	a1,20(a4)
	lbu	a5,1(a5)
	slli	a3,a3,8
	add	a5,a5,a3
	bgt	a5,a2,.L227
	lla	a5,.LC9
	la a4, .LANCHOR0; sw a5, 0(a4);
	li	a0,0
	j	.L228
.L225:
	li	a1,4
	ble	a5,a1,.L177
	addi	a1,a3,3
	sw	a1,20(a4)
	addi	a5,a3,8
	li	a3,74
	mv	t0,a3
	lbu	a3,-1(a1)
	li	a0,1
	addi	a1,a1,1
	sub	a3,a3,t0
	seqz	a3,a3
	neg	a3,a3
	lla	t1,.LANCHOR2+1
	and	a0,a0,a3
	beq	a5,a1,.L179
.L229:
	lbu	t0,0(t1)
	sw	a1,20(a4)
	lbu	a3,-1(a1)
	addi	a1,a1,1
	addi	t1,t1,1
	sub	a3,a3,t0
	seqz	a3,a3
	neg	a3,a3
	and	a0,a0,a3
	bne	a5,a1,.L229
.L179:
	addi	a5,a2,-7
	beq	a0,zero,.L181
	li	a3,16384
	add	a3,s1,a3
	li	a2,1
	sw	a2,2020(a3)
	j	.L181
.L188:
	li	a0,1
	j	.L138
	.size	stbi__process_marker, .-stbi__process_marker
	.section	.text.stbi__resample_row_h_2,"ax",@progbits
	.align	2
	.type	stbi__resample_row_h_2, @function
stbi__resample_row_h_2:
	li	a2,1
	lbu	a4,0(a1)
	beq	a3,a2,.L240
	addi	sp,sp,-4
	sw	s0,0(sp)
	sb	a4,0(a0)
	lbu	t1,1(a1)
	slli	a5,a4,1
	add	a5,a5,a4
	add	a5,a5,t1
	addi	a5,a5,2
	srai	a5,a5,2
	sb	a5,1(a0)
	addi	t2,a3,-1
	ble	t2,a2,.L235
	addi	t0,a3,-2
	mv	a4,a1
	addi	t1,a0,2
	add	t0,t0,a1
.L234:
	lbu	s0,1(a4)
	lbu	a2,0(a4)
	addi	a4,a4,1
	slli	a5,s0,1
	add	a5,a5,s0
	addi	a5,a5,2
	add	a2,a2,a5
	srai	a2,a2,2
	sb	a2,0(t1)
	lbu	a2,1(a4)
	addi	t1,t1,2
	add	a5,a2,a5
	srai	a5,a5,2
	sb	a5,-1(t1)
	bne	t0,a4,.L234
	slli	a2,t2,1
	addi	a4,a2,1
.L233:
	add	a3,a1,a3
	lbu	a3,-2(a3)
	add	t2,a1,t2
	lbu	a1,0(t2)
	slli	a5,a3,1
	add	a5,a5,a3
	add	a5,a5,a1
	addi	a5,a5,2
	srai	a5,a5,2
	add	a2,a0,a2
	sb	a5,0(a2)
	lbu	a5,0(t2)
	add	a4,a0,a4
	sb	a5,0(a4)
	lw	s0,0(sp)
	addi	sp,sp,4
	jr	ra
.L240:
	sb	a4,1(a0)
	sb	a4,0(a0)
	ret
.L235:
	li	a4,3
	li	a2,2
	j	.L233
	.size	stbi__resample_row_h_2, .-stbi__resample_row_h_2
	.section	.text.stbi__free_jpeg_components.constprop.0,"ax",@progbits
	.align	2
	.type	stbi__free_jpeg_components.constprop.0, @function
stbi__free_jpeg_components.constprop.0:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	a1,0(sp)
	ble	a1,zero,.L242
	li	a5,16384
	addi	a5,a5,1736
	add	s1,a0,a5
	li	s0,0
.L246:
	lw	a0,4(s1)
	addi	s0,s0,1
	beq	a0,zero,.L243
	call	free
	sw	zero,4(s1)
	sw	zero,0(s1)
.L243:
	lw	a0,8(s1)
	beq	a0,zero,.L244
	call	free
	sw	zero,8(s1)
	sw	zero,16(s1)
.L244:
	lw	a0,12(s1)
	beq	a0,zero,.L245
	call	free
	sw	zero,12(s1)
.L245:
	lw	a5,0(sp)
	addi	s1,s1,72
	bne	s0,a5,.L246
.L242:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	li	a0,0
	addi	sp,sp,16
	jr	ra
	.size	stbi__free_jpeg_components.constprop.0, .-stbi__free_jpeg_components.constprop.0
	.globl	__divsi3
	.globl	__mulsi3
	.section	.text.stbi__malloc_mad3,"ax",@progbits
	.align	2
	.type	stbi__malloc_mad3, @function
stbi__malloc_mad3:
	or	a5,a0,a1
	blt	a5,zero,.L274
	addi	sp,sp,-20
	sw	s0,12(sp)
	sw	s1,8(sp)
	sw	ra,16(sp)
	mv	a4,a0
	mv	s1,a1
	mv	s0,a2
	beq	a1,zero,.L260
	sw	a0,0(sp)
	li	a0,-2147483648
	xori	a0,a0,-1
	sw	a3,4(sp)
	call	__divsi3
	lw	a4,0(sp)
	lw	a3,4(sp)
	bgt	a4,a0,.L258
.L260:
	sw	a3,0(sp)
	blt	s0,zero,.L258
	mv	a1,s1
	mv	a0,a4
	call	__mulsi3
	sw	a0,4(sp)
	lw	a3,0(sp)
	beq	s0,zero,.L261
	li	s1,-2147483648
	mv	a1,s0
	xori	a0,s1,-1
	call	__divsi3
	lw	a5,4(sp)
	bgt	a5,a0,.L258
	mv	a0,s0
	mv	a1,a5
	call	__mulsi3
	lw	a3,0(sp)
	not	s1,s1
	mv	s0,a0
	sub	s1,s1,a3
	ble	a0,s1,.L261
.L258:
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	li	a0,0
	addi	sp,sp,20
	jr	ra
.L261:
	add	a0,a3,s0
	lw	s0,12(sp)
	lw	ra,16(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	tail	malloc
.L274:
	li	a0,0
	ret
	.size	stbi__malloc_mad3, .-stbi__malloc_mad3
	.section	.rodata.stbi__jpeg_decode_block.str1.4,"aMS",@progbits,1
	.align	2
.LC12:
	.string	"bad huffman code"
	.section	.text.stbi__jpeg_decode_block,"ax",@progbits
	.align	2
	.type	stbi__jpeg_decode_block, @function
stbi__jpeg_decode_block:
	li	t1,16384
	add	t1,a0,t1
	lw	t0,1984(t1)
	addi	sp,sp,-36
	sw	s0,28(sp)
	sw	a1,12(sp)
	sw	ra,32(sp)
	sw	s1,24(sp)
	sw	a0,8(sp)
	li	t1,15
	sw	a3,16(sp)
	sw	a4,4(sp)
	mv	a1,a2
	mv	s0,a5
	ble	t0,t1,.L293
.L278:
	lw	a0,8(sp)
	call	stbi__jpeg_huff_decode
	blt	a0,zero,.L287
	sw	a0,0(sp)
	lw	a0,12(sp)
	li	a2,128
	li	a1,0
	call	memset
	lw	a4,0(sp)
	bne	a4,zero,.L281
	lw	a3,8(sp)
	li	a5,16384
	add	a5,a3,a5
	lw	a5,1984(a5)
.L282:
	sw	a5,0(sp)
	slli	a2,s0,3
	lw	a5,8(sp)
	add	a2,a2,s0
	slli	a2,a2,3
	add	a2,a5,a2
	li	s1,16384
	add	a2,s1,a2
	lw	a3,36(sp)
	lw	a1,1716(a2)
	li	s0,1
	lhu	a0,0(a3)
	add	a1,a4,a1
	sw	a1,1716(a2)
	call	__mulsi3
	lw	a5,8(sp)
	lw	a4,12(sp)
	add	s1,a5,s1
	sh	a0,0(a4)
	mv	a4,s1
	lw	a5,0(sp)
	mv	s1,s0
	mv	s0,a4
	j	.L291
.L284:
	lw	t1,1980(s0)
	lw	a4,4(sp)
	srli	a5,t1,23
	slli	a5,a5,1
	add	a5,a4,a5
	lh	a1,0(a5)
	beq	a1,zero,.L285
.L294:
	srai	a2,a1,4
	andi	a2,a2,15
	add	a2,a2,s1
	lla	a5,.LANCHOR1
	add	a5,a5,a2
	lbu	a5,0(a5)
	lw	a4,36(sp)
	lw	t0,1984(s0)
	slli	a5,a5,1
	add	a3,a4,a5
	lw	a4,12(sp)
	lhu	a0,0(a3)
	andi	t2,a1,15
	sll	a3,t1,t2
	sub	t1,t0,t2
	add	a5,a4,a5
	sw	a3,1980(s0)
	sw	t1,1984(s0)
	srai	a1,a1,8
	sw	a5,0(sp)
	addi	s1,a2,1
	call	__mulsi3
	lw	a5,0(sp)
	sh	a0,0(a5)
.L286:
	li	a5,63
	bgt	s1,a5,.L289
.L295:
	lw	a5,1984(s0)
.L291:
	li	a2,15
	bgt	a5,a2,.L284
	lw	a0,8(sp)
	call	stbi__grow_buffer_unsafe
	lw	t1,1980(s0)
	lw	a4,4(sp)
	srli	a5,t1,23
	slli	a5,a5,1
	add	a5,a4,a5
	lh	a1,0(a5)
	bne	a1,zero,.L294
.L285:
	lw	a1,16(sp)
	lw	a0,8(sp)
	call	stbi__jpeg_huff_decode
	blt	a0,zero,.L287
	andi	a5,a0,15
	bne	a5,zero,.L288
	li	a5,240
	bne	a0,a5,.L289
	addi	s1,s1,16
	li	a5,63
	ble	s1,a5,.L295
.L289:
	lw	ra,32(sp)
	lw	s0,28(sp)
	lw	s1,24(sp)
	li	a0,1
	addi	sp,sp,36
	jr	ra
.L287:
	lw	ra,32(sp)
	lw	s0,28(sp)
	lla	a5,.LC12
	la a4, .LANCHOR0; sw a5, 0(a4);
	lw	s1,24(sp)
	li	a0,0
	addi	sp,sp,36
	jr	ra
.L288:
	srai	a0,a0,4
	lw	t1,1984(s0)
	add	a0,a0,s1
	lla	a3,.LANCHOR1
	add	a3,a3,a0
	lbu	a2,0(a3)
	addi	s1,a0,1
	bgt	a5,t1,.L296
.L290:
	lw	a4,1980(s0)
	slli	a0,a5,2
	lw	a3,36(sp)
	lla	a1,.LANCHOR4
	add	a1,a1,a0
	lw	ra,0(a1)
	slli	a2,a2,1
	li	t0,32
	add	a0,a3,a2
	sll	t2,a4,a5
	sub	t1,t1,a5
	srai	a1,a4,31
	sub	t0,t0,a5
	lw	a5,12(sp)
	lhu	a0,0(a0)
	not	a1,a1
	and	a1,a1,ra
	srl	t0,a4,t0
	add	a2,a5,a2
	sw	t2,1980(s0)
	sw	t1,1984(s0)
	add	a1,a1,t0
	sw	a2,0(sp)
	call	__mulsi3
	lw	a2,0(sp)
	sh	a0,0(a2)
	j	.L286
.L296:
	lw	a0,8(sp)
	sw	a2,20(sp)
	sw	a5,0(sp)
	call	stbi__grow_buffer_unsafe
	lw	t1,1984(s0)
	lw	a2,20(sp)
	lw	a5,0(sp)
	j	.L290
.L293:
	sw	a2,0(sp)
	call	stbi__grow_buffer_unsafe
	lw	a1,0(sp)
	j	.L278
.L281:
	lw	a5,8(sp)
	li	a3,16384
	add	s1,a5,a3
	lw	a5,1984(s1)
	bgt	a4,a5,.L297
.L283:
	lw	a3,8(sp)
	li	a1,16384
	slli	a0,a4,2
	add	a1,a3,a1
	lw	a3,1980(a1)
	lla	a2,.LANCHOR4
	add	a2,a2,a0
	lw	t0,0(a2)
	li	a0,32
	srai	a2,a3,31
	sub	a0,a0,a4
	not	a2,a2
	sll	t1,a3,a4
	sub	a5,a5,a4
	srl	a3,a3,a0
	and	a4,a2,t0
	sw	t1,1980(a1)
	sw	a5,1984(a1)
	add	a4,a4,a3
	j	.L282
.L297:
	lw	a0,8(sp)
	sw	a4,0(sp)
	call	stbi__grow_buffer_unsafe
	lw	a5,1984(s1)
	lw	a4,0(sp)
	j	.L283
	.size	stbi__jpeg_decode_block, .-stbi__jpeg_decode_block
	.section	.rodata.stbi__jpeg_decode_block_prog_dc.part.0.str1.4,"aMS",@progbits,1
	.align	2
.LC13:
	.string	"can't merge dc and ac"
	.section	.text.stbi__jpeg_decode_block_prog_dc.part.0,"ax",@progbits
	.align	2
	.type	stbi__jpeg_decode_block_prog_dc.part.0, @function
stbi__jpeg_decode_block_prog_dc.part.0:
	li	a5,16384
	add	a5,a0,a5
	lw	t1,1984(a5)
	addi	sp,sp,-28
	sw	s0,20(sp)
	sw	s1,16(sp)
	sw	ra,24(sp)
	li	a5,15
	mv	s0,a0
	mv	a4,a1
	mv	s1,a2
	ble	t1,a5,.L311
.L299:
	li	a5,16384
	add	a5,s0,a5
	lw	t1,2008(a5)
	sw	a3,4(sp)
	sw	t1,0(sp)
	bne	t1,zero,.L300
	li	a2,128
	mv	a0,a4
	li	a1,0
	sw	a5,12(sp)
	sw	a4,8(sp)
	call	memset
	mv	a1,s1
	mv	a0,s0
	call	stbi__jpeg_huff_decode
	li	a2,-1
	lw	a4,8(sp)
	lw	a5,12(sp)
	lw	t1,0(sp)
	lw	a3,4(sp)
	mv	s1,a0
	beq	a0,a2,.L312
	bne	a0,zero,.L313
.L303:
	slli	a5,a3,3
	add	a3,a5,a3
	slli	a3,a3,3
	li	a5,16384
	add	a3,s0,a3
	add	a3,a5,a3
	lw	a2,1716(a3)
	add	a5,s0,a5
	lw	a5,2012(a5)
	add	s1,s1,a2
	sw	s1,1716(a3)
	sll	s1,s1,a5
	sh	s1,0(a4)
	li	t1,1
.L298:
	lw	ra,24(sp)
	lw	s0,20(sp)
	lw	s1,16(sp)
	mv	a0,t1
	addi	sp,sp,28
	jr	ra
.L300:
	lw	a3,1984(a5)
	ble	a3,zero,.L314
.L305:
	li	a5,16384
	add	s0,s0,a5
	lw	a5,1980(s0)
	addi	a3,a3,-1
	sw	a3,1984(s0)
	slli	a3,a5,1
	sw	a3,1980(s0)
	li	t1,1
	bge	a5,zero,.L298
	lw	a5,2012(s0)
	lhu	a3,0(a4)
	lw	ra,24(sp)
	lw	s0,20(sp)
	sll	a5,t1,a5
	add	a5,a5,a3
	sh	a5,0(a4)
	lw	s1,16(sp)
	mv	a0,t1
	addi	sp,sp,28
	jr	ra
.L311:
	sw	a3,4(sp)
	sw	a1,0(sp)
	call	stbi__grow_buffer_unsafe
	lw	a3,4(sp)
	lw	a4,0(sp)
	j	.L299
.L312:
	lw	ra,24(sp)
	lw	s0,20(sp)
	lla	a5,.LC13
	la a4, .LANCHOR0; sw a5, 0(a4);
	lw	s1,16(sp)
	mv	a0,t1
	addi	sp,sp,28
	jr	ra
.L313:
	lw	a0,1984(a5)
	bgt	s1,a0,.L315
.L304:
	li	a1,16384
	add	a1,s0,a1
	lw	a5,1980(a1)
	slli	t1,s1,2
	lla	a2,.LANCHOR4
	add	a2,a2,t1
	lw	t2,0(a2)
	li	t1,32
	srai	a2,a5,31
	sub	t1,t1,s1
	not	a2,a2
	sll	t0,a5,s1
	sub	a0,a0,s1
	and	a2,a2,t2
	srl	a5,a5,t1
	sw	t0,1980(a1)
	sw	a0,1984(a1)
	add	s1,a2,a5
	j	.L303
.L314:
	mv	a0,s0
	sw	a5,4(sp)
	sw	a4,0(sp)
	call	stbi__grow_buffer_unsafe
	lw	a5,4(sp)
	lw	a4,0(sp)
	lw	a3,1984(a5)
	j	.L305
.L315:
	mv	a0,s0
	sw	a5,8(sp)
	sw	a3,4(sp)
	sw	a4,0(sp)
	call	stbi__grow_buffer_unsafe
	lw	a5,8(sp)
	lw	a3,4(sp)
	lw	a4,0(sp)
	lw	a0,1984(a5)
	j	.L304
	.size	stbi__jpeg_decode_block_prog_dc.part.0, .-stbi__jpeg_decode_block_prog_dc.part.0
	.section	.rodata.stbi__decode_jpeg_header.str1.4,"aMS",@progbits,1
	.align	2
.LC14:
	.string	"no SOI"
	.align	2
.LC15:
	.string	"no SOF"
	.align	2
.LC16:
	.string	"bad SOF len"
	.align	2
.LC17:
	.string	"only 8-bit"
	.align	2
.LC18:
	.string	"no header height"
	.align	2
.LC19:
	.string	"0 width"
	.align	2
.LC20:
	.string	"bad component count"
	.align	2
.LC21:
	.string	"bad H"
	.align	2
.LC22:
	.string	"bad V"
	.align	2
.LC23:
	.string	"bad TQ"
	.globl	__udivsi3
	.align	2
.LC24:
	.string	"too large"
	.align	2
.LC25:
	.string	"outofmem"
	.section	.text.stbi__decode_jpeg_header,"ax",@progbits
	.align	2
	.type	stbi__decode_jpeg_header, @function
stbi__decode_jpeg_header:
	li	a3,16384
	add	a3,a0,a3
	li	a2,-1
	sb	a2,1988(a3)
	lw	a5,0(a0)
	sw	a2,2024(a3)
	sw	zero,2020(a3)
	lw	a2,20(a5)
	li	t1,255
	addi	a3,a2,1
	sw	a3,20(a5)
	lbu	a2,0(a2)
	bne	a2,t1,.L403
	addi	sp,sp,-48
	sw	s0,40(sp)
	sw	s1,36(sp)
	sw	ra,44(sp)
	mv	s1,a0
	mv	s0,a1
	li	a0,255
.L317:
	mv	a1,a3
	addi	a3,a3,1
	sw	a3,20(a5)
	lbu	a2,-1(a3)
	beq	a2,a0,.L317
	li	a3,216
	bne	a2,a3,.L319
	li	a3,1
	beq	s0,a3,.L345
	addi	a3,a1,2
	sw	a3,20(a5)
	lbu	a3,1(a1)
	bne	a3,a0,.L361
	addi	a3,a1,3
	li	a0,255
.L322:
	sw	a3,20(a5)
	lbu	a1,-1(a3)
	mv	a2,a3
	addi	a3,a3,1
	beq	a1,a0,.L322
	addi	a0,a1,-192
	li	a3,2
	bleu	a0,a3,.L323
.L331:
	mv	a0,s1
	call	stbi__process_marker
	beq	a0,zero,.L396
	li	a5,16384
	add	a5,s1,a5
	lbu	a1,1988(a5)
	li	a4,255
	beq	a1,a4,.L324
	li	a4,-1
	sb	a4,1988(a5)
.L325:
	addi	a5,a1,-192
	li	a4,2
	bgtu	a5,a4,.L331
	lw	a5,0(s1)
	lw	a2,20(a5)
.L323:
	addi	a1,a1,-194
	li	a0,16384
	seqz	a3,a1
	add	a0,s1,a0
	sw	a3,1996(a0)
	addi	a3,a2,1
	sw	a3,20(a5)
	addi	a1,a2,2
	lbu	a3,0(a2)
	sw	a1,20(a5)
	lbu	t0,1(a2)
	slli	a3,a3,8
	li	a1,10
	add	t0,t0,a3
	ble	t0,a1,.L359
	addi	a3,a2,3
	sw	a3,20(a5)
	lbu	a1,2(a2)
	li	a3,8
	beq	a1,a3,.L333
	lla	a5,.LC17
	la a4, .LANCHOR0; sw a5, 0(a4);
	li	a3,0
	j	.L316
.L319:
	lla	a5,.LC14
	la a4, .LANCHOR0; sw a5, 0(a4);
	li	a3,0
.L316:
	lw	ra,44(sp)
	lw	s0,40(sp)
	lw	s1,36(sp)
	mv	a0,a3
	addi	sp,sp,48
	jr	ra
.L352:
	mv	a1,a4
	mv	a0,a5
	call	__mulsi3
	addi	a0,a0,15
	call	malloc
	addi	a4,a0,15
	sw	a0,44(s0)
	andi	a4,a4,-16
	beq	a0,zero,.L402
	lw	a5,8(sp)
	lw	a5,1996(a5)
	sw	a4,40(s0)
	bne	a5,zero,.L404
.L356:
	lw	a4,12(sp)
	lw	a5,8(s1)
	addi	s0,s0,72
	addi	a4,a4,1
	sw	a4,12(sp)
	blt	a4,a5,.L358
.L345:
	lw	ra,44(sp)
	lw	s0,40(sp)
	li	a3,1
	lw	s1,36(sp)
	mv	a0,a3
	addi	sp,sp,48
	jr	ra
.L324:
	lw	a4,0(s1)
	lw	a3,20(a4)
	addi	a5,a3,1
	sw	a5,20(a4)
	lbu	a2,0(a3)
	bne	a2,a1,.L326
	addi	a5,a3,2
	li	a3,255
.L327:
	sw	a5,20(a4)
	lbu	a1,-1(a5)
	addi	a5,a5,1
	beq	a1,a3,.L327
	j	.L325
.L326:
	lw	a2,24(a4)
	li	a0,255
	addi	a3,a5,1
	bleu	a2,a5,.L405
.L328:
	sw	a3,20(a4)
	lbu	a1,0(a5)
	bne	a1,a0,.L362
	addi	a5,a5,2
	li	a3,255
.L330:
	sw	a5,20(a4)
	lbu	a1,-1(a5)
	addi	a5,a5,1
	beq	a1,a3,.L330
	j	.L325
.L362:
	mv	a5,a3
	addi	a3,a5,1
	bgtu	a2,a5,.L328
.L405:
	lw	ra,44(sp)
	lw	s0,40(sp)
	lla	a5,.LC15
	la a4, .LANCHOR0; sw a5, 0(a4);
	li	a3,0
	lw	s1,36(sp)
	mv	a0,a3
	addi	sp,sp,48
	jr	ra
.L403:
	lla	a5,.LC14
	li	a3,0
	la a4, .LANCHOR0; sw a5, 0(a4);
	mv	a0,a3
	ret
.L361:
	li	a1,255
	j	.L331
.L396:
	mv	a3,a0
	j	.L316
.L359:
	lla	a5,.LC16
	la a4, .LANCHOR0; sw a5, 0(a4);
	li	a3,0
	j	.L316
.L333:
	addi	a3,a2,4
	sw	a3,20(a5)
	addi	a3,a2,5
	lbu	a1,3(a2)
	sw	a3,20(a5)
	lbu	a3,4(a2)
	slli	a1,a1,8
	add	a3,a3,a1
	sw	a3,4(a5)
	beq	a3,zero,.L406
	addi	a1,a2,6
	sw	a1,20(a5)
	addi	a0,a2,7
	lbu	a1,5(a2)
	sw	a0,20(a5)
	lbu	t1,6(a2)
	slli	a1,a1,8
	add	a4,t1,a1
	sw	a4,8(sp)
	sw	a4,0(a5)
	beq	a4,zero,.L407
	addi	a0,a2,8
	sw	a0,20(a5)
	lbu	a2,7(a2)
	li	t2,1
	addi	a1,a2,-3
	andi	a1,a1,0xff
	bleu	a1,t2,.L336
	beq	a2,t2,.L336
	lla	a5,.LC20
	la a4, .LANCHOR0; sw a5, 0(a4);
	li	a3,0
	j	.L316
.L406:
	lla	a5,.LC18
	la a4, .LANCHOR0; sw a5, 0(a4);
	j	.L316
.L336:
	li	a1,16384
	addi	a1,a1,1736
	sw	a2,8(a5)
	add	a1,s1,a1
	li	t2,0
.L337:
	sw	zero,0(a1)
	sw	zero,12(a1)
	addi	t2,t2,1
	addi	a1,a1,72
	bgt	a2,t2,.L337
	slli	a1,a2,1
	add	a1,a1,a2
	addi	a1,a1,8
	bne	t0,a1,.L359
	li	a1,16384
	add	a4,s1,a1
	lla	t1,.LANCHOR5
	addi	a1,a1,1692
	sw	t1,0(sp)
	sw	zero,2028(a4)
	add	a1,s1,a1
	li	t1,0
	sw	a3,12(sp)
	j	.L344
.L339:
	sw	a3,20(a5)
	lw	a3,0(sp)
	lbu	t0,1(a0)
	addi	a0,a0,3
	addi	a3,a3,1
	sw	a3,0(sp)
	andi	a3,t0,15
	addi	t2,a3,-1
	srai	t0,t0,4
	andi	t2,t2,0xff
	sw	t0,4(a1)
	sw	t2,4(sp)
	beq	t0,zero,.L340
	li	t2,4
	bgt	t0,t2,.L340
	lw	t0,4(sp)
	sw	a3,8(a1)
	li	a3,3
	bgtu	t0,a3,.L408
	sw	a0,20(a5)
	lbu	t0,-1(a0)
	li	a3,3
	addi	a1,a1,72
	sw	t0,-60(a1)
	bgt	t0,a3,.L409
	ble	a2,t1,.L410
.L344:
	addi	t0,a0,1
	sw	t0,20(a5)
	lbu	t0,0(a0)
	li	t2,3
	addi	a3,a0,2
	sw	t0,0(a1)
	addi	t1,t1,1
	bne	a2,t2,.L339
	lw	t2,0(sp)
	lbu	t2,0(t2)
	bne	t0,t2,.L339
	lw	t0,2028(a4)
	addi	t0,t0,1
	sw	t0,2028(a4)
	j	.L339
.L407:
	lla	a5,.LC19
	la a4, .LANCHOR0; sw a5, 0(a4);
	li	a3,0
	j	.L316
.L410:
	sw	a5,16(sp)
	sw	a2,4(sp)
	lw	a3,12(sp)
	bne	s0,zero,.L345
	li	a5,-2147483648
	mv	a1,a3
	xori	a0,a5,-1
	sw	a3,0(sp)
	call	__divsi3
	lw	a1,8(sp)
	bgt	a1,a0,.L346
	lw	a2,4(sp)
	lw	a3,0(sp)
	lw	a5,16(sp)
	beq	a2,zero,.L363
	mv	a0,a3
	sw	a2,0(sp)
	call	__mulsi3
	lw	a2,0(sp)
	li	a5,-2147483648
	mv	t0,a0
	mv	a1,a2
	not	a0,a5
	sw	t0,0(sp)
	call	__divsi3
	lw	a4,0(sp)
	bgt	a4,a0,.L346
	li	a1,16384
	lw	a5,16(sp)
	lw	a2,4(sp)
	lw	a3,12(sp)
	addi	a1,a1,1696
	add	a1,s1,a1
	li	a0,0
	li	t0,1
	li	t1,1
.L348:
	lw	a4,0(a1)
	addi	a0,a0,1
	bge	t1,a4,.L349
	mv	t1,a4
.L349:
	lw	a4,4(a1)
	addi	a1,a1,72
	bge	t0,a4,.L350
	mv	t0,a4
.L350:
	bgt	a2,a0,.L348
	sw	t1,0(sp)
	sw	t0,4(sp)
	j	.L347
.L363:
	li	a4,1
	sw	a4,4(sp)
	sw	a4,0(sp)
.L347:
	lw	a4,0(sp)
	sw	a3,20(sp)
	sw	a2,16(sp)
	lw	a3,4(sp)
	lw	a2,8(sp)
	li	t1,16384
	slli	a1,a4,3
	slli	t2,a3,3
	addi	a0,a2,-1
	sw	a5,28(sp)
	add	a5,s1,t1
	sw	a4,1668(a5)
	sw	a3,1672(a5)
	sw	a1,1684(a5)
	sw	t2,1688(a5)
	add	a0,a0,a1
	sw	a5,8(sp)
	sw	t2,12(sp)
	call	__udivsi3
	lw	a3,20(sp)
	lw	a5,8(sp)
	lw	t2,12(sp)
	addi	a3,a3,-1
	sw	a0,1676(a5)
	mv	a1,t2
	add	a0,a3,t2
	call	__udivsi3
	lw	a5,8(sp)
	lw	a2,16(sp)
	sw	a0,1680(a5)
	beq	a2,zero,.L345
	lw	a3,4(sp)
	lw	a4,0(sp)
	li	t1,16384
	addi	a5,a3,-1
	sw	a5,24(sp)
	addi	a5,a4,-1
	sw	a5,20(sp)
	lw	a5,28(sp)
	addi	t1,t1,1696
	add	t1,s1,t1
	sw	s1,16(sp)
	sw	s0,12(sp)
	mv	s1,a5
	mv	s0,t1
.L358:
	lw	a5,0(s0)
	lw	a1,0(s1)
	mv	a0,a5
	sw	a5,28(sp)
	call	__mulsi3
	lw	a5,20(sp)
	lw	a1,0(sp)
	add	a0,a0,a5
	call	__udivsi3
	lw	a4,4(s0)
	sw	a0,24(s0)
	lw	a1,4(s1)
	mv	a0,a4
	sw	a4,32(sp)
	call	__mulsi3
	lw	a5,24(sp)
	lw	a1,4(sp)
	add	a0,a0,a5
	call	__udivsi3
	lw	a5,8(sp)
	sw	a0,28(s0)
	lw	a1,1676(a5)
	lw	a5,28(sp)
	mv	a0,a5
	call	__mulsi3
	slli	a5,a0,3
	sw	a5,32(s0)
	sw	a5,28(sp)
	lw	a5,8(sp)
	lw	a4,32(sp)
	lw	a1,1680(a5)
	mv	a0,a4
	call	__mulsi3
	lw	a5,28(sp)
	slli	a4,a0,3
	mv	a3,a0
	sw	a4,36(s0)
	li	a0,-2147483648
	sw	zero,56(s0)
	sw	zero,48(s0)
	sw	zero,52(s0)
	or	a2,a5,a4
	mv	a1,a4
	xori	a0,a0,-1
	blt	a2,zero,.L351
	beq	a3,zero,.L352
	sw	a4,32(sp)
	call	__divsi3
	lw	a5,28(sp)
	lw	a4,32(sp)
	ble	a5,a0,.L352
.L351:
	lw	s0,12(sp)
	lw	s1,16(sp)
	li	a3,16384
	slli	a5,s0,3
	add	a5,a5,s0
	slli	a5,a5,3
	add	a5,s1,a5
	add	a5,a3,a5
	sw	zero,1740(a5)
.L401:
	lla	a5,.LC25
	addi	a1,s0,1
	mv	a0,s1
	la a4, .LANCHOR0; sw a5, 0(a4);
	call	stbi__free_jpeg_components.constprop.0
	snez	a3,a0
	j	.L316
.L404:
	lw	a0,32(s0)
	lw	a1,36(s0)
	li	a3,15
	srai	a4,a0,31
	srai	a5,a1,31
	andi	a4,a4,7
	andi	a5,a5,7
	add	a4,a4,a0
	add	a5,a5,a1
	srai	a4,a4,3
	srai	a5,a5,3
	sw	a4,60(s0)
	sw	a5,64(s0)
	li	a2,2
	call	stbi__malloc_mad3
	addi	a4,a0,15
	sw	a0,48(s0)
	andi	a4,a4,-16
	beq	a0,zero,.L402
	sw	a4,56(s0)
	j	.L356
.L402:
	lw	s1,16(sp)
	lw	s0,12(sp)
	j	.L401
.L346:
	lla	a5,.LC24
	la a4, .LANCHOR0; sw a5, 0(a4);
	li	a3,0
	j	.L316
.L409:
	lla	a5,.LC23
	la a4, .LANCHOR0; sw a5, 0(a4);
	li	a3,0
	j	.L316
.L408:
	lla	a5,.LC22
	la a4, .LANCHOR0; sw a5, 0(a4);
	li	a3,0
	j	.L316
.L340:
	lla	a5,.LC21
	la a4, .LANCHOR0; sw a5, 0(a4);
	li	a3,0
	j	.L316
	.size	stbi__decode_jpeg_header, .-stbi__decode_jpeg_header
	.section	.rodata.stbi__load_and_postprocess_8bit.str1.4,"aMS",@progbits,1
	.align	2
.LC26:
	.string	"Assertion `ri.bits_per_channel == 8 || ri.bits_per_channel == 16' failed"
	.align	2
.LC27:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/201.jpeg/jpeg.c:553  \n"
	.align	2
.LC28:
	.string	"unknown image type"
	.align	2
.LC29:
	.string	"bad req_comp"
	.align	2
.LC30:
	.string	"bad SOS component count"
	.align	2
.LC31:
	.string	"bad SOS len"
	.align	2
.LC32:
	.string	"bad DC huff"
	.align	2
.LC33:
	.string	"bad AC huff"
	.align	2
.LC34:
	.string	"bad SOS"
	.align	2
.LC35:
	.string	"bad DNL len"
	.align	2
.LC36:
	.string	"bad DNL height"
	.section	.text.stbi__load_and_postprocess_8bit,"ax",@progbits
	.align	2
	.type	stbi__load_and_postprocess_8bit, @function
stbi__load_and_postprocess_8bit:
	addi	sp,sp,-272
	mv	t1,a1
	mv	a5,a2
	sw	s0,264(sp)
	li	a2,12
	mv	s0,a0
	li	a1,0
	addi	a0,sp,104
	sw	t1,72(sp)
	sw	a3,80(sp)
	sw	a4,52(sp)
	sw	ra,268(sp)
	sw	a5,76(sp)
	sw	s1,260(sp)
	call	memset
	li	a0,20480
	li	a5,8
	addi	a0,a0,-2036
	sw	a5,104(sp)
	sw	zero,112(sp)
	sw	zero,108(sp)
	call	malloc
	lw	a5,20(s0)
	li	a4,16384
	sw	s0,0(a0)
	add	a4,a0,a4
	li	a3,-1
	addi	a2,a5,1
	sw	zero,2020(a4)
	sw	a3,2024(a4)
	sb	a3,1988(a4)
	sw	a2,20(s0)
	lbu	a3,0(a5)
	li	a4,255
	addi	a5,a5,2
	li	t1,255
	bne	a3,a4,.L787
.L413:
	sw	a5,20(s0)
	lbu	a4,-1(a5)
	addi	a5,a5,1
	beq	a4,t1,.L413
	li	a2,216
	lw	a5,32(s0)
	lw	a3,28(s0)
	bne	a4,a2,.L412
	sw	a3,20(s0)
	sw	a5,24(s0)
	call	free
	li	a5,20480
	addi	a0,a5,-2036
	call	malloc
	lw	a3,52(sp)
	sw	s0,0(a0)
	sw	zero,8(s0)
	li	a4,4
	mv	s1,a0
	li	a5,20480
	bgtu	a3,a4,.L788
	li	s0,16384
	add	s0,a0,s0
	sw	zero,1740(s0)
	sw	zero,1744(s0)
	sw	zero,1812(s0)
	sw	zero,1816(s0)
	sw	zero,1884(s0)
	sw	zero,1888(s0)
	sw	zero,1956(s0)
	sw	zero,1960(s0)
	add	a5,a0,a5
	li	a1,0
	sw	zero,-2044(a5)
	call	stbi__decode_jpeg_header
	li	t1,255
	beq	a0,zero,.L417
	lbu	a1,1988(s0)
	beq	a1,t1,.L419
	li	a5,-1
	sb	a5,1988(s0)
.L420:
	li	a5,217
	beq	a1,a5,.L423
.L421:
	addi	a5,s1,4
	sw	a5,64(sp)
.L549:
	li	a5,218
	beq	a1,a5,.L789
	li	a5,220
	bne	a1,a5,.L543
	lw	a4,0(s1)
	li	a0,4
	lw	a5,20(a4)
	addi	a3,a5,1
	sw	a3,20(a4)
	addi	a3,a5,2
	lbu	a1,0(a5)
	addi	a2,a5,3
	sw	a3,20(a4)
	lbu	a3,1(a5)
	addi	t1,a5,4
	sw	a2,20(a4)
	lbu	a2,2(a5)
	sw	t1,20(a4)
	lbu	a5,3(a5)
	slli	a1,a1,8
	slli	a2,a2,8
	add	a3,a3,a1
	add	a5,a5,a2
	bne	a3,a0,.L790
	lw	a3,4(a4)
	bne	a5,a3,.L545
.L546:
	li	a5,16384
	add	a5,s1,a5
	lbu	a1,1988(a5)
.L540:
	li	a5,255
	bne	a1,a5,.L538
	lw	a2,0(s1)
	lw	a5,20(a2)
.L542:
	addi	a4,a5,1
	sw	a4,20(a2)
	lbu	a3,0(a5)
	li	a4,255
	bne	a3,a4,.L635
	addi	a5,a5,2
.L548:
	sw	a5,20(a2)
	lbu	a1,-1(a5)
	addi	a5,a5,1
	beq	a1,a4,.L548
	li	a5,217
	bne	a1,a5,.L549
.L423:
	lw	s0,0(s1)
	li	a5,16384
	add	a4,s1,a5
	lw	a3,8(s0)
	lw	a4,1996(a4)
	mv	t0,s0
	sw	a3,20(sp)
	bne	a4,zero,.L791
.L550:
	lw	a5,52(sp)
	bne	a5,zero,.L638
	lw	a4,20(sp)
	li	a5,2
	ble	a4,a5,.L639
	li	a5,3
	sw	a5,32(sp)
.L557:
	lw	a3,20(sp)
	li	a5,3
	beq	a3,a5,.L792
.L558:
	lw	a5,0(s0)
	lw	a4,20(sp)
	sw	zero,116(sp)
	sw	zero,120(sp)
	sw	zero,124(sp)
	sw	zero,128(sp)
	sw	zero,48(sp)
	mv	t1,a5
	ble	a4,zero,.L562
.L561:
	li	a3,16384
	addi	a3,a3,1696
	add	a3,s1,a3
	addi	s0,sp,132
	sw	s1,4(sp)
	mv	t1,a5
	mv	s1,s0
	sw	zero,8(sp)
	mv	s0,a3
	j	.L566
.L564:
	li	ra,2
	lla	a0,stbi__resample_row_generic
	beq	a4,ra,.L793
.L565:
	lw	a5,8(sp)
	lw	a4,20(sp)
	sw	a1,8(s1)
	addi	a5,a5,1
	sw	a1,4(s1)
	sw	a0,0(s1)
	sw	a5,8(sp)
	addi	s0,s0,72
	addi	s1,s1,32
	bge	a5,a4,.L794
.L566:
	addi	a0,t1,3
	call	malloc
	sw	a0,52(s0)
	beq	a0,zero,.L795
	lw	a5,4(sp)
	li	a2,16384
	lw	a1,0(s0)
	add	a2,a5,a2
	lw	a0,1668(a2)
	sw	a2,12(sp)
	call	__divsi3
	lw	a2,12(sp)
	mv	a4,a0
	lw	a1,4(s0)
	lw	a0,1672(a2)
	sw	a4,12(s1)
	sw	a4,12(sp)
	call	__divsi3
	lw	a5,4(sp)
	lw	a4,12(sp)
	srai	t2,a0,1
	lw	t0,0(a5)
	sw	a0,16(s1)
	sw	a0,24(sp)
	lw	t1,0(t0)
	mv	a1,a4
	sw	t2,24(s1)
	addi	a0,t1,-1
	add	a0,a0,a4
	sw	t0,28(sp)
	sw	t1,16(sp)
	call	__udivsi3
	lw	a4,12(sp)
	sw	a0,20(s1)
	sw	zero,28(s1)
	li	t2,1
	lw	a1,40(s0)
	lw	t1,16(sp)
	lw	a2,24(sp)
	lw	t0,28(sp)
	bne	a4,t2,.L564
	lla	a0,resample_row_1
	beq	a2,a4,.L565
	li	a4,2
	lla	a0,stbi__resample_row_generic
	bne	a2,a4,.L565
	lla	a0,stbi__resample_row_v_2
	j	.L565
.L787:
	lw	a5,32(s0)
	lw	a3,28(s0)
.L412:
	sw	a5,24(s0)
	sw	a3,20(s0)
	call	free
	lla	a5,.LC28
	la a4, .LANCHOR0; sw a5, 0(a4);
	sw	zero,28(sp)
.L411:
	lw	ra,268(sp)
	lw	s0,264(sp)
	lw	a0,28(sp)
	lw	s1,260(sp)
	addi	sp,sp,272
	jr	ra
.L436:
	bne	a3,zero,.L440
	lw	a3,16(sp)
	bne	a3,zero,.L440
	bne	a0,zero,.L440
	li	a0,-1
	li	a3,20480
	sb	a0,1988(a5)
	add	a3,s1,a3
	lw	a1,-2044(a3)
	li	t1,63
	sw	t1,2004(a5)
	sw	zero,1984(a5)
	sw	zero,1980(a5)
	sw	a0,1992(a5)
	sw	zero,1932(a5)
	sw	zero,1860(a5)
	sw	zero,1788(a5)
	sw	zero,1716(a5)
	bne	a1,zero,.L780
	li	a1,-2147483648
	xori	a1,a1,-1
.L780:
	sw	a1,-2040(a3)
	sw	zero,2016(a5)
	li	a5,1
	beq	t2,a5,.L444
	li	a5,16384
	add	a5,s1,a5
	sw	a5,40(sp)
	lw	a5,1680(a5)
	sw	zero,56(sp)
	ble	a5,zero,.L614
	sw	s1,8(sp)
.L445:
	lw	a5,40(sp)
	sw	zero,48(sp)
	lw	a5,1676(a5)
	ble	a5,zero,.L472
.L476:
	lw	a5,40(sp)
	lw	a5,2032(a5)
	ble	a5,zero,.L474
	lw	a3,8(sp)
	li	a5,16384
	addi	a4,a5,2036
	li	a5,8192
	addi	a5,a5,-1468
	add	a5,a3,a5
	sw	a5,96(sp)
	add	a5,a3,a4
	sw	a5,60(sp)
	li	a5,12288
	addi	a5,a5,1668
	sw	zero,88(sp)
	sw	a5,100(sp)
.L467:
	lw	a5,60(sp)
	lw	a3,8(sp)
	lw	a1,56(sp)
	lw	a5,0(a5)
	sw	zero,84(sp)
	slli	s0,a5,3
	add	s0,s0,a5
	slli	s0,s0,3
	add	s0,a3,s0
	sw	a5,16(sp)
	li	a5,16384
	add	s0,a5,s0
	lw	a5,1728(s0)
	lw	a4,1696(s0)
	lw	s1,1700(s0)
	sw	a5,36(sp)
	slli	a5,a5,3
	mv	a0,a5
	sw	a4,12(sp)
	sw	a5,92(sp)
	call	__mulsi3
	mv	a1,s1
	sw	s1,68(sp)
	call	__mulsi3
	lw	a1,48(sp)
	mv	s1,a0
	lw	a0,12(sp)
	call	__mulsi3
	lw	a3,1708(s0)
	lw	a2,1736(s0)
	slli	a0,a0,3
	add	s1,s1,a0
	slli	a4,a3,3
	lw	t0,1712(s0)
	sub	a4,a4,a3
	add	a2,a2,s1
	slli	a1,a4,4
	sw	a2,44(sp)
	lw	a2,64(sp)
	sub	a1,a1,a4
	slli	a5,t0,3
	slli	a1,a1,4
	sub	a5,a5,t0
	add	a2,a2,a1
	lw	t1,1704(s0)
	slli	a3,a5,4
	sw	a2,20(sp)
	lw	a2,96(sp)
	sub	a3,a3,a5
	slli	a3,a3,4
	lw	a0,100(sp)
	add	a2,a2,a3
	addi	t1,t1,105
	lw	a3,8(sp)
	slli	a4,t0,10
	slli	a5,t1,7
	add	a4,a4,a0
	addi	a5,a5,4
	lw	s1,68(sp)
	add	a4,a3,a4
	add	a5,a3,a5
	sw	a2,24(sp)
	sw	a4,28(sp)
	sw	a5,32(sp)
	addi	s0,sp,132
	ble	s1,zero,.L462
	mv	s1,s0
.L461:
	lw	a5,12(sp)
	sw	zero,4(sp)
	lw	s0,44(sp)
	bgt	a5,zero,.L464
	j	.L466
.L796:
	lw	a5,4(sp)
	lw	a1,36(sp)
	mv	a0,s0
	addi	a5,a5,1
	mv	a2,s1
	sw	a5,4(sp)
	call	stbi__idct_block
	lw	a4,12(sp)
	lw	a5,4(sp)
	addi	s0,s0,8
	beq	a4,a5,.L466
.L464:
	lw	a5,32(sp)
	lw	a4,28(sp)
	lw	a3,24(sp)
	sw	a5,0(sp)
	lw	a2,20(sp)
	lw	a5,16(sp)
	lw	a0,8(sp)
	mv	a1,s1
	call	stbi__jpeg_decode_block
	bne	a0,zero,.L796
	lw	s1,8(sp)
.L417:
	lw	a5,0(s1)
	lw	ra,8(a5)
.L427:
	mv	a1,ra
	mv	a0,s1
	call	stbi__free_jpeg_components.constprop.0
	mv	a0,s1
	call	free
	sw	zero,28(sp)
	j	.L411
.L788:
	lla	a5,.LC29
	sw	zero,28(sp)
	la a4, .LANCHOR0; sw a5, 0(a4);
	call	free
	lw	ra,268(sp)
	lw	s0,264(sp)
	lw	a0,28(sp)
	lw	s1,260(sp)
	addi	sp,sp,272
	jr	ra
.L538:
	li	a5,16384
	add	a5,s1,a5
	li	a4,-1
	sb	a4,1988(a5)
	li	a5,217
	bne	a1,a5,.L549
	j	.L423
.L635:
	li	a1,255
.L543:
	mv	a0,s1
	call	stbi__process_marker
	bne	a0,zero,.L546
	j	.L417
.L793:
	lla	a0,stbi__resample_row_h_2
	beq	a2,t2,.L565
	lla	a0,stbi__resample_row_generic
	bne	a2,a4,.L565
	lla	a0,stbi__resample_row_hv_2
	j	.L565
.L789:
	lw	a2,0(s1)
	li	t0,16384
	add	t1,s1,t0
	lw	a5,20(a2)
	lw	ra,8(a2)
	li	a3,3
	addi	a4,a5,1
	sw	a4,20(a2)
	addi	a1,a5,2
	lbu	a4,0(a5)
	addi	a0,a5,3
	sw	a1,20(a2)
	lbu	a1,1(a5)
	sw	a0,20(a2)
	lbu	t2,2(a5)
	sw	t2,2032(t1)
	addi	t1,t2,-1
	bgtu	t1,a3,.L425
	bgt	t2,ra,.L425
	slli	a4,a4,8
	addi	a3,t2,3
	add	a4,a4,a1
	slli	a3,a3,1
	bne	a4,a3,.L428
	ble	t2,zero,.L430
	slli	a4,t2,1
	addi	a4,a4,3
	addi	t0,t0,2036
	add	a5,a5,a4
	sw	t2,4(sp)
	li	s0,16384
	add	t0,s1,t0
	mv	t2,a5
.L435:
	addi	a5,a0,1
	sw	a5,20(a2)
	lbu	a1,0(a0)
	addi	a0,a0,2
	sw	a0,20(a2)
	lbu	t1,-1(a0)
	ble	ra,zero,.L620
	li	a5,16384
	addi	a5,a5,1692
	add	a4,s1,a5
	li	a5,0
	j	.L432
.L797:
	addi	a5,a5,1
	addi	a4,a4,72
	beq	a5,ra,.L427
.L432:
	lw	a3,0(a4)
	bne	a1,a3,.L797
.L431:
	beq	a5,ra,.L427
	slli	a4,a5,3
	add	a4,a4,a5
	slli	a4,a4,3
	add	a4,s1,a4
	srai	a3,t1,4
	add	a4,s0,a4
	sw	a3,1708(a4)
	li	a1,3
	bgt	a3,a1,.L798
	andi	a3,t1,15
	sw	a3,1712(a4)
	andi	t1,t1,12
	bne	t1,zero,.L799
	sw	a5,0(t0)
	addi	t0,t0,4
	bne	t2,a0,.L435
	lw	t2,4(sp)
.L430:
	addi	a5,a0,1
	sw	a5,20(a2)
	lbu	a3,0(a0)
	li	a5,16384
	add	a5,s1,a5
	sw	a3,2000(a5)
	addi	a4,a0,2
	sw	a4,20(a2)
	lbu	a1,1(a0)
	addi	a4,a0,3
	lw	t1,1996(a5)
	sw	a1,2004(a5)
	sw	a4,20(a2)
	lbu	a0,2(a0)
	srai	t0,a0,4
	andi	a0,a0,15
	sw	t0,16(sp)
	sw	t0,2008(a5)
	sw	a0,2012(a5)
	beq	t1,zero,.L436
	li	t1,63
	bgt	a3,t1,.L440
	bgt	a1,t1,.L440
	bgt	a3,a1,.L440
	li	a3,13
	bgt	t0,a3,.L440
	bgtu	a0,a3,.L440
	li	a0,-1
	li	a3,20480
	sb	a0,1988(a5)
	add	a3,s1,a3
	lw	a1,-2044(a3)
	sw	zero,1984(a5)
	sw	zero,1980(a5)
	sw	a0,1992(a5)
	sw	zero,1932(a5)
	sw	zero,1860(a5)
	sw	zero,1788(a5)
	sw	zero,1716(a5)
	bne	a1,zero,.L781
	li	a1,-2147483648
	xori	a1,a1,-1
.L781:
	sw	a1,-2040(a3)
	sw	zero,2016(a5)
	li	a5,1
	beq	t2,a5,.L477
	li	t1,16384
	add	t1,s1,t1
	lw	a5,1680(t1)
	sw	zero,40(sp)
	ble	a5,zero,.L614
	sw	s1,4(sp)
.L478:
	lw	a5,1676(t1)
	sw	zero,36(sp)
	ble	a5,zero,.L533
.L536:
	lw	a3,4(sp)
	li	a4,16384
	addi	a4,a4,2036
	lw	a5,2032(t1)
	add	a4,a3,a4
	sw	a4,48(sp)
	sw	zero,56(sp)
	ble	a5,zero,.L535
.L529:
	lw	a5,48(sp)
	li	a4,16384
	sw	zero,32(sp)
	lw	a5,0(a5)
	slli	s0,a5,3
	add	s0,s0,a5
	sw	a5,44(sp)
	lw	a5,4(sp)
	slli	s0,s0,3
	add	a5,a5,s0
	sw	a5,28(sp)
	add	a5,a4,a5
	lw	a1,1700(a5)
	mv	a4,t1
	ble	a1,zero,.L524
.L523:
	lw	a3,28(sp)
	li	a5,16384
	li	s1,0
	add	a5,a5,a3
	lw	s0,1696(a5)
	bgt	s0,zero,.L527
	j	.L528
.L525:
	slli	a0,a2,3
	sub	a0,a0,a2
	slli	a2,a0,4
	sw	a5,20(sp)
	sub	a2,a2,a0
	lw	a5,4(sp)
	lw	a0,40(sp)
	slli	a2,a2,4
	addi	a2,a2,4
	add	a2,a5,a2
	sw	t0,12(sp)
	sw	a2,8(sp)
	sw	a4,24(sp)
	sw	a3,16(sp)
	call	__mulsi3
	lw	a4,32(sp)
	lw	a3,16(sp)
	add	a0,a0,a4
	mv	a1,a3
	call	__mulsi3
	lw	a1,36(sp)
	mv	a3,a0
	mv	a0,s0
	mv	s0,a3
	call	__mulsi3
	add	a1,a0,s1
	lw	t0,12(sp)
	add	a3,s0,a1
	slli	a1,a3,7
	lw	a2,8(sp)
	lw	a3,44(sp)
	lw	a0,4(sp)
	add	a1,t0,a1
	call	stbi__jpeg_decode_block_prog_dc.part.0
	lw	a5,20(sp)
	lw	a4,24(sp)
	beq	a0,zero,.L800
	lw	s0,1696(a5)
	addi	s1,s1,1
	lw	a1,1700(a5)
	ble	s0,s1,.L528
.L527:
	lw	a3,28(sp)
	lw	a0,2004(a4)
	li	a5,16384
	add	a5,a5,a3
	lw	t0,1752(a5)
	lw	a3,1756(a5)
	lw	a2,1708(a5)
	beq	a0,zero,.L525
	lw	s1,4(sp)
.L784:
	lw	a5,0(s1)
	lla	a4,.LC13
	la a3, .LANCHOR0; sw a4, 0(a3);
	lw	ra,8(a5)
	j	.L427
.L425:
	lla	a5,.LC30
	la a4, .LANCHOR0; sw a5, 0(a4);
	j	.L427
.L794:
	lw	s1,4(sp)
.L562:
	lw	a2,4(t0)
	lw	a0,32(sp)
	li	a3,1
	mv	a1,t1
	call	stbi__malloc_mad3
	sw	a0,28(sp)
	beq	a0,zero,.L567
	lw	s0,0(s1)
	sw	zero,24(sp)
	sw	zero,40(sp)
	lw	a5,4(s0)
	beq	a5,zero,.L569
	sw	s1,36(sp)
.L601:
	lw	a1,0(s0)
	lw	a0,24(sp)
	call	__mulsi3
	lw	a5,28(sp)
	add	t0,a5,a0
	lw	a5,20(sp)
	ble	a5,zero,.L578
	lw	a4,36(sp)
	li	a5,16384
	addi	a5,a5,1724
	li	t1,0
	sw	t0,44(sp)
	addi	s0,sp,132
	add	a5,a4,a5
	mv	t0,t1
.L577:
	lw	a4,16(s0)
	lw	t1,8(s0)
	lw	s1,24(s0)
	sw	a4,4(sp)
	srai	a4,a4,1
	lw	t2,0(s0)
	lw	a0,24(a5)
	lw	a2,4(s0)
	mv	a1,t1
	bge	s1,a4,.L573
	mv	a1,a2
	mv	a2,t1
.L573:
	lw	a4,12(s0)
	lw	a3,20(s0)
	sw	a5,16(sp)
	sw	t0,12(sp)
	sw	t1,8(sp)
	jalr	t2
	lw	t0,12(sp)
	addi	a5,sp,116
	addi	s1,s1,1
	slli	a4,t0,2
	add	a4,a5,a4
	sw	a0,0(a4)
	lw	a4,4(sp)
	lw	t1,8(sp)
	lw	a5,16(sp)
	ble	a4,s1,.L574
	sw	s1,24(s0)
.L575:
	lw	a4,20(sp)
	addi	t0,t0,1
	addi	s0,s0,32
	addi	a5,a5,72
	bne	a4,t0,.L577
	lw	a5,36(sp)
	lw	t0,44(sp)
	lw	s0,0(a5)
.L578:
	lw	a3,32(sp)
	li	a5,2
	lw	a4,0(s0)
	ble	a3,a5,.L801
	lw	a3,8(s0)
	li	a2,3
	lw	s1,116(sp)
	beq	a3,a2,.L802
	li	a2,4
	bne	a3,a2,.L803
	lw	a2,36(sp)
	li	a3,16384
	add	a3,a2,a3
	lw	a1,2024(a3)
	beq	a1,zero,.L804
	lw	a2,120(sp)
	lw	a3,124(sp)
	beq	a1,a5,.L805
.L587:
	lw	a5,32(sp)
	mv	a1,s1
	mv	a0,t0
	call	stbi__YCbCr_to_RGB_row
	lw	a5,36(sp)
	lw	s0,0(a5)
.L581:
	lw	a4,40(sp)
	lw	a3,24(sp)
	lw	a2,32(sp)
	lw	a5,4(s0)
	addi	a4,a4,1
	add	a3,a3,a2
	sw	a4,40(sp)
	sw	a3,24(sp)
	bltu	a4,a5,.L601
	lw	s1,36(sp)
.L569:
	lw	a1,8(s0)
	mv	a0,s1
	call	stbi__free_jpeg_components.constprop.0
	lw	a5,0(s1)
	lw	a3,72(sp)
	lw	a4,0(a5)
	sw	a4,0(a3)
	lw	a4,4(a5)
	lw	a3,76(sp)
	sw	a4,0(a3)
	lw	a3,80(sp)
	beq	a3,zero,.L602
	lw	a5,8(a5)
	li	a4,2
	sgt	a5,a5,a4
	slli	a5,a5,1
	addi	a5,a5,1
	sw	a5,0(a3)
.L602:
	mv	a0,s1
	call	free
	lw	a5,104(sp)
	li	a4,8
	beq	a5,a4,.L411
	li	a4,16
	bne	a5,a4,.L806
	lw	a5,72(sp)
	lw	a0,0(a5)
	lw	a5,76(sp)
	lw	a1,0(a5)
	lw	a5,52(sp)
	bne	a5,zero,.L608
	lw	a5,80(sp)
	lw	a5,0(a5)
	sw	a5,52(sp)
.L608:
	call	__mulsi3
	lw	a1,52(sp)
	call	__mulsi3
	mv	s0,a0
	call	malloc
	mv	s1,a0
	beq	a0,zero,.L609
	ble	s0,zero,.L612
	lw	a4,28(sp)
	slli	a2,s0,1
	mv	a3,a0
	mv	a5,a4
	add	a2,a2,a4
.L611:
	lhu	a4,0(a5)
	addi	a3,a3,1
	addi	a5,a5,2
	srli	a4,a4,8
	sb	a4,-1(a3)
	bne	a2,a5,.L611
.L612:
	lw	a0,28(sp)
	call	free
	lw	ra,268(sp)
	lw	s0,264(sp)
	sw	s1,28(sp)
	lw	a0,28(sp)
	lw	s1,260(sp)
	addi	sp,sp,272
	jr	ra
.L574:
	lw	a4,28(s0)
	lw	a3,0(a5)
	sw	zero,24(s0)
	addi	a4,a4,1
	sw	t1,4(s0)
	sw	a4,28(s0)
	bge	a4,a3,.L575
	lw	a4,4(a5)
	add	t1,t1,a4
	sw	t1,8(s0)
	j	.L575
.L801:
	lw	a3,48(sp)
	beq	a3,zero,.L589
	lw	a3,32(sp)
	li	a5,1
	beq	a3,a5,.L590
	beq	a4,zero,.L581
	lw	s1,116(sp)
	lw	ra,120(sp)
	lw	t2,124(sp)
	li	a2,0
.L593:
	add	a5,s1,a2
	lbu	a0,0(a5)
	add	a5,ra,a2
	lbu	a4,0(a5)
	add	a5,t2,a2
	lbu	a1,0(a5)
	slli	a5,a0,2
	slli	t1,a4,2
	add	a5,a5,a0
	add	t1,t1,a4
	slli	a5,a5,2
	sub	a5,a5,a0
	slli	a3,t1,4
	slli	a4,a1,3
	slli	a5,a5,2
	sub	a3,a3,t1
	sub	a4,a4,a1
	add	a5,a5,a0
	slli	a3,a3,1
	slli	a4,a4,2
	add	a5,a5,a3
	add	a4,a4,a1
	add	a5,a5,a4
	srai	a5,a5,8
	sb	a5,0(t0)
	li	a5,-1
	sb	a5,1(t0)
	lw	a5,0(s0)
	addi	a2,a2,1
	addi	t0,t0,2
	bltu	a2,a5,.L593
	j	.L581
.L589:
	lw	a2,8(s0)
	li	a3,4
	beq	a2,a3,.L807
.L594:
	lw	a2,32(sp)
	li	a5,1
	lw	a3,116(sp)
	beq	a2,a5,.L598
	li	a5,0
	li	a2,-1
	beq	a4,zero,.L581
.L599:
	add	a4,a3,a5
	lbu	a4,0(a4)
	sb	a2,1(t0)
	addi	a5,a5,1
	sb	a4,0(t0)
	lw	a4,0(s0)
	addi	t0,t0,2
	bltu	a5,a4,.L599
	j	.L581
.L802:
	lw	a5,48(sp)
	bne	a5,zero,.L808
	lw	a3,124(sp)
	lw	a2,120(sp)
	j	.L587
.L803:
	li	a5,0
	li	a3,-1
	beq	a4,zero,.L581
	lw	a2,32(sp)
.L584:
	add	a4,s1,a5
	lbu	a4,0(a4)
	sb	a3,3(t0)
	addi	a5,a5,1
	sb	a4,2(t0)
	sb	a4,1(t0)
	sb	a4,0(t0)
	lw	a4,0(s0)
	add	t0,t0,a2
	bltu	a5,a4,.L584
	j	.L581
.L590:
	beq	a4,zero,.L581
	lw	s1,116(sp)
	lw	t2,120(sp)
	lw	ra,124(sp)
	li	a3,0
.L592:
	add	a5,s1,a3
	lbu	a0,0(a5)
	add	a5,t2,a3
	lbu	a4,0(a5)
	add	a5,ra,a3
	lbu	a1,0(a5)
	slli	a5,a0,2
	slli	t1,a4,2
	add	a5,a5,a0
	add	t1,t1,a4
	slli	a5,a5,2
	sub	a5,a5,a0
	slli	a2,t1,4
	slli	a4,a1,3
	slli	a5,a5,2
	sub	a2,a2,t1
	sub	a4,a4,a1
	add	a5,a5,a0
	slli	a2,a2,1
	slli	a4,a4,2
	add	a4,a4,a1
	add	a5,a5,a2
	add	a5,a5,a4
	srai	a5,a5,8
	add	a4,t0,a3
	sb	a5,0(a4)
	lw	a5,0(s0)
	addi	a3,a3,1
	bltu	a3,a5,.L592
	j	.L581
.L807:
	lw	a2,36(sp)
	li	a3,16384
	add	a3,a2,a3
	lw	a3,2024(a3)
	beq	a3,zero,.L809
	bne	a3,a5,.L594
	beq	a4,zero,.L581
	lw	a2,116(sp)
	lw	a3,128(sp)
	mv	t1,s0
	li	s1,0
	mv	s0,t0
.L597:
	add	a5,a2,s1
	lbu	a0,0(a5)
	add	a5,a3,s1
	lbu	a1,0(a5)
	not	a0,a0
	andi	a0,a0,0xff
	sw	t1,12(sp)
	sw	a2,8(sp)
	sw	a3,4(sp)
	call	__mulsi3
	addi	a1,a0,128
	srli	a5,a1,8
	lw	t1,12(sp)
	add	a5,a5,a1
	srli	a5,a5,8
	li	a4,-1
	sb	a5,0(s0)
	sb	a4,1(s0)
	lw	a3,32(sp)
	lw	a5,0(t1)
	addi	s1,s1,1
	add	s0,s0,a3
	lw	a2,8(sp)
	lw	a3,4(sp)
	bltu	s1,a5,.L597
	mv	s0,t1
	j	.L581
.L428:
	lla	a5,.LC31
	la a4, .LANCHOR0; sw a5, 0(a4);
	j	.L427
.L598:
	beq	a4,zero,.L581
	li	a5,0
.L600:
	add	a4,a3,a5
	lbu	a2,0(a4)
	add	a4,t0,a5
	addi	a5,a5,1
	sb	a2,0(a4)
	lw	a4,0(s0)
	bltu	a5,a4,.L600
	j	.L581
.L808:
	beq	a4,zero,.L581
	lw	a1,120(sp)
	lw	a2,124(sp)
	lw	t1,32(sp)
	li	a5,0
	li	a3,-1
.L582:
	add	a4,s1,a5
	lbu	t2,0(a4)
	add	a0,a1,a5
	add	a4,a2,a5
	sb	t2,0(t0)
	lbu	a0,0(a0)
	addi	a5,a5,1
	sb	a0,1(t0)
	lbu	a4,0(a4)
	sb	a3,3(t0)
	sb	a4,2(t0)
	lw	a4,0(s0)
	add	t0,t0,t1
	bltu	a5,a4,.L582
	j	.L581
.L638:
	lw	a5,52(sp)
	sw	a5,32(sp)
	j	.L557
.L419:
	lw	a4,0(s1)
	lw	a5,20(a4)
	addi	a3,a5,1
	sw	a3,20(a4)
	lbu	a3,0(a5)
	bne	a3,t1,.L619
	addi	a5,a5,2
	li	a3,255
.L422:
	sw	a5,20(a4)
	lbu	a1,-1(a5)
	addi	a5,a5,1
	beq	a1,a3,.L422
	j	.L420
.L804:
	beq	a4,zero,.L581
	lw	a5,128(sp)
	sw	s1,56(sp)
	mv	a3,s0
	sw	a5,12(sp)
	lw	a5,120(sp)
	mv	s1,t0
	sw	a5,16(sp)
	lw	a5,124(sp)
	sw	a5,44(sp)
	li	a5,0
	mv	s0,a5
.L586:
	lw	a5,12(sp)
	sw	a3,8(sp)
	add	a4,a5,s0
	lw	a5,56(sp)
	lbu	a1,0(a4)
	add	a4,a5,s0
	lbu	a0,0(a4)
	sw	a1,4(sp)
	call	__mulsi3
	addi	a2,a0,128
	lw	a5,16(sp)
	srli	a4,a2,8
	add	a4,a4,a2
	srli	a4,a4,8
	sb	a4,0(s1)
	add	a4,a5,s0
	lbu	a0,0(a4)
	lw	a1,4(sp)
	call	__mulsi3
	addi	a2,a0,128
	lw	a5,44(sp)
	srli	a4,a2,8
	add	a4,a4,a2
	srli	a4,a4,8
	sb	a4,1(s1)
	add	a4,a5,s0
	lbu	a0,0(a4)
	lw	a1,4(sp)
	addi	s0,s0,1
	call	__mulsi3
	addi	a2,a0,128
	srli	a4,a2,8
	lw	a3,8(sp)
	add	a4,a4,a2
	srli	a4,a4,8
	li	a5,-1
	sb	a5,3(s1)
	sb	a4,2(s1)
	lw	a5,32(sp)
	lw	a4,0(a3)
	add	s1,s1,a5
	bltu	s0,a4,.L586
	mv	s0,a3
	j	.L581
.L620:
	li	a5,0
	j	.L431
.L792:
	li	a5,16384
	add	a5,s1,a5
	lw	a4,2028(a5)
	beq	a4,a3,.L641
	lw	a4,2024(a5)
	bne	a4,zero,.L560
	lw	a5,2020(a5)
	bne	a5,zero,.L560
.L641:
	li	a5,1
	sw	a5,48(sp)
	j	.L559
.L560:
	lw	a4,32(sp)
	li	a5,2
	ble	a4,a5,.L810
	sw	zero,48(sp)
.L559:
	lw	a5,0(s0)
	sw	zero,116(sp)
	sw	zero,120(sp)
	sw	zero,124(sp)
	sw	zero,128(sp)
	j	.L561
.L639:
	li	a5,1
	sw	a5,32(sp)
	j	.L558
.L810:
	li	a4,1
	lw	a5,0(s0)
	sw	zero,116(sp)
	sw	zero,120(sp)
	sw	zero,124(sp)
	sw	zero,128(sp)
	sw	a4,20(sp)
	sw	zero,48(sp)
	j	.L561
.L791:
	ble	a3,zero,.L550
	addi	a5,a5,1704
	add	a5,s1,a5
	sw	a5,12(sp)
	sw	zero,32(sp)
	sw	s1,24(sp)
.L556:
	lw	a5,12(sp)
	sw	zero,16(sp)
	lw	a4,20(a5)
	lw	a5,16(a5)
	addi	a4,a4,7
	addi	a5,a5,7
	srai	a4,a4,3
	srai	a5,a5,3
	sw	a4,36(sp)
	sw	a5,28(sp)
	ble	a4,zero,.L552
.L551:
	lw	a5,28(sp)
	sw	zero,8(sp)
	ble	a5,zero,.L555
.L554:
	lw	s0,12(sp)
	lw	a0,16(sp)
	lw	a1,52(s0)
	call	__mulsi3
	lw	a4,8(sp)
	lw	a5,0(s0)
	lw	a2,48(s0)
	add	a3,a0,a4
	addi	a4,a5,105
	slli	a5,a3,7
	lw	a3,24(sp)
	add	a5,a2,a5
	slli	a4,a4,7
	sw	a5,20(sp)
	addi	a4,a4,4
	mv	s0,a5
	addi	a5,a5,128
	add	s1,a3,a4
	sw	a5,4(sp)
.L553:
	lhu	a1,0(s1)
	lhu	a0,0(s0)
	addi	s0,s0,2
	addi	s1,s1,2
	call	__mulsi3
	lw	a5,4(sp)
	sh	a0,-2(s0)
	bne	a5,s0,.L553
	lw	s1,12(sp)
	lw	a1,16(sp)
	lw	s0,24(s1)
	mv	a0,s0
	call	__mulsi3
	lw	a3,8(sp)
	lw	a4,32(s1)
	lw	a2,20(sp)
	add	a5,a3,a0
	slli	a5,a5,3
	add	a0,a4,a5
	mv	a1,s0
	addi	a5,a3,1
	mv	s0,a5
	sw	a5,8(sp)
	call	stbi__idct_block
	lw	a4,28(sp)
	bne	a4,s0,.L554
.L555:
	lw	a5,16(sp)
	lw	a4,36(sp)
	addi	a5,a5,1
	sw	a5,16(sp)
	bne	a4,a5,.L551
	lw	a5,24(sp)
	lw	s0,0(a5)
.L552:
	lw	a4,32(sp)
	lw	a3,12(sp)
	lw	a5,8(s0)
	addi	a4,a4,1
	addi	a3,a3,72
	sw	a4,32(sp)
	sw	a3,12(sp)
	mv	t0,s0
	blt	a4,a5,.L556
	lw	s1,24(sp)
	sw	a5,20(sp)
	j	.L550
.L528:
	lw	a5,32(sp)
	addi	a5,a5,1
	sw	a5,32(sp)
	blt	a5,a1,.L523
	mv	t1,a4
.L524:
	lw	a4,56(sp)
	lw	a3,48(sp)
	lw	a5,2032(t1)
	addi	a4,a4,1
	addi	a3,a3,4
	sw	a4,56(sp)
	sw	a3,48(sp)
	blt	a4,a5,.L529
.L535:
	lw	a5,4(sp)
	li	a4,20480
	add	a4,a5,a4
	lw	a5,-2040(a4)
	addi	a5,a5,-1
	sw	a5,-2040(a4)
	ble	a5,zero,.L811
.L530:
	lw	a4,36(sp)
	lw	a5,1676(t1)
	addi	a4,a4,1
	sw	a4,36(sp)
	blt	a4,a5,.L536
.L533:
	lw	a4,40(sp)
	lw	a5,1680(t1)
	addi	a4,a4,1
	sw	a4,40(sp)
	blt	a4,a5,.L478
	lw	s1,4(sp)
	lbu	a1,1988(t1)
.L519:
	li	a5,255
	bne	a1,a5,.L538
	lw	a2,0(s1)
	lw	a4,20(a2)
.L614:
	lw	a1,24(a2)
	li	a0,255
.L539:
	mv	a5,a4
	addi	a4,a4,1
	bleu	a1,a5,.L542
	sw	a4,20(a2)
	lbu	a3,-1(a4)
	bne	a3,a0,.L539
	addi	a4,a5,2
	sw	a4,20(a2)
	lbu	a1,1(a5)
	li	a5,16384
	add	a5,s1,a5
	sb	a1,1988(a5)
	j	.L540
.L477:
	li	a5,16384
	add	a3,s1,a5
	lw	a1,2036(a3)
	sw	zero,44(sp)
	slli	a3,a1,3
	add	a3,a3,a1
	sw	a3,92(sp)
	slli	a3,a3,3
	add	a3,s1,a3
	add	a5,a5,a3
	lw	a3,1724(a5)
	lw	a5,1720(a5)
	sw	a1,84(sp)
	addi	a3,a3,7
	addi	a5,a5,7
	srai	a3,a3,3
	srai	a5,a5,3
	sw	a3,88(sp)
	sw	a5,48(sp)
	ble	a3,zero,.L614
.L479:
	lw	a5,92(sp)
	sw	zero,4(sp)
	slli	a5,a5,3
	add	a5,s1,a5
	sw	a5,56(sp)
	lw	a5,48(sp)
	bgt	a5,zero,.L521
	j	.L522
.L813:
	lw	a5,2004(s0)
	lw	a4,1708(a3)
	bne	a5,zero,.L784
	slli	a5,a4,3
	sub	a5,a5,a4
	slli	a2,a5,4
	sub	a2,a2,a5
	slli	a2,a2,4
	lw	a3,84(sp)
	addi	a2,a2,4
	add	a2,s1,a2
	mv	a1,t0
	mv	a0,s1
	call	stbi__jpeg_decode_block_prog_dc.part.0
	beq	a0,zero,.L417
.L483:
	li	a4,20480
	add	a4,s1,a4
	lw	a5,-2040(a4)
	addi	a5,a5,-1
	sw	a5,-2040(a4)
	ble	a5,zero,.L812
.L517:
	lw	a5,4(sp)
	lw	a4,48(sp)
	addi	a5,a5,1
	sw	a5,4(sp)
	beq	a4,a5,.L522
.L521:
	lw	a5,56(sp)
	li	s0,16384
	lw	a0,44(sp)
	add	a3,s0,a5
	lw	a1,1756(a3)
	sw	a3,8(sp)
	add	s0,s1,s0
	call	__mulsi3
	lw	a3,8(sp)
	lw	a5,4(sp)
	lw	a4,2000(s0)
	lw	t0,1752(a3)
	add	a5,a0,a5
	slli	a5,a5,7
	add	t0,t0,a5
	beq	a4,zero,.L813
	lw	a3,1712(a3)
	lw	a2,2008(s0)
	slli	a1,a3,3
	sub	a1,a1,a3
	slli	a5,a1,4
	sub	a5,a5,a1
	li	a1,8192
	addi	a1,a1,-1468
	slli	a5,a5,4
	add	a5,a5,a1
	lw	a1,2012(s0)
	add	a5,s1,a5
	sw	a5,16(sp)
	sw	a1,8(sp)
	lw	a1,2016(s0)
	bne	a2,zero,.L484
	bne	a1,zero,.L814
	li	a5,12288
	slli	a3,a3,10
	addi	a5,a5,1668
	add	a5,a3,a5
	mv	a2,s0
	sw	a5,12(sp)
	sw	t0,20(sp)
	mv	s0,a4
	j	.L495
.L486:
	lw	a1,1980(a2)
	lw	a4,12(sp)
	srli	a5,a1,23
	slli	a5,a5,1
	add	a5,s1,a5
	add	a5,a5,a4
	lh	a5,0(a5)
	beq	a5,zero,.L487
.L815:
	srai	a3,a5,4
	andi	a3,a3,15
	add	a4,a3,s0
	lla	a3,.LANCHOR1
	andi	t0,a5,15
	add	a3,a3,a4
	sll	a1,a1,t0
	lbu	a3,0(a3)
	sw	a1,1980(a2)
	lw	a1,20(sp)
	lw	a0,1984(a2)
	slli	a3,a3,1
	add	a3,a1,a3
	lw	a1,8(sp)
	sub	a0,a0,t0
	srai	a5,a5,8
	sw	a0,1984(a2)
	sll	a5,a5,a1
	addi	s0,a4,1
	sh	a5,0(a3)
.L488:
	lw	a5,2004(a2)
	blt	a5,s0,.L483
.L495:
	lw	a3,1984(a2)
	li	a5,15
	bgt	a3,a5,.L486
	mv	a0,s1
	sw	a2,24(sp)
	call	stbi__grow_buffer_unsafe
	lw	a2,24(sp)
	lw	a4,12(sp)
	lw	a1,1980(a2)
	srli	a5,a1,23
	slli	a5,a5,1
	add	a5,s1,a5
	add	a5,a5,a4
	lh	a5,0(a5)
	bne	a5,zero,.L815
.L487:
	lw	a1,16(sp)
	mv	a0,s1
	sw	a2,24(sp)
	call	stbi__jpeg_huff_decode
	lw	a2,24(sp)
	blt	a0,zero,.L783
	andi	a5,a0,15
	srai	a3,a0,4
	bne	a5,zero,.L490
	li	a5,14
	ble	a3,a5,.L816
	addi	s0,s0,16
	j	.L488
.L812:
	li	a5,16384
	add	a5,s1,a5
	lw	a4,1984(a5)
	li	a5,23
	ble	a4,a5,.L817
.L518:
	li	a5,16384
	add	a5,s1,a5
	lbu	a1,1988(a5)
	li	a3,7
	addi	a4,a1,48
	andi	a4,a4,0xff
	bgtu	a4,a3,.L519
	li	a3,-1
	li	a4,20480
	sb	a3,1988(a5)
	add	a4,s1,a4
	lw	a4,-2044(a4)
	sw	zero,1984(a5)
	sw	zero,1980(a5)
	sw	a3,1992(a5)
	sw	zero,1932(a5)
	sw	zero,1860(a5)
	sw	zero,1788(a5)
	sw	zero,1716(a5)
	bne	a4,zero,.L520
	li	a4,-2147483648
	xori	a4,a4,-1
.L520:
	li	a5,20480
	add	a5,s1,a5
	sw	a4,-2040(a5)
	li	a5,16384
	add	a5,s1,a5
	sw	zero,2016(a5)
	j	.L517
.L490:
	lw	a1,1984(a2)
	add	a0,s0,a3
	lla	a3,.LANCHOR1
	add	a3,a3,a0
	lbu	t0,0(a3)
	addi	s0,a0,1
	bgt	a5,a1,.L818
.L494:
	lw	a0,1980(a2)
	slli	t2,a5,2
	lla	a3,.LANCHOR4
	add	a3,a3,t2
	lw	a4,20(sp)
	li	t2,32
	lw	ra,0(a3)
	sub	t2,t2,a5
	srai	a3,a0,31
	srl	t2,a0,t2
	sub	a1,a1,a5
	sll	a0,a0,a5
	slli	a5,t0,1
	add	a5,a4,a5
	not	a3,a3
	lw	a4,8(sp)
	and	a3,a3,ra
	add	a3,a3,t2
	sw	a0,1980(a2)
	sw	a1,1984(a2)
	sll	a3,a3,a4
	sh	a3,0(a5)
	j	.L488
.L484:
	lw	a3,8(sp)
	li	a5,1
	sll	a5,a5,a3
	slli	a3,a5,16
	srai	a3,a3,16
	sw	a3,8(sp)
	bne	a1,zero,.L751
	slli	a5,a5,16
	srli	a5,a5,16
	sw	a5,68(sp)
	sw	t0,60(sp)
.L497:
	lw	a1,16(sp)
	mv	a0,s1
	sw	a4,12(sp)
	call	stbi__jpeg_huff_decode
	lw	a4,12(sp)
	blt	a0,zero,.L783
	andi	t2,a0,15
	srai	a3,a0,4
	bne	t2,zero,.L505
	li	a5,14
	bgt	a3,a5,.L506
	li	s0,1
	sll	s0,s0,a3
	li	a5,16384
	addi	s0,s0,-1
	add	a5,s1,a5
	sw	s0,2016(a5)
	bne	a3,zero,.L819
	li	a3,64
.L506:
	li	a5,16384
	add	a5,s1,a5
	lw	a2,2004(a5)
	bgt	a4,a2,.L483
	mv	a5,a4
	lla	a1,.LANCHOR1
	add	a4,a1,a5
	lbu	s0,0(a4)
	lw	t0,60(sp)
	addi	a5,a5,1
	slli	s0,s0,1
	add	s0,t0,s0
	lh	t1,0(s0)
	sw	t2,12(sp)
	mv	a4,a5
	bne	t1,zero,.L820
.L510:
	beq	a3,zero,.L821
	addi	a3,a3,-1
.L512:
	blt	a2,a5,.L483
.L786:
	add	a4,a1,a5
	lbu	s0,0(a4)
	addi	a5,a5,1
	mv	a4,a5
	slli	s0,s0,1
	add	s0,t0,s0
	lh	t1,0(s0)
	beq	t1,zero,.L510
.L820:
	li	a4,16384
	add	a4,s1,a4
	lw	t1,1984(a4)
	ble	t1,zero,.L822
.L511:
	li	a4,16384
	add	a4,s1,a4
	lw	t2,1980(a4)
	addi	t1,t1,-1
	sw	t1,1984(a4)
	slli	t1,t2,1
	sw	t1,1980(a4)
	bge	t2,zero,.L512
	lh	a4,0(s0)
	lw	a0,8(sp)
	and	t1,a0,a4
	bne	t1,zero,.L512
	slli	t1,a4,16
	srli	t1,t1,16
	ble	a4,zero,.L513
	lw	a4,68(sp)
	add	t1,t1,a4
	sh	t1,0(s0)
	bge	a2,a5,.L786
	j	.L483
.L821:
	lw	t2,12(sp)
	sh	t2,0(s0)
	bge	a2,a5,.L497
	j	.L483
.L822:
	mv	a0,s1
	sw	a1,40(sp)
	sw	a5,36(sp)
	sw	a2,32(sp)
	sw	t0,28(sp)
	sw	a3,24(sp)
	sw	a4,20(sp)
	call	stbi__grow_buffer_unsafe
	lw	a4,20(sp)
	lw	a1,40(sp)
	lw	a5,36(sp)
	lw	t1,1984(a4)
	lw	a2,32(sp)
	lw	t0,28(sp)
	lw	a3,24(sp)
	j	.L511
.L505:
	li	a5,1
	bne	t2,a5,.L783
	li	s0,16384
	add	s0,s1,s0
	lw	a2,1984(s0)
	ble	a2,zero,.L823
.L509:
	li	a5,16384
	add	a5,s1,a5
	lw	a1,1980(a5)
	addi	a2,a2,-1
	sw	a2,1984(a5)
	slli	a2,a1,1
	sw	a2,1980(a5)
	lw	a5,8(sp)
	mv	t2,a5
	blt	a1,zero,.L506
	neg	t2,a5
	j	.L506
.L513:
	lw	a4,68(sp)
	sub	t1,t1,a4
	sh	t1,0(s0)
	bge	a2,a5,.L786
	j	.L483
.L817:
	mv	a0,s1
	call	stbi__grow_buffer_unsafe
	j	.L518
.L823:
	mv	a0,s1
	sw	a4,20(sp)
	sw	a3,12(sp)
	call	stbi__grow_buffer_unsafe
	lw	a2,1984(s0)
	lw	a4,20(sp)
	lw	a3,12(sp)
	j	.L509
.L751:
	lw	a3,2004(s0)
	addi	a1,a1,-1
	sw	a1,2016(s0)
	bgt	a4,a3,.L483
	slli	a5,a5,16
	mv	a0,s1
	lla	a2,.LANCHOR1
	srli	a5,a5,16
	mv	s1,a4
	j	.L503
.L499:
	addi	s1,s1,1
	bgt	s1,a3,.L824
.L503:
	add	a4,a2,s1
	lbu	s0,0(a4)
	slli	s0,s0,1
	add	s0,t0,s0
	lh	a4,0(s0)
	beq	a4,zero,.L499
	li	a4,16384
	add	a4,a0,a4
	lw	a1,1984(a4)
	ble	a1,zero,.L825
.L500:
	li	a4,16384
	add	a4,a0,a4
	lw	t1,1980(a4)
	addi	a1,a1,-1
	sw	a1,1984(a4)
	slli	a1,t1,1
	sw	a1,1980(a4)
	bge	t1,zero,.L499
	lh	a1,0(s0)
	lw	a4,8(sp)
	and	a4,a4,a1
	bne	a4,zero,.L499
	slli	a4,a1,16
	srli	a4,a4,16
	ble	a1,zero,.L502
	add	a4,a4,a5
	sh	a4,0(s0)
	j	.L499
.L824:
	mv	s1,a0
	j	.L483
.L783:
	lw	a5,0(s1)
	lla	a4,.LC12
	la a3, .LANCHOR0; sw a4, 0(a3);
	lw	ra,8(a5)
	j	.L427
.L819:
	lw	a1,1984(a5)
	bgt	a3,a1,.L826
.L507:
	li	a2,16384
	add	a2,s1,a2
	lw	a0,1980(a2)
	li	a5,32
	sub	a5,a5,a3
	srl	a5,a0,a5
	sub	a1,a1,a3
	sll	a0,a0,a3
	add	a5,a5,s0
	sw	a0,1980(a2)
	sw	a1,1984(a2)
	sw	a5,2016(a2)
	li	a3,64
	j	.L506
.L818:
	mv	a0,s1
	sw	a2,32(sp)
	sw	t0,28(sp)
	sw	a5,24(sp)
	call	stbi__grow_buffer_unsafe
	lw	a2,32(sp)
	lw	t0,28(sp)
	lw	a5,24(sp)
	lw	a1,1984(a2)
	j	.L494
.L814:
	addi	a1,a1,-1
	sw	a1,2016(s0)
	j	.L483
.L825:
	sw	a5,32(sp)
	sw	a2,28(sp)
	sw	a3,24(sp)
	sw	t0,20(sp)
	sw	a4,16(sp)
	sw	a0,12(sp)
	call	stbi__grow_buffer_unsafe
	lw	a4,16(sp)
	lw	a5,32(sp)
	lw	a2,28(sp)
	lw	a1,1984(a4)
	lw	a3,24(sp)
	lw	t0,20(sp)
	lw	a0,12(sp)
	j	.L500
.L826:
	mv	a0,s1
	sw	a4,28(sp)
	sw	a5,24(sp)
	sw	t2,20(sp)
	sw	a3,12(sp)
	call	stbi__grow_buffer_unsafe
	lw	a5,24(sp)
	lw	a4,28(sp)
	lw	t2,20(sp)
	lw	a1,1984(a5)
	lw	a3,12(sp)
	j	.L507
.L522:
	lw	a5,44(sp)
	lw	a4,88(sp)
	addi	a5,a5,1
	sw	a5,44(sp)
	bne	a4,a5,.L479
.L453:
	li	a5,16384
	add	a5,s1,a5
	lbu	a1,1988(a5)
	j	.L519
.L502:
	sub	a4,a4,a5
	sh	a4,0(s0)
	j	.L499
.L816:
	li	a5,1
	sll	a5,a5,a3
	sw	a5,2016(a2)
	mv	s0,a2
	bne	a3,zero,.L827
.L492:
	li	a4,16384
	add	a4,s1,a4
	addi	a5,a5,-1
	sw	a5,2016(a4)
	j	.L483
.L798:
	lla	a5,.LC32
	la a4, .LANCHOR0; sw a5, 0(a4);
	j	.L427
.L619:
	li	a1,255
	j	.L421
.L799:
	lla	a5,.LC33
	la a4, .LANCHOR0; sw a5, 0(a4);
	j	.L427
.L800:
	lw	s1,4(sp)
	lw	a5,0(s1)
	lw	ra,8(a5)
	j	.L427
.L440:
	lla	a5,.LC34
	la a4, .LANCHOR0; sw a5, 0(a4);
	j	.L427
.L805:
	lw	a5,32(sp)
	mv	a1,s1
	mv	a0,t0
	sw	t0,4(sp)
	call	stbi__YCbCr_to_RGB_row
	lw	a5,36(sp)
	lw	s0,0(a5)
	lw	a5,0(s0)
	beq	a5,zero,.L581
	lw	t0,4(sp)
	lw	a4,128(sp)
	mv	a3,s0
	li	s1,0
	mv	s0,t0
.L588:
	lbu	a0,0(s0)
	add	a5,a4,s1
	lbu	a1,0(a5)
	not	a0,a0
	andi	a0,a0,0xff
	sw	a3,12(sp)
	sw	a4,8(sp)
	sw	a1,4(sp)
	call	__mulsi3
	lbu	t1,1(s0)
	addi	a2,a0,128
	srli	a5,a2,8
	add	a5,a5,a2
	lw	a1,4(sp)
	srli	a5,a5,8
	not	a0,t1
	sb	a5,0(s0)
	andi	a0,a0,0xff
	call	__mulsi3
	addi	a2,a0,128
	lbu	t1,2(s0)
	srli	a5,a2,8
	add	a5,a5,a2
	lw	a1,4(sp)
	srli	a5,a5,8
	not	a0,t1
	sb	a5,1(s0)
	andi	a0,a0,0xff
	call	__mulsi3
	addi	a2,a0,128
	srli	a5,a2,8
	lw	a3,12(sp)
	add	a5,a5,a2
	srli	a5,a5,8
	sb	a5,2(s0)
	lw	a4,32(sp)
	lw	a5,0(a3)
	addi	s1,s1,1
	add	s0,s0,a4
	lw	a4,8(sp)
	bltu	s1,a5,.L588
	mv	s0,a3
	j	.L581
.L809:
	beq	a4,zero,.L581
	lw	a5,116(sp)
	lw	a2,128(sp)
	mv	a4,s0
	sw	a5,4(sp)
	lw	a5,120(sp)
	li	s1,0
	mv	s0,t0
	sw	a5,8(sp)
	lw	a5,124(sp)
	sw	a5,12(sp)
.L596:
	add	a5,a2,s1
	lbu	a1,0(a5)
	lw	a5,4(sp)
	sw	a2,56(sp)
	sw	a4,60(sp)
	add	a5,a5,s1
	lbu	a0,0(a5)
	sw	a1,16(sp)
	call	__mulsi3
	lw	a5,8(sp)
	lw	a1,16(sp)
	mv	a3,a0
	add	a5,a5,s1
	lbu	a0,0(a5)
	addi	a3,a3,128
	sw	a3,44(sp)
	call	__mulsi3
	lw	a4,12(sp)
	mv	a5,a0
	lw	a1,16(sp)
	add	a0,a4,s1
	lbu	a0,0(a0)
	addi	a5,a5,128
	sw	a5,16(sp)
	call	__mulsi3
	lw	a3,44(sp)
	lw	a5,16(sp)
	addi	a0,a0,128
	srli	a1,a3,8
	add	a3,a1,a3
	srli	a1,a5,8
	srli	a3,a3,8
	add	a5,a1,a5
	srli	a5,a5,8
	slli	a1,a3,2
	srli	t1,a0,8
	add	a1,a1,a3
	slli	t0,a5,2
	add	a0,t1,a0
	srli	a0,a0,8
	add	t0,t0,a5
	slli	a5,a1,2
	sub	a5,a5,a3
	slli	t1,t0,4
	slli	a1,a0,3
	slli	a5,a5,2
	sub	t1,t1,t0
	sub	a1,a1,a0
	add	a5,a5,a3
	slli	t1,t1,1
	slli	a3,a1,2
	add	a3,a3,a0
	add	a5,a5,t1
	add	a5,a5,a3
	lw	a4,60(sp)
	srai	a5,a5,8
	li	t2,-1
	sb	a5,0(s0)
	sb	t2,1(s0)
	lw	a3,32(sp)
	lw	a5,0(a4)
	addi	s1,s1,1
	lw	a2,56(sp)
	add	s0,s0,a3
	bltu	s1,a5,.L596
	mv	s0,a4
	j	.L581
.L827:
	lw	a2,1984(a2)
	bgt	a3,a2,.L828
.L493:
	li	a4,16384
	add	a4,s1,a4
	lw	a1,1980(a4)
	li	a0,32
	sub	a0,a0,a3
	sll	t0,a1,a3
	sub	a2,a2,a3
	srl	a1,a1,a0
	sw	t0,1980(a4)
	sw	a2,1984(a4)
	add	a5,a5,a1
	j	.L492
.L545:
	lla	a5,.LC36
	lw	ra,8(a4)
	la a4, .LANCHOR0; sw a5, 0(a4);
	j	.L427
.L466:
	lw	a4,44(sp)
	lw	a3,92(sp)
	lw	a5,84(sp)
	add	a4,a4,a3
	sw	a4,44(sp)
	lw	a4,68(sp)
	addi	a5,a5,1
	sw	a5,84(sp)
	bne	a4,a5,.L461
.L462:
	lw	a5,40(sp)
	lw	a4,88(sp)
	lw	a3,60(sp)
	lw	a5,2032(a5)
	addi	a4,a4,1
	addi	a3,a3,4
	sw	a4,88(sp)
	sw	a3,60(sp)
	blt	a4,a5,.L467
.L474:
	lw	a5,8(sp)
	li	a4,20480
	add	a4,a5,a4
	lw	a5,-2040(a4)
	addi	a5,a5,-1
	sw	a5,-2040(a4)
	ble	a5,zero,.L829
.L468:
	lw	a5,40(sp)
	lw	a4,48(sp)
	lw	a5,1676(a5)
	addi	a4,a4,1
	sw	a4,48(sp)
	blt	a4,a5,.L476
.L472:
	lw	a5,40(sp)
	lw	a4,56(sp)
	lw	a5,1680(a5)
	addi	a4,a4,1
	sw	a4,56(sp)
	blt	a4,a5,.L445
.L764:
	lw	s1,8(sp)
	j	.L453
.L444:
	li	a5,16384
	add	a3,s1,a5
	lw	a3,2036(a3)
	slli	a1,a3,3
	sw	a3,20(sp)
	add	a3,a1,a3
	slli	a3,a3,3
	add	a3,s1,a3
	add	a5,a5,a3
	lw	a3,1724(a5)
	lw	a5,1720(a5)
	sw	a1,44(sp)
	addi	a3,a3,7
	addi	a5,a5,7
	srai	a3,a3,3
	srai	a5,a5,3
	sw	a3,40(sp)
	sw	a5,36(sp)
	ble	a3,zero,.L614
	slli	a5,a5,3
	sw	a5,24(sp)
.L448:
	lw	a5,36(sp)
	ble	a5,zero,.L458
	lw	a4,20(sp)
	lw	a5,44(sp)
	li	s0,0
	add	a5,a5,a4
	li	a4,8192
	addi	a4,a4,-1468
	add	a4,s1,a4
	slli	a5,a5,3
	sw	a4,28(sp)
	add	a5,s1,a5
	addi	a4,sp,132
	sw	a4,4(sp)
	sw	a5,32(sp)
	j	.L455
.L450:
	lw	a5,24(sp)
	addi	s0,s0,8
	beq	a5,s0,.L458
.L455:
	lw	a4,32(sp)
	li	a5,16384
	add	t0,a5,a4
	lw	a3,1708(t0)
	lw	a4,1712(t0)
	lw	a5,1704(t0)
	slli	a1,a3,3
	sub	a1,a1,a3
	slli	a2,a1,4
	slli	a0,a4,3
	sub	a2,a2,a1
	li	a1,12288
	sub	a0,a0,a4
	addi	a1,a1,1668
	slli	a4,a4,10
	slli	a3,a0,4
	add	a4,a4,a1
	lw	a1,28(sp)
	sub	a3,a3,a0
	addi	a5,a5,105
	slli	a3,a3,4
	slli	a5,a5,7
	add	a3,a1,a3
	lw	a1,64(sp)
	addi	a5,a5,4
	add	a5,s1,a5
	slli	a2,a2,4
	sw	a5,0(sp)
	add	a2,a1,a2
	lw	a5,20(sp)
	lw	a1,4(sp)
	add	a4,s1,a4
	mv	a0,s1
	sw	t0,8(sp)
	call	stbi__jpeg_decode_block
	beq	a0,zero,.L417
	lw	t0,8(sp)
	lw	a1,16(sp)
	lw	a4,1728(t0)
	sw	t0,12(sp)
	mv	a0,a4
	sw	a4,8(sp)
	call	__mulsi3
	lw	t0,12(sp)
	lw	a4,8(sp)
	slli	a5,a0,3
	lw	a3,1736(t0)
	lw	a2,4(sp)
	add	a5,a5,s0
	mv	a1,a4
	add	a0,a3,a5
	call	stbi__idct_block
	li	a4,20480
	add	a4,s1,a4
	lw	a5,-2040(a4)
	addi	a5,a5,-1
	sw	a5,-2040(a4)
	bgt	a5,zero,.L450
	li	a5,16384
	add	a5,s1,a5
	lw	a4,1984(a5)
	li	a5,23
	ble	a4,a5,.L830
.L451:
	li	a5,16384
	add	a5,s1,a5
	lbu	a4,1988(a5)
	li	a3,7
	addi	a4,a4,48
	andi	a4,a4,0xff
	bgtu	a4,a3,.L453
	li	a3,-1
	li	a4,20480
	sb	a3,1988(a5)
	add	a4,s1,a4
	lw	a4,-2044(a4)
	sw	zero,1984(a5)
	sw	zero,1980(a5)
	sw	a3,1992(a5)
	sw	zero,1932(a5)
	sw	zero,1860(a5)
	sw	zero,1788(a5)
	sw	zero,1716(a5)
	bne	a4,zero,.L454
	li	a4,-2147483648
	xori	a4,a4,-1
.L454:
	li	a5,20480
	add	a5,s1,a5
	sw	a4,-2040(a5)
	li	a5,16384
	add	a5,s1,a5
	sw	zero,2016(a5)
	j	.L450
.L830:
	mv	a0,s1
	call	stbi__grow_buffer_unsafe
	j	.L451
.L458:
	lw	a5,16(sp)
	lw	a4,40(sp)
	addi	a5,a5,1
	sw	a5,16(sp)
	bne	a4,a5,.L448
	j	.L453
.L790:
	lla	a5,.LC35
	lw	ra,8(a4)
	la a4, .LANCHOR0; sw a5, 0(a4);
	j	.L427
.L829:
	lw	a5,40(sp)
	lw	a4,1984(a5)
	li	a5,23
	ble	a4,a5,.L831
.L469:
	lw	a3,40(sp)
	li	a4,7
	lbu	a5,1988(a3)
	addi	a5,a5,48
	andi	a5,a5,0xff
	bgtu	a5,a4,.L764
	lw	a2,8(sp)
	li	a4,-1
	li	a5,20480
	sb	a4,1988(a3)
	add	a5,a2,a5
	lw	a5,-2044(a5)
	sw	zero,1984(a3)
	sw	zero,1980(a3)
	sw	a4,1992(a3)
	sw	zero,1932(a3)
	sw	zero,1860(a3)
	sw	zero,1788(a3)
	sw	zero,1716(a3)
	bne	a5,zero,.L471
	li	a5,-2147483648
	xori	a5,a5,-1
.L471:
	lw	a3,8(sp)
	li	a4,20480
	add	a4,a3,a4
	sw	a5,-2040(a4)
	lw	a5,40(sp)
	sw	zero,2016(a5)
	j	.L468
.L831:
	lw	a0,8(sp)
	call	stbi__grow_buffer_unsafe
	j	.L469
.L828:
	mv	a0,s1
	sw	a5,12(sp)
	sw	a3,8(sp)
	call	stbi__grow_buffer_unsafe
	lw	a2,1984(s0)
	lw	a5,12(sp)
	lw	a3,8(sp)
	j	.L493
.L795:
	lw	s1,4(sp)
	sw	a0,28(sp)
.L567:
	lw	a5,0(s1)
	mv	a0,s1
	lw	a1,8(a5)
	call	stbi__free_jpeg_components.constprop.0
	lla	a5,.LC25
	mv	a0,s1
	la a4, .LANCHOR0; sw a5, 0(a4);
	call	free
	j	.L411
.L609:
	lla	a5,.LC25
	la a4, .LANCHOR0; sw a5, 0(a4);
	sw	zero,28(sp)
	j	.L411
.L806:
	lla	s0,.LC0
	li	a0,65
.L605:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L605
	lla	s0,.LC26
	li	a0,65
.L606:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L606
	lla	s0,.LC27
	li	a0,32
.L607:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L607
	li	a0,1
	call	halt
.L811:
	lw	a4,1984(t1)
	li	a5,23
	ble	a4,a5,.L832
.L531:
	lbu	a1,1988(t1)
	li	a4,7
	addi	a5,a1,48
	andi	a5,a5,0xff
	bgtu	a5,a4,.L772
	lw	a3,4(sp)
	li	a4,-1
	li	a5,20480
	sb	a4,1988(t1)
	add	a5,a3,a5
	lw	a5,-2044(a5)
	sw	zero,1984(t1)
	sw	zero,1980(t1)
	sw	a4,1992(t1)
	sw	zero,1932(t1)
	sw	zero,1860(t1)
	sw	zero,1788(t1)
	sw	zero,1716(t1)
	bne	a5,zero,.L532
	li	a5,-2147483648
	xori	a5,a5,-1
.L532:
	lw	a3,4(sp)
	li	a4,20480
	add	a4,a3,a4
	sw	a5,-2040(a4)
	sw	zero,2016(t1)
	j	.L530
.L772:
	lw	s1,4(sp)
	j	.L519
.L832:
	lw	a0,4(sp)
	sw	t1,8(sp)
	call	stbi__grow_buffer_unsafe
	lw	t1,8(sp)
	j	.L531
	.size	stbi__load_and_postprocess_8bit, .-stbi__load_and_postprocess_8bit
	.section	.text.stbi_failure_reason,"ax",@progbits
	.align	2
	.globl	stbi_failure_reason
	.hidden	stbi_failure_reason
	.type	stbi_failure_reason, @function
stbi_failure_reason:
	la a0, .LANCHOR0; lw a0, 0(a0);
	ret
	.size	stbi_failure_reason, .-stbi_failure_reason
	.section	.text.stbi_load_from_memory,"ax",@progbits
	.align	2
	.globl	stbi_load_from_memory
	.hidden	stbi_load_from_memory
	.type	stbi_load_from_memory, @function
stbi_load_from_memory:
	addi	sp,sp,-48
	mv	t0,a1
	mv	t1,a0
	add	t0,a0,t0
	mv	a1,a2
	mv	a0,sp
	mv	a2,a3
	mv	a3,a4
	mv	a4,a5
	sw	ra,44(sp)
	sw	t1,28(sp)
	sw	t1,20(sp)
	sw	t0,32(sp)
	sw	t0,24(sp)
	call	stbi__load_and_postprocess_8bit
	lw	ra,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	stbi_load_from_memory, .-stbi_load_from_memory
	.section	.text.stbi_info_from_memory,"ax",@progbits
	.align	2
	.globl	stbi_info_from_memory
	.hidden	stbi_info_from_memory
	.type	stbi_info_from_memory, @function
stbi_info_from_memory:
	mv	a5,a0
	add	a1,a0,a1
	li	a0,20480
	addi	sp,sp,-60
	addi	a0,a0,-2036
	sw	a2,8(sp)
	sw	a3,4(sp)
	sw	a4,0(sp)
	sw	ra,56(sp)
	sw	s0,52(sp)
	sw	a5,40(sp)
	sw	a5,32(sp)
	sw	a1,44(sp)
	sw	a1,36(sp)
	sw	s1,48(sp)
	call	malloc
	addi	a5,sp,12
	li	a1,2
	sw	a5,0(a0)
	mv	s0,a0
	call	stbi__decode_jpeg_header
	lw	a4,0(sp)
	lw	a3,4(sp)
	lw	a2,8(sp)
	beq	a0,zero,.L851
	beq	a2,zero,.L839
	lw	a5,0(s0)
	lw	a5,0(a5)
	sw	a5,0(a2)
.L839:
	beq	a3,zero,.L840
	lw	a5,0(s0)
	lw	a5,4(a5)
	sw	a5,0(a3)
.L840:
	beq	a4,zero,.L841
	lw	a5,0(s0)
	li	a3,2
	mv	a0,s0
	lw	a5,8(a5)
	li	s1,1
	sgt	a5,a5,a3
	slli	a5,a5,1
	addi	a5,a5,1
	sw	a5,0(a4)
	call	free
	lw	ra,56(sp)
	lw	s0,52(sp)
	mv	a0,s1
	lw	s1,48(sp)
	addi	sp,sp,60
	jr	ra
.L851:
	lw	a5,0(s0)
	mv	s1,a0
	mv	a0,s0
	lw	a3,32(a5)
	lw	a2,28(a5)
	sw	a3,24(a5)
	sw	a2,20(a5)
	call	free
	lw	ra,56(sp)
	lw	s0,52(sp)
	lla	a5,.LC28
	la a3, .LANCHOR0; sw a5, 0(a3);
	mv	a0,s1
	lw	s1,48(sp)
	addi	sp,sp,60
	jr	ra
.L841:
	mv	a0,s0
	call	free
	lw	ra,56(sp)
	lw	s0,52(sp)
	li	s1,1
	mv	a0,s1
	lw	s1,48(sp)
	addi	sp,sp,60
	jr	ra
	.size	stbi_info_from_memory, .-stbi_info_from_memory
	.section	.rodata.stbi__jbias,"a"
	.align	2
	.set	.LANCHOR4,. + 0
	.type	stbi__jbias, @object
	.size	stbi__jbias, 64
stbi__jbias:
	.word	0
	.word	-1
	.word	-3
	.word	-7
	.word	-15
	.word	-31
	.word	-63
	.word	-127
	.word	-255
	.word	-511
	.word	-1023
	.word	-2047
	.word	-4095
	.word	-8191
	.word	-16383
	.word	-32767
	.section	.rodata.stbi__jpeg_dezigzag,"a"
	.align	2
	.set	.LANCHOR1,. + 0
	.type	stbi__jpeg_dezigzag, @object
	.size	stbi__jpeg_dezigzag, 79
stbi__jpeg_dezigzag:
	.string	""
	.ascii	"\001\b\020\t\002\003\n\021\030 \031\022\013\004\005\f\023\032"
	.ascii	"!(0)\"\033\024\r\006\007\016\025\034#*1892+$\035\026\017\027"
	.ascii	"\036%,3:;4-&\037'.5<=6/7>????????????????"
	.section	.sbss.stbi__g_failure_reason,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	stbi__g_failure_reason, @object
	.size	stbi__g_failure_reason, 4
stbi__g_failure_reason:
	.zero	4
	.section	.srodata.rgb.0,"a"
	.align	2
	.set	.LANCHOR5,. + 0
	.type	rgb.0, @object
	.size	rgb.0, 3
rgb.0:
	.ascii	"RGB"
	.section	.srodata.tag.1,"a"
	.align	2
	.set	.LANCHOR3,. + 0
	.type	tag.1, @object
	.size	tag.1, 6
tag.1:
	.string	"Adobe"
	.section	.srodata.tag.2,"a"
	.align	2
	.set	.LANCHOR2,. + 0
	.type	tag.2, @object
	.size	tag.2, 5
tag.2:
	.string	"JFIF"
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
