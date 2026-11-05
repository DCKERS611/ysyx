#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"h264bsd_cavlc.c"
	.option nopic
	.text
	.section	.text.h264bsdDecodeResidualBlockCavlc,"ax",@progbits
	.align	2
	.globl	h264bsdDecodeResidualBlockCavlc
	.hidden	h264bsdDecodeResidualBlockCavlc
	.type	h264bsdDecodeResidualBlockCavlc, @function
h264bsdDecodeResidualBlockCavlc:
	addi	sp,sp,-168
	sw	s0,160(sp)
	sw	s1,156(sp)
	sw	ra,164(sp)
	mv	s1,a0
	sw	a1,24(sp)
	mv	s0,a2
	sw	a3,12(sp)
	call	h264bsdShowBits32
	li	a5,1
	srli	a4,a0,16
	bleu	s0,a5,.L150
	li	a5,3
	bgtu	s0,a5,.L8
	li	a5,32768
	bltu	a4,a5,.L9
	li	a5,16384
	and	a5,a4,a5
	beq	a5,zero,.L151
	li	a1,2
	j	.L3
.L8:
	li	a5,7
	bgtu	s0,a5,.L13
	srli	a4,a0,26
	slli	a4,a4,1
	lla	a5,.LANCHOR7
	add	a5,a5,a4
	lhu	s0,0(a5)
	bne	s0,zero,.L14
	srli	a4,a0,22
	slli	a4,a4,1
	lla	a5,.LANCHOR8
	add	a5,a5,a4
	lhu	s0,0(a5)
.L5:
	beq	s0,zero,.L17
.L14:
	lw	a2,12(sp)
	srli	a3,s0,11
	andi	a1,s0,31
	li	a4,32
	sw	a3,0(sp)
	sll	a0,a0,a1
	sub	a5,a4,a1
	bgtu	a3,a2,.L17
	srli	s0,s0,5
	andi	a2,s0,63
	sw	a2,4(sp)
	beq	a3,zero,.L103
	mv	a3,a2
	bne	a2,zero,.L152
.L19:
	lw	a3,0(sp)
	li	a4,10
	bgtu	a3,a4,.L116
	li	a3,0
	li	s0,0
.L53:
	sw	s1,8(sp)
	mv	s1,s0
	mv	s0,a3
.L51:
	li	a4,15
	bleu	a5,a4,.L153
.L25:
	srli	a4,a0,16
	blt	a0,zero,.L26
	li	a1,16384
	bgeu	a4,a1,.L27
	li	a1,8192
	bgeu	a4,a1,.L28
	li	a1,4096
	bgeu	a4,a1,.L29
	li	a1,2047
	bgtu	a4,a1,.L30
	li	a1,1023
	bgtu	a4,a1,.L31
	li	a1,511
	bgtu	a4,a1,.L32
	li	a1,255
	bgtu	a4,a1,.L33
	li	a1,127
	bgtu	a4,a1,.L34
	li	a1,63
	bgtu	a4,a1,.L35
	li	a1,31
	bgtu	a4,a1,.L36
	li	t0,15
	bgtu	a4,t0,.L37
	li	a1,7
	bgtu	a4,a1,.L38
	li	a1,3
	bgtu	a4,a1,.L39
	li	a1,1
	bgtu	a4,a1,.L40
	beq	a4,zero,.L17
	slli	a0,a0,16
	addi	a5,a5,-16
	beq	s0,zero,.L105
	sll	t0,t0,s0
	mv	t1,s0
	li	s0,12
.L41:
	bltu	a5,s0,.L154
.L45:
	li	a4,32
	sub	a4,a4,s0
	srl	a4,a0,a4
	sub	a5,a5,s0
	sll	a0,a0,s0
	add	a4,a4,t0
	mv	s0,t1
	bne	t1,zero,.L46
	li	s0,1
.L46:
	lw	a3,4(sp)
	addi	a1,s0,-1
	li	t0,3
	sll	t0,t0,a1
	bne	s1,a3,.L47
.L156:
	li	a1,2
	bgtu	s1,a1,.L47
	addi	a4,a4,2
	j	.L47
.L150:
	li	a5,32768
	bgeu	a4,a5,.L101
	li	a5,4096
	addi	a5,a5,-1025
	bgtu	a4,a5,.L155
	li	a5,255
	bleu	a4,a5,.L6
	srli	a4,a0,22
	slli	a4,a4,1
	lla	a5,.LANCHOR1
	add	a5,a5,a4
	lhu	s0,0(a5)
	bne	s0,zero,.L14
.L17:
	lw	ra,164(sp)
	lw	s0,160(sp)
	lw	s1,156(sp)
	li	a0,1
	addi	sp,sp,168
	jr	ra
.L101:
	li	a1,1
.L3:
	sw	zero,0(sp)
	li	t1,0
.L18:
	mv	a0,s1
	sw	t1,4(sp)
	call	h264bsdFlushBits
	bne	a0,zero,.L17
	lw	a5,0(sp)
	lw	t1,4(sp)
	lw	ra,164(sp)
	lw	s0,160(sp)
	slli	a0,a5,4
	slli	t1,t1,16
	lw	s1,156(sp)
	or	a0,a0,t1
	addi	sp,sp,168
	jr	ra
.L9:
	li	a5,4096
	bltu	a4,a5,.L11
	srli	a4,a0,26
	slli	a4,a4,1
	lla	a5,.LANCHOR4
	add	a5,a5,a4
	lhu	s0,0(a5)
	j	.L5
.L13:
	li	a5,16
	bgtu	s0,a5,.L15
	srli	a4,a0,26
	slli	a4,a4,1
	lla	a5,.LANCHOR9
	add	a5,a5,a4
	lhu	s0,0(a5)
	j	.L5
.L155:
	srli	a4,a0,26
	slli	a4,a4,1
	lla	a5,.LANCHOR0
	add	a5,a5,a4
	lhu	s0,0(a5)
	j	.L5
.L26:
	slli	a0,a0,1
	addi	a5,a5,-1
	li	a4,0
.L42:
	bne	s0,zero,.L43
.L158:
	lw	a3,4(sp)
	li	t1,0
	li	t0,3
	li	s0,1
	beq	s1,a3,.L156
.L47:
	addi	a1,a4,2
	srli	a1,a1,1
	ble	a1,t0,.L48
	sltiu	t1,t1,6
	add	s0,s0,t1
.L48:
	andi	a4,a4,1
	bne	a4,zero,.L49
	slli	a4,s1,2
	addi	a4,a4,28
	add	a4,a4,sp
	sw	a1,0(a4)
.L50:
	lw	a4,0(sp)
	addi	s1,s1,1
	bne	s1,a4,.L51
	lw	s1,8(sp)
.L52:
	lw	a4,12(sp)
	lw	a3,0(sp)
	bleu	a4,a3,.L107
	li	a4,8
	bleu	a5,a4,.L157
.L55:
	lw	a3,12(sp)
	li	a4,4
	beq	a3,a4,.L56
	lw	a2,0(sp)
	li	a4,14
	bgtu	a2,a4,.L57
	lla	a3,.L59
	slli	a4,a2,2
	add	a4,a4,a3
	lw	a4,0(a4)
	add	a4,a4,a3
	jr	a4
	.section	.rodata.h264bsdDecodeResidualBlockCavlc,"a",@progbits
	.align	2
	.align	2
.L59:
	.word	.L57-.L59
	.word	.L72-.L59
	.word	.L71-.L59
	.word	.L70-.L59
	.word	.L69-.L59
	.word	.L68-.L59
	.word	.L67-.L59
	.word	.L66-.L59
	.word	.L65-.L59
	.word	.L64-.L59
	.word	.L63-.L59
	.word	.L62-.L59
	.word	.L61-.L59
	.word	.L60-.L59
	.word	.L58-.L59
	.section	.text.h264bsdDecodeResidualBlockCavlc
.L49:
	slli	t1,s1,2
	addi	a4,t1,28
	add	t1,a4,sp
	neg	a4,a1
	sw	a4,0(t1)
	j	.L50
.L153:
	lw	a0,8(sp)
	li	a1,32
	sub	a1,a1,a5
	call	h264bsdFlushBits
	li	a5,-1
	beq	a0,a5,.L17
	lw	a0,8(sp)
	call	h264bsdShowBits32
	li	a5,32
	j	.L25
.L27:
	slli	a0,a0,2
	addi	a5,a5,-2
	li	a4,1
	beq	s0,zero,.L158
.L43:
	sll	t0,a4,s0
	mv	t1,s0
.L162:
	bgeu	a5,s0,.L45
.L154:
	lw	a0,8(sp)
	li	a1,32
	sub	a1,a1,a5
	sw	t1,20(sp)
	sw	t0,16(sp)
	call	h264bsdFlushBits
	li	a5,-1
	beq	a0,a5,.L17
	lw	a0,8(sp)
	call	h264bsdShowBits32
	lw	t1,20(sp)
	lw	t0,16(sp)
	li	a5,32
	j	.L45
.L28:
	slli	a0,a0,3
	addi	a5,a5,-3
	li	a4,2
	j	.L42
.L29:
	slli	a0,a0,4
	addi	a5,a5,-4
	li	a4,3
	j	.L42
.L30:
	slli	a0,a0,5
	addi	a5,a5,-5
	li	a4,4
	j	.L42
.L152:
	bltu	a5,a2,.L20
	addi	a2,a2,-1
	sub	a1,a4,a3
	sub	a5,a5,a3
	li	a3,1
	sll	a3,a3,a2
.L21:
	lw	a4,4(sp)
	srl	a1,a0,a1
	sll	a0,a0,a4
	beq	a3,zero,.L19
.L99:
	li	s0,0
.L23:
	and	a4,a3,a1
	slli	a2,s0,2
	snez	a4,a4
	neg	a4,a4
	addi	a2,a2,28
	ori	a4,a4,1
	add	a2,a2,sp
	sw	a4,0(a2)
	srli	a3,a3,1
	addi	s0,s0,1
	bne	a3,zero,.L23
	lw	a2,0(sp)
	li	a4,10
	bleu	a2,a4,.L24
.L100:
	lw	a4,4(sp)
	sltiu	a3,a4,3
.L24:
	lw	a4,0(sp)
	bgtu	a4,s0,.L53
	j	.L52
.L31:
	slli	a0,a0,6
	addi	a5,a5,-6
	li	a4,5
	j	.L42
.L116:
	li	s0,0
	j	.L100
.L11:
	li	a5,511
	bleu	a4,a5,.L12
	srli	a4,a0,23
	slli	a4,a4,1
	lla	a5,.LANCHOR5
	add	a5,a5,a4
	lhu	s0,0(a5)
	j	.L5
.L15:
	srli	a4,a0,29
	slli	a4,a4,1
	lla	a5,.LANCHOR10
	add	a5,a5,a4
	lhu	s0,0(a5)
	bne	s0,zero,.L14
	srli	a4,a0,24
	slli	a4,a4,1
	lla	a5,.LANCHOR11
	add	a5,a5,a4
	lhu	s0,0(a5)
	j	.L5
.L151:
	lw	a5,12(sp)
	beq	a5,zero,.L17
	li	a5,1
	slli	a1,a0,2
	sw	a5,0(sp)
	sw	a5,4(sp)
	srli	a1,a1,31
	slli	a0,a0,3
	li	a5,29
	li	a3,1
	j	.L99
.L32:
	slli	a0,a0,7
	addi	a5,a5,-7
	li	a4,6
	j	.L42
.L107:
	li	s0,0
.L54:
	lw	a4,0(sp)
	li	a3,0
	lla	t1,.L80
	addi	a2,a4,-1
	beq	a2,zero,.L159
	sw	s1,4(sp)
	mv	s1,s0
	mv	s0,a3
.L95:
	beq	s1,zero,.L113
	li	a4,10
	bleu	a5,a4,.L160
.L77:
	li	a4,6
	bgtu	s1,a4,.L78
	slli	a4,s1,2
	add	a4,a4,t1
	lw	a4,0(a4)
	add	a4,a4,t1
	jr	a4
	.section	.rodata.h264bsdDecodeResidualBlockCavlc
	.align	2
	.align	2
.L80:
	.word	.L78-.L80
	.word	.L85-.L80
	.word	.L84-.L80
	.word	.L83-.L80
	.word	.L82-.L80
	.word	.L81-.L80
	.word	.L79-.L80
	.section	.text.h264bsdDecodeResidualBlockCavlc
.L79:
	srli	a3,a0,29
	lla	a4,.LANCHOR32
	add	a4,a4,a3
	lbu	a4,0(a4)
.L86:
	beq	a4,zero,.L17
	srli	a3,a4,4
	addi	a1,a3,1
	andi	a4,a4,15
.L88:
	sll	a0,a0,a4
	sub	a5,a5,a4
	sub	s1,s1,a3
.L76:
	slli	a3,s0,2
	addi	a4,sp,92
	add	a3,a4,a3
	sw	a1,0(a3)
	addi	s0,s0,1
	bne	s0,a2,.L95
	mv	a3,s0
	slli	a3,a3,2
	addi	a2,sp,28
	addi	a3,a3,128
	add	a3,a3,a2
	lw	a2,0(sp)
	lw	ra,24(sp)
	lw	a1,-128(a3)
	mv	s0,s1
	slli	a3,s0,2
	slli	a2,a2,2
	addi	a2,a2,-8
	add	a3,ra,a3
	sw	a1,0(a3)
	li	t1,1
	add	a3,a4,a2
	addi	a2,a2,28
	lw	s1,4(sp)
	sll	t1,t1,s0
	add	a1,a2,sp
	li	t2,1
	sw	a5,4(sp)
.L98:
	lw	a2,0(a3)
	lw	a5,0(a1)
	mv	a0,a3
	add	s0,s0,a2
	slli	a2,s0,2
	add	a2,ra,a2
	sll	t0,t2,s0
	sw	a5,0(a2)
	or	t1,t1,t0
	addi	a3,a3,-4
	addi	a1,a1,-4
	bne	a4,a0,.L98
	lw	a5,4(sp)
	li	a1,32
	sub	a1,a1,a5
	j	.L18
.L81:
	srli	a3,a0,29
	lla	a4,.LANCHOR31
	add	a4,a4,a3
	lbu	a4,0(a4)
	j	.L86
.L82:
	srli	a3,a0,29
	lla	a4,.LANCHOR30
	add	a4,a4,a3
	lbu	a4,0(a4)
	j	.L86
.L83:
	srli	a3,a0,30
	lla	a4,.LANCHOR29
	add	a4,a4,a3
	lbu	a4,0(a4)
	j	.L86
.L84:
	srli	a3,a0,30
	lla	a4,.LANCHOR28
	add	a4,a4,a3
	lbu	a4,0(a4)
	j	.L86
.L85:
	srli	a3,a0,31
	lla	a4,.LANCHOR27
	add	a4,a4,a3
	lbu	a4,0(a4)
	j	.L86
.L113:
	li	a1,1
	j	.L76
.L160:
	lw	a0,4(sp)
	li	a1,32
	sub	a1,a1,a5
	sw	a2,8(sp)
	call	h264bsdFlushBits
	li	a5,-1
	beq	a0,a5,.L17
	lw	a0,4(sp)
	call	h264bsdShowBits32
	lw	a2,8(sp)
	li	a5,32
	lla	t1,.L80
	j	.L77
.L78:
	srli	a4,a0,21
	li	a3,255
	bleu	a4,a3,.L87
	srli	a4,a0,29
	li	a3,7
	sub	a3,a3,a4
	slli	a3,a3,4
	srli	a3,a3,4
	li	a4,3
	addi	a1,a3,1
	j	.L88
.L6:
	li	a5,31
	bleu	a4,a5,.L7
	srli	a5,a0,18
	addi	a5,a5,-8
	slli	a5,a5,1
	lla	a4,.LANCHOR2
	add	a5,a4,a5
	lhu	s0,0(a5)
	j	.L5
.L87:
	li	a3,127
	bgtu	a4,a3,.L114
	li	a3,63
	bgtu	a4,a3,.L89
	li	a3,31
	bgtu	a4,a3,.L90
	li	a3,15
	bgtu	a4,a3,.L91
	li	a3,7
	bgtu	a4,a3,.L92
	li	a3,3
	bgtu	a4,a3,.L93
	li	a3,1
	bleu	a4,a3,.L161
	li	a4,12
	bleu	s1,a4,.L17
	li	a1,14
	li	a3,13
	li	a4,10
	j	.L88
.L12:
	srli	a4,a0,18
	slli	a4,a4,1
	lla	a5,.LANCHOR6
	add	a5,a5,a4
	lhu	s0,0(a5)
	j	.L5
.L34:
	slli	a0,a0,9
	addi	a5,a5,-9
	li	a4,8
	j	.L42
.L7:
	slli	a4,a4,1
	lla	a5,.LANCHOR3
	add	a5,a5,a4
	lhu	s0,0(a5)
	j	.L5
.L114:
	li	a1,8
	li	a3,7
	li	a4,4
	j	.L88
.L157:
	li	a1,32
	sub	a1,a1,a5
	mv	a0,s1
	call	h264bsdFlushBits
	li	a5,-1
	beq	a0,a5,.L17
	mv	a0,s1
	call	h264bsdShowBits32
	li	a5,32
	j	.L55
.L58:
	srli	a3,a0,30
	lla	a4,.LANCHOR26
	add	a4,a4,a3
	lbu	s0,0(a4)
.L75:
	beq	s0,zero,.L17
.L148:
	andi	a4,s0,15
	srli	s0,s0,4
.L74:
	sll	a0,a0,a4
	sub	a5,a5,a4
	j	.L54
.L60:
	srli	a3,a0,29
	lla	a4,.LANCHOR25
	add	a4,a4,a3
	lbu	s0,0(a4)
	j	.L75
.L61:
	srli	a3,a0,28
	lla	a4,.LANCHOR24
	add	a4,a4,a3
	lbu	s0,0(a4)
	j	.L75
.L62:
	srli	a3,a0,28
	lla	a4,.LANCHOR23
	add	a4,a4,a3
	lbu	s0,0(a4)
	j	.L75
.L63:
	srli	a3,a0,27
	lla	a4,.LANCHOR22
	add	a4,a4,a3
	lbu	s0,0(a4)
	j	.L75
.L64:
	srli	a3,a0,26
	lla	a4,.LANCHOR21
	add	a4,a4,a3
	lbu	s0,0(a4)
	j	.L75
.L65:
	srli	a3,a0,26
	lla	a4,.LANCHOR20
	add	a4,a4,a3
	lbu	s0,0(a4)
	j	.L75
.L66:
	srli	a3,a0,26
	lla	a4,.LANCHOR19
	add	a4,a4,a3
	lbu	s0,0(a4)
	j	.L75
.L67:
	srli	a3,a0,26
	lla	a4,.LANCHOR18
	add	a4,a4,a3
	lbu	s0,0(a4)
	j	.L75
.L68:
	srli	a3,a0,27
	lla	a4,.LANCHOR17
	add	a4,a4,a3
	lbu	s0,0(a4)
	j	.L75
.L69:
	srli	a3,a0,27
	lla	a4,.LANCHOR16
	add	a4,a4,a3
	lbu	s0,0(a4)
	j	.L75
.L70:
	srli	a3,a0,26
	lla	a4,.LANCHOR15
	add	a4,a4,a3
	lbu	s0,0(a4)
	j	.L75
.L71:
	srli	a3,a0,26
	lla	a4,.LANCHOR14
	add	a4,a4,a3
	lbu	s0,0(a4)
	j	.L75
.L72:
	srli	a3,a0,27
	lla	a4,.LANCHOR12
	add	a4,a4,a3
	lbu	s0,0(a4)
	bne	s0,zero,.L148
	srli	a3,a0,23
	lla	a4,.LANCHOR13
	add	a4,a4,a3
	lbu	s0,0(a4)
	j	.L75
.L40:
	slli	a0,a0,15
	addi	a5,a5,-15
	bne	s0,zero,.L106
	li	t1,0
	li	s0,4
	li	t0,14
	j	.L41
.L105:
	li	t1,1
	li	s0,12
	li	t0,30
	j	.L41
.L106:
	li	a4,14
	sll	t0,a4,s0
	mv	t1,s0
	j	.L162
.L20:
	mv	a0,s1
	call	h264bsdFlushBits
	li	a5,-1
	beq	a0,a5,.L17
	mv	a0,s1
	call	h264bsdShowBits32
	lw	a5,4(sp)
	li	a4,32
	li	a3,1
	sub	a1,a4,a5
	addi	a5,a5,-1
	sll	a3,a3,a5
	mv	a5,a1
	j	.L21
.L33:
	slli	a0,a0,8
	addi	a5,a5,-8
	li	a4,7
	j	.L42
.L56:
	srli	a4,a0,29
	li	a3,3
	bgtu	a4,a3,.L108
	lw	a2,0(sp)
	beq	a2,a3,.L109
	li	a3,1
	bgtu	a4,a3,.L110
	li	a3,2
	beq	a2,a3,.L111
	beq	a4,zero,.L112
	li	s0,2
	li	a4,3
	j	.L74
.L35:
	slli	a0,a0,10
	addi	a5,a5,-10
	li	a4,9
	j	.L42
.L89:
	li	a4,7
	beq	s1,a4,.L17
	li	a1,9
	li	a3,8
	li	a4,5
	j	.L88
.L108:
	li	s0,0
	li	a4,1
	j	.L74
.L36:
	slli	a0,a0,11
	addi	a5,a5,-11
	li	a4,10
	j	.L42
.L37:
	slli	a0,a0,12
	addi	a5,a5,-12
	li	a4,11
	j	.L42
.L90:
	li	a4,8
	bleu	s1,a4,.L17
	li	a1,10
	li	a3,9
	li	a4,6
	j	.L88
.L38:
	slli	a0,a0,13
	addi	a5,a5,-13
	li	a4,12
	j	.L42
.L110:
	li	s0,1
	li	a4,2
	j	.L74
.L159:
	lw	a3,24(sp)
	slli	a4,s0,2
	li	a1,32
	add	a4,a3,a4
	lw	a3,28(sp)
	li	t1,1
	sub	a1,a1,a5
	li	a5,1
	sw	a3,0(a4)
	sll	t1,t1,s0
	sw	a5,0(sp)
	j	.L18
.L91:
	li	a4,9
	bleu	s1,a4,.L17
	li	a1,11
	li	a3,10
	li	a4,7
	j	.L88
.L109:
	li	s0,1
	li	a4,1
	j	.L74
.L39:
	slli	a0,a0,14
	addi	a5,a5,-14
	li	a4,13
	j	.L42
.L112:
	li	s0,3
	li	a4,3
	j	.L74
.L92:
	li	a4,10
	bleu	s1,a4,.L17
	li	a1,12
	li	a3,11
	li	a4,8
	j	.L88
.L57:
	srli	s0,a0,31
	li	a4,1
	j	.L74
.L111:
	li	s0,2
	li	a4,2
	j	.L74
.L93:
	li	a4,11
	bleu	s1,a4,.L17
	li	a1,13
	li	a3,12
	li	a4,9
	j	.L88
.L161:
	beq	a4,zero,.L17
	li	a4,13
	bleu	s1,a4,.L17
	li	a1,15
	li	a3,14
	li	a4,11
	j	.L88
.L103:
	li	t1,0
	j	.L18
	.size	h264bsdDecodeResidualBlockCavlc, .-h264bsdDecodeResidualBlockCavlc
	.section	.rodata.coeffToken0_0,"a"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	coeffToken0_0, @object
	.size	coeffToken0_0, 64
coeffToken0_0:
	.half	0
	.half	0
	.half	0
	.half	8294
	.half	4134
	.half	2054
	.half	6245
	.half	6245
	.half	4163
	.half	4163
	.half	4163
	.half	4163
	.half	4163
	.half	4163
	.half	4163
	.half	4163
	.half	2082
	.half	2082
	.half	2082
	.half	2082
	.half	2082
	.half	2082
	.half	2082
	.half	2082
	.half	2082
	.half	2082
	.half	2082
	.half	2082
	.half	2082
	.half	2082
	.half	2082
	.half	2082
	.section	.rodata.coeffToken0_1,"a"
	.align	2
	.set	.LANCHOR1,. + 0
	.type	coeffToken0_1, @object
	.size	coeffToken0_1, 96
coeffToken0_1:
	.half	0
	.half	0
	.half	0
	.half	0
	.half	16490
	.half	12362
	.half	10282
	.half	8202
	.half	14441
	.half	14441
	.half	10313
	.half	10313
	.half	8233
	.half	8233
	.half	6153
	.half	6153
	.half	12392
	.half	12392
	.half	12392
	.half	12392
	.half	8264
	.half	8264
	.half	8264
	.half	8264
	.half	6184
	.half	6184
	.half	6184
	.half	6184
	.half	4104
	.half	4104
	.half	4104
	.half	4104
	.half	10343
	.half	10343
	.half	10343
	.half	10343
	.half	10343
	.half	10343
	.half	10343
	.half	10343
	.half	6215
	.half	6215
	.half	6215
	.half	6215
	.half	6215
	.half	6215
	.half	6215
	.half	6215
	.section	.rodata.coeffToken0_2,"a"
	.align	2
	.set	.LANCHOR2,. + 0
	.type	coeffToken0_2, @object
	.size	coeffToken0_2, 112
coeffToken0_2:
	.half	24686
	.half	22606
	.half	20526
	.half	20494
	.half	22638
	.half	20558
	.half	18478
	.half	18446
	.half	16397
	.half	16397
	.half	18509
	.half	18509
	.half	16429
	.half	16429
	.half	14349
	.half	14349
	.half	20589
	.half	20589
	.half	16461
	.half	16461
	.half	14381
	.half	14381
	.half	12301
	.half	12301
	.half	18539
	.half	18539
	.half	18539
	.half	18539
	.half	18539
	.half	18539
	.half	18539
	.half	18539
	.half	14411
	.half	14411
	.half	14411
	.half	14411
	.half	14411
	.half	14411
	.half	14411
	.half	14411
	.half	12331
	.half	12331
	.half	12331
	.half	12331
	.half	12331
	.half	12331
	.half	12331
	.half	12331
	.half	10251
	.half	10251
	.half	10251
	.half	10251
	.half	10251
	.half	10251
	.half	10251
	.half	10251
	.section	.rodata.coeffToken0_3,"a"
	.align	2
	.set	.LANCHOR3,. + 0
	.type	coeffToken0_3, @object
	.size	coeffToken0_3, 64
coeffToken0_3:
	.half	0
	.half	0
	.half	26671
	.half	26671
	.half	-32752
	.half	-32688
	.half	-32720
	.half	30736
	.half	-32656
	.half	30800
	.half	30768
	.half	28688
	.half	30832
	.half	28752
	.half	28720
	.half	26640
	.half	28783
	.half	28783
	.half	26703
	.half	26703
	.half	24623
	.half	24623
	.half	24591
	.half	24591
	.half	26735
	.half	26735
	.half	24655
	.half	24655
	.half	22575
	.half	22575
	.half	22543
	.half	22543
	.section	.rodata.coeffToken2_0,"a"
	.align	2
	.set	.LANCHOR4,. + 0
	.type	coeffToken2_0, @object
	.size	coeffToken2_0, 64
coeffToken2_0:
	.half	0
	.half	0
	.half	0
	.half	0
	.half	14438
	.half	8262
	.half	8230
	.half	4102
	.half	12390
	.half	6214
	.half	6182
	.half	2054
	.half	10341
	.half	10341
	.half	4133
	.half	4133
	.half	8292
	.half	8292
	.half	8292
	.half	8292
	.half	6244
	.half	6244
	.half	6244
	.half	6244
	.half	4163
	.half	4163
	.half	4163
	.half	4163
	.half	4163
	.half	4163
	.half	4163
	.half	4163
	.section	.rodata.coeffToken2_1,"a"
	.align	2
	.set	.LANCHOR5,. + 0
	.type	coeffToken2_1, @object
	.size	coeffToken2_1, 64
coeffToken2_1:
	.half	0
	.half	0
	.half	0
	.half	0
	.half	18537
	.half	14409
	.half	14377
	.half	12297
	.half	10248
	.half	10248
	.half	12360
	.half	12360
	.half	12328
	.half	12328
	.half	8200
	.half	8200
	.half	16487
	.half	16487
	.half	16487
	.half	16487
	.half	10311
	.half	10311
	.half	10311
	.half	10311
	.half	10279
	.half	10279
	.half	10279
	.half	10279
	.half	6151
	.half	6151
	.half	6151
	.half	6151
	.section	.rodata.coeffToken2_2,"a"
	.align	2
	.set	.LANCHOR6,. + 0
	.type	coeffToken2_2, @object
	.size	coeffToken2_2, 256
coeffToken2_2:
	.half	0
	.half	0
	.half	30829
	.half	30829
	.half	-32658
	.half	-32690
	.half	-32722
	.half	-32754
	.half	30766
	.half	30734
	.half	30798
	.half	28718
	.half	28749
	.half	28749
	.half	28685
	.half	28685
	.half	28781
	.half	28781
	.half	26701
	.half	26701
	.half	26669
	.half	26669
	.half	26637
	.half	26637
	.half	26733
	.half	26733
	.half	24653
	.half	24653
	.half	24621
	.half	24621
	.half	24589
	.half	24589
	.half	22540
	.half	22540
	.half	22540
	.half	22540
	.half	22604
	.half	22604
	.half	22604
	.half	22604
	.half	22572
	.half	22572
	.half	22572
	.half	22572
	.half	20492
	.half	20492
	.half	20492
	.half	20492
	.half	24684
	.half	24684
	.half	24684
	.half	24684
	.half	20556
	.half	20556
	.half	20556
	.half	20556
	.half	20524
	.half	20524
	.half	20524
	.half	20524
	.half	18444
	.half	18444
	.half	18444
	.half	18444
	.half	22635
	.half	22635
	.half	22635
	.half	22635
	.half	22635
	.half	22635
	.half	22635
	.half	22635
	.half	18507
	.half	18507
	.half	18507
	.half	18507
	.half	18507
	.half	18507
	.half	18507
	.half	18507
	.half	18475
	.half	18475
	.half	18475
	.half	18475
	.half	18475
	.half	18475
	.half	18475
	.half	18475
	.half	16395
	.half	16395
	.half	16395
	.half	16395
	.half	16395
	.half	16395
	.half	16395
	.half	16395
	.half	20587
	.half	20587
	.half	20587
	.half	20587
	.half	20587
	.half	20587
	.half	20587
	.half	20587
	.half	16459
	.half	16459
	.half	16459
	.half	16459
	.half	16459
	.half	16459
	.half	16459
	.half	16459
	.half	16427
	.half	16427
	.half	16427
	.half	16427
	.half	16427
	.half	16427
	.half	16427
	.half	16427
	.half	14347
	.half	14347
	.half	14347
	.half	14347
	.half	14347
	.half	14347
	.half	14347
	.half	14347
	.section	.rodata.coeffToken4_0,"a"
	.align	2
	.set	.LANCHOR7,. + 0
	.type	coeffToken4_0, @object
	.size	coeffToken4_0, 128
coeffToken4_0:
	.half	0
	.half	0
	.half	0
	.half	0
	.half	0
	.half	0
	.half	0
	.half	0
	.half	6150
	.half	14406
	.half	14374
	.half	4102
	.half	18534
	.half	12358
	.half	12326
	.half	2054
	.half	10277
	.half	10277
	.half	10309
	.half	10309
	.half	8229
	.half	8229
	.half	8261
	.half	8261
	.half	6181
	.half	6181
	.half	16485
	.half	16485
	.half	6213
	.half	6213
	.half	4133
	.half	4133
	.half	14436
	.half	14436
	.half	14436
	.half	14436
	.half	12388
	.half	12388
	.half	12388
	.half	12388
	.half	10340
	.half	10340
	.half	10340
	.half	10340
	.half	8292
	.half	8292
	.half	8292
	.half	8292
	.half	6244
	.half	6244
	.half	6244
	.half	6244
	.half	4164
	.half	4164
	.half	4164
	.half	4164
	.half	2084
	.half	2084
	.half	2084
	.half	2084
	.half	4
	.half	4
	.half	4
	.half	4
	.section	.rodata.coeffToken4_1,"a"
	.align	2
	.set	.LANCHOR8,. + 0
	.type	coeffToken4_1, @object
	.size	coeffToken4_1, 256
coeffToken4_1:
	.half	0
	.half	-32758
	.half	-32662
	.half	-32694
	.half	-32726
	.half	30730
	.half	30826
	.half	30794
	.half	30762
	.half	28682
	.half	28778
	.half	28746
	.half	28714
	.half	26634
	.half	26665
	.half	26665
	.half	24585
	.half	24585
	.half	26697
	.half	26697
	.half	24617
	.half	24617
	.half	22537
	.half	22537
	.half	26729
	.half	26729
	.half	24649
	.half	24649
	.half	22569
	.half	22569
	.half	20489
	.half	20489
	.half	24680
	.half	24680
	.half	24680
	.half	24680
	.half	22600
	.half	22600
	.half	22600
	.half	22600
	.half	20520
	.half	20520
	.half	20520
	.half	20520
	.half	18440
	.half	18440
	.half	18440
	.half	18440
	.half	22632
	.half	22632
	.half	22632
	.half	22632
	.half	20552
	.half	20552
	.half	20552
	.half	20552
	.half	18472
	.half	18472
	.half	18472
	.half	18472
	.half	16392
	.half	16392
	.half	16392
	.half	16392
	.half	14343
	.half	14343
	.half	14343
	.half	14343
	.half	14343
	.half	14343
	.half	14343
	.half	14343
	.half	12295
	.half	12295
	.half	12295
	.half	12295
	.half	12295
	.half	12295
	.half	12295
	.half	12295
	.half	18503
	.half	18503
	.half	18503
	.half	18503
	.half	18503
	.half	18503
	.half	18503
	.half	18503
	.half	10247
	.half	10247
	.half	10247
	.half	10247
	.half	10247
	.half	10247
	.half	10247
	.half	10247
	.half	20583
	.half	20583
	.half	20583
	.half	20583
	.half	20583
	.half	20583
	.half	20583
	.half	20583
	.half	16455
	.half	16455
	.half	16455
	.half	16455
	.half	16455
	.half	16455
	.half	16455
	.half	16455
	.half	16423
	.half	16423
	.half	16423
	.half	16423
	.half	16423
	.half	16423
	.half	16423
	.half	16423
	.half	8199
	.half	8199
	.half	8199
	.half	8199
	.half	8199
	.half	8199
	.half	8199
	.half	8199
	.section	.rodata.coeffToken8,"a"
	.align	2
	.set	.LANCHOR9,. + 0
	.type	coeffToken8, @object
	.size	coeffToken8, 128
coeffToken8:
	.half	2054
	.half	2086
	.half	0
	.half	6
	.half	4102
	.half	4134
	.half	4166
	.half	0
	.half	6150
	.half	6182
	.half	6214
	.half	6246
	.half	8198
	.half	8230
	.half	8262
	.half	8294
	.half	10246
	.half	10278
	.half	10310
	.half	10342
	.half	12294
	.half	12326
	.half	12358
	.half	12390
	.half	14342
	.half	14374
	.half	14406
	.half	14438
	.half	16390
	.half	16422
	.half	16454
	.half	16486
	.half	18438
	.half	18470
	.half	18502
	.half	18534
	.half	20486
	.half	20518
	.half	20550
	.half	20582
	.half	22534
	.half	22566
	.half	22598
	.half	22630
	.half	24582
	.half	24614
	.half	24646
	.half	24678
	.half	26630
	.half	26662
	.half	26694
	.half	26726
	.half	28678
	.half	28710
	.half	28742
	.half	28774
	.half	30726
	.half	30758
	.half	30790
	.half	30822
	.half	-32762
	.half	-32730
	.half	-32698
	.half	-32666
	.section	.rodata.coeffTokenMinus1_0,"a"
	.align	2
	.set	.LANCHOR10,. + 0
	.type	coeffTokenMinus1_0, @object
	.size	coeffTokenMinus1_0, 16
coeffTokenMinus1_0:
	.half	0
	.half	4163
	.half	2
	.half	2
	.half	2081
	.half	2081
	.half	2081
	.half	2081
	.section	.rodata.coeffTokenMinus1_1,"a"
	.align	2
	.set	.LANCHOR11,. + 0
	.type	coeffTokenMinus1_1, @object
	.size	coeffTokenMinus1_1, 64
coeffTokenMinus1_1:
	.half	8295
	.half	8295
	.half	8264
	.half	8232
	.half	6215
	.half	6215
	.half	6183
	.half	6183
	.half	8198
	.half	8198
	.half	8198
	.half	8198
	.half	6150
	.half	6150
	.half	6150
	.half	6150
	.half	4102
	.half	4102
	.half	4102
	.half	4102
	.half	6246
	.half	6246
	.half	6246
	.half	6246
	.half	4134
	.half	4134
	.half	4134
	.half	4134
	.half	2054
	.half	2054
	.half	2054
	.half	2054
	.section	.rodata.totalZeros_10,"a"
	.align	2
	.set	.LANCHOR22,. + 0
	.type	totalZeros_10, @object
	.size	totalZeros_10, 32
totalZeros_10:
	.ascii	"\025\005dd####RRRRRRRRBBBBBBBB22222222"
	.section	.rodata.totalZeros_11,"a"
	.align	2
	.set	.LANCHOR23,. + 0
	.type	totalZeros_11, @object
	.size	totalZeros_11, 16
totalZeros_11:
	.ascii	"\004\024##33SSAAAAAAAA"
	.section	.rodata.totalZeros_12,"a"
	.align	2
	.set	.LANCHOR24,. + 0
	.type	totalZeros_12, @object
	.size	totalZeros_12, 16
totalZeros_12:
	.ascii	"\004\024CC\"\"\"\"11111111"
	.section	.rodata.totalZeros_1_0,"a"
	.align	2
	.set	.LANCHOR12,. + 0
	.type	totalZeros_1_0, @object
	.size	totalZeros_1_0, 32
totalZeros_1_0:
	.string	""
	.string	""
	.ascii	"eUDD44####\023\023\023\023\001\001\001\001\001\001\001\001\001"
	.ascii	"\001\001\001\001\001\001\001"
	.section	.rodata.totalZeros_1_1,"a"
	.align	2
	.set	.LANCHOR13,. + 0
	.type	totalZeros_1_1, @object
	.size	totalZeros_1_1, 32
totalZeros_1_1:
	.string	""
	.ascii	"\371\351\331\310\310\270\270\247\247\247\247\227\227\227\227"
	.ascii	"\206\206\206\206\206\206\206\206vvvvvvvv"
	.section	.rodata.totalZeros_2,"a"
	.align	2
	.set	.LANCHOR14,. + 0
	.type	totalZeros_2, @object
	.size	totalZeros_2, 64
totalZeros_2:
	.ascii	"\346\326\306\266\245\245\225\225\204\204\204\204ttttddddTTTT"
	.ascii	"CCCCCCCC33333333########\023\023\023\023\023\023\023\023\003"
	.ascii	"\003\003\003\003\003\003\003"
	.section	.rodata.totalZeros_3,"a"
	.align	2
	.set	.LANCHOR15,. + 0
	.type	totalZeros_3, @object
	.size	totalZeros_3, 64
totalZeros_3:
	.ascii	"\326\266\305\305\245\245\225\225\204\204\204\204TTTTDDDD\004"
	.ascii	"\004\004\004sssssssscccccccc33333333########\023\023\023\023"
	.ascii	"\023\023\023\023"
	.section	.rodata.totalZeros_4,"a"
	.align	2
	.set	.LANCHOR16,. + 0
	.type	totalZeros_4, @object
	.size	totalZeros_4, 32
totalZeros_4:
	.ascii	"\305\265\245\005\224\224tt44$$\203\203\203\203ccccSSSSCCCC\023"
	.ascii	"\023\023\023"
	.section	.rodata.totalZeros_5,"a"
	.align	2
	.set	.LANCHOR17,. + 0
	.type	totalZeros_5, @object
	.size	totalZeros_5, 32
totalZeros_5:
	.ascii	"\265\225\244\244\204\204$$\024\024\004\004ssssccccSSSSCCCC33"
	.ascii	"33"
	.section	.rodata.totalZeros_6,"a"
	.align	2
	.set	.LANCHOR18,. + 0
	.type	totalZeros_6, @object
	.size	totalZeros_6, 64
totalZeros_6:
	.ascii	"\246\006\025\025\204\204\204\204\223\223\223\223\223\223\223"
	.ascii	"\223ssssssssccccccccSSSSSSSSCCCCCCCC33333333########"
	.section	.rodata.totalZeros_7,"a"
	.align	2
	.set	.LANCHOR19,. + 0
	.type	totalZeros_7, @object
	.size	totalZeros_7, 64
totalZeros_7:
	.ascii	"\226\006\025\025tttt\203\203\203\203\203\203\203\203cccccccc"
	.ascii	"CCCCCCCC33333333########RRRRRRRRRRRRRRRR"
	.section	.rodata.totalZeros_8,"a"
	.align	2
	.set	.LANCHOR20,. + 0
	.type	totalZeros_8, @object
	.size	totalZeros_8, 64
totalZeros_8:
	.ascii	"\206\006%%\024\024\024\024sssssssscccccccc33333333RRRRRRRRRR"
	.ascii	"RRRRRRBBBBBBBBBBBBBBBB"
	.section	.rodata.totalZeros_9,"a"
	.align	2
	.set	.LANCHOR21,. + 0
	.type	totalZeros_9, @object
	.size	totalZeros_9, 64
totalZeros_9:
	.ascii	"\026\006uu$$$$SSSSSSSSbbbbbbbbbbbbbbbbBBBBBBBBBBBBBBBB222222"
	.ascii	"2222222222"
	.section	.srodata.runBefore_1,"a"
	.align	2
	.set	.LANCHOR27,. + 0
	.type	runBefore_1, @object
	.size	runBefore_1, 2
runBefore_1:
	.ascii	"\021\001"
	.section	.srodata.runBefore_2,"a"
	.align	2
	.set	.LANCHOR28,. + 0
	.type	runBefore_2, @object
	.size	runBefore_2, 4
runBefore_2:
	.ascii	"\"\022\001\001"
	.section	.srodata.runBefore_3,"a"
	.align	2
	.set	.LANCHOR29,. + 0
	.type	runBefore_3, @object
	.size	runBefore_3, 4
runBefore_3:
	.ascii	"2\"\022\002"
	.section	.srodata.runBefore_4,"a"
	.align	2
	.set	.LANCHOR30,. + 0
	.type	runBefore_4, @object
	.size	runBefore_4, 8
runBefore_4:
	.ascii	"C3\"\"\022\022\002\002"
	.section	.srodata.runBefore_5,"a"
	.align	2
	.set	.LANCHOR31,. + 0
	.type	runBefore_5, @object
	.size	runBefore_5, 8
runBefore_5:
	.ascii	"SC3#\022\022\002\002"
	.section	.srodata.runBefore_6,"a"
	.align	2
	.set	.LANCHOR32,. + 0
	.type	runBefore_6, @object
	.size	runBefore_6, 8
runBefore_6:
	.ascii	"\023#C3cS\002\002"
	.section	.srodata.totalZeros_13,"a"
	.align	2
	.set	.LANCHOR25,. + 0
	.type	totalZeros_13, @object
	.size	totalZeros_13, 8
totalZeros_13:
	.ascii	"\003\02322!!!!"
	.section	.srodata.totalZeros_14,"a"
	.align	2
	.set	.LANCHOR26,. + 0
	.type	totalZeros_14, @object
	.size	totalZeros_14, 4
totalZeros_14:
	.ascii	"\002\022!!"
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
