#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"dequant.c"
	.option nopic
	.text
	.section	.text.Dequantize,"ax",@progbits
	.align	2
	.globl	Dequantize
	.hidden	Dequantize
	.type	Dequantize, @function
Dequantize:
	beq	a0,zero,.L32
	lw	t2,0(a0)
	addi	sp,sp,-72
	sw	ra,68(sp)
	sw	s0,64(sp)
	sw	s1,60(sp)
	beq	t2,zero,.L37
	lw	a5,4(a0)
	sw	a5,44(sp)
	beq	a5,zero,.L37
	lw	a5,8(a0)
	sw	a5,40(sp)
	beq	a5,zero,.L37
	lw	t1,12(a0)
	beq	t1,zero,.L37
	mv	t0,a1
	lw	a1,16(a0)
	beq	a1,zero,.L37
	lw	a5,1980(a0)
	addi	a4,a1,792
	sw	zero,56(sp)
	sw	zero,52(sp)
	sw	a4,28(sp)
	ble	a5,zero,.L6
	slli	a4,t0,3
	lw	a3,44(sp)
	add	a4,a4,t0
	slli	a4,a4,4
	addi	a4,a4,40
	slli	a5,t0,5
	add	a4,a3,a4
	lw	a3,40(sp)
	sub	a5,a5,t0
	li	a2,4096
	slli	a5,a5,2
	addi	a2,a2,512
	add	a2,t1,a2
	add	a5,a3,a5
	sw	t1,32(sp)
	li	s0,0
	sw	a5,36(sp)
	mv	a3,t2
	mv	t1,a0
	mv	s1,a2
	sw	t0,48(sp)
.L5:
	sw	t1,24(sp)
	slli	a5,s0,5
	lw	t1,36(sp)
	sub	a5,a5,s0
	lw	a2,28(sp)
	slli	t0,s0,1
	slli	a5,a5,1
	add	a5,a5,t1
	add	t0,t0,s0
	lw	t1,32(sp)
	slli	a0,s0,3
	add	a0,a0,s0
	slli	t0,t0,3
	add	t0,a2,t0
	slli	a0,a0,8
	mv	a2,s1
	add	a0,t1,a0
	sw	t0,0(sp)
	sw	a4,20(sp)
	sw	a3,16(sp)
	sw	a1,12(sp)
	call	DequantChannel
	lw	t1,24(sp)
	sw	a0,8(s1)
	lw	a4,20(sp)
	lw	a5,1980(t1)
	addi	s0,s0,1
	lw	a1,12(sp)
	lw	a3,16(sp)
	addi	s1,s1,4
	addi	a4,a4,72
	bgt	a5,s0,.L5
	lw	t1,32(sp)
	lw	t0,48(sp)
	mv	t2,a3
.L6:
	lw	a0,32(t2)
	beq	a0,zero,.L1
	li	a5,4096
	add	a5,t1,a5
	lw	a4,520(a5)
	ble	a4,zero,.L11
	lw	a5,524(a5)
	ble	a5,zero,.L11
.L10:
	srai	a5,a0,1
	andi	a0,a0,1
	beq	a5,zero,.L61
	beq	a0,zero,.L21
	lw	a5,816(a1)
	lw	a4,52(t2)
	bne	a5,zero,.L22
	lw	a5,836(a1)
	addi	a5,a5,1
	slli	a5,a5,1
	add	a5,a4,a5
	lh	a1,0(a5)
.L23:
	addi	s0,sp,52
	mv	a0,t1
	mv	a2,s0
	sw	t0,20(sp)
	sw	t2,16(sp)
	sw	t1,12(sp)
	call	MidSideProc
	lw	t2,16(sp)
	lw	t1,12(sp)
	lw	t0,20(sp)
	lw	a0,32(t2)
	andi	a5,a0,1
	beq	a5,zero,.L25
.L13:
	lw	a1,44(sp)
	slli	a5,t0,3
	add	a5,a5,t0
	slli	a5,a5,4
	li	a2,4096
	add	a5,a1,a5
	add	a2,t1,a2
	slli	a3,t0,5
	lw	a1,512(a2)
	sub	a3,a3,t0
	lw	a2,136(a5)
	lw	a4,0(t2)
	lw	a5,40(sp)
	slli	a3,a3,2
	addi	a3,a3,62
	add	a3,a5,a3
	srai	a5,a0,1
	bne	a4,zero,.L26
	lw	a4,28(sp)
	mv	a0,t1
	sw	a2,0(sp)
	sw	s0,4(sp)
	mv	a2,t2
	sw	t2,16(sp)
	sw	t1,12(sp)
	call	IntensityProcMPEG1
	lw	t2,16(sp)
	lw	t1,12(sp)
	lw	a0,32(t2)
.L25:
	beq	a0,zero,.L1
	lw	a5,52(sp)
	li	a3,31
	beq	a5,zero,.L27
	blt	a5,zero,.L39
	li	a4,0
.L28:
	slli	a5,a5,1
	mv	a3,a4
	addi	a4,a4,1
	bge	a5,zero,.L28
.L27:
	li	a4,4096
	lw	a5,56(sp)
	add	a4,t1,a4
	sw	a3,520(a4)
	li	a3,31
	beq	a5,zero,.L29
	blt	a5,zero,.L41
	li	a4,0
.L30:
	slli	a5,a5,1
	mv	a3,a4
	addi	a4,a4,1
	bge	a5,zero,.L30
.L29:
	li	a5,4096
	add	a5,t1,a5
	lw	a2,512(a5)
	lw	a4,516(a5)
	sw	a3,524(a5)
	bge	a4,a2,.L31
	mv	a4,a2
.L31:
	li	a5,4096
	add	t1,t1,a5
	sw	a4,512(t1)
	sw	a4,516(t1)
	li	a0,0
.L1:
	lw	ra,68(sp)
	lw	s0,64(sp)
	lw	s1,60(sp)
	addi	sp,sp,72
	jr	ra
.L11:
	li	a5,4096
	add	a5,t1,a5
	lw	a5,512(a5)
	mv	a4,t1
	slli	a3,a5,2
	add	a3,a3,t1
	ble	a5,zero,.L17
	li	a2,-1073741824
	li	s0,1073741824
	addi	s1,s0,-1
	addi	ra,a2,1
	j	.L16
.L62:
	sw	ra,0(a4)
.L15:
	addi	a4,a4,4
	beq	a3,a4,.L17
.L16:
	lw	a5,0(a4)
	ble	a5,a2,.L62
	blt	a5,s0,.L15
	sw	s1,0(a4)
	addi	a4,a4,4
	bne	a3,a4,.L16
.L17:
	li	a4,4096
	add	a5,t1,a4
	lw	a3,516(a5)
	ble	a3,zero,.L10
	addi	a4,a4,-1792
	add	a4,t1,a4
	slli	a3,a3,2
	li	a2,-1073741824
	li	s0,1073741824
	add	a3,a4,a3
	addi	ra,s0,-1
	addi	s1,a2,1
	j	.L20
.L63:
	sw	s1,0(a4)
.L19:
	addi	a4,a4,4
	beq	a4,a3,.L10
.L20:
	lw	a5,0(a4)
	ble	a5,a2,.L63
	blt	a5,s0,.L19
	sw	ra,0(a4)
	j	.L19
.L21:
	li	a5,4096
	add	a5,t1,a5
	lw	a4,512(a5)
	lw	a1,516(a5)
	bge	a1,a4,.L23
	mv	a1,a4
	j	.L23
.L26:
	sw	a5,0(sp)
	lw	a5,40(sp)
	lw	a4,28(sp)
	mv	a0,t1
	sw	a2,4(sp)
	sw	s0,8(sp)
	mv	a2,t2
	addi	a5,a5,248
	sw	t2,16(sp)
	sw	t1,12(sp)
	call	IntensityProcMPEG2
	lw	t2,16(sp)
	lw	t1,12(sp)
	lw	a0,32(t2)
	j	.L25
.L22:
	lw	a5,832(a1)
	addi	a5,a5,17
	slli	a5,a5,1
	add	a4,a4,a5
	lh	a5,14(a4)
	slli	a1,a5,1
	add	a1,a1,a5
	j	.L23
.L41:
	li	a3,-1
	j	.L29
.L39:
	li	a3,-1
	j	.L27
.L37:
	li	a0,-1
	j	.L1
.L32:
	li	a0,-1
	ret
.L61:
	li	a0,1
	addi	s0,sp,52
	j	.L13
	.size	Dequantize, .-Dequantize
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
