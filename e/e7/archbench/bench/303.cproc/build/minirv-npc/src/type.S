#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"type.c"
	.option nopic
	.text
	.section	.rodata.typerank.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"AM Panic: "
	.align	2
.LC1:
	.string	"Assertion `t->prop & PROPINT' failed"
	.align	2
.LC2:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/303.cproc/src/type.c:88  \n"
	.align	2
.LC3:
	.string	"internal error; unhandled integer type"
	.section	.text.typerank,"ax",@progbits
	.align	2
	.type	typerank, @function
typerank:
	lw	a4,0(a0)
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	li	a5,6
	bne	a4,a5,.L2
	lw	a0,28(a0)
.L2:
	lw	a5,4(a0)
	andi	a5,a5,2
	beq	a5,zero,.L21
	lw	a5,0(a0)
	li	a4,8
	bgtu	a5,a4,.L7
	lla	a4,.L9
	slli	a5,a5,2
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a5,a5,a4
	jr	a5
	.section	.rodata.typerank,"a",@progbits
	.align	2
	.align	2
.L9:
	.word	.L7-.L9
	.word	.L7-.L9
	.word	.L15-.L9
	.word	.L13-.L9
	.word	.L12-.L9
	.word	.L11-.L9
	.word	.L7-.L9
	.word	.L10-.L9
	.word	.L8-.L9
	.section	.text.typerank
.L15:
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
.L13:
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,2
	addi	sp,sp,12
	jr	ra
.L12:
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,3
	addi	sp,sp,12
	jr	ra
.L11:
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,4
	addi	sp,sp,12
	jr	ra
.L10:
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,5
	addi	sp,sp,12
	jr	ra
.L8:
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,6
	addi	sp,sp,12
	jr	ra
.L7:
	lla	a0,.LC3
	call	fatal
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,0
	addi	sp,sp,12
	jr	ra
.L21:
	lla	s0,.LC0
	li	a0,65
.L4:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L4
	lla	s0,.LC1
	li	a0,65
.L5:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L5
	lla	s0,.LC2
	li	a0,32
.L6:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L6
	li	a0,1
	call	halt
	.size	typerank, .-typerank
	.section	.text.mktype,"ax",@progbits
	.align	2
	.globl	mktype
	.hidden	mktype
	.type	mktype, @function
mktype:
	addi	sp,sp,-12
	sw	s1,0(sp)
	mv	s1,a0
	li	a0,64
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a1
	call	xmalloc
	lw	ra,8(sp)
	sw	s0,4(a0)
	lw	s0,4(sp)
	sw	s1,0(a0)
	sw	zero,24(a0)
	sh	zero,44(a0)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
	.size	mktype, .-mktype
	.section	.text.mkpointertype,"ax",@progbits
	.align	2
	.globl	mkpointertype
	.hidden	mkpointertype
	.type	mkpointertype, @function
mkpointertype:
	addi	sp,sp,-12
	sw	s0,4(sp)
	mv	s0,a0
	li	a0,64
	sw	s1,0(sp)
	sw	ra,8(sp)
	mv	s1,a1
	call	xmalloc
	lla	a3,.LANCHOR0
	lw	a5,20(a3)
	lw	a4,16(a3)
	lw	a3,8(a3)
	li	a2,9
	sw	a2,0(a0)
	li	a2,16
	sw	a2,4(a0)
	sw	zero,24(a0)
	sh	zero,44(a0)
	sw	s0,28(a0)
	sw	s1,40(a0)
	sw	a4,16(a0)
	sw	a5,20(a0)
	sw	a3,8(a0)
	beq	s0,zero,.L24
	lw	a5,4(s0)
	andi	a5,a5,64
	ori	a5,a5,16
	sw	a5,4(a0)
.L24:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
	.size	mkpointertype, .-mkpointertype
	.globl	__muldi3
	.section	.text.mkarraytype,"ax",@progbits
	.align	2
	.globl	mkarraytype
	.hidden	mkarraytype
	.type	mkarraytype, @function
mkarraytype:
	addi	sp,sp,-24
	sw	s1,12(sp)
	mv	s1,a0
	li	a0,64
	sw	s0,16(sp)
	sw	a2,8(sp)
	sw	a3,4(sp)
	sw	a1,0(sp)
	sw	ra,20(sp)
	call	xmalloc
	lw	a3,4(sp)
	lw	a2,8(sp)
	lw	a1,0(sp)
	li	a4,10
	or	a5,a2,a3
	seqz	a5,a5
	sw	a4,0(a0)
	sw	zero,4(a0)
	sw	zero,24(a0)
	sb	zero,45(a0)
	sw	s1,28(a0)
	sw	a1,40(a0)
	sw	zero,48(a0)
	sw	zero,52(a0)
	sb	a5,44(a0)
	mv	s0,a0
	beq	s1,zero,.L30
	lw	a5,8(s1)
	lw	a0,16(s1)
	lw	a1,20(s1)
	sw	a5,8(s0)
	call	__muldi3
	sw	a0,16(s0)
	sw	a1,20(s0)
.L30:
	lw	ra,20(sp)
	mv	a0,s0
	lw	s0,16(sp)
	lw	s1,12(sp)
	addi	sp,sp,24
	jr	ra
	.size	mkarraytype, .-mkarraytype
	.section	.text.typecompatible,"ax",@progbits
	.align	2
	.globl	typecompatible
	.hidden	typecompatible
	.type	typecompatible, @function
typecompatible:
	addi	sp,sp,-20
	sw	s0,12(sp)
	sw	s1,8(sp)
	sw	ra,16(sp)
	mv	s0,a0
	mv	s1,a1
	li	a3,10
	beq	s0,s1,.L48
.L75:
	lw	a5,0(s0)
	lw	a4,0(s1)
	beq	a5,a4,.L38
	li	a3,6
	beq	a5,a3,.L73
.L39:
	li	a5,6
	li	a0,0
	bne	a4,a5,.L54
	lw	a0,28(s1)
	lw	ra,16(sp)
	lw	s1,8(sp)
	sub	a0,a0,s0
	lw	s0,12(sp)
	seqz	a0,a0
	addi	sp,sp,20
	jr	ra
.L38:
	beq	a5,a3,.L41
	li	a4,11
	beq	a5,a4,.L42
	li	a4,9
	beq	a5,a4,.L43
.L53:
	li	a0,0
.L54:
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L41:
	lbu	a5,44(s0)
	bne	a5,zero,.L43
	lbu	a0,44(s1)
	beq	a0,zero,.L74
.L43:
	lw	a4,40(s0)
	lw	a5,40(s1)
	bne	a4,a5,.L53
	lw	s0,28(s0)
	lw	s1,28(s1)
	bne	s0,s1,.L75
.L48:
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	li	a0,1
	addi	sp,sp,20
	jr	ra
.L73:
	lw	a5,28(s0)
	li	a0,1
	bne	a5,s1,.L39
	j	.L54
.L42:
	lbu	a4,48(s0)
	lbu	a5,48(s1)
	bne	a4,a5,.L53
	lw	a5,52(s0)
	lw	a4,52(s1)
	beq	a5,zero,.L44
.L72:
	beq	a4,zero,.L53
	lw	a1,12(a4)
	lw	a0,12(a5)
	sw	a4,4(sp)
	sw	a5,0(sp)
	call	typecompatible
	beq	a0,zero,.L54
	lw	a5,0(sp)
	lw	a4,4(sp)
	li	a3,10
	lw	a5,32(a5)
	lw	a4,32(a4)
	bne	a5,zero,.L72
.L44:
	bne	a4,zero,.L53
	j	.L43
.L74:
	lw	a5,48(s0)
	beq	a5,zero,.L43
	lw	a4,48(s1)
	beq	a4,zero,.L43
	lw	a2,0(a5)
	li	a1,1
	bne	a2,a1,.L43
	lw	a1,0(a4)
	bne	a1,a2,.L43
	lw	a1,32(a5)
	lw	a2,32(a4)
	bne	a1,a2,.L54
	lw	a2,36(a5)
	lw	a5,36(a4)
	bne	a2,a5,.L54
	j	.L43
	.size	typecompatible, .-typecompatible
	.section	.text.typesame,"ax",@progbits
	.align	2
	.globl	typesame
	.hidden	typesame
	.type	typesame, @function
typesame:
	tail	typecompatible
	.size	typesame, .-typesame
	.section	.text.typecomposite,"ax",@progbits
	.align	2
	.globl	typecomposite
	.hidden	typecomposite
	.type	typecomposite, @function
typecomposite:
	ret
	.size	typecomposite, .-typecomposite
	.section	.text.typepromote,"ax",@progbits
	.align	2
	.globl	typepromote
	.hidden	typepromote
	.type	typepromote, @function
typepromote:
	lw	a5,4(a0)
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	ra,12(sp)
	sw	s1,4(sp)
	andi	a5,a5,2
	mv	s0,a0
	bne	a5,zero,.L79
.L83:
	mv	a0,s0
.L78:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L79:
	mv	s1,a1
	call	typerank
	lla	a3,.LANCHOR2
	mv	a5,a0
	mv	a0,a3
	sw	a5,0(sp)
	call	typerank
	lw	a5,0(sp)
	lla	a3,.LANCHOR2
	lw	a4,16(a3)
	ble	a5,a0,.L90
	lw	a5,20(a3)
	srli	a3,a4,29
	slli	a4,a4,3
	slli	a5,a5,3
	or	a5,a3,a5
	bne	a5,zero,.L82
	bgtu	s1,a4,.L83
.L82:
	li	a3,-1
	bne	s1,a3,.L85
	lw	a1,16(s0)
	slli	s1,a1,3
.L85:
	lbu	a3,48(s0)
	sub	a1,s1,a3
	bne	a5,zero,.L87
	lla	a0,.LANCHOR1
	bleu	a4,a1,.L78
.L87:
	lla	a0,.LANCHOR2
	j	.L78
.L90:
	lw	a5,20(a3)
	srli	a3,a4,29
	slli	a4,a4,3
	slli	a5,a5,3
	or	a5,a3,a5
	j	.L82
	.size	typepromote, .-typepromote
	.section	.rodata.typecommonreal.str1.4,"aMS",@progbits,1
	.align	2
.LC4:
	.string	"Assertion `t1->prop & PROPREAL && t2->prop & PROPREAL' failed"
	.align	2
.LC5:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/303.cproc/src/type.c:164  \n"
	.align	2
.LC6:
	.string	"internal error; could not find common real type"
	.section	.text.typecommonreal,"ax",@progbits
	.align	2
	.globl	typecommonreal
	.hidden	typecommonreal
	.type	typecommonreal, @function
typecommonreal:
	lw	a5,4(a0)
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	andi	a5,a5,4
	beq	a5,zero,.L101
	lw	a5,4(a2)
	mv	s1,a2
	andi	a5,a5,4
	beq	a5,zero,.L101
	mv	s0,a3
	call	typepromote
	mv	a5,a0
	mv	a1,s0
	mv	a0,s1
	mv	s0,a5
	call	typepromote
	mv	s1,a0
	beq	s0,a0,.L91
	lbu	a5,48(s0)
	lbu	a4,48(a0)
	beq	a4,a5,.L115
	beq	a5,zero,.L99
	mv	a5,s0
	mv	s1,a5
	mv	s0,a0
.L99:
	mv	a0,s0
	call	typerank
	mv	a5,a0
	mv	a0,s1
	sw	a5,0(sp)
	call	typerank
	lw	a5,0(sp)
	bge	a5,a0,.L91
	lw	a4,20(s1)
	lw	a5,20(s0)
	bgtu	a4,a5,.L103
	beq	a4,a5,.L116
.L106:
	lla	a5,.LANCHOR0
	beq	s1,a5,.L104
	lla	a5,.LANCHOR5
	lla	s0,.LANCHOR4
	bne	s1,a5,.L117
.L91:
	lw	ra,12(sp)
	mv	a0,s0
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L115:
	mv	a0,s0
	call	typerank
	mv	a5,a0
	mv	a0,s1
	sw	a5,0(sp)
	call	typerank
	lw	a5,0(sp)
	bgt	a5,a0,.L91
.L103:
	mv	s0,s1
.L118:
	lw	ra,12(sp)
	mv	a0,s0
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L117:
	lla	a0,.LC6
	call	fatal
	li	s0,0
	lw	ra,12(sp)
	mv	a0,s0
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L116:
	lw	a4,16(s1)
	lw	a5,16(s0)
	bleu	a4,a5,.L106
	mv	s0,s1
	j	.L118
.L104:
	lla	s0,.LANCHOR3
	j	.L91
.L101:
	lla	s0,.LC0
	li	a0,65
.L94:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L94
	lla	s0,.LC4
	li	a0,65
.L95:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L95
	lla	s0,.LC5
	li	a0,32
.L96:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L96
	li	a0,1
	call	halt
	.size	typecommonreal, .-typecommonreal
	.section	.rodata.typeadjust.str1.4,"aMS",@progbits,1
	.align	2
.LC7:
	.string	"Assertion `*tq == QUALNONE' failed"
	.align	2
.LC8:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/303.cproc/src/type.c:199  \n"
	.section	.text.typeadjust,"ax",@progbits
	.align	2
	.globl	typeadjust
	.hidden	typeadjust
	.type	typeadjust, @function
typeadjust:
	lw	a4,0(a0)
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	sw	s1,0(sp)
	li	a3,10
	mv	a5,a0
	mv	s0,a1
	beq	a4,a3,.L120
	li	a3,11
	bne	a4,a3,.L122
	lw	a5,0(a1)
	bne	a5,zero,.L131
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	li	a1,0
	addi	sp,sp,12
	tail	mkpointertype
.L120:
	lw	a4,40(a0)
	lw	a1,0(a1)
	lw	a0,28(a0)
	lw	s1,52(a5)
	or	a1,a1,a4
	call	mkpointertype
	mv	a5,a0
	sw	s1,0(s0)
.L122:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	mv	a0,a5
	addi	sp,sp,12
	jr	ra
.L131:
	lla	s0,.LC0
	li	a0,65
.L124:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L124
	lla	s0,.LC7
	li	a0,65
.L125:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L125
	lla	s0,.LC8
	li	a0,32
.L126:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L126
	li	a0,1
	call	halt
	.size	typeadjust, .-typeadjust
	.section	.rodata.typemember.str1.4,"aMS",@progbits,1
	.align	2
.LC9:
	.string	"Assertion `t->kind == TYPESTRUCT || t->kind == TYPEUNION' failed"
	.align	2
.LC10:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/303.cproc/src/type.c:210  \n"
	.section	.text.typemember,"ax",@progbits
	.align	2
	.globl	typemember
	.hidden	typemember
	.type	typemember, @function
typemember:
	lw	a5,0(a0)
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	addi	a5,a5,-12
	li	a4,1
	sw	a2,0(sp)
	bgtu	a5,a4,.L153
	lw	s0,52(a0)
	mv	s1,a1
	bne	s0,zero,.L141
	j	.L137
.L155:
	mv	a1,s1
	call	strcmp
	beq	a0,zero,.L154
.L139:
	lw	s0,28(s0)
	beq	s0,zero,.L137
.L141:
	lw	a0,0(s0)
	bne	a0,zero,.L155
	lw	a0,4(s0)
	lw	a2,0(sp)
	mv	a1,s1
	call	typemember
	beq	a0,zero,.L139
	lw	a1,0(sp)
	lw	a4,16(s0)
	lw	a2,20(s0)
	lw	a5,0(a1)
	lw	a3,4(a1)
	mv	s0,a0
	add	a4,a5,a4
	sltu	a5,a4,a5
	add	a3,a3,a2
	add	a5,a5,a3
	sw	a4,0(a1)
	sw	a5,4(a1)
	j	.L132
.L137:
	li	s0,0
.L132:
	lw	ra,12(sp)
	mv	a0,s0
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L154:
	lw	a1,0(sp)
	lw	a4,16(s0)
	lw	a2,20(s0)
	lw	a5,0(a1)
	lw	a3,4(a1)
	lw	ra,12(sp)
	add	a4,a5,a4
	mv	a0,s0
	sltu	a5,a4,a5
	lw	s0,8(sp)
	add	a3,a3,a2
	add	a5,a5,a3
	sw	a4,0(a1)
	sw	a5,4(a1)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L153:
	lla	s0,.LC0
	li	a0,65
.L134:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L134
	lla	s0,.LC9
	li	a0,65
.L135:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L135
	lla	s0,.LC10
	li	a0,32
.L136:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L136
	li	a0,1
	call	halt
	.size	typemember, .-typemember
	.section	.rodata.typehasint.str1.4,"aMS",@progbits,1
	.align	2
.LC11:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/303.cproc/src/type.c:229  \n"
	.section	.text.typehasint,"ax",@progbits
	.align	2
	.globl	typehasint
	.hidden	typehasint
	.type	typehasint, @function
typehasint:
	lw	a4,4(a0)
	andi	a4,a4,2
	beq	a4,zero,.L185
	mv	a5,a0
	lbu	a0,48(a0)
	bne	a3,zero,.L186
.L161:
	lw	a4,16(a5)
	li	a5,8
	sub	a5,a5,a4
	slli	a5,a5,3
	add	a0,a5,a0
	addi	a5,a0,-32
	blt	a5,zero,.L169
	li	a4,-1
	srl	a4,a4,a5
	li	a5,0
.L170:
	li	a0,1
	bleu	a2,a5,.L187
.L172:
	li	a0,0
.L168:
	ret
.L186:
	bge	a2,zero,.L161
	beq	a0,zero,.L168
	lw	a5,16(a5)
	slli	a5,a5,3
	addi	a3,a5,-33
	addi	a5,a5,-1
	blt	a3,zero,.L164
	li	a4,-1
	sll	a4,a4,a3
	li	a3,0
.L165:
	li	a0,1
	bgtu	a4,a2,.L172
	bne	a4,a2,.L168
	bleu	a3,a1,.L168
	li	a0,0
	j	.L168
.L187:
	bne	a2,a5,.L168
	bleu	a1,a4,.L168
	li	a0,0
	j	.L168
.L169:
	li	a4,31
	li	a5,-1
	sub	a4,a4,a0
	li	a3,-2
	sll	a3,a3,a4
	srl	a4,a5,a0
	or	a4,a3,a4
	srl	a5,a5,a0
	j	.L170
.L164:
	li	a3,-1
	li	a4,31
	srli	a0,a3,1
	sub	a4,a4,a5
	srl	a0,a0,a4
	sll	a4,a3,a5
	or	a4,a0,a4
	sll	a3,a3,a5
	j	.L165
.L185:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LC0
	li	a0,65
.L158:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L158
	lla	s0,.LC1
	li	a0,65
.L159:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L159
	lla	s0,.LC11
	li	a0,32
.L160:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L160
	li	a0,1
	call	halt
	.size	typehasint, .-typehasint
	.hidden	typeadjvalist
	.globl	typeadjvalist
	.hidden	typenullptr
	.globl	typenullptr
	.hidden	typeullong
	.globl	typeullong
	.hidden	typellong
	.globl	typellong
	.hidden	typeulong
	.globl	typeulong
	.hidden	typelong
	.globl	typelong
	.hidden	typeuint
	.globl	typeuint
	.hidden	typeint
	.globl	typeint
	.hidden	typeushort
	.globl	typeushort
	.hidden	typeshort
	.globl	typeshort
	.hidden	typeuchar
	.globl	typeuchar
	.hidden	typeschar
	.globl	typeschar
	.hidden	typechar
	.globl	typechar
	.hidden	typebool
	.globl	typebool
	.hidden	typevoid
	.globl	typevoid
	.section	.data.typebool,"aw"
	.align	3
	.type	typebool, @object
	.size	typebool, 64
typebool:
	.word	2
	.word	30
	.word	1
	.zero	4
	.word	1
	.word	0
	.zero	24
	.byte	0
	.zero	1
	.zero	10
	.zero	4
	.section	.data.typechar,"aw"
	.align	3
	.type	typechar, @object
	.size	typechar, 64
typechar:
	.word	3
	.word	31
	.word	1
	.zero	4
	.word	1
	.word	0
	.zero	24
	.byte	1
	.zero	1
	.zero	10
	.zero	4
	.section	.data.typeint,"aw"
	.align	3
	.set	.LANCHOR2,. + 0
	.type	typeint, @object
	.size	typeint, 64
typeint:
	.word	5
	.word	30
	.word	4
	.zero	4
	.word	4
	.word	0
	.zero	24
	.byte	1
	.zero	1
	.zero	10
	.zero	4
	.section	.data.typellong,"aw"
	.align	3
	.set	.LANCHOR5,. + 0
	.type	typellong, @object
	.size	typellong, 64
typellong:
	.word	8
	.word	30
	.word	8
	.zero	4
	.word	8
	.word	0
	.zero	24
	.byte	1
	.zero	1
	.zero	10
	.zero	4
	.section	.data.typelong,"aw"
	.align	3
	.set	.LANCHOR0,. + 0
	.type	typelong, @object
	.size	typelong, 64
typelong:
	.word	7
	.word	30
	.word	8
	.zero	4
	.word	8
	.word	0
	.zero	24
	.byte	1
	.zero	1
	.zero	10
	.zero	4
	.section	.data.typenullptr,"aw"
	.align	3
	.type	typenullptr, @object
	.size	typenullptr, 64
typenullptr:
	.word	14
	.word	16
	.word	8
	.zero	4
	.word	8
	.word	0
	.zero	40
	.section	.data.typeschar,"aw"
	.align	3
	.type	typeschar, @object
	.size	typeschar, 64
typeschar:
	.word	3
	.word	31
	.word	1
	.zero	4
	.word	1
	.word	0
	.zero	24
	.byte	1
	.zero	1
	.zero	10
	.zero	4
	.section	.data.typeshort,"aw"
	.align	3
	.type	typeshort, @object
	.size	typeshort, 64
typeshort:
	.word	4
	.word	30
	.word	2
	.zero	4
	.word	2
	.word	0
	.zero	24
	.byte	1
	.zero	1
	.zero	10
	.zero	4
	.section	.data.typeuchar,"aw"
	.align	3
	.type	typeuchar, @object
	.size	typeuchar, 64
typeuchar:
	.word	3
	.word	31
	.word	1
	.zero	4
	.word	1
	.word	0
	.zero	24
	.byte	0
	.zero	1
	.zero	10
	.zero	4
	.section	.data.typeuint,"aw"
	.align	3
	.set	.LANCHOR1,. + 0
	.type	typeuint, @object
	.size	typeuint, 64
typeuint:
	.word	5
	.word	30
	.word	4
	.zero	4
	.word	4
	.word	0
	.zero	24
	.byte	0
	.zero	1
	.zero	10
	.zero	4
	.section	.data.typeullong,"aw"
	.align	3
	.set	.LANCHOR4,. + 0
	.type	typeullong, @object
	.size	typeullong, 64
typeullong:
	.word	8
	.word	30
	.word	8
	.zero	4
	.word	8
	.word	0
	.zero	24
	.byte	0
	.zero	1
	.zero	10
	.zero	4
	.section	.data.typeulong,"aw"
	.align	3
	.set	.LANCHOR3,. + 0
	.type	typeulong, @object
	.size	typeulong, 64
typeulong:
	.word	7
	.word	30
	.word	8
	.zero	4
	.word	8
	.word	0
	.zero	24
	.byte	0
	.zero	1
	.zero	10
	.zero	4
	.section	.data.typeushort,"aw"
	.align	3
	.type	typeushort, @object
	.size	typeushort, 64
typeushort:
	.word	4
	.word	30
	.word	2
	.zero	4
	.word	2
	.word	0
	.zero	24
	.byte	0
	.zero	1
	.zero	10
	.zero	4
	.section	.data.typevoid,"aw"
	.align	3
	.type	typevoid, @object
	.size	typevoid, 64
typevoid:
	.word	1
	.zero	40
	.byte	1
	.zero	19
	.section	.sbss.typeadjvalist,"aw",@nobits
	.align	2
	.type	typeadjvalist, @object
	.size	typeadjvalist, 4
typeadjvalist:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
