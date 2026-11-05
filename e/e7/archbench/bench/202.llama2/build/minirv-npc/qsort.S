#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"qsort.c"
	.option nopic
	.text
	.globl	__mulsi3
	.globl	__udivsi3
	.section	.text.qsort,"ax",@progbits
	.align	2
	.globl	qsort
	.hidden	qsort
	.type	qsort, @function
qsort:
	addi	sp,sp,-136
	or	a5,a0,a2
	sw	a3,8(sp)
	li	a3,2
	sw	s0,128(sp)
	sw	a2,24(sp)
	sw	ra,132(sp)
	sw	s1,124(sp)
	andi	a5,a5,3
	sw	a3,12(sp)
	mv	a4,a2
	mv	s0,a0
	mv	a2,a1
	bne	a5,zero,.L2
	addi	a5,a4,-4
	snez	a5,a5
	sw	a5,12(sp)
.L2:
	lw	a5,24(sp)
	sw	zero,44(sp)
	srli	a4,a5,2
	neg	a5,a5
	sw	a4,36(sp)
	sw	a5,0(sp)
.L3:
	lw	a1,24(sp)
	mv	a0,a2
	sw	a2,4(sp)
	call	__mulsi3
	lw	a5,24(sp)
	lw	a2,4(sp)
	mv	s1,a0
	add	a5,s0,a5
	mv	a4,a5
	sw	a4,52(sp)
	add	a4,s0,a0
	sw	a5,32(sp)
	sw	a4,40(sp)
	li	a5,6
	bleu	a2,a5,.L155
	lw	a1,24(sp)
	srli	a0,a2,1
	sw	a2,4(sp)
	call	__mulsi3
	lw	a5,24(sp)
	lw	a2,4(sp)
	li	a3,7
	sub	a5,s1,a5
	add	a4,s0,a0
	add	s1,s0,a5
	beq	a2,a3,.L15
	li	a3,40
	sw	s1,16(sp)
	sw	s0,4(sp)
	bgtu	a2,a3,.L156
.L16:
	lw	a0,4(sp)
	lw	a5,8(sp)
	mv	a1,a4
	sw	a4,20(sp)
	jalr	a5
	lw	a4,20(sp)
	lw	a1,16(sp)
	blt	a0,zero,.L157
	lw	a5,8(sp)
	mv	a0,a4
	sw	a4,20(sp)
	jalr	a5
	lw	a4,20(sp)
	ble	a0,zero,.L158
.L15:
	lw	a5,12(sp)
	bne	a5,zero,.L23
	lw	a2,0(a4)
	lw	a3,0(s0)
	sw	a2,0(s0)
	sw	a3,0(a4)
.L24:
	lw	a5,52(sp)
	bltu	s1,a5,.L28
	mv	a1,s0
	sw	a5,16(sp)
	sw	a5,48(sp)
	sw	zero,20(sp)
	mv	s0,s1
.L29:
	lw	a5,8(sp)
	lw	a0,16(sp)
	sw	a1,4(sp)
	jalr	a5
	lw	a5,16(sp)
	lw	a1,4(sp)
	sw	a5,28(sp)
	ble	a0,zero,.L38
.L152:
	bltu	s0,a5,.L147
	lw	a5,8(sp)
	mv	a0,s0
	sw	a1,4(sp)
	jalr	a5
	lw	a1,4(sp)
	blt	a0,zero,.L159
	bne	a0,zero,.L40
	lw	a5,12(sp)
	bne	a5,zero,.L41
	lw	a3,0(s1)
	lw	a4,0(s0)
	sw	a3,0(s0)
	sw	a4,0(s1)
.L42:
	lw	a5,0(sp)
	add	s1,s1,a5
	li	a5,1
	sw	a5,20(sp)
.L40:
	lw	a5,0(sp)
	add	s0,s0,a5
	lw	a5,16(sp)
	j	.L152
.L38:
	bne	a0,zero,.L31
	lw	a5,12(sp)
	bne	a5,zero,.L32
	lw	a0,16(sp)
	lw	a5,48(sp)
	lw	a3,24(sp)
	lw	a2,0(a0)
	lw	a4,0(a5)
	add	a3,a5,a3
	sw	a2,0(a5)
	sw	a4,0(a0)
.L33:
	li	a5,1
	sw	a3,48(sp)
	sw	a5,20(sp)
.L31:
	lw	a5,16(sp)
	lw	a4,24(sp)
	add	a3,a5,a4
	sw	a3,28(sp)
.L54:
	sw	a3,16(sp)
	bgeu	s0,a3,.L29
.L147:
	lw	a5,20(sp)
	mv	a3,s1
	mv	s1,s0
	mv	s0,a1
	beq	a5,zero,.L28
	lw	a5,48(sp)
	lw	a4,28(sp)
	sub	a1,a5,a1
	sub	a0,a4,a5
	ble	a1,a0,.L63
	mv	a1,a0
.L63:
	mv	a5,a3
	lw	a4,40(sp)
	sub	t0,a5,s1
	lw	a5,24(sp)
	sub	a3,a4,a3
	sub	a3,a3,a5
	bleu	a3,t0,.L64
	mv	a3,t0
.L64:
	bne	a1,zero,.L160
	bne	a3,zero,.L70
.L74:
	lw	a5,40(sp)
	mv	s1,a0
	sub	a5,a5,t0
	bgeu	a0,t0,.L71
	mv	a4,s0
	mv	s1,t0
	mv	s0,a5
	mv	t0,a0
	mv	a5,a4
.L71:
	lw	a3,24(sp)
	bleu	t0,a3,.L76
	lw	a2,44(sp)
	li	a4,7
	bgtu	a2,a4,.L77
	slli	a4,a2,3
	sw	a5,16(sp)
	addi	a5,a4,64
	addi	a4,sp,60
	add	a4,a5,a4
	mv	a1,a3
	sw	s0,-64(a4)
	mv	a0,s1
	sw	t0,20(sp)
	sw	a4,4(sp)
	call	__udivsi3
	lw	t0,20(sp)
	lw	a4,4(sp)
	lw	a1,24(sp)
	mv	a3,a0
	sw	a3,-60(a4)
	mv	a0,t0
	call	__udivsi3
	lw	a2,44(sp)
	addi	a5,a2,1
	sw	a5,44(sp)
	lw	a5,16(sp)
	mv	a2,a0
	mv	s0,a5
	j	.L3
.L41:
	lw	a5,12(sp)
	li	a4,1
	mv	a3,s1
	beq	a5,a4,.L161
	lw	a5,24(sp)
	mv	a4,s0
	add	t0,s0,a5
.L43:
	lbu	a2,0(a3)
	lbu	a5,0(a4)
	addi	a3,a3,1
	addi	a4,a4,1
	sb	a2,-1(a4)
	sb	a5,-1(a3)
	sub	a5,t0,a4
	bgt	a5,zero,.L43
	j	.L42
.L159:
	lw	a5,12(sp)
	bne	a5,zero,.L162
	lw	a5,16(sp)
	lw	a2,0(s0)
	lw	a3,24(sp)
	lw	a4,0(a5)
	sw	a2,0(a5)
	add	a3,a5,a3
	sw	a4,0(s0)
.L50:
	lw	a5,0(sp)
	sw	a3,28(sp)
	add	s0,s0,a5
	li	a5,1
	sw	a5,20(sp)
	j	.L54
.L161:
	lw	a0,36(sp)
	mv	a4,s0
.L44:
	lw	a2,0(a3)
	lw	a5,0(a4)
	addi	a3,a3,4
	sw	a2,0(a4)
	addi	a0,a0,-1
	sw	a5,-4(a3)
	addi	a4,a4,4
	bgt	a0,zero,.L44
	j	.L42
.L162:
	lw	a5,16(sp)
	lw	a3,24(sp)
	li	a2,1
	mv	a4,s0
	add	a3,a5,a3
	lw	a5,12(sp)
	beq	a5,a2,.L163
	lw	a5,28(sp)
.L51:
	lbu	a0,0(a4)
	lbu	a2,0(a5)
	addi	a4,a4,1
	addi	a5,a5,1
	sb	a0,-1(a5)
	sb	a2,-1(a4)
	sub	a2,a3,a5
	bgt	a2,zero,.L51
	j	.L50
.L163:
	lw	a3,36(sp)
	lw	a5,28(sp)
.L52:
	lw	a0,0(a4)
	lw	a2,0(a5)
	addi	a4,a4,4
	sw	a0,0(a5)
	addi	a3,a3,-1
	sw	a2,-4(a4)
	addi	a5,a5,4
	bgt	a3,zero,.L52
	lw	a5,16(sp)
	lw	a4,24(sp)
	add	a3,a5,a4
	j	.L50
.L28:
	lw	a5,40(sp)
	lw	a4,52(sp)
	bleu	a5,a4,.L6
	sw	s0,4(sp)
.L30:
	lw	a5,32(sp)
	lw	a4,4(sp)
	bleu	a5,a4,.L62
	mv	s0,a5
	lw	a5,24(sp)
	slli	a5,a5,1
	sw	a5,16(sp)
	j	.L60
.L164:
	lw	a3,0(s0)
	lw	a5,0(s1)
	sw	a3,0(s1)
	sw	a5,0(s0)
.L56:
	lw	a5,4(sp)
	bleu	s0,a5,.L62
.L60:
	lw	a5,0(sp)
	mv	s1,s0
	mv	a1,s1
	add	s0,s0,a5
	lw	a5,8(sp)
	mv	a0,s0
	jalr	a5
	ble	a0,zero,.L62
	lw	a5,12(sp)
	beq	a5,zero,.L164
	lw	a4,16(sp)
	li	a3,1
	mv	a5,s0
	add	a0,s0,a4
	lw	a4,12(sp)
	beq	a4,a3,.L165
.L57:
	lbu	a3,0(a5)
	lbu	a4,0(s1)
	addi	a5,a5,1
	addi	s1,s1,1
	sb	a3,-1(s1)
	sb	a4,-1(a5)
	sub	a4,a0,s1
	bgt	a4,zero,.L57
	lw	a5,4(sp)
	bgtu	s0,a5,.L60
.L62:
	lw	a5,32(sp)
	lw	a4,24(sp)
	add	a5,a5,a4
	lw	a4,40(sp)
	sw	a5,32(sp)
	bltu	a5,a4,.L30
.L6:
	lw	a5,44(sp)
	beq	a5,zero,.L166
.L80:
	lw	a5,44(sp)
	addi	a4,sp,60
	addi	a5,a5,-1
	sw	a5,44(sp)
	slli	a5,a5,3
	addi	a5,a5,64
	add	a5,a5,a4
	lw	s0,-64(a5)
	lw	a2,-60(a5)
	j	.L3
.L165:
	lw	a3,36(sp)
.L58:
	lw	a2,0(a5)
	lw	a4,0(s1)
	addi	a5,a5,4
	sw	a2,0(s1)
	addi	a3,a3,-1
	sw	a4,-4(a5)
	addi	s1,s1,4
	bgt	a3,zero,.L58
	j	.L56
.L155:
	mv	a5,a4
	lw	a4,32(sp)
	bleu	a5,a4,.L6
	sw	s0,4(sp)
.L5:
	lw	a5,32(sp)
	lw	a4,4(sp)
	bleu	a5,a4,.L14
	mv	s0,a5
	lw	a5,24(sp)
	slli	a5,a5,1
	sw	a5,16(sp)
	j	.L12
.L167:
	lw	a3,0(s0)
	lw	a5,0(s1)
	sw	a3,0(s1)
	sw	a5,0(s0)
.L8:
	lw	a5,4(sp)
	bleu	s0,a5,.L14
.L12:
	lw	a5,0(sp)
	mv	s1,s0
	mv	a1,s1
	add	s0,s0,a5
	lw	a5,8(sp)
	mv	a0,s0
	jalr	a5
	ble	a0,zero,.L14
	lw	a5,12(sp)
	beq	a5,zero,.L167
	lw	a4,16(sp)
	li	a3,1
	mv	a5,s0
	add	a0,s0,a4
	lw	a4,12(sp)
	beq	a4,a3,.L168
.L9:
	lbu	a3,0(a5)
	lbu	a4,0(s1)
	addi	a5,a5,1
	addi	s1,s1,1
	sb	a3,-1(s1)
	sb	a4,-1(a5)
	sub	a4,a0,s1
	bgt	a4,zero,.L9
	lw	a5,4(sp)
	bgtu	s0,a5,.L12
.L14:
	lw	a5,32(sp)
	lw	a4,24(sp)
	add	a5,a5,a4
	lw	a4,40(sp)
	sw	a5,32(sp)
	bltu	a5,a4,.L5
	lw	a5,44(sp)
	bne	a5,zero,.L80
.L166:
	lw	ra,132(sp)
	lw	s0,128(sp)
	lw	s1,124(sp)
	addi	sp,sp,136
	jr	ra
.L168:
	lw	a3,36(sp)
.L10:
	lw	a2,0(a5)
	lw	a4,0(s1)
	addi	a5,a5,4
	sw	a2,0(s1)
	addi	a3,a3,-1
	sw	a4,-4(a5)
	addi	s1,s1,4
	bgt	a3,zero,.L10
	j	.L8
.L76:
	lw	a5,24(sp)
	bleu	s1,a5,.L6
	lw	a1,24(sp)
	mv	a0,s1
	call	__udivsi3
	mv	a2,a0
	j	.L3
.L32:
	lw	a5,48(sp)
	lw	a3,24(sp)
	lw	a0,12(sp)
	li	a2,1
	mv	a4,a5
	add	a3,a5,a3
	beq	a0,a2,.L169
	lw	a5,28(sp)
.L34:
	lbu	a0,0(a5)
	lbu	a2,0(a4)
	addi	a5,a5,1
	addi	a4,a4,1
	sb	a0,-1(a4)
	sb	a2,-1(a5)
	sub	a2,a3,a4
	bgt	a2,zero,.L34
	j	.L33
.L23:
	lw	a5,12(sp)
	li	a2,1
	mv	a3,s0
	beq	a5,a2,.L170
	lw	a1,52(sp)
.L25:
	lbu	a2,0(a4)
	lbu	a5,0(a3)
	addi	a4,a4,1
	addi	a3,a3,1
	sb	a2,-1(a3)
	sb	a5,-1(a4)
	sub	a5,a1,a3
	bgt	a5,zero,.L25
	j	.L24
.L160:
	lw	a4,28(sp)
	lw	t2,12(sp)
	li	a5,2
	sub	a4,a4,a1
	mv	a2,s0
	add	t1,s0,a1
	bne	t2,a5,.L171
.L66:
	lbu	a1,0(a4)
	lbu	a5,0(a2)
	addi	a4,a4,1
	addi	a2,a2,1
	sb	a1,-1(a2)
	sb	a5,-1(a4)
	sub	a5,t1,a2
	bgt	a5,zero,.L66
	beq	a3,zero,.L74
	lw	a5,40(sp)
	sub	a4,a5,a3
.L83:
	lw	a2,28(sp)
	add	a3,a2,a3
.L75:
	lbu	a1,0(a4)
	lbu	a5,0(a2)
	addi	a4,a4,1
	addi	a2,a2,1
	sb	a1,-1(a2)
	sb	a5,-1(a4)
	sub	a5,a3,a2
	bgt	a5,zero,.L75
	j	.L74
.L157:
	lw	a5,8(sp)
	mv	a0,a4
	jalr	a5
	lw	a4,20(sp)
	blt	a0,zero,.L15
	lw	a1,16(sp)
	lw	a0,4(sp)
	lw	a5,8(sp)
	jalr	a5
	lw	a4,16(sp)
	blt	a0,zero,.L15
	lw	a4,4(sp)
	j	.L15
.L156:
	lw	a1,24(sp)
	srli	a0,a2,3
	sw	a4,20(sp)
	call	__mulsi3
	lw	a5,8(sp)
	add	a3,s0,a0
	mv	a1,a3
	sw	a0,16(sp)
	mv	a0,s0
	sw	a3,4(sp)
	jalr	a5
	lw	a4,16(sp)
	lw	a3,4(sp)
	slli	a2,a4,1
	sw	a2,28(sp)
	add	a1,a3,a4
	lw	a4,20(sp)
	blt	a0,zero,.L172
	lw	a0,4(sp)
	lw	a5,8(sp)
	sw	a4,48(sp)
	sw	a1,20(sp)
	jalr	a5
	lw	a4,48(sp)
	ble	a0,zero,.L173
.L18:
	lw	a3,16(sp)
	mv	a1,a4
	sw	a4,48(sp)
	sub	a5,a4,a3
	sw	a5,20(sp)
	mv	a0,a5
	lw	a5,8(sp)
	jalr	a5
	lw	a3,16(sp)
	lw	a4,48(sp)
	add	a1,a4,a3
	sw	a1,56(sp)
	blt	a0,zero,.L174
	lw	a5,8(sp)
	mv	a0,a4
	sw	a4,48(sp)
	jalr	a5
	lw	a4,48(sp)
	ble	a0,zero,.L175
.L20:
	lw	a5,28(sp)
	sw	a4,48(sp)
	sub	a3,s1,a5
	lw	a5,16(sp)
	mv	a0,a3
	sw	a3,20(sp)
	add	a5,a3,a5
	sw	a5,16(sp)
	mv	a1,a5
	lw	a5,8(sp)
	jalr	a5
	lw	a3,20(sp)
	lw	a4,48(sp)
	blt	a0,zero,.L176
	lw	a0,16(sp)
	lw	a5,8(sp)
	mv	a1,s1
	sw	a4,20(sp)
	sw	a3,28(sp)
	jalr	a5
	lw	a4,20(sp)
	bgt	a0,zero,.L16
	lw	a3,28(sp)
	lw	a5,8(sp)
	mv	a1,s1
	mv	a0,a3
	sw	a3,16(sp)
	jalr	a5
	lw	a4,20(sp)
	blt	a0,zero,.L16
	sw	s1,16(sp)
	j	.L16
.L77:
	lw	a1,24(sp)
	mv	a0,t0
	sw	a5,4(sp)
	call	__udivsi3
	lw	a5,4(sp)
	lw	a3,8(sp)
	lw	a2,24(sp)
	mv	a1,a0
	mv	a0,a5
	call	qsort
	lw	a5,24(sp)
	bleu	s1,a5,.L80
	lw	a1,24(sp)
	mv	a0,s1
	call	__udivsi3
	mv	a2,a0
	j	.L3
.L70:
	lw	a4,40(sp)
	lw	a2,12(sp)
	li	a5,2
	sub	a4,a4,a3
	beq	a2,a5,.L83
.L85:
	lw	a5,28(sp)
	srli	a3,a3,2
.L73:
	lw	a1,0(a4)
	lw	a2,0(a5)
	addi	a4,a4,4
	sw	a1,0(a5)
	addi	a3,a3,-1
	sw	a2,-4(a4)
	addi	a5,a5,4
	bgt	a3,zero,.L73
	j	.L74
.L158:
	lw	a1,16(sp)
	lw	a0,4(sp)
	lw	a5,8(sp)
	jalr	a5
	lw	a4,4(sp)
	blt	a0,zero,.L15
	lw	a4,16(sp)
	j	.L15
.L169:
	lw	a3,36(sp)
	lw	a5,28(sp)
.L35:
	lw	a0,0(a5)
	lw	a2,0(a4)
	addi	a5,a5,4
	sw	a0,0(a4)
	addi	a3,a3,-1
	sw	a2,-4(a5)
	addi	a4,a4,4
	bgt	a3,zero,.L35
	lw	a5,48(sp)
	lw	a4,24(sp)
	add	a3,a5,a4
	j	.L33
.L170:
	lw	a2,36(sp)
.L26:
	lw	a1,0(a4)
	lw	a5,0(a3)
	addi	a4,a4,4
	sw	a1,0(a3)
	addi	a2,a2,-1
	sw	a5,-4(a4)
	addi	a3,a3,4
	bgt	a2,zero,.L26
	j	.L24
.L175:
	lw	a1,56(sp)
	lw	a0,20(sp)
	lw	a5,8(sp)
	sw	a1,48(sp)
	jalr	a5
	lw	a4,20(sp)
	blt	a0,zero,.L20
	lw	a1,48(sp)
	mv	a4,a1
	j	.L20
.L173:
	lw	a1,20(sp)
	lw	a5,8(sp)
	mv	a0,s0
	jalr	a5
	sw	s0,4(sp)
	lw	a4,48(sp)
	blt	a0,zero,.L18
	lw	a1,20(sp)
	sw	a1,4(sp)
	j	.L18
.L171:
	srli	a1,a1,2
	mv	a5,s0
.L67:
	lw	t1,0(a4)
	lw	a2,0(a5)
	addi	a4,a4,4
	sw	t1,0(a5)
	addi	a1,a1,-1
	sw	a2,-4(a4)
	addi	a5,a5,4
	bgt	a1,zero,.L67
	beq	a3,zero,.L74
	lw	a5,40(sp)
	sub	a4,a5,a3
	j	.L85
.L172:
	lw	a5,8(sp)
	mv	a0,a3
	sw	a1,48(sp)
	jalr	a5
	lw	a4,20(sp)
	blt	a0,zero,.L18
	lw	a1,48(sp)
	lw	a5,8(sp)
	mv	a0,s0
	sw	a1,4(sp)
	jalr	a5
	lw	a4,20(sp)
	blt	a0,zero,.L18
	sw	s0,4(sp)
	j	.L18
.L176:
	lw	a0,16(sp)
	lw	a5,8(sp)
	mv	a1,s1
	sw	a4,28(sp)
	jalr	a5
	lw	a4,28(sp)
	blt	a0,zero,.L16
	lw	a3,20(sp)
	lw	a5,8(sp)
	mv	a1,s1
	mv	a0,a3
	jalr	a5
	sw	s1,16(sp)
	lw	a4,28(sp)
	blt	a0,zero,.L16
	lw	a3,20(sp)
	sw	a3,16(sp)
	j	.L16
.L174:
	lw	a5,8(sp)
	mv	a0,a4
	jalr	a5
	lw	a4,48(sp)
	blt	a0,zero,.L20
	lw	a1,56(sp)
	lw	a0,20(sp)
	lw	a5,8(sp)
	sw	a1,48(sp)
	jalr	a5
	lw	a1,48(sp)
	mv	a4,a1
	blt	a0,zero,.L20
	lw	a4,20(sp)
	j	.L20
	.size	qsort, .-qsort
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
