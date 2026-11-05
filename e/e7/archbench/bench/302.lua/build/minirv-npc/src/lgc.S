#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"lgc.c"
	.option nopic
	.text
	.section	.text.reallymarkobject,"ax",@progbits
	.align	2
	.type	reallymarkobject, @function
reallymarkobject:
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	lbu	a4,5(a1)
	mv	s0,a1
	lla	s1,.L5
.L2:
	lbu	a5,4(s0)
	andi	a4,a4,252
	sb	a4,5(s0)
	addi	a5,a5,-4
	andi	a5,a5,0xff
	li	a3,34
	bgtu	a5,a3,.L1
	slli	a5,a5,2
	add	a5,a5,s1
	lw	a5,0(a5)
	add	a5,a5,s1
	jr	a5
	.section	.rodata.reallymarkobject,"a",@progbits
	.align	2
	.align	2
.L5:
	.word	.L12-.L5
	.word	.L11-.L5
	.word	.L4-.L5
	.word	.L9-.L5
	.word	.L8-.L5
	.word	.L7-.L5
	.word	.L1-.L5
	.word	.L1-.L5
	.word	.L1-.L5
	.word	.L1-.L5
	.word	.L1-.L5
	.word	.L1-.L5
	.word	.L1-.L5
	.word	.L1-.L5
	.word	.L1-.L5
	.word	.L1-.L5
	.word	.L6-.L5
	.word	.L1-.L5
	.word	.L1-.L5
	.word	.L1-.L5
	.word	.L1-.L5
	.word	.L1-.L5
	.word	.L1-.L5
	.word	.L1-.L5
	.word	.L1-.L5
	.word	.L1-.L5
	.word	.L1-.L5
	.word	.L1-.L5
	.word	.L1-.L5
	.word	.L1-.L5
	.word	.L1-.L5
	.word	.L1-.L5
	.word	.L1-.L5
	.word	.L1-.L5
	.word	.L4-.L5
	.section	.text.reallymarkobject
.L4:
	lw	a5,64(a0)
	sw	a5,8(s0)
	sw	s0,64(a0)
.L1:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L11:
	lw	a5,64(a0)
	lw	ra,12(sp)
	lw	s1,4(sp)
	sw	a5,28(s0)
	sw	s0,64(a0)
	lw	s0,8(sp)
	addi	sp,sp,16
	jr	ra
.L9:
	lw	a1,8(s0)
	beq	a1,zero,.L13
	lbu	a5,5(a1)
	andi	a5,a5,3
	bne	a5,zero,.L26
.L13:
	ori	a4,a4,4
	sb	a4,5(s0)
	lw	a5,16(a0)
	lw	a4,12(s0)
	lw	a3,16(s0)
	addi	a5,a5,24
	add	a5,a5,a4
	sw	a5,16(a0)
	lbu	a5,6(s0)
	andi	a5,a5,64
	beq	a5,zero,.L1
	lbu	a4,5(a3)
	andi	a5,a4,3
	beq	a5,zero,.L1
	mv	s0,a3
	j	.L2
.L8:
	lw	a5,64(a0)
	lw	ra,12(sp)
	lw	s1,4(sp)
	sw	a5,40(s0)
	sw	s0,64(a0)
	lw	s0,8(sp)
	addi	sp,sp,16
	jr	ra
.L7:
	lw	a5,64(a0)
	lw	ra,12(sp)
	lw	s1,4(sp)
	sw	a5,76(s0)
	sw	s0,64(a0)
	lw	s0,8(sp)
	addi	sp,sp,16
	jr	ra
.L6:
	ori	a4,a4,4
	sb	a4,5(s0)
	lw	a5,16(a0)
	lw	a4,12(s0)
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	a5,a5,17
	add	a5,a5,a4
	sw	a5,16(a0)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L12:
	ori	a4,a4,4
	sb	a4,5(s0)
	lw	a5,16(a0)
	lbu	a4,7(s0)
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	a5,a5,17
	add	a5,a5,a4
	sw	a5,16(a0)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L26:
	sw	a0,0(sp)
	call	reallymarkobject
	lbu	a4,5(s0)
	lw	a0,0(sp)
	j	.L13
	.size	reallymarkobject, .-reallymarkobject
	.section	.rodata.GCTM.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"no message"
	.align	2
.LC1:
	.string	"error in __gc metamethod (%s)"
	.section	.text.GCTM,"ax",@progbits
	.align	2
	.type	GCTM, @function
GCTM:
	addi	sp,sp,-32
	sw	s0,24(sp)
	lw	s0,16(a0)
	sw	s1,20(sp)
	sw	ra,28(sp)
	lw	a4,84(s0)
	lw	a3,52(s0)
	mv	s1,a0
	lw	a2,0(a4)
	li	a0,3
	sw	a1,0(sp)
	sw	a2,84(s0)
	sw	a3,0(a4)
	sw	a4,52(s0)
	lbu	a2,5(a4)
	andi	a2,a2,247
	sb	a2,5(a4)
	lbu	a3,49(s0)
	addi	a3,a3,-2
	andi	a3,a3,0xff
	bgtu	a3,a0,.L28
	lbu	a3,48(s0)
	andi	a2,a2,-8
	andi	a3,a3,3
	or	a3,a3,a2
	sb	a3,5(a4)
.L28:
	lbu	a3,4(a4)
	li	a2,2
	addi	a1,sp,12
	ori	a3,a3,64
	mv	a0,s1
	sw	a4,12(sp)
	sw	a3,16(sp)
	call	luaT_gettmbyobj
	beq	a0,zero,.L27
	lw	a4,4(a0)
	li	a3,6
	andi	a4,a4,15
	beq	a4,a3,.L43
.L27:
	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	s1,20(sp)
	addi	sp,sp,32
	jr	ra
.L43:
	lbu	t1,51(s0)
	lbu	t0,116(s1)
	sb	zero,116(s1)
	sb	zero,51(s0)
	lw	a1,12(s1)
	lw	a4,0(a0)
	lw	t2,20(s1)
	lw	a3,32(s1)
	sw	a4,0(a1)
	lw	a4,4(a0)
	lhu	a0,34(t2)
	addi	ra,a1,16
	sw	a4,4(a1)
	lw	a2,12(sp)
	ori	a0,a0,256
	sub	a3,a1,a3
	sw	a2,8(a1)
	lw	a5,16(sp)
	li	a4,0
	li	a2,0
	sw	a5,12(a1)
	sw	ra,12(s1)
	sh	a0,34(t2)
	lla	a1,dothecall
	mv	a0,s1
	sw	t1,8(sp)
	sw	t0,4(sp)
	call	luaD_pcall
	lw	a3,20(s1)
	lw	t0,4(sp)
	lw	t1,8(sp)
	lhu	a4,34(a3)
	andi	a4,a4,-257
	sh	a4,34(a3)
	sb	t0,116(s1)
	sb	t1,51(s0)
	beq	a0,zero,.L27
	lw	a5,0(sp)
	beq	a5,zero,.L27
	li	a4,2
	beq	a0,a4,.L44
.L30:
	mv	a1,a0
	mv	a0,s1
	call	luaD_throw
.L44:
	lw	a3,12(s1)
	li	a1,4
	lla	a2,.LC0
	lw	a4,-4(a3)
	andi	a4,a4,15
	bne	a4,a1,.L31
	lw	a2,-8(a3)
	addi	a2,a2,16
.L31:
	lla	a1,.LC1
	mv	a0,s1
	call	luaO_pushfstring
	li	a0,5
	j	.L30
	.size	GCTM, .-GCTM
	.section	.text.dothecall,"ax",@progbits
	.align	2
	.type	dothecall, @function
dothecall:
	lw	a1,12(a0)
	li	a2,0
	addi	a1,a1,-16
	tail	luaD_callnoyield
	.size	dothecall, .-dothecall
	.section	.text.clearkeys.constprop.0,"ax",@progbits
	.align	2
	.type	clearkeys.constprop.0, @function
clearkeys.constprop.0:
	beq	a1,zero,.L70
	addi	sp,sp,-20
	sw	ra,16(sp)
	sw	s0,12(sp)
	sw	s1,8(sp)
	mv	a3,a1
	li	t1,20
.L47:
	lbu	s1,7(a3)
	lw	s0,16(a3)
	li	a2,4
	sll	s1,t1,s1
	add	s1,s0,s1
	bltu	s0,s1,.L48
	j	.L52
.L50:
	addi	s0,s0,20
	bleu	s1,s0,.L52
.L48:
	lw	a5,4(s0)
	beq	a5,zero,.L50
	lw	a5,12(s0)
	andi	a4,a5,64
	andi	a5,a5,15
	beq	a4,zero,.L50
	lw	a1,8(s0)
	lbu	a4,5(a1)
	andi	a4,a4,3
	beq	a5,a2,.L73
	beq	a4,zero,.L50
	li	a5,10
	sw	zero,4(s0)
	sw	a5,12(s0)
	addi	s0,s0,20
	bgtu	s1,s0,.L48
.L52:
	lw	a3,28(a3)
	bne	a3,zero,.L47
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L73:
	beq	a4,zero,.L50
	sw	a3,4(sp)
	sw	a0,0(sp)
	call	reallymarkobject
	lw	a0,0(sp)
	lw	a3,4(sp)
	li	t1,20
	li	a2,4
	j	.L50
.L70:
	ret
	.size	clearkeys.constprop.0, .-clearkeys.constprop.0
	.section	.text.clearvalues,"ax",@progbits
	.align	2
	.type	clearvalues, @function
clearvalues:
	addi	sp,sp,-24
	sw	ra,20(sp)
	sw	s0,16(sp)
	sw	s1,12(sp)
	sw	a2,4(sp)
	sw	a0,8(sp)
	beq	a1,a2,.L74
	mv	s1,a1
.L75:
	lbu	a2,7(s1)
	lw	a5,16(s1)
	lw	a0,8(s1)
	li	a4,20
	sll	a2,a4,a2
	add	s0,a5,a2
	beq	a0,zero,.L76
	li	t1,0
	sw	s0,0(sp)
	li	t0,4
	mv	s0,t1
	j	.L79
.L78:
	beq	a3,zero,.L77
	sw	zero,4(a5)
.L77:
	addi	s0,s0,1
	bleu	a0,s0,.L121
.L79:
	lw	a5,12(s1)
	slli	a4,s0,3
	add	a5,a5,a4
	lw	a4,4(a5)
	andi	a3,a4,64
	andi	a4,a4,15
	beq	a3,zero,.L77
	lw	a1,0(a5)
	lbu	a3,5(a1)
	andi	a3,a3,3
	bne	a4,t0,.L78
	beq	a3,zero,.L77
	lw	a0,8(sp)
	addi	s0,s0,1
	call	reallymarkobject
	lw	a0,8(s1)
	li	t0,4
	bgtu	a0,s0,.L79
.L121:
	lw	s0,0(sp)
	lw	a5,16(s1)
.L76:
	li	t1,4
	bltu	a5,s0,.L80
	j	.L86
.L83:
	addi	a5,a5,20
	bleu	s0,a5,.L86
.L80:
	lw	a4,4(a5)
	beq	a4,zero,.L83
	andi	a3,a4,64
	lw	a1,0(a5)
	andi	a4,a4,15
	beq	a3,zero,.L83
	lbu	a3,5(a1)
	andi	a3,a3,3
	beq	a4,t1,.L122
	beq	a3,zero,.L83
	lw	a4,12(a5)
	sw	zero,4(a5)
	andi	a4,a4,64
	beq	a4,zero,.L83
	lw	a4,8(a5)
	lbu	a4,5(a4)
	andi	a4,a4,3
	beq	a4,zero,.L83
	li	a4,10
	sw	a4,12(a5)
	addi	a5,a5,20
	bgtu	s0,a5,.L80
.L86:
	lw	s1,28(s1)
	lw	a5,4(sp)
	bne	a5,s1,.L75
.L74:
	lw	ra,20(sp)
	lw	s0,16(sp)
	lw	s1,12(sp)
	addi	sp,sp,24
	jr	ra
.L122:
	beq	a3,zero,.L83
	lw	a0,8(sp)
	sw	a5,0(sp)
	call	reallymarkobject
	lw	a5,0(sp)
	li	t1,4
	j	.L83
	.size	clearvalues, .-clearvalues
	.section	.text.sweeplist,"ax",@progbits
	.align	2
	.type	sweeplist, @function
sweeplist:
	lw	a4,16(a0)
	addi	sp,sp,-36
	sw	s0,28(sp)
	sw	ra,32(sp)
	sw	s1,24(sp)
	lbu	a3,48(a4)
	lw	s0,0(a1)
	xori	a4,a3,3
	andi	a3,a3,3
	sw	a3,0(sp)
	beq	s0,zero,.L142
	mv	a5,a1
	addi	s1,a2,-1
	sw	a0,4(sp)
	mv	t2,a4
.L143:
	lbu	a3,5(s0)
	lw	a1,0(s0)
	xori	a2,a3,3
	and	a2,t2,a2
	beq	a2,zero,.L161
	lw	a5,0(sp)
	andi	a3,a3,-8
	or	a3,a5,a3
	sb	a3,5(s0)
	mv	a5,s0
	mv	s0,a1
.L127:
	beq	s0,zero,.L142
.L162:
	addi	s1,s1,-1
	li	a3,-1
	bne	s1,a3,.L143
	lw	ra,32(sp)
	lw	s0,28(sp)
	lw	s1,24(sp)
	mv	a0,a5
	addi	sp,sp,36
	jr	ra
.L161:
	sw	a1,0(a5)
	lbu	a3,4(s0)
	li	a2,34
	addi	a3,a3,-4
	andi	a3,a3,0xff
	bgtu	a3,a2,.L144
	lla	a4,.L129
	slli	a3,a3,2
	add	a3,a3,a4
	lw	a3,0(a3)
	add	a3,a3,a4
	jr	a3
	.section	.rodata.sweeplist,"a",@progbits
	.align	2
	.align	2
.L129:
	.word	.L136-.L129
	.word	.L135-.L129
	.word	.L134-.L129
	.word	.L133-.L129
	.word	.L132-.L129
	.word	.L131-.L129
	.word	.L144-.L129
	.word	.L144-.L129
	.word	.L144-.L129
	.word	.L144-.L129
	.word	.L144-.L129
	.word	.L144-.L129
	.word	.L144-.L129
	.word	.L144-.L129
	.word	.L144-.L129
	.word	.L144-.L129
	.word	.L130-.L129
	.word	.L144-.L129
	.word	.L144-.L129
	.word	.L144-.L129
	.word	.L144-.L129
	.word	.L144-.L129
	.word	.L144-.L129
	.word	.L144-.L129
	.word	.L144-.L129
	.word	.L144-.L129
	.word	.L144-.L129
	.word	.L144-.L129
	.word	.L144-.L129
	.word	.L144-.L129
	.word	.L144-.L129
	.word	.L144-.L129
	.word	.L144-.L129
	.word	.L144-.L129
	.word	.L128-.L129
	.section	.text.sweeplist
.L144:
	mv	s0,a1
	bne	s0,zero,.L162
.L142:
	lw	ra,32(sp)
	lw	s0,28(sp)
	lw	s1,24(sp)
	li	a0,0
	addi	sp,sp,36
	jr	ra
.L128:
	lbu	a2,6(s0)
	sw	a5,12(sp)
	sw	t2,8(sp)
	slli	a2,a2,3
	mv	a1,s0
	li	a3,0
	addi	a2,a2,16
.L159:
	lw	a0,4(sp)
	call	luaM_realloc_
	lw	a5,12(sp)
	lw	t2,8(sp)
	lw	s0,0(a5)
	j	.L127
.L130:
	lw	a2,12(s0)
	sw	a5,12(sp)
	sw	t2,8(sp)
.L160:
	mv	a1,s0
	li	a3,0
	addi	a2,a2,17
	j	.L159
.L131:
	lw	a0,4(sp)
	mv	a1,s0
	sw	a5,12(sp)
	sw	t2,8(sp)
	call	luaF_freeproto
	lw	a5,12(sp)
	lw	t2,8(sp)
	lw	s0,0(a5)
	j	.L127
.L132:
	lw	a0,4(sp)
	mv	a1,s0
	sw	a5,12(sp)
	sw	t2,8(sp)
	call	luaE_freethread
	lw	a5,12(sp)
	lw	t2,8(sp)
	lw	s0,0(a5)
	j	.L127
.L133:
	lw	a2,12(s0)
	sw	a5,12(sp)
	sw	t2,8(sp)
	mv	a1,s0
	li	a3,0
	addi	a2,a2,24
	j	.L159
.L134:
	lbu	a3,6(s0)
	beq	a3,zero,.L145
	addi	t0,s0,16
	li	t1,0
.L141:
	lw	a1,0(t0)
	beq	a1,zero,.L139
	lw	a4,4(a1)
	addi	a4,a4,-1
	sw	a4,4(a1)
	bne	a4,zero,.L158
	lw	a3,0(a1)
	addi	a4,a1,8
	beq	a3,a4,.L155
.L158:
	lbu	a3,6(s0)
.L139:
	addi	t1,t1,1
	mv	a2,a3
	addi	t0,t0,4
	blt	t1,a3,.L141
.L137:
	slli	a2,a2,2
	sw	a5,12(sp)
	sw	t2,8(sp)
	mv	a1,s0
	li	a3,0
	addi	a2,a2,16
	j	.L159
.L135:
	lw	a0,4(sp)
	mv	a1,s0
	sw	a5,12(sp)
	sw	t2,8(sp)
	call	luaH_free
	lw	a5,12(sp)
	lw	t2,8(sp)
	lw	s0,0(a5)
	j	.L127
.L136:
	lw	a0,4(sp)
	mv	a1,s0
	sw	a5,12(sp)
	sw	t2,8(sp)
	call	luaS_remove
	lbu	a2,7(s0)
	j	.L160
.L155:
	lw	a0,4(sp)
	li	a3,0
	li	a2,16
	sw	a5,20(sp)
	sw	t0,16(sp)
	sw	t1,12(sp)
	sw	t2,8(sp)
	call	luaM_realloc_
	lbu	a3,6(s0)
	lw	a5,20(sp)
	lw	t0,16(sp)
	lw	t1,12(sp)
	lw	t2,8(sp)
	j	.L139
.L145:
	li	a2,0
	j	.L137
	.size	sweeplist, .-sweeplist
	.section	.text.traverseephemeron,"ax",@progbits
	.align	2
	.type	traverseephemeron, @function
traverseephemeron:
	addi	sp,sp,-36
	sw	s0,28(sp)
	sw	ra,32(sp)
	sw	s1,24(sp)
	lbu	a5,7(a1)
	lw	s0,16(a1)
	lw	t0,8(a1)
	li	a3,20
	sll	a3,a3,a5
	mv	a4,a1
	add	a3,s0,a3
	beq	t0,zero,.L178
	li	s0,0
	li	t1,0
	sw	a3,4(sp)
	mv	s1,a0
.L166:
	lw	a5,12(a4)
	slli	a3,s0,3
	addi	s0,s0,1
	add	a5,a5,a3
	lw	a3,4(a5)
	andi	a3,a3,64
	beq	a3,zero,.L165
	lw	a1,0(a5)
	lbu	a5,5(a1)
	andi	a5,a5,3
	bne	a5,zero,.L220
.L165:
	bgtu	t0,s0,.L166
.L224:
	lw	a3,4(sp)
	lw	s0,16(a4)
	mv	a0,s1
	bleu	a3,s0,.L167
.L226:
	sw	zero,0(sp)
	li	t0,0
	j	.L172
.L222:
	beq	t2,zero,.L169
	lw	a5,8(s0)
	lbu	a5,5(a5)
	andi	a5,a5,3
	beq	a5,zero,.L169
	li	a5,10
	sw	a5,12(s0)
.L169:
	addi	s0,s0,20
	bleu	a3,s0,.L221
.L172:
	lw	a5,12(s0)
	lw	a2,4(s0)
	andi	t2,a5,64
	beq	a2,zero,.L222
	lw	a1,8(s0)
	andi	s1,a2,64
	beq	t2,zero,.L170
	lbu	a2,5(a1)
	andi	a5,a5,15
	li	t2,4
	andi	a2,a2,3
	beq	a5,t2,.L223
	beq	a2,zero,.L170
	li	t0,1
	beq	s1,zero,.L169
	lw	a5,0(s0)
	lbu	a5,5(a5)
	andi	a5,a5,3
	beq	a5,zero,.L169
	li	a5,1
	sw	a5,0(sp)
	addi	s0,s0,20
	bgtu	a3,s0,.L172
.L221:
	lbu	a5,49(a0)
	bne	a5,zero,.L176
.L174:
	lw	a5,68(a0)
	sw	a5,28(a4)
	sw	a4,68(a0)
.L163:
	lw	ra,32(sp)
	lw	s0,28(sp)
	lw	s1,24(sp)
	mv	a0,t1
	addi	sp,sp,36
	jr	ra
.L220:
	mv	a0,s1
	sw	a4,0(sp)
	call	reallymarkobject
	lw	a4,0(sp)
	li	t1,1
	lw	t0,8(a4)
	bgtu	t0,s0,.L166
	j	.L224
.L223:
	bne	a2,zero,.L225
.L170:
	beq	s1,zero,.L169
	lw	a1,0(s0)
	lbu	a5,5(a1)
	andi	a5,a5,3
	beq	a5,zero,.L169
	sw	a4,16(sp)
	sw	a3,12(sp)
	sw	t0,8(sp)
	sw	a0,4(sp)
	call	reallymarkobject
	lw	a4,16(sp)
	lw	a3,12(sp)
	lw	t0,8(sp)
	lw	a0,4(sp)
	li	t1,1
	j	.L169
.L176:
	lw	a5,0(sp)
	beq	a5,zero,.L177
	lw	a5,76(a0)
	lw	ra,32(sp)
	lw	s0,28(sp)
	sw	a5,28(a4)
	sw	a4,76(a0)
	lw	s1,24(sp)
	mv	a0,t1
	addi	sp,sp,36
	jr	ra
.L225:
	sw	a4,20(sp)
	sw	t1,16(sp)
	sw	a3,12(sp)
	sw	t0,8(sp)
	sw	a0,4(sp)
	call	reallymarkobject
	lw	a0,4(sp)
	lw	t0,8(sp)
	lw	a3,12(sp)
	lw	t1,16(sp)
	lw	a4,20(sp)
	j	.L170
.L177:
	beq	t0,zero,.L163
	lw	a5,80(a0)
	lw	ra,32(sp)
	lw	s0,28(sp)
	sw	a5,28(a4)
	sw	a4,80(a0)
	lw	s1,24(sp)
	mv	a0,t1
	addi	sp,sp,36
	jr	ra
.L178:
	li	t1,0
	bgtu	a3,s0,.L226
.L167:
	lbu	a5,49(a0)
	beq	a5,zero,.L174
	j	.L163
	.size	traverseephemeron, .-traverseephemeron
	.section	.text.propagatemark,"ax",@progbits
	.align	2
	.type	propagatemark, @function
propagatemark:
	addi	sp,sp,-24
	sw	s0,16(sp)
	lw	s0,64(a0)
	sw	ra,20(sp)
	sw	s1,12(sp)
	lbu	a3,5(s0)
	lbu	a5,4(s0)
	li	a2,33
	ori	a1,a3,4
	addi	a5,a5,-5
	sb	a1,5(s0)
	andi	a5,a5,0xff
	bgtu	a5,a2,.L227
	lla	a2,.L230
	slli	a5,a5,2
	add	a5,a5,a2
	lw	a5,0(a5)
	mv	a4,a0
	add	a5,a5,a2
	jr	a5
	.section	.rodata.propagatemark,"a",@progbits
	.align	2
	.align	2
.L230:
	.word	.L234-.L230
	.word	.L233-.L230
	.word	.L227-.L230
	.word	.L232-.L230
	.word	.L231-.L230
	.word	.L227-.L230
	.word	.L227-.L230
	.word	.L227-.L230
	.word	.L227-.L230
	.word	.L227-.L230
	.word	.L227-.L230
	.word	.L227-.L230
	.word	.L227-.L230
	.word	.L227-.L230
	.word	.L227-.L230
	.word	.L227-.L230
	.word	.L227-.L230
	.word	.L227-.L230
	.word	.L227-.L230
	.word	.L227-.L230
	.word	.L227-.L230
	.word	.L227-.L230
	.word	.L227-.L230
	.word	.L227-.L230
	.word	.L227-.L230
	.word	.L227-.L230
	.word	.L227-.L230
	.word	.L227-.L230
	.word	.L227-.L230
	.word	.L227-.L230
	.word	.L227-.L230
	.word	.L227-.L230
	.word	.L227-.L230
	.word	.L229-.L230
	.section	.text.propagatemark
.L460:
	lw	a2,28(s0)
.L289:
	lw	a5,20(s0)
	lw	a1,16(s0)
	lw	t1,12(s0)
	lw	a0,24(s0)
	add	a5,a5,a2
	addi	a5,a5,20
	add	a2,a1,t1
	add	a5,a5,a0
	slli	a2,a2,1
	slli	a1,a3,1
	add	a5,a5,a2
	add	a3,a1,a3
	add	a5,a5,a3
	slli	a5,a5,2
.L259:
	lw	a3,16(a4)
	add	a5,a3,a5
	sw	a5,16(a4)
.L227:
	lw	ra,20(sp)
	lw	s0,16(sp)
	lw	s1,12(sp)
	addi	sp,sp,24
	jr	ra
.L229:
	lw	a5,8(s0)
	sw	a5,64(a0)
	lbu	a2,6(s0)
	beq	a2,zero,.L297
	addi	s1,s0,16
	li	a3,0
	j	.L268
.L267:
	addi	a3,a3,1
	mv	a5,a2
	addi	s1,s1,8
	bge	a3,a2,.L266
.L268:
	lw	a5,4(s1)
	andi	a5,a5,64
	beq	a5,zero,.L267
	lw	a1,0(s1)
	lbu	a5,5(a1)
	andi	a5,a5,3
	beq	a5,zero,.L267
	mv	a0,a4
	sw	a3,4(sp)
	sw	a4,0(sp)
	call	reallymarkobject
	lw	a3,4(sp)
	lbu	a2,6(s0)
	lw	a4,0(sp)
	addi	a3,a3,1
	mv	a5,a2
	addi	s1,s1,8
	blt	a3,a2,.L268
.L266:
	slli	a5,a5,3
	addi	a5,a5,16
	j	.L259
.L234:
	lw	a5,28(s0)
	lw	a0,24(s0)
	sw	a5,64(a4)
	beq	a0,zero,.L448
	lbu	a5,6(a0)
	andi	a5,a5,8
	beq	a5,zero,.L450
	lbu	a5,5(a0)
	andi	a5,a5,3
	bne	a5,zero,.L446
.L448:
	lw	t1,16(s0)
	lbu	a2,7(s0)
	lw	a5,8(s0)
.L235:
	beq	a5,zero,.L296
	li	s1,0
	j	.L250
.L249:
	addi	s1,s1,1
	bgeu	s1,a5,.L451
.L250:
	lw	a3,12(s0)
	slli	a1,s1,3
	add	a3,a3,a1
	lw	a1,4(a3)
	andi	a1,a1,64
	beq	a1,zero,.L249
	lw	a1,0(a3)
	lbu	a3,5(a1)
	andi	a3,a3,3
	beq	a3,zero,.L249
	mv	a0,a4
	sw	t1,8(sp)
	sw	a2,4(sp)
	sw	a4,0(sp)
	call	reallymarkobject
	lw	a5,8(s0)
	addi	s1,s1,1
	lw	t1,8(sp)
	lw	a2,4(sp)
	lw	a4,0(sp)
	bltu	s1,a5,.L250
.L451:
	lw	a3,16(s0)
.L248:
	li	a1,20
	sll	a2,a1,a2
	add	s1,t1,a2
	bgtu	s1,a3,.L257
	j	.L246
.L252:
	beq	a2,zero,.L256
	lw	a1,8(a3)
	lbu	a2,5(a1)
	andi	a2,a2,3
	bne	a2,zero,.L452
.L256:
	andi	a5,a5,64
	beq	a5,zero,.L254
	lw	a1,0(a3)
	lbu	a5,5(a1)
	andi	a5,a5,3
	bne	a5,zero,.L453
.L254:
	addi	a3,a3,20
	bleu	s1,a3,.L454
.L257:
	lw	a2,12(a3)
	lw	a5,4(a3)
	andi	a2,a2,64
	bne	a5,zero,.L252
	beq	a2,zero,.L254
	lw	a5,8(a3)
	lbu	a5,5(a5)
	andi	a5,a5,3
	beq	a5,zero,.L254
	li	a5,10
	sw	a5,12(a3)
	j	.L254
.L233:
	lw	a5,8(s0)
	lw	a1,12(s0)
	sw	a5,64(a0)
	beq	a1,zero,.L260
	lbu	a5,5(a1)
	andi	a5,a5,3
	bne	a5,zero,.L455
.L260:
	lbu	a2,6(s0)
	addi	a3,s0,16
	li	s1,0
	li	t1,8
	bne	a2,zero,.L263
	j	.L456
.L457:
	lbu	a0,49(a4)
	beq	a0,t1,.L262
	li	a2,1
	sw	a2,12(a5)
	lbu	a2,6(s0)
.L261:
	addi	s1,s1,1
	mv	a5,a2
	addi	a3,a3,4
	bge	s1,a2,.L264
.L263:
	lw	a5,0(a3)
	beq	a5,zero,.L261
	lw	a1,0(a5)
	addi	a0,a5,8
	bne	a1,a0,.L457
.L262:
	lw	a5,4(a1)
	andi	a5,a5,64
	beq	a5,zero,.L261
	lw	a1,0(a1)
	lbu	a5,5(a1)
	andi	a5,a5,3
	beq	a5,zero,.L261
	mv	a0,a4
	sw	a3,4(sp)
	sw	a4,0(sp)
	call	reallymarkobject
	lbu	a2,6(s0)
	lw	a3,4(sp)
	lw	a4,0(sp)
	li	t1,8
	j	.L261
.L232:
	lw	a2,40(s0)
	lw	a5,68(a0)
	lw	s1,32(s0)
	sw	a2,64(a0)
	sw	a5,40(s0)
	sw	s0,68(a0)
	andi	a3,a3,-5
	sb	a3,5(s0)
	beq	s1,zero,.L298
	lw	a3,12(s0)
	bltu	s1,a3,.L271
	j	.L269
.L270:
	addi	s1,s1,8
	bgeu	s1,a3,.L269
.L271:
	lw	a5,4(s1)
	andi	a5,a5,64
	beq	a5,zero,.L270
	lw	a1,0(s1)
	lbu	a5,5(a1)
	andi	a5,a5,3
	beq	a5,zero,.L270
	mv	a0,a4
	sw	a4,0(sp)
	call	reallymarkobject
	lw	a3,12(s0)
	addi	s1,s1,8
	lw	a4,0(sp)
	bltu	s1,a3,.L271
.L269:
	lbu	a3,49(a4)
	li	a5,8
	beq	a3,a5,.L458
	lbu	a3,50(a4)
	li	a5,1
	bne	a3,a5,.L277
	lw	a5,96(s0)
.L275:
	lhu	a2,6(s0)
	addi	a5,a5,15
	slli	a5,a5,3
	slli	a3,a2,3
	add	a3,a3,a2
	slli	a3,a3,2
	add	a5,a5,a3
	j	.L259
.L231:
	lw	a3,76(s0)
	lw	a5,68(s0)
	sw	a3,64(a0)
	beq	a5,zero,.L278
	lbu	a5,5(a5)
	andi	a5,a5,3
	beq	a5,zero,.L278
	sw	zero,68(s0)
.L278:
	lw	a1,72(s0)
	beq	a1,zero,.L279
	lbu	a5,5(a1)
	andi	a5,a5,3
	bne	a5,zero,.L459
.L279:
	lw	a2,16(s0)
	li	s1,0
	bgt	a2,zero,.L281
	j	.L284
.L280:
	addi	s1,s1,1
	bge	s1,a2,.L284
.L281:
	lw	a5,44(s0)
	slli	a3,s1,3
	add	a5,a5,a3
	lw	a3,4(a5)
	andi	a3,a3,64
	beq	a3,zero,.L280
	lw	a1,0(a5)
	lbu	a5,5(a1)
	andi	a5,a5,3
	beq	a5,zero,.L280
	mv	a0,a4
	sw	a4,0(sp)
	call	reallymarkobject
	lw	a2,16(s0)
	addi	s1,s1,1
	lw	a4,0(sp)
	blt	s1,a2,.L281
.L284:
	lw	a2,12(s0)
	li	s1,0
	bgt	a2,zero,.L282
	j	.L283
.L287:
	addi	s1,s1,1
	bge	s1,a2,.L283
.L282:
	lw	a5,64(s0)
	slli	a3,s1,3
	add	a5,a5,a3
	lw	a1,0(a5)
	beq	a1,zero,.L287
	lbu	a5,5(a1)
	andi	a5,a5,3
	beq	a5,zero,.L287
	mv	a0,a4
	sw	a4,0(sp)
	call	reallymarkobject
	lw	a2,12(s0)
	addi	s1,s1,1
	lw	a4,0(sp)
	blt	s1,a2,.L282
.L283:
	lw	a2,28(s0)
	li	s1,0
	bgt	a2,zero,.L285
	j	.L286
.L290:
	addi	s1,s1,1
	bge	s1,a2,.L286
.L285:
	lw	a5,52(s0)
	slli	a3,s1,2
	add	a5,a5,a3
	lw	a1,0(a5)
	beq	a1,zero,.L290
	lbu	a5,5(a1)
	andi	a5,a5,3
	beq	a5,zero,.L290
	mv	a0,a4
	sw	a4,0(sp)
	call	reallymarkobject
	lw	a2,28(s0)
	addi	s1,s1,1
	lw	a4,0(sp)
	blt	s1,a2,.L285
.L286:
	lw	a3,32(s0)
	li	s1,0
	bgt	a3,zero,.L288
	j	.L289
.L291:
	addi	s1,s1,1
	bge	s1,a3,.L460
.L288:
	lw	a2,60(s0)
	slli	a5,s1,1
	add	a5,a5,s1
	slli	a5,a5,2
	add	a5,a2,a5
	lw	a1,0(a5)
	beq	a1,zero,.L291
	lbu	a5,5(a1)
	andi	a5,a5,3
	beq	a5,zero,.L291
	mv	a0,a4
	sw	a4,0(sp)
	call	reallymarkobject
	lw	a3,32(s0)
	lw	a4,0(sp)
	j	.L291
.L456:
	li	a5,0
.L264:
	slli	a5,a5,2
	addi	a5,a5,16
	j	.L259
.L454:
	lw	a5,8(s0)
.L246:
	lw	a3,20(s0)
	addi	a5,a5,4
	slli	a5,a5,3
	beq	a3,zero,.L259
	lbu	a2,7(s0)
	li	a3,20
	sll	a3,a3,a2
	add	a5,a5,a3
	j	.L259
.L452:
	mv	a0,a4
	sw	a3,8(sp)
	sw	a5,4(sp)
	sw	a4,0(sp)
	call	reallymarkobject
	lw	a3,8(sp)
	lw	a5,4(sp)
	lw	a4,0(sp)
	j	.L256
.L453:
	mv	a0,a4
	sw	a3,4(sp)
	sw	a4,0(sp)
	call	reallymarkobject
	lw	a3,4(sp)
	lw	a4,0(sp)
	j	.L254
.L277:
	mv	a0,s0
	sw	a4,0(sp)
	call	luaD_shrinkstack
	lw	a5,96(s0)
	lw	a4,0(sp)
	j	.L275
.L458:
	lw	a5,96(s0)
	lw	a3,32(s0)
	slli	a2,a5,3
	add	a3,a3,a2
	bleu	a3,s1,.L276
.L273:
	sw	zero,4(s1)
	addi	s1,s1,8
	bgtu	a3,s1,.L273
.L276:
	lw	a3,44(s0)
	bne	s0,a3,.L275
	lw	a3,36(s0)
	beq	a3,zero,.L275
	lw	a3,92(a4)
	sw	a3,44(s0)
	sw	s0,92(a4)
	j	.L275
.L459:
	mv	a0,a4
	sw	a4,0(sp)
	call	reallymarkobject
	lw	a4,0(sp)
	j	.L279
.L455:
	sw	a0,0(sp)
	call	reallymarkobject
	lw	a4,0(sp)
	j	.L260
.L450:
	lw	a2,136(a4)
	li	a1,3
	sw	a4,0(sp)
	call	luaT_gettm
	lw	a1,24(s0)
	lw	a4,0(sp)
	mv	s1,a0
	bne	a1,zero,.L461
.L237:
	beq	s1,zero,.L448
	lw	a5,4(s1)
	li	a3,4
	andi	a5,a5,15
	bne	a5,a3,.L448
	lw	s1,0(s1)
	li	a1,107
	sw	a4,0(sp)
	addi	s1,s1,16
	mv	a0,s1
	call	strchr
	mv	a5,a0
	li	a1,118
	mv	a0,s1
	mv	s1,a5
	call	strchr
	lw	a4,0(sp)
	beq	s1,zero,.L462
	lbu	a5,5(s0)
	andi	a5,a5,-5
	sb	a5,5(s0)
	beq	a0,zero,.L463
	lw	a3,80(a4)
	lw	a5,8(s0)
	sw	a3,28(s0)
	sw	s0,80(a4)
	j	.L246
.L461:
	lbu	a5,5(a1)
	andi	a5,a5,3
	beq	a5,zero,.L237
	mv	a0,a4
	call	reallymarkobject
	lw	a4,0(sp)
	j	.L237
.L446:
	mv	a1,a0
	mv	a0,a4
	sw	a4,0(sp)
	call	reallymarkobject
	lw	t1,16(s0)
	lbu	a2,7(s0)
	lw	a5,8(s0)
	lw	a4,0(sp)
	j	.L235
.L298:
	li	a5,1
	j	.L259
.L296:
	mv	a3,t1
	j	.L248
.L297:
	li	a5,0
	j	.L266
.L462:
	lw	a3,16(s0)
	lbu	a2,7(s0)
	lw	a5,8(s0)
	mv	t1,a3
	beq	a0,zero,.L235
	lbu	a1,5(s0)
	li	a0,20
	sll	a2,a0,a2
	andi	a1,a1,-5
	add	a2,a3,a2
	sb	a1,5(s0)
	snez	s1,a5
	bgeu	a3,a2,.L292
.L244:
	lw	a5,12(a3)
	lw	a1,4(a3)
	andi	a5,a5,64
	beq	a1,zero,.L464
	beq	a5,zero,.L242
	lw	a1,8(a3)
	lbu	a5,5(a1)
	andi	a5,a5,3
	bne	a5,zero,.L465
.L242:
	beq	s1,zero,.L466
.L241:
	addi	a3,a3,20
	bltu	a3,a2,.L244
	lw	a5,8(s0)
.L292:
	lbu	a3,49(a4)
	bne	a3,zero,.L245
	lw	a3,68(a4)
	sw	a3,28(s0)
	sw	s0,68(a4)
	j	.L246
.L465:
	mv	a0,a4
	sw	a2,8(sp)
	sw	a3,4(sp)
	sw	a4,0(sp)
	call	reallymarkobject
	lw	a2,8(sp)
	lw	a3,4(sp)
	lw	a4,0(sp)
	j	.L242
.L464:
	beq	a5,zero,.L241
	lw	a5,8(a3)
	lbu	a5,5(a5)
	andi	a5,a5,3
	beq	a5,zero,.L241
	li	a5,10
	sw	a5,12(a3)
	j	.L241
.L466:
	lw	a5,4(a3)
	andi	a1,a5,64
	beq	a1,zero,.L241
	lw	a1,0(a3)
	andi	a5,a5,15
	li	t1,4
	lbu	a0,5(a1)
	andi	a0,a0,3
	beq	a5,t1,.L467
	snez	s1,a0
	j	.L241
.L463:
	mv	a0,a4
	mv	a1,s0
	sw	a4,0(sp)
	call	traverseephemeron
	lw	a5,8(s0)
	lw	a4,0(sp)
	j	.L246
.L245:
	beq	s1,zero,.L246
	lw	a3,72(a4)
	sw	a3,28(s0)
	sw	s0,72(a4)
	j	.L246
.L467:
	beq	a0,zero,.L241
	mv	a0,a4
	sw	a2,8(sp)
	sw	a3,4(sp)
	sw	a4,0(sp)
	call	reallymarkobject
	lw	a4,0(sp)
	lw	a3,4(sp)
	lw	a2,8(sp)
	j	.L241
	.size	propagatemark, .-propagatemark
	.section	.text.convergeephemerons.constprop.0,"ax",@progbits
	.align	2
	.type	convergeephemerons.constprop.0, @function
convergeephemerons.constprop.0:
	addi	sp,sp,-16
	sw	s1,4(sp)
	sw	ra,12(sp)
	sw	s0,8(sp)
	mv	s1,a0
.L475:
	lw	s0,76(s1)
	sw	zero,76(s1)
	beq	s0,zero,.L468
	sw	zero,0(sp)
.L473:
	mv	a1,s0
	mv	a0,s1
	lw	s0,28(s0)
	call	traverseephemeron
	bne	a0,zero,.L487
	bne	s0,zero,.L473
.L488:
	lw	a5,0(sp)
	bne	a5,zero,.L475
.L468:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L471:
	mv	a0,s1
	call	propagatemark
.L487:
	lw	a4,64(s1)
	bne	a4,zero,.L471
	li	a5,1
	sw	a5,0(sp)
	bne	s0,zero,.L473
	j	.L488
	.size	convergeephemerons.constprop.0, .-convergeephemerons.constprop.0
	.section	.text.singlestep,"ax",@progbits
	.align	2
	.type	singlestep, @function
singlestep:
	lw	a4,16(a0)
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	sw	s1,20(sp)
	lbu	a5,49(a4)
	li	a3,7
	bgtu	a5,a3,.L553
	lla	a3,.L492
	slli	a5,a5,2
	add	a5,a5,a3
	lw	a5,0(a5)
	mv	s0,a0
	add	a5,a5,a3
	jr	a5
	.section	.rodata.singlestep,"a",@progbits
	.align	2
	.align	2
.L492:
	.word	.L499-.L492
	.word	.L498-.L492
	.word	.L497-.L492
	.word	.L496-.L492
	.word	.L495-.L492
	.word	.L494-.L492
	.word	.L493-.L492
	.word	.L491-.L492
	.section	.text.singlestep
.L493:
	lw	a5,84(a4)
	beq	a5,zero,.L548
	lbu	a3,50(a4)
	li	a5,1
	bne	a3,a5,.L636
.L548:
	li	a5,7
	sb	a5,49(a4)
	li	s0,0
	j	.L489
.L491:
	lw	a5,32(a4)
	lw	a1,112(a4)
	sw	zero,68(a4)
	slli	a5,a5,2
	sw	a5,16(a4)
	sw	zero,64(a4)
	sw	zero,76(a4)
	sw	zero,80(a4)
	sw	zero,72(a4)
	lbu	a5,5(a1)
	andi	a5,a5,3
	bne	a5,zero,.L637
.L502:
	lw	a5,40(a4)
	andi	a5,a5,64
	beq	a5,zero,.L503
	lw	a1,36(a4)
	lbu	a5,5(a1)
	andi	a5,a5,3
	bne	a5,zero,.L638
.L503:
	addi	s0,a4,220
	addi	s1,a4,256
	j	.L505
.L504:
	addi	s0,s0,4
	beq	s1,s0,.L639
.L505:
	lw	a1,0(s0)
	beq	a1,zero,.L504
	lbu	a5,5(a1)
	andi	a5,a5,3
	beq	a5,zero,.L504
	mv	a0,a4
	sw	a4,0(sp)
	addi	s0,s0,4
	call	reallymarkobject
	lw	a4,0(sp)
	bne	s1,s0,.L505
.L639:
	lw	s0,84(a4)
	bne	s0,zero,.L506
	j	.L508
.L507:
	lw	s0,0(s0)
	beq	s0,zero,.L508
.L506:
	lbu	a5,5(s0)
	andi	a5,a5,3
	beq	a5,zero,.L507
	mv	a0,a4
	mv	a1,s0
	sw	a4,0(sp)
	call	reallymarkobject
	lw	a4,0(sp)
	j	.L507
.L497:
	lw	a1,56(a4)
	addi	s1,a4,60
	beq	a1,zero,.L540
	li	a2,80
	lw	s0,12(a4)
	sw	a4,0(sp)
	call	sweeplist
	lw	a4,0(sp)
	lw	a3,12(a4)
	lw	a5,20(a4)
	sw	a0,56(a4)
	sub	a3,a3,s0
	add	a5,a5,a3
	sw	a5,20(a4)
	bne	a0,zero,.L542
.L540:
	li	a5,3
	sb	a5,49(a4)
	sw	s1,56(a4)
	li	s0,0
	j	.L489
.L499:
	sw	zero,16(a4)
	mv	a0,a4
	sw	a4,0(sp)
	call	propagatemark
	lw	a4,0(sp)
	lw	a5,64(a4)
	beq	a5,zero,.L640
.L509:
	lw	s0,16(a4)
.L489:
	lw	ra,28(sp)
	mv	a0,s0
	lw	s0,24(sp)
	lw	s1,20(sp)
	addi	sp,sp,32
	jr	ra
.L498:
	lw	a5,64(a4)
	mv	s1,a4
	beq	a5,zero,.L501
.L500:
	mv	a0,a4
	sw	a4,0(sp)
	call	propagatemark
	lw	a4,0(sp)
	lw	a5,64(a4)
	bne	a5,zero,.L500
	lw	s1,16(s0)
.L501:
	li	a5,8
	sb	a5,49(s1)
	sw	zero,16(s1)
	lbu	a5,5(s0)
	lw	a3,68(s1)
	andi	a5,a5,3
	sw	a3,12(sp)
	bne	a5,zero,.L641
.L510:
	lw	a5,40(s1)
	andi	a5,a5,64
	beq	a5,zero,.L511
	lw	a1,36(s1)
	lbu	a5,5(a1)
	andi	a5,a5,3
	bne	a5,zero,.L642
.L511:
	addi	a5,s1,220
	addi	a2,s1,256
	j	.L513
.L512:
	addi	a5,a5,4
	beq	a2,a5,.L643
.L513:
	lw	a1,0(a5)
	beq	a1,zero,.L512
	lbu	a3,5(a1)
	andi	a3,a3,3
	beq	a3,zero,.L512
	mv	a0,s1
	sw	a5,8(sp)
	sw	a2,4(sp)
	sw	a4,0(sp)
	call	reallymarkobject
	lw	a5,8(sp)
	lw	a2,4(sp)
	lw	a4,0(sp)
	addi	a5,a5,4
	bne	a2,a5,.L513
.L643:
	lw	a3,92(s1)
	addi	a2,s1,92
	bne	a3,zero,.L514
	j	.L523
.L644:
	beq	a5,zero,.L518
	addi	a2,a3,44
.L519:
	lw	a3,0(a2)
	beq	a3,zero,.L523
.L514:
	lbu	a1,5(a3)
	lw	t1,44(a3)
	lw	a5,36(a3)
	andi	a1,a1,7
	beq	a1,zero,.L644
	sw	t1,0(a2)
	sw	a3,44(a3)
	beq	a5,zero,.L519
.L522:
	lw	a3,12(a5)
	beq	a3,zero,.L520
	lw	a1,0(a5)
	lw	a3,4(a1)
	andi	a3,a3,64
	beq	a3,zero,.L521
	lw	a1,0(a1)
	lbu	a3,5(a1)
	andi	a3,a3,3
	bne	a3,zero,.L645
.L521:
	sw	zero,12(a5)
.L520:
	lw	a5,8(a5)
	bne	a5,zero,.L522
	j	.L519
.L495:
	lw	a1,56(a4)
	beq	a1,zero,.L545
	li	a2,80
	lw	s0,12(a4)
	sw	a4,0(sp)
	call	sweeplist
	lw	a4,0(sp)
	lw	a3,12(a4)
	lw	a5,20(a4)
	sw	a0,56(a4)
	sub	a3,a3,s0
	add	a5,a5,a3
	sw	a5,20(a4)
	bne	a0,zero,.L542
.L545:
	li	a5,5
	sb	a5,49(a4)
	sw	zero,56(a4)
	li	s0,0
	j	.L489
.L494:
	lw	a2,112(a4)
	lbu	a3,48(a4)
	li	a1,1
	lbu	a5,5(a2)
	andi	a3,a3,3
	andi	a5,a5,-8
	or	a5,a5,a3
	sb	a5,5(a2)
	lbu	a5,50(a4)
	beq	a5,a1,.L546
	lw	a3,32(a4)
	lw	a1,28(a4)
	li	a2,0
	srai	a5,a3,31
	andi	a5,a5,3
	add	a5,a5,a3
	srai	a5,a5,2
	blt	a1,a5,.L646
.L547:
	lw	a5,20(a4)
	add	a5,a5,a2
	sw	a5,20(a4)
.L546:
	li	a5,6
	sb	a5,49(a4)
	li	s0,0
	lw	ra,28(sp)
	mv	a0,s0
	lw	s0,24(sp)
	lw	s1,20(sp)
	addi	sp,sp,32
	jr	ra
.L496:
	lw	a1,56(a4)
	addi	s1,a4,84
	beq	a1,zero,.L543
	li	a2,80
	lw	s0,12(a4)
	sw	a4,0(sp)
	call	sweeplist
	lw	a4,0(sp)
	lw	a3,12(a4)
	lw	a5,20(a4)
	sw	a0,56(a4)
	sub	a3,a3,s0
	add	a5,a5,a3
	sw	a5,20(a4)
	bne	a0,zero,.L542
.L543:
	li	a5,4
	sb	a5,49(a4)
	sw	s1,56(a4)
	li	s0,0
	j	.L489
.L542:
	li	s0,400
	j	.L489
.L645:
	mv	a0,s1
	sw	a2,8(sp)
	sw	a5,4(sp)
	sw	a4,0(sp)
	call	reallymarkobject
	lw	a2,8(sp)
	lw	a5,4(sp)
	lw	a4,0(sp)
	j	.L521
.L523:
	lw	a5,64(s1)
	beq	a5,zero,.L516
.L515:
	mv	a0,s1
	sw	a4,0(sp)
	call	propagatemark
	lw	a5,64(s1)
	lw	a4,0(sp)
	bne	a5,zero,.L515
.L516:
	lw	a5,12(sp)
	lw	a3,16(s1)
	sw	a5,64(s1)
	sw	a3,4(sp)
	beq	a5,zero,.L525
.L524:
	mv	a0,s1
	sw	a4,0(sp)
	call	propagatemark
	lw	a5,64(s1)
	lw	a4,0(sp)
	bne	a5,zero,.L524
.L525:
	mv	a0,s1
	sw	zero,16(s1)
	sw	a4,0(sp)
	call	convergeephemerons.constprop.0
	lw	a5,72(s1)
	li	a2,0
	mv	a0,s1
	mv	a1,a5
	sw	a5,8(sp)
	call	clearvalues
	lw	a5,80(s1)
	li	a2,0
	mv	a0,s1
	mv	a1,a5
	sw	a5,12(sp)
	call	clearvalues
	lw	a4,4(sp)
	lw	a5,16(s1)
	lw	a1,84(s1)
	addi	t1,s1,60
	add	a5,a4,a5
	sw	a5,16(sp)
	lw	a4,0(sp)
	mv	a5,a1
	beq	a1,zero,.L647
.L526:
	mv	a2,a5
	lw	a5,0(a5)
	bne	a5,zero,.L526
	lw	a5,60(s1)
	bne	a5,zero,.L532
	j	.L648
.L650:
	lw	a3,0(a5)
	sw	a3,0(t1)
	lw	a3,0(a2)
	sw	a3,0(a5)
	sw	a5,0(a2)
	mv	a2,a5
.L531:
	lw	a5,0(t1)
	beq	a5,zero,.L649
.L532:
	lbu	a3,5(a5)
	andi	a3,a3,3
	bne	a3,zero,.L650
	mv	t1,a5
	j	.L531
.L508:
	lw	s0,16(a4)
	sb	zero,49(a4)
	lw	ra,28(sp)
	mv	a0,s0
	lw	s0,24(sp)
	lw	s1,20(sp)
	addi	sp,sp,32
	jr	ra
.L649:
	lw	a1,84(s1)
	li	a5,1
	sw	a5,96(s1)
	bne	a1,zero,.L537
	j	.L538
.L536:
	lw	a1,0(a1)
	beq	a1,zero,.L538
.L537:
	lbu	a5,5(a1)
	andi	a5,a5,3
	beq	a5,zero,.L536
	mv	a0,s1
	sw	a4,4(sp)
	sw	a1,0(sp)
	call	reallymarkobject
	lw	a4,4(sp)
	lw	a1,0(sp)
	j	.L536
.L647:
	lw	a5,60(s1)
	addi	a2,s1,84
	bne	a5,zero,.L532
	li	a5,1
	sw	a5,96(s1)
.L538:
	lw	a5,64(s1)
	beq	a5,zero,.L535
.L534:
	mv	a0,s1
	sw	a4,0(sp)
	call	propagatemark
	lw	a5,64(s1)
	lw	a4,0(sp)
	bne	a5,zero,.L534
.L535:
	mv	a0,s1
	sw	zero,16(s1)
	sw	a4,4(sp)
	call	convergeephemerons.constprop.0
	lw	a1,76(s1)
	mv	a0,s1
	call	clearkeys.constprop.0
	lw	a5,80(s1)
	mv	a0,s1
	mv	a1,a5
	sw	a5,0(sp)
	call	clearkeys.constprop.0
	lw	a2,8(sp)
	lw	a1,72(s1)
	mv	a0,s1
	call	clearvalues
	lw	a5,0(sp)
	lw	a2,12(sp)
	mv	a0,s1
	mv	a1,a5
	call	clearvalues
	mv	a0,s1
	call	luaS_clearcache
	lbu	a5,48(s1)
	lw	a3,16(s1)
	mv	a0,s0
	xori	a5,a5,3
	sb	a5,48(s1)
	lw	s1,16(s0)
	li	a5,2
	li	a2,1
	sb	a5,49(s1)
	lw	a5,16(sp)
	addi	a1,s1,52
	add	s0,a5,a3
	call	sweeplist
	lw	a4,4(sp)
	lw	ra,28(sp)
	lw	a5,8(a4)
	lw	a3,12(a4)
	sw	a0,56(s1)
	mv	a0,s0
	lw	s0,24(sp)
	add	a5,a5,a3
	sw	a5,20(a4)
	lw	s1,20(sp)
	addi	sp,sp,32
	jr	ra
.L636:
	li	s1,0
	j	.L549
.L551:
	li	a1,1
	mv	a0,s0
	sw	a4,0(sp)
	call	GCTM
	lw	a4,0(sp)
	addi	s1,s1,1
	lw	a5,84(a4)
	beq	a5,zero,.L651
.L549:
	lw	a5,96(a4)
	bgtu	a5,s1,.L551
	slli	a5,a5,1
.L550:
	slli	s0,s1,2
	sw	a5,96(a4)
	add	s0,s0,s1
	j	.L489
.L640:
	li	a5,1
	sb	a5,49(a4)
	j	.L509
.L646:
	srli	a1,a3,31
	add	a1,a1,a3
	srai	a1,a1,1
	lw	s0,12(a4)
	sw	a4,0(sp)
	call	luaS_resize
	lw	a4,0(sp)
	lw	a2,12(a4)
	sub	a2,a2,s0
	j	.L547
.L638:
	mv	a0,a4
	sw	a4,0(sp)
	call	reallymarkobject
	lw	a4,0(sp)
	j	.L503
.L642:
	mv	a0,s1
	sw	a4,0(sp)
	call	reallymarkobject
	lw	a4,0(sp)
	j	.L511
.L641:
	mv	a1,s0
	mv	a0,s1
	sw	a4,0(sp)
	call	reallymarkobject
	lw	a4,0(sp)
	j	.L510
.L637:
	mv	a0,a4
	sw	a4,0(sp)
	call	reallymarkobject
	lw	a4,0(sp)
	j	.L502
.L518:
	sw	t1,0(a2)
	sw	a3,44(a3)
	j	.L519
.L651:
	li	a5,0
	j	.L550
.L648:
	li	a5,1
	sw	a5,96(s1)
	j	.L537
.L553:
	li	s0,0
	j	.L489
	.size	singlestep, .-singlestep
	.section	.text.luaC_barrier_,"ax",@progbits
	.align	2
	.globl	luaC_barrier_
	.hidden	luaC_barrier_
	.type	luaC_barrier_, @function
luaC_barrier_:
	lw	a0,16(a0)
	li	a4,1
	lbu	a3,49(a0)
	bleu	a3,a4,.L654
	lbu	a4,5(a1)
	lbu	a3,48(a0)
	andi	a4,a4,-8
	andi	a3,a3,3
	or	a4,a4,a3
	sb	a4,5(a1)
	ret
.L654:
	mv	a1,a2
	tail	reallymarkobject
	.size	luaC_barrier_, .-luaC_barrier_
	.section	.text.luaC_barrierback_,"ax",@progbits
	.align	2
	.globl	luaC_barrierback_
	.hidden	luaC_barrierback_
	.type	luaC_barrierback_, @function
luaC_barrierback_:
	lbu	a5,5(a1)
	lw	a4,16(a0)
	andi	a5,a5,-5
	sb	a5,5(a1)
	lw	a5,68(a4)
	sw	a5,28(a1)
	sw	a1,68(a4)
	ret
	.size	luaC_barrierback_, .-luaC_barrierback_
	.section	.text.luaC_upvalbarrier_,"ax",@progbits
	.align	2
	.globl	luaC_upvalbarrier_
	.hidden	luaC_upvalbarrier_
	.type	luaC_upvalbarrier_, @function
luaC_upvalbarrier_:
	lw	a0,16(a0)
	li	a5,1
	lbu	a4,49(a0)
	bleu	a4,a5,.L661
.L656:
	ret
.L661:
	lw	a5,0(a1)
	lw	a1,0(a5)
	lbu	a5,5(a1)
	andi	a5,a5,3
	beq	a5,zero,.L656
	tail	reallymarkobject
	.size	luaC_upvalbarrier_, .-luaC_upvalbarrier_
	.section	.text.luaC_fix,"ax",@progbits
	.align	2
	.globl	luaC_fix
	.hidden	luaC_fix
	.type	luaC_fix, @function
luaC_fix:
	lbu	a4,5(a1)
	lw	a5,16(a0)
	lw	a3,0(a1)
	andi	a4,a4,-4
	sb	a4,5(a1)
	lw	a4,88(a5)
	sw	a3,52(a5)
	sw	a4,0(a1)
	sw	a1,88(a5)
	ret
	.size	luaC_fix, .-luaC_fix
	.section	.text.luaC_newobj,"ax",@progbits
	.align	2
	.globl	luaC_newobj
	.hidden	luaC_newobj
	.type	luaC_newobj, @function
luaC_newobj:
	addi	sp,sp,-12
	sw	s1,0(sp)
	lw	s1,16(a0)
	sw	s0,4(sp)
	mv	a3,a2
	mv	s0,a1
	andi	a2,a1,15
	li	a1,0
	sw	ra,8(sp)
	call	luaM_realloc_
	lbu	a4,48(s1)
	sb	s0,4(a0)
	andi	a4,a4,3
	sb	a4,5(a0)
	lw	a4,52(s1)
	lw	ra,8(sp)
	lw	s0,4(sp)
	sw	a4,0(a0)
	sw	a0,52(s1)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
	.size	luaC_newobj, .-luaC_newobj
	.section	.text.luaC_upvdeccount,"ax",@progbits
	.align	2
	.globl	luaC_upvdeccount
	.hidden	luaC_upvdeccount
	.type	luaC_upvdeccount, @function
luaC_upvdeccount:
	lw	a4,4(a1)
	addi	a4,a4,-1
	sw	a4,4(a1)
	bne	a4,zero,.L665
	lw	a4,0(a1)
	addi	a5,a1,8
	beq	a4,a5,.L667
.L665:
	ret
.L667:
	li	a3,0
	li	a2,16
	tail	luaM_realloc_
	.size	luaC_upvdeccount, .-luaC_upvdeccount
	.section	.text.luaC_checkfinalizer,"ax",@progbits
	.align	2
	.globl	luaC_checkfinalizer
	.hidden	luaC_checkfinalizer
	.type	luaC_checkfinalizer, @function
luaC_checkfinalizer:
	addi	sp,sp,-20
	sw	s1,8(sp)
	sw	ra,16(sp)
	sw	s0,12(sp)
	lbu	a4,5(a1)
	sw	a0,0(sp)
	lw	s1,16(a0)
	andi	a4,a4,8
	bne	a4,zero,.L668
	mv	a0,a2
	beq	a2,zero,.L668
	lbu	a4,6(a2)
	andi	a4,a4,4
	beq	a4,zero,.L688
.L668:
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L688:
	lw	a2,132(s1)
	mv	s0,a1
	li	a1,2
	call	luaT_gettm
	beq	a0,zero,.L668
	lbu	a4,49(s1)
	li	a2,3
	addi	a4,a4,-2
	andi	a4,a4,0xff
	bgtu	a4,a2,.L673
	lbu	a4,5(s0)
	lbu	a2,48(s1)
	lw	a5,0(sp)
	andi	a4,a4,-8
	andi	a2,a2,3
	or	a4,a4,a2
	sb	a4,5(s0)
	lw	a4,56(s1)
	sw	a4,4(sp)
	beq	a4,s0,.L689
.L673:
	lw	a5,52(s1)
	beq	a5,s0,.L676
.L677:
	mv	a4,a5
	lw	a5,0(a5)
	bne	s0,a5,.L677
.L678:
	lw	a5,0(s0)
	sw	a5,0(a4)
	lw	a5,60(s1)
	sw	a5,0(s0)
	sw	s0,60(s1)
	lbu	a5,5(s0)
	ori	a5,a5,8
	sb	a5,5(s0)
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L689:
	mv	a1,a4
.L675:
	mv	a0,a5
	li	a2,1
	sw	a5,0(sp)
	call	sweeplist
	lw	a4,4(sp)
	lw	a5,0(sp)
	mv	a1,a0
	beq	a4,a0,.L675
	sw	a0,56(s1)
	j	.L673
.L676:
	addi	a4,s1,52
	j	.L678
	.size	luaC_checkfinalizer, .-luaC_checkfinalizer
	.section	.text.luaC_freeallobjects,"ax",@progbits
	.align	2
	.globl	luaC_freeallobjects
	.hidden	luaC_freeallobjects
	.type	luaC_freeallobjects, @function
luaC_freeallobjects:
	addi	sp,sp,-16
	sw	s1,4(sp)
	lw	s1,16(a0)
	sw	s0,8(sp)
	sw	ra,12(sp)
	lw	a5,84(s1)
	addi	a4,s1,60
	sw	a4,0(sp)
	mv	s0,a0
	beq	a5,zero,.L691
.L692:
	mv	a4,a5
	lw	a5,0(a5)
	bne	a5,zero,.L692
	lw	a5,60(s1)
	beq	a5,zero,.L697
.L696:
	lw	a2,0(a5)
	sw	a2,60(s1)
	lw	a2,0(a4)
	sw	a2,0(a5)
	sw	a5,0(a4)
	mv	a4,a5
	lw	a5,60(s1)
	bne	a5,zero,.L696
	lw	a5,84(s1)
	beq	a5,zero,.L695
.L697:
	li	a1,0
	mv	a0,s0
	call	GCTM
	lw	a5,84(s1)
	bne	a5,zero,.L697
.L695:
	lw	a1,0(sp)
	li	a5,3
	sb	a5,48(s1)
	li	a2,-1
	sb	zero,50(s1)
	mv	a0,s0
	call	sweeplist
	addi	a1,s1,52
	li	a2,-1
	mv	a0,s0
	call	sweeplist
	mv	a0,s0
	lw	s0,8(sp)
	lw	ra,12(sp)
	addi	a1,s1,88
	lw	s1,4(sp)
	li	a2,-1
	addi	sp,sp,16
	tail	sweeplist
.L691:
	lw	a5,60(s1)
	addi	a4,s1,84
	bne	a5,zero,.L696
	j	.L695
	.size	luaC_freeallobjects, .-luaC_freeallobjects
	.section	.text.luaC_runtilstate,"ax",@progbits
	.align	2
	.globl	luaC_runtilstate
	.hidden	luaC_runtilstate
	.type	luaC_runtilstate, @function
luaC_runtilstate:
	addi	sp,sp,-16
	sw	s1,4(sp)
	lw	s1,16(a0)
	sw	ra,12(sp)
	sw	s0,8(sp)
	lbu	a5,49(s1)
	sw	a1,0(sp)
	sra	a5,a1,a5
	andi	a5,a5,1
	bne	a5,zero,.L706
	mv	s0,a0
.L708:
	mv	a0,s0
	call	singlestep
	lbu	a5,49(s1)
	lw	a4,0(sp)
	sra	a5,a4,a5
	andi	a5,a5,1
	beq	a5,zero,.L708
.L706:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
	.size	luaC_runtilstate, .-luaC_runtilstate
	.globl	__divsi3
	.globl	__mulsi3
	.globl	__udivsi3
	.section	.text.luaC_step,"ax",@progbits
	.align	2
	.globl	luaC_step
	.hidden	luaC_step
	.type	luaC_step, @function
luaC_step:
	lw	a5,16(a0)
	addi	sp,sp,-24
	sw	s0,16(sp)
	lw	a3,104(a5)
	mv	s0,a0
	lw	a0,12(a5)
	sw	s1,12(sp)
	sw	ra,20(sp)
	sw	a5,0(sp)
	sw	a3,4(sp)
	li	s1,0
	ble	a0,zero,.L713
	li	a1,200
	call	__divsi3
	lw	a3,4(sp)
	mv	a4,a0
	li	s1,-2147483648
	addi	a4,a4,1
	xori	a0,s1,-1
	mv	a1,a3
	sw	a4,4(sp)
	sw	a3,8(sp)
	call	__divsi3
	lw	a4,4(sp)
	not	s1,s1
	blt	a4,a0,.L738
.L713:
	lw	a5,0(sp)
	lbu	a4,51(a5)
	bne	a4,zero,.L714
	j	.L739
.L740:
	lw	a5,0(sp)
	lbu	a3,49(a5)
	beq	a3,a4,.L716
.L714:
	mv	a0,s0
	call	singlestep
	sub	s1,s1,a0
	li	a5,-1599
	li	a4,7
	bge	s1,a5,.L740
	lw	a5,0(sp)
	li	a4,7
	lbu	a3,49(a5)
	beq	a3,a4,.L716
	lw	a5,0(sp)
	mv	a0,s1
	lw	a1,104(a5)
	li	a5,0
	sw	a5,4(sp)
	call	__divsi3
	slli	a1,a0,1
	add	a1,a1,a0
	slli	a1,a1,3
	add	a1,a1,a0
	lw	a0,0(sp)
	slli	a1,a1,3
	call	luaE_setdebt
	lw	s1,16(s0)
	lw	a5,4(sp)
	lw	a4,84(s1)
	bne	a4,zero,.L719
.L720:
	lw	ra,20(sp)
	lw	s0,16(sp)
	li	a4,0
	sw	a4,96(s1)
	lw	s1,12(sp)
	addi	sp,sp,24
	jr	ra
.L721:
	sw	a5,0(sp)
	call	GCTM
	lw	a5,0(sp)
	lw	a4,84(s1)
	addi	a5,a5,1
	beq	a4,zero,.L720
.L719:
	lw	a4,96(s1)
	li	a1,1
	mv	a0,s0
	bgtu	a4,a5,.L721
	lw	ra,20(sp)
	lw	s0,16(sp)
	slli	a4,a4,1
	sw	a4,96(s1)
	lw	s1,12(sp)
	addi	sp,sp,24
	jr	ra
.L738:
	lw	a3,8(sp)
	mv	a1,a4
	mv	a0,a3
	call	__mulsi3
	lw	a5,0(sp)
	mv	s1,a0
	lbu	a4,51(a5)
	bne	a4,zero,.L714
.L739:
	lw	s0,16(sp)
	lw	ra,20(sp)
	lw	s1,12(sp)
	li	a1,-16384
	addi	a1,a1,384
	mv	a0,a5
	addi	sp,sp,24
	tail	luaE_setdebt
.L716:
	lw	a5,0(sp)
	li	a1,100
	li	s0,-2147483648
	lw	a0,20(a5)
	call	__udivsi3
	lw	a5,0(sp)
	mv	a1,a0
	mv	s1,a0
	lw	a4,100(a5)
	xori	a0,s0,-1
	not	s0,s0
	sw	a4,4(sp)
	call	__divsi3
	lw	a4,4(sp)
	blt	a4,a0,.L741
.L718:
	lw	a0,0(sp)
	lw	ra,20(sp)
	lw	s1,12(sp)
	lw	a1,8(a0)
	lw	a5,12(a0)
	add	a1,a1,a5
	sub	a1,a1,s0
	lw	s0,16(sp)
	addi	sp,sp,24
	tail	luaE_setdebt
.L741:
	mv	a1,a4
	mv	a0,s1
	call	__mulsi3
	mv	s0,a0
	j	.L718
	.size	luaC_step, .-luaC_step
	.section	.text.luaC_fullgc,"ax",@progbits
	.align	2
	.globl	luaC_fullgc
	.hidden	luaC_fullgc
	.type	luaC_fullgc, @function
luaC_fullgc:
	lw	a4,16(a0)
	addi	sp,sp,-20
	sw	s0,12(sp)
	sw	ra,16(sp)
	sw	s1,8(sp)
	sw	a4,0(sp)
	mv	s0,a0
	beq	a1,zero,.L743
	li	a5,1
	sb	a5,50(a4)
.L743:
	lw	s1,0(sp)
	li	a4,1
	lbu	a5,49(s1)
	bleu	a5,a4,.L765
.L744:
	li	a4,7
	beq	a5,a4,.L748
.L746:
	mv	a0,s0
	call	singlestep
	lbu	a5,49(s1)
	li	a4,7
	bne	a5,a4,.L746
	lw	s1,16(s0)
	li	a5,-129
	lbu	a4,49(s1)
	sra	a5,a5,a4
	andi	a5,a5,1
	bne	a5,zero,.L747
.L748:
	mv	a0,s0
	call	singlestep
	lbu	a5,49(s1)
	li	a4,-129
	sra	a5,a4,a5
	andi	a5,a5,1
	beq	a5,zero,.L748
	lw	s1,16(s0)
	lbu	a4,49(s1)
.L747:
	li	a5,6
	beq	a4,a5,.L753
.L750:
	mv	a0,s0
	call	singlestep
	lbu	a5,49(s1)
	li	a4,6
	bne	a5,a4,.L750
	lw	s1,16(s0)
	li	a5,7
	lbu	a4,49(s1)
	beq	a4,a5,.L754
.L753:
	mv	a0,s0
	call	singlestep
	lbu	a5,49(s1)
	li	a4,7
	bne	a5,a4,.L753
.L754:
	lw	a5,0(sp)
	li	a1,100
	li	s0,-2147483648
	lw	a0,20(a5)
	sb	zero,50(a5)
	call	__udivsi3
	lw	a5,0(sp)
	mv	a1,a0
	mv	s1,a0
	lw	a5,100(a5)
	xori	a0,s0,-1
	not	s0,s0
	sw	a5,4(sp)
	call	__divsi3
	lw	a5,4(sp)
	bge	a5,a0,.L752
	mv	a1,a5
	mv	a0,s1
	call	__mulsi3
	mv	s0,a0
.L752:
	lw	a0,0(sp)
	lw	ra,16(sp)
	lw	s1,8(sp)
	lw	a1,8(a0)
	lw	a5,12(a0)
	add	a1,a1,a5
	sub	a1,a1,s0
	lw	s0,12(sp)
	addi	sp,sp,20
	tail	luaE_setdebt
.L765:
	li	a5,2
	sb	a5,49(s1)
	addi	a1,s1,52
	li	a2,1
	mv	a0,s0
	call	sweeplist
	lw	a4,0(sp)
	lw	s1,16(s0)
	sw	a0,56(a4)
	lbu	a5,49(s1)
	j	.L744
	.size	luaC_fullgc, .-luaC_fullgc
	.hidden	luaE_setdebt
	.hidden	luaS_resize
	.hidden	luaS_clearcache
	.hidden	luaT_gettm
	.hidden	luaD_shrinkstack
	.hidden	luaS_remove
	.hidden	luaH_free
	.hidden	luaE_freethread
	.hidden	luaF_freeproto
	.hidden	luaM_realloc_
	.hidden	luaD_callnoyield
	.hidden	luaO_pushfstring
	.hidden	luaD_throw
	.hidden	luaD_pcall
	.hidden	luaT_gettmbyobj
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
