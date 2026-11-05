#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"lapi.c"
	.option nopic
	.text
	.section	.text.index2addr,"ax",@progbits
	.align	2
	.type	index2addr, @function
index2addr:
	lw	a4,20(a0)
	ble	a1,zero,.L2
	lw	a5,0(a4)
	lw	a4,12(a0)
	slli	a1,a1,3
	add	a0,a5,a1
	bgtu	a4,a0,.L1
	lla	a0,luaO_nilobject_
	ret
.L2:
	li	a5,-999424
	addi	a3,a5,-1575
	bge	a1,a3,.L9
	addi	a5,a5,-1576
	beq	a1,a5,.L10
	lw	a4,0(a4)
	li	a2,22
	lla	a0,luaO_nilobject_
	lw	t1,4(a4)
	bne	t1,a2,.L11
.L1:
	ret
.L11:
	lw	a4,0(a4)
	sub	a5,a5,a1
	lbu	a2,6(a4)
	blt	a2,a5,.L1
	sub	a3,a3,a1
	slli	a3,a3,3
	add	a0,a4,a3
	ret
.L9:
	lw	a0,12(a0)
	slli	a1,a1,3
	add	a0,a0,a1
	ret
.L10:
	lw	a0,16(a0)
	addi	a0,a0,36
	ret
	.size	index2addr, .-index2addr
	.section	.text.growstack,"ax",@progbits
	.align	2
	.type	growstack, @function
growstack:
	lw	a1,0(a1)
	tail	luaD_growstack
	.size	growstack, .-growstack
	.section	.text.auxgetstr,"ax",@progbits
	.align	2
	.type	auxgetstr, @function
auxgetstr:
	addi	sp,sp,-16
	sw	s1,4(sp)
	mv	s1,a1
	mv	a1,a2
	sw	s0,8(sp)
	sw	ra,12(sp)
	mv	s0,a0
	call	luaS_new
	lw	a2,4(s1)
	li	a3,69
	mv	a5,a0
	li	a4,0
	beq	a2,a3,.L22
.L14:
	lw	a3,12(s0)
	mv	a0,s0
	mv	a1,s1
	sw	a5,0(a3)
	lbu	a5,4(a5)
	addi	a2,a3,8
	ori	a5,a5,64
	sw	a5,4(a3)
	sw	a2,12(s0)
	mv	a2,a3
	call	luaV_finishget
	lw	a5,12(s0)
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	a0,-4(a5)
	lw	s1,4(sp)
	andi	a0,a0,15
	addi	sp,sp,16
	jr	ra
.L22:
	lw	a0,0(s1)
	mv	a1,a5
	sw	a5,0(sp)
	call	luaH_getstr
	lw	a3,4(a0)
	lw	a5,0(sp)
	mv	a4,a0
	beq	a3,zero,.L14
	lw	a3,12(s0)
	lw	a2,0(a0)
	lw	ra,12(sp)
	addi	a5,a3,8
	sw	a2,0(a3)
	lw	a4,4(a0)
	lw	s1,4(sp)
	sw	a4,4(a3)
	lw	a0,-4(a5)
	sw	a5,12(s0)
	lw	s0,8(sp)
	andi	a0,a0,15
	addi	sp,sp,16
	jr	ra
	.size	auxgetstr, .-auxgetstr
	.section	.text.auxsetstr,"ax",@progbits
	.align	2
	.type	auxsetstr, @function
auxsetstr:
	addi	sp,sp,-16
	sw	s1,4(sp)
	mv	s1,a1
	mv	a1,a2
	sw	s0,8(sp)
	sw	ra,12(sp)
	mv	s0,a0
	call	luaS_new
	lw	a2,4(s1)
	li	a3,69
	mv	a5,a0
	li	a4,0
	beq	a2,a3,.L42
.L24:
	lw	a2,12(s0)
	mv	a1,s1
	sw	a5,0(a2)
	lbu	a5,4(a5)
	addi	a0,a2,8
	addi	a3,a2,-8
	ori	a5,a5,64
	sw	a5,4(a2)
	sw	a0,12(s0)
	mv	a0,s0
	call	luaV_finishset
	lw	a5,12(s0)
	lw	ra,12(sp)
	lw	s1,4(sp)
	addi	a5,a5,-16
	sw	a5,12(s0)
	lw	s0,8(sp)
	addi	sp,sp,16
	jr	ra
.L42:
	lw	a0,0(s1)
	mv	a1,a5
	sw	a5,0(sp)
	call	luaH_getstr
	lw	a3,4(a0)
	lw	a5,0(sp)
	mv	a4,a0
	beq	a3,zero,.L24
	lw	a3,12(s0)
	lw	a5,-4(a3)
	andi	a5,a5,64
	beq	a5,zero,.L25
	lw	a1,0(s1)
	lbu	a5,5(a1)
	andi	a5,a5,4
	beq	a5,zero,.L25
	lw	a5,-8(a3)
	lbu	a5,5(a5)
	andi	a5,a5,3
	beq	a5,zero,.L25
	sw	a0,0(sp)
	mv	a0,s0
	call	luaC_barrierback_
	lw	a3,12(s0)
	lw	a4,0(sp)
.L25:
	lw	a2,-8(a3)
	addi	a5,a3,-8
	lw	ra,12(sp)
	sw	a2,0(a4)
	lw	a3,-4(a3)
	lw	s1,4(sp)
	sw	a3,4(a4)
	sw	a5,12(s0)
	lw	s0,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	auxsetstr, .-auxsetstr
	.section	.text.f_call,"ax",@progbits
	.align	2
	.type	f_call, @function
f_call:
	lw	a2,4(a1)
	lw	a1,0(a1)
	tail	luaD_callnoyield
	.size	f_call, .-f_call
	.section	.text.lua_checkstack,"ax",@progbits
	.align	2
	.globl	lua_checkstack
	.hidden	lua_checkstack
	.type	lua_checkstack, @function
lua_checkstack:
	lw	a4,12(a0)
	lw	a5,28(a0)
	addi	sp,sp,-16
	sw	s1,4(sp)
	sub	a5,a5,a4
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	a1,0(sp)
	srai	a5,a5,3
	lw	s1,20(a0)
	bgt	a5,a1,.L45
	lw	a5,32(a0)
	mv	s0,a0
	sub	a5,a4,a5
	li	a4,999424
	srai	a5,a5,3
	addi	a4,a4,576
	sub	a4,a4,a1
	addi	a5,a5,5
	bge	a4,a5,.L46
.L48:
	li	a0,0
.L44:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L46:
	mv	a2,sp
	lla	a1,growstack
	call	luaD_rawrunprotected
	bne	a0,zero,.L48
	lw	a4,12(s0)
	lw	a1,0(sp)
.L45:
	lw	a5,4(s1)
	slli	a1,a1,3
	add	a4,a4,a1
	li	a0,1
	bgeu	a5,a4,.L44
	lw	ra,12(sp)
	lw	s0,8(sp)
	sw	a4,4(s1)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
	.size	lua_checkstack, .-lua_checkstack
	.section	.text.lua_xmove,"ax",@progbits
	.align	2
	.globl	lua_xmove
	.hidden	lua_xmove
	.type	lua_xmove, @function
lua_xmove:
	beq	a0,a1,.L51
	lw	a5,12(a0)
	slli	a4,a2,3
	sub	a5,a5,a4
	sw	a5,12(a0)
	ble	a2,zero,.L51
	lw	a4,12(a1)
	li	a3,0
	j	.L53
.L54:
	lw	a5,12(a0)
.L53:
	slli	t1,a3,3
	add	a5,a5,t1
	lw	t1,0(a5)
	addi	a4,a4,8
	addi	a3,a3,1
	sw	t1,-8(a4)
	lw	a5,4(a5)
	sw	a5,-4(a4)
	sw	a4,12(a1)
	bne	a2,a3,.L54
.L51:
	ret
	.size	lua_xmove, .-lua_xmove
	.section	.text.lua_atpanic,"ax",@progbits
	.align	2
	.globl	lua_atpanic
	.hidden	lua_atpanic
	.type	lua_atpanic, @function
lua_atpanic:
	lw	a5,16(a0)
	lw	a0,108(a5)
	sw	a1,108(a5)
	ret
	.size	lua_atpanic, .-lua_atpanic
	.section	.text.lua_version,"ax",@progbits
	.align	2
	.globl	lua_version
	.hidden	lua_version
	.type	lua_version, @function
lua_version:
	beq	a0,zero,.L58
	lw	a5,16(a0)
	lw	a0,116(a5)
	ret
.L58:
	lla	a0,.LANCHOR0
	ret
	.size	lua_version, .-lua_version
	.section	.text.lua_absindex,"ax",@progbits
	.align	2
	.globl	lua_absindex
	.hidden	lua_absindex
	.type	lua_absindex, @function
lua_absindex:
	li	a5,999424
	addi	a5,a5,1575
	add	a4,a1,a5
	bgtu	a4,a5,.L60
	lw	a4,20(a0)
	lw	a5,12(a0)
	lw	a4,0(a4)
	sub	a5,a5,a4
	srai	a5,a5,3
	add	a1,a1,a5
.L60:
	mv	a0,a1
	ret
	.size	lua_absindex, .-lua_absindex
	.section	.text.lua_gettop,"ax",@progbits
	.align	2
	.globl	lua_gettop
	.hidden	lua_gettop
	.type	lua_gettop, @function
lua_gettop:
	lw	a5,20(a0)
	lw	a0,12(a0)
	lw	a5,0(a5)
	addi	a5,a5,8
	sub	a0,a0,a5
	srai	a0,a0,3
	ret
	.size	lua_gettop, .-lua_gettop
	.section	.text.lua_settop,"ax",@progbits
	.align	2
	.globl	lua_settop
	.hidden	lua_settop
	.type	lua_settop, @function
lua_settop:
	lw	a3,12(a0)
	addi	a5,a1,1
	slli	a5,a5,3
	add	a4,a3,a5
	blt	a1,zero,.L66
	lw	a4,20(a0)
	lw	a4,0(a4)
	add	a4,a4,a5
	bgeu	a3,a4,.L66
	mv	a5,a3
.L65:
	addi	a5,a5,8
	sw	zero,-4(a5)
	bltu	a5,a4,.L65
	sub	a5,a4,a3
	addi	a5,a5,-1
	andi	a5,a5,-8
	add	a3,a3,a5
	sw	zero,4(a3)
.L66:
	sw	a4,12(a0)
	ret
	.size	lua_settop, .-lua_settop
	.section	.text.lua_rotate,"ax",@progbits
	.align	2
	.globl	lua_rotate
	.hidden	lua_rotate
	.type	lua_rotate, @function
lua_rotate:
	addi	sp,sp,-20
	sw	s1,8(sp)
	lw	s1,12(a0)
	sw	s0,12(sp)
	mv	s0,a2
	sw	ra,16(sp)
	addi	s1,s1,-8
	call	index2addr
	blt	s0,zero,.L69
	slli	a5,s0,3
	sub	a5,s1,a5
.L70:
	mv	a3,a5
	mv	a4,a0
	bleu	a5,a0,.L74
.L71:
	lw	t1,0(a3)
	lw	a1,0(a4)
	lw	a2,4(a4)
	sw	t1,0(a4)
	lw	t1,4(a3)
	sw	a1,0(sp)
	sw	a2,4(sp)
	sw	t1,4(a4)
	sw	a1,0(a3)
	sw	a2,4(a3)
	addi	a4,a4,8
	addi	a3,a3,-8
	bltu	a4,a3,.L71
.L74:
	addi	a5,a5,8
	mv	a4,s1
	bgeu	a5,s1,.L86
.L72:
	lw	a1,0(a4)
	lw	a2,0(a5)
	lw	a3,4(a5)
	sw	a1,0(a5)
	lw	a1,4(a4)
	sw	a2,0(sp)
	sw	a3,4(sp)
	sw	a1,4(a5)
	sw	a2,0(a4)
	sw	a3,4(a4)
	addi	a5,a5,8
	addi	a4,a4,-8
	bltu	a5,a4,.L72
.L86:
	bgeu	a0,s1,.L87
.L75:
	lw	a3,0(s1)
	lw	a4,0(a0)
	lw	a5,4(a0)
	sw	a3,0(a0)
	lw	a3,4(s1)
	sw	a4,0(sp)
	sw	a5,4(sp)
	sw	a3,4(a0)
	sw	a4,0(s1)
	sw	a5,4(s1)
	addi	a0,a0,8
	addi	s1,s1,-8
	bltu	a0,s1,.L75
.L87:
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L69:
	not	a5,s0
	slli	a5,a5,3
	add	a5,a0,a5
	j	.L70
	.size	lua_rotate, .-lua_rotate
	.section	.text.lua_copy,"ax",@progbits
	.align	2
	.globl	lua_copy
	.hidden	lua_copy
	.type	lua_copy, @function
lua_copy:
	lw	a3,20(a0)
	ble	a1,zero,.L89
	lw	a5,0(a3)
	lw	a4,12(a0)
	slli	a1,a1,3
	add	a5,a5,a1
	bltu	a5,a4,.L115
	lla	a5,luaO_nilobject_
.L115:
	ble	a2,zero,.L117
.L141:
	lw	a4,0(a3)
	lw	a3,12(a0)
	slli	a2,a2,3
	add	a2,a4,a2
	bltu	a2,a3,.L120
	lla	a2,luaO_nilobject_
.L120:
	lw	a4,0(a5)
	sw	a4,0(a2)
	lw	a5,4(a5)
	sw	a5,4(a2)
	ret
.L89:
	li	a5,-999424
	addi	t1,a5,-1575
	bge	a1,t1,.L135
	addi	a4,a5,-1576
	beq	a1,a4,.L136
	lw	t0,0(a3)
	addi	sp,sp,-4
	sw	s0,0(sp)
	lw	s0,4(t0)
	li	t2,22
	lla	a5,luaO_nilobject_
	beq	s0,t2,.L90
	lw	t0,0(t0)
	sub	a4,a4,a1
	lbu	t2,6(t0)
	bgt	a4,t2,.L90
	sub	t1,t1,a1
	slli	t1,t1,3
	add	a5,t0,t1
.L90:
	ble	a2,zero,.L93
	lw	a4,0(a3)
	lw	a3,12(a0)
	slli	a2,a2,3
	add	a2,a4,a2
	bltu	a2,a3,.L94
	lla	a2,luaO_nilobject_
.L94:
	lw	a4,0(a5)
	sw	a4,0(a2)
	lw	a5,4(a5)
	sw	a5,4(a2)
.L88:
	lw	s0,0(sp)
	addi	sp,sp,4
	jr	ra
.L93:
	li	a4,-999424
	addi	a1,a4,-1575
	bge	a2,a1,.L137
	addi	a4,a4,-1576
	beq	a2,a4,.L138
	lw	t1,0(a3)
	li	t0,22
	lla	a3,luaO_nilobject_
	lw	t2,4(t1)
	beq	t2,t0,.L99
	lw	t0,0(t1)
	sub	a4,a4,a2
	lbu	t2,6(t0)
	bgt	a4,t2,.L99
	sub	a1,a1,a2
	slli	a1,a1,3
	add	a3,t0,a1
.L99:
	lw	a4,0(a5)
	sw	a4,0(a3)
	lw	a4,4(a5)
	sw	a4,4(a3)
	lw	a4,4(a5)
	andi	a4,a4,64
	beq	a4,zero,.L88
	lw	a1,0(t1)
	lbu	a4,5(a1)
	andi	a4,a4,4
	beq	a4,zero,.L88
	lw	a2,0(a5)
	lbu	a5,5(a2)
	andi	a5,a5,3
	beq	a5,zero,.L88
	lw	s0,0(sp)
	addi	sp,sp,4
	tail	luaC_barrier_
.L117:
	li	a4,-999424
	addi	a1,a4,-1575
	bge	a2,a1,.L139
	addi	a4,a4,-1576
	beq	a2,a4,.L140
	lw	t1,0(a3)
	li	t0,22
	lla	a3,luaO_nilobject_
	lw	t2,4(t1)
	beq	t2,t0,.L126
	lw	t0,0(t1)
	sub	a4,a4,a2
	lbu	t2,6(t0)
	bgt	a4,t2,.L126
	sub	a1,a1,a2
	slli	a1,a1,3
	add	a3,t0,a1
.L126:
	lw	a4,0(a5)
	sw	a4,0(a3)
	lw	a4,4(a5)
	sw	a4,4(a3)
	lw	a4,4(a5)
	andi	a4,a4,64
	bne	a4,zero,.L132
	ret
.L135:
	lw	a5,12(a0)
	slli	a1,a1,3
	add	a5,a5,a1
	bgt	a2,zero,.L141
	j	.L117
.L137:
	lw	a4,12(a0)
	slli	a2,a2,3
	add	a4,a4,a2
.L97:
	lw	a3,0(a5)
	sw	a3,0(a4)
	lw	a5,4(a5)
	sw	a5,4(a4)
	j	.L88
.L136:
	lw	a5,16(a0)
	addi	a5,a5,36
	bgt	a2,zero,.L141
	j	.L117
.L138:
	lw	a4,16(a0)
	addi	a4,a4,36
	j	.L97
.L140:
	lw	a4,16(a0)
	addi	a4,a4,36
.L123:
	lw	a3,0(a5)
	sw	a3,0(a4)
	lw	a5,4(a5)
	sw	a5,4(a4)
	ret
.L132:
	lw	a1,0(t1)
	lbu	a4,5(a1)
	andi	a4,a4,4
	beq	a4,zero,.L130
	lw	a2,0(a5)
	lbu	a5,5(a2)
	andi	a5,a5,3
	bne	a5,zero,.L142
.L130:
	ret
.L142:
	tail	luaC_barrier_
.L139:
	lw	a4,12(a0)
	slli	a2,a2,3
	add	a4,a4,a2
	j	.L123
	.size	lua_copy, .-lua_copy
	.section	.text.lua_pushvalue,"ax",@progbits
	.align	2
	.globl	lua_pushvalue
	.hidden	lua_pushvalue
	.type	lua_pushvalue, @function
lua_pushvalue:
	lw	a2,12(a0)
	lw	a3,20(a0)
	ble	a1,zero,.L144
	lw	a5,0(a3)
	slli	a1,a1,3
	add	a5,a5,a1
	bgtu	a2,a5,.L145
	lla	a5,luaO_nilobject_
.L145:
	lw	a3,0(a5)
	addi	a4,a2,8
	sw	a3,0(a2)
	lw	a5,4(a5)
	sw	a5,4(a2)
	sw	a4,12(a0)
	ret
.L144:
	li	a5,-999424
	addi	t1,a5,-1575
	bge	a1,t1,.L150
	addi	a4,a5,-1576
	beq	a1,a4,.L151
	lw	a3,0(a3)
	li	t0,22
	lla	a5,luaO_nilobject_
	lw	t2,4(a3)
	beq	t2,t0,.L145
	lw	a3,0(a3)
	sub	a4,a4,a1
	lbu	t0,6(a3)
	bgt	a4,t0,.L145
	sub	t1,t1,a1
	slli	t1,t1,3
	add	a5,a3,t1
	j	.L145
.L150:
	slli	a5,a1,3
	add	a5,a2,a5
	lw	a3,0(a5)
	addi	a4,a2,8
	sw	a3,0(a2)
	lw	a5,4(a5)
	sw	a5,4(a2)
	sw	a4,12(a0)
	ret
.L151:
	lw	a5,16(a0)
	addi	a5,a5,36
	j	.L145
	.size	lua_pushvalue, .-lua_pushvalue
	.section	.text.lua_type,"ax",@progbits
	.align	2
	.globl	lua_type
	.hidden	lua_type
	.type	lua_type, @function
lua_type:
	lw	a3,20(a0)
	ble	a1,zero,.L153
	lw	a5,0(a3)
	lw	a4,12(a0)
	slli	a1,a1,3
	add	a1,a5,a1
	li	a0,-1
	bgeu	a1,a4,.L152
.L155:
	lla	a5,luaO_nilobject_
	beq	a1,a5,.L161
	lw	a0,4(a1)
	andi	a0,a0,15
	ret
.L153:
	li	a5,-999424
	addi	a2,a5,-1575
	bge	a1,a2,.L162
	addi	a4,a5,-1576
	beq	a1,a4,.L163
	lw	a5,0(a3)
	li	a3,22
	li	a0,-1
	lw	t1,4(a5)
	bne	t1,a3,.L164
.L152:
	ret
.L164:
	lw	a5,0(a5)
	sub	a4,a4,a1
	lbu	a3,6(a5)
	bgt	a4,a3,.L152
	sub	a2,a2,a1
	slli	a2,a2,3
	add	a1,a5,a2
	j	.L155
.L162:
	lw	a5,12(a0)
	slli	a1,a1,3
	add	a1,a5,a1
	j	.L155
.L163:
	lw	a1,16(a0)
	addi	a1,a1,36
	j	.L155
.L161:
	li	a0,-1
	ret
	.size	lua_type, .-lua_type
	.section	.text.lua_typename,"ax",@progbits
	.align	2
	.globl	lua_typename
	.hidden	lua_typename
	.type	lua_typename, @function
lua_typename:
	addi	a1,a1,1
	slli	a1,a1,2
	lla	a5,luaT_typenames_
	add	a5,a5,a1
	lw	a0,0(a5)
	ret
	.size	lua_typename, .-lua_typename
	.section	.text.lua_iscfunction,"ax",@progbits
	.align	2
	.globl	lua_iscfunction
	.hidden	lua_iscfunction
	.type	lua_iscfunction, @function
lua_iscfunction:
	lw	a3,20(a0)
	ble	a1,zero,.L167
	lw	a5,0(a3)
	lw	a4,12(a0)
	slli	a1,a1,3
	add	a5,a5,a1
	bgeu	a5,a4,.L175
.L168:
	lw	a5,4(a5)
	li	a4,22
	li	a0,1
	beq	a5,a4,.L166
	addi	a5,a5,-102
	seqz	a0,a5
.L166:
	ret
.L175:
	lla	a5,luaO_nilobject_
	j	.L168
.L167:
	li	a5,-999424
	addi	a2,a5,-1575
	bge	a1,a2,.L176
	addi	a4,a5,-1576
	beq	a1,a4,.L177
	lw	a3,0(a3)
	li	a0,22
	lla	a5,luaO_nilobject_
	lw	t1,4(a3)
	beq	t1,a0,.L168
	lw	a3,0(a3)
	sub	a4,a4,a1
	lbu	a0,6(a3)
	bgt	a4,a0,.L168
	sub	a2,a2,a1
	slli	a2,a2,3
	add	a5,a3,a2
	j	.L168
.L176:
	lw	a5,12(a0)
	slli	a1,a1,3
	add	a5,a5,a1
	j	.L168
.L177:
	lw	a5,16(a0)
	addi	a5,a5,36
	j	.L168
	.size	lua_iscfunction, .-lua_iscfunction
	.section	.text.lua_isinteger,"ax",@progbits
	.align	2
	.globl	lua_isinteger
	.hidden	lua_isinteger
	.type	lua_isinteger, @function
lua_isinteger:
	lw	a3,20(a0)
	ble	a1,zero,.L179
	lw	a5,0(a3)
	lw	a4,12(a0)
	slli	a1,a1,3
	add	a5,a5,a1
	bltu	a5,a4,.L180
	lla	a5,luaO_nilobject_
.L180:
	lw	a0,4(a5)
	addi	a0,a0,-19
	seqz	a0,a0
	ret
.L179:
	li	a5,-999424
	addi	a2,a5,-1575
	bge	a1,a2,.L185
	addi	a4,a5,-1576
	beq	a1,a4,.L186
	lw	a3,0(a3)
	li	a0,22
	lla	a5,luaO_nilobject_
	lw	t1,4(a3)
	beq	t1,a0,.L180
	lw	a3,0(a3)
	sub	a4,a4,a1
	lbu	a0,6(a3)
	bgt	a4,a0,.L180
	sub	a2,a2,a1
	slli	a2,a2,3
	add	a5,a3,a2
	j	.L180
.L185:
	lw	a5,12(a0)
	slli	a1,a1,3
	add	a5,a5,a1
	lw	a0,4(a5)
	addi	a0,a0,-19
	seqz	a0,a0
	ret
.L186:
	lw	a5,16(a0)
	addi	a5,a5,36
	j	.L180
	.size	lua_isinteger, .-lua_isinteger
	.section	.text.lua_isnumber,"ax",@progbits
	.align	2
	.globl	lua_isnumber
	.hidden	lua_isnumber
	.type	lua_isnumber, @function
lua_isnumber:
	lw	a3,20(a0)
	ble	a1,zero,.L188
	lw	a5,0(a3)
	lw	a4,12(a0)
	slli	a1,a1,3
	add	a5,a5,a1
	bgeu	a5,a4,.L200
.L189:
	lw	a3,4(a5)
	li	a4,3
	li	a0,1
	bne	a3,a4,.L201
.L197:
	ret
.L200:
	lla	a5,luaO_nilobject_
	lw	a3,4(a5)
	li	a4,3
	li	a0,1
	beq	a3,a4,.L197
.L201:
	addi	sp,sp,-16
	mv	a1,sp
	mv	a0,a5
	sw	ra,12(sp)
	call	luaV_tonumber_
	lw	ra,12(sp)
	addi	sp,sp,16
	jr	ra
.L188:
	li	a5,-999424
	addi	a2,a5,-1575
	bge	a1,a2,.L202
	addi	a4,a5,-1576
	beq	a1,a4,.L203
	lw	a3,0(a3)
	li	a0,22
	lla	a5,luaO_nilobject_
	lw	t1,4(a3)
	beq	t1,a0,.L189
	lw	a3,0(a3)
	sub	a4,a4,a1
	lbu	a0,6(a3)
	bgt	a4,a0,.L189
	sub	a2,a2,a1
	slli	a2,a2,3
	add	a5,a3,a2
	j	.L189
.L202:
	lw	a5,12(a0)
	slli	a1,a1,3
	add	a5,a5,a1
	j	.L189
.L203:
	lw	a5,16(a0)
	addi	a5,a5,36
	j	.L189
	.size	lua_isnumber, .-lua_isnumber
	.section	.text.lua_isstring,"ax",@progbits
	.align	2
	.globl	lua_isstring
	.hidden	lua_isstring
	.type	lua_isstring, @function
lua_isstring:
	lw	a3,20(a0)
	ble	a1,zero,.L205
	lw	a5,0(a3)
	lw	a4,12(a0)
	slli	a1,a1,3
	add	a5,a5,a1
	bltu	a5,a4,.L206
	lla	a5,luaO_nilobject_
.L206:
	lw	a0,4(a5)
	andi	a0,a0,15
	addi	a0,a0,-3
	sltiu	a0,a0,2
	ret
.L205:
	li	a5,-999424
	addi	a2,a5,-1575
	bge	a1,a2,.L211
	addi	a4,a5,-1576
	beq	a1,a4,.L212
	lw	a3,0(a3)
	li	a0,22
	lla	a5,luaO_nilobject_
	lw	t1,4(a3)
	beq	t1,a0,.L206
	lw	a3,0(a3)
	sub	a4,a4,a1
	lbu	a0,6(a3)
	bgt	a4,a0,.L206
	sub	a2,a2,a1
	slli	a2,a2,3
	add	a5,a3,a2
	j	.L206
.L211:
	lw	a5,12(a0)
	slli	a1,a1,3
	add	a5,a5,a1
	lw	a0,4(a5)
	andi	a0,a0,15
	addi	a0,a0,-3
	sltiu	a0,a0,2
	ret
.L212:
	lw	a5,16(a0)
	addi	a5,a5,36
	j	.L206
	.size	lua_isstring, .-lua_isstring
	.section	.text.lua_isuserdata,"ax",@progbits
	.align	2
	.globl	lua_isuserdata
	.hidden	lua_isuserdata
	.type	lua_isuserdata, @function
lua_isuserdata:
	lw	a3,20(a0)
	ble	a1,zero,.L214
	lw	a5,0(a3)
	lw	a4,12(a0)
	slli	a1,a1,3
	add	a5,a5,a1
	bgeu	a5,a4,.L222
.L215:
	lw	a5,4(a5)
	li	a4,71
	li	a0,1
	beq	a5,a4,.L213
	addi	a5,a5,-2
	seqz	a0,a5
.L213:
	ret
.L222:
	lla	a5,luaO_nilobject_
	j	.L215
.L214:
	li	a5,-999424
	addi	a2,a5,-1575
	bge	a1,a2,.L223
	addi	a4,a5,-1576
	beq	a1,a4,.L224
	lw	a3,0(a3)
	li	a0,22
	lla	a5,luaO_nilobject_
	lw	t1,4(a3)
	beq	t1,a0,.L215
	lw	a3,0(a3)
	sub	a4,a4,a1
	lbu	a0,6(a3)
	bgt	a4,a0,.L215
	sub	a2,a2,a1
	slli	a2,a2,3
	add	a5,a3,a2
	j	.L215
.L223:
	lw	a5,12(a0)
	slli	a1,a1,3
	add	a5,a5,a1
	j	.L215
.L224:
	lw	a5,16(a0)
	addi	a5,a5,36
	j	.L215
	.size	lua_isuserdata, .-lua_isuserdata
	.section	.text.lua_rawequal,"ax",@progbits
	.align	2
	.globl	lua_rawequal
	.hidden	lua_rawequal
	.type	lua_rawequal, @function
lua_rawequal:
	lw	a3,20(a0)
	mv	a5,a1
	ble	a1,zero,.L226
	lw	a1,0(a3)
	lw	a4,12(a0)
	slli	a5,a5,3
	add	a1,a1,a5
	bltu	a1,a4,.L243
	lla	a1,luaO_nilobject_
.L243:
	ble	a2,zero,.L245
.L264:
	lw	a5,0(a3)
	lw	a4,12(a0)
	slli	a2,a2,3
	add	a2,a5,a2
	bgeu	a2,a4,.L246
.L248:
	lla	a5,luaO_nilobject_
	beq	a1,a5,.L246
	beq	a2,a5,.L246
	li	a0,0
	tail	luaV_equalobj
.L226:
	li	a4,-999424
	addi	t1,a4,-1575
	bge	a1,t1,.L258
	addi	a4,a4,-1576
	beq	a1,a4,.L259
	lw	t0,0(a3)
	addi	sp,sp,-4
	sw	s0,0(sp)
	lw	s0,4(t0)
	li	t2,22
	lla	a1,luaO_nilobject_
	beq	s0,t2,.L227
	lw	t0,0(t0)
	sub	a4,a4,a5
	lbu	t2,6(t0)
	bgt	a4,t2,.L227
	sub	t1,t1,a5
	slli	t1,t1,3
	add	a1,t0,t1
.L227:
	ble	a2,zero,.L230
	lw	a5,0(a3)
	lw	a4,12(a0)
	slli	a2,a2,3
	add	a2,a5,a2
	bgeu	a2,a4,.L225
.L232:
	lla	a5,luaO_nilobject_
	beq	a1,a5,.L225
	beq	a2,a5,.L225
	lw	s0,0(sp)
	li	a0,0
	addi	sp,sp,4
	tail	luaV_equalobj
.L225:
	lw	s0,0(sp)
	li	a0,0
	addi	sp,sp,4
	jr	ra
.L230:
	li	a5,-999424
	addi	t1,a5,-1575
	bge	a2,t1,.L260
	addi	a4,a5,-1576
	beq	a2,a4,.L261
	lw	a5,0(a3)
	li	a3,22
	lw	a0,4(a5)
	beq	a0,a3,.L225
	lw	a5,0(a5)
	sub	a4,a4,a2
	lbu	a3,6(a5)
	bgt	a4,a3,.L225
	sub	t1,t1,a2
	slli	t1,t1,3
	add	a2,a5,t1
	j	.L232
.L245:
	li	a5,-999424
	addi	t1,a5,-1575
	bge	a2,t1,.L262
	addi	a4,a5,-1576
	beq	a2,a4,.L263
	lw	a5,0(a3)
	li	a3,22
	lw	a0,4(a5)
	beq	a0,a3,.L246
	lw	a5,0(a5)
	sub	a4,a4,a2
	lbu	a3,6(a5)
	bgt	a4,a3,.L246
	sub	t1,t1,a2
	slli	t1,t1,3
	add	a2,a5,t1
	j	.L248
.L258:
	lw	a1,12(a0)
	slli	a5,a5,3
	add	a1,a1,a5
	bgt	a2,zero,.L264
	j	.L245
.L246:
	li	a0,0
	ret
.L260:
	lw	a5,12(a0)
	slli	a2,a2,3
	add	a2,a5,a2
	j	.L232
.L259:
	lw	a1,16(a0)
	addi	a1,a1,36
	bgt	a2,zero,.L264
	j	.L245
.L261:
	lw	a2,16(a0)
	addi	a2,a2,36
	j	.L232
.L263:
	lw	a2,16(a0)
	addi	a2,a2,36
	j	.L248
.L262:
	lw	a5,12(a0)
	slli	a2,a2,3
	add	a2,a5,a2
	j	.L248
	.size	lua_rawequal, .-lua_rawequal
	.section	.text.lua_arith,"ax",@progbits
	.align	2
	.globl	lua_arith
	.hidden	lua_arith
	.type	lua_arith, @function
lua_arith:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	addi	a3,a1,-12
	li	a5,1
	lw	a4,12(a0)
	mv	s0,a0
	bleu	a3,a5,.L266
	addi	a3,a4,-8
.L267:
	addi	a4,a4,-16
	mv	a0,s0
	mv	a2,a4
	call	luaO_arith
	lw	a5,12(s0)
	lw	ra,8(sp)
	addi	a5,a5,-8
	sw	a5,12(s0)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
.L266:
	lw	a3,-4(a4)
	lw	a2,-8(a4)
	addi	a5,a4,8
	sw	a3,4(a4)
	sw	a2,0(a4)
	mv	a3,a4
	sw	a5,12(a0)
	mv	a4,a5
	j	.L267
	.size	lua_arith, .-lua_arith
	.section	.text.lua_compare,"ax",@progbits
	.align	2
	.globl	lua_compare
	.hidden	lua_compare
	.type	lua_compare, @function
lua_compare:
	lw	t1,20(a0)
	mv	a5,a1
	ble	a1,zero,.L270
	lw	a1,0(t1)
	lw	a4,12(a0)
	slli	a5,a5,3
	add	a1,a1,a5
	bltu	a1,a4,.L290
	lla	a1,luaO_nilobject_
.L290:
	ble	a2,zero,.L292
.L318:
	lw	a5,0(t1)
	lw	a4,12(a0)
	slli	a2,a2,3
	add	a2,a5,a2
	bgeu	a2,a4,.L293
.L295:
	lla	a5,luaO_nilobject_
	beq	a1,a5,.L293
	beq	a2,a5,.L293
	li	a5,1
	beq	a3,a5,.L305
	li	a5,2
	beq	a3,a5,.L307
	beq	a3,zero,.L310
.L293:
	li	a0,0
	ret
.L270:
	li	a4,-999424
	addi	t2,a4,-1575
	bge	a1,t2,.L311
	addi	a4,a4,-1576
	beq	a1,a4,.L312
	lw	t0,0(t1)
	addi	sp,sp,-8
	sw	s1,0(sp)
	lw	s1,4(t0)
	sw	s0,4(sp)
	li	s0,22
	lla	a1,luaO_nilobject_
	beq	s1,s0,.L271
	lw	t0,0(t0)
	sub	a4,a4,a5
	lbu	s0,6(t0)
	bgt	a4,s0,.L271
	sub	a5,t2,a5
	slli	a5,a5,3
	add	a1,t0,a5
.L271:
	ble	a2,zero,.L274
	lw	a5,0(t1)
	lw	a4,12(a0)
	slli	a2,a2,3
	add	a2,a5,a2
	bgeu	a2,a4,.L269
.L276:
	lla	a5,luaO_nilobject_
	beq	a1,a5,.L269
	beq	a2,a5,.L269
	li	a5,1
	beq	a3,a5,.L279
	li	a5,2
	beq	a3,a5,.L280
	beq	a3,zero,.L313
.L269:
	lw	s0,4(sp)
	lw	s1,0(sp)
	li	a0,0
	addi	sp,sp,8
	jr	ra
.L274:
	li	a5,-999424
	addi	t0,a5,-1575
	bge	a2,t0,.L314
	addi	a4,a5,-1576
	beq	a2,a4,.L315
	lw	a5,0(t1)
	li	t1,22
	lw	t2,4(a5)
	beq	t2,t1,.L269
	lw	a5,0(a5)
	sub	a4,a4,a2
	lbu	t1,6(a5)
	bgt	a4,t1,.L269
	sub	a4,t0,a2
	slli	a4,a4,3
	add	a2,a5,a4
	j	.L276
.L292:
	li	a5,-999424
	addi	t0,a5,-1575
	bge	a2,t0,.L316
	addi	a4,a5,-1576
	beq	a2,a4,.L317
	lw	a5,0(t1)
	li	t1,22
	lw	t2,4(a5)
	beq	t2,t1,.L293
	lw	a5,0(a5)
	sub	a4,a4,a2
	lbu	t1,6(a5)
	bgt	a4,t1,.L293
	sub	a4,t0,a2
	slli	a4,a4,3
	add	a2,a5,a4
	j	.L295
.L311:
	lw	a1,12(a0)
	slli	a5,a5,3
	add	a1,a1,a5
	bgt	a2,zero,.L318
	j	.L292
.L314:
	lw	a5,12(a0)
	slli	a2,a2,3
	add	a2,a5,a2
	j	.L276
.L279:
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,8
	tail	luaV_lessthan
.L313:
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,8
	tail	luaV_equalobj
.L280:
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,8
	tail	luaV_lessequal
.L312:
	lw	a1,16(a0)
	addi	a1,a1,36
	bgt	a2,zero,.L318
	j	.L292
.L315:
	lw	a2,16(a0)
	addi	a2,a2,36
	j	.L276
.L317:
	lw	a2,16(a0)
	addi	a2,a2,36
	j	.L295
.L316:
	lw	a5,12(a0)
	slli	a2,a2,3
	add	a2,a5,a2
	j	.L295
.L305:
	tail	luaV_lessthan
.L310:
	tail	luaV_equalobj
.L307:
	tail	luaV_lessequal
	.size	lua_compare, .-lua_compare
	.section	.text.lua_stringtonumber,"ax",@progbits
	.align	2
	.globl	lua_stringtonumber
	.hidden	lua_stringtonumber
	.type	lua_stringtonumber, @function
lua_stringtonumber:
	addi	sp,sp,-12
	sw	s0,4(sp)
	mv	s0,a0
	mv	a0,a1
	lw	a1,12(s0)
	sw	ra,8(sp)
	call	luaO_str2num
	beq	a0,zero,.L319
	lw	a5,12(s0)
	addi	a5,a5,8
	sw	a5,12(s0)
.L319:
	lw	ra,8(sp)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
	.size	lua_stringtonumber, .-lua_stringtonumber
	.section	.text.lua_tonumberx,"ax",@progbits
	.align	2
	.globl	lua_tonumberx
	.hidden	lua_tonumberx
	.type	lua_tonumberx, @function
lua_tonumberx:
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	ra,12(sp)
	lw	a4,20(a0)
	mv	s0,a2
	ble	a1,zero,.L326
	lw	a4,0(a4)
	lw	a5,12(a0)
	slli	a1,a1,3
	add	a0,a4,a1
	bgeu	a0,a5,.L333
.L327:
	lw	a4,4(a0)
	li	a5,3
	bne	a4,a5,.L330
.L342:
	lw	a0,0(a0)
	li	a5,1
.L331:
	beq	s0,zero,.L325
	sw	a5,0(s0)
.L325:
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16
	jr	ra
.L333:
	lla	a0,luaO_nilobject_
	lw	a4,4(a0)
	li	a5,3
	beq	a4,a5,.L342
.L330:
	mv	a1,sp
	call	luaV_tonumber_
	mv	a5,a0
	li	a0,0
	beq	a5,zero,.L331
	lw	a0,0(sp)
	j	.L331
.L326:
	li	a5,-999424
	addi	a3,a5,-1575
	bge	a1,a3,.L343
	addi	a5,a5,-1576
	beq	a1,a5,.L344
	lw	a4,0(a4)
	li	a2,22
	lla	a0,luaO_nilobject_
	lw	t1,4(a4)
	beq	t1,a2,.L327
	lw	a4,0(a4)
	sub	a5,a5,a1
	lbu	a2,6(a4)
	bgt	a5,a2,.L327
	sub	a3,a3,a1
	slli	a3,a3,3
	add	a0,a4,a3
	j	.L327
.L343:
	lw	a0,12(a0)
	slli	a1,a1,3
	add	a0,a0,a1
	j	.L327
.L344:
	lw	a0,16(a0)
	addi	a0,a0,36
	j	.L327
	.size	lua_tonumberx, .-lua_tonumberx
	.section	.text.lua_tointegerx,"ax",@progbits
	.align	2
	.globl	lua_tointegerx
	.hidden	lua_tointegerx
	.type	lua_tointegerx, @function
lua_tointegerx:
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	ra,12(sp)
	lw	a4,20(a0)
	mv	s0,a2
	ble	a1,zero,.L346
	lw	a4,0(a4)
	lw	a5,12(a0)
	slli	a1,a1,3
	add	a0,a4,a1
	bgeu	a0,a5,.L353
.L347:
	lw	a4,4(a0)
	li	a5,19
	bne	a4,a5,.L350
.L362:
	lw	a0,0(a0)
	li	a5,1
.L351:
	beq	s0,zero,.L345
	sw	a5,0(s0)
.L345:
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16
	jr	ra
.L353:
	lla	a0,luaO_nilobject_
	lw	a4,4(a0)
	li	a5,19
	beq	a4,a5,.L362
.L350:
	li	a2,0
	mv	a1,sp
	call	luaV_tointeger
	mv	a5,a0
	li	a0,0
	beq	a5,zero,.L351
	lw	a0,0(sp)
	j	.L351
.L346:
	li	a5,-999424
	addi	a3,a5,-1575
	bge	a1,a3,.L363
	addi	a5,a5,-1576
	beq	a1,a5,.L364
	lw	a4,0(a4)
	li	a2,22
	lla	a0,luaO_nilobject_
	lw	t1,4(a4)
	beq	t1,a2,.L347
	lw	a4,0(a4)
	sub	a5,a5,a1
	lbu	a2,6(a4)
	bgt	a5,a2,.L347
	sub	a3,a3,a1
	slli	a3,a3,3
	add	a0,a4,a3
	j	.L347
.L363:
	lw	a0,12(a0)
	slli	a1,a1,3
	add	a0,a0,a1
	j	.L347
.L364:
	lw	a0,16(a0)
	addi	a0,a0,36
	j	.L347
	.size	lua_tointegerx, .-lua_tointegerx
	.section	.text.lua_toboolean,"ax",@progbits
	.align	2
	.globl	lua_toboolean
	.hidden	lua_toboolean
	.type	lua_toboolean, @function
lua_toboolean:
	lw	a3,20(a0)
	ble	a1,zero,.L366
	lw	a5,0(a3)
	lw	a4,12(a0)
	slli	a1,a1,3
	add	a5,a5,a1
	bgeu	a5,a4,.L377
.L367:
	lw	a0,4(a5)
	beq	a0,zero,.L365
	li	a4,1
	beq	a0,a4,.L378
	li	a0,1
.L365:
	ret
.L377:
	lla	a5,luaO_nilobject_
	j	.L367
.L366:
	li	a5,-999424
	addi	a2,a5,-1575
	bge	a1,a2,.L379
	addi	a4,a5,-1576
	beq	a1,a4,.L380
	lw	a3,0(a3)
	li	a0,22
	lla	a5,luaO_nilobject_
	lw	t1,4(a3)
	beq	t1,a0,.L367
	lw	a3,0(a3)
	sub	a4,a4,a1
	lbu	a0,6(a3)
	bgt	a4,a0,.L367
	sub	a2,a2,a1
	slli	a2,a2,3
	add	a5,a3,a2
	j	.L367
.L378:
	lw	a0,0(a5)
	snez	a0,a0
	ret
.L379:
	lw	a5,12(a0)
	slli	a1,a1,3
	add	a5,a5,a1
	j	.L367
.L380:
	lw	a5,16(a0)
	addi	a5,a5,36
	j	.L367
	.size	lua_toboolean, .-lua_toboolean
	.section	.text.lua_tolstring,"ax",@progbits
	.align	2
	.globl	lua_tolstring
	.hidden	lua_tolstring
	.type	lua_tolstring, @function
lua_tolstring:
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	lw	a4,20(a0)
	mv	s0,a0
	mv	s1,a1
	ble	a1,zero,.L382
	lw	a1,0(a4)
	lw	a5,12(a0)
	slli	a4,s1,3
	add	a1,a1,a4
	bgeu	a1,a5,.L393
.L383:
	lw	a5,4(a1)
	li	a4,4
	andi	a5,a5,15
	beq	a5,a4,.L386
	li	a4,3
	bne	a5,a4,.L402
	mv	a0,s0
	sw	a2,0(sp)
	call	luaO_tostring
	lw	a5,16(s0)
	lw	a2,0(sp)
	lw	a5,12(a5)
	ble	a5,zero,.L389
	mv	a0,s0
	call	luaC_step
	lw	a2,0(sp)
.L389:
	mv	a1,s1
	mv	a0,s0
	sw	a2,0(sp)
	call	index2addr
	lw	a2,0(sp)
	mv	a1,a0
.L386:
	beq	a2,zero,.L390
	lw	a5,0(a1)
	li	a4,4
	lbu	a3,4(a5)
	beq	a3,a4,.L403
	lw	a5,12(a5)
	sw	a5,0(a2)
.L390:
	lw	a0,0(a1)
	addi	a0,a0,16
.L381:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L402:
	li	a0,0
	beq	a2,zero,.L381
	lw	ra,12(sp)
	lw	s0,8(sp)
	sw	zero,0(a2)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L393:
	lla	a1,luaO_nilobject_
	j	.L383
.L382:
	li	a5,-999424
	addi	a3,a5,-1575
	bge	a1,a3,.L404
	addi	a5,a5,-1576
	beq	a1,a5,.L405
	lw	a4,0(a4)
	li	a0,22
	lla	a1,luaO_nilobject_
	lw	t1,4(a4)
	beq	t1,a0,.L383
	lw	a4,0(a4)
	sub	a5,a5,s1
	lbu	a0,6(a4)
	bgt	a5,a0,.L383
	sub	a3,a3,s1
	slli	a3,a3,3
	add	a1,a4,a3
	j	.L383
.L403:
	lbu	a5,7(a5)
	sw	a5,0(a2)
	j	.L390
.L404:
	lw	a1,12(a0)
	slli	a5,s1,3
	add	a1,a1,a5
	j	.L383
.L405:
	lw	a1,16(a0)
	addi	a1,a1,36
	j	.L383
	.size	lua_tolstring, .-lua_tolstring
	.section	.text.lua_rawlen,"ax",@progbits
	.align	2
	.globl	lua_rawlen
	.hidden	lua_rawlen
	.type	lua_rawlen, @function
lua_rawlen:
	lw	a4,20(a0)
	ble	a1,zero,.L407
	lw	a2,0(a4)
	lw	a5,12(a0)
	slli	a1,a1,3
	add	a2,a2,a1
	bgeu	a2,a5,.L420
.L408:
	lw	a4,4(a2)
	li	a3,7
	andi	a5,a4,63
	beq	a5,a3,.L411
	andi	a4,a4,56
	bne	a4,zero,.L412
	li	a4,4
	beq	a5,a4,.L413
	li	a4,5
	bne	a5,a4,.L419
	lw	a0,0(a2)
	tail	luaH_getn
.L412:
	li	a4,20
	bne	a5,a4,.L419
.L411:
	lw	a5,0(a2)
	lw	a0,12(a5)
	ret
.L420:
	lla	a2,luaO_nilobject_
	j	.L408
.L407:
	li	a5,-999424
	addi	a3,a5,-1575
	bge	a1,a3,.L421
	addi	a5,a5,-1576
	beq	a1,a5,.L422
	lw	a4,0(a4)
	li	a0,22
	lla	a2,luaO_nilobject_
	lw	t1,4(a4)
	beq	t1,a0,.L408
	lw	a4,0(a4)
	sub	a5,a5,a1
	lbu	a0,6(a4)
	bgt	a5,a0,.L408
	sub	a3,a3,a1
	slli	a3,a3,3
	add	a2,a4,a3
	j	.L408
.L419:
	li	a0,0
	ret
.L413:
	lw	a5,0(a2)
	lbu	a0,7(a5)
	ret
.L421:
	lw	a2,12(a0)
	slli	a1,a1,3
	add	a2,a2,a1
	j	.L408
.L422:
	lw	a2,16(a0)
	addi	a2,a2,36
	j	.L408
	.size	lua_rawlen, .-lua_rawlen
	.section	.text.lua_tocfunction,"ax",@progbits
	.align	2
	.globl	lua_tocfunction
	.hidden	lua_tocfunction
	.type	lua_tocfunction, @function
lua_tocfunction:
	lw	a3,20(a0)
	ble	a1,zero,.L424
	lw	a5,0(a3)
	lw	a4,12(a0)
	slli	a1,a1,3
	add	a5,a5,a1
	bgeu	a5,a4,.L433
.L425:
	lw	a4,4(a5)
	li	a3,22
	beq	a4,a3,.L434
.L428:
	li	a3,102
	li	a0,0
	bne	a4,a3,.L423
	lw	a5,0(a5)
	lw	a0,12(a5)
.L423:
	ret
.L433:
	lla	a5,luaO_nilobject_
	lw	a4,4(a5)
	li	a3,22
	bne	a4,a3,.L428
.L434:
	lw	a0,0(a5)
	ret
.L424:
	li	a5,-999424
	addi	a2,a5,-1575
	bge	a1,a2,.L435
	addi	a4,a5,-1576
	beq	a1,a4,.L436
	lw	a3,0(a3)
	li	a0,22
	lla	a5,luaO_nilobject_
	lw	t1,4(a3)
	beq	t1,a0,.L425
	lw	a3,0(a3)
	sub	a4,a4,a1
	lbu	a0,6(a3)
	bgt	a4,a0,.L425
	sub	a2,a2,a1
	slli	a2,a2,3
	add	a5,a3,a2
	j	.L425
.L435:
	lw	a5,12(a0)
	slli	a1,a1,3
	add	a5,a5,a1
	j	.L425
.L436:
	lw	a5,16(a0)
	addi	a5,a5,36
	j	.L425
	.size	lua_tocfunction, .-lua_tocfunction
	.section	.text.lua_touserdata,"ax",@progbits
	.align	2
	.globl	lua_touserdata
	.hidden	lua_touserdata
	.type	lua_touserdata, @function
lua_touserdata:
	lw	a4,20(a0)
	ble	a1,zero,.L438
	lw	a3,0(a4)
	lw	a5,12(a0)
	slli	a1,a1,3
	add	a3,a3,a1
	bgeu	a3,a5,.L447
.L439:
	lw	a5,4(a3)
	li	a4,2
	andi	a5,a5,15
	beq	a5,a4,.L442
	li	a4,7
	li	a0,0
	bne	a5,a4,.L437
	lw	a0,0(a3)
	addi	a0,a0,24
	ret
.L442:
	lw	a0,0(a3)
.L437:
	ret
.L447:
	lla	a3,luaO_nilobject_
	j	.L439
.L438:
	li	a5,-999424
	addi	a2,a5,-1575
	bge	a1,a2,.L448
	addi	a5,a5,-1576
	beq	a1,a5,.L449
	lw	a4,0(a4)
	li	a0,22
	lla	a3,luaO_nilobject_
	lw	t1,4(a4)
	beq	t1,a0,.L439
	lw	a4,0(a4)
	sub	a5,a5,a1
	lbu	a0,6(a4)
	bgt	a5,a0,.L439
	sub	a2,a2,a1
	slli	a2,a2,3
	add	a3,a4,a2
	j	.L439
.L448:
	lw	a3,12(a0)
	slli	a1,a1,3
	add	a3,a3,a1
	j	.L439
.L449:
	lw	a3,16(a0)
	addi	a3,a3,36
	j	.L439
	.size	lua_touserdata, .-lua_touserdata
	.section	.text.lua_tothread,"ax",@progbits
	.align	2
	.globl	lua_tothread
	.hidden	lua_tothread
	.type	lua_tothread, @function
lua_tothread:
	lw	a3,20(a0)
	ble	a1,zero,.L451
	lw	a5,0(a3)
	lw	a4,12(a0)
	slli	a1,a1,3
	add	a5,a5,a1
	bgeu	a5,a4,.L459
.L452:
	lw	a3,4(a5)
	li	a4,72
	li	a0,0
	bne	a3,a4,.L450
	lw	a0,0(a5)
.L450:
	ret
.L459:
	lla	a5,luaO_nilobject_
	j	.L452
.L451:
	li	a5,-999424
	addi	a2,a5,-1575
	bge	a1,a2,.L460
	addi	a4,a5,-1576
	beq	a1,a4,.L461
	lw	a3,0(a3)
	li	a0,22
	lla	a5,luaO_nilobject_
	lw	t1,4(a3)
	beq	t1,a0,.L452
	lw	a3,0(a3)
	sub	a4,a4,a1
	lbu	a0,6(a3)
	bgt	a4,a0,.L452
	sub	a2,a2,a1
	slli	a2,a2,3
	add	a5,a3,a2
	j	.L452
.L460:
	lw	a5,12(a0)
	slli	a1,a1,3
	add	a5,a5,a1
	j	.L452
.L461:
	lw	a5,16(a0)
	addi	a5,a5,36
	j	.L452
	.size	lua_tothread, .-lua_tothread
	.section	.text.lua_topointer,"ax",@progbits
	.align	2
	.globl	lua_topointer
	.hidden	lua_topointer
	.type	lua_topointer, @function
lua_topointer:
	lw	a4,20(a0)
	ble	a1,zero,.L463
	lw	a3,0(a4)
	lw	a5,12(a0)
	slli	a1,a1,3
	add	a3,a3,a1
	bgeu	a3,a5,.L476
.L464:
	lw	a5,4(a3)
	li	a4,38
	andi	a5,a5,63
	bgtu	a5,a4,.L475
	lla	a4,.L469
	slli	a5,a5,2
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a5,a5,a4
	jr	a5
	.section	.rodata.lua_topointer,"a",@progbits
	.align	2
	.align	2
.L469:
	.word	.L475-.L469
	.word	.L475-.L469
	.word	.L472-.L469
	.word	.L475-.L469
	.word	.L475-.L469
	.word	.L472-.L469
	.word	.L472-.L469
	.word	.L471-.L469
	.word	.L472-.L469
	.word	.L475-.L469
	.word	.L475-.L469
	.word	.L475-.L469
	.word	.L475-.L469
	.word	.L475-.L469
	.word	.L475-.L469
	.word	.L475-.L469
	.word	.L475-.L469
	.word	.L475-.L469
	.word	.L475-.L469
	.word	.L475-.L469
	.word	.L475-.L469
	.word	.L475-.L469
	.word	.L472-.L469
	.word	.L475-.L469
	.word	.L475-.L469
	.word	.L475-.L469
	.word	.L475-.L469
	.word	.L475-.L469
	.word	.L475-.L469
	.word	.L475-.L469
	.word	.L475-.L469
	.word	.L475-.L469
	.word	.L475-.L469
	.word	.L475-.L469
	.word	.L475-.L469
	.word	.L475-.L469
	.word	.L475-.L469
	.word	.L475-.L469
	.word	.L472-.L469
	.section	.text.lua_topointer
.L475:
	li	a0,0
	ret
.L472:
	lw	a0,0(a3)
	ret
.L476:
	lla	a3,luaO_nilobject_
	j	.L464
.L463:
	li	a5,-999424
	addi	a2,a5,-1575
	bge	a1,a2,.L477
	addi	a5,a5,-1576
	beq	a1,a5,.L478
	lw	a4,0(a4)
	li	a0,22
	lla	a3,luaO_nilobject_
	lw	t1,4(a4)
	beq	t1,a0,.L464
	lw	a4,0(a4)
	sub	a5,a5,a1
	lbu	a0,6(a4)
	bgt	a5,a0,.L464
	sub	a2,a2,a1
	slli	a2,a2,3
	add	a3,a4,a2
	j	.L464
.L471:
	lw	a0,0(a3)
	addi	a0,a0,24
	ret
.L477:
	lw	a3,12(a0)
	slli	a1,a1,3
	add	a3,a3,a1
	j	.L464
.L478:
	lw	a3,16(a0)
	addi	a3,a3,36
	j	.L464
	.size	lua_topointer, .-lua_topointer
	.section	.text.lua_pushnil,"ax",@progbits
	.align	2
	.globl	lua_pushnil
	.hidden	lua_pushnil
	.type	lua_pushnil, @function
lua_pushnil:
	lw	a5,12(a0)
	sw	zero,4(a5)
	addi	a5,a5,8
	sw	a5,12(a0)
	ret
	.size	lua_pushnil, .-lua_pushnil
	.section	.text.lua_pushnumber,"ax",@progbits
	.align	2
	.globl	lua_pushnumber
	.hidden	lua_pushnumber
	.type	lua_pushnumber, @function
lua_pushnumber:
	lw	a5,12(a0)
	li	a4,3
	sw	a1,0(a5)
	sw	a4,4(a5)
	addi	a5,a5,8
	sw	a5,12(a0)
	ret
	.size	lua_pushnumber, .-lua_pushnumber
	.section	.text.lua_pushinteger,"ax",@progbits
	.align	2
	.globl	lua_pushinteger
	.hidden	lua_pushinteger
	.type	lua_pushinteger, @function
lua_pushinteger:
	lw	a5,12(a0)
	li	a4,19
	sw	a1,0(a5)
	sw	a4,4(a5)
	addi	a5,a5,8
	sw	a5,12(a0)
	ret
	.size	lua_pushinteger, .-lua_pushinteger
	.section	.rodata.lua_pushlstring.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	""
	.section	.text.lua_pushlstring,"ax",@progbits
	.align	2
	.globl	lua_pushlstring
	.hidden	lua_pushlstring
	.type	lua_pushlstring, @function
lua_pushlstring:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	sw	s1,0(sp)
	mv	s0,a0
	bne	a2,zero,.L483
	lla	a1,.LC0
	call	luaS_new
	mv	s1,a0
.L484:
	lw	a5,12(s0)
	lw	a3,16(s0)
	sw	s1,0(a5)
	lbu	a4,4(s1)
	lw	a3,12(a3)
	addi	a2,a5,8
	ori	a4,a4,64
	sw	a4,4(a5)
	sw	a2,12(s0)
	ble	a3,zero,.L485
	mv	a0,s0
	call	luaC_step
.L485:
	lw	ra,8(sp)
	lw	s0,4(sp)
	addi	a0,s1,16
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L483:
	call	luaS_newlstr
	mv	s1,a0
	j	.L484
	.size	lua_pushlstring, .-lua_pushlstring
	.section	.text.lua_pushstring,"ax",@progbits
	.align	2
	.globl	lua_pushstring
	.hidden	lua_pushstring
	.type	lua_pushstring, @function
lua_pushstring:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	sw	s1,0(sp)
	mv	s0,a0
	beq	a1,zero,.L492
	call	luaS_new
	lw	a5,12(s0)
	addi	s1,a0,16
	sw	a0,0(a5)
	lbu	a4,4(a0)
	ori	a4,a4,64
	sw	a4,4(a5)
.L489:
	lw	a4,16(s0)
	addi	a5,a5,8
	sw	a5,12(s0)
	lw	a5,12(a4)
	ble	a5,zero,.L487
	mv	a0,s0
	call	luaC_step
.L487:
	lw	ra,8(sp)
	lw	s0,4(sp)
	mv	a0,s1
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L492:
	lw	a5,12(a0)
	li	s1,0
	sw	zero,4(a5)
	j	.L489
	.size	lua_pushstring, .-lua_pushstring
	.section	.text.lua_pushvfstring,"ax",@progbits
	.align	2
	.globl	lua_pushvfstring
	.hidden	lua_pushvfstring
	.type	lua_pushvfstring, @function
lua_pushvfstring:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	s1,0(sp)
	mv	s0,a0
	sw	ra,8(sp)
	call	luaO_pushvfstring
	lw	a5,16(s0)
	mv	s1,a0
	lw	a5,12(a5)
	ble	a5,zero,.L493
	mv	a0,s0
	call	luaC_step
.L493:
	lw	ra,8(sp)
	lw	s0,4(sp)
	mv	a0,s1
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
	.size	lua_pushvfstring, .-lua_pushvfstring
	.section	.text.lua_pushfstring,"ax",@progbits
	.align	2
	.globl	lua_pushfstring
	.hidden	lua_pushfstring
	.type	lua_pushfstring, @function
lua_pushfstring:
	addi	sp,sp,-32
	addi	t1,sp,16
	sw	a2,16(sp)
	mv	a2,t1
	sw	s0,8(sp)
	sw	s1,4(sp)
	mv	s0,a0
	sw	a5,28(sp)
	sw	ra,12(sp)
	sw	a3,20(sp)
	sw	a4,24(sp)
	sw	t1,0(sp)
	call	luaO_pushvfstring
	lw	a5,16(s0)
	mv	s1,a0
	lw	a5,12(a5)
	ble	a5,zero,.L496
	mv	a0,s0
	call	luaC_step
.L496:
	lw	ra,12(sp)
	lw	s0,8(sp)
	mv	a0,s1
	lw	s1,4(sp)
	addi	sp,sp,32
	jr	ra
	.size	lua_pushfstring, .-lua_pushfstring
	.section	.text.lua_pushcclosure,"ax",@progbits
	.align	2
	.globl	lua_pushcclosure
	.hidden	lua_pushcclosure
	.type	lua_pushcclosure, @function
lua_pushcclosure:
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	mv	s0,a2
	mv	s1,a0
	bne	s0,zero,.L500
	lw	a4,12(a0)
	li	a5,22
	sw	a1,0(a4)
	sw	a5,4(a4)
.L501:
	lw	a5,16(s1)
	addi	a4,a4,8
	sw	a4,12(s1)
	lw	a5,12(a5)
	bgt	a5,zero,.L506
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L506:
	lw	s0,8(sp)
	lw	ra,12(sp)
	mv	a0,s1
	lw	s1,4(sp)
	addi	sp,sp,16
	tail	luaC_step
.L500:
	sw	a1,0(sp)
	mv	a1,s0
	call	luaF_newCclosure
	lw	a5,12(s1)
	lw	a2,0(sp)
	slli	a4,s0,3
	addi	a3,a4,8
	sw	a2,12(a0)
	sub	a4,a5,a4
	add	a3,a0,a3
.L502:
	lw	a2,-8(a5)
	addi	a5,a5,-8
	addi	a3,a3,-8
	sw	a2,8(a3)
	lw	a2,4(a5)
	sw	a2,12(a3)
	bne	a4,a5,.L502
	li	a5,102
	sw	a0,0(a4)
	sw	a5,4(a4)
	j	.L501
	.size	lua_pushcclosure, .-lua_pushcclosure
	.section	.text.lua_pushboolean,"ax",@progbits
	.align	2
	.globl	lua_pushboolean
	.hidden	lua_pushboolean
	.type	lua_pushboolean, @function
lua_pushboolean:
	lw	a5,12(a0)
	snez	a1,a1
	li	a4,1
	sw	a1,0(a5)
	sw	a4,4(a5)
	addi	a5,a5,8
	sw	a5,12(a0)
	ret
	.size	lua_pushboolean, .-lua_pushboolean
	.section	.text.lua_pushlightuserdata,"ax",@progbits
	.align	2
	.globl	lua_pushlightuserdata
	.hidden	lua_pushlightuserdata
	.type	lua_pushlightuserdata, @function
lua_pushlightuserdata:
	lw	a5,12(a0)
	li	a4,2
	sw	a1,0(a5)
	sw	a4,4(a5)
	addi	a5,a5,8
	sw	a5,12(a0)
	ret
	.size	lua_pushlightuserdata, .-lua_pushlightuserdata
	.section	.text.lua_pushthread,"ax",@progbits
	.align	2
	.globl	lua_pushthread
	.hidden	lua_pushthread
	.type	lua_pushthread, @function
lua_pushthread:
	lw	a4,16(a0)
	lw	a5,12(a0)
	li	a3,72
	lw	a4,112(a4)
	addi	a5,a5,8
	sw	a0,-8(a5)
	sw	a3,-4(a5)
	sub	a4,a4,a0
	sw	a5,12(a0)
	seqz	a0,a4
	ret
	.size	lua_pushthread, .-lua_pushthread
	.section	.text.lua_getglobal,"ax",@progbits
	.align	2
	.globl	lua_getglobal
	.hidden	lua_getglobal
	.type	lua_getglobal, @function
lua_getglobal:
	lw	a5,16(a0)
	addi	sp,sp,-12
	sw	s0,4(sp)
	mv	s0,a0
	lw	a0,36(a5)
	sw	s1,0(sp)
	mv	s1,a1
	li	a1,2
	sw	ra,8(sp)
	call	luaH_getint
	mv	a1,a0
	mv	a0,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	mv	a2,s1
	lw	s1,0(sp)
	addi	sp,sp,12
	tail	auxgetstr
	.size	lua_getglobal, .-lua_getglobal
	.section	.text.lua_gettable,"ax",@progbits
	.align	2
	.globl	lua_gettable
	.hidden	lua_gettable
	.type	lua_gettable, @function
lua_gettable:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	index2addr
	lw	a3,4(a0)
	li	a5,69
	mv	s1,a0
	li	a4,0
	beq	a3,a5,.L521
.L513:
	lw	a3,12(s0)
	mv	a0,s0
	mv	a1,s1
	addi	a3,a3,-8
	mv	a2,a3
	call	luaV_finishget
	lw	a5,12(s0)
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	a0,-4(a5)
	lw	s1,0(sp)
	andi	a0,a0,15
	addi	sp,sp,12
	jr	ra
.L521:
	lw	a1,12(s0)
	lw	a0,0(a0)
	addi	a1,a1,-8
	call	luaH_get
	lw	a5,4(a0)
	mv	a4,a0
	beq	a5,zero,.L513
	lw	a5,12(s0)
	lw	a3,0(a0)
	lw	ra,8(sp)
	lw	s0,4(sp)
	sw	a3,-8(a5)
	lw	a4,4(a0)
	lw	s1,0(sp)
	sw	a4,-4(a5)
	lw	a0,-4(a5)
	addi	sp,sp,12
	andi	a0,a0,15
	jr	ra
	.size	lua_gettable, .-lua_gettable
	.section	.text.lua_getfield,"ax",@progbits
	.align	2
	.globl	lua_getfield
	.hidden	lua_getfield
	.type	lua_getfield, @function
lua_getfield:
	lw	a3,20(a0)
	mv	a5,a1
	ble	a1,zero,.L523
	lw	a1,0(a3)
	lw	a4,12(a0)
	slli	a5,a5,3
	add	a1,a1,a5
	bltu	a1,a4,.L524
	lla	a1,luaO_nilobject_
.L524:
	tail	auxgetstr
.L523:
	li	a4,-999424
	addi	t1,a4,-1575
	bge	a1,t1,.L529
	addi	a4,a4,-1576
	beq	a1,a4,.L530
	lw	a3,0(a3)
	li	t0,22
	lla	a1,luaO_nilobject_
	lw	t2,4(a3)
	beq	t2,t0,.L524
	lw	a3,0(a3)
	sub	a4,a4,a5
	lbu	t0,6(a3)
	bgt	a4,t0,.L524
	sub	t1,t1,a5
	slli	t1,t1,3
	add	a1,a3,t1
	j	.L524
.L529:
	lw	a1,12(a0)
	slli	a5,a5,3
	add	a1,a1,a5
	tail	auxgetstr
.L530:
	lw	a1,16(a0)
	addi	a1,a1,36
	j	.L524
	.size	lua_getfield, .-lua_getfield
	.section	.text.lua_geti,"ax",@progbits
	.align	2
	.globl	lua_geti
	.hidden	lua_geti
	.type	lua_geti, @function
lua_geti:
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	mv	s1,a2
	mv	s0,a0
	call	index2addr
	lw	a2,4(a0)
	li	a3,69
	mv	a5,a0
	li	a4,0
	beq	a2,a3,.L540
.L532:
	lw	a3,12(s0)
	li	a2,19
	mv	a0,s0
	sw	s1,0(a3)
	sw	a2,4(a3)
	addi	a2,a3,8
	sw	a2,12(s0)
	mv	a1,a5
	mv	a2,a3
	call	luaV_finishget
	lw	a5,12(s0)
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	a0,-4(a5)
	lw	s1,4(sp)
	andi	a0,a0,15
	addi	sp,sp,16
	jr	ra
.L540:
	lw	a0,0(a0)
	mv	a1,s1
	sw	a5,0(sp)
	call	luaH_getint
	lw	a3,4(a0)
	lw	a5,0(sp)
	mv	a4,a0
	beq	a3,zero,.L532
	lw	a3,12(s0)
	lw	a2,0(a0)
	lw	ra,12(sp)
	addi	a5,a3,8
	sw	a2,0(a3)
	lw	a4,4(a0)
	lw	s1,4(sp)
	sw	a4,4(a3)
	lw	a0,-4(a5)
	sw	a5,12(s0)
	lw	s0,8(sp)
	andi	a0,a0,15
	addi	sp,sp,16
	jr	ra
	.size	lua_geti, .-lua_geti
	.section	.text.lua_rawget,"ax",@progbits
	.align	2
	.globl	lua_rawget
	.hidden	lua_rawget
	.type	lua_rawget, @function
lua_rawget:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	lw	a3,20(a0)
	lw	s1,12(a0)
	mv	s0,a0
	ble	a1,zero,.L542
	lw	a5,0(a3)
	slli	a1,a1,3
	add	a5,a5,a1
	bltu	a5,s1,.L543
	lla	a5,luaO_nilobject_
.L543:
	lw	a0,0(a5)
	addi	a1,s1,-8
	call	luaH_get
	lw	a4,0(a0)
	lw	a5,12(s0)
	lw	ra,8(sp)
	sw	a4,-8(s1)
	lw	a4,4(a0)
	lw	s0,4(sp)
	sw	a4,-4(s1)
	lw	a0,-4(a5)
	lw	s1,0(sp)
	andi	a0,a0,15
	addi	sp,sp,12
	jr	ra
.L542:
	li	a5,-999424
	addi	a2,a5,-1575
	bge	a1,a2,.L550
	addi	a4,a5,-1576
	beq	a1,a4,.L551
	lw	a3,0(a3)
	li	a0,22
	lla	a5,luaO_nilobject_
	lw	t1,4(a3)
	beq	t1,a0,.L543
	lw	a3,0(a3)
	sub	a4,a4,a1
	lbu	a0,6(a3)
	bgt	a4,a0,.L543
	sub	a2,a2,a1
	slli	a2,a2,3
	add	a5,a3,a2
	j	.L543
.L550:
	slli	a5,a1,3
	add	a5,s1,a5
	j	.L543
.L551:
	lw	a5,16(a0)
	addi	a5,a5,36
	j	.L543
	.size	lua_rawget, .-lua_rawget
	.section	.text.lua_rawgeti,"ax",@progbits
	.align	2
	.globl	lua_rawgeti
	.hidden	lua_rawgeti
	.type	lua_rawgeti, @function
lua_rawgeti:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	s1,0(sp)
	mv	s0,a0
	mv	a5,a1
	sw	ra,8(sp)
	lw	a0,20(a0)
	lw	s1,12(s0)
	mv	a1,a2
	ble	a5,zero,.L553
	lw	a4,0(a0)
	slli	a5,a5,3
	add	a4,a4,a5
	bltu	a4,s1,.L554
	lla	a4,luaO_nilobject_
.L554:
	lw	a0,0(a4)
	call	luaH_getint
	lw	a4,0(a0)
	lw	a5,12(s0)
	lw	ra,8(sp)
	sw	a4,0(s1)
	lw	a3,4(a0)
	addi	a4,a5,8
	sw	a3,4(s1)
	lw	a0,4(a5)
	sw	a4,12(s0)
	lw	s0,4(sp)
	lw	s1,0(sp)
	andi	a0,a0,15
	addi	sp,sp,12
	jr	ra
.L553:
	li	a4,-999424
	addi	a2,a4,-1575
	bge	a5,a2,.L561
	addi	a3,a4,-1576
	beq	a5,a3,.L562
	lw	a0,0(a0)
	li	t1,22
	lla	a4,luaO_nilobject_
	lw	t0,4(a0)
	beq	t0,t1,.L554
	lw	a0,0(a0)
	sub	a3,a3,a5
	lbu	t1,6(a0)
	bgt	a3,t1,.L554
	sub	a2,a2,a5
	slli	a2,a2,3
	add	a4,a0,a2
	j	.L554
.L561:
	slli	a4,a5,3
	add	a4,s1,a4
	j	.L554
.L562:
	lw	a4,16(s0)
	addi	a4,a4,36
	j	.L554
	.size	lua_rawgeti, .-lua_rawgeti
	.section	.text.lua_rawgetp,"ax",@progbits
	.align	2
	.globl	lua_rawgetp
	.hidden	lua_rawgetp
	.type	lua_rawgetp, @function
lua_rawgetp:
	addi	sp,sp,-20
	sw	s1,8(sp)
	mv	s1,a2
	sw	ra,16(sp)
	sw	s0,12(sp)
	mv	s0,a0
	call	index2addr
	sw	s1,0(sp)
	lw	a0,0(a0)
	li	a5,2
	mv	a1,sp
	lw	s1,12(s0)
	sw	a5,4(sp)
	call	luaH_get
	lw	a4,0(a0)
	lw	a5,12(s0)
	lw	ra,16(sp)
	sw	a4,0(s1)
	lw	a3,4(a0)
	addi	a4,a5,8
	sw	a3,4(s1)
	lw	a0,4(a5)
	sw	a4,12(s0)
	lw	s0,12(sp)
	lw	s1,8(sp)
	andi	a0,a0,15
	addi	sp,sp,20
	jr	ra
	.size	lua_rawgetp, .-lua_rawgetp
	.section	.text.lua_createtable,"ax",@progbits
	.align	2
	.globl	lua_createtable
	.hidden	lua_createtable
	.type	lua_createtable, @function
lua_createtable:
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	s1,4(sp)
	mv	s0,a0
	mv	s1,a1
	sw	ra,12(sp)
	sw	a2,0(sp)
	call	luaH_new
	lw	a5,12(s0)
	li	a4,69
	lw	a3,0(sp)
	sw	a0,0(a5)
	sw	a4,4(a5)
	addi	a5,a5,8
	sw	a5,12(s0)
	mv	a1,a0
	bgt	s1,zero,.L566
	ble	a3,zero,.L567
.L566:
	mv	a2,s1
	mv	a0,s0
	call	luaH_resize
.L567:
	lw	a5,16(s0)
	lw	a5,12(a5)
	bgt	a5,zero,.L570
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L570:
	mv	a0,s0
	lw	s0,8(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	tail	luaC_step
	.size	lua_createtable, .-lua_createtable
	.section	.text.lua_getmetatable,"ax",@progbits
	.align	2
	.globl	lua_getmetatable
	.hidden	lua_getmetatable
	.type	lua_getmetatable, @function
lua_getmetatable:
	lw	a3,20(a0)
	mv	a4,a0
	ble	a1,zero,.L572
	lw	a2,0(a3)
	lw	a5,12(a0)
	slli	a1,a1,3
	add	a2,a2,a1
	bgeu	a2,a5,.L586
.L573:
	lw	a5,4(a2)
	li	a3,5
	andi	a5,a5,15
	beq	a5,a3,.L576
.L587:
	li	a3,7
	beq	a5,a3,.L577
	lw	a3,16(a4)
	addi	a5,a5,52
	slli	a5,a5,2
	add	a5,a3,a5
	lw	a3,12(a5)
.L579:
	li	a0,0
	beq	a3,zero,.L571
	lw	a5,12(a4)
	li	a0,1
	sw	a3,0(a5)
	li	a3,69
	sw	a3,4(a5)
	addi	a5,a5,8
	sw	a5,12(a4)
.L571:
	ret
.L586:
	lla	a2,luaO_nilobject_
	lw	a5,4(a2)
	li	a3,5
	andi	a5,a5,15
	bne	a5,a3,.L587
.L576:
	lw	a5,0(a2)
	lw	a3,24(a5)
	j	.L579
.L572:
	li	a5,-999424
	addi	a0,a5,-1575
	bge	a1,a0,.L588
	addi	a5,a5,-1576
	beq	a1,a5,.L589
	lw	a3,0(a3)
	li	t1,22
	lla	a2,luaO_nilobject_
	lw	t0,4(a3)
	beq	t0,t1,.L573
	lw	a3,0(a3)
	sub	a5,a5,a1
	lbu	t1,6(a3)
	bgt	a5,t1,.L573
	sub	a0,a0,a1
	slli	a0,a0,3
	add	a2,a3,a0
	j	.L573
.L577:
	lw	a5,0(a2)
	lw	a3,8(a5)
	j	.L579
.L588:
	lw	a2,12(a4)
	slli	a1,a1,3
	add	a2,a2,a1
	j	.L573
.L589:
	lw	a2,16(a4)
	addi	a2,a2,36
	j	.L573
	.size	lua_getmetatable, .-lua_getmetatable
	.section	.text.lua_getuservalue,"ax",@progbits
	.align	2
	.globl	lua_getuservalue
	.hidden	lua_getuservalue
	.type	lua_getuservalue, @function
lua_getuservalue:
	lw	a3,20(a0)
	lw	a2,12(a0)
	ble	a1,zero,.L591
	lw	a5,0(a3)
	slli	a1,a1,3
	add	a5,a5,a1
	bltu	a5,a2,.L592
	lla	a5,luaO_nilobject_
.L592:
	lw	a5,0(a5)
	addi	a4,a2,8
	lw	a3,16(a5)
	sw	a3,0(a2)
	lbu	a5,6(a5)
	sw	a5,4(a2)
	sw	a4,12(a0)
	andi	a0,a5,15
	ret
.L591:
	li	a5,-999424
	addi	t1,a5,-1575
	bge	a1,t1,.L598
	addi	a4,a5,-1576
	beq	a1,a4,.L599
	lw	a3,0(a3)
	li	t0,22
	lla	a5,luaO_nilobject_
	lw	t2,4(a3)
	beq	t2,t0,.L592
	lw	a3,0(a3)
	sub	a4,a4,a1
	lbu	t0,6(a3)
	bgt	a4,t0,.L592
	sub	t1,t1,a1
	slli	t1,t1,3
	add	a5,a3,t1
	j	.L592
.L598:
	slli	a5,a1,3
	add	a5,a2,a5
	j	.L592
.L599:
	lw	a5,16(a0)
	addi	a5,a5,36
	j	.L592
	.size	lua_getuservalue, .-lua_getuservalue
	.section	.text.lua_setglobal,"ax",@progbits
	.align	2
	.globl	lua_setglobal
	.hidden	lua_setglobal
	.type	lua_setglobal, @function
lua_setglobal:
	lw	a5,16(a0)
	addi	sp,sp,-12
	sw	s0,4(sp)
	mv	s0,a0
	lw	a0,36(a5)
	sw	s1,0(sp)
	mv	s1,a1
	li	a1,2
	sw	ra,8(sp)
	call	luaH_getint
	mv	a1,a0
	mv	a0,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	mv	a2,s1
	lw	s1,0(sp)
	addi	sp,sp,12
	tail	auxsetstr
	.size	lua_setglobal, .-lua_setglobal
	.section	.text.lua_settable,"ax",@progbits
	.align	2
	.globl	lua_settable
	.hidden	lua_settable
	.type	lua_settable, @function
lua_settable:
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	mv	s0,a0
	call	index2addr
	lw	a3,4(a0)
	li	a5,69
	mv	s1,a0
	li	a4,0
	beq	a3,a5,.L621
.L603:
	lw	a2,12(s0)
	mv	a1,s1
	mv	a0,s0
	addi	a3,a2,-8
	addi	a2,a2,-16
	call	luaV_finishset
	lw	a5,12(s0)
	lw	ra,12(sp)
	lw	s1,4(sp)
	addi	a5,a5,-16
	sw	a5,12(s0)
	lw	s0,8(sp)
	addi	sp,sp,16
	jr	ra
.L621:
	lw	a1,12(s0)
	lw	a0,0(a0)
	addi	a1,a1,-16
	call	luaH_get
	lw	a5,4(a0)
	mv	a4,a0
	beq	a5,zero,.L603
	lw	a5,12(s0)
	lw	a3,-4(a5)
	andi	a3,a3,64
	beq	a3,zero,.L604
	lw	a1,0(s1)
	lbu	a3,5(a1)
	andi	a3,a3,4
	beq	a3,zero,.L604
	lw	a3,-8(a5)
	lbu	a3,5(a3)
	andi	a3,a3,3
	beq	a3,zero,.L604
	sw	a0,0(sp)
	mv	a0,s0
	call	luaC_barrierback_
	lw	a5,12(s0)
	lw	a4,0(sp)
.L604:
	lw	a3,-8(a5)
	addi	a5,a5,-16
	lw	ra,12(sp)
	sw	a3,0(a4)
	lw	a3,12(a5)
	lw	s1,4(sp)
	sw	a3,4(a4)
	sw	a5,12(s0)
	lw	s0,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	lua_settable, .-lua_settable
	.section	.text.lua_setfield,"ax",@progbits
	.align	2
	.globl	lua_setfield
	.hidden	lua_setfield
	.type	lua_setfield, @function
lua_setfield:
	lw	a3,20(a0)
	mv	a5,a1
	ble	a1,zero,.L623
	lw	a1,0(a3)
	lw	a4,12(a0)
	slli	a5,a5,3
	add	a1,a1,a5
	bltu	a1,a4,.L624
	lla	a1,luaO_nilobject_
.L624:
	tail	auxsetstr
.L623:
	li	a4,-999424
	addi	t1,a4,-1575
	bge	a1,t1,.L629
	addi	a4,a4,-1576
	beq	a1,a4,.L630
	lw	a3,0(a3)
	li	t0,22
	lla	a1,luaO_nilobject_
	lw	t2,4(a3)
	beq	t2,t0,.L624
	lw	a3,0(a3)
	sub	a4,a4,a5
	lbu	t0,6(a3)
	bgt	a4,t0,.L624
	sub	t1,t1,a5
	slli	t1,t1,3
	add	a1,a3,t1
	j	.L624
.L629:
	lw	a1,12(a0)
	slli	a5,a5,3
	add	a1,a1,a5
	tail	auxsetstr
.L630:
	lw	a1,16(a0)
	addi	a1,a1,36
	j	.L624
	.size	lua_setfield, .-lua_setfield
	.section	.text.lua_seti,"ax",@progbits
	.align	2
	.globl	lua_seti
	.hidden	lua_seti
	.type	lua_seti, @function
lua_seti:
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	mv	s1,a2
	mv	s0,a0
	call	index2addr
	lw	a2,4(a0)
	li	a3,69
	mv	a5,a0
	li	a4,0
	beq	a2,a3,.L650
.L632:
	lw	a2,12(s0)
	li	a3,19
	mv	a1,a5
	sw	s1,0(a2)
	sw	a3,4(a2)
	addi	a3,a2,8
	sw	a3,12(s0)
	mv	a0,s0
	addi	a3,a2,-8
	call	luaV_finishset
	lw	a5,12(s0)
	lw	ra,12(sp)
	lw	s1,4(sp)
	addi	a5,a5,-16
	sw	a5,12(s0)
	lw	s0,8(sp)
	addi	sp,sp,16
	jr	ra
.L650:
	lw	a0,0(a0)
	mv	a1,s1
	sw	a5,0(sp)
	call	luaH_getint
	lw	a3,4(a0)
	lw	a5,0(sp)
	mv	a4,a0
	beq	a3,zero,.L632
	lw	a3,12(s0)
	lw	a2,-4(a3)
	andi	a2,a2,64
	beq	a2,zero,.L633
	lw	a1,0(a5)
	lbu	a5,5(a1)
	andi	a5,a5,4
	beq	a5,zero,.L633
	lw	a5,-8(a3)
	lbu	a5,5(a5)
	andi	a5,a5,3
	beq	a5,zero,.L633
	sw	a0,0(sp)
	mv	a0,s0
	call	luaC_barrierback_
	lw	a3,12(s0)
	lw	a4,0(sp)
.L633:
	lw	a2,-8(a3)
	addi	a5,a3,-8
	lw	ra,12(sp)
	sw	a2,0(a4)
	lw	a3,-4(a3)
	lw	s1,4(sp)
	sw	a3,4(a4)
	sw	a5,12(s0)
	lw	s0,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	lua_seti, .-lua_seti
	.section	.text.lua_rawset,"ax",@progbits
	.align	2
	.globl	lua_rawset
	.hidden	lua_rawset
	.type	lua_rawset, @function
lua_rawset:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	mv	s0,a0
	call	index2addr
	lw	a2,12(s0)
	lw	a1,0(a0)
	mv	s1,a0
	addi	a2,a2,-16
	mv	a0,s0
	call	luaH_set
	lw	a5,12(s0)
	lw	a4,-8(a5)
	sw	a4,0(a0)
	lw	a4,-4(a5)
	lw	a5,0(s1)
	sw	a4,4(a0)
	sb	zero,6(a5)
	lw	a5,12(s0)
	lw	a4,-4(a5)
	andi	a4,a4,64
	beq	a4,zero,.L652
	lw	a1,0(s1)
	lbu	a4,5(a1)
	andi	a4,a4,4
	beq	a4,zero,.L652
	lw	a4,-8(a5)
	lbu	a4,5(a4)
	andi	a4,a4,3
	bne	a4,zero,.L663
.L652:
	addi	a5,a5,-16
	lw	ra,8(sp)
	sw	a5,12(s0)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L663:
	mv	a0,s0
	call	luaC_barrierback_
	lw	a5,12(s0)
	j	.L652
	.size	lua_rawset, .-lua_rawset
	.section	.text.lua_rawseti,"ax",@progbits
	.align	2
	.globl	lua_rawseti
	.hidden	lua_rawseti
	.type	lua_rawseti, @function
lua_rawseti:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	mv	s0,a0
	sw	a2,0(sp)
	call	index2addr
	lw	a3,12(s0)
	lw	a1,0(a0)
	lw	a2,0(sp)
	mv	s1,a0
	addi	a3,a3,-8
	mv	a0,s0
	call	luaH_setint
	lw	a5,12(s0)
	lw	a4,-4(a5)
	andi	a4,a4,64
	beq	a4,zero,.L665
	lw	a1,0(s1)
	lbu	a4,5(a1)
	andi	a4,a4,4
	beq	a4,zero,.L665
	lw	a4,-8(a5)
	lbu	a4,5(a4)
	andi	a4,a4,3
	bne	a4,zero,.L676
.L665:
	addi	a5,a5,-8
	lw	ra,12(sp)
	sw	a5,12(s0)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L676:
	mv	a0,s0
	call	luaC_barrierback_
	lw	a5,12(s0)
	j	.L665
	.size	lua_rawseti, .-lua_rawseti
	.section	.text.lua_rawsetp,"ax",@progbits
	.align	2
	.globl	lua_rawsetp
	.hidden	lua_rawsetp
	.type	lua_rawsetp, @function
lua_rawsetp:
	addi	sp,sp,-24
	sw	ra,20(sp)
	sw	s0,16(sp)
	sw	s1,12(sp)
	mv	s0,a0
	sw	a2,0(sp)
	call	index2addr
	lw	a2,0(sp)
	li	a5,2
	mv	s1,a0
	sw	a2,4(sp)
	lw	a1,0(a0)
	addi	a2,sp,4
	mv	a0,s0
	sw	a5,8(sp)
	call	luaH_set
	lw	a5,12(s0)
	lw	a4,-8(a5)
	sw	a4,0(a0)
	lw	a4,-4(a5)
	sw	a4,4(a0)
	lw	a4,-4(a5)
	andi	a4,a4,64
	beq	a4,zero,.L678
	lw	a1,0(s1)
	lbu	a4,5(a1)
	andi	a4,a4,4
	beq	a4,zero,.L678
	lw	a4,-8(a5)
	lbu	a4,5(a4)
	andi	a4,a4,3
	bne	a4,zero,.L689
.L678:
	addi	a5,a5,-8
	lw	ra,20(sp)
	sw	a5,12(s0)
	lw	s0,16(sp)
	lw	s1,12(sp)
	addi	sp,sp,24
	jr	ra
.L689:
	mv	a0,s0
	call	luaC_barrierback_
	lw	a5,12(s0)
	j	.L678
	.size	lua_rawsetp, .-lua_rawsetp
	.section	.text.lua_setmetatable,"ax",@progbits
	.align	2
	.globl	lua_setmetatable
	.hidden	lua_setmetatable
	.type	lua_setmetatable, @function
lua_setmetatable:
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	s1,4(sp)
	mv	s0,a0
	sw	ra,12(sp)
	call	index2addr
	lw	a4,12(s0)
	mv	s1,a0
	lw	a5,-4(a4)
	beq	a5,zero,.L691
	lw	a5,4(a0)
	li	a3,5
	lw	a2,-8(a4)
	andi	a5,a5,15
	beq	a5,a3,.L692
	li	a3,7
	bne	a5,a3,.L694
	lw	a5,0(a0)
	sw	a2,8(a5)
	bne	a2,zero,.L698
.L717:
	lw	a4,12(s0)
.L724:
	addi	a4,a4,-8
	lw	ra,12(sp)
	sw	a4,12(s0)
	lw	s0,8(sp)
	lw	s1,4(sp)
	li	a0,1
	addi	sp,sp,16
	jr	ra
.L691:
	lw	a5,4(a0)
	li	a3,5
	andi	a5,a5,15
	beq	a5,a3,.L700
	li	a3,7
	li	a2,0
	beq	a5,a3,.L722
.L694:
	lw	a3,16(s0)
	addi	a5,a5,52
	slli	a5,a5,2
	add	a5,a3,a5
	sw	a2,12(a5)
	addi	a4,a4,-8
	lw	ra,12(sp)
	sw	a4,12(s0)
	lw	s0,8(sp)
	lw	s1,4(sp)
	li	a0,1
	addi	sp,sp,16
	jr	ra
.L722:
	lw	a5,0(s1)
	lw	ra,12(sp)
	lw	s1,4(sp)
	sw	zero,8(a5)
	lw	a4,12(s0)
	li	a0,1
	addi	a4,a4,-8
	sw	a4,12(s0)
	lw	s0,8(sp)
	addi	sp,sp,16
	jr	ra
.L692:
	lw	a5,0(a0)
	sw	a2,24(a5)
	beq	a2,zero,.L717
.L698:
	lw	a1,0(s1)
	lbu	a5,5(a1)
	andi	a5,a5,4
	beq	a5,zero,.L699
	lbu	a5,5(a2)
	andi	a5,a5,3
	bne	a5,zero,.L723
.L699:
	mv	a0,s0
	call	luaC_checkfinalizer
	lw	a4,12(s0)
	lw	ra,12(sp)
	lw	s1,4(sp)
	addi	a4,a4,-8
	sw	a4,12(s0)
	lw	s0,8(sp)
	li	a0,1
	addi	sp,sp,16
	jr	ra
.L700:
	lw	a5,0(s1)
	sw	zero,24(a5)
	lw	a4,12(s0)
	j	.L724
.L723:
	mv	a0,s0
	sw	a2,0(sp)
	call	luaC_barrier_
	lw	a1,0(s1)
	lw	a2,0(sp)
	j	.L699
	.size	lua_setmetatable, .-lua_setmetatable
	.section	.text.lua_setuservalue,"ax",@progbits
	.align	2
	.globl	lua_setuservalue
	.hidden	lua_setuservalue
	.type	lua_setuservalue, @function
lua_setuservalue:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lw	a2,20(a0)
	lw	a5,12(a0)
	mv	s0,a0
	ble	a1,zero,.L726
	lw	a4,0(a2)
	slli	a1,a1,3
	add	a4,a4,a1
	bgeu	a4,a5,.L731
.L727:
	lw	a1,0(a4)
	lw	a3,-8(a5)
	lw	a4,-4(a5)
	sw	a3,16(a1)
	sb	a4,6(a1)
	andi	a4,a4,64
	beq	a4,zero,.L730
	lbu	a4,5(a1)
	andi	a4,a4,4
	beq	a4,zero,.L730
	lw	a2,-8(a5)
	lbu	a4,5(a2)
	andi	a4,a4,3
	bne	a4,zero,.L744
.L730:
	addi	a5,a5,-8
	lw	ra,8(sp)
	sw	a5,12(s0)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
.L731:
	lla	a4,luaO_nilobject_
	j	.L727
.L726:
	li	a4,-999424
	addi	a0,a4,-1575
	bge	a1,a0,.L745
	addi	a3,a4,-1576
	beq	a1,a3,.L746
	lw	a2,0(a2)
	li	t1,22
	lla	a4,luaO_nilobject_
	lw	t0,4(a2)
	beq	t0,t1,.L727
	lw	a2,0(a2)
	sub	a3,a3,a1
	lbu	t1,6(a2)
	bgt	a3,t1,.L727
	sub	a0,a0,a1
	slli	a0,a0,3
	add	a4,a2,a0
	j	.L727
.L744:
	mv	a0,s0
	call	luaC_barrier_
	lw	a5,12(s0)
	j	.L730
.L745:
	slli	a4,a1,3
	add	a4,a5,a4
	j	.L727
.L746:
	lw	a4,16(s0)
	addi	a4,a4,36
	j	.L727
	.size	lua_setuservalue, .-lua_setuservalue
	.section	.text.lua_callk,"ax",@progbits
	.align	2
	.globl	lua_callk
	.hidden	lua_callk
	.type	lua_callk, @function
lua_callk:
	lw	a5,12(a0)
	addi	sp,sp,-12
	not	a1,a1
	sw	s0,4(sp)
	sw	s1,0(sp)
	slli	a1,a1,3
	sw	ra,8(sp)
	mv	s0,a0
	mv	s1,a2
	add	a1,a5,a1
	beq	a4,zero,.L748
	lhu	a5,108(a0)
	beq	a5,zero,.L755
.L748:
	mv	a2,s1
	mv	a0,s0
	call	luaD_callnoyield
.L749:
	li	a5,-1
	beq	s1,a5,.L756
.L747:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L756:
	lw	a5,20(s0)
	lw	a4,12(s0)
	lw	a3,4(a5)
	bgeu	a3,a4,.L747
	lw	ra,8(sp)
	lw	s0,4(sp)
	sw	a4,4(a5)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L755:
	lw	a5,20(a0)
	sw	a4,16(a5)
	sw	a3,24(a5)
	call	luaD_call
	j	.L749
	.size	lua_callk, .-lua_callk
	.section	.text.lua_pcallk,"ax",@progbits
	.align	2
	.globl	lua_pcallk
	.hidden	lua_pcallk
	.type	lua_pcallk, @function
lua_pcallk:
	addi	sp,sp,-32
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	ra,28(sp)
	mv	s0,a0
	mv	s1,a1
	mv	t1,a2
	bne	a3,zero,.L768
	lw	a2,32(a0)
.L758:
	lw	a1,12(s0)
	not	s1,s1
	slli	s1,s1,3
	add	a1,a1,s1
	sw	a1,12(sp)
	beq	a5,zero,.L759
	lhu	a0,108(s0)
	beq	a0,zero,.L760
.L759:
	mv	a4,a3
	mv	a0,s0
	sub	a3,a1,a2
	addi	a2,sp,12
	lla	a1,f_call
	sw	t1,16(sp)
	sw	t1,0(sp)
	call	luaD_pcall
	lw	t1,0(sp)
.L761:
	li	a5,-1
	beq	t1,a5,.L770
.L757:
	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	s1,20(sp)
	addi	sp,sp,32
	jr	ra
.L768:
	mv	a1,a3
	sw	a5,8(sp)
	sw	a4,4(sp)
	sw	a2,0(sp)
	call	index2addr
	lw	a2,32(s0)
	lw	a5,8(sp)
	lw	a4,4(sp)
	lw	t1,0(sp)
	sub	a3,a0,a2
	j	.L758
.L770:
	lw	a5,20(s0)
	lw	a4,12(s0)
	lw	a3,4(a5)
	bgeu	a3,a4,.L757
	lw	ra,28(sp)
	lw	s0,24(sp)
	sw	a4,4(a5)
	lw	s1,20(sp)
	addi	sp,sp,32
	jr	ra
.L760:
	lw	s1,20(s0)
	lw	t0,92(s0)
	sub	a2,a1,a2
	lhu	a0,34(s1)
	sw	a5,16(s1)
	sw	a2,28(s1)
	sw	a4,24(s1)
	sw	t0,20(s1)
	lbu	a4,116(s0)
	andi	a5,a0,-2
	sw	a3,92(s0)
	or	a5,a5,a4
	ori	a5,a5,16
	sh	a5,34(s1)
	mv	a2,t1
	mv	a0,s0
	sw	t1,0(sp)
	call	luaD_call
	lhu	a5,34(s1)
	lw	a4,20(s1)
	lw	t1,0(sp)
	andi	a5,a5,-17
	sh	a5,34(s1)
	li	a0,0
	sw	a4,92(s0)
	j	.L761
	.size	lua_pcallk, .-lua_pcallk
	.section	.rodata.lua_load.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"?"
	.section	.text.lua_load,"ax",@progbits
	.align	2
	.globl	lua_load
	.hidden	lua_load
	.type	lua_load, @function
lua_load:
	addi	sp,sp,-36
	sw	s0,28(sp)
	sw	s1,24(sp)
	sw	ra,32(sp)
	mv	s1,a3
	mv	s0,a0
	mv	a3,a2
	beq	s1,zero,.L783
.L772:
	mv	a2,a1
	mv	a0,s0
	addi	a1,sp,4
	sw	a4,0(sp)
	call	luaZ_init
	lw	a4,0(sp)
	mv	a2,s1
	addi	a1,sp,4
	mv	a3,a4
	mv	a0,s0
	call	luaD_protectedparser
	mv	s1,a0
	bne	a0,zero,.L771
	lw	a5,12(s0)
	lw	a5,-8(a5)
	lbu	a4,6(a5)
	bne	a4,zero,.L784
.L771:
	lw	ra,32(sp)
	lw	s0,28(sp)
	mv	a0,s1
	lw	s1,24(sp)
	addi	sp,sp,36
	jr	ra
.L783:
	lla	s1,.LC1
	j	.L772
.L784:
	lw	a4,16(s0)
	li	a1,2
	sw	a5,0(sp)
	lw	a0,36(a4)
	call	luaH_getint
	lw	a5,0(sp)
	lw	a1,16(a5)
	lw	a5,0(a0)
	lw	a4,0(a1)
	sw	a5,0(a4)
	lw	a5,4(a0)
	sw	a5,4(a4)
	andi	a5,a5,64
	beq	a5,zero,.L771
	addi	a5,a1,8
	bne	a4,a5,.L771
	mv	a0,s0
	call	luaC_upvalbarrier_
	j	.L771
	.size	lua_load, .-lua_load
	.section	.text.lua_dump,"ax",@progbits
	.align	2
	.globl	lua_dump
	.hidden	lua_dump
	.type	lua_dump, @function
lua_dump:
	lw	a4,12(a0)
	li	t1,70
	mv	a5,a1
	lw	t0,-4(a4)
	beq	t0,t1,.L787
	li	a0,1
	ret
.L787:
	lw	a1,-8(a4)
	mv	a4,a3
	mv	a3,a2
	lw	a1,12(a1)
	mv	a2,a5
	tail	luaU_dump
	.size	lua_dump, .-lua_dump
	.section	.text.lua_status,"ax",@progbits
	.align	2
	.globl	lua_status
	.hidden	lua_status
	.type	lua_status, @function
lua_status:
	lbu	a0,8(a0)
	ret
	.size	lua_status, .-lua_status
	.section	.text.lua_gc,"ax",@progbits
	.align	2
	.globl	lua_gc
	.hidden	lua_gc
	.type	lua_gc, @function
lua_gc:
	addi	sp,sp,-20
	sw	s1,8(sp)
	sw	ra,16(sp)
	sw	s0,12(sp)
	li	a5,9
	lw	s1,16(a0)
	bgtu	a1,a5,.L805
	lla	a3,.L792
	slli	a5,a1,2
	add	a5,a5,a3
	lw	a5,0(a5)
	mv	s0,a0
	add	a5,a5,a3
	jr	a5
	.section	.rodata.lua_gc,"a",@progbits
	.align	2
	.align	2
.L792:
	.word	.L800-.L792
	.word	.L799-.L792
	.word	.L798-.L792
	.word	.L797-.L792
	.word	.L796-.L792
	.word	.L795-.L792
	.word	.L794-.L792
	.word	.L793-.L792
	.word	.L805-.L792
	.word	.L791-.L792
	.section	.text.lua_gc
.L791:
	lbu	a0,51(s1)
.L789:
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L800:
	sb	zero,51(s1)
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	mv	a0,a1
	addi	sp,sp,20
	jr	ra
.L799:
	mv	a0,s1
	li	a1,0
	call	luaE_setdebt
	li	a5,1
	sb	a5,51(s1)
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	li	a0,0
	addi	sp,sp,20
	jr	ra
.L798:
	li	a1,0
	call	luaC_fullgc
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	li	a0,0
	addi	sp,sp,20
	jr	ra
.L797:
	lw	a1,8(s1)
	lw	a5,12(s1)
	lw	ra,16(sp)
	lw	s0,12(sp)
	add	a1,a1,a5
	lw	s1,8(sp)
	srli	a0,a1,10
	addi	sp,sp,20
	jr	ra
.L796:
	lw	a1,8(s1)
	lw	a5,12(s1)
	lw	ra,16(sp)
	lw	s0,12(sp)
	add	a1,a1,a5
	lw	s1,8(sp)
	andi	a0,a1,1023
	addi	sp,sp,20
	jr	ra
.L795:
	lbu	a5,51(s1)
	sw	a5,0(sp)
	li	a5,1
	sb	a5,51(s1)
	bne	a2,zero,.L801
	li	a1,-1600
	mv	a0,s1
	call	luaE_setdebt
	mv	a0,s0
	call	luaC_step
	lw	a5,0(sp)
	sb	a5,51(s1)
.L802:
	lbu	a1,49(s1)
	addi	a1,a1,-7
	seqz	a0,a1
	j	.L789
.L794:
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	a0,100(s1)
	sw	a2,100(s1)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L793:
	li	a5,40
	lw	a0,104(s1)
	bge	a2,a5,.L804
	li	a2,40
.L804:
	lw	ra,16(sp)
	lw	s0,12(sp)
	sw	a2,104(s1)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L805:
	li	a0,-1
	j	.L789
.L801:
	lw	a5,12(s1)
	slli	a2,a2,10
	mv	a0,s1
	add	a1,a2,a5
	sw	a1,4(sp)
	call	luaE_setdebt
	lw	a5,16(s0)
	lw	a1,4(sp)
	lw	a5,12(a5)
	bgt	a5,zero,.L808
.L803:
	lw	a5,0(sp)
	li	a0,0
	sb	a5,51(s1)
	bgt	a1,zero,.L802
	j	.L789
.L808:
	mv	a0,s0
	call	luaC_step
	lw	a1,4(sp)
	j	.L803
	.size	lua_gc, .-lua_gc
	.section	.text.lua_error,"ax",@progbits
	.align	2
	.globl	lua_error
	.hidden	lua_error
	.type	lua_error, @function
lua_error:
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	luaG_errormsg
	.size	lua_error, .-lua_error
	.section	.text.lua_next,"ax",@progbits
	.align	2
	.globl	lua_next
	.hidden	lua_next
	.type	lua_next, @function
lua_next:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lw	a3,20(a0)
	lw	a2,12(a0)
	mv	s0,a0
	ble	a1,zero,.L812
	lw	a5,0(a3)
	slli	a1,a1,3
	add	a5,a5,a1
	bgeu	a5,a2,.L818
.L813:
	lw	a1,0(a5)
	addi	a2,a2,-8
	mv	a0,s0
	call	luaH_next
	lw	a5,12(s0)
	beq	a0,zero,.L816
	addi	a5,a5,8
	lw	ra,8(sp)
	sw	a5,12(s0)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
.L816:
	addi	a5,a5,-8
	lw	ra,8(sp)
	sw	a5,12(s0)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
.L818:
	lla	a5,luaO_nilobject_
	j	.L813
.L812:
	li	a5,-999424
	addi	a0,a5,-1575
	bge	a1,a0,.L822
	addi	a4,a5,-1576
	beq	a1,a4,.L823
	lw	a3,0(a3)
	li	t1,22
	lla	a5,luaO_nilobject_
	lw	t0,4(a3)
	beq	t0,t1,.L813
	lw	a3,0(a3)
	sub	a4,a4,a1
	lbu	t1,6(a3)
	bgt	a4,t1,.L813
	sub	a0,a0,a1
	slli	a0,a0,3
	add	a5,a3,a0
	j	.L813
.L822:
	slli	a5,a1,3
	add	a5,a2,a5
	j	.L813
.L823:
	lw	a5,16(s0)
	addi	a5,a5,36
	j	.L813
	.size	lua_next, .-lua_next
	.section	.text.lua_concat,"ax",@progbits
	.align	2
	.globl	lua_concat
	.hidden	lua_concat
	.type	lua_concat, @function
lua_concat:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	sw	s1,0(sp)
	li	a4,1
	mv	s0,a0
	bgt	a1,a4,.L829
	beq	a1,zero,.L830
.L826:
	lw	a5,16(s0)
	lw	a5,12(a5)
	bgt	a5,zero,.L831
.L824:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L829:
	call	luaV_concat
	lw	a5,16(s0)
	lw	a5,12(a5)
	ble	a5,zero,.L824
.L831:
	mv	a0,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	tail	luaC_step
.L830:
	lw	s1,12(a0)
	li	a2,0
	lla	a1,.LC0
	call	luaS_newlstr
	sw	a0,0(s1)
	lbu	a4,4(a0)
	lw	a5,12(s0)
	ori	a4,a4,64
	sw	a4,4(s1)
	addi	a5,a5,8
	sw	a5,12(s0)
	j	.L826
	.size	lua_concat, .-lua_concat
	.section	.text.lua_len,"ax",@progbits
	.align	2
	.globl	lua_len
	.hidden	lua_len
	.type	lua_len, @function
lua_len:
	addi	sp,sp,-12
	sw	s0,4(sp)
	mv	a5,a1
	sw	ra,8(sp)
	lw	a3,20(a0)
	lw	a1,12(a0)
	mv	s0,a0
	ble	a5,zero,.L833
	lw	a2,0(a3)
	slli	a5,a5,3
	add	a2,a2,a5
	bltu	a2,a1,.L834
	lla	a2,luaO_nilobject_
.L834:
	mv	a0,s0
	call	luaV_objlen
	lw	a5,12(s0)
	lw	ra,8(sp)
	addi	a5,a5,8
	sw	a5,12(s0)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
.L833:
	li	a4,-999424
	slli	a2,a5,3
	addi	a0,a4,-1575
	add	a2,a1,a2
	bge	a5,a0,.L834
	addi	a4,a4,-1576
	beq	a5,a4,.L841
	lw	a3,0(a3)
	li	t1,22
	lla	a2,luaO_nilobject_
	lw	t0,4(a3)
	beq	t0,t1,.L834
	lw	a3,0(a3)
	sub	a4,a4,a5
	lbu	t1,6(a3)
	bgt	a4,t1,.L834
	sub	a0,a0,a5
	slli	a0,a0,3
	add	a2,a3,a0
	j	.L834
.L841:
	lw	a2,16(s0)
	addi	a2,a2,36
	j	.L834
	.size	lua_len, .-lua_len
	.section	.text.lua_getallocf,"ax",@progbits
	.align	2
	.globl	lua_getallocf
	.hidden	lua_getallocf
	.type	lua_getallocf, @function
lua_getallocf:
	beq	a1,zero,.L843
	lw	a5,16(a0)
	lw	a5,4(a5)
	sw	a5,0(a1)
.L843:
	lw	a5,16(a0)
	lw	a0,0(a5)
	ret
	.size	lua_getallocf, .-lua_getallocf
	.section	.text.lua_setallocf,"ax",@progbits
	.align	2
	.globl	lua_setallocf
	.hidden	lua_setallocf
	.type	lua_setallocf, @function
lua_setallocf:
	lw	a5,16(a0)
	sw	a2,4(a5)
	sw	a1,0(a5)
	ret
	.size	lua_setallocf, .-lua_setallocf
	.section	.text.lua_newuserdata,"ax",@progbits
	.align	2
	.globl	lua_newuserdata
	.hidden	lua_newuserdata
	.type	lua_newuserdata, @function
lua_newuserdata:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	s1,0(sp)
	mv	s0,a0
	sw	ra,8(sp)
	call	luaS_newudata
	lw	a4,16(s0)
	lw	a5,12(s0)
	li	a3,71
	lw	a4,12(a4)
	addi	a5,a5,8
	sw	a0,-8(a5)
	sw	a3,-4(a5)
	sw	a5,12(s0)
	mv	s1,a0
	ble	a4,zero,.L849
	mv	a0,s0
	call	luaC_step
.L849:
	lw	ra,8(sp)
	lw	s0,4(sp)
	addi	a0,s1,24
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
	.size	lua_newuserdata, .-lua_newuserdata
	.section	.rodata.lua_getupvalue.str1.4,"aMS",@progbits,1
	.align	2
.LC2:
	.string	"(*no name)"
	.section	.text.lua_getupvalue,"ax",@progbits
	.align	2
	.globl	lua_getupvalue
	.hidden	lua_getupvalue
	.type	lua_getupvalue, @function
lua_getupvalue:
	mv	a3,a0
	lw	a0,20(a0)
	ble	a1,zero,.L852
	lw	a5,0(a0)
	lw	a4,12(a3)
	slli	a1,a1,3
	add	a5,a5,a1
	bgeu	a5,a4,.L868
.L853:
	lw	a4,4(a5)
	lw	t1,0(a5)
	li	a1,6
	andi	a5,a4,63
	beq	a5,a1,.L856
.L869:
	li	a4,38
	li	a0,0
	bne	a5,a4,.L851
	ble	a2,zero,.L851
	lbu	a5,6(t1)
	bgt	a2,a5,.L851
	addi	a2,a2,1
	slli	a2,a2,3
	add	a2,t1,a2
	lla	a0,.LC0
.L858:
	lw	a5,12(a3)
	lw	a1,0(a2)
	addi	a4,a5,8
	sw	a1,0(a5)
	lw	a2,4(a2)
	sw	a2,4(a5)
	sw	a4,12(a3)
.L851:
	ret
.L868:
	lla	a5,luaO_nilobject_
	lw	a4,4(a5)
	lw	t1,0(a5)
	li	a1,6
	andi	a5,a4,63
	bne	a5,a1,.L869
.L856:
	lw	a5,12(t1)
	ble	a2,zero,.L865
	lw	a4,12(a5)
	bgt	a2,a4,.L865
	lw	a4,64(a5)
	addi	a5,a2,3
	slli	a5,a5,2
	slli	a2,a2,3
	add	a5,t1,a5
	add	a4,a4,a2
	lw	a2,0(a5)
	lw	a5,-8(a4)
	lla	a0,.LC2
	lw	a2,0(a2)
	beq	a5,zero,.L858
	addi	a0,a5,16
	j	.L858
.L852:
	li	a5,-999424
	addi	t1,a5,-1575
	bge	a1,t1,.L870
	addi	a4,a5,-1576
	beq	a1,a4,.L871
	lw	a0,0(a0)
	li	t0,22
	lla	a5,luaO_nilobject_
	lw	t2,4(a0)
	beq	t2,t0,.L853
	lw	a0,0(a0)
	sub	a4,a4,a1
	lbu	t0,6(a0)
	bgt	a4,t0,.L853
	sub	t1,t1,a1
	slli	t1,t1,3
	add	a5,a0,t1
	j	.L853
.L870:
	lw	a5,12(a3)
	slli	a1,a1,3
	add	a5,a5,a1
	j	.L853
.L865:
	li	a0,0
	ret
.L871:
	lw	a5,16(a3)
	addi	a5,a5,36
	j	.L853
	.size	lua_getupvalue, .-lua_getupvalue
	.section	.text.lua_setupvalue,"ax",@progbits
	.align	2
	.globl	lua_setupvalue
	.hidden	lua_setupvalue
	.type	lua_setupvalue, @function
lua_setupvalue:
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	mv	s1,a0
	mv	s0,a2
	call	index2addr
	lw	a5,4(a0)
	li	a4,6
	lw	a1,0(a0)
	andi	a5,a5,63
	beq	a5,a4,.L873
	li	a3,38
	li	a4,0
	bne	a5,a3,.L872
	ble	s0,zero,.L872
	lbu	a5,6(a1)
	bgt	s0,a5,.L872
	lw	a5,12(s1)
	addi	s0,s0,1
	slli	s0,s0,3
	lw	a4,-8(a5)
	addi	a3,a5,-8
	sw	a3,12(s1)
	add	s0,a1,s0
	sw	a4,0(s0)
	lw	a4,-4(a5)
	sw	a4,4(s0)
	lw	a4,-4(a5)
	andi	a4,a4,64
	bne	a4,zero,.L875
	lla	a4,.LC0
.L872:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	mv	a0,a4
	addi	sp,sp,16
	jr	ra
.L873:
	lw	a5,12(a1)
	ble	s0,zero,.L882
	lw	a4,12(a5)
	bgt	s0,a4,.L882
	lw	a5,64(a5)
	slli	a3,s0,3
	lla	a4,.LC2
	add	a5,a5,a3
	lw	a5,-8(a5)
	beq	a5,zero,.L876
	addi	a4,a5,16
.L876:
	addi	s0,s0,3
	slli	s0,s0,2
	add	a1,a1,s0
	lw	a5,12(s1)
	lw	a1,0(a1)
	lw	a2,-8(a5)
	lw	a3,0(a1)
	addi	a0,a5,-8
	sw	a0,12(s1)
	sw	a2,0(a3)
	lw	a5,-4(a5)
	sw	a5,4(a3)
	andi	a5,a5,64
	beq	a5,zero,.L872
	addi	a5,a1,8
	bne	a3,a5,.L872
	mv	a0,s1
	sw	a4,0(sp)
	call	luaC_upvalbarrier_
	lw	a4,0(sp)
	j	.L872
.L875:
	lbu	a3,5(a1)
	lla	a4,.LC0
	andi	a3,a3,4
	beq	a3,zero,.L872
	lw	a2,-8(a5)
	lbu	a5,5(a2)
	andi	a5,a5,3
	beq	a5,zero,.L872
	mv	a0,s1
	sw	a4,0(sp)
	call	luaC_barrier_
	lw	a4,0(sp)
	j	.L872
.L882:
	li	a4,0
	j	.L872
	.size	lua_setupvalue, .-lua_setupvalue
	.section	.text.lua_upvalueid,"ax",@progbits
	.align	2
	.globl	lua_upvalueid
	.hidden	lua_upvalueid
	.type	lua_upvalueid, @function
lua_upvalueid:
	lw	a3,20(a0)
	ble	a1,zero,.L891
	lw	a5,0(a3)
	lw	a4,12(a0)
	slli	a1,a1,3
	add	a5,a5,a1
	bgeu	a5,a4,.L900
.L892:
	lw	a4,4(a5)
	li	a3,6
	andi	a4,a4,63
	beq	a4,a3,.L895
.L902:
	li	a3,38
	bne	a4,a3,.L901
	lw	a0,0(a5)
	addi	a2,a2,1
	slli	a2,a2,3
	add	a0,a0,a2
	ret
.L901:
	li	a0,0
	ret
.L900:
	lla	a5,luaO_nilobject_
	lw	a4,4(a5)
	li	a3,6
	andi	a4,a4,63
	bne	a4,a3,.L902
.L895:
	lw	a5,0(a5)
	addi	a2,a2,3
	slli	a2,a2,2
	add	a5,a5,a2
	lw	a0,0(a5)
	ret
.L891:
	li	a5,-999424
	addi	t1,a5,-1575
	bge	a1,t1,.L903
	addi	a4,a5,-1576
	beq	a1,a4,.L904
	lw	a3,0(a3)
	li	a0,22
	lla	a5,luaO_nilobject_
	lw	t0,4(a3)
	beq	t0,a0,.L892
	lw	a3,0(a3)
	sub	a4,a4,a1
	lbu	a0,6(a3)
	bgt	a4,a0,.L892
	sub	t1,t1,a1
	slli	t1,t1,3
	add	a5,a3,t1
	j	.L892
.L903:
	lw	a5,12(a0)
	slli	a1,a1,3
	add	a5,a5,a1
	j	.L892
.L904:
	lw	a5,16(a0)
	addi	a5,a5,36
	j	.L892
	.size	lua_upvalueid, .-lua_upvalueid
	.section	.text.lua_upvaluejoin,"ax",@progbits
	.align	2
	.globl	lua_upvaluejoin
	.hidden	lua_upvaluejoin
	.type	lua_upvaluejoin, @function
lua_upvaluejoin:
	addi	sp,sp,-24
	sw	ra,20(sp)
	sw	a2,8(sp)
	sw	s0,16(sp)
	sw	s1,12(sp)
	mv	s0,a0
	mv	s1,a4
	sw	a3,4(sp)
	call	index2addr
	lw	a3,4(sp)
	sw	a0,0(sp)
	mv	a0,s0
	mv	a1,a3
	call	index2addr
	lw	a5,0(sp)
	lw	a2,8(sp)
	addi	s1,s1,3
	lw	a3,0(a5)
	slli	a4,a2,2
	lw	a5,0(a0)
	add	a3,a3,a4
	lw	a1,12(a3)
	mv	a0,s0
	sw	a5,4(sp)
	sw	a3,0(sp)
	call	luaC_upvdeccount
	lw	a5,4(sp)
	slli	s1,s1,2
	lw	a3,0(sp)
	add	a5,a5,s1
	lw	a1,0(a5)
	lw	a5,4(a1)
	lw	a4,0(a1)
	sw	a1,12(a3)
	addi	a5,a5,1
	sw	a5,4(a1)
	addi	a5,a1,8
	beq	a4,a5,.L906
	li	a5,1
	sw	a5,12(a1)
	lw	a1,12(a3)
	lw	a4,0(a1)
	lw	a5,4(a4)
	andi	a5,a5,64
	beq	a5,zero,.L905
	addi	a5,a1,8
	beq	a4,a5,.L910
.L905:
	lw	ra,20(sp)
	lw	s0,16(sp)
	lw	s1,12(sp)
	addi	sp,sp,24
	jr	ra
.L906:
	lw	a5,4(a4)
	andi	a5,a5,64
	beq	a5,zero,.L905
.L910:
	mv	a0,s0
	lw	s0,16(sp)
	lw	ra,20(sp)
	lw	s1,12(sp)
	addi	sp,sp,24
	tail	luaC_upvalbarrier_
	.size	lua_upvaluejoin, .-lua_upvaluejoin
	.hidden	lua_ident
	.globl	lua_ident
	.section	.rodata.lua_ident,"a"
	.align	2
	.type	lua_ident, @object
	.size	lua_ident, 129
lua_ident:
	.string	"$LuaVersion: Lua 5.3.4  Copyright (C) 1994-2017 Lua.org, PUC-Rio $$LuaAuthors: R. Ierusalimschy, L. H. de Figueiredo, W. Celes $"
	.section	.srodata.version.0,"a"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	version.0, @object
	.size	version.0, 4
version.0:
	.word	503
	.hidden	luaC_upvdeccount
	.hidden	luaS_newudata
	.hidden	luaV_objlen
	.hidden	luaV_concat
	.hidden	luaH_next
	.hidden	luaG_errormsg
	.hidden	luaC_fullgc
	.hidden	luaE_setdebt
	.hidden	luaU_dump
	.hidden	luaC_upvalbarrier_
	.hidden	luaD_protectedparser
	.hidden	luaZ_init
	.hidden	luaD_pcall
	.hidden	luaD_call
	.hidden	luaC_checkfinalizer
	.hidden	luaH_setint
	.hidden	luaH_set
	.hidden	luaH_resize
	.hidden	luaH_new
	.hidden	luaH_get
	.hidden	luaH_getint
	.hidden	luaF_newCclosure
	.hidden	luaO_pushvfstring
	.hidden	luaS_newlstr
	.hidden	luaH_getn
	.hidden	luaC_step
	.hidden	luaO_tostring
	.hidden	luaV_tointeger
	.hidden	luaO_str2num
	.hidden	luaV_lessequal
	.hidden	luaV_lessthan
	.hidden	luaO_arith
	.hidden	luaV_equalobj
	.hidden	luaV_tonumber_
	.hidden	luaT_typenames_
	.hidden	luaC_barrier_
	.hidden	luaD_rawrunprotected
	.hidden	luaD_callnoyield
	.hidden	luaC_barrierback_
	.hidden	luaV_finishset
	.hidden	luaH_getstr
	.hidden	luaV_finishget
	.hidden	luaS_new
	.hidden	luaD_growstack
	.hidden	luaO_nilobject_
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
