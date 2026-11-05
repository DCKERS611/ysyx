#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"lvm.c"
	.option nopic
	.text
	.section	.text.l_strcmp,"ax",@progbits
	.align	2
	.type	l_strcmp, @function
l_strcmp:
	addi	sp,sp,-20
	sw	s1,8(sp)
	sw	ra,16(sp)
	sw	s0,12(sp)
	lbu	a3,4(a0)
	li	a5,4
	addi	s1,a0,16
	beq	a3,a5,.L12
	lw	a5,12(a0)
	lbu	a3,4(a1)
	addi	s0,a1,16
	sw	a5,4(sp)
	li	a5,4
	beq	a3,a5,.L13
.L4:
	lw	a5,12(a1)
	sw	a5,0(sp)
	j	.L5
.L15:
	call	strlen
	lw	a4,0(sp)
	addi	a5,a0,1
	beq	a4,a0,.L14
	lw	a4,4(sp)
	beq	a4,a0,.L9
	sub	a4,a4,a5
	sw	a4,4(sp)
	lw	a4,0(sp)
	add	s1,s1,a5
	add	s0,s0,a5
	sub	a5,a4,a5
	sw	a5,0(sp)
.L5:
	mv	a1,s0
	mv	a0,s1
	call	strcoll
	mv	a5,a0
	mv	a0,s1
	beq	a5,zero,.L15
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	mv	a0,a5
	addi	sp,sp,20
	jr	ra
.L12:
	lbu	a5,7(a0)
	lbu	a3,4(a1)
	addi	s0,a1,16
	sw	a5,4(sp)
	li	a5,4
	bne	a3,a5,.L4
.L13:
	lbu	a5,7(a1)
	sw	a5,0(sp)
	j	.L5
.L14:
	lw	a5,4(sp)
	lw	ra,16(sp)
	lw	s0,12(sp)
	sub	a5,a5,a4
	snez	a5,a5
	lw	s1,8(sp)
	mv	a0,a5
	addi	sp,sp,20
	jr	ra
.L9:
	lw	ra,16(sp)
	lw	s0,12(sp)
	li	a5,-1
	lw	s1,8(sp)
	mv	a0,a5
	addi	sp,sp,20
	jr	ra
	.size	l_strcmp, .-l_strcmp
	.section	.text.luaV_tonumber_,"ax",@progbits
	.align	2
	.globl	luaV_tonumber_
	.hidden	luaV_tonumber_
	.type	luaV_tonumber_, @function
luaV_tonumber_:
	lw	a5,4(a0)
	addi	sp,sp,-24
	sw	s0,16(sp)
	sw	ra,20(sp)
	sw	s1,12(sp)
	li	a4,19
	mv	s0,a0
	beq	a5,a4,.L24
	andi	s1,a5,15
	li	a5,4
	beq	s1,a5,.L19
.L22:
	li	a0,0
.L16:
	lw	ra,20(sp)
	lw	s0,16(sp)
	lw	s1,12(sp)
	addi	sp,sp,24
	jr	ra
.L19:
	lw	a0,0(a0)
	sw	a1,0(sp)
	addi	a1,sp,4
	addi	a0,a0,16
	call	luaO_str2num
	lw	a5,0(s0)
	lw	a3,0(sp)
	lbu	a4,4(a5)
	beq	a4,s1,.L25
	lw	a5,12(a5)
	addi	a5,a5,1
.L21:
	bne	a0,a5,.L22
	lw	a5,4(sp)
	li	a0,1
	sw	a5,0(a3)
	j	.L16
.L24:
	lw	a5,0(a0)
	lw	ra,20(sp)
	lw	s0,16(sp)
	sw	a5,0(a1)
	lw	s1,12(sp)
	li	a0,1
	addi	sp,sp,24
	jr	ra
.L25:
	lbu	a5,7(a5)
	addi	a5,a5,1
	j	.L21
	.size	luaV_tonumber_, .-luaV_tonumber_
	.section	.text.luaV_tointeger,"ax",@progbits
	.align	2
	.globl	luaV_tointeger
	.hidden	luaV_tointeger
	.type	luaV_tointeger, @function
luaV_tointeger:
	addi	sp,sp,-28
	sw	s0,20(sp)
	sw	ra,24(sp)
	sw	s1,16(sp)
	mv	s0,a0
	sw	a1,0(sp)
	sw	a2,4(sp)
	j	.L27
.L33:
	lw	a4,12(a5)
	addi	s0,sp,8
	addi	a4,a4,1
	bne	a0,a4,.L30
.L27:
	lw	a4,4(s0)
	li	a2,3
	addi	a1,sp,8
	li	a0,19
	andi	s1,a4,15
	li	t1,4
	beq	a4,a2,.L40
	beq	a4,a0,.L41
	bne	s1,t1,.L30
	lw	a0,0(s0)
	addi	a0,a0,16
	call	luaO_str2num
	lw	a5,0(s0)
	lbu	a4,4(a5)
	bne	a4,s1,.L33
	lbu	a4,7(a5)
	addi	s0,sp,8
	addi	a4,a4,1
	beq	a0,a4,.L27
.L30:
	lw	ra,24(sp)
	lw	s0,20(sp)
	lw	s1,16(sp)
	li	a0,0
	addi	sp,sp,28
	jr	ra
.L40:
	lw	s0,0(s0)
	mv	a0,s0
	call	floor
	beq	s0,a0,.L29
	lw	a4,4(sp)
	beq	a4,zero,.L30
	li	a5,1
	sgt	s0,a4,a5
	add	a0,a0,s0
.L29:
	lw	a5,0(sp)
	lw	ra,24(sp)
	lw	s0,20(sp)
	sw	a0,0(a5)
	lw	s1,16(sp)
	li	a0,1
	addi	sp,sp,28
	jr	ra
.L41:
	lw	a5,0(s0)
	lw	a4,0(sp)
	lw	ra,24(sp)
	lw	s0,20(sp)
	sw	a5,0(a4)
	lw	s1,16(sp)
	li	a0,1
	addi	sp,sp,28
	jr	ra
	.size	luaV_tointeger, .-luaV_tointeger
	.section	.rodata.luaV_finishget.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"index"
	.align	2
.LC1:
	.string	"'__index' chain too long; possible loop"
	.section	.text.luaV_finishget,"ax",@progbits
	.align	2
	.globl	luaV_finishget
	.hidden	luaV_finishget
	.type	luaV_finishget, @function
luaV_finishget:
	addi	sp,sp,-28
	sw	s0,20(sp)
	sw	s1,16(sp)
	sw	a0,0(sp)
	sw	ra,24(sp)
	sw	a2,8(sp)
	sw	a3,12(sp)
	mv	a0,a4
	mv	s1,a1
	li	s0,0
	beq	a0,zero,.L62
.L43:
	lw	a5,0(s1)
	lw	a0,24(a5)
	beq	a0,zero,.L45
	lbu	a5,6(a0)
	andi	a5,a5,1
	bne	a5,zero,.L45
	lw	a5,0(sp)
	li	a1,0
	lw	a5,16(a5)
	lw	a2,124(a5)
	call	luaT_gettm
	mv	t1,a0
	beq	a0,zero,.L45
	lw	a5,4(a0)
	li	a3,6
	andi	a4,a5,15
	beq	a4,a3,.L63
.L47:
	li	a4,69
	beq	a5,a4,.L64
	addi	s0,s0,1
	li	a5,2000
	beq	s0,a5,.L52
.L50:
	lw	a0,0(sp)
	mv	a1,t1
	li	a2,0
	sw	t1,4(sp)
	call	luaT_gettmbyobj
	lw	a5,4(a0)
	lw	t1,4(sp)
	beq	a5,zero,.L65
	andi	a4,a5,15
	li	a3,6
	mv	s1,t1
	mv	t1,a0
	bne	a4,a3,.L47
.L63:
	lw	s0,20(sp)
	lw	a4,12(sp)
	lw	a3,8(sp)
	lw	a0,0(sp)
	lw	ra,24(sp)
	mv	a2,s1
	lw	s1,16(sp)
	li	a5,1
	mv	a1,t1
	addi	sp,sp,28
	tail	luaT_callTM
.L64:
	lw	a0,0(t1)
	lw	a1,8(sp)
	sw	t1,4(sp)
	call	luaH_get
	lw	a5,4(a0)
	lw	t1,4(sp)
	bne	a5,zero,.L66
	addi	s0,s0,1
	li	a5,2000
	beq	s0,a5,.L52
	mv	s1,t1
	bne	a0,zero,.L43
.L62:
	mv	t1,s1
	j	.L50
.L45:
	lw	a5,12(sp)
	sw	zero,4(a5)
.L42:
	lw	ra,24(sp)
	lw	s0,20(sp)
	lw	s1,16(sp)
	addi	sp,sp,28
	jr	ra
.L52:
	lw	a0,0(sp)
	lla	a1,.LC1
	call	luaG_runerror
.L66:
	lw	a5,0(a0)
	lw	a4,12(sp)
	sw	a5,0(a4)
	lw	a5,4(a0)
	sw	a5,4(a4)
	j	.L42
.L65:
	lw	a0,0(sp)
	lla	a2,.LC0
	mv	a1,t1
	call	luaG_typeerror
	.size	luaV_finishget, .-luaV_finishget
	.section	.rodata.luaV_finishset.str1.4,"aMS",@progbits,1
	.align	2
.LC2:
	.string	"'__newindex' chain too long; possible loop"
	.section	.text.luaV_finishset,"ax",@progbits
	.align	2
	.globl	luaV_finishset
	.hidden	luaV_finishset
	.type	luaV_finishset, @function
luaV_finishset:
	addi	sp,sp,-32
	sw	a4,8(sp)
	lw	a5,8(sp)
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	ra,28(sp)
	sw	a1,4(sp)
	sw	a2,16(sp)
	sw	a3,12(sp)
	mv	s1,a0
	li	s0,0
	beq	a5,zero,.L82
.L112:
	lw	a5,4(sp)
	lw	a4,0(a5)
	lw	a0,24(a4)
	beq	a0,zero,.L72
	lbu	a5,6(a0)
	andi	a5,a5,2
	bne	a5,zero,.L72
	lw	a5,16(s1)
	li	a1,1
	sw	a4,0(sp)
	lw	a2,128(a5)
	call	luaT_gettm
	lw	a4,0(sp)
	mv	t1,a0
	beq	a0,zero,.L72
	lw	a5,4(a0)
	li	a4,6
	andi	a3,a5,15
	beq	a3,a4,.L108
.L76:
	li	a3,69
	beq	a5,a3,.L77
	addi	s0,s0,1
	li	a5,2000
	beq	s0,a5,.L78
.L68:
	mv	a1,t1
	li	a2,1
	mv	a0,s1
	sw	t1,0(sp)
	call	luaT_gettmbyobj
	lw	a5,4(a0)
	lw	t1,0(sp)
	beq	a5,zero,.L109
	sw	t1,4(sp)
	andi	a3,a5,15
	li	a4,6
	mv	t1,a0
	bne	a3,a4,.L76
.L108:
	lw	s0,24(sp)
	lw	a4,12(sp)
	lw	a3,16(sp)
	lw	a2,4(sp)
	lw	ra,28(sp)
	mv	a0,s1
	lw	s1,20(sp)
	li	a5,0
	mv	a1,t1
	addi	sp,sp,32
	tail	luaT_callTM
.L77:
	lw	a0,0(t1)
	lw	a1,16(sp)
	sw	t1,0(sp)
	call	luaH_get
	lw	a5,4(a0)
	sw	a0,8(sp)
	lw	t1,0(sp)
	beq	a5,zero,.L110
	lw	a4,12(sp)
	lw	a5,4(a4)
	andi	a5,a5,64
	beq	a5,zero,.L81
	lw	a1,0(t1)
	lbu	a5,5(a1)
	andi	a5,a5,4
	beq	a5,zero,.L81
	lw	a5,0(a4)
	lbu	a5,5(a5)
	andi	a5,a5,3
	bne	a5,zero,.L111
.L81:
	lw	a4,12(sp)
	lw	a3,8(sp)
	lw	a5,0(a4)
	sw	a5,0(a3)
	lw	a5,4(a4)
	sw	a5,4(a3)
.L67:
	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	s1,20(sp)
	addi	sp,sp,32
	jr	ra
.L110:
	addi	s0,s0,1
	li	a5,2000
	beq	s0,a5,.L78
	lw	a5,8(sp)
	sw	t1,4(sp)
	bne	a5,zero,.L112
.L82:
	lw	t1,4(sp)
	j	.L68
.L72:
	lw	a3,8(sp)
	lla	a5,luaO_nilobject_
	beq	a3,a5,.L113
.L71:
	lw	a3,12(sp)
	lw	a2,8(sp)
	lw	a5,0(a3)
	sw	a5,0(a2)
	lw	a5,4(a3)
	sw	a5,4(a2)
	sb	zero,6(a4)
	lw	a5,4(a3)
	andi	a5,a5,64
	beq	a5,zero,.L67
	lbu	a5,5(a4)
	andi	a5,a5,4
	beq	a5,zero,.L67
	lw	a5,0(a3)
	lbu	a5,5(a5)
	andi	a5,a5,3
	beq	a5,zero,.L67
	lw	s0,24(sp)
	lw	ra,28(sp)
	mv	a0,s1
	lw	s1,20(sp)
	mv	a1,a4
	addi	sp,sp,32
	tail	luaC_barrierback_
.L111:
	mv	a0,s1
	call	luaC_barrierback_
	j	.L81
.L113:
	lw	a2,16(sp)
	mv	a1,a4
	mv	a0,s1
	sw	a4,0(sp)
	call	luaH_newkey
	lw	a4,0(sp)
	sw	a0,8(sp)
	j	.L71
.L78:
	lla	a1,.LC2
	mv	a0,s1
	call	luaG_runerror
.L109:
	lla	a2,.LC0
	mv	a1,t1
	mv	a0,s1
	call	luaG_typeerror
	.size	luaV_finishset, .-luaV_finishset
	.section	.text.luaV_lessthan,"ax",@progbits
	.align	2
	.globl	luaV_lessthan
	.hidden	luaV_lessthan
	.type	luaV_lessthan, @function
luaV_lessthan:
	lw	a5,4(a1)
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	andi	a5,a5,15
	li	a4,3
	mv	s0,a1
	mv	s1,a0
	beq	a5,a4,.L119
	li	a4,4
	bne	a5,a4,.L116
	lw	a4,4(a2)
	andi	a4,a4,15
	beq	a4,a5,.L120
.L116:
	li	a3,20
	mv	a1,s0
	mv	a0,s1
	sw	a2,0(sp)
	call	luaT_callorderTM
	lw	a2,0(sp)
	blt	a0,zero,.L121
.L114:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L119:
	lw	a4,4(a2)
	andi	a4,a4,15
	bne	a4,a5,.L116
	lw	a0,0(a1)
	lw	a5,0(a2)
	slt	a0,a0,a5
	j	.L114
.L120:
	lw	a1,0(a2)
	lw	a0,0(s0)
	call	l_strcmp
	srli	a0,a0,31
	j	.L114
.L121:
	mv	a1,s0
	mv	a0,s1
	call	luaG_ordererror
	.size	luaV_lessthan, .-luaV_lessthan
	.section	.text.luaV_lessequal,"ax",@progbits
	.align	2
	.globl	luaV_lessequal
	.hidden	luaV_lessequal
	.type	luaV_lessequal, @function
luaV_lessequal:
	lw	a5,4(a1)
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	andi	a5,a5,15
	li	a3,3
	mv	s0,a1
	mv	a4,a0
	mv	s1,a2
	beq	a5,a3,.L128
	li	a3,4
	bne	a5,a3,.L124
	lw	a3,4(a2)
	andi	a3,a3,15
	beq	a3,a5,.L129
.L124:
	mv	a0,a4
	li	a3,21
	mv	a2,s1
	mv	a1,s0
	sw	a4,0(sp)
	call	luaT_callorderTM
	lw	a4,0(sp)
	blt	a0,zero,.L130
.L122:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L130:
	lw	t1,20(a4)
	li	a3,20
	mv	a2,s0
	lhu	a5,34(t1)
	mv	a0,a4
	mv	a1,s1
	ori	a5,a5,128
	sh	a5,34(t1)
	call	luaT_callorderTM
	lw	a4,0(sp)
	mv	a5,a0
	seqz	a0,a0
	lw	a2,20(a4)
	lhu	a3,34(a2)
	xori	a3,a3,128
	sh	a3,34(a2)
	bge	a5,zero,.L122
	mv	a2,s1
	mv	a1,s0
	mv	a0,a4
	call	luaG_ordererror
.L128:
	lw	a3,4(a2)
	andi	a3,a3,15
	bne	a3,a5,.L124
	lw	a0,0(a1)
	lw	a5,0(a2)
	sgt	a0,a0,a5
	xori	a0,a0,1
	j	.L122
.L129:
	lw	a1,0(a2)
	lw	a0,0(s0)
	call	l_strcmp
	slti	a0,a0,1
	j	.L122
	.size	luaV_lessequal, .-luaV_lessequal
	.section	.text.luaV_equalobj,"ax",@progbits
	.align	2
	.globl	luaV_equalobj
	.hidden	luaV_equalobj
	.type	luaV_equalobj, @function
luaV_equalobj:
	lw	a3,4(a2)
	lw	a5,4(a1)
	addi	sp,sp,-24
	sw	s1,12(sp)
	xor	a4,a5,a3
	mv	s1,a2
	sw	ra,20(sp)
	sw	s0,16(sp)
	andi	a2,a4,63
	mv	t1,a1
	beq	a2,zero,.L132
	andi	s0,a4,15
	bne	s0,zero,.L133
	andi	a4,a5,15
	li	a2,3
	beq	a4,a2,.L190
.L133:
	li	s0,0
.L131:
	lw	ra,20(sp)
	mv	a0,s0
	lw	s0,16(sp)
	lw	s1,12(sp)
	addi	sp,sp,24
	jr	ra
.L132:
	andi	a5,a5,63
	li	a4,22
	bgtu	a5,a4,.L142
	lla	a4,.L144
	slli	a5,a5,2
	add	a5,a5,a4
	lw	a5,0(a5)
	mv	s0,a0
	add	a5,a5,a4
	jr	a5
	.section	.rodata.luaV_equalobj,"a",@progbits
	.align	2
	.align	2
.L144:
	.word	.L158-.L144
	.word	.L142-.L144
	.word	.L142-.L144
	.word	.L142-.L144
	.word	.L142-.L144
	.word	.L148-.L144
	.word	.L142-.L144
	.word	.L147-.L144
	.word	.L142-.L144
	.word	.L142-.L144
	.word	.L142-.L144
	.word	.L142-.L144
	.word	.L142-.L144
	.word	.L142-.L144
	.word	.L142-.L144
	.word	.L142-.L144
	.word	.L142-.L144
	.word	.L142-.L144
	.word	.L142-.L144
	.word	.L142-.L144
	.word	.L145-.L144
	.word	.L142-.L144
	.word	.L142-.L144
	.section	.text.luaV_equalobj
.L142:
	lw	a5,0(s1)
	lw	s0,0(t1)
	lw	ra,20(sp)
	lw	s1,12(sp)
	sub	s0,s0,a5
	seqz	s0,s0
	mv	a0,s0
	lw	s0,16(sp)
	addi	sp,sp,24
	jr	ra
.L190:
	li	a4,19
	bne	a5,a4,.L134
	lw	a5,0(a1)
	sw	a5,4(sp)
.L135:
	li	a5,19
	bne	a3,a5,.L138
	lw	a5,0(s1)
.L139:
	lw	s0,4(sp)
	sub	s0,s0,a5
	seqz	s0,s0
	j	.L131
.L148:
	lw	a5,0(a1)
	lw	a4,0(s1)
	beq	a5,a4,.L158
	beq	a0,zero,.L133
	lw	a0,24(a5)
	beq	a0,zero,.L157
	lbu	a5,6(a0)
	andi	a5,a5,32
	beq	a5,zero,.L191
.L157:
	lw	a0,24(a4)
	sw	t1,0(sp)
	beq	a0,zero,.L133
.L189:
	lbu	a5,6(a0)
	andi	a5,a5,32
	bne	a5,zero,.L133
	lw	a5,16(s0)
	li	a1,5
	lw	a2,144(a5)
	call	luaT_gettm
	lw	t1,0(sp)
	mv	a1,a0
	beq	a0,zero,.L133
.L154:
	lw	a4,12(s0)
	li	a5,1
	mv	a3,s1
	mv	a2,t1
	mv	a0,s0
	call	luaT_callTM
	lw	a4,12(s0)
	lw	a5,4(a4)
	beq	a5,zero,.L133
	li	a3,1
	bne	a5,a3,.L158
	lw	a5,0(a4)
	beq	a5,zero,.L133
.L158:
	li	s0,1
	j	.L131
.L134:
	li	a2,0
	addi	a1,sp,4
	mv	a0,t1
	call	luaV_tointeger
	beq	a0,zero,.L131
	lw	a3,4(s1)
	j	.L135
.L138:
	li	a2,0
	addi	a1,sp,8
	mv	a0,s1
	call	luaV_tointeger
	beq	a0,zero,.L131
	lw	a5,8(sp)
	j	.L139
.L145:
	lw	s0,16(sp)
	lw	a1,0(s1)
	lw	ra,20(sp)
	lw	s1,12(sp)
	lw	a0,0(t1)
	addi	sp,sp,24
	tail	luaS_eqlngstr
.L147:
	lw	a5,0(a1)
	lw	a4,0(s1)
	beq	a5,a4,.L158
	beq	a0,zero,.L133
	lw	a0,8(a5)
	beq	a0,zero,.L153
	lbu	a5,6(a0)
	andi	a5,a5,32
	beq	a5,zero,.L192
.L153:
	lw	a0,8(a4)
	sw	t1,0(sp)
	bne	a0,zero,.L189
	j	.L133
.L191:
	lw	a5,16(s0)
	sw	a1,0(sp)
	li	a1,5
	lw	a2,144(a5)
	call	luaT_gettm
	lw	t1,0(sp)
	mv	a1,a0
	bne	a0,zero,.L154
	lw	a4,0(s1)
	j	.L157
.L192:
	lw	a5,16(s0)
	sw	a1,0(sp)
	li	a1,5
	lw	a2,144(a5)
	call	luaT_gettm
	lw	t1,0(sp)
	mv	a1,a0
	bne	a0,zero,.L154
	lw	a4,0(s1)
	j	.L153
	.size	luaV_equalobj, .-luaV_equalobj
	.section	.rodata.luaV_concat.str1.4,"aMS",@progbits,1
	.align	2
.LC3:
	.string	"string length overflow"
	.section	.text.luaV_concat,"ax",@progbits
	.align	2
	.globl	luaV_concat
	.hidden	luaV_concat
	.type	luaV_concat, @function
luaV_concat:
	lw	t1,12(a0)
	addi	sp,sp,-84
	sw	s0,76(sp)
	sw	s1,72(sp)
	sw	ra,80(sp)
	mv	s1,a0
	sw	a1,0(sp)
	mv	s0,t1
	j	.L217
.L228:
	li	a4,3
	beq	a5,a4,.L226
.L194:
	addi	a3,s0,-16
	li	a4,22
	addi	a2,s0,-8
	mv	a1,a3
	mv	a0,s1
	call	luaT_trybinTM
	lw	a5,0(sp)
	addi	a5,a5,-1
	sw	a5,0(sp)
	li	a5,-8
	sw	a5,4(sp)
.L196:
	lw	t1,12(s1)
	lw	a4,4(sp)
	li	a5,1
	add	s0,t1,a4
	lw	a4,0(sp)
	sw	s0,12(s1)
	ble	a4,a5,.L227
.L217:
	lw	a4,-12(s0)
	li	a3,1
	andi	a5,a4,15
	addi	a5,a5,-3
	bgtu	a5,a3,.L194
	lw	a3,-4(s0)
	li	a2,4
	andi	a5,a3,15
	bne	a5,a2,.L228
.L195:
	li	a5,68
	beq	a3,a5,.L229
.L197:
	li	a5,68
	bne	a4,a5,.L198
	lw	a5,-16(s0)
	lbu	a5,7(a5)
	bne	a5,zero,.L198
	lw	a5,-4(s0)
	lw	a4,-8(s0)
	lw	a3,0(sp)
	sw	a5,-12(s0)
	li	a5,-8
	sw	a5,4(sp)
	sw	a4,-16(s0)
	lw	t1,12(s1)
	lw	a4,4(sp)
	addi	a3,a3,-1
	sw	a3,0(sp)
	add	s0,t1,a4
	lw	a4,0(sp)
	li	a5,1
	sw	s0,12(s1)
	bgt	a4,a5,.L217
.L227:
	lw	ra,80(sp)
	lw	s0,76(sp)
	lw	s1,72(sp)
	addi	sp,sp,84
	jr	ra
.L198:
	lw	a5,-8(s0)
	li	a4,4
	lbu	a3,4(a5)
	beq	a3,a4,.L230
	lw	a4,12(a5)
.L202:
	lw	a0,0(sp)
	li	a5,1
	addi	a1,s0,-16
	li	a3,1
	li	a2,4
	ble	a0,a5,.L231
	sw	s0,12(sp)
	mv	a0,s1
	mv	s0,a3
	mv	s1,a4
	j	.L206
.L203:
	lw	t1,12(a5)
.L204:
	li	a5,-2147483648
	xori	a5,a5,-1
	sub	a5,a5,s1
	bleu	a5,t1,.L232
	lw	a4,0(sp)
	addi	a5,s0,1
	add	s1,s1,t1
	addi	a1,a1,-8
	beq	a4,a5,.L233
	mv	s0,a5
.L206:
	lw	a5,4(a1)
	andi	a5,a5,15
	beq	a5,a2,.L207
	li	t1,3
	bne	a5,t1,.L234
	sw	a1,8(sp)
	sw	a0,4(sp)
	call	luaO_tostring
	lw	a0,4(sp)
	lw	a1,8(sp)
	li	a2,4
.L207:
	lw	a5,0(a1)
	lbu	t1,4(a5)
	bne	t1,a2,.L203
	lbu	t1,7(a5)
	j	.L204
.L229:
	lw	a5,-8(s0)
	lbu	a5,7(a5)
	bne	a5,zero,.L197
	lw	a3,0(sp)
	andi	a4,a4,15
	li	a5,3
	addi	a3,a3,-1
	sw	a3,0(sp)
	li	a3,-8
	sw	a3,4(sp)
	bne	a4,a5,.L196
	addi	a1,s0,-16
	mv	a0,s1
	call	luaO_tostring
	j	.L196
.L226:
	addi	a1,s0,-8
	mv	a0,s1
	call	luaO_tostring
	lw	a3,-4(s0)
	lw	a4,-12(s0)
	j	.L195
.L233:
	mv	a4,s1
	mv	s1,a0
	lw	a0,0(sp)
	mv	a3,s0
	neg	a2,a3
	slli	a1,a0,3
	sub	a3,a0,a3
	lw	s0,12(sp)
	neg	a1,a1
	sw	a3,0(sp)
	slli	a3,a2,3
	sw	a1,20(sp)
	sw	a3,4(sp)
.L201:
	li	a3,40
	bgtu	a4,a3,.L209
	slli	a3,a5,3
	li	t0,0
	sub	a3,s0,a3
	sw	s0,16(sp)
	sw	s1,28(sp)
	sw	a4,24(sp)
	mv	s0,a5
	mv	s1,t0
	j	.L212
.L210:
	lw	a2,12(a1)
.L211:
	addi	a5,s1,32
	add	a0,a5,sp
	addi	a1,a1,16
	sw	a3,12(sp)
	sw	a2,8(sp)
	call	memcpy
	lw	a2,8(sp)
	lw	a3,12(sp)
	addi	s0,s0,-1
	add	s1,s1,a2
	addi	a3,a3,8
	beq	s0,zero,.L235
.L212:
	lw	a1,0(a3)
	li	a5,4
	lbu	a4,4(a1)
	bne	a4,a5,.L210
	lbu	a2,7(a1)
	j	.L211
.L209:
	mv	a1,a4
	mv	a0,s1
	sw	a5,8(sp)
	call	luaS_createlngstrobj
	lw	a5,8(sp)
	li	a3,0
	sw	s0,24(sp)
	slli	a4,a5,3
	sub	a4,s0,a4
	sw	s1,28(sp)
	sw	a0,16(sp)
	mv	s0,a3
	mv	s1,a5
	j	.L216
.L214:
	lw	a2,12(a1)
.L215:
	lw	a5,16(sp)
	addi	a0,s0,16
	addi	a1,a1,16
	add	a0,a5,a0
	sw	a4,12(sp)
	sw	a2,8(sp)
	call	memcpy
	lw	a2,8(sp)
	lw	a4,12(sp)
	addi	s1,s1,-1
	add	s0,s0,a2
	addi	a4,a4,8
	beq	s1,zero,.L236
.L216:
	lw	a1,0(a4)
	li	a5,4
	lbu	a2,4(a1)
	bne	a2,a5,.L214
	lbu	a2,7(a1)
	j	.L215
.L236:
	lw	s0,24(sp)
	lw	s1,28(sp)
.L213:
	lw	a5,20(sp)
	lw	a4,16(sp)
	add	a5,s0,a5
	sw	a4,0(a5)
	lbu	a4,4(a4)
	ori	a4,a4,64
	sw	a4,4(a5)
	j	.L196
.L235:
	lw	a4,24(sp)
	lw	s1,28(sp)
	addi	a1,sp,32
	mv	a2,a4
	mv	a0,s1
	lw	s0,16(sp)
	call	luaS_newlstr
	sw	a0,16(sp)
	j	.L213
.L234:
	mv	a3,s0
	slli	a1,a3,3
	neg	a1,a1
	sw	a1,20(sp)
	lw	a1,0(sp)
	li	a5,1
	addi	a2,a3,-1
	sub	a5,a5,a3
	slli	a5,a5,3
	sub	a2,a1,a2
	mv	a4,s1
	sw	a5,4(sp)
	lw	s0,12(sp)
	mv	s1,a0
	sw	a2,0(sp)
	mv	a5,a3
	j	.L201
.L230:
	lbu	a4,7(a5)
	j	.L202
.L231:
	li	a5,-8
	sw	a5,20(sp)
	sw	zero,4(sp)
	li	a5,1
	j	.L201
.L232:
	lla	a1,.LC3
	call	luaG_runerror
	.size	luaV_concat, .-luaV_concat
	.section	.rodata.luaV_objlen.str1.4,"aMS",@progbits,1
	.align	2
.LC4:
	.string	"get length of"
	.section	.text.luaV_objlen,"ax",@progbits
	.align	2
	.globl	luaV_objlen
	.hidden	luaV_objlen
	.type	luaV_objlen, @function
luaV_objlen:
	lw	a5,4(a2)
	addi	sp,sp,-20
	sw	s0,12(sp)
	sw	s1,8(sp)
	sw	ra,16(sp)
	andi	a5,a5,63
	li	a4,5
	mv	s0,a2
	mv	t1,a0
	mv	s1,a1
	beq	a5,a4,.L238
	li	a4,20
	beq	a5,a4,.L239
	li	a4,4
	beq	a5,a4,.L248
	mv	a1,s0
	li	a2,4
	sw	a0,0(sp)
	call	luaT_gettmbyobj
	lw	a5,4(a0)
	lw	t1,0(sp)
	mv	a1,a0
	beq	a5,zero,.L249
.L245:
	mv	a3,s0
	mv	a2,s0
	lw	s0,12(sp)
	lw	ra,16(sp)
	mv	a4,s1
	lw	s1,8(sp)
	li	a5,1
	mv	a0,t1
	addi	sp,sp,20
	tail	luaT_callTM
.L248:
	lw	a5,0(a2)
	lw	ra,16(sp)
	lw	s0,12(sp)
	lbu	a5,7(a5)
	li	a4,19
	sw	a4,4(a1)
	sw	a5,0(a1)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L239:
	lw	a5,0(a2)
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	a5,12(a5)
	li	a4,19
	sw	a4,4(a1)
	sw	a5,0(a1)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L238:
	lw	a4,0(a2)
	lw	a0,24(a4)
	beq	a0,zero,.L244
	lbu	a5,6(a0)
	andi	a5,a5,16
	beq	a5,zero,.L250
.L244:
	mv	a0,a4
	call	luaH_getn
	lw	ra,16(sp)
	lw	s0,12(sp)
	li	a5,19
	sw	a0,0(s1)
	sw	a5,4(s1)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L250:
	lw	a5,16(t1)
	li	a1,4
	sw	a4,4(sp)
	lw	a2,140(a5)
	sw	t1,0(sp)
	call	luaT_gettm
	lw	t1,0(sp)
	lw	a4,4(sp)
	mv	a1,a0
	bne	a0,zero,.L245
	j	.L244
.L249:
	lla	a2,.LC4
	mv	a1,s0
	mv	a0,t1
	call	luaG_typeerror
	.size	luaV_objlen, .-luaV_objlen
	.section	.rodata.luaV_div.str1.4,"aMS",@progbits,1
	.align	2
.LC5:
	.string	"attempt to divide by zero"
	.globl	__divsi3
	.globl	__modsi3
	.section	.text.luaV_div,"ax",@progbits
	.align	2
	.globl	luaV_div
	.hidden	luaV_div
	.type	luaV_div, @function
luaV_div:
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	addi	a4,a2,1
	li	a5,1
	mv	s0,a2
	mv	s1,a1
	bgtu	a4,a5,.L252
	neg	a5,a1
	beq	a2,zero,.L258
.L251:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	mv	a0,a5
	addi	sp,sp,16
	jr	ra
.L252:
	mv	a1,a2
	mv	a0,s1
	call	__divsi3
	xor	a4,s0,s1
	mv	a5,a0
	bge	a4,zero,.L251
	sw	a0,0(sp)
	mv	a1,s0
	mv	a0,s1
	call	__modsi3
	lw	a5,0(sp)
	lw	ra,12(sp)
	lw	s0,8(sp)
	snez	a0,a0
	sub	a5,a5,a0
	lw	s1,4(sp)
	mv	a0,a5
	addi	sp,sp,16
	jr	ra
.L258:
	lla	a1,.LC5
	call	luaG_runerror
	.size	luaV_div, .-luaV_div
	.section	.rodata.luaV_mod.str1.4,"aMS",@progbits,1
	.align	2
.LC6:
	.string	"attempt to perform 'n%%0'"
	.section	.text.luaV_mod,"ax",@progbits
	.align	2
	.globl	luaV_mod
	.hidden	luaV_mod
	.type	luaV_mod, @function
luaV_mod:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	sw	s1,0(sp)
	addi	a4,a2,1
	li	a5,1
	mv	s0,a2
	bgtu	a4,a5,.L260
	li	a5,0
	beq	a2,zero,.L267
.L259:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	mv	a0,a5
	addi	sp,sp,12
	jr	ra
.L260:
	mv	s1,a1
	mv	a0,s1
	mv	a1,a2
	call	__modsi3
	mv	a5,a0
	beq	a0,zero,.L259
	xor	a1,s0,s1
	bge	a1,zero,.L259
	add	a5,a0,s0
	j	.L259
.L267:
	lla	a1,.LC6
	call	luaG_runerror
	.size	luaV_mod, .-luaV_mod
	.section	.text.luaV_shiftl,"ax",@progbits
	.align	2
	.globl	luaV_shiftl
	.hidden	luaV_shiftl
	.type	luaV_shiftl, @function
luaV_shiftl:
	mv	a5,a0
	blt	a1,zero,.L273
	li	a4,31
	li	a0,0
	ble	a1,a4,.L274
.L268:
	ret
.L274:
	sll	a0,a5,a1
	ret
.L273:
	li	a4,-31
	li	a0,0
	blt	a1,a4,.L268
	neg	a1,a1
	srl	a0,a5,a1
	ret
	.size	luaV_shiftl, .-luaV_shiftl
	.section	.text.luaV_finishOp,"ax",@progbits
	.align	2
	.globl	luaV_finishOp
	.hidden	luaV_finishOp
	.type	luaV_finishOp, @function
luaV_finishOp:
	addi	sp,sp,-16
	sw	s1,4(sp)
	lw	s1,20(a0)
	sw	s0,8(sp)
	sw	ra,12(sp)
	lw	a4,20(s1)
	li	a2,35
	lw	a3,16(s1)
	lw	s0,-4(a4)
	andi	a5,s0,63
	addi	a5,a5,-6
	bgtu	a5,a2,.L275
	lla	a2,.L278
	slli	a5,a5,2
	add	a5,a5,a2
	lw	a5,0(a5)
	add	a5,a5,a2
	jr	a5
	.section	.rodata.luaV_finishOp,"a",@progbits
	.align	2
	.align	2
.L278:
	.word	.L282-.L278
	.word	.L282-.L278
	.word	.L275-.L278
	.word	.L275-.L278
	.word	.L275-.L278
	.word	.L275-.L278
	.word	.L282-.L278
	.word	.L282-.L278
	.word	.L282-.L278
	.word	.L282-.L278
	.word	.L282-.L278
	.word	.L282-.L278
	.word	.L282-.L278
	.word	.L282-.L278
	.word	.L282-.L278
	.word	.L282-.L278
	.word	.L282-.L278
	.word	.L282-.L278
	.word	.L282-.L278
	.word	.L282-.L278
	.word	.L282-.L278
	.word	.L275-.L278
	.word	.L282-.L278
	.word	.L281-.L278
	.word	.L275-.L278
	.word	.L280-.L278
	.word	.L280-.L278
	.word	.L280-.L278
	.word	.L275-.L278
	.word	.L275-.L278
	.word	.L279-.L278
	.word	.L275-.L278
	.word	.L275-.L278
	.word	.L275-.L278
	.word	.L275-.L278
	.word	.L299-.L278
	.section	.text.luaV_finishOp
.L279:
	srli	s0,s0,14
	andi	s0,s0,511
	beq	s0,zero,.L275
.L299:
	lw	a5,4(s1)
	sw	a5,12(a0)
.L275:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L282:
	lw	a5,12(a0)
	srli	s0,s0,3
	andi	s0,s0,2040
	lw	a4,-8(a5)
	addi	a2,a5,-8
	sw	a2,12(a0)
	add	s0,a3,s0
	sw	a4,0(s0)
	lw	a5,-4(a5)
	lw	ra,12(sp)
	lw	s1,4(sp)
	sw	a5,4(s0)
	lw	s0,8(sp)
	addi	sp,sp,16
	jr	ra
.L280:
	lw	a3,12(a0)
	lw	a5,-4(a3)
	beq	a5,zero,.L283
	li	a2,1
	beq	a5,a2,.L300
	li	a5,1
.L283:
	lhu	a2,34(s1)
	addi	a3,a3,-8
	sw	a3,12(a0)
	andi	a3,a2,128
	beq	a3,zero,.L284
	xori	a2,a2,128
	sh	a2,34(s1)
	xori	a5,a5,1
.L284:
	srli	s0,s0,6
	andi	s0,s0,255
	beq	s0,a5,.L275
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	a4,a4,4
	sw	a4,20(s1)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L281:
	lw	a5,12(a0)
	srli	a1,s0,23
	slli	a1,a1,3
	lw	a2,-4(a5)
	lw	t1,-8(a5)
	addi	a4,a5,-16
	add	a1,a3,a1
	sw	a2,-20(a5)
	sub	a1,a4,a1
	sw	t1,-24(a5)
	li	a2,8
	bgt	a1,a2,.L301
.L286:
	lw	a4,-8(a5)
	srli	s0,s0,3
	andi	s0,s0,2040
	add	a3,a3,s0
	sw	a4,0(a3)
	lw	a4,-4(a5)
	lw	a5,4(s1)
	lw	ra,12(sp)
	lw	s0,8(sp)
	sw	a4,4(a3)
	sw	a5,12(a0)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L301:
	sw	a4,12(a0)
	srai	a1,a1,3
	sw	a0,0(sp)
	call	luaV_concat
	lw	a0,0(sp)
	lw	a3,16(s1)
	lw	a5,12(a0)
	j	.L286
.L300:
	lw	a5,-8(a3)
	snez	a5,a5
	j	.L283
	.size	luaV_finishOp, .-luaV_finishOp
	.globl	__mulsi3
	.section	.rodata.luaV_execute.str1.4,"aMS",@progbits,1
	.align	2
.LC7:
	.string	"'for' limit must be a number"
	.align	2
.LC8:
	.string	"'for' step must be a number"
	.align	2
.LC9:
	.string	"'for' initial value must be a number"
	.section	.text.luaV_execute,"ax",@progbits
	.align	2
	.globl	luaV_execute
	.hidden	luaV_execute
	.type	luaV_execute, @function
luaV_execute:
	addi	sp,sp,-72
	sw	s0,64(sp)
	lw	s0,20(a0)
	sw	ra,68(sp)
	sw	s1,60(sp)
	lhu	a5,34(s0)
	lw	a2,20(s0)
	sw	a0,0(sp)
	ori	a5,a5,8
	sh	a5,34(s0)
.L303:
	lw	a5,0(s0)
	lw	t1,16(s0)
	lw	a4,0(a5)
	lw	a5,12(a4)
	sw	a4,16(sp)
	addi	a4,a4,16
	lw	a5,44(a5)
	sw	a4,20(sp)
	sw	a5,4(sp)
.L304:
	lw	a5,0(sp)
	addi	a4,a2,4
	lw	a5,112(a5)
	sw	a4,20(s0)
	lw	s1,0(a2)
	andi	a5,a5,12
	bne	a5,zero,.L871
.L306:
	srli	a3,s1,6
	andi	a3,a3,255
	slli	a2,a3,3
	andi	a4,s1,63
	li	a1,45
	add	a5,t1,a2
	bgtu	a4,a1,.L305
	lla	a1,.L308
	slli	a4,a4,2
	add	a4,a1,a4
	lw	a4,0(a4)
	add	a4,a1,a4
	jr	a4
	.section	.rodata.luaV_execute,"a",@progbits
	.align	2
	.align	2
.L308:
	.word	.L353-.L308
	.word	.L352-.L308
	.word	.L351-.L308
	.word	.L350-.L308
	.word	.L349-.L308
	.word	.L348-.L308
	.word	.L347-.L308
	.word	.L346-.L308
	.word	.L345-.L308
	.word	.L344-.L308
	.word	.L343-.L308
	.word	.L342-.L308
	.word	.L341-.L308
	.word	.L340-.L308
	.word	.L339-.L308
	.word	.L338-.L308
	.word	.L337-.L308
	.word	.L336-.L308
	.word	.L335-.L308
	.word	.L334-.L308
	.word	.L333-.L308
	.word	.L332-.L308
	.word	.L331-.L308
	.word	.L330-.L308
	.word	.L329-.L308
	.word	.L328-.L308
	.word	.L327-.L308
	.word	.L326-.L308
	.word	.L325-.L308
	.word	.L324-.L308
	.word	.L323-.L308
	.word	.L322-.L308
	.word	.L321-.L308
	.word	.L320-.L308
	.word	.L319-.L308
	.word	.L318-.L308
	.word	.L317-.L308
	.word	.L316-.L308
	.word	.L315-.L308
	.word	.L314-.L308
	.word	.L313-.L308
	.word	.L312-.L308
	.word	.L311-.L308
	.word	.L310-.L308
	.word	.L309-.L308
	.word	.L307-.L308
	.section	.text.luaV_execute
.L309:
	lw	a4,16(sp)
	srli	s1,s1,14
	slli	s1,s1,2
	lw	a4,12(a4)
	lw	a4,52(a4)
	add	a4,a4,s1
	lw	t0,0(a4)
	lw	ra,68(t0)
	lw	a3,12(t0)
	lw	s1,64(t0)
	beq	ra,zero,.L621
	ble	a3,zero,.L622
	addi	a2,s1,4
	mv	a1,a2
	sw	a2,8(sp)
	addi	a0,ra,16
	lw	a2,20(sp)
	li	t2,0
	j	.L626
.L872:
	lw	s1,0(a0)
	slli	a4,a4,3
	add	a4,t1,a4
	lw	s1,0(s1)
	bne	s1,a4,.L625
.L873:
	addi	t2,t2,1
	addi	a1,a1,8
	addi	a0,a0,4
	beq	t2,a3,.L622
.L626:
	lbu	s1,0(a1)
	lbu	a4,1(a1)
	bne	s1,zero,.L872
	slli	a4,a4,2
	add	a4,a2,a4
	lw	a4,0(a4)
	lw	s1,0(a0)
	lw	a4,0(a4)
	lw	s1,0(s1)
	beq	s1,a4,.L873
.L625:
	lw	a2,8(sp)
	lw	a0,0(sp)
	mv	a1,a3
	sw	t1,36(sp)
	sw	a5,32(sp)
	sw	t0,24(sp)
	sw	a2,12(sp)
	sw	a3,8(sp)
	call	luaF_newLclosure
	lw	t0,24(sp)
	lw	a5,32(sp)
	lw	a3,8(sp)
	lw	a2,12(sp)
	lw	t1,36(sp)
	sw	t0,12(a0)
	li	a4,70
	sw	a0,28(sp)
	sw	a0,0(a5)
	sw	a4,4(a5)
.L642:
	lw	a4,28(sp)
	li	s1,0
	sw	s0,32(sp)
	addi	t2,a4,16
	mv	s0,s1
	sw	t1,24(sp)
	sw	a5,36(sp)
	sw	t0,40(sp)
	mv	s1,t2
	j	.L630
.L628:
	lw	a4,20(sp)
	slli	a5,a5,2
	addi	s0,s0,1
	add	a5,a4,a5
	lw	a0,0(a5)
	addi	a2,a2,8
	addi	s1,s1,4
	lw	a5,4(a0)
	sw	a0,-4(s1)
	addi	a5,a5,1
	sw	a5,4(a0)
	bge	s0,a3,.L874
.L630:
	lbu	a1,0(a2)
	lbu	a5,1(a2)
	beq	a1,zero,.L628
	lw	a4,24(sp)
	lw	a0,0(sp)
	slli	a5,a5,3
	add	a1,a4,a5
	sw	a3,12(sp)
	sw	a2,8(sp)
	call	luaF_findupval
	lw	a5,4(a0)
	lw	a2,8(sp)
	lw	a3,12(sp)
	sw	a0,0(s1)
	addi	a5,a5,1
	addi	s0,s0,1
	sw	a5,4(a0)
	addi	a2,a2,8
	addi	s1,s1,4
	blt	s0,a3,.L630
.L874:
	lw	s0,32(sp)
	lw	t1,24(sp)
	lw	a5,36(sp)
	lw	t0,40(sp)
.L627:
	lbu	a4,5(t0)
	andi	a4,a4,4
	bne	a4,zero,.L631
	lw	a4,28(sp)
	sw	a4,68(t0)
	lw	a4,0(sp)
	lw	a4,16(a4)
	lw	a4,12(a4)
	bgt	a4,zero,.L632
.L305:
	lw	a2,20(s0)
.L885:
	lw	a5,0(sp)
	addi	a4,a2,4
	lw	a5,112(a5)
	sw	a4,20(s0)
	lw	s1,0(a2)
	andi	a5,a5,12
	beq	a5,zero,.L306
.L871:
	lw	a0,0(sp)
	call	luaG_traceexec
	lw	t1,16(s0)
	j	.L306
.L317:
	srli	a2,s1,14
	andi	a2,a2,511
	srli	a4,s1,23
	addi	s1,a2,-1
	beq	a4,zero,.L571
	lw	a3,0(sp)
	slli	a4,a4,3
	add	a4,a5,a4
	sw	a4,12(a3)
.L571:
	lw	a0,0(sp)
	mv	a2,s1
	mv	a1,a5
	call	luaD_precall
	beq	a0,zero,.L572
	li	a5,-1
	beq	s1,a5,.L835
	lw	a5,4(s0)
	lw	a4,0(sp)
	sw	a5,12(a4)
.L835:
	lw	t1,16(s0)
	lw	a2,20(s0)
	j	.L304
.L318:
	srli	a4,s1,23
	slli	a4,a4,3
	srli	s1,s1,14
	add	a4,t1,a4
	andi	s1,s1,511
	lw	a3,4(a4)
	beq	s1,zero,.L561
	beq	a3,zero,.L841
	li	a2,1
	beq	a3,a2,.L875
.L567:
	lw	a2,20(s0)
.L566:
	lw	a3,0(a4)
	sw	a3,0(a5)
	lw	a4,4(a4)
	sw	a4,4(a5)
	lw	s1,0(a2)
	srli	a5,s1,6
	andi	a5,a5,255
	beq	a5,zero,.L570
.L877:
	lw	a1,16(s0)
	lw	a0,0(sp)
	slli	a5,a5,3
	addi	a5,a5,-8
	add	a1,a1,a5
	sw	t1,8(sp)
	call	luaF_close
	lw	a2,20(s0)
	lw	t1,8(sp)
	j	.L570
.L319:
	srli	s1,s1,14
	andi	s1,s1,511
	lw	a4,4(a5)
	beq	s1,zero,.L551
	beq	a4,zero,.L841
	li	a3,1
	beq	a4,a3,.L876
.L557:
	lw	a2,20(s0)
.L854:
	lw	s1,0(a2)
	srli	a5,s1,6
	andi	a5,a5,255
	bne	a5,zero,.L877
.L570:
	li	a4,-131072
	srli	a5,s1,14
	addi	a4,a4,2
	add	a5,a5,a4
	slli	a5,a5,2
	add	a2,a2,a5
	j	.L304
.L320:
	srli	a5,s1,23
	slli	a1,a5,3
	add	a1,t1,a1
	bge	s1,zero,.L545
	lw	a4,4(sp)
	andi	a5,a5,-257
	slli	a5,a5,3
	add	a1,a4,a5
.L545:
	li	a5,4194304
	and	a5,s1,a5
	srli	s1,s1,14
	beq	a5,zero,.L546
	lw	a5,4(sp)
	andi	a2,s1,255
	slli	a2,a2,3
	add	a2,a5,a2
.L547:
	lw	a0,0(sp)
	sw	a3,8(sp)
	call	luaV_lessequal
	lw	a3,8(sp)
	lw	a2,20(s0)
	beq	a0,a3,.L548
.L840:
	addi	a2,a2,4
.L549:
	lw	t1,16(s0)
	j	.L304
.L313:
	lw	a4,4(a5)
	li	a3,19
	addi	t0,a5,8
	beq	a4,a3,.L878
.L591:
	lw	a3,12(a5)
	li	a4,3
	bne	a3,a4,.L604
	lw	a3,8(a5)
	sw	a3,52(sp)
.L605:
	lw	a2,20(a5)
	li	a4,3
	sw	a3,8(a5)
	sw	a4,12(a5)
	bne	a2,a4,.L607
	lw	a3,16(a5)
	sw	a3,56(sp)
.L608:
	lw	a2,4(a5)
	li	a4,3
	sw	a3,16(a5)
	sw	a4,20(a5)
	bne	a2,a4,.L610
	lw	a4,0(a5)
.L611:
	sub	a4,a4,a3
	sw	a4,0(a5)
	li	a4,3
	sw	a4,4(a5)
.L603:
	li	a4,1073610752
	lw	a2,20(s0)
	srli	a5,s1,14
	addi	a4,a4,1
	add	a5,a5,a4
	slli	a5,a5,2
	add	a2,a2,a5
	j	.L304
.L315:
	lw	a3,16(sp)
	srli	s1,s1,23
	lw	a3,12(a3)
	lw	a4,28(a3)
	ble	a4,zero,.L581
	lw	a0,0(sp)
	mv	a1,t1
	sw	a5,4(sp)
	call	luaF_close
	lw	a5,4(sp)
.L581:
	addi	a3,s1,-1
	bne	s1,zero,.L583
	lw	a4,0(sp)
	lw	a3,12(a4)
	sub	a3,a3,a5
	srai	a3,a3,3
.L583:
	lw	s1,0(sp)
	mv	a2,a5
	mv	a1,s0
	mv	a0,s1
	call	luaD_poscall
	lhu	a5,34(s0)
	andi	a5,a5,8
	bne	a5,zero,.L825
	lw	s0,20(s1)
	beq	a0,zero,.L585
	lw	a5,4(s0)
	lw	a2,20(s0)
	sw	a5,12(s1)
	j	.L303
.L316:
	srli	s1,s1,23
	beq	s1,zero,.L575
	lw	a3,0(sp)
	slli	s1,s1,3
	add	a4,a5,s1
	sw	a4,12(a3)
.L575:
	lw	a0,0(sp)
	li	a2,-1
	mv	a1,a5
	call	luaD_precall
	bne	a0,zero,.L835
	lw	a0,0(sp)
	lw	a5,16(sp)
	lw	a3,20(a0)
	lw	a5,12(a5)
	lw	t0,0(a3)
	lw	s0,8(a3)
	lw	a2,16(a3)
	lw	a4,0(t0)
	lw	a5,28(a5)
	lw	t2,0(s0)
	lw	a4,12(a4)
	lbu	s1,6(a4)
	slli	s1,s1,3
	add	s1,a2,s1
	bgt	a5,zero,.L879
.L577:
	mv	a5,t0
	mv	a4,t2
	bgeu	t0,s1,.L580
.L579:
	lw	a1,0(a5)
	addi	a5,a5,8
	addi	a4,a4,8
	sw	a1,-8(a4)
	lw	a1,-4(a5)
	sw	a1,-4(a4)
	bgtu	s1,a5,.L579
.L580:
	lw	a0,0(sp)
	lhu	a4,34(s0)
	sub	a1,a2,t0
	lw	a5,12(a0)
	lw	a2,20(a3)
	add	a3,t2,a1
	sub	a5,a5,t0
	sw	a3,16(s0)
	add	a5,t2,a5
	sw	a5,12(a0)
	ori	a4,a4,32
	sw	a5,4(s0)
	sw	a2,20(s0)
	sh	a4,34(s0)
	sw	s0,20(a0)
	j	.L303
.L321:
	srli	a5,s1,23
	slli	a1,a5,3
	add	a1,t1,a1
	bge	s1,zero,.L538
	lw	a4,4(sp)
	andi	a5,a5,-257
	slli	a5,a5,3
	add	a1,a4,a5
.L538:
	li	a5,4194304
	and	a5,s1,a5
	srli	s1,s1,14
	beq	a5,zero,.L539
	lw	a5,4(sp)
	andi	a2,s1,255
	slli	a2,a2,3
	add	a2,a5,a2
.L540:
	lw	a0,0(sp)
	sw	a3,8(sp)
	call	luaV_lessthan
	lw	a3,8(sp)
	lw	a2,20(s0)
	bne	a0,a3,.L840
.L548:
	lw	s1,0(a2)
	srli	a5,s1,6
	andi	a5,a5,255
	bne	a5,zero,.L880
.L550:
	li	a4,-131072
	srli	a5,s1,14
	addi	a4,a4,2
	add	a5,a5,a4
	slli	a5,a5,2
	lw	t1,16(s0)
	add	a2,a2,a5
	j	.L304
.L311:
	lw	a2,20(s0)
.L354:
	lw	a3,12(a5)
	beq	a3,zero,.L304
	li	a1,1073610752
	lw	a0,8(a5)
	srli	a4,s1,14
	addi	a1,a1,1
	add	a4,a4,a1
	slli	a4,a4,2
	sw	a0,0(a5)
	sw	a3,4(a5)
	add	a2,a2,a4
	j	.L304
.L323:
	bne	a3,zero,.L881
.L529:
	li	a4,-131072
	lw	a2,20(s0)
	srli	a5,s1,14
	addi	a4,a4,1
	add	a5,a5,a4
	slli	a5,a5,2
	add	a2,a2,a5
	j	.L304
.L324:
	srli	a1,s1,14
	andi	a1,a1,511
	lw	a4,0(sp)
	addi	a5,a1,1
	srli	s1,s1,23
	slli	a5,a5,3
	add	a5,t1,a5
	sub	a1,a1,s1
	sw	a5,12(a4)
	mv	a0,a4
	addi	a1,a1,1
	sw	a2,8(sp)
	call	luaV_concat
	lw	t1,16(s0)
	lw	a4,0(sp)
	slli	s1,s1,3
	add	a5,t1,s1
	lw	a2,8(sp)
	lw	a4,16(a4)
	lw	a3,0(a5)
	add	a2,t1,a2
	lw	a4,12(a4)
	sw	a3,0(a2)
	lw	a3,4(a5)
	sw	a3,4(a2)
	ble	a4,zero,.L620
	bltu	a2,a5,.L528
	addi	a5,a2,8
.L528:
	lw	a4,0(sp)
	sw	a5,12(a4)
	mv	a0,a4
	call	luaC_step
	lw	t1,16(s0)
.L620:
	lw	a5,4(s0)
	lw	a4,0(sp)
	lw	a2,20(s0)
	sw	a5,12(a4)
	j	.L304
.L322:
	srli	a5,s1,23
	slli	a1,a5,3
	add	a1,t1,a1
	bge	s1,zero,.L531
	lw	a4,4(sp)
	andi	a5,a5,-257
	slli	a5,a5,3
	add	a1,a4,a5
.L531:
	li	a5,4194304
	and	a5,s1,a5
	srli	s1,s1,14
	beq	a5,zero,.L532
	lw	a5,4(sp)
	andi	a2,s1,255
	slli	a2,a2,3
	add	a2,a5,a2
.L533:
	lw	a0,0(sp)
	sw	a3,8(sp)
	call	luaV_equalobj
	lw	a3,8(sp)
	lw	a2,20(s0)
	beq	a0,a3,.L548
	addi	a2,a2,4
	j	.L549
.L314:
	lw	a1,4(a5)
	li	a3,19
	lw	a2,16(a5)
	lw	a4,8(a5)
	beq	a1,a3,.L882
	lw	a3,0(a5)
	add	a3,a2,a3
	ble	a2,zero,.L589
	sgt	a4,a3,a4
	xori	a4,a4,1
.L590:
	lw	a2,20(s0)
	beq	a4,zero,.L304
	li	a1,1073610752
	srli	a4,s1,14
	addi	a1,a1,1
	add	a4,a4,a1
	slli	a4,a4,2
	add	a2,a2,a4
	li	a4,3
	sw	a3,0(a5)
	sw	a3,24(a5)
	sw	a4,28(a5)
	j	.L304
.L310:
	srli	a4,s1,14
	srli	a3,s1,23
	andi	a4,a4,511
	bne	a3,zero,.L614
	lw	a3,0(sp)
	lw	a3,12(a3)
	sub	a3,a3,a5
	srai	a3,a3,3
	addi	a3,a3,-1
.L614:
	bne	a4,zero,.L615
	lw	a4,20(s0)
	addi	a2,a4,4
	sw	a2,20(s0)
	lw	a4,0(a4)
	srli	a4,a4,6
.L615:
	addi	a4,a4,-1
	slli	a2,a4,1
	lw	a1,0(a5)
	add	a2,a2,a4
	slli	a2,a2,3
	add	a2,a2,a4
	lw	a4,8(a1)
	slli	a2,a2,1
	add	a2,a2,a3
	bltu	a4,a2,.L883
.L616:
	slli	s1,a3,3
	add	s1,a5,s1
	ble	a3,zero,.L620
	sw	s0,24(sp)
	sw	t1,28(sp)
	mv	s0,s1
	sw	a5,12(sp)
	mv	s1,a1
.L619:
	lw	a0,0(sp)
	mv	a3,s0
	mv	a1,s1
	sw	a2,8(sp)
	call	luaH_setint
	lw	a5,4(s0)
	lw	a2,8(sp)
	andi	a5,a5,64
	beq	a5,zero,.L618
	lbu	a5,5(s1)
	andi	a5,a5,4
	beq	a5,zero,.L618
	lw	a5,0(s0)
	lbu	a5,5(a5)
	andi	a5,a5,3
	bne	a5,zero,.L884
.L618:
	lw	a5,12(sp)
	addi	s0,s0,-8
	addi	a2,a2,-1
	bne	a5,s0,.L619
	lw	s0,24(sp)
	lw	t1,28(sp)
	j	.L620
.L312:
	lw	a2,12(a5)
	lw	t1,16(a5)
	lw	a0,20(a5)
	lw	a1,8(a5)
	lw	a4,4(a5)
	lw	a3,0(a5)
	sw	a2,36(a5)
	srli	a2,s1,14
	lw	s1,0(sp)
	sw	t1,40(a5)
	sw	a0,44(a5)
	sw	a1,32(a5)
	sw	a4,28(a5)
	sw	a3,24(a5)
	addi	a4,a5,48
	sw	a4,12(s1)
	addi	a1,a5,24
	andi	a2,a2,511
	mv	a0,s1
	call	luaD_call
	lw	a5,20(s0)
	lw	a4,4(s0)
	lw	t1,16(s0)
	addi	a2,a5,4
	sw	a4,12(s1)
	sw	a2,20(s0)
	lw	s1,0(a5)
	srli	a5,s1,3
	andi	a5,a5,2040
	add	a5,t1,a5
	j	.L354
.L325:
	lw	a0,0(sp)
	srli	a2,s1,23
	slli	a2,a2,3
	add	a2,t1,a2
	mv	a1,a5
	call	luaV_objlen
	lw	t1,16(s0)
	lw	a2,20(s0)
	j	.L304
.L326:
	srli	a4,s1,23
	slli	a4,a4,3
	add	a4,t1,a4
	lw	a2,4(a4)
	li	a3,1
	beq	a2,zero,.L526
	li	a1,1
	li	a3,0
	bne	a2,a1,.L526
	lw	a3,0(a4)
	seqz	a3,a3
.L526:
	li	a4,1
	lw	a2,20(s0)
	sw	a3,0(a5)
	sw	a4,4(a5)
	j	.L304
.L327:
	srli	s1,s1,23
	slli	s1,s1,3
	add	s1,t1,s1
	lw	a3,4(s1)
	li	a4,19
	bne	a3,a4,.L522
	lw	a4,0(s1)
.L523:
	not	a4,a4
.L847:
	sw	a4,0(a5)
	li	a4,19
	lw	a2,20(s0)
	sw	a4,4(a5)
	j	.L885
.L328:
	srli	s1,s1,23
	slli	s1,s1,3
	add	s1,t1,s1
	lw	a4,4(s1)
	li	a3,19
	beq	a4,a3,.L886
	li	a3,3
	bne	a4,a3,.L519
	lw	a4,0(s1)
	neg	a4,a4
	j	.L846
.L341:
	srli	t0,s1,23
	li	a4,4194304
	slli	t0,t0,3
	and	a4,s1,a4
	add	t0,t1,t0
	srli	s1,s1,14
	beq	a4,zero,.L379
	lw	a4,4(sp)
	andi	s1,s1,255
	slli	s1,s1,3
	add	s1,a4,s1
.L380:
	lw	a4,0(t0)
	lw	a1,0(s1)
	li	a3,69
	sw	a4,8(a5)
	lw	a2,4(t0)
	li	a4,0
	sw	a2,12(a5)
	lw	a2,4(t0)
	beq	a2,a3,.L887
.L381:
	lw	a0,0(sp)
	mv	a2,s1
	mv	a3,a5
	mv	a1,t0
	call	luaV_finishget
	lw	t1,16(s0)
	lw	a2,20(s0)
	j	.L304
.L343:
	srli	a4,s1,23
	slli	a2,a4,3
	add	a2,t1,a2
	blt	s1,zero,.L866
.L372:
	li	a4,4194304
	and	a4,s1,a4
	srli	s1,s1,14
	beq	a4,zero,.L373
.L892:
	lw	a4,4(sp)
	lw	a1,4(a5)
	andi	s1,s1,255
	slli	s1,s1,3
	li	a3,69
	add	s1,a4,s1
	li	a4,0
	beq	a1,a3,.L888
.L375:
	lw	a0,0(sp)
	mv	a3,s1
	mv	a1,a5
	call	luaV_finishset
	lw	t1,16(s0)
	lw	a2,20(s0)
	j	.L304
.L344:
	lw	a3,16(sp)
	srli	a4,s1,23
	addi	a4,a4,4
	slli	a4,a4,2
	add	a4,a3,a4
	lw	a1,0(a4)
	lw	a3,0(a5)
	lw	a4,0(a1)
	sw	a3,0(a4)
	lw	a5,4(a5)
	sw	a5,4(a4)
	andi	a5,a5,64
	beq	a5,zero,.L305
	addi	a5,a1,8
	bne	a4,a5,.L305
	lw	a0,0(sp)
	sw	t1,8(sp)
	call	luaC_upvalbarrier_
	lw	a2,20(s0)
	lw	t1,8(sp)
	j	.L304
.L333:
	srli	a4,s1,23
	slli	t0,a4,3
	add	t0,t1,t0
	bge	s1,zero,.L426
	lw	a3,4(sp)
	andi	a4,a4,-257
	slli	a4,a4,3
	add	t0,a3,a4
.L426:
	li	a4,4194304
	and	a4,s1,a4
	srli	s1,s1,14
	beq	a4,zero,.L427
	lw	a3,4(sp)
	andi	s1,s1,255
	slli	a4,s1,3
	add	s1,a3,a4
	lw	a3,4(t0)
	li	a4,19
	bne	a3,a4,.L429
.L901:
	lw	a4,0(t0)
	sw	a4,52(sp)
.L430:
	lw	a3,4(s1)
	li	a4,19
	bne	a3,a4,.L432
	lw	a3,0(s1)
.L433:
	li	a4,19
	sw	a4,4(a5)
	lw	a4,52(sp)
	lw	a2,20(s0)
	and	a4,a4,a3
	sw	a4,0(a5)
	j	.L885
.L349:
	srli	a4,s1,23
	addi	a4,a4,1
	slli	a4,a4,3
	add	a4,a5,a4
.L356:
	addi	a5,a5,8
	sw	zero,-4(a5)
	bne	a4,a5,.L356
	lw	a2,20(s0)
	j	.L885
.L351:
	lw	a4,20(s0)
	lw	a3,4(sp)
	addi	a2,a4,4
	sw	a2,20(s0)
	lw	a4,0(a4)
	srli	a4,a4,6
	slli	a4,a4,3
	add	a4,a3,a4
	lw	a3,0(a4)
	sw	a3,0(a5)
	lw	a4,4(a4)
	sw	a4,4(a5)
	j	.L304
.L352:
	lw	a3,4(sp)
	srli	a4,s1,14
	slli	a4,a4,3
	add	a4,a3,a4
.L832:
	lw	a3,0(a4)
	lw	a2,20(s0)
	sw	a3,0(a5)
	lw	a4,4(a4)
	sw	a4,4(a5)
	j	.L304
.L329:
	srli	a4,s1,23
	slli	t0,a4,3
	add	t0,t1,t0
	bge	s1,zero,.L468
	lw	a3,4(sp)
	andi	a4,a4,-257
	slli	a4,a4,3
	add	t0,a3,a4
.L468:
	li	a4,4194304
	and	a4,s1,a4
	srli	s1,s1,14
	beq	a4,zero,.L469
	lw	a3,4(sp)
	andi	s1,s1,255
	slli	a4,s1,3
	add	s1,a3,a4
	lw	a3,4(t0)
	li	a4,19
	bne	a3,a4,.L471
.L907:
	lw	a4,0(t0)
	sw	a4,52(sp)
.L472:
	lw	a3,4(s1)
	li	a4,19
	bne	a3,a4,.L474
	lw	a4,0(s1)
	lw	a2,52(sp)
	bgt	a4,zero,.L889
.L476:
	li	a1,-31
	li	a3,0
	blt	a4,a1,.L477
	neg	a4,a4
.L851:
	sll	a3,a2,a4
.L477:
	li	a4,19
	sw	a3,0(a5)
	sw	a4,4(a5)
.L891:
	lw	a2,20(s0)
	j	.L885
.L330:
	srli	a4,s1,23
	slli	t0,a4,3
	add	t0,t1,t0
	bge	s1,zero,.L456
	lw	a3,4(sp)
	andi	a4,a4,-257
	slli	a4,a4,3
	add	t0,a3,a4
.L456:
	li	a4,4194304
	and	a4,s1,a4
	srli	s1,s1,14
	beq	a4,zero,.L457
	lw	a3,4(sp)
	andi	s1,s1,255
	slli	a4,s1,3
	add	s1,a3,a4
	lw	a3,4(t0)
	li	a4,19
	bne	a3,a4,.L459
.L910:
	lw	a4,0(t0)
	sw	a4,52(sp)
.L460:
	lw	a3,4(s1)
	li	a4,19
	bne	a3,a4,.L462
	lw	a4,0(s1)
	lw	a2,52(sp)
	blt	a4,zero,.L890
.L464:
	li	a1,31
	li	a3,0
	ble	a4,a1,.L851
	li	a4,19
	sw	a3,0(a5)
	sw	a4,4(a5)
	j	.L891
.L345:
	lw	a4,16(sp)
	addi	a5,a3,4
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a5,0(a5)
	srli	a4,s1,23
	slli	a2,a4,3
	lw	a5,0(a5)
	add	a2,t1,a2
	bge	s1,zero,.L372
.L866:
	lw	a3,4(sp)
	andi	a4,a4,-257
	slli	a4,a4,3
	add	a2,a3,a4
	li	a4,4194304
	and	a4,s1,a4
	srli	s1,s1,14
	bne	a4,zero,.L892
.L373:
	lw	a1,4(a5)
	andi	s1,s1,511
	slli	s1,s1,3
	li	a3,69
	add	s1,t1,s1
	li	a4,0
	bne	a1,a3,.L375
.L888:
	lw	a0,0(a5)
	mv	a1,a2
	sw	a5,12(sp)
	sw	a2,8(sp)
	sw	t1,24(sp)
	call	luaH_get
	lw	a3,4(a0)
	lw	a2,8(sp)
	lw	a5,12(sp)
	mv	a4,a0
	beq	a3,zero,.L375
	lw	a3,4(s1)
	lw	t1,24(sp)
	andi	a3,a3,64
	beq	a3,zero,.L376
	lw	a1,0(a5)
	lbu	a5,5(a1)
	andi	a5,a5,4
	beq	a5,zero,.L376
	lw	a5,0(s1)
	lbu	a5,5(a5)
	andi	a5,a5,3
	bne	a5,zero,.L893
.L376:
	lw	a5,0(s1)
	lw	a2,20(s0)
	sw	a5,0(a4)
	lw	a5,4(s1)
	sw	a5,4(a4)
	j	.L304
.L337:
	srli	a4,s1,23
	slli	t0,a4,3
	add	t0,t1,t0
	bge	s1,zero,.L480
	lw	a3,4(sp)
	andi	a4,a4,-257
	slli	a4,a4,3
	add	t0,a3,a4
.L480:
	li	a4,4194304
	and	a4,s1,a4
	srli	s1,s1,14
	beq	a4,zero,.L481
	lw	a4,4(sp)
	andi	s1,s1,255
	slli	s1,s1,3
	add	s1,a4,s1
	lw	a4,4(t0)
	li	a3,19
	beq	a4,a3,.L894
.L483:
	li	a3,3
	bne	a4,a3,.L484
	lw	a4,0(t0)
	sw	a4,52(sp)
.L488:
	lw	a3,4(s1)
	li	a4,3
	bne	a3,a4,.L490
	lw	s1,0(s1)
.L491:
	lw	a0,52(sp)
	mv	a1,s1
	sw	a5,24(sp)
	sw	t1,12(sp)
	call	fmod
	mv	a1,s1
	sw	a0,8(sp)
	call	__mulsi3
	lw	a4,8(sp)
	lw	t1,12(sp)
	lw	a5,24(sp)
	bge	a0,zero,.L846
	add	a4,a4,s1
.L846:
	sw	a4,0(a5)
	li	a4,3
	lw	a2,20(s0)
	sw	a4,4(a5)
	j	.L885
.L338:
	srli	a4,s1,23
	slli	t0,a4,3
	add	t0,t1,t0
	bge	s1,zero,.L405
	lw	a3,4(sp)
	andi	a4,a4,-257
	slli	a4,a4,3
	add	t0,a3,a4
.L405:
	li	a4,4194304
	and	a4,s1,a4
	srli	s1,s1,14
	beq	a4,zero,.L406
	lw	a4,4(sp)
	andi	s1,s1,255
	slli	s1,s1,3
	add	s1,a4,s1
	lw	a4,4(t0)
	li	a3,19
	beq	a4,a3,.L895
.L408:
	li	a3,3
	bne	a4,a3,.L409
	lw	a4,0(t0)
	sw	a4,52(sp)
.L411:
	lw	a3,4(s1)
	li	a4,3
	bne	a3,a4,.L413
	lw	a1,0(s1)
.L414:
	lw	a0,52(sp)
	sw	a5,12(sp)
	sw	t1,8(sp)
	call	__mulsi3
.L845:
	lw	a5,12(sp)
	li	a4,3
	lw	t1,8(sp)
	lw	a2,20(s0)
	sw	a0,0(a5)
	sw	a4,4(a5)
	j	.L885
.L339:
	srli	a4,s1,23
	slli	t0,a4,3
	add	t0,t1,t0
	bge	s1,zero,.L394
	lw	a3,4(sp)
	andi	a4,a4,-257
	slli	a4,a4,3
	add	t0,a3,a4
.L394:
	li	a4,4194304
	and	a4,s1,a4
	srli	s1,s1,14
	beq	a4,zero,.L395
	lw	a4,4(sp)
	andi	s1,s1,255
	slli	s1,s1,3
	add	s1,a4,s1
	lw	a4,4(t0)
	li	a3,19
	beq	a4,a3,.L896
.L397:
	li	a3,3
	bne	a4,a3,.L398
	lw	a4,0(t0)
	sw	a4,52(sp)
.L400:
	lw	a3,4(s1)
	li	a4,3
	bne	a3,a4,.L402
	lw	a3,0(s1)
.L403:
	li	a4,3
	sw	a4,4(a5)
	lw	a4,52(sp)
	lw	a2,20(s0)
	sub	a4,a4,a3
	sw	a4,0(a5)
	j	.L885
.L340:
	srli	a4,s1,23
	slli	t0,a4,3
	add	t0,t1,t0
	bge	s1,zero,.L383
	lw	a3,4(sp)
	andi	a4,a4,-257
	slli	a4,a4,3
	add	t0,a3,a4
.L383:
	li	a4,4194304
	and	a4,s1,a4
	srli	s1,s1,14
	beq	a4,zero,.L384
	lw	a4,4(sp)
	andi	s1,s1,255
	slli	s1,s1,3
	add	s1,a4,s1
	lw	a4,4(t0)
	li	a3,19
	beq	a4,a3,.L897
.L386:
	li	a3,3
	bne	a4,a3,.L387
	lw	a4,0(t0)
	sw	a4,52(sp)
.L389:
	lw	a3,4(s1)
	li	a4,3
	bne	a3,a4,.L391
	lw	a3,0(s1)
.L392:
	li	a4,3
	sw	a4,4(a5)
	lw	a4,52(sp)
	lw	a2,20(s0)
	add	a4,a4,a3
	sw	a4,0(a5)
	j	.L885
.L353:
	srli	a4,s1,23
	slli	a4,a4,3
	add	a4,t1,a4
	j	.L832
.L307:
	lw	a4,16(sp)
	srli	a0,s1,23
	addi	a1,a0,-1
	lw	a3,12(a4)
	lw	a4,0(s0)
	lbu	a3,6(a3)
	sub	a4,t1,a4
	srai	a4,a4,3
	sub	a4,a4,a3
	neg	a3,a4
	addi	s1,a4,-1
	srai	a3,a3,31
	and	s1,s1,a3
	beq	a0,zero,.L898
.L634:
	lw	a2,20(s0)
	beq	a1,zero,.L304
	li	a3,1
	ble	a4,a3,.L656
	slli	a3,s1,3
	sub	a3,t1,a3
	mv	a0,a5
	li	a4,0
.L637:
	lw	t0,0(a3)
	addi	a4,a4,1
	sw	t0,0(a0)
	lw	t0,4(a3)
	sw	t0,4(a0)
	beq	a1,a4,.L304
	addi	a3,a3,8
	addi	a0,a0,8
	blt	a4,s1,.L637
.L636:
	slli	a3,a4,3
	add	a5,a5,a3
.L638:
	sw	zero,4(a5)
	addi	a4,a4,1
	addi	a5,a5,8
	bgt	a1,a4,.L638
	lw	a2,20(s0)
	j	.L885
.L342:
	lw	a0,0(sp)
	srli	a4,s1,14
	sw	a5,24(sp)
	andi	a5,a4,511
	sw	t1,12(sp)
	sw	a5,8(sp)
	call	luaH_new
	lw	a5,24(sp)
	li	a3,69
	srli	a4,s1,23
	sw	a3,4(a5)
	lw	a3,8(sp)
	sw	a0,0(a5)
	lw	t1,12(sp)
	or	a3,a4,a3
	mv	s1,a0
	bne	a3,zero,.L899
.L631:
	lw	a4,0(sp)
	lw	a4,16(a4)
	lw	a4,12(a4)
	ble	a4,zero,.L305
.L632:
	lw	s1,0(sp)
	addi	a5,a5,8
	sw	a5,12(s1)
	mv	a0,s1
	call	luaC_step
	lw	a5,4(s0)
	lw	t1,16(s0)
	lw	a2,20(s0)
	sw	a5,12(s1)
	j	.L304
.L331:
	srli	a4,s1,23
	slli	t0,a4,3
	add	t0,t1,t0
	bge	s1,zero,.L446
	lw	a3,4(sp)
	andi	a4,a4,-257
	slli	a4,a4,3
	add	t0,a3,a4
.L446:
	li	a4,4194304
	and	a4,s1,a4
	srli	s1,s1,14
	beq	a4,zero,.L447
	lw	a3,4(sp)
	andi	s1,s1,255
	slli	a4,s1,3
	add	s1,a3,a4
	lw	a3,4(t0)
	li	a4,19
	bne	a3,a4,.L449
.L908:
	lw	a4,0(t0)
	sw	a4,52(sp)
.L450:
	lw	a3,4(s1)
	li	a4,19
	bne	a3,a4,.L452
	lw	a3,0(s1)
.L453:
	li	a4,19
	sw	a4,4(a5)
	lw	a4,52(sp)
	lw	a2,20(s0)
	xor	a4,a4,a3
	sw	a4,0(a5)
	j	.L885
.L332:
	srli	a4,s1,23
	slli	t0,a4,3
	add	t0,t1,t0
	bge	s1,zero,.L436
	lw	a3,4(sp)
	andi	a4,a4,-257
	slli	a4,a4,3
	add	t0,a3,a4
.L436:
	li	a4,4194304
	and	a4,s1,a4
	srli	s1,s1,14
	beq	a4,zero,.L437
	lw	a3,4(sp)
	andi	s1,s1,255
	slli	a4,s1,3
	add	s1,a3,a4
	lw	a3,4(t0)
	li	a4,19
	bne	a3,a4,.L439
.L909:
	lw	a4,0(t0)
	sw	a4,52(sp)
.L440:
	lw	a3,4(s1)
	li	a4,19
	bne	a3,a4,.L442
	lw	a3,0(s1)
.L443:
	li	a4,19
	sw	a4,4(a5)
	lw	a4,52(sp)
	lw	a2,20(s0)
	or	a4,a4,a3
	sw	a4,0(a5)
	j	.L885
.L347:
	lw	a3,16(sp)
	srli	a4,s1,23
	addi	a4,a4,4
	slli	a4,a4,2
	add	a4,a3,a4
	lw	a3,0(a4)
	li	a4,4194304
	and	a4,s1,a4
	lw	t0,0(a3)
	srli	s1,s1,14
	beq	a4,zero,.L360
.L855:
	lw	a4,4(sp)
	andi	s1,s1,255
	slli	s1,s1,3
	add	s1,a4,s1
.L361:
	lw	a2,4(t0)
	li	a3,69
	li	a4,0
	bne	a2,a3,.L381
	lw	a0,0(t0)
	mv	a1,s1
	sw	a5,12(sp)
	sw	t1,24(sp)
	sw	t0,8(sp)
	call	luaH_get
.L838:
	lw	a3,4(a0)
	lw	t0,8(sp)
	lw	a5,12(sp)
	mv	a4,a0
	beq	a3,zero,.L381
	lw	a3,0(a0)
	lw	a2,20(s0)
	lw	t1,24(sp)
	sw	a3,0(a5)
	lw	a4,4(a0)
	sw	a4,4(a5)
	j	.L304
.L346:
	srli	t0,s1,23
	li	a4,4194304
	slli	t0,t0,3
	and	a4,s1,a4
	add	t0,t1,t0
	srli	s1,s1,14
	bne	a4,zero,.L855
.L360:
	andi	s1,s1,511
	slli	s1,s1,3
	add	s1,t1,s1
	j	.L361
.L335:
	srli	a4,s1,23
	slli	t0,a4,3
	add	t0,t1,t0
	bge	s1,zero,.L416
	lw	a3,4(sp)
	andi	a4,a4,-257
	slli	a4,a4,3
	add	t0,a3,a4
.L416:
	li	a4,4194304
	and	a4,s1,a4
	srli	s1,s1,14
	beq	a4,zero,.L417
	lw	a3,4(sp)
	andi	s1,s1,255
	slli	a4,s1,3
	add	s1,a3,a4
	lw	a3,4(t0)
	li	a4,3
	bne	a3,a4,.L419
.L905:
	lw	a4,0(t0)
	sw	a4,52(sp)
.L420:
	lw	a3,4(s1)
	li	a4,3
	bne	a3,a4,.L422
	lw	a1,0(s1)
.L423:
	lw	a0,52(sp)
	sw	a5,12(sp)
	sw	t1,8(sp)
	call	__divsi3
	j	.L845
.L336:
	srli	a4,s1,23
	slli	t0,a4,3
	add	t0,t1,t0
	bge	s1,zero,.L508
	lw	a3,4(sp)
	andi	a4,a4,-257
	slli	a4,a4,3
	add	t0,a3,a4
.L508:
	li	a4,4194304
	and	a4,s1,a4
	srli	s1,s1,14
	beq	a4,zero,.L509
	lw	a3,4(sp)
	andi	s1,s1,255
	slli	a4,s1,3
	add	s1,a3,a4
	lw	a3,4(t0)
	li	a4,3
	bne	a3,a4,.L511
.L902:
	lw	a4,0(t0)
	sw	a4,52(sp)
.L512:
	lw	a3,4(s1)
	li	a4,3
	bne	a3,a4,.L514
	lw	a1,0(s1)
.L515:
	lw	a0,52(sp)
	sw	a5,12(sp)
	sw	t1,8(sp)
	call	pow
	j	.L845
.L334:
	srli	a4,s1,23
	slli	t0,a4,3
	add	t0,t1,t0
	bge	s1,zero,.L494
	lw	a3,4(sp)
	andi	a4,a4,-257
	slli	a4,a4,3
	add	t0,a3,a4
.L494:
	li	a4,4194304
	and	a4,s1,a4
	srli	s1,s1,14
	beq	a4,zero,.L495
	lw	a4,4(sp)
	andi	s1,s1,255
	slli	s1,s1,3
	add	s1,a4,s1
	lw	a4,4(t0)
	li	a3,19
	beq	a4,a3,.L900
.L497:
	li	a3,3
	bne	a4,a3,.L498
	lw	a4,0(t0)
	sw	a4,52(sp)
.L503:
	lw	a3,4(s1)
	li	a4,3
	bne	a3,a4,.L505
	lw	a1,0(s1)
.L506:
	lw	a0,52(sp)
	sw	a5,12(sp)
	sw	t1,8(sp)
	call	__divsi3
	call	floor
	j	.L845
.L350:
	srli	a4,s1,23
	sw	a4,0(a5)
	srli	s1,s1,14
	li	a4,1
	sw	a4,4(a5)
	andi	s1,s1,511
	lw	a2,20(s0)
	beq	s1,zero,.L304
	addi	a2,a2,4
	j	.L304
.L348:
	lw	a3,16(sp)
	srli	a4,s1,23
	addi	a4,a4,4
	slli	a4,a4,2
	add	a4,a3,a4
	lw	a4,0(a4)
	lw	a2,20(s0)
	lw	a4,0(a4)
	lw	a3,0(a4)
	sw	a3,0(a5)
	lw	a4,4(a4)
	sw	a4,4(a5)
	j	.L304
.L876:
	lw	a5,0(a5)
	lw	a2,20(s0)
	bne	a5,zero,.L854
	addi	a2,a2,4
	j	.L304
.L875:
	lw	a3,0(a4)
	lw	a2,20(s0)
	bne	a3,zero,.L566
	addi	a2,a2,4
	j	.L304
.L561:
	beq	a3,zero,.L567
	li	a2,1
	beq	a3,a2,.L568
.L841:
	lw	a2,20(s0)
	addi	a2,a2,4
	j	.L304
.L622:
	li	a4,70
	sw	ra,0(a5)
	sw	a4,4(a5)
	j	.L631
.L884:
	lw	a0,0(sp)
	mv	a1,s1
	call	luaC_barrierback_
	lw	a2,8(sp)
	j	.L618
.L546:
	andi	a2,s1,511
	slli	a2,a2,3
	add	a2,t1,a2
	j	.L547
.L427:
	andi	s1,s1,511
	lw	a3,4(t0)
	slli	a4,s1,3
	add	s1,t1,a4
	li	a4,19
	beq	a3,a4,.L901
.L429:
	mv	a0,t0
	li	a2,0
	addi	a1,sp,52
	sw	a5,24(sp)
	sw	t1,12(sp)
	sw	t0,8(sp)
	call	luaV_tointeger
	lw	t0,8(sp)
	lw	t1,12(sp)
	lw	a5,24(sp)
	bne	a0,zero,.L430
.L431:
	li	a4,13
.L843:
	lw	a0,0(sp)
	mv	a2,s1
	mv	a3,a5
	mv	a1,t0
	call	luaT_trybinTM
	lw	t1,16(s0)
	lw	a2,20(s0)
	j	.L885
.L539:
	andi	a2,s1,511
	slli	a2,a2,3
	add	a2,t1,a2
	j	.L540
.L551:
	beq	a4,zero,.L557
	li	a3,1
	bne	a4,a3,.L841
	lw	a5,0(a5)
	lw	a2,20(s0)
	beq	a5,zero,.L854
	addi	a2,a2,4
	j	.L304
.L568:
	lw	a3,0(a4)
	lw	a2,20(s0)
	beq	a3,zero,.L566
	addi	a2,a2,4
	j	.L304
.L509:
	andi	s1,s1,511
	lw	a3,4(t0)
	slli	a4,s1,3
	add	s1,t1,a4
	li	a4,3
	beq	a3,a4,.L902
.L511:
	mv	a0,t0
	addi	a1,sp,52
	sw	a5,24(sp)
	sw	t1,12(sp)
	sw	t0,8(sp)
	call	luaV_tonumber_
	lw	t0,8(sp)
	lw	t1,12(sp)
	lw	a5,24(sp)
	bne	a0,zero,.L512
.L513:
	li	a4,10
	j	.L843
.L481:
	lw	a4,4(t0)
	andi	s1,s1,511
	slli	s1,s1,3
	li	a3,19
	add	s1,t1,s1
	bne	a4,a3,.L483
.L894:
	lw	a3,4(s1)
	beq	a3,a4,.L903
.L484:
	mv	a0,t0
	addi	a1,sp,52
	sw	a5,24(sp)
	sw	t1,12(sp)
	sw	t0,8(sp)
	call	luaV_tonumber_
	lw	t0,8(sp)
	lw	t1,12(sp)
	lw	a5,24(sp)
	bne	a0,zero,.L488
.L489:
	li	a4,9
	j	.L843
.L379:
	andi	s1,s1,511
	slli	s1,s1,3
	add	s1,t1,s1
	j	.L380
.L395:
	lw	a4,4(t0)
	andi	s1,s1,511
	slli	s1,s1,3
	li	a3,19
	add	s1,t1,s1
	bne	a4,a3,.L397
.L896:
	lw	a3,4(s1)
	beq	a3,a4,.L904
.L398:
	mv	a0,t0
	addi	a1,sp,52
	sw	a5,24(sp)
	sw	t1,12(sp)
	sw	t0,8(sp)
	call	luaV_tonumber_
	lw	t0,8(sp)
	lw	t1,12(sp)
	lw	a5,24(sp)
	bne	a0,zero,.L400
.L401:
	li	a4,7
	j	.L843
.L532:
	andi	a2,s1,511
	slli	a2,a2,3
	add	a2,t1,a2
	j	.L533
.L417:
	andi	s1,s1,511
	lw	a3,4(t0)
	slli	a4,s1,3
	add	s1,t1,a4
	li	a4,3
	beq	a3,a4,.L905
.L419:
	mv	a0,t0
	addi	a1,sp,52
	sw	a5,24(sp)
	sw	t1,12(sp)
	sw	t0,8(sp)
	call	luaV_tonumber_
	lw	t0,8(sp)
	lw	t1,12(sp)
	lw	a5,24(sp)
	bne	a0,zero,.L420
.L421:
	li	a4,11
	j	.L843
.L406:
	lw	a4,4(t0)
	andi	s1,s1,511
	slli	s1,s1,3
	li	a3,19
	add	s1,t1,s1
	bne	a4,a3,.L408
.L895:
	lw	a3,4(s1)
	beq	a3,a4,.L906
.L409:
	mv	a0,t0
	addi	a1,sp,52
	sw	a5,24(sp)
	sw	t1,12(sp)
	sw	t0,8(sp)
	call	luaV_tonumber_
	lw	t0,8(sp)
	lw	t1,12(sp)
	lw	a5,24(sp)
	bne	a0,zero,.L411
.L412:
	li	a4,8
	j	.L843
.L469:
	andi	s1,s1,511
	lw	a3,4(t0)
	slli	a4,s1,3
	add	s1,t1,a4
	li	a4,19
	beq	a3,a4,.L907
.L471:
	mv	a0,t0
	li	a2,0
	addi	a1,sp,52
	sw	a5,24(sp)
	sw	t1,12(sp)
	sw	t0,8(sp)
	call	luaV_tointeger
	lw	t0,8(sp)
	lw	t1,12(sp)
	lw	a5,24(sp)
	bne	a0,zero,.L472
.L473:
	li	a4,17
	j	.L843
.L447:
	andi	s1,s1,511
	lw	a3,4(t0)
	slli	a4,s1,3
	add	s1,t1,a4
	li	a4,19
	beq	a3,a4,.L908
.L449:
	mv	a0,t0
	li	a2,0
	addi	a1,sp,52
	sw	a5,24(sp)
	sw	t1,12(sp)
	sw	t0,8(sp)
	call	luaV_tointeger
	lw	t0,8(sp)
	lw	t1,12(sp)
	lw	a5,24(sp)
	bne	a0,zero,.L450
.L451:
	li	a4,15
	j	.L843
.L437:
	andi	s1,s1,511
	lw	a3,4(t0)
	slli	a4,s1,3
	add	s1,t1,a4
	li	a4,19
	beq	a3,a4,.L909
.L439:
	mv	a0,t0
	li	a2,0
	addi	a1,sp,52
	sw	a5,24(sp)
	sw	t1,12(sp)
	sw	t0,8(sp)
	call	luaV_tointeger
	lw	t0,8(sp)
	lw	t1,12(sp)
	lw	a5,24(sp)
	bne	a0,zero,.L440
.L441:
	li	a4,14
	j	.L843
.L457:
	andi	s1,s1,511
	lw	a3,4(t0)
	slli	a4,s1,3
	add	s1,t1,a4
	li	a4,19
	beq	a3,a4,.L910
.L459:
	mv	a0,t0
	li	a2,0
	addi	a1,sp,52
	sw	a5,24(sp)
	sw	t1,12(sp)
	sw	t0,8(sp)
	call	luaV_tointeger
	lw	t0,8(sp)
	lw	t1,12(sp)
	lw	a5,24(sp)
	bne	a0,zero,.L460
.L461:
	li	a4,16
	j	.L843
.L384:
	lw	a4,4(t0)
	andi	s1,s1,511
	slli	s1,s1,3
	li	a3,19
	add	s1,t1,s1
	bne	a4,a3,.L386
.L897:
	lw	a3,4(s1)
	beq	a3,a4,.L911
.L387:
	mv	a0,t0
	addi	a1,sp,52
	sw	a5,24(sp)
	sw	t1,12(sp)
	sw	t0,8(sp)
	call	luaV_tonumber_
	lw	t0,8(sp)
	lw	t1,12(sp)
	lw	a5,24(sp)
	bne	a0,zero,.L389
.L390:
	li	a4,6
	j	.L843
.L495:
	lw	a4,4(t0)
	andi	s1,s1,511
	slli	s1,s1,3
	li	a3,19
	add	s1,t1,s1
	bne	a4,a3,.L497
.L900:
	lw	a3,4(s1)
	beq	a3,a4,.L912
.L498:
	mv	a0,t0
	addi	a1,sp,52
	sw	a5,24(sp)
	sw	t1,12(sp)
	sw	t0,8(sp)
	call	luaV_tonumber_
	lw	t0,8(sp)
	lw	t1,12(sp)
	lw	a5,24(sp)
	bne	a0,zero,.L503
.L504:
	li	a4,12
	j	.L843
.L522:
	li	a2,0
	addi	a1,sp,56
	mv	a0,s1
	sw	a5,8(sp)
	sw	t1,12(sp)
	call	luaV_tointeger
	lw	a5,8(sp)
	beq	a0,zero,.L524
	lw	a4,56(sp)
	lw	t1,12(sp)
	j	.L523
.L585:
	lw	a2,20(s0)
	j	.L303
.L610:
	mv	a0,a5
	addi	a1,sp,48
	sw	t1,24(sp)
	sw	a3,12(sp)
	sw	a5,8(sp)
	call	luaV_tonumber_
	lw	a5,8(sp)
	lw	a3,12(sp)
	lw	t1,24(sp)
	beq	a0,zero,.L913
	lw	a4,48(sp)
	j	.L611
.L607:
	addi	a0,a5,16
	addi	a1,sp,56
	sw	t1,12(sp)
	sw	a5,8(sp)
	call	luaV_tonumber_
	lw	a5,8(sp)
	lw	t1,12(sp)
	beq	a0,zero,.L914
	lw	a3,56(sp)
	j	.L608
.L604:
	addi	a1,sp,52
	mv	a0,t0
	sw	a5,12(sp)
	sw	t1,8(sp)
	call	luaV_tonumber_
	lw	t1,8(sp)
	lw	a5,12(sp)
	beq	a0,zero,.L915
	lw	a3,52(sp)
	j	.L605
.L422:
	addi	a1,sp,56
	mv	a0,s1
	sw	a5,12(sp)
	sw	t0,8(sp)
	sw	t1,24(sp)
	call	luaV_tonumber_
	lw	t0,8(sp)
	lw	a5,12(sp)
	beq	a0,zero,.L421
	lw	a1,56(sp)
	lw	t1,24(sp)
	j	.L423
.L462:
	li	a2,0
	addi	a1,sp,56
	mv	a0,s1
	sw	a5,12(sp)
	sw	t0,8(sp)
	sw	t1,24(sp)
	call	luaV_tointeger
	lw	t0,8(sp)
	lw	a5,12(sp)
	beq	a0,zero,.L461
	lw	a4,56(sp)
	lw	t1,24(sp)
	lw	a2,52(sp)
	bge	a4,zero,.L464
.L890:
	li	a1,-31
	li	a3,0
	blt	a4,a1,.L477
	neg	a4,a4
	srl	a3,a2,a4
	li	a4,19
	sw	a3,0(a5)
	sw	a4,4(a5)
	j	.L891
.L514:
	addi	a1,sp,56
	mv	a0,s1
	sw	a5,12(sp)
	sw	t0,8(sp)
	sw	t1,24(sp)
	call	luaV_tonumber_
	lw	t0,8(sp)
	lw	a5,12(sp)
	beq	a0,zero,.L513
	lw	a1,56(sp)
	lw	t1,24(sp)
	j	.L515
.L452:
	li	a2,0
	addi	a1,sp,56
	mv	a0,s1
	sw	a5,12(sp)
	sw	t0,8(sp)
	sw	t1,24(sp)
	call	luaV_tointeger
	lw	t0,8(sp)
	lw	a5,12(sp)
	beq	a0,zero,.L451
	lw	a3,56(sp)
	lw	t1,24(sp)
	j	.L453
.L432:
	li	a2,0
	addi	a1,sp,56
	mv	a0,s1
	sw	a5,12(sp)
	sw	t0,8(sp)
	sw	t1,24(sp)
	call	luaV_tointeger
	lw	t0,8(sp)
	lw	a5,12(sp)
	beq	a0,zero,.L431
	lw	a3,56(sp)
	lw	t1,24(sp)
	j	.L433
.L442:
	li	a2,0
	addi	a1,sp,56
	mv	a0,s1
	sw	a5,12(sp)
	sw	t0,8(sp)
	sw	t1,24(sp)
	call	luaV_tointeger
	lw	t0,8(sp)
	lw	a5,12(sp)
	beq	a0,zero,.L441
	lw	a3,56(sp)
	lw	t1,24(sp)
	j	.L443
.L474:
	li	a2,0
	addi	a1,sp,56
	mv	a0,s1
	sw	a5,12(sp)
	sw	t0,8(sp)
	sw	t1,24(sp)
	call	luaV_tointeger
	lw	t0,8(sp)
	lw	a5,12(sp)
	beq	a0,zero,.L473
	lw	a4,56(sp)
	lw	t1,24(sp)
	lw	a2,52(sp)
	ble	a4,zero,.L476
.L889:
	li	a1,31
	li	a3,0
	bgt	a4,a1,.L477
	srl	a3,a2,a4
	li	a4,19
	sw	a3,0(a5)
	sw	a4,4(a5)
	j	.L891
.L505:
	addi	a1,sp,56
	mv	a0,s1
	sw	a5,12(sp)
	sw	t0,8(sp)
	sw	t1,24(sp)
	call	luaV_tonumber_
	lw	t0,8(sp)
	lw	a5,12(sp)
	beq	a0,zero,.L504
	lw	a1,56(sp)
	lw	t1,24(sp)
	j	.L506
.L490:
	addi	a1,sp,56
	mv	a0,s1
	sw	a5,12(sp)
	sw	t0,8(sp)
	sw	t1,24(sp)
	call	luaV_tonumber_
	lw	t0,8(sp)
	lw	a5,12(sp)
	beq	a0,zero,.L489
	lw	s1,56(sp)
	lw	t1,24(sp)
	j	.L491
.L878:
	lw	a3,20(a5)
	bne	a3,a4,.L591
	lw	a3,16(a5)
	addi	a1,sp,44
	mv	a0,t0
	slti	a2,a3,0
	addi	a2,a2,1
	sw	t1,28(sp)
	sw	a5,24(sp)
	sw	t0,12(sp)
	sw	a3,8(sp)
	call	luaV_tointeger
	lw	a5,24(sp)
	lw	t1,28(sp)
	bne	a0,zero,.L826
	lw	a2,12(a5)
	li	a4,3
	lw	a3,8(sp)
	lw	t0,12(sp)
	bne	a2,a4,.L594
	lw	a4,8(a5)
	sw	a4,56(sp)
	ble	a4,zero,.L597
.L919:
	li	a4,-2147483648
	xori	a4,a4,-1
	sw	a4,44(sp)
	blt	a3,zero,.L598
.L602:
	lw	a3,0(a5)
.L601:
	lw	a1,16(a5)
	li	a2,19
	sw	a4,8(a5)
	sub	a3,a3,a1
	sw	a2,12(a5)
	sw	a3,0(a5)
	sw	a2,4(a5)
	j	.L603
.L911:
	lw	a2,0(s1)
	lw	a4,0(t0)
	sw	a3,4(a5)
	add	a4,a4,a2
	sw	a4,0(a5)
	lw	a2,20(s0)
	j	.L885
.L912:
	lw	a1,0(s1)
	li	a3,1
	lw	a4,0(t0)
	addi	a2,a1,1
	bgtu	a2,a3,.L499
	beq	a1,zero,.L916
	neg	s1,a4
.L501:
	li	a4,19
	lw	a2,20(s0)
	sw	s1,0(a5)
	sw	a4,4(a5)
	j	.L885
.L886:
	lw	a3,0(s1)
	sw	a4,4(a5)
	lw	a2,20(s0)
	neg	a4,a3
	sw	a4,0(a5)
	j	.L885
.L898:
	lw	a3,0(sp)
	lw	a5,28(a3)
	lw	a3,12(a3)
	sub	a5,a5,a3
	srai	a5,a5,3
	ble	a5,s1,.L917
.L635:
	lw	t1,16(s0)
	slli	a3,s1,3
	mv	a1,s1
	add	a5,t1,a2
	lw	a2,0(sp)
	add	a3,a5,a3
	sw	a3,12(a2)
	j	.L634
.L880:
	lw	a1,16(s0)
	lw	a0,0(sp)
	slli	a5,a5,3
	addi	a5,a5,-8
	add	a1,a1,a5
	call	luaF_close
	lw	a2,20(s0)
	j	.L550
.L904:
	lw	a2,0(s1)
	lw	a4,0(t0)
	sw	a3,4(a5)
	sub	a4,a4,a2
	sw	a4,0(a5)
	lw	a2,20(s0)
	j	.L885
.L906:
	lw	a1,0(s1)
	lw	a0,0(t0)
	sw	a5,24(sp)
	sw	t1,12(sp)
	sw	a3,8(sp)
	call	__mulsi3
	lw	a5,24(sp)
	lw	a3,8(sp)
	lw	t1,12(sp)
	lw	a2,20(s0)
	sw	a0,0(a5)
	sw	a3,4(a5)
	j	.L885
.L903:
	lw	s1,0(s1)
	li	a4,1
	lw	a3,0(t0)
	addi	a2,s1,1
	bgtu	a2,a4,.L485
	beq	s1,zero,.L918
	li	a4,0
	j	.L847
.L887:
	lw	a0,0(t0)
	sw	a5,12(sp)
	sw	t1,24(sp)
	sw	t0,8(sp)
	call	luaH_getstr
	j	.L838
.L882:
	lw	a3,0(a5)
	add	a3,a2,a3
	ble	a2,zero,.L587
	sgt	a4,a3,a4
	xori	a4,a4,1
.L588:
	lw	a2,20(s0)
	beq	a4,zero,.L304
	li	a1,1073610752
	srli	a4,s1,14
	addi	a1,a1,1
	add	a4,a4,a1
	slli	a4,a4,2
	add	a2,a2,a4
	li	a4,19
	sw	a3,0(a5)
	sw	a3,24(a5)
	sw	a4,28(a5)
	j	.L304
.L881:
	lw	a1,16(s0)
	slli	a5,a3,3
	lw	a0,0(sp)
	addi	a5,a5,-8
	add	a1,a1,a5
	sw	t1,8(sp)
	call	luaF_close
	lw	t1,8(sp)
	j	.L529
.L899:
	mv	a0,a4
	sw	a5,28(sp)
	sw	t1,24(sp)
	call	luaO_fb2int
	sw	a0,12(sp)
	lw	a0,8(sp)
	call	luaO_fb2int
	mv	a3,a0
	lw	a2,12(sp)
	lw	a0,0(sp)
	mv	a1,s1
	call	luaH_resize
	lw	a5,28(sp)
	lw	t1,24(sp)
	j	.L631
.L883:
	lw	a0,0(sp)
	sw	a5,32(sp)
	sw	t1,28(sp)
	sw	a3,24(sp)
	sw	a2,12(sp)
	sw	a1,8(sp)
	call	luaH_resizearray
	lw	a5,32(sp)
	lw	t1,28(sp)
	lw	a3,24(sp)
	lw	a2,12(sp)
	lw	a1,8(sp)
	j	.L616
.L402:
	addi	a1,sp,56
	mv	a0,s1
	sw	a5,12(sp)
	sw	t0,8(sp)
	sw	t1,24(sp)
	call	luaV_tonumber_
	lw	t0,8(sp)
	lw	a5,12(sp)
	beq	a0,zero,.L401
	lw	a3,56(sp)
	lw	t1,24(sp)
	j	.L403
.L391:
	addi	a1,sp,56
	mv	a0,s1
	sw	a5,12(sp)
	sw	t0,8(sp)
	sw	t1,24(sp)
	call	luaV_tonumber_
	lw	t0,8(sp)
	lw	a5,12(sp)
	beq	a0,zero,.L390
	lw	a3,56(sp)
	lw	t1,24(sp)
	j	.L392
.L519:
	addi	a1,sp,56
	mv	a0,s1
	sw	a5,8(sp)
	sw	t1,12(sp)
	call	luaV_tonumber_
	lw	a5,8(sp)
	beq	a0,zero,.L521
	lw	a4,56(sp)
	lw	t1,12(sp)
	neg	a4,a4
	j	.L846
.L413:
	addi	a1,sp,56
	mv	a0,s1
	sw	a5,12(sp)
	sw	t0,8(sp)
	sw	t1,24(sp)
	call	luaV_tonumber_
	lw	t0,8(sp)
	lw	a5,12(sp)
	beq	a0,zero,.L412
	lw	a1,56(sp)
	lw	t1,24(sp)
	j	.L414
.L589:
	slt	a4,a3,a4
	xori	a4,a4,1
	j	.L590
.L524:
	li	a4,19
.L844:
	lw	a0,0(sp)
	mv	a2,s1
	mv	a3,a5
	mv	a1,s1
	call	luaT_trybinTM
	lw	t1,16(s0)
	lw	a2,20(s0)
	j	.L885
.L587:
	slt	a4,a3,a4
	xori	a4,a4,1
	j	.L588
.L917:
	lw	a0,0(sp)
	mv	a1,s1
	sw	a4,12(sp)
	sw	a2,8(sp)
	call	luaD_growstack
	lw	a4,12(sp)
	lw	a2,8(sp)
	j	.L635
.L521:
	li	a4,18
	j	.L844
.L656:
	li	a4,0
	j	.L636
.L825:
	lw	ra,68(sp)
	lw	s0,64(sp)
	lw	s1,60(sp)
	addi	sp,sp,72
	jr	ra
.L499:
	mv	a0,a4
	sw	a5,28(sp)
	sw	t1,24(sp)
	sw	a1,12(sp)
	sw	a4,8(sp)
	call	__divsi3
	lw	a4,8(sp)
	lw	a1,12(sp)
	lw	t1,24(sp)
	lw	a5,28(sp)
	xor	a3,a4,a1
	mv	s1,a0
	bge	a3,zero,.L501
	mv	a0,a4
	sw	a5,12(sp)
	sw	t1,8(sp)
	call	__modsi3
	snez	a4,a0
	lw	a5,12(sp)
	lw	t1,8(sp)
	sub	s1,s1,a4
	j	.L501
.L893:
	sw	a0,8(sp)
	lw	a0,0(sp)
	sw	t1,12(sp)
	call	luaC_barrierback_
	lw	t1,12(sp)
	lw	a4,8(sp)
	j	.L376
.L485:
	mv	a1,s1
	mv	a0,a3
	sw	a5,24(sp)
	sw	t1,12(sp)
	sw	a3,8(sp)
	call	__modsi3
	lw	t1,12(sp)
	lw	a5,24(sp)
	mv	a4,a0
	beq	a0,zero,.L847
	lw	a3,8(sp)
	xor	a3,a3,s1
	bge	a3,zero,.L847
	add	a4,a0,s1
	j	.L847
.L621:
	lw	a0,0(sp)
	mv	a1,a3
	sw	a5,32(sp)
	sw	t1,24(sp)
	sw	t0,12(sp)
	sw	a3,8(sp)
	call	luaF_newLclosure
	lw	t0,12(sp)
	lw	a5,32(sp)
	lw	a3,8(sp)
	sw	t0,12(a0)
	li	a4,70
	sw	a0,28(sp)
	sw	a0,0(a5)
	sw	a4,4(a5)
	lw	t1,24(sp)
	ble	a3,zero,.L627
	addi	a2,s1,4
	j	.L642
.L572:
	lw	a5,0(sp)
	lw	s0,20(a5)
	lw	a2,20(s0)
	j	.L303
.L594:
	mv	a0,t0
	addi	a1,sp,56
	sw	a5,28(sp)
	sw	t1,24(sp)
	sw	t0,8(sp)
	sw	a3,12(sp)
	call	luaV_tonumber_
	lw	t0,8(sp)
	lw	t1,24(sp)
	lw	a5,28(sp)
	beq	a0,zero,.L591
	lw	a4,56(sp)
	lw	a3,12(sp)
	bgt	a4,zero,.L919
.L597:
	li	a4,-2147483648
	sw	a4,44(sp)
	blt	a3,zero,.L600
.L598:
	li	a3,0
	j	.L601
.L826:
	lw	a4,44(sp)
	j	.L602
.L879:
	lw	a1,16(s0)
	sw	t2,12(sp)
	sw	t0,8(sp)
	sw	a3,4(sp)
	call	luaF_close
	lw	a3,4(sp)
	lw	t2,12(sp)
	lw	t0,8(sp)
	lw	a2,16(a3)
	j	.L577
.L600:
	li	a4,-2147483648
	j	.L602
.L913:
	lw	s1,0(sp)
	lla	a1,.LC9
	mv	a0,s1
	call	luaG_runerror
.L918:
	lw	s1,0(sp)
	lla	a1,.LC6
	mv	a0,s1
	call	luaG_runerror
.L916:
	lw	s1,0(sp)
	lla	a1,.LC5
	mv	a0,s1
	call	luaG_runerror
.L915:
	lw	s1,0(sp)
	lla	a1,.LC7
	mv	a0,s1
	call	luaG_runerror
.L914:
	lw	s1,0(sp)
	lla	a1,.LC8
	mv	a0,s1
	call	luaG_runerror
	.size	luaV_execute, .-luaV_execute
	.hidden	luaD_growstack
	.hidden	luaH_resizearray
	.hidden	luaH_resize
	.hidden	luaO_fb2int
	.hidden	luaH_getstr
	.hidden	luaH_new
	.hidden	luaC_upvalbarrier_
	.hidden	luaD_call
	.hidden	luaH_setint
	.hidden	luaC_step
	.hidden	luaD_poscall
	.hidden	luaF_close
	.hidden	luaD_precall
	.hidden	luaG_traceexec
	.hidden	luaF_findupval
	.hidden	luaF_newLclosure
	.hidden	luaH_getn
	.hidden	luaS_newlstr
	.hidden	luaS_createlngstrobj
	.hidden	luaO_tostring
	.hidden	luaT_trybinTM
	.hidden	luaS_eqlngstr
	.hidden	luaG_ordererror
	.hidden	luaT_callorderTM
	.hidden	luaH_newkey
	.hidden	luaC_barrierback_
	.hidden	luaO_nilobject_
	.hidden	luaG_typeerror
	.hidden	luaG_runerror
	.hidden	luaH_get
	.hidden	luaT_callTM
	.hidden	luaT_gettmbyobj
	.hidden	luaT_gettm
	.hidden	luaO_str2num
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
