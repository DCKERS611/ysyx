#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"h264bsd_macroblock_layer.c"
	.option nopic
	.text
	.section	.text.DetermineNc,"ax",@progbits
	.align	2
	.type	DetermineNc, @function
DetermineNc:
	addi	sp,sp,-20
	sw	s0,12(sp)
	mv	s0,a0
	mv	a0,a1
	sw	a2,4(sp)
	sw	ra,16(sp)
	sw	s1,8(sp)
	sw	a1,0(sp)
	call	h264bsdNeighbour4x4BlockA
	lw	a1,0(sp)
	mv	s1,a0
	mv	a0,a1
	call	h264bsdNeighbour4x4BlockB
	lw	a2,0(s1)
	li	a3,4
	lbu	a4,4(s1)
	lbu	s1,4(a0)
	beq	a2,a3,.L14
	lw	a2,0(a0)
	sw	a4,0(sp)
	lw	a1,200(s0)
	beq	a2,a3,.L15
	mv	a0,s0
	call	h264bsdIsNeighbourAvailable
	beq	a0,zero,.L8
	lw	a4,0(sp)
	lw	a3,200(s0)
	lw	a1,204(s0)
	addi	a4,a4,8
	slli	a4,a4,1
	add	a4,a3,a4
	lh	a4,12(a4)
	mv	a0,s0
	sw	a4,0(sp)
	call	h264bsdIsNeighbourAvailable
	lw	a4,0(sp)
	bne	a0,zero,.L9
.L12:
	mv	a0,a4
.L1:
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L15:
	lw	a5,4(sp)
	slli	s1,s1,1
	mv	a0,s0
	add	a5,a5,s1
	lh	s1,0(a5)
	call	h264bsdIsNeighbourAvailable
	lw	a4,0(sp)
	beq	a0,zero,.L16
	lw	a5,200(s0)
	addi	a4,a4,8
	slli	a4,a4,1
	add	a5,a5,a4
	lh	a5,12(a5)
	lw	ra,16(sp)
	lw	s0,12(sp)
	add	a5,a5,s1
	addi	a5,a5,1
	lw	s1,8(sp)
	srai	a0,a5,1
	addi	sp,sp,20
	jr	ra
.L14:
	lw	a5,4(sp)
	lw	a3,0(a0)
	slli	a4,a4,1
	add	a4,a5,a4
	lh	a4,0(a4)
	beq	a3,a2,.L17
	lw	a1,204(s0)
	mv	a0,s0
	sw	a4,0(sp)
	call	h264bsdIsNeighbourAvailable
	lw	a4,0(sp)
	beq	a0,zero,.L12
.L9:
	lw	a5,204(s0)
	addi	s1,s1,8
	slli	s1,s1,1
	add	a5,a5,s1
	lh	a5,12(a5)
	lw	ra,16(sp)
	lw	s0,12(sp)
	add	a5,a5,a4
	addi	a5,a5,1
	lw	s1,8(sp)
	srai	a0,a5,1
	addi	sp,sp,20
	jr	ra
.L8:
	lw	a1,204(s0)
	mv	a0,s0
	call	h264bsdIsNeighbourAvailable
	beq	a0,zero,.L1
	lw	a5,204(s0)
	lw	ra,16(sp)
	lw	s0,12(sp)
	addi	s1,s1,8
	slli	s1,s1,1
	add	a5,a5,s1
	lh	a0,12(a5)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L16:
	lw	ra,16(sp)
	lw	s0,12(sp)
	mv	a0,s1
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L17:
	slli	s1,s1,1
	add	s1,a5,s1
	lh	a5,0(s1)
	lw	ra,16(sp)
	lw	s0,12(sp)
	add	a5,a5,a4
	addi	a5,a5,1
	lw	s1,8(sp)
	srai	a0,a5,1
	addi	sp,sp,20
	jr	ra
	.size	DetermineNc, .-DetermineNc
	.section	.text.h264bsdDecodeMacroblockLayer,"ax",@progbits
	.align	2
	.globl	h264bsdDecodeMacroblockLayer
	.hidden	h264bsdDecodeMacroblockLayer
	.type	h264bsdDecodeMacroblockLayer, @function
h264bsdDecodeMacroblockLayer:
	addi	sp,sp,-60
	mv	a5,a2
	mv	t1,a1
	li	a2,4096
	sw	s0,52(sp)
	sw	a1,0(sp)
	mv	s0,a0
	li	a1,0
	addi	a2,a2,-2008
	mv	a0,t1
	sw	a5,8(sp)
	sw	ra,56(sp)
	sw	s1,48(sp)
	sw	a4,4(sp)
	mv	s1,a3
	call	memset
	addi	a1,sp,36
	mv	a0,s0
	call	h264bsdDecodeExpGolombUnsigned
	li	a5,2
	beq	s1,a5,.L19
	li	a5,7
	beq	s1,a5,.L19
	lw	t1,36(sp)
	li	a5,31
	addi	t1,t1,1
	bgtu	t1,a5,.L46
	bne	a0,zero,.L46
.L119:
	lw	a5,0(sp)
	sw	t1,0(a5)
	li	a5,31
	beq	t1,a5,.L25
	li	a5,5
	bleu	t1,a5,.L117
	li	a5,6
	beq	t1,a5,.L32
.L53:
	addi	a1,sp,40
	mv	a0,s0
	sw	t1,4(sp)
	call	h264bsdDecodeExpGolombUnsigned
	lw	t1,4(sp)
	mv	s1,a0
	bne	a0,zero,.L46
	lw	a5,40(sp)
	li	a4,3
	bgtu	a5,a4,.L46
	lw	a4,0(sp)
	sw	a5,140(a4)
	li	a5,6
	beq	t1,a5,.L75
	lw	a5,0(sp)
	li	a3,18
	lw	a4,0(a5)
	addi	a5,a4,-7
	srli	a5,a5,2
	bgtu	a4,a3,.L78
	li	a4,2
	bgtu	a5,a4,.L57
.L58:
	slli	a5,a5,4
	add	a0,a5,s1
	lw	a5,0(sp)
	sw	a0,4(a5)
.L55:
	addi	a1,sp,44
	mv	a0,s0
	call	h264bsdDecodeExpGolombSigned
	mv	s1,a0
	bne	a0,zero,.L46
	lw	a5,44(sp)
	li	a3,51
	addi	a2,a5,26
	bleu	a2,a3,.L118
.L46:
	li	a5,1
.L18:
	lw	ra,56(sp)
	lw	s0,52(sp)
	lw	s1,48(sp)
	mv	a0,a5
	addi	sp,sp,60
	jr	ra
.L19:
	lw	t1,36(sp)
	li	a5,31
	addi	t1,t1,6
	bgtu	t1,a5,.L46
	beq	a0,zero,.L119
	j	.L46
.L27:
	call	h264bsdGetBits
	bne	a0,zero,.L46
.L25:
	mv	a0,s0
	call	h264bsdIsByteAligned
	mv	a5,a0
	li	a1,1
	mv	a0,s0
	beq	a5,zero,.L27
	lw	a5,0(sp)
	addi	s1,a5,328
	addi	a5,a5,1864
	sw	a5,0(sp)
	j	.L28
.L120:
	lw	a5,0(sp)
	sw	a0,-4(s1)
	beq	s1,a5,.L59
.L28:
	li	a1,8
	mv	a0,s0
	call	h264bsdGetBits
	sw	a0,36(sp)
	li	a5,-1
	addi	s1,s1,4
	bne	a0,a5,.L120
	j	.L46
.L32:
	lw	a5,0(sp)
	sw	zero,44(sp)
	sw	t1,4(sp)
	addi	s1,a5,44
.L45:
	mv	a0,s0
	call	h264bsdShowBits32
	mv	a4,a0
	addi	a5,s1,-32
	li	a0,0
	j	.L52
.L122:
	sw	a1,64(a5)
	addi	a5,a5,4
	slli	a4,a4,4
	addi	a0,a0,1
	beq	s1,a5,.L121
.L52:
	srli	a3,a4,31
	slli	a2,a4,1
	sw	a3,0(a5)
	srli	a1,a2,29
	beq	a3,zero,.L122
	addi	a5,a5,4
	mv	a4,a2
	bne	s1,a5,.L52
.L121:
	slli	a1,a0,1
	add	a1,a1,a0
	addi	a1,a1,8
	mv	a0,s0
	sw	a4,40(sp)
	call	h264bsdFlushBits
	li	a5,-1
	beq	a0,a5,.L46
	lw	a5,44(sp)
	li	a4,1
	addi	s1,s1,32
	addi	a5,a5,1
	sw	a5,44(sp)
	ble	a5,a4,.L45
	lw	t1,4(sp)
	j	.L53
.L117:
	li	a5,3
	bgtu	t1,a5,.L123
	lw	a4,4(sp)
	li	a5,1
	bgtu	a4,a5,.L73
	sltiu	a5,t1,2
	sw	a5,24(sp)
.L74:
	lw	a5,24(sp)
	lw	a4,0(sp)
	sw	s0,4(sp)
	xori	s1,a5,1
	slli	s1,s1,2
	addi	a5,a4,164
	add	a5,s1,a5
	addi	a4,a4,160
	sw	a5,12(sp)
	addi	s1,sp,44
	mv	s0,a4
.L49:
	lw	a0,4(sp)
	mv	a1,s1
	call	h264bsdDecodeExpGolombSigned
	mv	a5,a0
	mv	a1,s1
	lw	a0,4(sp)
	bne	a5,zero,.L18
	lw	a5,44(sp)
	sh	a5,0(s0)
	call	h264bsdDecodeExpGolombSigned
	mv	a5,a0
	bne	a0,zero,.L18
	lw	a5,44(sp)
	addi	s0,s0,4
	sh	a5,-2(s0)
	lw	a5,12(sp)
	bne	s0,a5,.L49
	lw	s0,4(sp)
	li	s1,2
.L75:
	seqz	a2,s1
.L72:
	addi	a1,sp,36
	mv	a0,s0
	call	h264bsdDecodeExpGolombMapped
	mv	a5,a0
	bne	a0,zero,.L18
	lw	a5,36(sp)
	lw	a4,0(sp)
	sw	a5,4(a4)
	bne	a5,zero,.L55
	li	a5,1
	beq	s1,a5,.L55
.L59:
	li	a5,0
	j	.L18
.L78:
	li	s1,15
.L57:
	addi	a5,a5,-3
	j	.L58
.L73:
	sltiu	a5,t1,2
	sw	a5,24(sp)
	xori	a5,a5,1
	lw	a4,4(sp)
	slli	a3,a5,2
	lw	a5,0(sp)
	sltiu	a2,a4,3
	xori	a2,a2,1
	addi	a4,a5,148
	add	s1,a3,a4
	addi	a5,a5,144
	sw	s1,20(sp)
	sw	s0,16(sp)
	addi	a1,sp,40
	mv	s1,a2
	mv	s0,a5
	j	.L47
.L125:
	lw	a4,40(sp)
	lw	a5,4(sp)
	bleu	a5,a4,.L46
	lw	a5,20(sp)
	sw	a4,0(s0)
	addi	s0,s0,4
	lw	a1,12(sp)
	beq	s0,a5,.L124
.L47:
	lw	a0,16(sp)
	mv	a2,s1
	sw	a1,12(sp)
	call	h264bsdDecodeExpGolombTruncated
	beq	a0,zero,.L125
	j	.L46
.L118:
	lw	a4,0(sp)
	lw	a2,4(a4)
	lw	a3,0(a4)
	sw	a5,8(a4)
	sw	a2,4(sp)
	addi	a2,a4,272
	li	a5,6
	sw	a2,20(sp)
	bleu	a3,a5,.L79
	lw	a0,8(sp)
	li	a1,0
	call	DetermineNc
	lw	a4,0(sp)
	mv	a2,a0
	li	a3,16
	addi	a1,a4,1864
	mv	a0,s0
	call	h264bsdDecodeResidualBlockCavlc
	andi	a3,a0,15
	mv	a5,a0
	bne	a3,zero,.L61
	lw	a4,0(sp)
	srli	a5,a0,4
	andi	a5,a5,255
	sh	a5,320(a4)
	li	a5,1
	sw	a5,28(sp)
.L60:
	li	a5,4
	sw	s0,16(sp)
	sw	a5,12(sp)
	mv	s0,s1
.L67:
	lw	a5,4(sp)
	andi	a4,a5,1
	srli	a5,a5,1
	sw	a5,4(sp)
	bne	a4,zero,.L126
	addi	s0,s0,4
.L66:
	lw	a5,12(sp)
	addi	a5,a5,-1
	sw	a5,12(sp)
	bne	a5,zero,.L67
	lw	a4,4(sp)
	mv	s1,s0
	lw	s0,16(sp)
	andi	a3,a4,3
	bne	a3,zero,.L127
.L68:
	lw	a4,4(sp)
	andi	a3,a4,2
	beq	a3,zero,.L61
	lw	a4,0(sp)
	addi	t0,s1,136
	addi	t1,s1,498
	slli	t0,t0,1
	slli	t1,t1,2
	add	t0,a4,t0
	add	t1,a4,t1
	addi	a3,s1,8
	addi	a4,a4,332
	sw	a3,16(sp)
	sw	a4,12(sp)
	sw	a5,24(sp)
.L70:
	lw	a2,20(sp)
	lw	a0,8(sp)
	mv	a1,s1
	sw	t0,4(sp)
	sw	t1,0(sp)
	call	DetermineNc
	lw	a5,12(sp)
	slli	a1,s1,6
	mv	a2,a0
	li	a3,15
	add	a1,a5,a1
	mv	a0,s0
	call	h264bsdDecodeResidualBlockCavlc
	srli	a4,a0,4
	andi	a3,a0,15
	andi	a4,a4,255
	srli	a2,a0,15
	addi	s1,s1,1
	bne	a3,zero,.L83
	lw	t0,4(sp)
	lw	t1,0(sp)
	lw	a5,16(sp)
	sh	a4,0(t0)
	sw	a2,0(t1)
	addi	t0,t0,2
	addi	t1,t1,4
	bne	s1,a5,.L70
	lw	a5,24(sp)
.L61:
	lw	a4,4(s0)
	lw	a2,0(s0)
	lw	a3,8(s0)
	sub	a4,a4,a2
	slli	a4,a4,3
	add	a4,a4,a3
	sw	a4,16(s0)
	j	.L18
.L123:
	lw	a4,0(sp)
	sw	s0,16(sp)
	addi	a1,sp,40
	addi	a5,a4,176
	sw	a4,28(sp)
	addi	a4,a4,192
	sw	a5,24(sp)
	sw	a4,20(sp)
	li	s1,3
	sw	t1,32(sp)
	mv	s0,a5
.L36:
	lw	a0,16(sp)
	sw	a1,12(sp)
	call	h264bsdDecodeExpGolombUnsigned
	bne	a0,zero,.L46
	lw	a4,40(sp)
	bgtu	a4,s1,.L46
	lw	a5,20(sp)
	sw	a4,0(s0)
	addi	s0,s0,4
	lw	a1,12(sp)
	bne	s0,a5,.L36
	lw	a3,4(sp)
	li	a4,1
	mv	a5,s0
	lw	t1,32(sp)
	lw	s0,16(sp)
	bleu	a3,a4,.L39
	li	a4,5
	beq	t1,a4,.L39
	lw	a4,4(sp)
	sltiu	a2,a4,3
	lw	a4,0(sp)
	xori	a2,a2,1
	addi	s1,a4,208
	sw	s1,20(sp)
	mv	s1,s0
	mv	s0,a5
.L40:
	mv	a0,s1
	sw	a2,16(sp)
	sw	a1,12(sp)
	call	h264bsdDecodeExpGolombTruncated
	bne	a0,zero,.L46
	lw	a4,40(sp)
	lw	a5,4(sp)
	bleu	a5,a4,.L46
	lw	a5,20(sp)
	sw	a4,0(s0)
	addi	s0,s0,4
	lw	a1,12(sp)
	lw	a2,16(sp)
	bne	a5,s0,.L40
	mv	s0,s1
.L39:
	lw	a5,0(sp)
	addi	s1,sp,44
	sw	s0,4(sp)
	addi	a5,a5,64
	sw	a5,12(sp)
.L38:
	lw	a5,24(sp)
	lw	a5,0(a5)
	beq	a5,zero,.L41
	addi	a4,a5,-1
	li	a3,1
	li	a5,1
	bgtu	a4,a3,.L128
.L41:
	lw	s0,28(sp)
	sw	a5,40(sp)
.L43:
	lw	a0,4(sp)
	mv	a1,s1
	call	h264bsdDecodeExpGolombSigned
	mv	a5,a0
	mv	a1,s1
	lw	a0,4(sp)
	bne	a5,zero,.L18
	lw	a5,44(sp)
	sh	a5,208(s0)
	call	h264bsdDecodeExpGolombSigned
	mv	a5,a0
	bne	a0,zero,.L18
	lw	a2,40(sp)
	lw	a4,44(sp)
	addi	s0,s0,4
	addi	a5,a2,-1
	sw	a5,40(sp)
	sh	a4,206(s0)
	bne	a2,zero,.L43
	lw	a4,24(sp)
	lw	a5,28(sp)
	addi	a4,a4,4
	sw	a4,24(sp)
	lw	a4,12(sp)
	addi	a5,a5,16
	sw	a5,28(sp)
	bne	a4,a5,.L38
	lw	s0,4(sp)
	li	s1,2
	j	.L72
.L126:
	lw	a5,0(sp)
	slli	t1,s0,6
	slli	a4,s0,1
	addi	t1,t1,332
	add	s1,a5,t1
	add	a4,a5,a4
	addi	a5,s0,4
	sw	a5,32(sp)
	mv	a5,s1
	sw	a4,24(sp)
	mv	s1,s0
	mv	s0,a5
.L65:
	lw	a2,20(sp)
	lw	a0,8(sp)
	mv	a1,s1
	call	DetermineNc
	lw	a5,28(sp)
	mv	a2,a0
	li	a3,15
	lw	a0,16(sp)
	mv	a1,s0
	beq	a5,zero,.L63
	call	h264bsdDecodeResidualBlockCavlc
	srli	a2,a0,15
.L64:
	lw	a4,0(sp)
	slli	a3,s1,2
	srli	a5,a0,4
	add	a3,a4,a3
	sw	a2,1992(a3)
	andi	a3,a0,15
	andi	a5,a5,255
	addi	s1,s1,1
	bne	a3,zero,.L80
	lw	a4,24(sp)
	addi	s0,s0,64
	sh	a5,272(a4)
	addi	a5,a4,2
	sw	a5,24(sp)
	lw	a5,32(sp)
	bne	a5,s1,.L65
	mv	s0,s1
	j	.L66
.L63:
	lw	a0,16(sp)
	addi	a1,s0,-4
	li	a3,16
	call	h264bsdDecodeResidualBlockCavlc
	srli	a2,a0,16
	j	.L64
.L124:
	lw	s0,16(sp)
	j	.L74
.L128:
	li	a5,3
	j	.L41
.L127:
	lw	a5,0(sp)
	li	a3,4
	li	a2,-1
	addi	a1,a5,1928
	mv	a0,s0
	call	h264bsdDecodeResidualBlockCavlc
	andi	a2,a0,15
	mv	a3,a0
	bne	a2,zero,.L82
	lw	a5,0(sp)
	srli	a3,a0,4
	andi	a3,a3,255
	sh	a3,322(a5)
	li	a2,-1
	li	a3,4
	addi	a1,a5,1944
	mv	a0,s0
	call	h264bsdDecodeResidualBlockCavlc
	andi	a2,a0,15
	mv	a3,a0
	bne	a2,zero,.L82
	lw	a5,0(sp)
	srli	a3,a0,4
	andi	a3,a3,255
	sh	a3,324(a5)
	lw	a5,12(sp)
	j	.L68
.L79:
	sw	zero,28(sp)
	j	.L60
.L82:
	mv	a5,a3
	j	.L61
.L80:
	lw	s0,16(sp)
	mv	a5,a0
	j	.L61
.L83:
	mv	a5,a0
	j	.L61
	.size	h264bsdDecodeMacroblockLayer, .-h264bsdDecodeMacroblockLayer
	.section	.text.h264bsdMbPartPredMode,"ax",@progbits
	.align	2
	.globl	h264bsdMbPartPredMode
	.hidden	h264bsdMbPartPredMode
	.type	h264bsdMbPartPredMode, @function
h264bsdMbPartPredMode:
	li	a5,5
	bleu	a0,a5,.L131
	addi	a0,a0,-6
	snez	a0,a0
	ret
.L131:
	li	a0,2
	ret
	.size	h264bsdMbPartPredMode, .-h264bsdMbPartPredMode
	.section	.text.h264bsdNumMbPart,"ax",@progbits
	.align	2
	.globl	h264bsdNumMbPart
	.hidden	h264bsdNumMbPart
	.type	h264bsdNumMbPart, @function
h264bsdNumMbPart:
	li	a4,1
	bleu	a0,a4,.L134
	addi	a5,a0,-2
	li	a0,2
	bgtu	a5,a4,.L136
	ret
.L136:
	li	a0,4
	ret
.L134:
	li	a0,1
	ret
	.size	h264bsdNumMbPart, .-h264bsdNumMbPart
	.section	.text.h264bsdNumSubMbPart,"ax",@progbits
	.align	2
	.globl	h264bsdNumSubMbPart
	.hidden	h264bsdNumSubMbPart
	.type	h264bsdNumSubMbPart, @function
h264bsdNumSubMbPart:
	beq	a0,zero,.L139
	addi	a5,a0,-1
	li	a4,1
	li	a0,2
	bgtu	a5,a4,.L141
	ret
.L141:
	li	a0,4
	ret
.L139:
	li	a0,1
	ret
	.size	h264bsdNumSubMbPart, .-h264bsdNumSubMbPart
	.section	.text.h264bsdPredModeIntra16x16,"ax",@progbits
	.align	2
	.globl	h264bsdPredModeIntra16x16
	.hidden	h264bsdPredModeIntra16x16
	.type	h264bsdPredModeIntra16x16, @function
h264bsdPredModeIntra16x16:
	addi	a0,a0,-7
	andi	a0,a0,3
	ret
	.size	h264bsdPredModeIntra16x16, .-h264bsdPredModeIntra16x16
	.section	.text.h264bsdDecodeMacroblock,"ax",@progbits
	.align	2
	.globl	h264bsdDecodeMacroblock
	.hidden	h264bsdDecodeMacroblock
	.type	h264bsdDecodeMacroblock, @function
h264bsdDecodeMacroblock:
	addi	sp,sp,-60
	lw	t1,0(a1)
	sw	a1,0(sp)
	sw	a5,32(sp)
	mv	a1,a5
	lw	a5,60(sp)
	sw	s0,52(sp)
	mv	s0,a0
	lw	a0,196(a0)
	sw	a5,36(sp)
	lw	a5,64(sp)
	sw	s1,48(sp)
	sw	ra,56(sp)
	addi	a0,a0,1
	sw	t1,0(s0)
	sw	a0,196(s0)
	mv	a0,a2
	sw	t1,4(sp)
	sw	a5,16(sp)
	mv	s1,a4
	sw	a2,28(sp)
	sw	a3,40(sp)
	call	h264bsdSetCurrImageMbPointers
	lw	t1,4(sp)
	li	a5,31
	addi	a4,s0,28
	beq	t1,a5,.L199
	lw	a5,4(sp)
	li	a2,54
	bne	a5,zero,.L200
	li	a1,0
	mv	a0,a4
	call	memset
	lw	a5,0(s1)
	sw	a5,20(s0)
.L175:
	mv	a0,s0
	lw	s0,52(sp)
	lw	a5,16(sp)
	lw	a4,28(sp)
	lw	a3,32(sp)
	lw	a2,40(sp)
	lw	a1,0(sp)
	lw	ra,56(sp)
	lw	s1,48(sp)
	addi	sp,sp,60
	tail	h264bsdInterPrediction
.L200:
	lw	a5,0(sp)
	mv	a0,a4
	sw	a4,8(sp)
	addi	a1,a5,272
	call	memcpy
	lw	a5,0(sp)
	lw	a4,8(sp)
	lw	a1,8(a5)
	bne	a1,zero,.L151
	lw	a1,0(s1)
.L152:
	lw	a5,0(sp)
	lw	a2,0(s0)
	sw	a1,20(s0)
	li	a3,6
	addi	s1,a5,328
	addi	a5,a5,1992
	bleu	a2,a3,.L155
	lh	a3,76(s0)
	bne	a3,zero,.L201
.L156:
	mv	a2,a4
	lla	a4,.LANCHOR0
	mv	t1,s1
	sw	s0,20(sp)
	li	a3,0
	mv	s1,a4
	mv	s0,a2
	j	.L161
.L158:
	li	a3,16777216
	addi	a3,a3,-1
	sw	a3,0(t1)
.L159:
	lla	a4,.LANCHOR0+64
	addi	t1,t1,64
	addi	s0,s0,2
	addi	a5,a5,4
	beq	s1,a4,.L192
	lw	a3,0(s1)
.L161:
	lw	a4,0(sp)
	slli	a3,a3,2
	li	a2,1
	add	a3,a4,a3
	lw	a3,1864(a3)
	mv	a0,t1
	addi	s1,s1,4
	sw	a3,0(t1)
	bne	a3,zero,.L157
	lh	a3,0(s0)
	beq	a3,zero,.L158
.L157:
	lw	a3,0(a5)
	sw	a5,8(sp)
	lw	a5,20(sp)
	sw	t1,12(sp)
	lw	a1,20(a5)
	call	h264bsdProcessBlock
	lw	a5,8(sp)
	lw	t1,12(sp)
	beq	a0,zero,.L159
.L163:
	lw	ra,56(sp)
	lw	s0,52(sp)
	lw	s1,48(sp)
	li	a0,1
	addi	sp,sp,60
	jr	ra
.L199:
	lw	a3,196(s0)
	sw	zero,20(s0)
	li	a5,1
	bleu	a3,a5,.L145
	addi	s0,s0,76
	li	a5,16
.L146:
	addi	a4,a4,2
	sh	a5,-2(a4)
	bne	a4,s0,.L146
.L196:
	lw	ra,56(sp)
	lw	s0,52(sp)
	lw	s1,48(sp)
	li	a0,0
	addi	sp,sp,60
	jr	ra
.L151:
	lw	a5,0(s1)
	add	a1,a1,a5
	blt	a1,zero,.L202
	li	a5,51
	ble	a1,a5,.L195
	addi	a1,a1,-52
.L195:
	sw	a1,0(s1)
	j	.L152
.L155:
	addi	a3,s0,60
	sw	s0,20(sp)
	sw	a3,24(sp)
	mv	s0,a4
	li	t1,16777216
	mv	a4,s1
	mv	s1,a3
	j	.L165
.L162:
	sw	a2,0(a4)
	addi	a5,a5,4
	addi	a4,a4,64
	beq	s1,s0,.L203
.L165:
	lh	a3,0(s0)
	addi	a2,t1,-1
	addi	s0,s0,2
	beq	a3,zero,.L162
	lw	a3,0(a5)
	sw	a5,12(sp)
	lw	a5,20(sp)
	mv	a0,a4
	li	a2,0
	lw	a1,20(a5)
	sw	a4,8(sp)
	call	h264bsdProcessBlock
	lw	a4,8(sp)
	lw	a5,12(sp)
	li	t1,16777216
	bne	a0,zero,.L163
	addi	a4,a4,64
	addi	a5,a5,4
	bne	s1,s0,.L165
.L203:
	lw	s0,20(sp)
	mv	s1,a4
.L160:
	lw	a4,20(s0)
	lw	a2,24(s0)
	li	a3,51
	add	a4,a4,a2
	ble	a4,a3,.L166
	li	a4,51
.L167:
	slli	a4,a4,2
	lla	a2,h264bsdQpC
	add	a4,a2,a4
	lw	a4,0(a4)
	lh	a3,78(s0)
	sw	a4,8(sp)
	lw	a4,0(sp)
	addi	t1,a4,1928
	bne	a3,zero,.L168
	lh	a4,80(s0)
	beq	a4,zero,.L169
.L168:
	lw	a1,8(sp)
	mv	a0,t1
	sw	a5,20(sp)
	sw	t1,12(sp)
	call	h264bsdProcessChromaDc
	lw	a5,20(sp)
	lw	t1,12(sp)
.L169:
	li	a4,0
	sw	a5,20(sp)
	sw	s0,44(sp)
	lw	a5,8(sp)
	mv	s0,a4
	j	.L173
.L171:
	sw	t2,0(s1)
	li	a4,16
	addi	s1,s1,64
	beq	s0,a4,.L204
.L173:
	lw	a3,20(sp)
	slli	a4,s0,1
	lw	a2,24(sp)
	add	a4,a3,a4
	lw	a3,0(t1)
	add	t2,a2,s0
	mv	a0,s1
	sw	a3,0(s1)
	li	a2,1
	mv	a1,a5
	addi	s0,s0,2
	addi	t1,t1,4
	bne	a3,zero,.L170
	lh	a3,0(t2)
	li	t0,16777216
	addi	t2,t0,-1
	beq	a3,zero,.L171
.L170:
	lw	a3,0(a4)
	sw	t1,12(sp)
	sw	a5,8(sp)
	call	h264bsdProcessBlock
	lw	a5,8(sp)
	lw	t1,12(sp)
	bne	a0,zero,.L163
	li	a4,16
	addi	s1,s1,64
	bne	s0,a4,.L173
.L204:
	lw	a4,4(sp)
	li	a5,5
	lw	s0,44(sp)
	bleu	a4,a5,.L175
	mv	a0,s0
	lw	s0,52(sp)
	lw	a5,16(sp)
	lw	a4,36(sp)
	lw	a3,32(sp)
	lw	a2,28(sp)
	lw	a1,0(sp)
	lw	ra,56(sp)
	lw	s1,48(sp)
	addi	sp,sp,60
	tail	h264bsdIntraPrediction
.L145:
	lw	a5,0(sp)
	lw	a0,16(sp)
	addi	s0,s0,76
	addi	a1,a5,392
	li	t1,16
.L149:
	addi	a4,a4,2
	addi	a5,a1,-64
	mv	a3,a0
	sh	t1,-2(a4)
.L148:
	lw	a2,0(a5)
	addi	a5,a5,4
	addi	a3,a3,1
	sb	a2,-1(a3)
	bne	a5,a1,.L148
	addi	a0,a0,16
	addi	a1,a5,64
	bne	a4,s0,.L149
	lw	a1,16(sp)
	lw	a0,28(sp)
	call	h264bsdWriteMacroblock
	j	.L196
.L166:
	not	a3,a4
	srai	a3,a3,31
	and	a4,a4,a3
	j	.L167
.L192:
	sw	s0,24(sp)
	mv	s1,t1
	lw	s0,20(sp)
	j	.L160
.L202:
	addi	a1,a1,52
	sw	a1,0(s1)
	j	.L152
.L201:
	sw	a5,12(sp)
	lw	a5,0(sp)
	sw	a4,8(sp)
	addi	a0,a5,1864
	call	h264bsdProcessLumaDc
	lw	a5,12(sp)
	lw	a4,8(sp)
	j	.L156
	.size	h264bsdDecodeMacroblock, .-h264bsdDecodeMacroblock
	.section	.text.h264bsdSubMbPartMode,"ax",@progbits
	.align	2
	.globl	h264bsdSubMbPartMode
	.hidden	h264bsdSubMbPartMode
	.type	h264bsdSubMbPartMode, @function
h264bsdSubMbPartMode:
	ret
	.size	h264bsdSubMbPartMode, .-h264bsdSubMbPartMode
	.section	.rodata.dcCoeffIndex,"a"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	dcCoeffIndex, @object
	.size	dcCoeffIndex, 64
dcCoeffIndex:
	.word	0
	.word	1
	.word	4
	.word	5
	.word	2
	.word	3
	.word	6
	.word	7
	.word	8
	.word	9
	.word	12
	.word	13
	.word	10
	.word	11
	.word	14
	.word	15
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
