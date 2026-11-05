#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"h264bsd_vlc.c"
	.option nopic
	.text
	.section	.text.h264bsdDecodeExpGolombUnsigned,"ax",@progbits
	.align	2
	.globl	h264bsdDecodeExpGolombUnsigned
	.hidden	h264bsdDecodeExpGolombUnsigned
	.type	h264bsdDecodeExpGolombUnsigned, @function
h264bsdDecodeExpGolombUnsigned:
	addi	sp,sp,-20
	sw	s1,8(sp)
	sw	ra,16(sp)
	sw	s0,12(sp)
	mv	s1,a0
	sw	a1,0(sp)
	call	h264bsdShowBits32
	blt	a0,zero,.L14
	li	a5,1073741824
	mv	s0,a0
	bgeu	a0,a5,.L15
	li	a5,536870912
	bgeu	a0,a5,.L16
	li	a5,268435456
	bgeu	a0,a5,.L17
	li	a1,28
	call	h264bsdCountLeadingZeros
	addi	s0,a0,4
	li	a5,32
	beq	s0,a5,.L18
	addi	a1,a0,5
	mv	a0,s1
	call	h264bsdFlushBits
	mv	a1,s0
	mv	a0,s1
	call	h264bsdGetBits
	li	a5,-1
	beq	a0,a5,.L7
	li	a5,1
	sll	a5,a5,s0
	lw	a4,0(sp)
	addi	a5,a5,-1
	add	a5,a5,a0
	sw	a5,0(a4)
	li	s0,0
	j	.L1
.L15:
	li	a1,3
	mv	a0,s1
	call	h264bsdFlushBits
	li	a5,-1
	beq	a0,a5,.L7
	lw	a5,0(sp)
	srli	s0,s0,29
	andi	s0,s0,1
	addi	s0,s0,1
	sw	s0,0(a5)
	li	s0,0
	lw	ra,16(sp)
	mv	a0,s0
	lw	s0,12(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L18:
	lw	a5,0(sp)
	li	a1,32
	mv	a0,s1
	sw	zero,0(a5)
	call	h264bsdFlushBits
	li	a1,1
	mv	a0,s1
	call	h264bsdGetBits
	li	a3,1
	beq	a0,a3,.L19
.L7:
	li	s0,1
.L1:
	lw	ra,16(sp)
	mv	a0,s0
	lw	s0,12(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L17:
	li	a1,7
	mv	a0,s1
	call	h264bsdFlushBits
	li	a5,-1
	beq	a0,a5,.L7
	lw	a5,0(sp)
	srli	s0,s0,25
	andi	s0,s0,7
	addi	s0,s0,7
	sw	s0,0(a5)
	li	s0,0
	lw	ra,16(sp)
	mv	a0,s0
	lw	s0,12(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L16:
	li	a1,5
	mv	a0,s1
	call	h264bsdFlushBits
	li	a5,-1
	beq	a0,a5,.L7
	lw	a5,0(sp)
	srli	s0,s0,27
	andi	s0,s0,3
	addi	s0,s0,3
	sw	s0,0(a5)
	li	s0,0
	lw	ra,16(sp)
	mv	a0,s0
	lw	s0,12(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L14:
	mv	a0,s1
	li	a1,1
	call	h264bsdFlushBits
	lw	a5,0(sp)
	li	s0,0
	lw	ra,16(sp)
	mv	a0,s0
	lw	s0,12(sp)
	sw	zero,0(a5)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L19:
	sw	a0,4(sp)
	mv	a0,s1
	call	h264bsdShowBits32
	mv	s0,a0
	li	a1,32
	mv	a0,s1
	call	h264bsdFlushBits
	li	a4,-1
	beq	a0,a4,.L7
	lw	a5,4(sp)
	beq	s0,zero,.L12
	bne	s0,a5,.L7
.L12:
	lw	a5,0(sp)
	sw	a4,0(a5)
	j	.L1
	.size	h264bsdDecodeExpGolombUnsigned, .-h264bsdDecodeExpGolombUnsigned
	.section	.text.h264bsdDecodeExpGolombSigned,"ax",@progbits
	.align	2
	.globl	h264bsdDecodeExpGolombSigned
	.hidden	h264bsdDecodeExpGolombSigned
	.type	h264bsdDecodeExpGolombSigned, @function
h264bsdDecodeExpGolombSigned:
	addi	sp,sp,-16
	sw	s0,8(sp)
	mv	s0,a1
	mv	a1,sp
	sw	ra,12(sp)
	sw	zero,0(sp)
	call	h264bsdDecodeExpGolombUnsigned
	lw	a5,0(sp)
	li	a4,-1
	beq	a5,a4,.L27
	beq	a0,zero,.L28
.L25:
	lw	ra,12(sp)
	lw	s0,8(sp)
	li	a0,1
	addi	sp,sp,16
	jr	ra
.L28:
	addi	a4,a5,1
	andi	a5,a5,1
	srli	a4,a4,1
	beq	a5,zero,.L29
	sw	a4,0(s0)
.L30:
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16
	jr	ra
.L27:
	beq	a0,zero,.L25
	li	a5,-2147483648
	lw	ra,12(sp)
	sw	a5,0(s0)
	lw	s0,8(sp)
	li	a0,0
	addi	sp,sp,16
	jr	ra
.L29:
	neg	a4,a4
	sw	a4,0(s0)
	j	.L30
	.size	h264bsdDecodeExpGolombSigned, .-h264bsdDecodeExpGolombSigned
	.section	.text.h264bsdDecodeExpGolombMapped,"ax",@progbits
	.align	2
	.globl	h264bsdDecodeExpGolombMapped
	.hidden	h264bsdDecodeExpGolombMapped
	.type	h264bsdDecodeExpGolombMapped, @function
h264bsdDecodeExpGolombMapped:
	addi	sp,sp,-16
	sw	s0,8(sp)
	mv	s0,a1
	mv	a1,sp
	sw	s1,4(sp)
	sw	ra,12(sp)
	mv	s1,a2
	call	h264bsdDecodeExpGolombUnsigned
	bne	a0,zero,.L35
	lw	a5,0(sp)
	li	a4,47
	bleu	a5,a4,.L37
.L35:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	li	a0,1
	addi	sp,sp,16
	jr	ra
.L37:
	beq	s1,zero,.L33
	lla	a4,.LANCHOR0
	add	a5,a4,a5
	lbu	a5,0(a5)
	lw	ra,12(sp)
	lw	s1,4(sp)
	sw	a5,0(s0)
	lw	s0,8(sp)
	addi	sp,sp,16
	jr	ra
.L33:
	lla	a4,.LANCHOR1
	add	a5,a4,a5
	lbu	a5,0(a5)
	lw	ra,12(sp)
	lw	s1,4(sp)
	sw	a5,0(s0)
	lw	s0,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	h264bsdDecodeExpGolombMapped, .-h264bsdDecodeExpGolombMapped
	.section	.text.h264bsdDecodeExpGolombTruncated,"ax",@progbits
	.align	2
	.globl	h264bsdDecodeExpGolombTruncated
	.hidden	h264bsdDecodeExpGolombTruncated
	.type	h264bsdDecodeExpGolombTruncated, @function
h264bsdDecodeExpGolombTruncated:
	bne	a2,zero,.L44
	addi	sp,sp,-12
	sw	s0,4(sp)
	mv	s0,a1
	li	a1,1
	sw	ra,8(sp)
	call	h264bsdGetBits
	li	a5,-1
	beq	a0,a5,.L45
	xori	a0,a0,1
	sw	a0,0(s0)
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,0
	addi	sp,sp,12
	jr	ra
.L44:
	tail	h264bsdDecodeExpGolombUnsigned
.L45:
	sw	a0,0(s0)
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
	.size	h264bsdDecodeExpGolombTruncated, .-h264bsdDecodeExpGolombTruncated
	.section	.rodata.codedBlockPatternInter,"a"
	.align	2
	.set	.LANCHOR1,. + 0
	.type	codedBlockPatternInter, @object
	.size	codedBlockPatternInter, 48
codedBlockPatternInter:
	.string	""
	.ascii	"\020\001\002\004\b \003\005\n\f\017/\007\013\r\016\006\t\037"
	.ascii	"#%*,!\"$('+-.\021\022\024\030\023\025\032\034\027\033\035\036"
	.ascii	"\026\031&)"
	.section	.rodata.codedBlockPatternIntra4x4,"a"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	codedBlockPatternIntra4x4, @object
	.size	codedBlockPatternIntra4x4, 48
codedBlockPatternIntra4x4:
	.string	"/\037\017"
	.ascii	"\027\033\035\036\007\013\r\016'+-.\020\003\005\n\f\023\025\032"
	.ascii	"\034#%*,\001\002\004\b\021\022\024\030\006\t\026\031 !\"$(&)"
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
