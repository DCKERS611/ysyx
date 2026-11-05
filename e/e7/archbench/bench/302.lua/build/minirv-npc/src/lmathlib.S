#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"lmathlib.c"
	.option nopic
	.text
	.section	.text.math_tan,"ax",@progbits
	.align	2
	.type	math_tan, @function
math_tan:
	addi	sp,sp,-12
	li	a1,1
	sw	ra,8(sp)
	sw	s0,4(sp)
	mv	s0,a0
	call	luaL_checknumber
	call	tan
	mv	a1,a0
	mv	a0,s0
	call	lua_pushnumber
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
	.size	math_tan, .-math_tan
	.section	.text.math_sqrt,"ax",@progbits
	.align	2
	.type	math_sqrt, @function
math_sqrt:
	addi	sp,sp,-12
	li	a1,1
	sw	ra,8(sp)
	sw	s0,4(sp)
	mv	s0,a0
	call	luaL_checknumber
	call	sqrt
	mv	a1,a0
	mv	a0,s0
	call	lua_pushnumber
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
	.size	math_sqrt, .-math_sqrt
	.section	.text.math_sin,"ax",@progbits
	.align	2
	.type	math_sin, @function
math_sin:
	addi	sp,sp,-12
	li	a1,1
	sw	ra,8(sp)
	sw	s0,4(sp)
	mv	s0,a0
	call	luaL_checknumber
	call	sin
	mv	a1,a0
	mv	a0,s0
	call	lua_pushnumber
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
	.size	math_sin, .-math_sin
	.section	.text.math_randomseed,"ax",@progbits
	.align	2
	.type	math_randomseed, @function
math_randomseed:
	addi	sp,sp,-12
	li	a1,1
	sw	ra,8(sp)
	call	luaL_checknumber
	call	srand
	call	rand
	lw	ra,8(sp)
	li	a0,0
	addi	sp,sp,12
	jr	ra
	.size	math_randomseed, .-math_randomseed
	.section	.rodata.math_random.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"wrong number of arguments"
	.align	2
.LC1:
	.string	"interval is empty"
	.align	2
.LC2:
	.string	"interval too large"
	.globl	__modsi3
	.section	.text.math_random,"ax",@progbits
	.align	2
	.type	math_random, @function
math_random:
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	mv	s1,a0
	call	lua_gettop
	li	a5,1
	mv	s0,a0
	beq	a0,a5,.L11
	li	a5,2
	beq	a0,a5,.L12
	beq	a0,zero,.L22
	lw	s0,8(sp)
	lw	ra,12(sp)
	mv	a0,s1
	lw	s1,4(sp)
	lla	a1,.LC0
	addi	sp,sp,16
	tail	luaL_error
.L11:
	li	a1,1
	mv	a0,s1
	call	luaL_checkinteger
	mv	a5,a0
	ble	a0,zero,.L23
.L15:
	sw	a5,0(sp)
	call	rand
	lw	a5,0(sp)
	sub	a1,a5,s0
	call	__modsi3
	add	a1,a0,s0
	add	a1,a1,s0
	mv	a0,s1
	call	lua_pushinteger
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	li	a0,1
	addi	sp,sp,16
	jr	ra
.L22:
	mv	a0,s1
	li	a1,0
	call	lua_pushnumber
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	li	a0,1
	addi	sp,sp,16
	jr	ra
.L12:
	li	a1,1
	mv	a0,s1
	call	luaL_checkinteger
	mv	s0,a0
	li	a1,2
	mv	a0,s1
	call	luaL_checkinteger
	mv	a5,a0
	bgt	s0,a0,.L24
.L17:
	bge	s0,zero,.L15
	li	a4,-2147483648
	xori	a4,a4,-1
	add	a4,s0,a4
	bge	a4,a5,.L15
	lla	a2,.LC2
	li	a1,1
	mv	a0,s1
	sw	a5,0(sp)
	call	luaL_argerror
	lw	a5,0(sp)
	j	.L15
.L24:
	sw	a0,0(sp)
	lla	a2,.LC1
	li	a1,1
	mv	a0,s1
	call	luaL_argerror
	lw	a5,0(sp)
	j	.L17
.L23:
	sw	a0,0(sp)
	lla	a2,.LC1
	li	a1,1
	mv	a0,s1
	call	luaL_argerror
	lw	a5,0(sp)
	j	.L15
	.size	math_random, .-math_random
	.section	.rodata.math_rad.str1.4,"aMS",@progbits,1
	.align	2
.LC3:
	.string	"AM Panic: "
	.align	2
.LC4:
	.string	"Assertion `0' failed"
	.align	2
.LC5:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/302.lua/src/lmathlib.c:194  \n"
	.section	.text.math_rad,"ax",@progbits
	.align	2
	.type	math_rad, @function
math_rad:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LC3
	li	a0,65
.L26:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L26
	lla	s0,.LC4
	li	a0,65
.L27:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L27
	lla	s0,.LC5
	li	a0,32
.L28:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L28
	li	a0,1
	call	halt
	.size	math_rad, .-math_rad
	.section	.rodata.math_deg.str1.4,"aMS",@progbits,1
	.align	2
.LC6:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/302.lua/src/lmathlib.c:188  \n"
	.section	.text.math_deg,"ax",@progbits
	.align	2
	.type	math_deg, @function
math_deg:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LC3
	li	a0,65
.L34:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L34
	lla	s0,.LC4
	li	a0,65
.L35:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L35
	lla	s0,.LC6
	li	a0,32
.L36:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L36
	li	a0,1
	call	halt
	.size	math_deg, .-math_deg
	.section	.rodata.math_min.str1.4,"aMS",@progbits,1
	.align	2
.LC7:
	.string	"value expected"
	.section	.text.math_min,"ax",@progbits
	.align	2
	.type	math_min, @function
math_min:
	addi	sp,sp,-20
	sw	s1,8(sp)
	sw	ra,16(sp)
	sw	s0,12(sp)
	mv	s1,a0
	call	lua_gettop
	sw	a0,4(sp)
	ble	a0,zero,.L52
	lw	a4,4(sp)
	li	a5,1
	beq	a4,a5,.L46
	li	a1,2
	li	s0,1
.L45:
	mv	a2,s0
	li	a3,1
	mv	a0,s1
	sw	a1,0(sp)
	call	lua_compare
	lw	a1,0(sp)
	beq	a0,zero,.L44
	mv	s0,a1
.L44:
	lw	a5,4(sp)
	addi	a1,a1,1
	bge	a5,a1,.L45
.L43:
	mv	a0,s1
	mv	a1,s0
	call	lua_pushvalue
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	li	a0,1
	addi	sp,sp,20
	jr	ra
.L52:
	lla	a2,.LC7
	li	a1,1
	mv	a0,s1
	call	luaL_argerror
	li	s0,1
	j	.L43
.L46:
	li	s0,1
	j	.L43
	.size	math_min, .-math_min
	.section	.text.math_max,"ax",@progbits
	.align	2
	.type	math_max, @function
math_max:
	addi	sp,sp,-20
	sw	s1,8(sp)
	sw	ra,16(sp)
	sw	s0,12(sp)
	mv	s1,a0
	call	lua_gettop
	sw	a0,4(sp)
	ble	a0,zero,.L64
	lw	a4,4(sp)
	li	a5,1
	beq	a4,a5,.L58
	li	a2,2
	li	s0,1
.L57:
	mv	a1,s0
	li	a3,1
	mv	a0,s1
	sw	a2,0(sp)
	call	lua_compare
	lw	a2,0(sp)
	beq	a0,zero,.L56
	mv	s0,a2
.L56:
	lw	a5,4(sp)
	addi	a2,a2,1
	bge	a5,a2,.L57
.L55:
	mv	a0,s1
	mv	a1,s0
	call	lua_pushvalue
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	li	a0,1
	addi	sp,sp,20
	jr	ra
.L64:
	lla	a2,.LC7
	li	a1,1
	mv	a0,s1
	call	luaL_argerror
	li	s0,1
	j	.L55
.L58:
	li	s0,1
	j	.L55
	.size	math_max, .-math_max
	.globl	__divsi3
	.section	.text.math_log,"ax",@progbits
	.align	2
	.type	math_log, @function
math_log:
	addi	sp,sp,-16
	li	a1,1
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	mv	s0,a0
	call	luaL_checknumber
	mv	s1,a0
	li	a1,2
	mv	a0,s0
	call	lua_type
	ble	a0,zero,.L71
	li	a1,2
	mv	a0,s0
	call	luaL_checknumber
	li	a4,2
	beq	a0,a4,.L72
	li	a4,10
	beq	a0,a4,.L73
	sw	a0,0(sp)
	mv	a0,s1
	call	log
	lw	a5,0(sp)
	mv	s1,a0
	mv	a0,a5
	call	log
	mv	a1,a0
	mv	a0,s1
	call	__divsi3
	mv	a1,a0
.L67:
	mv	a0,s0
	call	lua_pushnumber
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	li	a0,1
	addi	sp,sp,16
	jr	ra
.L71:
	mv	a0,s1
	call	log
	mv	a1,a0
	j	.L67
.L72:
	mv	a0,s1
	call	log2
	mv	a1,a0
	j	.L67
.L73:
	mv	a0,s1
	call	log10
	mv	a1,a0
	j	.L67
	.size	math_log, .-math_log
	.section	.text.math_ult,"ax",@progbits
	.align	2
	.type	math_ult, @function
math_ult:
	addi	sp,sp,-12
	li	a1,1
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	mv	s0,a0
	call	luaL_checkinteger
	mv	s1,a0
	li	a1,2
	mv	a0,s0
	call	luaL_checkinteger
	sltu	a1,s1,a0
	mv	a0,s0
	call	lua_pushboolean
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
	.size	math_ult, .-math_ult
	.section	.rodata.math_fmod.str1.4,"aMS",@progbits,1
	.align	2
.LC8:
	.string	"zero"
	.section	.text.math_fmod,"ax",@progbits
	.align	2
	.type	math_fmod, @function
math_fmod:
	addi	sp,sp,-12
	li	a1,1
	sw	s0,4(sp)
	sw	ra,8(sp)
	sw	s1,0(sp)
	mv	s0,a0
	call	lua_isinteger
	beq	a0,zero,.L77
	li	a1,2
	mv	a0,s0
	call	lua_isinteger
	bne	a0,zero,.L88
.L77:
	li	a1,1
	mv	a0,s0
	call	luaL_checknumber
	mv	s1,a0
	li	a1,2
	mv	a0,s0
	call	luaL_checknumber
	mv	a1,a0
	mv	a0,s1
	call	fmod
	mv	a1,a0
	mv	a0,s0
	call	lua_pushnumber
.L80:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
.L88:
	li	a2,0
	li	a1,2
	mv	a0,s0
	call	lua_tointegerx
	addi	a4,a0,1
	li	a5,1
	mv	s1,a0
	bgtu	a4,a5,.L78
	beq	a0,zero,.L89
.L79:
	li	a1,0
	mv	a0,s0
	call	lua_pushinteger
	j	.L80
.L78:
	li	a2,0
	mv	a0,s0
	li	a1,1
	call	lua_tointegerx
	mv	a1,s1
	call	__modsi3
	mv	a1,a0
	mv	a0,s0
	call	lua_pushinteger
	j	.L80
.L89:
	lla	a2,.LC8
	li	a1,2
	mv	a0,s0
	call	luaL_argerror
	j	.L79
	.size	math_fmod, .-math_fmod
	.section	.text.math_exp,"ax",@progbits
	.align	2
	.type	math_exp, @function
math_exp:
	addi	sp,sp,-12
	li	a1,1
	sw	ra,8(sp)
	sw	s0,4(sp)
	mv	s0,a0
	call	luaL_checknumber
	call	exp
	mv	a1,a0
	mv	a0,s0
	call	lua_pushnumber
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
	.size	math_exp, .-math_exp
	.section	.text.math_cos,"ax",@progbits
	.align	2
	.type	math_cos, @function
math_cos:
	addi	sp,sp,-12
	li	a1,1
	sw	ra,8(sp)
	sw	s0,4(sp)
	mv	s0,a0
	call	luaL_checknumber
	call	cos
	mv	a1,a0
	mv	a0,s0
	call	lua_pushnumber
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
	.size	math_cos, .-math_cos
	.section	.text.math_atan,"ax",@progbits
	.align	2
	.type	math_atan, @function
math_atan:
	addi	sp,sp,-12
	li	a1,1
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	mv	s0,a0
	call	luaL_checknumber
	li	a2,1
	mv	s1,a0
	li	a1,2
	mv	a0,s0
	call	luaL_optnumber
	mv	a1,a0
	mv	a0,s1
	call	atan2
	mv	a1,a0
	mv	a0,s0
	call	lua_pushnumber
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
	.size	math_atan, .-math_atan
	.section	.text.math_asin,"ax",@progbits
	.align	2
	.type	math_asin, @function
math_asin:
	addi	sp,sp,-12
	li	a1,1
	sw	ra,8(sp)
	sw	s0,4(sp)
	mv	s0,a0
	call	luaL_checknumber
	call	asin
	mv	a1,a0
	mv	a0,s0
	call	lua_pushnumber
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
	.size	math_asin, .-math_asin
	.section	.text.math_acos,"ax",@progbits
	.align	2
	.type	math_acos, @function
math_acos:
	addi	sp,sp,-12
	li	a1,1
	sw	ra,8(sp)
	sw	s0,4(sp)
	mv	s0,a0
	call	luaL_checknumber
	call	acos
	mv	a1,a0
	mv	a0,s0
	call	lua_pushnumber
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
	.size	math_acos, .-math_acos
	.section	.rodata.math_type.str1.4,"aMS",@progbits,1
	.align	2
.LC9:
	.string	"integer"
	.align	2
.LC10:
	.string	"float"
	.section	.text.math_type,"ax",@progbits
	.align	2
	.type	math_type, @function
math_type:
	addi	sp,sp,-12
	li	a1,1
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	lua_type
	li	a5,3
	li	a1,1
	beq	a0,a5,.L105
	mv	a0,s0
	call	luaL_checkany
	mv	a0,s0
	call	lua_pushnil
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
.L105:
	mv	a0,s0
	call	lua_isinteger
	beq	a0,zero,.L102
	mv	a0,s0
	lla	a1,.LC9
	call	lua_pushstring
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
.L102:
	mv	a0,s0
	lla	a1,.LC10
	call	lua_pushstring
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
	.size	math_type, .-math_type
	.section	.text.math_ceil,"ax",@progbits
	.align	2
	.type	math_ceil, @function
math_ceil:
	addi	sp,sp,-12
	li	a1,1
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	lua_isinteger
	li	a1,1
	beq	a0,zero,.L107
	mv	a0,s0
	call	lua_settop
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
.L107:
	mv	a0,s0
	call	luaL_checknumber
	call	ceil
	mv	a1,a0
	mv	a0,s0
	call	lua_pushinteger
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
	.size	math_ceil, .-math_ceil
	.section	.text.math_modf,"ax",@progbits
	.align	2
	.type	math_modf, @function
math_modf:
	addi	sp,sp,-20
	li	a1,1
	sw	s0,12(sp)
	sw	ra,16(sp)
	sw	s1,8(sp)
	mv	s0,a0
	call	lua_isinteger
	beq	a0,zero,.L111
	mv	a0,s0
	li	a1,1
	call	lua_settop
	mv	a0,s0
	li	a1,0
	call	lua_pushnumber
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	li	a0,2
	addi	sp,sp,20
	jr	ra
.L111:
	mv	s1,a0
	li	a1,1
	mv	a0,s0
	call	luaL_checknumber
	sw	a0,0(sp)
	blt	a0,zero,.L117
	call	floor
	mv	a1,a0
.L114:
	mv	a0,s0
	sw	a1,4(sp)
	call	lua_pushinteger
	lw	a5,0(sp)
	lw	a1,4(sp)
	beq	a5,a1,.L115
	sub	s1,a5,a1
.L115:
	mv	a0,s0
	mv	a1,s1
	call	lua_pushnumber
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	li	a0,2
	addi	sp,sp,20
	jr	ra
.L117:
	call	ceil
	mv	a1,a0
	j	.L114
	.size	math_modf, .-math_modf
	.section	.text.math_floor,"ax",@progbits
	.align	2
	.type	math_floor, @function
math_floor:
	addi	sp,sp,-12
	li	a1,1
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	lua_isinteger
	li	a1,1
	beq	a0,zero,.L119
	mv	a0,s0
	call	lua_settop
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
.L119:
	mv	a0,s0
	call	luaL_checknumber
	call	floor
	mv	a1,a0
	mv	a0,s0
	call	lua_pushinteger
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
	.size	math_floor, .-math_floor
	.section	.text.math_toint,"ax",@progbits
	.align	2
	.type	math_toint, @function
math_toint:
	addi	sp,sp,-16
	mv	a2,sp
	li	a1,1
	sw	s0,8(sp)
	sw	ra,12(sp)
	mv	s0,a0
	call	lua_tointegerx
	lw	a5,0(sp)
	beq	a5,zero,.L123
	mv	a1,a0
	mv	a0,s0
	call	lua_pushinteger
	lw	ra,12(sp)
	lw	s0,8(sp)
	li	a0,1
	addi	sp,sp,16
	jr	ra
.L123:
	mv	a0,s0
	li	a1,1
	call	luaL_checkany
	mv	a0,s0
	call	lua_pushnil
	lw	ra,12(sp)
	lw	s0,8(sp)
	li	a0,1
	addi	sp,sp,16
	jr	ra
	.size	math_toint, .-math_toint
	.section	.text.math_abs,"ax",@progbits
	.align	2
	.type	math_abs, @function
math_abs:
	addi	sp,sp,-12
	li	a1,1
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	lua_isinteger
	beq	a0,zero,.L127
	li	a2,0
	li	a1,1
	mv	a0,s0
	call	lua_tointegerx
	srai	a1,a0,31
	xor	a0,a0,a1
	sub	a1,a0,a1
	mv	a0,s0
	call	lua_pushinteger
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
.L127:
	li	a1,1
	mv	a0,s0
	call	luaL_checknumber
	call	fabs
	mv	a1,a0
	mv	a0,s0
	call	lua_pushnumber
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
	.size	math_abs, .-math_abs
	.section	.rodata.luaopen_math.str1.4,"aMS",@progbits,1
	.align	2
.LC11:
	.string	"maxinteger"
	.align	2
.LC12:
	.string	"mininteger"
	.section	.text.luaopen_math,"ax",@progbits
	.align	2
	.globl	luaopen_math
	.hidden	luaopen_math
	.type	luaopen_math, @function
luaopen_math:
	addi	sp,sp,-12
	li	a2,68
	li	a1,503
	sw	ra,8(sp)
	sw	s0,4(sp)
	mv	s0,a0
	call	luaL_checkversion_
	mv	a0,s0
	li	a2,27
	li	a1,0
	call	lua_createtable
	li	a2,0
	mv	a0,s0
	lla	a1,.LANCHOR0
	call	luaL_setfuncs
	li	a1,-2147483648
	mv	a0,s0
	xori	a1,a1,-1
	call	lua_pushinteger
	lla	a2,.LC11
	mv	a0,s0
	li	a1,-2
	call	lua_setfield
	mv	a0,s0
	li	a1,-2147483648
	call	lua_pushinteger
	mv	a0,s0
	lla	a2,.LC12
	li	a1,-2
	call	lua_setfield
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
	.size	luaopen_math, .-luaopen_math
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC13:
	.string	"abs"
	.align	2
.LC14:
	.string	"acos"
	.align	2
.LC15:
	.string	"asin"
	.align	2
.LC16:
	.string	"atan"
	.align	2
.LC17:
	.string	"ceil"
	.align	2
.LC18:
	.string	"cos"
	.align	2
.LC19:
	.string	"deg"
	.align	2
.LC20:
	.string	"exp"
	.align	2
.LC21:
	.string	"tointeger"
	.align	2
.LC22:
	.string	"floor"
	.align	2
.LC23:
	.string	"fmod"
	.align	2
.LC24:
	.string	"ult"
	.align	2
.LC25:
	.string	"log"
	.align	2
.LC26:
	.string	"max"
	.align	2
.LC27:
	.string	"min"
	.align	2
.LC28:
	.string	"modf"
	.align	2
.LC29:
	.string	"rad"
	.align	2
.LC30:
	.string	"random"
	.align	2
.LC31:
	.string	"randomseed"
	.align	2
.LC32:
	.string	"sin"
	.align	2
.LC33:
	.string	"sqrt"
	.align	2
.LC34:
	.string	"tan"
	.align	2
.LC35:
	.string	"type"
	.align	2
.LC36:
	.string	"pi"
	.align	2
.LC37:
	.string	"huge"
	.section	.rodata.mathlib,"a"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	mathlib, @object
	.size	mathlib, 224
mathlib:
	.word	.LC13
	.word	math_abs
	.word	.LC14
	.word	math_acos
	.word	.LC15
	.word	math_asin
	.word	.LC16
	.word	math_atan
	.word	.LC17
	.word	math_ceil
	.word	.LC18
	.word	math_cos
	.word	.LC19
	.word	math_deg
	.word	.LC20
	.word	math_exp
	.word	.LC21
	.word	math_toint
	.word	.LC22
	.word	math_floor
	.word	.LC23
	.word	math_fmod
	.word	.LC24
	.word	math_ult
	.word	.LC25
	.word	math_log
	.word	.LC26
	.word	math_max
	.word	.LC27
	.word	math_min
	.word	.LC28
	.word	math_modf
	.word	.LC29
	.word	math_rad
	.word	.LC30
	.word	math_random
	.word	.LC31
	.word	math_randomseed
	.word	.LC32
	.word	math_sin
	.word	.LC33
	.word	math_sqrt
	.word	.LC34
	.word	math_tan
	.word	.LC35
	.word	math_type
	.word	.LC36
	.word	0
	.word	.LC37
	.word	0
	.word	.LC11
	.word	0
	.word	.LC12
	.word	0
	.word	0
	.word	0
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
