#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"mp3dec.c"
	.option nopic
	.text
	.section	.text.MP3InitDecoder,"ax",@progbits
	.align	2
	.globl	MP3InitDecoder
	.hidden	MP3InitDecoder
	.type	MP3InitDecoder, @function
MP3InitDecoder:
	tail	AllocateBuffers
	.size	MP3InitDecoder, .-MP3InitDecoder
	.section	.text.MP3FreeDecoder,"ax",@progbits
	.align	2
	.globl	MP3FreeDecoder
	.hidden	MP3FreeDecoder
	.type	MP3FreeDecoder, @function
MP3FreeDecoder:
	beq	a0,zero,.L3
	tail	FreeBuffers
.L3:
	ret
	.size	MP3FreeDecoder, .-MP3FreeDecoder
	.section	.text.MP3FindSyncWord,"ax",@progbits
	.align	2
	.globl	MP3FindSyncWord
	.hidden	MP3FindSyncWord
	.type	MP3FindSyncWord, @function
MP3FindSyncWord:
	li	a5,1
	mv	a3,a0
	ble	a1,a5,.L9
	addi	a5,a0,1
	add	a1,a0,a1
	li	a2,255
	li	t1,240
	j	.L8
.L7:
	addi	a5,a5,1
	beq	a5,a1,.L9
.L8:
	lbu	a4,-1(a5)
	sub	a0,a5,a3
	addi	a0,a0,-1
	bne	a4,a2,.L7
	lbu	a4,0(a5)
	andi	a4,a4,240
	bne	a4,t1,.L7
	ret
.L9:
	li	a0,-1
	ret
	.size	MP3FindSyncWord, .-MP3FindSyncWord
	.globl	__mulsi3
	.section	.text.MP3GetLastFrameInfo,"ax",@progbits
	.align	2
	.globl	MP3GetLastFrameInfo
	.hidden	MP3GetLastFrameInfo
	.type	MP3GetLastFrameInfo, @function
MP3GetLastFrameInfo:
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	ra,12(sp)
	sw	s1,4(sp)
	mv	s0,a1
	beq	a0,zero,.L12
	lw	a4,2000(a0)
	li	a5,3
	beq	a4,a5,.L13
.L12:
	li	a0,0
	li	a4,0
	li	a5,0
	lw	ra,12(sp)
	sw	zero,0(s0)
	sw	zero,4(s0)
	sw	zero,8(s0)
	sw	zero,12(s0)
	sw	a0,16(s0)
	sw	a4,20(s0)
	sw	a5,24(s0)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L13:
	lw	s1,2004(a0)
	lla	a3,samplesPerFrameTab
	lw	a2,1976(a0)
	slli	a5,s1,1
	add	a5,a5,s1
	slli	a5,a5,1
	lw	a1,1980(a0)
	lw	t1,1984(a0)
	add	a5,a3,a5
	lh	a0,4(a5)
	li	a5,16
	sw	a5,12(s0)
	sw	a2,0(s0)
	sw	a1,4(s0)
	sw	t1,8(s0)
	sw	a4,0(sp)
	call	__mulsi3
	lw	a4,0(sp)
	mv	a5,s1
	lw	ra,12(sp)
	sw	a0,16(s0)
	sw	a4,20(s0)
	sw	a5,24(s0)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
	.size	MP3GetLastFrameInfo, .-MP3GetLastFrameInfo
	.section	.text.MP3GetNextFrameInfo,"ax",@progbits
	.align	2
	.globl	MP3GetNextFrameInfo
	.hidden	MP3GetNextFrameInfo
	.type	MP3GetNextFrameInfo, @function
MP3GetNextFrameInfo:
	beq	a0,zero,.L21
	addi	sp,sp,-20
	sw	s0,12(sp)
	mv	s0,a1
	mv	a1,a2
	sw	s1,8(sp)
	sw	ra,16(sp)
	mv	s1,a0
	call	UnpackFrameHeader
	li	a5,-1
	beq	a0,a5,.L23
	lw	a2,2000(s1)
	li	a5,3
	sw	a2,0(sp)
	bne	a2,a5,.L23
	lw	a4,2004(s1)
	lla	a3,samplesPerFrameTab
	lw	t1,1976(s1)
	slli	a5,a4,1
	add	a5,a5,a4
	slli	a5,a5,1
	lw	a1,1980(s1)
	lw	t0,1984(s1)
	add	a5,a3,a5
	lh	a0,4(a5)
	li	a5,16
	sw	t1,0(s0)
	sw	a1,4(s0)
	sw	t0,8(s0)
	sw	a5,12(s0)
	sw	a4,4(sp)
	call	__mulsi3
	lw	a2,0(sp)
	lw	a4,4(sp)
	sw	a0,16(s0)
	sw	a2,20(s0)
	sw	a4,24(s0)
	li	a0,0
.L19:
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L23:
	li	a0,-6
	j	.L19
.L21:
	li	a0,-5
	ret
	.size	MP3GetNextFrameInfo, .-MP3GetNextFrameInfo
	.globl	__divsi3
	.section	.text.MP3Decode,"ax",@progbits
	.align	2
	.globl	MP3Decode
	.hidden	MP3Decode
	.type	MP3Decode, @function
MP3Decode:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	sw	s1,36(sp)
	sw	a1,4(sp)
	sw	a2,0(sp)
	sw	a3,28(sp)
	sw	a4,12(sp)
	beq	a0,zero,.L91
	lw	a1,0(a1)
	mv	s1,a0
	call	UnpackFrameHeader
	sw	a0,8(sp)
	blt	a0,zero,.L52
	lw	a5,4(sp)
	lw	a4,8(sp)
	mv	a0,s1
	lw	a1,0(a5)
	add	a1,a1,a4
	sw	a1,0(a5)
	call	UnpackSideInfo
	mv	t1,a0
	blt	a0,zero,.L140
	lw	a2,4(sp)
	lw	a1,0(sp)
	lw	a4,8(sp)
	lw	a3,0(a2)
	lw	a5,0(a1)
	add	a4,a4,a0
	add	a0,a3,a0
	sub	a5,a5,a4
	sw	a0,0(a2)
	sw	a5,0(a1)
	lw	a4,1976(s1)
	sw	a0,16(sp)
	bne	a4,zero,.L141
	lw	a5,1968(s1)
	bne	a5,zero,.L38
	li	a5,1
	sw	a5,1968(s1)
	lw	a5,0(sp)
	li	a2,255
	li	t0,240
	lw	t2,0(a5)
	lw	a5,8(sp)
	addi	a1,t2,-1
	sub	ra,a3,a5
	lw	a5,16(sp)
	ble	a1,zero,.L39
.L143:
	li	a4,0
	j	.L43
.L40:
	addi	a4,a4,1
	addi	a5,a5,1
	beq	a4,a1,.L39
.L43:
	lbu	a3,0(a5)
	mv	s0,a5
	bne	a3,a2,.L40
	lbu	a3,1(a5)
	andi	a0,a3,240
	bne	a0,t0,.L40
	lbu	a1,0(ra)
	beq	a1,a2,.L142
.L42:
	addi	a4,a4,3
	sub	t2,t2,a4
	addi	a1,t2,-1
	addi	a5,a5,3
	bgt	a1,zero,.L143
.L39:
	li	a5,-1
	sw	a5,1972(s1)
.L45:
	lw	a1,1992(s1)
	lw	a0,1988(s1)
	call	__mulsi3
	lw	a1,1980(s1)
	call	__mulsi3
	lw	a5,28(sp)
	slli	a4,a0,1
	add	a4,a5,a4
	ble	a0,zero,.L139
.L48:
	sh	zero,0(a5)
	addi	a5,a5,2
	bne	a4,a5,.L48
.L139:
	li	a0,-3
	j	.L28
.L141:
	lw	a4,1968(s1)
	bne	a4,zero,.L38
	lw	a4,12(sp)
	beq	a4,zero,.L49
.L147:
	lw	a4,2008(s1)
	sw	a5,1996(s1)
	bne	a4,zero,.L50
	ble	a5,zero,.L50
	lw	a2,4(sp)
	lw	a4,0(sp)
	lw	t2,0(a2)
	sw	a5,2012(s1)
	lw	a4,0(a4)
	add	a3,t2,a5
	sw	a3,0(a2)
	sub	a5,a4,a5
.L54:
	lw	a4,0(sp)
	sw	zero,32(sp)
	sw	zero,8(sp)
	sw	a5,0(a4)
	lw	a4,2012(s1)
	lw	a5,1988(s1)
	mv	s0,s1
	slli	a4,a4,3
	sw	a4,16(sp)
	ble	a5,zero,.L94
.L63:
	lw	a5,1980(s0)
	ble	a5,zero,.L89
	lw	a5,32(sp)
	li	t0,0
	mv	a1,t2
	sw	a5,12(sp)
	lw	a5,8(sp)
	lw	s1,16(sp)
	mv	t2,t0
	slli	a5,a5,3
	add	a5,s0,a5
	sw	a5,4(sp)
	sw	s0,0(sp)
	j	.L73
.L146:
	bgt	t1,s1,.L64
	sw	t2,16(sp)
	sw	t0,12(sp)
	call	DecodeHuffman
	lw	a5,24(sp)
	slli	s1,a0,3
	lw	t0,12(sp)
	lw	t2,16(sp)
	sub	s1,s1,a5
	blt	a0,zero,.L144
	lw	a4,32(sp)
	lw	a5,0(sp)
	add	a1,t0,a0
	add	s1,s1,a4
	sw	a4,12(sp)
	lw	a4,4(sp)
	lw	a5,1980(a5)
	sub	s1,s0,s1
	addi	a4,a4,4
	sw	a4,4(sp)
	ble	a5,t2,.L145
.L73:
	lw	a4,8(sp)
	lw	a0,0(sp)
	mv	a5,t2
	mv	a3,s1
	addi	a2,sp,32
	sw	t2,20(sp)
	sw	a1,16(sp)
	call	UnpackScaleFactors
	lw	a1,12(sp)
	lw	a5,4(sp)
	slli	s0,a0,3
	lw	a3,32(sp)
	sub	s0,s0,a1
	lw	a1,16(sp)
	lw	t1,2016(a5)
	lw	t2,20(sp)
	mv	ra,a0
	add	s0,s0,a3
	sw	a3,24(sp)
	add	t0,a1,ra
	mv	a5,t2
	sub	a3,t1,s0
	lw	a4,8(sp)
	lw	a0,0(sp)
	addi	a2,sp,32
	addi	t2,t2,1
	mv	a1,t0
	sub	s0,s1,s0
	bge	ra,zero,.L146
.L64:
	lw	s1,0(sp)
	lw	a1,1988(s1)
	lw	a0,1992(s1)
	call	__mulsi3
	lw	a1,1980(s1)
	call	__mulsi3
	lw	a5,28(sp)
	slli	a4,a0,1
	add	a4,a5,a4
	ble	a0,zero,.L68
.L67:
	sh	zero,0(a5)
	addi	a5,a5,2
	bne	a5,a4,.L67
.L68:
	li	a0,-8
.L28:
	lw	ra,44(sp)
	lw	s0,40(sp)
	lw	s1,36(sp)
	addi	sp,sp,48
	jr	ra
.L38:
	lw	s0,1972(s1)
.L37:
	mv	a0,s1
	call	CheckPadBit
	add	a5,a0,s0
	sw	a5,1996(s1)
	lw	a4,12(sp)
	lw	a5,0(sp)
	lw	a5,0(a5)
	bne	a4,zero,.L147
.L49:
	lw	a4,1996(s1)
	bgt	a4,a5,.L148
	lw	a0,2012(s1)
	lw	a2,2008(s1)
	addi	t2,s1,28
	blt	a0,a2,.L59
	sub	a1,a0,a2
	add	a1,t2,a1
	mv	a0,t2
	sw	t2,8(sp)
	call	memmove
	lw	s0,4(sp)
	lw	t2,8(sp)
	lw	a0,2008(s1)
	lw	a2,1996(s1)
	lw	a1,0(s0)
	add	a0,t2,a0
	sw	t2,4(sp)
	call	memcpy
	lw	a4,1996(s1)
	lw	a5,2008(s1)
	lw	a3,0(s0)
	lw	t2,4(sp)
	add	a5,a5,a4
	sw	a5,2012(s1)
	lw	a5,0(sp)
	add	a3,a3,a4
	lw	a5,0(a5)
	sw	a3,0(s0)
	sub	a5,a5,a4
	j	.L54
.L142:
	lbu	a1,1(ra)
	bne	a3,a1,.L42
	lbu	a1,2(ra)
	lbu	a3,2(a5)
	xor	a3,a1,a3
	andi	a3,a3,252
	bne	a3,zero,.L42
	srli	a5,a1,1
	andi	a5,a5,1
	snez	a5,a5
	sub	s0,s0,a5
	lw	a5,16(sp)
	lw	a1,1992(s1)
	lw	a0,1988(s1)
	sub	s0,s0,a5
	sw	s0,1972(s1)
	sw	t1,20(sp)
	call	__mulsi3
	sw	a0,16(sp)
	lw	t1,20(sp)
	blt	s0,zero,.L45
	lw	a5,8(sp)
	lw	a1,1984(s1)
	add	a0,a5,s0
	add	a0,a0,t1
	call	__mulsi3
	lw	a1,16(sp)
	slli	a0,a0,3
	call	__divsi3
	sw	a0,1976(s1)
	j	.L37
.L145:
	lw	s0,0(sp)
	mv	t2,a1
	sw	s1,16(sp)
.L89:
	lw	a1,8(sp)
	mv	a0,s0
	sw	t2,0(sp)
	call	Dequantize
	blt	a0,zero,.L74
	lw	s1,1980(s0)
	lw	t2,0(sp)
	li	a2,0
	ble	s1,zero,.L76
	mv	s1,s0
	sw	t2,0(sp)
	mv	s0,a2
	j	.L75
.L80:
	lw	a4,1980(s1)
	ble	a4,s0,.L149
.L75:
	lw	a1,8(sp)
	mv	a2,s0
	mv	a0,s1
	call	IMDCT
	addi	s0,s0,1
	bge	a0,zero,.L80
	lw	a1,1992(s1)
	lw	a0,1988(s1)
	call	__mulsi3
	lw	a1,1980(s1)
	call	__mulsi3
	lw	a5,28(sp)
	slli	a4,a0,1
	add	a4,a5,a4
	ble	a0,zero,.L83
.L82:
	sh	zero,0(a5)
	addi	a5,a5,2
	bne	a4,a5,.L82
.L83:
	lw	ra,44(sp)
	lw	s0,40(sp)
	lw	s1,36(sp)
	li	a0,-11
	addi	sp,sp,48
	jr	ra
.L144:
	lw	s1,0(sp)
	lw	a1,1988(s1)
	lw	a0,1992(s1)
	call	__mulsi3
	lw	a1,1980(s1)
	call	__mulsi3
	lw	a5,28(sp)
	slli	a4,a0,1
	add	a4,a5,a4
	ble	a0,zero,.L72
.L71:
	sh	zero,0(a5)
	addi	a5,a5,2
	bne	a5,a4,.L71
.L72:
	lw	ra,44(sp)
	lw	s0,40(sp)
	lw	s1,36(sp)
	li	a0,-9
	addi	sp,sp,48
	jr	ra
.L149:
	lw	t2,0(sp)
	mv	s0,s1
	mv	s1,a4
.L76:
	lw	a1,1992(s0)
	lw	a0,8(sp)
	sw	t2,0(sp)
	call	__mulsi3
	mv	a1,s1
	call	__mulsi3
	lw	a5,28(sp)
	slli	a1,a0,1
	mv	a0,s0
	add	a1,a5,a1
	call	Subband
	lw	t2,0(sp)
	blt	a0,zero,.L150
	lw	a4,8(sp)
	lw	a5,1988(s0)
	addi	a4,a4,1
	sw	a4,8(sp)
	bgt	a5,a4,.L63
.L94:
	li	a0,0
	j	.L28
.L50:
	lw	a1,1988(s1)
	lw	a0,1992(s1)
	call	__mulsi3
	lw	a1,1980(s1)
	call	__mulsi3
	ble	a0,zero,.L52
	lw	a4,28(sp)
	slli	a5,a0,1
	add	a5,a4,a5
.L53:
	sh	zero,0(a4)
	addi	a4,a4,2
	bne	a5,a4,.L53
.L52:
	li	a0,-6
	j	.L28
.L74:
	lw	a1,1992(s0)
	lw	a0,1988(s0)
	call	__mulsi3
	lw	a1,1980(s0)
	call	__mulsi3
	lw	a5,28(sp)
	slli	a3,a0,1
	add	a3,a5,a3
	ble	a0,zero,.L79
.L78:
	sh	zero,0(a5)
	addi	a5,a5,2
	bne	a5,a3,.L78
.L79:
	li	a0,-10
	j	.L28
.L59:
	lw	s0,4(sp)
	mv	a2,a4
	add	a0,t2,a0
	lw	a1,0(s0)
	call	memcpy
	lw	a4,1996(s1)
	lw	a5,2012(s1)
	lw	a1,0(sp)
	lw	a3,0(s0)
	add	a5,a5,a4
	sw	a5,2012(s1)
	lw	a5,0(a1)
	add	a3,a3,a4
	sw	a3,0(s0)
	sub	a5,a5,a4
	sw	a5,0(a1)
	lw	a1,1992(s1)
	lw	a0,1988(s1)
	call	__mulsi3
	lw	a1,1980(s1)
	call	__mulsi3
	lw	a5,28(sp)
	slli	a3,a0,1
	add	a3,a5,a3
	ble	a0,zero,.L62
.L61:
	sh	zero,0(a5)
	addi	a5,a5,2
	bne	a5,a3,.L61
.L62:
	li	a0,-2
	j	.L28
.L91:
	li	a0,-5
	j	.L28
.L150:
	lw	a1,1992(s0)
	lw	a0,1988(s0)
	call	__mulsi3
	lw	a1,1980(s0)
	call	__mulsi3
	lw	a5,28(sp)
	slli	a3,a0,1
	add	a3,a5,a3
	ble	a0,zero,.L87
.L86:
	sh	zero,0(a5)
	addi	a5,a5,2
	bne	a3,a5,.L86
.L87:
	li	a0,-12
	j	.L28
.L148:
	lw	a1,1992(s1)
	lw	a0,1988(s1)
	call	__mulsi3
	lw	a1,1980(s1)
	call	__mulsi3
	lw	a5,28(sp)
	slli	a3,a0,1
	add	a3,a5,a3
	ble	a0,zero,.L58
.L57:
	sh	zero,0(a5)
	addi	a5,a5,2
	bne	a3,a5,.L57
.L58:
	li	a0,-1
	j	.L28
.L140:
	lw	a1,1988(s1)
	lw	a0,1992(s1)
	call	__mulsi3
	lw	a1,1980(s1)
	call	__mulsi3
	lw	a5,28(sp)
	slli	a3,a0,1
	add	a3,a5,a3
	ble	a0,zero,.L34
.L33:
	sh	zero,0(a5)
	addi	a5,a5,2
	bne	a5,a3,.L33
.L34:
	li	a0,-7
	j	.L28
	.size	MP3Decode, .-MP3Decode
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
