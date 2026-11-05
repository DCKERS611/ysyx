#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"h264bsd_slice_header.c"
	.option nopic
	.text
	.globl	__mulsi3
	.globl	__udivsi3
	.globl	__umodsi3
	.section	.text.h264bsdDecodeSliceHeader,"ax",@progbits
	.align	2
	.globl	h264bsdDecodeSliceHeader
	.hidden	h264bsdDecodeSliceHeader
	.type	h264bsdDecodeSliceHeader, @function
h264bsdDecodeSliceHeader:
	addi	sp,sp,-76
	sw	s1,64(sp)
	mv	s1,a1
	mv	a5,a0
	sw	s0,68(sp)
	li	a1,0
	mv	s0,a2
	mv	a0,s1
	li	a2,988
	sw	a5,0(sp)
	sw	ra,72(sp)
	sw	a3,16(sp)
	sw	a4,12(sp)
	call	memset
	lw	a4,52(s0)
	lw	a3,56(s0)
	lw	a0,0(sp)
	addi	a1,sp,48
	sw	a4,8(sp)
	sw	a3,4(sp)
	call	h264bsdDecodeExpGolombUnsigned
	mv	a5,a0
	bne	a0,zero,.L1
	lw	a3,4(sp)
	lw	a4,8(sp)
	mv	a1,a3
	mv	a0,a4
	call	__mulsi3
	lw	a5,48(sp)
	sw	a5,0(s1)
	bltu	a5,a0,.L3
.L43:
	li	a5,1
.L1:
	lw	ra,72(sp)
	lw	s0,68(sp)
	lw	s1,64(sp)
	mv	a0,a5
	addi	sp,sp,76
	jr	ra
.L3:
	sw	a0,4(sp)
	lw	a0,0(sp)
	addi	a1,sp,48
	call	h264bsdDecodeExpGolombUnsigned
	mv	a5,a0
	bne	a0,zero,.L1
	lw	a5,48(sp)
	li	a4,2
	lw	a2,4(sp)
	sw	a5,4(s1)
	beq	a5,a4,.L4
	li	a4,7
	beq	a5,a4,.L4
	beq	a5,zero,.L5
	li	a4,5
	bne	a5,a4,.L43
.L5:
	lw	a5,12(sp)
	lw	a4,0(a5)
	li	a5,5
	beq	a4,a5,.L43
	lw	a5,44(s0)
	beq	a5,zero,.L43
.L4:
	lw	a0,0(sp)
	addi	a1,sp,48
	sw	a2,4(sp)
	call	h264bsdDecodeExpGolombUnsigned
	mv	a5,a0
	bne	a0,zero,.L1
	lw	a3,16(sp)
	lw	a4,48(sp)
	lw	a3,0(a3)
	sw	a4,8(s1)
	bne	a4,a3,.L43
	lw	a0,12(s0)
	lw	a2,4(sp)
	beq	a0,zero,.L72
	li	a4,0
.L8:
	mv	a1,a4
	addi	a4,a4,1
	srl	a3,a0,a4
	bne	a3,zero,.L8
.L7:
	lw	a0,0(sp)
	sw	a5,8(sp)
	sw	a2,4(sp)
	call	h264bsdGetBits
	li	a4,-1
	beq	a0,a4,.L43
	lw	a5,12(sp)
	li	a4,5
	lw	a2,4(sp)
	lw	a3,0(a5)
	lw	a5,8(sp)
	beq	a3,a4,.L145
	sw	a0,12(s1)
.L68:
	lw	a4,16(s0)
	bne	a4,zero,.L11
	lw	a0,20(s0)
	beq	a0,zero,.L73
.L13:
	mv	a1,a4
	addi	a4,a4,1
	srl	a3,a0,a4
	bne	a3,zero,.L13
.L12:
	lw	a0,0(sp)
	sw	a5,8(sp)
	sw	a2,4(sp)
	call	h264bsdGetBits
	li	a4,-1
	beq	a0,a4,.L43
	lw	a5,16(sp)
	lw	a2,4(sp)
	lw	a4,8(a5)
	sw	a0,20(s1)
	lw	a5,8(sp)
	bne	a4,zero,.L146
.L14:
	lw	a4,12(sp)
	lw	a3,0(a4)
	li	a4,5
	beq	a3,a4,.L15
.L17:
	lw	a4,16(s0)
.L11:
	li	a3,1
	beq	a4,a3,.L18
.L21:
	lw	a4,16(sp)
	lw	a4,68(a4)
	bne	a4,zero,.L147
.L20:
	lw	a4,4(s1)
	beq	a4,zero,.L24
	li	a3,5
	beq	a4,a3,.L24
.L26:
	lw	a3,12(sp)
	lw	a4,4(a3)
	beq	a4,zero,.L41
	lw	a1,44(s0)
	lw	a3,0(a3)
	li	a4,5
	sw	a1,24(sp)
	beq	a3,a4,.L148
	lw	a0,0(sp)
	li	a1,1
	sw	a5,36(sp)
	sw	a2,4(sp)
	call	h264bsdGetBits
	li	a4,-1
	beq	a0,a4,.L43
	sw	a0,284(s1)
	lw	a2,4(sp)
	beq	a0,zero,.L41
	lw	a5,24(sp)
	addi	s0,s1,288
	sw	s1,44(sp)
	addi	a4,a5,1
	slli	a5,a4,1
	sw	a5,12(sp)
	addi	a5,sp,60
	lw	s1,0(sp)
	sw	zero,28(sp)
	sw	zero,20(sp)
	sw	zero,32(sp)
	sw	zero,8(sp)
	sw	a5,4(sp)
	sw	a2,40(sp)
	j	.L45
.L56:
	addi	a4,a5,-1
	li	a3,2
	bgtu	a4,a3,.L58
	lw	a5,20(sp)
	addi	a5,a5,1
	sw	a5,20(sp)
.L57:
	lw	a5,8(sp)
	lw	a4,12(sp)
	addi	s0,s0,20
	bgtu	a5,a4,.L34
.L45:
	lw	a1,4(sp)
	mv	a0,s1
	call	h264bsdDecodeExpGolombUnsigned
	bne	a0,zero,.L35
	lw	a5,60(sp)
	li	a4,6
	bgtu	a5,a4,.L34
	sw	a5,0(s0)
	andi	a4,a5,-3
	li	a3,1
	beq	a4,a3,.L149
	li	a4,2
	beq	a5,a4,.L70
.L50:
	li	a4,6
	beq	a5,a4,.L52
.L53:
	li	a4,4
	beq	a5,a4,.L150
.L54:
	lw	a3,8(sp)
	li	a4,5
	addi	a3,a3,1
	sw	a3,8(sp)
	bne	a5,a4,.L56
	lw	a5,32(sp)
	addi	a5,a5,1
	sw	a5,32(sp)
	j	.L57
.L15:
	lw	a4,20(s0)
	lw	a3,20(s1)
	srli	a4,a4,1
	bgtu	a3,a4,.L43
	lw	a4,24(s1)
	ble	a4,zero,.L16
	beq	a3,zero,.L17
.L151:
	li	a5,1
	j	.L1
.L16:
	add	a3,a3,a4
	beq	a3,zero,.L17
	j	.L151
.L145:
	bne	a0,zero,.L43
	lw	a0,0(sp)
	sw	zero,12(s1)
	addi	a1,sp,48
	sw	a5,8(sp)
	sw	a2,4(sp)
	call	h264bsdDecodeExpGolombUnsigned
	lw	a2,4(sp)
	lw	a5,8(sp)
	bne	a0,zero,.L35
	lw	a4,48(sp)
	li	a3,65536
	sw	a4,16(s1)
	bltu	a4,a3,.L68
	li	a5,1
	j	.L1
.L24:
	lw	a0,0(sp)
	li	a1,1
	sw	a5,8(sp)
	sw	a2,4(sp)
	call	h264bsdGetBits
	li	a4,-1
	beq	a0,a4,.L43
	sw	a0,40(s1)
	lw	a2,4(sp)
	lw	a5,8(sp)
	bne	a0,zero,.L152
	lw	a4,16(sp)
	lw	a4,48(a4)
	mv	a3,a4
	sw	a4,8(sp)
	li	a4,16
	bgtu	a3,a4,.L43
.L28:
	lw	a3,8(sp)
	lw	a4,4(s1)
	sw	a3,44(s1)
	bne	a4,zero,.L153
.L29:
	sw	a5,24(sp)
	lw	a0,0(sp)
	lw	a5,12(s0)
	li	a1,1
	sw	a2,4(sp)
	sw	a5,20(sp)
	call	h264bsdGetBits
	li	a4,-1
	lw	a2,4(sp)
	lw	a5,24(sp)
	beq	a0,a4,.L43
	sw	a0,68(s1)
	beq	a0,zero,.L26
	addi	a4,s1,72
	li	a3,0
	addi	a1,sp,60
	sw	s1,32(sp)
	sw	s0,36(sp)
	sw	a1,4(sp)
	sw	a2,24(sp)
	sw	a5,28(sp)
	mv	s1,a4
	mv	s0,a3
.L33:
	lw	a1,4(sp)
	lw	a0,0(sp)
	call	h264bsdDecodeExpGolombUnsigned
	bne	a0,zero,.L35
	lw	a5,60(sp)
	li	a2,3
	bgtu	a5,a2,.L34
	sw	a5,0(s1)
	li	a2,1
	bleu	a5,a2,.L154
	li	a2,2
	beq	a5,a2,.L155
	mv	a3,s0
	lw	a2,24(sp)
	lw	a5,28(sp)
	lw	s1,32(sp)
	lw	s0,36(sp)
	addi	a3,a3,1
.L71:
	li	a4,1
	bne	a3,a4,.L26
	li	a5,1
	j	.L1
.L154:
	lw	a0,0(sp)
	addi	a1,sp,56
	call	h264bsdDecodeExpGolombUnsigned
	bne	a0,zero,.L35
	lw	a5,56(sp)
	lw	a4,20(sp)
	bleu	a4,a5,.L34
	lw	a2,60(sp)
	addi	a5,a5,1
	sw	a5,4(s1)
.L37:
	li	a5,3
	addi	s0,s0,1
	beq	a2,a5,.L156
	lw	a5,8(sp)
	addi	s1,s1,12
	bleu	s0,a5,.L33
.L34:
	li	a0,1
.L35:
	mv	a5,a0
	j	.L1
.L148:
	lw	a0,0(sp)
	li	a1,1
	sw	a2,4(sp)
	li	s0,-1
	call	h264bsdGetBits
	beq	a0,s0,.L43
	sw	a0,276(s1)
	lw	a0,0(sp)
	li	a1,1
	call	h264bsdGetBits
	beq	a0,s0,.L43
	lw	a4,24(sp)
	sw	a0,280(s1)
	lw	a2,4(sp)
	bne	a4,zero,.L41
	bne	a0,zero,.L43
.L41:
	lw	a0,0(sp)
	addi	a1,sp,52
	sw	a2,4(sp)
	call	h264bsdDecodeExpGolombSigned
	mv	a5,a0
	bne	a0,zero,.L1
	lw	a2,16(sp)
	lw	a4,52(sp)
	li	a3,51
	lw	a1,52(a2)
	sw	a4,48(s1)
	add	a4,a4,a1
	sw	a4,52(sp)
	bgtu	a4,a3,.L43
	lw	a4,60(a2)
	lw	a2,4(sp)
	bne	a4,zero,.L157
.L62:
	lw	a1,16(sp)
	li	a4,1
	lw	a3,12(a1)
	bleu	a3,a4,.L1
	lw	a4,16(a1)
	li	a3,2
	addi	a4,a4,-3
	bgtu	a4,a3,.L1
	lw	a1,36(a1)
	mv	a0,a2
	sw	a5,12(sp)
	sw	a2,8(sp)
	sw	a1,4(sp)
	call	__udivsi3
	lw	a2,8(sp)
	lw	a1,4(sp)
	mv	s0,a0
	mv	a0,a2
	sw	a2,4(sp)
	call	__umodsi3
	lw	a2,4(sp)
	lw	a5,12(sp)
	addi	a3,s0,1
	beq	a0,zero,.L65
	addi	a3,s0,2
.L65:
	li	a0,-1
.L66:
	mv	a1,a5
	addi	a5,a5,1
	sll	a4,a0,a5
	and	a4,a4,a3
	bne	a4,zero,.L66
	li	a4,1
	sll	a4,a4,a1
	addi	a4,a4,-1
	and	a4,a4,a3
	beq	a4,zero,.L67
	mv	a1,a5
.L67:
	lw	a0,0(sp)
	sw	a2,4(sp)
	call	h264bsdGetBits
	li	a5,-1
	mv	s0,a0
	beq	a0,a5,.L43
	lw	a5,16(sp)
	lw	a2,4(sp)
	lw	a1,36(a5)
	sw	a0,64(s1)
	addi	a0,a1,-1
	add	a0,a0,a2
	call	__udivsi3
	sgtu	a5,s0,a0
	j	.L1
.L18:
	lw	a4,24(s0)
	bne	a4,zero,.L21
	lw	a0,0(sp)
	addi	a1,sp,52
	sw	a5,8(sp)
	sw	a2,4(sp)
	call	h264bsdDecodeExpGolombSigned
	bne	a0,zero,.L35
	lw	a5,16(sp)
	lw	a3,52(sp)
	lw	a2,4(sp)
	lw	a4,8(a5)
	sw	a3,28(s1)
	lw	a5,8(sp)
	bne	a4,zero,.L158
.L22:
	lw	a4,12(sp)
	lw	a3,0(a4)
	li	a4,5
	bne	a3,a4,.L21
	lw	a3,28(s1)
	lw	a4,32(s0)
	lw	a1,32(s1)
	add	a4,a3,a4
	add	a4,a4,a1
	ble	a4,a3,.L23
	mv	a4,a3
.L23:
	beq	a4,zero,.L21
	li	a5,1
	j	.L1
.L147:
	lw	a0,0(sp)
	addi	a1,sp,48
	sw	a5,8(sp)
	sw	a2,4(sp)
	call	h264bsdDecodeExpGolombUnsigned
	bne	a0,zero,.L35
	lw	a4,48(sp)
	li	a3,127
	lw	a2,4(sp)
	sw	a4,36(s1)
	lw	a5,8(sp)
	bleu	a4,a3,.L20
	li	a5,1
	j	.L1
.L149:
	addi	a1,sp,56
	mv	a0,s1
	call	h264bsdDecodeExpGolombUnsigned
	bne	a0,zero,.L35
	lw	a4,56(sp)
	lw	a5,60(sp)
	li	a3,2
	addi	a4,a4,1
	sw	a4,4(s0)
	beq	a5,a3,.L70
.L49:
	li	a4,3
	bne	a5,a4,.L50
.L52:
	addi	a1,sp,56
	mv	a0,s1
	call	h264bsdDecodeExpGolombUnsigned
	bne	a0,zero,.L35
	lw	a4,56(sp)
	lw	a5,60(sp)
	sw	a4,12(s0)
	j	.L53
.L72:
	li	a1,-1
	j	.L7
.L155:
	lw	a0,0(sp)
	addi	a1,sp,56
	call	h264bsdDecodeExpGolombUnsigned
	bne	a0,zero,.L35
	lw	a5,56(sp)
	lw	a2,60(sp)
	sw	a5,8(s1)
	j	.L37
.L58:
	li	a4,6
	bne	a5,a4,.L159
	lw	a5,28(sp)
	addi	a5,a5,1
	sw	a5,28(sp)
	j	.L57
.L146:
	lw	a0,0(sp)
	addi	a1,sp,52
	call	h264bsdDecodeExpGolombSigned
	bne	a0,zero,.L35
	lw	a4,52(sp)
	lw	a5,8(sp)
	lw	a2,4(sp)
	sw	a4,24(s1)
	j	.L14
.L153:
	li	a3,5
	beq	a4,a3,.L29
	j	.L26
.L152:
	lw	a0,0(sp)
	addi	a1,sp,48
	sw	a5,20(sp)
	call	h264bsdDecodeExpGolombUnsigned
	bne	a0,zero,.L35
	lw	a4,48(sp)
	li	a3,15
	bgtu	a4,a3,.L43
	addi	a5,a4,1
	sw	a5,8(sp)
	lw	a2,4(sp)
	lw	a5,20(sp)
	j	.L28
.L70:
	addi	a1,sp,56
	mv	a0,s1
	call	h264bsdDecodeExpGolombUnsigned
	bne	a0,zero,.L35
	lw	a4,56(sp)
	lw	a5,60(sp)
	sw	a4,8(s0)
	j	.L49
.L150:
	addi	a1,sp,56
	mv	a0,s1
	call	h264bsdDecodeExpGolombUnsigned
	bne	a0,zero,.L35
	lw	a5,56(sp)
	lw	a4,24(sp)
	bltu	a4,a5,.L34
	bne	a5,zero,.L141
	li	a5,65536
.L141:
	addi	a4,a5,-1
	sw	a4,16(s0)
	lw	a4,36(sp)
	lw	a5,60(sp)
	addi	a4,a4,1
	sw	a4,36(sp)
	j	.L54
.L73:
	li	a1,-1
	j	.L12
.L157:
	lw	s0,0(sp)
	sw	a0,8(sp)
	addi	a1,sp,48
	mv	a0,s0
	call	h264bsdDecodeExpGolombUnsigned
	mv	a4,a0
	bne	a0,zero,.L82
	lw	a4,48(sp)
	li	a3,2
	sw	a4,52(s1)
	bgtu	a4,a3,.L43
	li	a3,1
	lw	a2,4(sp)
	lw	a5,8(sp)
	beq	a4,a3,.L62
	addi	a1,sp,52
	mv	a0,s0
	sw	s0,0(sp)
	call	h264bsdDecodeExpGolombSigned
	mv	a4,a0
	bne	a0,zero,.L82
	lw	a4,52(sp)
	li	s0,12
	addi	a3,a4,6
	bgtu	a3,s0,.L43
	lw	a0,0(sp)
	slli	a4,a4,1
	sw	a4,56(s1)
	addi	a1,sp,52
	call	h264bsdDecodeExpGolombSigned
	mv	a4,a0
	bne	a0,zero,.L82
	lw	a4,52(sp)
	addi	a3,a4,6
	bgtu	a3,s0,.L43
	slli	a4,a4,1
	lw	a5,8(sp)
	lw	a2,4(sp)
	sw	a4,60(s1)
	j	.L62
.L82:
	mv	a5,a4
	j	.L1
.L158:
	lw	a0,0(sp)
	addi	a1,sp,52
	call	h264bsdDecodeExpGolombSigned
	mv	a4,a0
	bne	a0,zero,.L82
	lw	a4,52(sp)
	lw	a5,8(sp)
	lw	a2,4(sp)
	sw	a4,32(s1)
	j	.L22
.L159:
	bne	a5,zero,.L57
	lw	a4,28(sp)
	lw	a5,36(sp)
	lw	a3,32(sp)
	lw	a2,40(sp)
	or	a5,a4,a5
	or	a5,a5,a3
	li	a4,1
	lw	s1,44(sp)
	bgtu	a5,a4,.L43
	lw	a5,20(sp)
	beq	a5,zero,.L41
	beq	a3,zero,.L41
	li	a5,1
	j	.L1
.L156:
	mv	a3,s0
	lw	a2,24(sp)
	lw	a5,28(sp)
	lw	s1,32(sp)
	lw	s0,36(sp)
	j	.L71
	.size	h264bsdDecodeSliceHeader, .-h264bsdDecodeSliceHeader
	.section	.text.h264bsdCheckPpsId,"ax",@progbits
	.align	2
	.globl	h264bsdCheckPpsId
	.hidden	h264bsdCheckPpsId
	.type	h264bsdCheckPpsId, @function
h264bsdCheckPpsId:
	lw	t1,0(a0)
	lw	a2,4(a0)
	lw	a3,8(a0)
	lw	a4,12(a0)
	lw	a5,16(a0)
	addi	sp,sp,-36
	sw	s0,28(sp)
	addi	a0,sp,4
	mv	s0,a1
	mv	a1,sp
	sw	ra,32(sp)
	sw	t1,4(sp)
	sw	a2,8(sp)
	sw	a3,12(sp)
	sw	a4,16(sp)
	sw	a5,20(sp)
	call	h264bsdDecodeExpGolombUnsigned
	beq	a0,zero,.L164
.L160:
	lw	ra,32(sp)
	lw	s0,28(sp)
	addi	sp,sp,36
	jr	ra
.L164:
	mv	a1,sp
	addi	a0,sp,4
	call	h264bsdDecodeExpGolombUnsigned
	bne	a0,zero,.L160
	mv	a1,sp
	addi	a0,sp,4
	call	h264bsdDecodeExpGolombUnsigned
	bne	a0,zero,.L160
	lw	a5,0(sp)
	li	a4,255
	bgtu	a5,a4,.L162
	lw	ra,32(sp)
	sw	a5,0(s0)
	lw	s0,28(sp)
	addi	sp,sp,36
	jr	ra
.L162:
	li	a0,1
	j	.L160
	.size	h264bsdCheckPpsId, .-h264bsdCheckPpsId
	.section	.text.h264bsdCheckFrameNum,"ax",@progbits
	.align	2
	.globl	h264bsdCheckFrameNum
	.hidden	h264bsdCheckFrameNum
	.type	h264bsdCheckFrameNum, @function
h264bsdCheckFrameNum:
	lw	a5,16(a0)
	lw	t0,0(a0)
	lw	t1,4(a0)
	lw	a3,8(a0)
	lw	a4,12(a0)
	addi	sp,sp,-40
	sw	s0,32(sp)
	addi	a0,sp,8
	mv	s0,a1
	addi	a1,sp,4
	sw	s1,28(sp)
	sw	a5,24(sp)
	sw	ra,36(sp)
	mv	s1,a2
	sw	t0,8(sp)
	sw	t1,12(sp)
	sw	a3,16(sp)
	sw	a4,20(sp)
	call	h264bsdDecodeExpGolombUnsigned
	mv	a5,a0
	beq	a0,zero,.L173
.L165:
	lw	ra,36(sp)
	lw	s0,32(sp)
	lw	s1,28(sp)
	mv	a0,a5
	addi	sp,sp,40
	jr	ra
.L173:
	addi	a1,sp,4
	addi	a0,sp,8
	call	h264bsdDecodeExpGolombUnsigned
	mv	a5,a0
	bne	a0,zero,.L165
	addi	a1,sp,4
	addi	a0,sp,8
	call	h264bsdDecodeExpGolombUnsigned
	mv	a5,a0
	bne	a0,zero,.L165
	beq	s0,zero,.L169
	li	a4,0
.L168:
	mv	a1,a4
	addi	a4,a4,1
	srl	a3,s0,a4
	bne	a3,zero,.L168
.L167:
	addi	a0,sp,8
	sw	a5,0(sp)
	call	h264bsdGetBits
	li	a4,-1
	li	a5,1
	beq	a0,a4,.L165
	lw	a5,0(sp)
	lw	ra,36(sp)
	lw	s0,32(sp)
	sw	a0,0(s1)
	lw	s1,28(sp)
	mv	a0,a5
	addi	sp,sp,40
	jr	ra
.L169:
	li	a1,-1
	j	.L167
	.size	h264bsdCheckFrameNum, .-h264bsdCheckFrameNum
	.section	.text.h264bsdCheckIdrPicId,"ax",@progbits
	.align	2
	.globl	h264bsdCheckIdrPicId
	.hidden	h264bsdCheckIdrPicId
	.type	h264bsdCheckIdrPicId, @function
h264bsdCheckIdrPicId:
	li	a5,5
	beq	a2,a5,.L175
	li	a0,1
	ret
.L175:
	addi	sp,sp,-36
	lw	t1,0(a0)
	lw	a2,4(a0)
	lw	a4,12(a0)
	lw	a5,16(a0)
	sw	s0,28(sp)
	mv	s0,a3
	lw	a3,8(a0)
	sw	s1,24(sp)
	addi	a0,sp,4
	mv	s1,a1
	mv	a1,sp
	sw	ra,32(sp)
	sw	t1,4(sp)
	sw	a2,8(sp)
	sw	a3,12(sp)
	sw	a4,16(sp)
	sw	a5,20(sp)
	call	h264bsdDecodeExpGolombUnsigned
	beq	a0,zero,.L185
.L174:
	lw	ra,32(sp)
	lw	s0,28(sp)
	lw	s1,24(sp)
	addi	sp,sp,36
	jr	ra
.L185:
	mv	a1,sp
	addi	a0,sp,4
	call	h264bsdDecodeExpGolombUnsigned
	bne	a0,zero,.L174
	mv	a1,sp
	addi	a0,sp,4
	call	h264bsdDecodeExpGolombUnsigned
	bne	a0,zero,.L174
	beq	s1,zero,.L180
.L178:
	mv	a1,a0
	addi	a0,a0,1
	srl	a5,s1,a0
	bne	a5,zero,.L178
.L177:
	addi	a0,sp,4
	call	h264bsdGetBits
	li	a5,-1
	beq	a0,a5,.L179
	mv	a1,s0
	addi	a0,sp,4
	call	h264bsdDecodeExpGolombUnsigned
	j	.L174
.L179:
	lw	ra,32(sp)
	lw	s0,28(sp)
	lw	s1,24(sp)
	li	a0,1
	addi	sp,sp,36
	jr	ra
.L180:
	li	a1,-1
	j	.L177
	.size	h264bsdCheckIdrPicId, .-h264bsdCheckIdrPicId
	.section	.text.h264bsdCheckPicOrderCntLsb,"ax",@progbits
	.align	2
	.globl	h264bsdCheckPicOrderCntLsb
	.hidden	h264bsdCheckPicOrderCntLsb
	.type	h264bsdCheckPicOrderCntLsb, @function
h264bsdCheckPicOrderCntLsb:
	lw	a5,16(a0)
	lw	t2,0(a0)
	lw	t0,4(a0)
	lw	t1,8(a0)
	lw	a4,12(a0)
	addi	sp,sp,-44
	sw	s0,36(sp)
	addi	a0,sp,12
	mv	s0,a1
	addi	a1,sp,8
	sw	s1,32(sp)
	sw	a5,28(sp)
	sw	ra,40(sp)
	mv	s1,a2
	sw	a3,0(sp)
	sw	t2,12(sp)
	sw	t0,16(sp)
	sw	t1,20(sp)
	sw	a4,24(sp)
	call	h264bsdDecodeExpGolombUnsigned
	mv	a5,a0
	beq	a0,zero,.L203
.L186:
	lw	ra,40(sp)
	lw	s0,36(sp)
	lw	s1,32(sp)
	mv	a0,a5
	addi	sp,sp,44
	jr	ra
.L203:
	addi	a1,sp,8
	addi	a0,sp,12
	call	h264bsdDecodeExpGolombUnsigned
	mv	a5,a0
	bne	a0,zero,.L186
	addi	a1,sp,8
	addi	a0,sp,12
	call	h264bsdDecodeExpGolombUnsigned
	mv	a5,a0
	bne	a0,zero,.L186
	lw	a2,12(s0)
	beq	a2,zero,.L196
	li	a4,0
.L189:
	mv	a1,a4
	addi	a4,a4,1
	srl	a3,a2,a4
	bne	a3,zero,.L189
.L188:
	addi	a0,sp,12
	sw	a5,4(sp)
	call	h264bsdGetBits
	li	a4,-1
	lw	a5,4(sp)
	beq	a0,a4,.L195
	li	a4,5
	beq	s1,a4,.L191
.L194:
	lw	a2,20(s0)
	li	a4,0
	li	a1,-1
	beq	a2,zero,.L193
.L192:
	mv	a1,a4
	addi	a4,a4,1
	srl	a3,a2,a4
	bne	a3,zero,.L192
.L193:
	addi	a0,sp,12
	sw	a5,4(sp)
	call	h264bsdGetBits
	li	a4,-1
	beq	a0,a4,.L195
	lw	a5,0(sp)
	sw	a0,0(a5)
	lw	a5,4(sp)
	j	.L186
.L195:
	li	a5,1
	j	.L186
.L191:
	addi	a1,sp,8
	addi	a0,sp,12
	sw	a5,4(sp)
	call	h264bsdDecodeExpGolombUnsigned
	lw	a5,4(sp)
	beq	a0,zero,.L194
	mv	a5,a0
	j	.L186
.L196:
	li	a1,-1
	j	.L188
	.size	h264bsdCheckPicOrderCntLsb, .-h264bsdCheckPicOrderCntLsb
	.section	.text.h264bsdCheckDeltaPicOrderCntBottom,"ax",@progbits
	.align	2
	.globl	h264bsdCheckDeltaPicOrderCntBottom
	.hidden	h264bsdCheckDeltaPicOrderCntBottom
	.type	h264bsdCheckDeltaPicOrderCntBottom, @function
h264bsdCheckDeltaPicOrderCntBottom:
	lw	a5,16(a0)
	lw	t2,0(a0)
	lw	t0,4(a0)
	lw	t1,8(a0)
	lw	a4,12(a0)
	addi	sp,sp,-44
	sw	s0,36(sp)
	addi	a0,sp,12
	mv	s0,a1
	addi	a1,sp,8
	sw	s1,32(sp)
	sw	a5,28(sp)
	sw	ra,40(sp)
	mv	s1,a2
	sw	a3,0(sp)
	sw	t2,12(sp)
	sw	t0,16(sp)
	sw	t1,20(sp)
	sw	a4,24(sp)
	call	h264bsdDecodeExpGolombUnsigned
	mv	a5,a0
	beq	a0,zero,.L220
.L204:
	lw	ra,40(sp)
	lw	s0,36(sp)
	lw	s1,32(sp)
	mv	a0,a5
	addi	sp,sp,44
	jr	ra
.L220:
	addi	a1,sp,8
	addi	a0,sp,12
	call	h264bsdDecodeExpGolombUnsigned
	mv	a5,a0
	bne	a0,zero,.L204
	addi	a1,sp,8
	addi	a0,sp,12
	call	h264bsdDecodeExpGolombUnsigned
	mv	a5,a0
	bne	a0,zero,.L204
	lw	a2,12(s0)
	beq	a2,zero,.L214
	li	a4,0
.L207:
	mv	a1,a4
	addi	a4,a4,1
	srl	a3,a2,a4
	bne	a3,zero,.L207
.L206:
	addi	a0,sp,12
	sw	a5,4(sp)
	call	h264bsdGetBits
	li	a4,-1
	lw	a5,4(sp)
	beq	a0,a4,.L213
	li	a4,5
	beq	s1,a4,.L209
.L212:
	lw	a3,20(s0)
	li	a1,-1
	beq	a3,zero,.L211
.L210:
	mv	a1,a5
	addi	a5,a5,1
	srl	a4,a3,a5
	bne	a4,zero,.L210
.L211:
	addi	a0,sp,12
	call	h264bsdGetBits
	li	a5,-1
	beq	a0,a5,.L213
	lw	a1,0(sp)
	addi	a0,sp,12
	call	h264bsdDecodeExpGolombSigned
	mv	a5,a0
	j	.L204
.L213:
	li	a5,1
	j	.L204
.L209:
	addi	a1,sp,8
	addi	a0,sp,12
	sw	a5,4(sp)
	call	h264bsdDecodeExpGolombUnsigned
	lw	a5,4(sp)
	beq	a0,zero,.L212
	mv	a5,a0
	j	.L204
.L214:
	li	a1,-1
	j	.L206
	.size	h264bsdCheckDeltaPicOrderCntBottom, .-h264bsdCheckDeltaPicOrderCntBottom
	.section	.text.h264bsdCheckDeltaPicOrderCnt,"ax",@progbits
	.align	2
	.globl	h264bsdCheckDeltaPicOrderCnt
	.hidden	h264bsdCheckDeltaPicOrderCnt
	.type	h264bsdCheckDeltaPicOrderCnt, @function
h264bsdCheckDeltaPicOrderCnt:
	lw	t2,0(a0)
	lw	t0,4(a0)
	lw	t1,8(a0)
	lw	a5,12(a0)
	lw	a0,16(a0)
	addi	sp,sp,-44
	sw	s0,36(sp)
	sw	a0,28(sp)
	mv	s0,a1
	addi	a0,sp,12
	addi	a1,sp,8
	sw	s1,32(sp)
	sw	ra,40(sp)
	sw	a2,0(sp)
	sw	a3,4(sp)
	mv	s1,a4
	sw	t2,12(sp)
	sw	t0,16(sp)
	sw	t1,20(sp)
	sw	a5,24(sp)
	call	h264bsdDecodeExpGolombUnsigned
	beq	a0,zero,.L237
.L221:
	lw	ra,40(sp)
	lw	s0,36(sp)
	lw	s1,32(sp)
	addi	sp,sp,44
	jr	ra
.L237:
	addi	a1,sp,8
	addi	a0,sp,12
	call	h264bsdDecodeExpGolombUnsigned
	bne	a0,zero,.L221
	addi	a1,sp,8
	addi	a0,sp,12
	call	h264bsdDecodeExpGolombUnsigned
	bne	a0,zero,.L221
	lw	a4,12(s0)
	beq	a4,zero,.L228
.L224:
	mv	a1,a0
	addi	a0,a0,1
	srl	a5,a4,a0
	bne	a5,zero,.L224
.L223:
	addi	a0,sp,12
	call	h264bsdGetBits
	mv	a4,a0
	li	a5,-1
	li	a0,1
	beq	a4,a5,.L221
	lw	a4,0(sp)
	li	a5,5
	beq	a4,a5,.L225
.L227:
	mv	a1,s1
	addi	a0,sp,12
	call	h264bsdDecodeExpGolombSigned
	bne	a0,zero,.L221
	lw	a5,4(sp)
	beq	a5,zero,.L221
	addi	a1,s1,4
	addi	a0,sp,12
	call	h264bsdDecodeExpGolombSigned
	j	.L221
.L225:
	addi	a1,sp,8
	addi	a0,sp,12
	call	h264bsdDecodeExpGolombUnsigned
	beq	a0,zero,.L227
	j	.L221
.L228:
	li	a1,-1
	j	.L223
	.size	h264bsdCheckDeltaPicOrderCnt, .-h264bsdCheckDeltaPicOrderCnt
	.section	.text.h264bsdCheckRedundantPicCnt,"ax",@progbits
	.align	2
	.globl	h264bsdCheckRedundantPicCnt
	.hidden	h264bsdCheckRedundantPicCnt
	.type	h264bsdCheckRedundantPicCnt, @function
h264bsdCheckRedundantPicCnt:
	lw	t2,0(a0)
	lw	t0,4(a0)
	lw	t1,8(a0)
	lw	a5,12(a0)
	lw	a0,16(a0)
	addi	sp,sp,-48
	sw	s0,40(sp)
	sw	a0,32(sp)
	mv	s0,a1
	addi	a0,sp,16
	addi	a1,sp,8
	sw	s1,36(sp)
	sw	ra,44(sp)
	sw	a2,4(sp)
	sw	a3,0(sp)
	mv	s1,a4
	sw	t2,16(sp)
	sw	t0,20(sp)
	sw	t1,24(sp)
	sw	a5,28(sp)
	call	h264bsdDecodeExpGolombUnsigned
	beq	a0,zero,.L265
.L238:
	lw	ra,44(sp)
	lw	s0,40(sp)
	lw	s1,36(sp)
	addi	sp,sp,48
	jr	ra
.L265:
	addi	a1,sp,8
	addi	a0,sp,16
	call	h264bsdDecodeExpGolombUnsigned
	bne	a0,zero,.L238
	addi	a1,sp,8
	addi	a0,sp,16
	call	h264bsdDecodeExpGolombUnsigned
	bne	a0,zero,.L238
	lw	a4,12(s0)
	beq	a4,zero,.L253
.L241:
	mv	a1,a0
	addi	a0,a0,1
	srl	a5,a4,a0
	bne	a5,zero,.L241
.L240:
	addi	a0,sp,16
	call	h264bsdGetBits
	li	a5,-1
	beq	a0,a5,.L249
	lw	a4,0(sp)
	li	a5,5
	beq	a4,a5,.L243
.L246:
	lw	a5,16(s0)
	bne	a5,zero,.L245
	lw	a3,20(s0)
	beq	a3,zero,.L254
.L248:
	mv	a1,a5
	addi	a5,a5,1
	srl	a4,a3,a5
	bne	a4,zero,.L248
.L247:
	addi	a0,sp,16
	call	h264bsdGetBits
	li	a5,-1
	beq	a0,a5,.L249
	lw	a5,4(sp)
	lw	a5,8(a5)
	bne	a5,zero,.L250
	lw	a5,16(s0)
.L245:
	li	a4,1
	bne	a5,a4,.L252
	lw	a5,24(s0)
	beq	a5,zero,.L266
.L252:
	mv	a1,s1
	addi	a0,sp,16
	call	h264bsdDecodeExpGolombUnsigned
	j	.L238
.L266:
	addi	a1,sp,12
	addi	a0,sp,16
	call	h264bsdDecodeExpGolombSigned
	bne	a0,zero,.L238
	lw	a5,4(sp)
	lw	a5,8(a5)
	beq	a5,zero,.L252
	addi	a1,sp,12
	addi	a0,sp,16
	call	h264bsdDecodeExpGolombSigned
	beq	a0,zero,.L252
	j	.L238
.L250:
	addi	a1,sp,12
	addi	a0,sp,16
	call	h264bsdDecodeExpGolombSigned
	bne	a0,zero,.L238
	lw	a5,16(s0)
	j	.L245
.L249:
	li	a0,1
	j	.L238
.L243:
	addi	a1,sp,8
	addi	a0,sp,16
	call	h264bsdDecodeExpGolombUnsigned
	beq	a0,zero,.L246
	j	.L238
.L253:
	li	a1,-1
	j	.L240
.L254:
	li	a1,-1
	j	.L247
	.size	h264bsdCheckRedundantPicCnt, .-h264bsdCheckRedundantPicCnt
	.section	.text.h264bsdCheckPriorPicsFlag,"ax",@progbits
	.align	2
	.globl	h264bsdCheckPriorPicsFlag
	.hidden	h264bsdCheckPriorPicsFlag
	.type	h264bsdCheckPriorPicsFlag, @function
h264bsdCheckPriorPicsFlag:
	lw	t2,0(a1)
	lw	t0,4(a1)
	lw	t1,8(a1)
	lw	a4,12(a1)
	lw	a5,16(a1)
	addi	sp,sp,-44
	sw	s0,36(sp)
	addi	a1,sp,4
	mv	s0,a0
	addi	a0,sp,12
	sw	s1,32(sp)
	sw	ra,40(sp)
	mv	s1,a2
	sw	a3,0(sp)
	sw	t2,12(sp)
	sw	t0,16(sp)
	sw	t1,20(sp)
	sw	a4,24(sp)
	sw	a5,28(sp)
	call	h264bsdDecodeExpGolombUnsigned
	beq	a0,zero,.L293
.L267:
	lw	ra,40(sp)
	lw	s0,36(sp)
	lw	s1,32(sp)
	addi	sp,sp,44
	jr	ra
.L293:
	addi	a1,sp,4
	addi	a0,sp,12
	call	h264bsdDecodeExpGolombUnsigned
	bne	a0,zero,.L267
	addi	a1,sp,4
	addi	a0,sp,12
	call	h264bsdDecodeExpGolombUnsigned
	bne	a0,zero,.L267
	lw	a4,12(s1)
	beq	a4,zero,.L281
.L270:
	mv	a1,a0
	addi	a0,a0,1
	srl	a5,a4,a0
	bne	a5,zero,.L270
.L269:
	addi	a0,sp,12
	call	h264bsdGetBits
	li	a5,-1
	beq	a0,a5,.L275
	addi	a1,sp,4
	addi	a0,sp,12
	call	h264bsdDecodeExpGolombUnsigned
	bne	a0,zero,.L267
	lw	a5,16(s1)
	bne	a5,zero,.L272
	lw	a3,20(s1)
	beq	a3,zero,.L282
.L274:
	mv	a1,a5
	addi	a5,a5,1
	srl	a4,a3,a5
	bne	a4,zero,.L274
.L273:
	addi	a0,sp,12
	call	h264bsdGetBits
	li	a5,-1
	beq	a0,a5,.L275
	lw	a5,0(sp)
	lw	a5,8(a5)
	bne	a5,zero,.L276
	lw	a5,16(s1)
.L272:
	li	a4,1
	beq	a5,a4,.L277
.L280:
	lw	a5,0(sp)
	lw	a5,68(a5)
	beq	a5,zero,.L279
	addi	a1,sp,4
	addi	a0,sp,12
	call	h264bsdDecodeExpGolombUnsigned
	bne	a0,zero,.L267
.L279:
	li	a1,1
	addi	a0,sp,12
	call	h264bsdGetBits
	addi	a5,a0,1
	sw	a0,0(s0)
	seqz	a0,a5
	j	.L267
.L275:
	li	a0,1
	j	.L267
.L277:
	lw	a5,24(s1)
	bne	a5,zero,.L280
	addi	a1,sp,8
	addi	a0,sp,12
	call	h264bsdDecodeExpGolombSigned
	bne	a0,zero,.L267
	lw	a5,0(sp)
	lw	a5,8(a5)
	beq	a5,zero,.L280
	addi	a1,sp,8
	addi	a0,sp,12
	call	h264bsdDecodeExpGolombSigned
	beq	a0,zero,.L280
	j	.L267
.L276:
	addi	a1,sp,8
	addi	a0,sp,12
	call	h264bsdDecodeExpGolombSigned
	bne	a0,zero,.L267
	lw	a5,16(s1)
	j	.L272
.L281:
	li	a1,-1
	j	.L269
.L282:
	li	a1,-1
	j	.L273
	.size	h264bsdCheckPriorPicsFlag, .-h264bsdCheckPriorPicsFlag
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
