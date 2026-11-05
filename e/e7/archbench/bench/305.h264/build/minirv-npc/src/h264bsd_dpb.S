#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"h264bsd_dpb.c"
	.option nopic
	.text
	.section	.text.SlidingWindowRefPicMarking,"ax",@progbits
	.align	2
	.type	SlidingWindowRefPicMarking, @function
SlidingWindowRefPicMarking:
	lw	a2,40(a0)
	lw	a5,24(a0)
	bltu	a2,a5,.L17
	beq	a2,zero,.L8
	lw	t2,0(a0)
	addi	sp,sp,-4
	sw	s0,0(sp)
	mv	a1,a0
	li	a3,0
	li	t0,0
	addi	a4,t2,8
	li	t1,-1
	li	a0,1
	li	s0,-1
	j	.L6
.L4:
	addi	a3,a3,1
	addi	a4,a4,40
	beq	a2,a3,.L18
.L6:
	lw	a5,12(a4)
	addi	a5,a5,-1
	bgtu	a5,a0,.L4
	lw	a5,0(a4)
	blt	a5,t0,.L5
	bne	t1,s0,.L4
.L5:
	mv	t1,a3
	addi	a3,a3,1
	mv	t0,a5
	addi	a4,a4,40
	bne	a2,a3,.L6
.L18:
	li	a5,-1
	li	a0,1
	bne	t1,a5,.L19
	lw	s0,0(sp)
	addi	sp,sp,4
	jr	ra
.L19:
	slli	a5,t1,2
	add	a5,a5,t1
	slli	a5,a5,3
	add	t2,t2,a5
	lw	a0,24(t2)
	sw	zero,20(t2)
	addi	a2,a2,-1
	sw	a2,40(a1)
	bne	a0,zero,.L7
	lw	a5,44(a1)
	lw	s0,0(sp)
	addi	a5,a5,-1
	sw	a5,44(a1)
	addi	sp,sp,4
	jr	ra
.L7:
	lw	s0,0(sp)
	li	a0,0
	addi	sp,sp,4
	jr	ra
.L8:
	li	a0,1
	ret
.L17:
	li	a0,0
	ret
	.size	SlidingWindowRefPicMarking, .-SlidingWindowRefPicMarking
	.section	.text.ShellSort,"ax",@progbits
	.align	2
	.type	ShellSort, @function
ShellSort:
	addi	sp,sp,-104
	li	a5,3
	li	t1,7
	sw	a0,28(sp)
	sw	s0,100(sp)
	sw	s1,96(sp)
	sw	a1,48(sp)
	sw	a5,52(sp)
	mv	a0,t1
.L21:
	lw	a5,48(sp)
	bleu	a5,a0,.L32
	slli	a5,a0,2
	add	a5,a5,a0
	slli	t0,a5,3
	lw	a5,28(sp)
	sw	a0,44(sp)
	mv	a2,a0
	add	t1,a5,t0
	mv	a1,t1
	mv	a0,t0
	j	.L29
.L39:
	lw	a4,16(sp)
	bne	a4,zero,.L25
	lw	a4,24(a5)
	bne	a4,zero,.L37
	lw	a4,40(sp)
	bne	a4,zero,.L25
.L37:
	lw	a4,28(sp)
	slli	a5,a3,2
	mv	a2,a1
	add	a5,a5,a3
	lw	a1,24(sp)
	slli	a5,a5,3
	add	t1,a4,a5
.L22:
	lw	a5,56(sp)
	lw	a4,48(sp)
	addi	a1,a1,40
	sw	a5,0(t1)
	lw	a5,60(sp)
	sw	a5,4(t1)
	lw	a5,64(sp)
	sw	a5,8(t1)
	lw	a5,68(sp)
	sw	a5,12(t1)
	lw	a5,72(sp)
	sw	a5,16(t1)
	lw	a5,76(sp)
	sw	a5,20(t1)
	lw	a5,80(sp)
	sw	a5,24(t1)
	lw	a5,84(sp)
	sw	a5,28(t1)
	lw	a5,88(sp)
	sw	a5,32(t1)
	lw	a5,92(sp)
	sw	a5,36(t1)
	lw	a5,44(sp)
	addi	a5,a5,1
	sw	a5,44(sp)
	beq	a4,a5,.L38
.L29:
	lw	a3,8(a1)
	lw	a5,4(a1)
	lw	t1,24(a1)
	sw	a3,36(sp)
	sw	a5,60(sp)
	lw	a5,36(sp)
	lw	t0,32(a1)
	sw	t1,40(sp)
	lw	s1,20(a1)
	lw	t1,36(a1)
	lw	a4,0(a1)
	lw	a3,12(a1)
	lw	s0,16(a1)
	lw	t2,28(a1)
	sw	a5,64(sp)
	lw	a5,40(sp)
	sw	t0,88(sp)
	lw	t0,44(sp)
	sw	t1,92(sp)
	sw	s1,16(sp)
	sw	a4,56(sp)
	sw	a3,68(sp)
	sw	s0,72(sp)
	sw	s1,76(sp)
	sw	a5,80(sp)
	sw	t2,84(sp)
	mv	t1,a1
	bltu	t0,a2,.L22
	addi	a4,s1,-1
	sub	a5,a1,a0
	sw	a1,24(sp)
	sw	a4,32(sp)
	mv	a1,a2
	mv	a2,t0
.L23:
	lw	a4,20(a5)
	sw	a5,20(sp)
	mv	a3,a2
	sub	a2,a2,a1
	beq	a4,zero,.L39
	lw	t1,16(sp)
	beq	t1,zero,.L37
	addi	a4,a4,-1
	li	t1,1
	bleu	a4,t1,.L40
	lw	a4,32(sp)
	li	t1,1
	bleu	a4,t1,.L25
	lw	a4,8(a5)
	lw	t1,36(sp)
	ble	a4,t1,.L37
.L25:
	lw	a4,20(a5)
	lw	a3,24(a5)
	lw	t0,16(a5)
	sw	a4,0(sp)
	lw	a4,28(a5)
	sw	a3,4(sp)
	lw	a3,32(a5)
	sw	a4,8(sp)
	add	a4,a5,a0
	lw	s1,4(a5)
	lw	s0,8(a5)
	lw	t2,12(a5)
	lw	t1,0(a5)
	sw	a3,12(sp)
	lw	a3,36(a5)
	sw	t0,16(a4)
	lw	t0,0(sp)
	sw	t1,0(a4)
	sw	s1,4(a4)
	sw	t0,20(a4)
	lw	t0,4(sp)
	sw	s0,8(a4)
	sw	t2,12(a4)
	sw	t0,24(a4)
	lw	t0,8(sp)
	sw	a3,36(a4)
	sub	a5,a5,a0
	sw	t0,28(a4)
	lw	t0,12(sp)
	sw	t0,32(a4)
	bgeu	a2,a1,.L23
	mv	a2,a1
	lw	t1,20(sp)
	lw	a1,24(sp)
	j	.L22
.L40:
	lw	a4,32(sp)
	bgtu	a4,t1,.L37
	lw	a4,8(a5)
	lw	t1,36(sp)
	bge	a4,t1,.L37
	j	.L25
.L38:
	mv	a0,a2
.L32:
	lw	a5,52(sp)
	srli	a0,a0,1
	addi	a5,a5,-1
	sw	a5,52(sp)
	bne	a5,zero,.L21
	lw	s0,100(sp)
	lw	s1,96(sp)
	addi	sp,sp,104
	jr	ra
	.size	ShellSort, .-ShellSort
	.section	.text.OutputPicture.part.0,"ax",@progbits
	.align	2
	.type	OutputPicture.part.0, @function
OutputPicture.part.0:
	lw	a4,28(a0)
	lw	a5,0(a0)
	li	a1,-2147483648
	slli	a2,a4,2
	add	a2,a2,a4
	slli	a2,a2,3
	mv	t1,a0
	add	a2,a2,a5
	li	t0,0
	xori	a1,a1,-1
.L43:
	lw	a4,24(a5)
	addi	a3,a5,40
	beq	a4,zero,.L42
	lw	a4,16(a5)
	bge	a4,a1,.L42
	mv	t0,a5
	mv	a1,a4
.L42:
	beq	a5,a2,.L51
	mv	a5,a3
	j	.L43
.L51:
	beq	t0,zero,.L46
	lw	a4,16(t1)
	lw	a5,12(t1)
	lw	a0,0(t0)
	lw	a1,36(t0)
	lw	a2,28(t0)
	lw	a3,32(t0)
	slli	t2,a4,4
	add	a5,a5,t2
	sw	a0,0(a5)
	sw	a1,12(a5)
	sw	a2,4(a5)
	sw	a3,8(a5)
	lw	a0,20(t0)
	addi	a4,a4,1
	sw	a4,16(t1)
	sw	zero,24(t0)
	bne	a0,zero,.L47
	lw	a5,44(t1)
	addi	a5,a5,-1
	sw	a5,44(t1)
	ret
.L47:
	li	a0,0
	ret
.L46:
	li	a0,1
	ret
	.size	OutputPicture.part.0, .-OutputPicture.part.0
	.section	.text.Mmcop5,"ax",@progbits
	.align	2
	.type	Mmcop5, @function
Mmcop5:
	lw	a3,0(a0)
	addi	sp,sp,-12
	sw	s0,4(sp)
	addi	a5,a3,20
	sw	ra,8(sp)
	mv	s0,a0
	addi	a3,a3,660
.L56:
	lw	a4,0(a5)
	beq	a4,zero,.L54
	lw	a4,4(a5)
	sw	zero,0(a5)
	bne	a4,zero,.L54
	lw	a4,44(s0)
	addi	a4,a4,-1
	sw	a4,44(s0)
.L54:
	addi	a5,a5,40
	bne	a5,a3,.L56
	lw	a5,56(s0)
	beq	a5,zero,.L57
.L59:
	li	a5,65536
	addi	a5,a5,-1
	lw	ra,8(sp)
	sw	zero,40(s0)
	sw	a5,36(s0)
	sw	zero,48(s0)
	lw	s0,4(sp)
	li	a0,0
	addi	sp,sp,12
	jr	ra
.L57:
	mv	a0,s0
	call	OutputPicture.part.0
	bne	a0,zero,.L59
	mv	a0,s0
	call	OutputPicture.part.0
	beq	a0,zero,.L57
	j	.L59
	.size	Mmcop5, .-Mmcop5
	.section	.text.h264bsdReorderRefPicList,"ax",@progbits
	.align	2
	.globl	h264bsdReorderRefPicList
	.hidden	h264bsdReorderRefPicList
	.type	h264bsdReorderRefPicList, @function
h264bsdReorderRefPicList:
	lw	a4,40(a0)
	addi	sp,sp,-28
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	a2,12(sp)
	mv	s0,a0
	beq	a4,zero,.L73
	lw	a5,0(a0)
	slli	a2,a4,2
	add	a2,a2,a4
	slli	a2,a2,3
	lw	t1,12(sp)
	add	a2,a2,a5
	li	a0,1
	j	.L72
.L70:
	addi	a5,a5,40
	beq	a2,a5,.L73
.L72:
	lw	a4,20(a5)
	addi	a4,a4,-1
	bgtu	a4,a0,.L70
	lw	a4,12(a5)
	bgeu	t1,a4,.L71
	lw	t0,32(s0)
	sub	a4,a4,t0
.L71:
	sw	a4,8(a5)
	addi	a5,a5,40
	bne	a2,a5,.L72
.L73:
	lw	a5,0(a1)
	beq	a5,zero,.L68
	lw	a4,4(a1)
	li	a5,2
	bgtu	a4,a5,.L68
	addi	a5,a1,8
	sw	a5,0(sp)
	slli	a5,a3,2
	sw	a5,16(sp)
	lw	a5,12(sp)
	lw	s1,24(s0)
	sw	zero,4(sp)
	sw	a5,8(sp)
.L89:
	li	a2,2
	lw	a5,0(s0)
	beq	a4,a2,.L75
	lw	a2,0(sp)
	lw	t0,0(a2)
	bne	a4,zero,.L76
	lw	a4,8(sp)
	sub	t0,a4,t0
	blt	t0,zero,.L77
	sw	t0,8(sp)
.L78:
	lw	a4,12(sp)
	lw	a2,8(sp)
	bgeu	a4,a2,.L79
	lw	a4,32(s0)
	sub	t0,t0,a4
.L79:
	beq	s1,zero,.L95
	li	a1,0
	li	a4,0
	j	.L83
.L81:
	addi	a5,a5,40
	addi	a1,a1,40
	beq	a4,s1,.L95
.L83:
	lw	a0,20(a5)
	li	t2,1
	addi	a4,a4,1
	addi	a2,a0,-1
	mv	t1,a5
	bgtu	a2,t2,.L81
	lw	a2,8(a5)
	bne	a2,t0,.L81
	li	a5,1
	beq	a0,a5,.L66
.L85:
	lw	a2,4(sp)
	lw	t2,4(s0)
	lw	a5,16(sp)
	slli	a4,a2,2
	add	a4,t2,a4
	add	a5,t2,a5
	bleu	a3,a2,.L94
.L87:
	lw	a2,-4(a5)
	addi	a5,a5,-4
	sw	a2,4(a5)
	bne	a4,a5,.L87
	lw	t1,0(s0)
	add	t1,t1,a1
.L94:
	lw	a5,4(sp)
	addi	a5,a5,1
	slli	a2,a5,2
	addi	a2,a2,-4
	add	a2,t2,a2
	sw	a5,4(sp)
	sw	t1,0(a2)
	mv	t0,a5
	mv	a0,a5
	bltu	a3,a5,.L92
.L91:
	lw	a4,0(s0)
	lw	t1,4(a2)
	slli	a5,t0,2
	add	a4,a4,a1
	addi	a0,a0,1
	add	a5,t2,a5
	beq	t1,a4,.L90
	sw	t1,0(a5)
	addi	t0,t0,1
.L90:
	addi	a2,a2,4
	bgeu	a3,a0,.L91
.L92:
	lw	a5,0(sp)
	lw	a4,8(a5)
	addi	a5,a5,12
	sw	a5,0(sp)
	li	a5,2
	bleu	a4,a5,.L89
.L68:
	li	a0,0
.L66:
	lw	s0,24(sp)
	lw	s1,20(sp)
	addi	sp,sp,28
	jr	ra
.L95:
	lw	s0,24(sp)
	lw	s1,20(sp)
	li	a0,1
	addi	sp,sp,28
	jr	ra
.L75:
	lw	a4,0(sp)
	lw	a0,4(a4)
	beq	s1,zero,.L95
	li	a1,0
	li	a4,0
	j	.L86
.L84:
	addi	a5,a5,40
	addi	a1,a1,40
	beq	a4,s1,.L95
.L86:
	lw	a2,20(a5)
	li	t0,3
	addi	a4,a4,1
	mv	t1,a5
	bne	a2,t0,.L84
	lw	a2,8(a5)
	bne	a0,a2,.L84
	j	.L85
.L76:
	lw	a2,8(sp)
	lw	a4,32(s0)
	add	a2,a2,t0
	sw	a2,8(sp)
	mv	t0,a2
	bgt	a4,a2,.L78
	sub	a4,a2,a4
	sw	a4,8(sp)
	mv	t0,a4
	j	.L78
.L77:
	lw	a4,32(s0)
	add	a4,t0,a4
	sw	a4,8(sp)
	mv	t0,a4
	j	.L78
	.size	h264bsdReorderRefPicList, .-h264bsdReorderRefPicList
	.section	.text.h264bsdMarkDecRefPic,"ax",@progbits
	.align	2
	.globl	h264bsdMarkDecRefPic
	.hidden	h264bsdMarkDecRefPic
	.type	h264bsdMarkDecRefPic, @function
h264bsdMarkDecRefPic:
	lw	t1,8(a0)
	lw	a2,0(a2)
	addi	sp,sp,-40
	lw	t0,0(t1)
	sw	a5,0(sp)
	sw	ra,36(sp)
	sw	s0,32(sp)
	sw	s1,28(sp)
	sw	t0,12(sp)
	sw	a3,4(sp)
	sw	a4,8(sp)
	li	a5,1
	beq	a2,t0,.L207
	lw	ra,36(sp)
	lw	s0,32(sp)
	lw	s1,28(sp)
	mv	a0,a5
	addi	sp,sp,40
	jr	ra
.L207:
	lw	a4,56(a0)
	sw	zero,52(a0)
	mv	s0,a0
	seqz	a5,a4
	sw	a5,16(sp)
	mv	s1,a1
	beq	a1,zero,.L208
	lw	a5,0(sp)
	bne	a5,zero,.L209
	lw	a5,8(a1)
	beq	a5,zero,.L124
	lw	a5,12(a1)
	beq	a5,zero,.L125
	addi	s1,a1,16
	sw	zero,24(sp)
	lla	a2,.L128
.L157:
	li	a4,6
	bgtu	a5,a4,.L175
	slli	a4,a5,2
	add	a4,a4,a2
	lw	a4,0(a4)
	add	a4,a4,a2
	jr	a4
	.section	.rodata.h264bsdMarkDecRefPic,"a",@progbits
	.align	2
	.align	2
.L128:
	.word	.L175-.L128
	.word	.L133-.L128
	.word	.L132-.L128
	.word	.L131-.L128
	.word	.L130-.L128
	.word	.L129-.L128
	.word	.L127-.L128
	.section	.text.h264bsdMarkDecRefPic
.L127:
	lw	a4,36(s0)
	li	a5,65536
	addi	a5,a5,-1
	beq	a4,a5,.L175
	lw	t0,8(s1)
	bgtu	t0,a4,.L175
	lw	a1,24(s0)
	beq	a1,zero,.L175
	lw	a5,0(s0)
	li	a4,0
	li	a0,3
	j	.L156
.L154:
	addi	a4,a4,1
	addi	a5,a5,40
	beq	a1,a4,.L210
.L156:
	lw	a3,20(a5)
	bne	a3,a0,.L154
	lw	a3,8(a5)
	bne	a3,t0,.L154
	lw	a3,40(s0)
	lw	a4,24(a5)
	sw	zero,20(a5)
	addi	a3,a3,-1
	sw	a3,40(s0)
	bne	a4,zero,.L155
	lw	a5,44(s0)
	addi	a5,a5,-1
	sw	a5,44(s0)
	j	.L155
.L129:
	mv	a0,s0
	sw	t1,20(sp)
	call	Mmcop5
	li	a5,1
	sw	a0,4(sp)
	sw	a5,52(s0)
	lw	t1,20(sp)
	lla	a2,.L128
	bne	a0,zero,.L211
.L136:
	lw	a5,16(s1)
	addi	s1,s1,20
	bne	a5,zero,.L157
.L205:
	lw	a4,56(s0)
.L126:
	lw	a3,24(sp)
	beq	a3,zero,.L125
	lw	a3,0(sp)
	lw	s1,28(s0)
	sw	a3,36(t1)
	lw	a3,40(sp)
	sw	a3,28(t1)
	lw	a3,44(sp)
	sw	a3,32(t1)
	beq	a4,zero,.L212
.L158:
	lw	a3,16(s0)
	lw	a4,12(s0)
	slli	a2,a3,4
	add	a4,a4,a2
	lw	a2,12(sp)
	addi	a3,a3,1
	sw	a2,0(a4)
	lw	a2,0(sp)
	sw	a2,12(a4)
	lw	a2,40(sp)
	sw	a2,4(a4)
	lw	a2,44(sp)
	sw	a2,8(a4)
	sw	a3,16(s0)
	j	.L160
.L130:
	lw	a0,12(s1)
	lw	a4,24(s0)
	sw	a0,36(s0)
	beq	a4,zero,.L136
	lw	a5,0(s0)
	slli	a3,a4,2
	add	a3,a3,a4
	slli	a3,a3,3
	li	t0,65536
	add	a3,a3,a5
	li	a1,3
	addi	t0,t0,-1
	j	.L153
.L150:
	addi	a5,a5,40
	beq	a5,a3,.L136
.L153:
	lw	a4,20(a5)
	bne	a4,a1,.L150
	lw	a4,8(a5)
	bltu	a0,a4,.L151
	bne	a0,t0,.L150
.L151:
	sw	zero,20(a5)
	lw	a4,40(s0)
	addi	a4,a4,-1
	sw	a4,40(s0)
	lw	a4,24(a5)
	bne	a4,zero,.L150
	lw	a4,44(s0)
	addi	a4,a4,-1
	sw	a4,44(s0)
	j	.L150
.L131:
	lw	a4,36(s0)
	li	a5,65536
	addi	a5,a5,-1
	beq	a4,a5,.L175
	lw	t0,8(s1)
	bgtu	t0,a4,.L175
	lw	a0,24(s0)
	lw	ra,0(s1)
	lw	a3,0(s0)
	beq	a0,zero,.L175
	mv	a5,a3
	li	a4,0
	li	t2,3
	j	.L144
.L141:
	addi	a4,a4,1
	addi	a5,a5,40
	beq	a0,a4,.L213
.L144:
	lw	a1,20(a5)
	bne	a1,t2,.L141
	lw	a1,8(a5)
	bne	a1,t0,.L141
	lw	a4,40(s0)
	lw	a1,24(a5)
	sw	zero,20(a5)
	addi	a5,a4,-1
	sw	a5,40(s0)
	beq	a1,zero,.L142
	lw	a0,24(s0)
.L143:
	lw	a5,4(sp)
	sub	t2,a5,ra
	bne	a0,zero,.L163
.L175:
	lw	a4,56(s0)
.L204:
	li	a5,1
	j	.L126
.L132:
	lw	a1,24(s0)
	lw	t0,4(s1)
	lw	a5,0(s0)
	beq	a1,zero,.L175
	li	a4,0
	li	a0,3
	j	.L140
.L138:
	addi	a4,a4,1
	addi	a5,a5,40
	beq	a1,a4,.L175
.L140:
	lw	a3,20(a5)
	bne	a3,a0,.L138
	lw	a3,8(a5)
	bne	t0,a3,.L138
	lw	a4,40(s0)
	lw	a3,24(a5)
	sw	zero,20(a5)
	addi	a5,a4,-1
	sw	a5,40(s0)
	bne	a3,zero,.L136
.L203:
	lw	a5,44(s0)
	addi	a5,a5,-1
	sw	a5,44(s0)
	j	.L136
.L133:
	lw	t2,0(s1)
	lw	a4,4(sp)
	lw	t0,24(s0)
	lw	a3,0(s0)
	sub	t2,a4,t2
	beq	t0,zero,.L205
	li	a1,0
	li	a0,1
	j	.L137
.L134:
	addi	a1,a1,1
	addi	a3,a3,40
	beq	t0,a1,.L205
.L137:
	lw	a4,20(a3)
	addi	a4,a4,-1
	bgtu	a4,a0,.L134
	lw	a4,8(a3)
	bne	t2,a4,.L134
	lw	a5,40(s0)
	lw	a4,24(a3)
	sw	zero,20(a3)
	addi	a5,a5,-1
	sw	a5,40(s0)
	beq	a4,zero,.L203
	j	.L136
.L124:
	sw	a4,24(sp)
	sw	t1,20(sp)
	call	SlidingWindowRefPicMarking
	lw	t1,20(sp)
	lw	a4,24(sp)
	mv	a5,a0
.L125:
	lw	a2,40(s0)
	lw	a3,24(s0)
	bgeu	a2,a3,.L176
	lw	a1,4(sp)
	lw	a3,44(s0)
	addi	a2,a2,1
	sw	a1,12(t1)
	sw	a1,8(t1)
	lw	a1,8(sp)
	addi	a3,a3,1
	sw	a1,16(t1)
	li	a1,2
	sw	a1,20(t1)
	lw	a1,16(sp)
	sw	a1,24(t1)
	sw	a3,44(s0)
	sw	a2,40(s0)
.L123:
	lw	a3,0(sp)
	lw	s1,28(s0)
	sw	a3,36(t1)
	lw	a3,40(sp)
	sw	a3,28(t1)
	lw	a3,44(sp)
	sw	a3,32(t1)
	bne	a4,zero,.L158
.L212:
	lw	a3,44(s0)
.L117:
	bgeu	s1,a3,.L160
	sw	a5,0(sp)
.L159:
	mv	a0,s0
	call	OutputPicture.part.0
	lw	a4,44(s0)
	bgtu	a4,s1,.L159
	lw	a5,0(sp)
.L160:
	lw	a0,0(s0)
	addi	a1,s1,1
	sw	a5,0(sp)
	call	ShellSort
	lw	a5,0(sp)
	lw	ra,36(sp)
	lw	s0,32(sp)
	lw	s1,28(sp)
	mv	a0,a5
	addi	sp,sp,40
	jr	ra
.L208:
	lw	a5,8(sp)
	sw	zero,20(t1)
	sw	a3,12(t1)
	sw	a5,16(t1)
	seqz	a5,a4
	sw	a3,8(t1)
	sw	a5,24(t1)
	bne	a4,zero,.L116
	lw	a3,44(a0)
	lw	a4,0(sp)
	lw	s1,28(a0)
	addi	a3,a3,1
	sw	a3,44(a0)
	sw	a4,36(t1)
	lw	a4,40(sp)
	li	a5,0
	sw	a4,28(t1)
	lw	a4,44(sp)
	sw	a4,32(t1)
	j	.L117
.L209:
	sw	zero,20(a0)
	sw	zero,16(a0)
	sw	t1,4(sp)
	call	Mmcop5
	lw	a5,0(s1)
	lw	t1,4(sp)
	lw	a4,56(s0)
	bne	a5,zero,.L120
	bne	a4,zero,.L120
.L121:
	lw	a5,4(s1)
	beq	a5,zero,.L165
	li	a3,3
	li	a5,0
.L122:
	sw	a3,20(t1)
	sw	a5,36(s0)
	lw	a5,16(sp)
	sw	zero,12(t1)
	sw	zero,8(t1)
	sw	a5,24(t1)
	sw	zero,16(t1)
	li	a5,1
	sw	a5,44(s0)
	sw	a5,40(s0)
	li	a5,0
	j	.L123
.L120:
	sw	zero,16(s0)
	sw	zero,20(s0)
	j	.L121
.L116:
	lw	a5,0(sp)
	lw	s1,28(a0)
	sw	a5,36(t1)
	lw	a5,40(sp)
	sw	a5,28(t1)
	lw	a5,44(sp)
	sw	a5,32(t1)
	li	a5,0
	j	.L158
.L210:
	lw	a3,40(s0)
.L155:
	lw	a4,56(s0)
	bleu	a1,a3,.L204
	lw	a1,4(sp)
	lw	a5,44(s0)
	seqz	a4,a4
	sw	a1,12(t1)
	lw	a1,8(sp)
	sw	t0,8(t1)
	sw	a4,24(t1)
	sw	a1,16(t1)
	li	a1,3
	sw	a1,20(t1)
	addi	a5,a5,1
	addi	a3,a3,1
	sw	a5,44(s0)
	li	a5,1
	sw	a3,40(s0)
	sw	a5,24(sp)
	j	.L136
.L213:
	lw	a5,4(sp)
	sub	t2,a5,ra
.L163:
	mv	a4,a3
	li	ra,1
	li	a3,0
	j	.L148
.L146:
	addi	a3,a3,1
	addi	a4,a4,40
	beq	a3,a0,.L175
.L148:
	lw	a5,20(a4)
	addi	a1,a5,-1
	bgtu	a1,ra,.L146
	lw	a1,8(a4)
	bne	a1,t2,.L146
	beq	a5,ra,.L205
	li	a5,3
	sw	a5,20(a4)
	sw	t0,8(a4)
	j	.L136
.L176:
	li	a5,1
	j	.L123
.L165:
	li	a5,65536
	li	a3,2
	addi	a5,a5,-1
	j	.L122
.L142:
	lw	a5,44(s0)
	lw	a0,24(s0)
	addi	a5,a5,-1
	sw	a5,44(s0)
	j	.L143
.L211:
	lw	a5,4(sp)
	lw	a4,56(s0)
	sw	zero,4(sp)
	j	.L126
	.size	h264bsdMarkDecRefPic, .-h264bsdMarkDecRefPic
	.section	.text.h264bsdGetRefPicData,"ax",@progbits
	.align	2
	.globl	h264bsdGetRefPicData
	.hidden	h264bsdGetRefPicData
	.type	h264bsdGetRefPicData, @function
h264bsdGetRefPicData:
	li	a5,16
	bgtu	a1,a5,.L217
	lw	a5,4(a0)
	slli	a1,a1,2
	add	a5,a5,a1
	lw	a0,0(a5)
	beq	a0,zero,.L214
	lw	a4,20(a0)
	li	a5,1
	bleu	a4,a5,.L217
	lw	a0,0(a0)
	ret
.L217:
	li	a0,0
.L214:
	ret
	.size	h264bsdGetRefPicData, .-h264bsdGetRefPicData
	.section	.text.h264bsdAllocateDpbImage,"ax",@progbits
	.align	2
	.globl	h264bsdAllocateDpbImage
	.hidden	h264bsdAllocateDpbImage
	.type	h264bsdAllocateDpbImage, @function
h264bsdAllocateDpbImage:
	lw	a3,28(a0)
	lw	a4,0(a0)
	slli	a5,a3,2
	add	a5,a5,a3
	slli	a5,a5,3
	add	a5,a4,a5
	sw	a5,8(a0)
	lw	a0,0(a5)
	ret
	.size	h264bsdAllocateDpbImage, .-h264bsdAllocateDpbImage
	.section	.text.h264bsdInitDpb,"ax",@progbits
	.align	2
	.globl	h264bsdInitDpb
	.hidden	h264bsdInitDpb
	.type	h264bsdInitDpb, @function
h264bsdInitDpb:
	addi	sp,sp,-24
	sw	s1,12(sp)
	mv	s1,a0
	li	a0,65536
	sw	s0,16(sp)
	sw	ra,20(sp)
	addi	a0,a0,-1
	sw	a0,36(s1)
	mv	s0,a1
	bne	a3,zero,.L223
	li	a3,1
.L223:
	sw	a3,24(s1)
	beq	a5,zero,.L224
	mv	a2,a3
.L224:
	sw	a2,28(s1)
	sw	a4,32(s1)
	sw	a5,56(s1)
	sw	zero,44(s1)
	sw	zero,40(s1)
	sw	zero,48(s1)
	li	a0,680
	call	malloc
	sw	a0,0(s1)
	beq	a0,zero,.L228
	li	a2,680
	li	a1,0
	call	memset
	lw	a4,28(s1)
	li	a5,-1
	beq	a4,a5,.L231
	slli	a5,s0,1
	add	a5,a5,s0
	slli	a5,a5,7
	addi	a5,a5,47
	lw	a3,0(s1)
	sw	a5,8(sp)
	li	a4,0
	j	.L230
.L247:
	lw	a2,28(s1)
	sw	a5,0(s0)
	addi	a5,a2,1
	bleu	a5,a4,.L231
.L230:
	slli	s0,a4,2
	add	s0,s0,a4
	lw	a0,8(sp)
	slli	s0,s0,3
	add	a5,a3,s0
	sw	a4,4(sp)
	sw	a5,0(sp)
	call	malloc
	lw	a3,0(s1)
	lw	a5,0(sp)
	lw	a4,4(sp)
	add	s0,a3,s0
	sw	a0,4(a5)
	lw	a2,4(s0)
	addi	a4,a4,1
	neg	a5,a2
	andi	a5,a5,15
	add	a5,a2,a5
	bne	a2,zero,.L247
.L228:
	lw	ra,20(sp)
	lw	s0,16(sp)
	li	a0,65536
	lw	s1,12(sp)
	addi	a0,a0,-1
	addi	sp,sp,24
	jr	ra
.L231:
	li	a0,68
	call	malloc
	lw	a5,28(s1)
	sw	a0,4(s1)
	addi	a0,a5,1
	slli	a0,a0,4
	call	malloc
	mv	a5,a0
	lw	a0,4(s1)
	sw	a5,12(s1)
	beq	a0,zero,.L228
	beq	a5,zero,.L228
	li	a2,68
	li	a1,0
	call	memset
	lw	ra,20(sp)
	lw	s0,16(sp)
	sw	zero,20(s1)
	sw	zero,16(s1)
	li	a0,0
	lw	s1,12(sp)
	addi	sp,sp,24
	jr	ra
	.size	h264bsdInitDpb, .-h264bsdInitDpb
	.section	.text.h264bsdInitRefPicList,"ax",@progbits
	.align	2
	.globl	h264bsdInitRefPicList
	.hidden	h264bsdInitRefPicList
	.type	h264bsdInitRefPicList, @function
h264bsdInitRefPicList:
	lw	a2,40(a0)
	beq	a2,zero,.L248
	lw	a5,4(a0)
	slli	a2,a2,2
	li	a3,0
	add	a2,a2,a5
.L250:
	lw	a4,0(a0)
	addi	a5,a5,4
	add	a4,a4,a3
	sw	a4,-4(a5)
	addi	a3,a3,40
	bne	a5,a2,.L250
.L248:
	ret
	.size	h264bsdInitRefPicList, .-h264bsdInitRefPicList
	.globl	__umodsi3
	.section	.text.h264bsdCheckGapsInFrameNum,"ax",@progbits
	.align	2
	.globl	h264bsdCheckGapsInFrameNum
	.hidden	h264bsdCheckGapsInFrameNum
	.type	h264bsdCheckGapsInFrameNum, @function
h264bsdCheckGapsInFrameNum:
	addi	sp,sp,-52
	sw	ra,48(sp)
	sw	s0,44(sp)
	sw	s1,40(sp)
	sw	zero,16(a0)
	sw	zero,20(a0)
	sw	a1,16(sp)
	sw	a2,32(sp)
	beq	a3,zero,.L274
	lw	a5,48(a0)
	mv	s0,a0
	mv	s1,a1
	snez	a0,a2
	beq	a5,a1,.L255
	lw	a4,32(s0)
	addi	a0,a5,1
	mv	a1,a4
	sw	a4,4(sp)
	call	__umodsi3
	sw	a0,0(sp)
	beq	a0,s1,.L258
	lw	s1,28(s0)
	lw	a3,0(s0)
	lw	a4,40(s0)
	slli	a5,s1,2
	add	a5,a5,s1
	slli	a5,a5,3
	add	a5,a3,a5
	sw	a5,20(sp)
	lw	a5,0(a5)
	sw	a3,8(sp)
	sw	a5,36(sp)
	addi	a5,s1,1
	sw	a5,24(sp)
.L267:
	beq	a4,zero,.L264
	slli	a2,a4,2
	add	a2,a2,a4
	lw	a4,8(sp)
	slli	a2,a2,3
	lw	a3,0(sp)
	mv	a5,a4
	add	a2,a2,a4
	li	a1,1
	j	.L263
.L261:
	addi	a5,a5,40
	beq	a5,a2,.L264
.L263:
	lw	a4,20(a5)
	addi	a4,a4,-1
	bgtu	a4,a1,.L261
	lw	a4,12(a5)
	bgeu	a3,a4,.L262
	lw	a0,4(sp)
	sub	a4,a4,a0
.L262:
	sw	a4,8(a5)
	addi	a5,a5,40
	bne	a5,a2,.L263
.L264:
	mv	a0,s0
	call	SlidingWindowRefPicMarking
	sw	a0,28(sp)
	bne	a0,zero,.L290
	lw	a5,44(s0)
.L265:
	bgtu	s1,a5,.L291
	lw	a4,56(s0)
	bne	a4,zero,.L265
	mv	a0,s0
	call	OutputPicture.part.0
	lw	a5,44(s0)
	j	.L265
.L274:
	li	a0,0
.L255:
	lw	ra,48(sp)
	lw	s0,44(sp)
	lw	s1,40(sp)
	addi	sp,sp,52
	jr	ra
.L291:
	lw	a3,20(sp)
	lw	a2,0(sp)
	lw	a4,40(s0)
	lw	a0,8(sp)
	sw	a2,12(a3)
	sw	a2,8(a3)
	lw	a1,24(sp)
	li	a2,1
	sw	a2,20(a3)
	sw	zero,16(a3)
	sw	zero,24(a3)
	addi	a4,a4,1
	addi	a5,a5,1
	sw	a4,40(s0)
	sw	a5,44(s0)
	sw	a4,12(sp)
	call	ShellSort
	lw	a2,0(sp)
	lw	a1,4(sp)
	addi	a0,a2,1
	call	__umodsi3
	lw	a3,16(sp)
	sw	a0,0(sp)
	lw	a4,12(sp)
	bne	a3,a0,.L267
	lw	a2,16(s0)
	beq	a2,zero,.L258
	lw	a5,20(sp)
	li	a4,0
	lw	a1,0(a5)
	lw	a5,12(s0)
.L271:
	lw	a3,0(a5)
	addi	a4,a4,1
	addi	a5,a5,16
	beq	a3,a1,.L292
	bne	a2,a4,.L271
.L258:
	lw	a5,32(sp)
	beq	a5,zero,.L293
	lw	a5,16(sp)
	lw	ra,48(sp)
	lw	s1,40(sp)
	sw	a5,48(s0)
	lw	s0,44(sp)
	li	a0,0
	addi	sp,sp,52
	jr	ra
.L290:
	lw	ra,48(sp)
	lw	s0,44(sp)
	lw	s1,40(sp)
	li	a0,1
	addi	sp,sp,52
	jr	ra
.L293:
	lw	a5,16(sp)
	lw	a1,4(sp)
	addi	a0,a5,-1
	add	a0,a0,a1
	call	__umodsi3
	sw	a0,48(s0)
	lw	ra,48(sp)
	lw	s0,44(sp)
	lw	s1,40(sp)
	li	a0,0
	addi	sp,sp,52
	jr	ra
.L292:
	beq	s1,zero,.L258
	lw	a5,8(sp)
	lw	a2,36(sp)
	lw	a4,28(sp)
	j	.L270
.L269:
	addi	a5,a5,40
	beq	s1,a4,.L258
.L270:
	lw	a3,0(a5)
	addi	a4,a4,1
	bne	a3,a2,.L269
	sw	a1,0(a5)
	lw	a4,36(sp)
	lw	a5,20(sp)
	sw	a4,0(a5)
	j	.L258
	.size	h264bsdCheckGapsInFrameNum, .-h264bsdCheckGapsInFrameNum
	.section	.text.h264bsdDpbOutputPicture,"ax",@progbits
	.align	2
	.globl	h264bsdDpbOutputPicture
	.hidden	h264bsdDpbOutputPicture
	.type	h264bsdDpbOutputPicture, @function
h264bsdDpbOutputPicture:
	lw	a5,20(a0)
	lw	a4,16(a0)
	bgeu	a5,a4,.L296
	lw	a4,12(a0)
	addi	a3,a5,1
	slli	a5,a5,4
	sw	a3,20(a0)
	add	a0,a4,a5
	ret
.L296:
	li	a0,0
	ret
	.size	h264bsdDpbOutputPicture, .-h264bsdDpbOutputPicture
	.section	.text.h264bsdFlushDpb,"ax",@progbits
	.align	2
	.globl	h264bsdFlushDpb
	.hidden	h264bsdFlushDpb
	.type	h264bsdFlushDpb, @function
h264bsdFlushDpb:
	lw	a5,0(a0)
	beq	a5,zero,.L305
	addi	sp,sp,-12
	lw	a5,56(a0)
	sw	s0,4(sp)
	sw	ra,8(sp)
	li	a4,1
	sw	a4,60(a0)
	mv	s0,a0
	beq	a5,zero,.L303
.L297:
	lw	ra,8(sp)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
.L303:
	mv	a0,s0
	call	OutputPicture.part.0
	bne	a0,zero,.L297
	mv	a0,s0
	call	OutputPicture.part.0
	beq	a0,zero,.L303
	j	.L297
.L305:
	ret
	.size	h264bsdFlushDpb, .-h264bsdFlushDpb
	.section	.text.h264bsdFreeDpb,"ax",@progbits
	.align	2
	.globl	h264bsdFreeDpb
	.hidden	h264bsdFreeDpb
	.type	h264bsdFreeDpb, @function
h264bsdFreeDpb:
	mv	a4,a0
	lw	a0,0(a0)
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	beq	a0,zero,.L310
	lw	a3,28(a4)
	li	a5,-1
	beq	a3,a5,.L310
	li	s1,0
.L311:
	slli	s0,s1,2
	add	s0,s0,s1
	slli	s0,s0,3
	add	a0,a0,s0
	lw	a0,4(a0)
	sw	a4,0(sp)
	addi	s1,s1,1
	call	free
	lw	a4,0(sp)
	lw	a0,0(a4)
	lw	a5,28(a4)
	add	s0,a0,s0
	sw	zero,4(s0)
	addi	a5,a5,1
	bgtu	a5,s1,.L311
.L310:
	sw	a4,0(sp)
	call	free
	lw	a4,0(sp)
	lw	a0,4(a4)
	sw	zero,0(a4)
	call	free
	lw	a4,0(sp)
	lw	a0,12(a4)
	sw	zero,4(a4)
	call	free
	lw	a4,0(sp)
	lw	ra,12(sp)
	lw	s0,8(sp)
	sw	zero,12(a4)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
	.size	h264bsdFreeDpb, .-h264bsdFreeDpb
	.section	.text.h264bsdResetDpb,"ax",@progbits
	.align	2
	.globl	h264bsdResetDpb
	.hidden	h264bsdResetDpb
	.type	h264bsdResetDpb, @function
h264bsdResetDpb:
	addi	sp,sp,-28
	sw	s0,20(sp)
	sw	s1,16(sp)
	sw	ra,24(sp)
	mv	s0,a0
	mv	s1,a1
	sw	a2,12(sp)
	sw	a3,8(sp)
	sw	a4,4(sp)
	sw	a5,0(sp)
	call	h264bsdFreeDpb
	mv	a0,s0
	lw	s0,20(sp)
	lw	a5,0(sp)
	lw	a4,4(sp)
	lw	a3,8(sp)
	lw	a2,12(sp)
	lw	ra,24(sp)
	mv	a1,s1
	lw	s1,16(sp)
	addi	sp,sp,28
	tail	h264bsdInitDpb
	.size	h264bsdResetDpb, .-h264bsdResetDpb
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
