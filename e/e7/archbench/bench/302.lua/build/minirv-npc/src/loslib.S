#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"loslib.c"
	.option nopic
	.text
	.section	.rodata.getfield.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"field '%s' is not an integer"
	.align	2
.LC1:
	.string	"field '%s' missing in date table"
	.align	2
.LC2:
	.string	"field '%s' is out-of-bound"
	.section	.text.getfield,"ax",@progbits
	.align	2
	.type	getfield, @function
getfield:
	addi	sp,sp,-28
	mv	a4,a1
	sw	s0,20(sp)
	li	a1,-1
	mv	s0,a2
	mv	a2,a4
	sw	a4,4(sp)
	sw	a3,8(sp)
	sw	ra,24(sp)
	sw	s1,16(sp)
	sw	a0,0(sp)
	call	lua_getfield
	lw	a5,0(sp)
	mv	s1,a0
	addi	a2,sp,12
	mv	a0,a5
	li	a1,-1
	call	lua_tointegerx
	lw	a3,12(sp)
	lw	a5,0(sp)
	lw	a4,4(sp)
	bne	a3,zero,.L2
	bne	s1,zero,.L10
	li	a3,-1
	beq	s0,a3,.L11
.L5:
	li	a1,-2
	mv	a0,a5
	call	lua_settop
.L1:
	lw	ra,24(sp)
	mv	a0,s0
	lw	s0,20(sp)
	lw	s1,16(sp)
	addi	sp,sp,28
	jr	ra
.L2:
	lw	a1,8(sp)
	li	a3,1073741824
	addi	a3,a3,-1
	li	a2,-2147483648
	add	a3,a0,a3
	xori	a2,a2,-2
	sub	s0,a0,a1
	bleu	a3,a2,.L5
	mv	a2,a4
	lla	a1,.LC2
	mv	a0,a5
	call	luaL_error
	mv	s0,a0
	lw	ra,24(sp)
	mv	a0,s0
	lw	s0,20(sp)
	lw	s1,16(sp)
	addi	sp,sp,28
	jr	ra
.L10:
	mv	a2,a4
	lla	a1,.LC0
	mv	a0,a5
	call	luaL_error
	mv	s0,a0
	lw	ra,24(sp)
	mv	a0,s0
	lw	s0,20(sp)
	lw	s1,16(sp)
	addi	sp,sp,28
	jr	ra
.L11:
	mv	a2,a4
	lla	a1,.LC1
	mv	a0,a5
	call	luaL_error
	mv	s0,a0
	j	.L1
	.size	getfield, .-getfield
	.section	.rodata.os_setlocale.str1.4,"aMS",@progbits,1
	.align	2
.LC3:
	.string	"all"
	.section	.text.os_setlocale,"ax",@progbits
	.align	2
	.type	os_setlocale, @function
os_setlocale:
	addi	sp,sp,-12
	li	a3,0
	li	a2,0
	li	a1,1
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	mv	s0,a0
	call	luaL_optlstring
	mv	s1,a0
	lla	a3,.LANCHOR0
	lla	a2,.LC3
	li	a1,2
	mv	a0,s0
	call	luaL_checkoption
	slli	a0,a0,2
	lla	a5,.LANCHOR1
	add	a5,a5,a0
	lw	a0,0(a5)
	mv	a1,s1
	call	setlocale
	mv	a1,a0
	mv	a0,s0
	call	lua_pushstring
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
	.size	os_setlocale, .-os_setlocale
	.section	.text.os_rename,"ax",@progbits
	.align	2
	.type	os_rename, @function
os_rename:
	addi	sp,sp,-12
	li	a2,0
	li	a1,1
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	mv	s0,a0
	call	luaL_checklstring
	li	a2,0
	mv	s1,a0
	li	a1,2
	mv	a0,s0
	call	luaL_checklstring
	mv	a1,a0
	mv	a0,s1
	call	rename
	seqz	a1,a0
	mv	a0,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	li	a2,0
	addi	sp,sp,12
	tail	luaL_fileresult
	.size	os_rename, .-os_rename
	.section	.text.os_remove,"ax",@progbits
	.align	2
	.type	os_remove, @function
os_remove:
	addi	sp,sp,-12
	li	a1,1
	li	a2,0
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	mv	s0,a0
	call	luaL_checklstring
	mv	s1,a0
	call	remove
	seqz	a1,a0
	mv	a0,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	mv	a2,s1
	lw	s1,0(sp)
	addi	sp,sp,12
	tail	luaL_fileresult
	.size	os_remove, .-os_remove
	.section	.rodata.os_getenv.str1.4,"aMS",@progbits,1
	.align	2
.LC4:
	.string	"AM Panic: "
	.align	2
.LC5:
	.string	"Assertion `0' failed"
	.align	2
.LC6:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/302.lua/src/loslib.c:173  \n"
	.section	.text.os_getenv,"ax",@progbits
	.align	2
	.type	os_getenv, @function
os_getenv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LC4
	li	a0,65
.L19:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L19
	lla	s0,.LC5
	li	a0,65
.L20:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L20
	lla	s0,.LC6
	li	a0,32
.L21:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L21
	li	a0,1
	call	halt
	.size	os_getenv, .-os_getenv
	.section	.rodata.os_difftime.str1.4,"aMS",@progbits,1
	.align	2
.LC7:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/302.lua/src/loslib.c:333  \n"
	.section	.text.os_difftime,"ax",@progbits
	.align	2
	.type	os_difftime, @function
os_difftime:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LC4
	li	a0,65
.L27:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L27
	lla	s0,.LC5
	li	a0,65
.L28:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L28
	lla	s0,.LC7
	li	a0,32
.L29:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L29
	li	a0,1
	call	halt
	.size	os_difftime, .-os_difftime
	.section	.text.os_exit,"ax",@progbits
	.align	2
	.type	os_exit, @function
os_exit:
	addi	sp,sp,-12
	li	a1,1
	sw	s0,4(sp)
	sw	ra,8(sp)
	sw	s1,0(sp)
	mv	s0,a0
	call	lua_type
	li	a5,1
	beq	a0,a5,.L43
	li	a2,0
	li	a1,1
	mv	a0,s0
	call	luaL_optinteger
	mv	s1,a0
.L36:
	li	a1,2
	mv	a0,s0
	call	lua_toboolean
	bne	a0,zero,.L44
.L37:
	bne	s0,zero,.L45
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	li	a0,0
	addi	sp,sp,12
	jr	ra
.L44:
	mv	a0,s0
	call	lua_close
	j	.L37
.L43:
	li	a1,1
	mv	a0,s0
	call	lua_toboolean
	seqz	s1,a0
	j	.L36
.L45:
	mv	a0,s1
	call	exit
	.size	os_exit, .-os_exit
	.section	.text.os_execute,"ax",@progbits
	.align	2
	.type	os_execute, @function
os_execute:
	addi	sp,sp,-12
	li	a1,1
	li	a3,0
	li	a2,0
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	mv	s0,a0
	call	luaL_optlstring
	mv	s1,a0
	call	system
	mv	a1,a0
	mv	a0,s0
	beq	s1,zero,.L47
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	tail	luaL_execresult
.L47:
	call	lua_pushboolean
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
	.size	os_execute, .-os_execute
	.globl	__divsi3
	.section	.text.os_clock,"ax",@progbits
	.align	2
	.type	os_clock, @function
os_clock:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	mv	s0,a0
	call	clock
	li	a1,999424
	addi	a1,a1,576
	call	__divsi3
	mv	a1,a0
	mv	a0,s0
	call	lua_pushnumber
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
	.size	os_clock, .-os_clock
	.section	.rodata.os_tmpname.str1.4,"aMS",@progbits,1
	.align	2
.LC8:
	.string	"unable to generate a unique filename"
	.section	.text.os_tmpname,"ax",@progbits
	.align	2
	.type	os_tmpname, @function
os_tmpname:
	addi	sp,sp,-32
	sw	s0,24(sp)
	mv	s0,a0
	mv	a0,sp
	sw	ra,28(sp)
	call	tmpnam
	beq	a0,zero,.L55
	mv	a1,sp
	mv	a0,s0
	call	lua_pushstring
	lw	ra,28(sp)
	lw	s0,24(sp)
	li	a0,1
	addi	sp,sp,32
	jr	ra
.L55:
	mv	a0,s0
	lla	a1,.LC8
	call	luaL_error
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	os_tmpname, .-os_tmpname
	.section	.rodata.setallfields.str1.4,"aMS",@progbits,1
	.align	2
.LC9:
	.string	"sec"
	.align	2
.LC10:
	.string	"min"
	.align	2
.LC11:
	.string	"hour"
	.align	2
.LC12:
	.string	"day"
	.align	2
.LC13:
	.string	"month"
	.align	2
.LC14:
	.string	"year"
	.align	2
.LC15:
	.string	"wday"
	.align	2
.LC16:
	.string	"yday"
	.align	2
.LC17:
	.string	"isdst"
	.section	.text.setallfields,"ax",@progbits
	.align	2
	.type	setallfields, @function
setallfields:
	addi	sp,sp,-12
	sw	s1,0(sp)
	mv	s1,a1
	lw	a1,0(a1)
	sw	ra,8(sp)
	sw	s0,4(sp)
	mv	s0,a0
	call	lua_pushinteger
	lla	a2,.LC9
	li	a1,-2
	mv	a0,s0
	call	lua_setfield
	lw	a1,4(s1)
	mv	a0,s0
	call	lua_pushinteger
	lla	a2,.LC10
	li	a1,-2
	mv	a0,s0
	call	lua_setfield
	lw	a1,8(s1)
	mv	a0,s0
	call	lua_pushinteger
	lla	a2,.LC11
	li	a1,-2
	mv	a0,s0
	call	lua_setfield
	lw	a1,12(s1)
	mv	a0,s0
	call	lua_pushinteger
	lla	a2,.LC12
	li	a1,-2
	mv	a0,s0
	call	lua_setfield
	lw	a1,16(s1)
	mv	a0,s0
	addi	a1,a1,1
	call	lua_pushinteger
	lla	a2,.LC13
	li	a1,-2
	mv	a0,s0
	call	lua_setfield
	lw	a1,20(s1)
	mv	a0,s0
	addi	a1,a1,1900
	call	lua_pushinteger
	lla	a2,.LC14
	li	a1,-2
	mv	a0,s0
	call	lua_setfield
	lw	a1,24(s1)
	mv	a0,s0
	addi	a1,a1,1
	call	lua_pushinteger
	lla	a2,.LC15
	li	a1,-2
	mv	a0,s0
	call	lua_setfield
	lw	a1,28(s1)
	mv	a0,s0
	addi	a1,a1,1
	call	lua_pushinteger
	li	a1,-2
	lla	a2,.LC16
	mv	a0,s0
	call	lua_setfield
	lw	a1,32(s1)
	blt	a1,zero,.L56
	mv	a0,s0
	call	lua_pushboolean
	mv	a0,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	lla	a2,.LC17
	li	a1,-2
	addi	sp,sp,12
	tail	lua_setfield
.L56:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
	.size	setallfields, .-setallfields
	.section	.rodata.os_time.str1.4,"aMS",@progbits,1
	.align	2
.LC18:
	.string	"time result cannot be represented in this installation"
	.section	.text.os_time,"ax",@progbits
	.align	2
	.type	os_time, @function
os_time:
	addi	sp,sp,-60
	li	a1,1
	sw	s0,52(sp)
	sw	ra,56(sp)
	sw	s1,48(sp)
	mv	s0,a0
	call	lua_type
	ble	a0,zero,.L67
	li	a2,5
	li	a1,1
	mv	a0,s0
	call	luaL_checktype
	li	a1,1
	mv	a0,s0
	call	lua_settop
	li	a3,0
	li	a2,0
	lla	a1,.LC9
	mv	a0,s0
	call	getfield
	mv	a5,a0
	li	a3,0
	li	a2,0
	lla	a1,.LC10
	mv	a0,s0
	sw	a5,4(sp)
	call	getfield
	mv	a5,a0
	li	a3,0
	li	a2,12
	lla	a1,.LC11
	mv	a0,s0
	sw	a5,8(sp)
	call	getfield
	mv	a5,a0
	li	a3,0
	li	a2,-1
	lla	a1,.LC12
	mv	a0,s0
	sw	a5,12(sp)
	call	getfield
	mv	a5,a0
	li	a3,1
	li	a2,-1
	lla	a1,.LC13
	mv	a0,s0
	sw	a5,16(sp)
	call	getfield
	mv	a5,a0
	li	a2,-1
	lla	a1,.LC14
	li	a3,1900
	mv	a0,s0
	sw	a5,20(sp)
	call	getfield
	mv	a5,a0
	lla	a2,.LC17
	li	a1,-1
	mv	a0,s0
	sw	a5,24(sp)
	call	lua_getfield
	beq	a0,zero,.L65
	li	a1,-1
	mv	a0,s0
	call	lua_toboolean
	mv	s1,a0
.L62:
	li	a1,-2
	mv	a0,s0
	call	lua_settop
	addi	a0,sp,4
	sw	s1,36(sp)
	call	mktime
	mv	a5,a1
	mv	s1,a0
	addi	a1,sp,4
	mv	a0,s0
	sw	a5,0(sp)
	call	setallfields
	lw	a5,0(sp)
.L61:
	srai	a4,s1,31
	bne	a4,a5,.L63
	li	a4,-1
	beq	s1,a4,.L68
.L64:
	mv	a0,s0
	mv	a1,s1
	call	lua_pushinteger
	lw	ra,56(sp)
	lw	s0,52(sp)
	lw	s1,48(sp)
	li	a0,1
	addi	sp,sp,60
	jr	ra
.L68:
	bne	a5,s1,.L64
.L63:
	lla	a1,.LC18
	mv	a0,s0
	call	luaL_error
	j	.L64
.L67:
	li	a0,0
	call	time
	mv	s1,a0
	mv	a5,a1
	j	.L61
.L65:
	li	s1,-1
	j	.L62
	.size	os_time, .-os_time
	.section	.rodata.os_date.str1.4,"aMS",@progbits,1
	.align	2
.LC19:
	.string	"aAbBcCdDeFgGhHIjmMnprRStTuUVwWxXyYzZ%||EcECExEXEyEYOdOeOHOIOmOMOSOuOUOVOwOWOy"
	.align	2
.LC20:
	.string	"%c"
	.align	2
.LC21:
	.string	"*t"
	.align	2
.LC22:
	.string	"invalid conversion specifier '%%%s'"
	.section	.text.os_date,"ax",@progbits
	.align	2
	.type	os_date, @function
os_date:
	addi	sp,sp,-2044
	li	a4,4096
	li	a3,-4096
	sw	s0,2036(sp)
	sw	s1,2032(sp)
	sw	ra,2040(sp)
	addi	a3,a3,2012
	addi	sp,sp,-76
	addi	a5,a4,-2012
	add	a5,a5,a3
	addi	a3,sp,24
	add	a3,a5,a3
	addi	a5,a4,-1993
	li	a1,1
	add	a5,a5,sp
	lla	a2,.LC20
	sw	a0,12(sp)
	andi	s1,a5,-8
	call	luaL_optlstring
	mv	s0,a0
	lw	a0,12(sp)
	li	a1,2
	call	lua_type
	ble	a0,zero,.L96
	lw	a0,12(sp)
	li	a1,2
	call	luaL_checkinteger
	srai	a1,a0,31
.L71:
	li	a5,4096
	li	a2,-4096
	addi	a5,a5,-2012
	add	a5,a5,a2
	addi	a2,sp,24
	add	a5,a5,a2
	sw	a0,0(s1)
	lw	a5,2012(a5)
	sw	a1,4(s1)
	lbu	a3,0(s0)
	li	a4,33
	sw	a5,0(sp)
	mv	a0,s1
	beq	a3,a4,.L97
	call	localtime
	sw	a0,16(sp)
	lw	a5,16(sp)
	mv	s1,s0
	beq	a5,zero,.L98
.L74:
	lla	a1,.LC21
	mv	a0,s1
	call	strcmp
	bne	a0,zero,.L75
	lw	s0,12(sp)
	li	a2,9
	li	a1,0
	mv	a0,s0
	call	lua_createtable
	lw	a1,16(sp)
	mv	a0,s0
	call	setallfields
	addi	sp,sp,76
	lw	ra,2040(sp)
	lw	s0,2036(sp)
	lw	s1,2032(sp)
	li	a0,1
	addi	sp,sp,2044
	jr	ra
.L75:
	li	a3,4096
	li	a5,-4096
	addi	a4,a3,-2012
	addi	a1,a5,2020
	add	a4,a4,a5
	addi	a5,sp,24
	add	a5,a4,a5
	sw	a5,4(sp)
	addi	a5,a3,-2012
	add	a5,a5,a1
	addi	a4,sp,24
	add	a1,a5,a4
	lw	a5,0(sp)
	lw	a4,4(sp)
	lw	a0,12(sp)
	add	s0,s0,a5
	li	a5,37
	sb	a5,2016(a4)
	sw	s0,8(sp)
	call	luaL_buffinit
	bltu	s1,s0,.L77
.L86:
	li	a0,-4096
	li	a5,4096
	addi	a0,a0,2020
	addi	a5,a5,-2012
	addi	a4,sp,24
	add	a5,a5,a0
	add	a0,a5,a4
	call	luaL_pushresult
	addi	sp,sp,76
	lw	ra,2040(sp)
	lw	s0,2036(sp)
	lw	s1,2032(sp)
	li	a0,1
	addi	sp,sp,2044
	jr	ra
.L99:
	li	a5,4096
	addi	a0,a0,2020
	addi	a5,a5,-2012
	add	a5,a5,a0
	addi	a4,sp,24
	add	a0,a5,a4
	li	a1,1
	call	luaL_prepbuffsize
	lw	a5,40(sp)
.L79:
	li	a3,4096
	li	a4,-4096
	addi	a3,a3,-2012
	add	a3,a3,a4
	addi	a4,sp,24
	add	a4,a3,a4
	sw	a4,0(sp)
	lw	a2,0(sp)
	addi	a3,a5,1
	lw	a4,2020(a4)
	sw	a3,2028(a2)
	lbu	a3,0(s1)
	add	a5,a4,a5
	mv	s1,s0
	sb	a3,0(a5)
.L80:
	lw	a5,8(sp)
	bgeu	s1,a5,.L86
.L77:
	lbu	a5,0(s1)
	li	a4,37
	addi	s0,s1,1
	beq	a5,a4,.L78
	lw	a5,40(sp)
	lw	a4,36(sp)
	li	a0,-4096
	bltu	a5,a4,.L79
	j	.L99
.L78:
	li	a0,-4096
	li	a5,4096
	addi	a0,a0,2020
	addi	a5,a5,-2012
	add	a5,a5,a0
	addi	a4,sp,24
	add	a0,a5,a4
	li	a1,250
	call	luaL_prepbuffsize
	lw	a5,8(sp)
	sw	a0,20(sp)
	sub	a5,a5,s0
	sw	a5,4(sp)
	ble	a5,zero,.L81
	li	s1,1
	lla	a5,.LC19
	mv	a4,s0
	li	a3,97
	mv	s0,s1
	mv	s1,a5
	j	.L85
.L82:
	sw	a4,0(sp)
	call	memcmp
	lw	a4,0(sp)
	beq	a0,zero,.L100
	add	s1,s1,s0
	lbu	a3,0(s1)
	beq	a3,zero,.L94
.L101:
	lw	a5,4(sp)
	blt	a5,s0,.L94
.L85:
	li	a5,124
	mv	a1,s1
	mv	a2,s0
	mv	a0,a4
	bne	a3,a5,.L82
	addi	s0,s0,1
	add	s1,s1,s0
	lbu	a3,0(s1)
	bne	a3,zero,.L101
.L94:
	mv	s0,a4
.L81:
	lw	s1,12(sp)
	lla	a1,.LC22
	mv	a2,s0
	mv	a0,s1
	call	lua_pushfstring
	mv	a2,a0
	li	a1,1
	mv	a0,s1
	call	luaL_argerror
	mv	s1,s0
.L84:
	li	s0,-4096
	li	a5,4096
	addi	a2,s0,2016
	lw	a3,16(sp)
	lw	a0,20(sp)
	addi	a5,a5,-2012
	add	a5,a5,a2
	addi	a4,sp,24
	add	a2,a5,a4
	li	a1,250
	call	strftime
	li	a5,4096
	addi	a5,a5,-2012
	addi	a4,sp,24
	add	a5,a5,s0
	add	a5,a5,a4
	sw	a5,0(sp)
	lw	a5,2028(a5)
	lw	a4,0(sp)
	add	a5,a5,a0
	sw	a5,2028(a4)
	j	.L80
.L96:
	li	a0,0
	call	time
	j	.L71
.L97:
	call	gmtime
	sw	a0,16(sp)
	lw	a5,16(sp)
	addi	s1,s0,1
	bne	a5,zero,.L74
.L98:
	lw	a0,12(sp)
	lla	a1,.LC18
	call	luaL_error
	j	.L74
.L100:
	li	a5,4096
	mv	s1,s0
	addi	a5,a5,-2012
	mv	s0,a4
	li	a4,-4096
	add	a5,a5,a4
	addi	a4,sp,24
	add	a0,a5,a4
	mv	a2,s1
	mv	a1,s0
	addi	a0,a0,2017
	call	memcpy
	li	a5,4096
	addi	a5,a5,-2012
	add	a5,a5,s1
	addi	a4,sp,24
	add	a5,a5,a4
	li	a4,-4096
	add	a5,a4,a5
	sb	zero,2017(a5)
	add	s1,s0,s1
	j	.L84
	.size	os_date, .-os_date
	.section	.text.luaopen_os,"ax",@progbits
	.align	2
	.globl	luaopen_os
	.hidden	luaopen_os
	.type	luaopen_os, @function
luaopen_os:
	addi	sp,sp,-12
	li	a2,68
	li	a1,503
	sw	ra,8(sp)
	sw	s0,4(sp)
	mv	s0,a0
	call	luaL_checkversion_
	mv	a0,s0
	li	a2,11
	li	a1,0
	call	lua_createtable
	mv	a0,s0
	li	a2,0
	lla	a1,.LANCHOR2
	call	luaL_setfuncs
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
	.size	luaopen_os, .-luaopen_os
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC23:
	.string	"collate"
	.align	2
.LC24:
	.string	"ctype"
	.align	2
.LC25:
	.string	"monetary"
	.align	2
.LC26:
	.string	"numeric"
	.align	2
.LC27:
	.string	"time"
	.align	2
.LC28:
	.string	"clock"
	.align	2
.LC29:
	.string	"date"
	.align	2
.LC30:
	.string	"difftime"
	.align	2
.LC31:
	.string	"execute"
	.align	2
.LC32:
	.string	"exit"
	.align	2
.LC33:
	.string	"getenv"
	.align	2
.LC34:
	.string	"remove"
	.align	2
.LC35:
	.string	"rename"
	.align	2
.LC36:
	.string	"setlocale"
	.align	2
.LC37:
	.string	"tmpname"
	.section	.rodata.cat.0,"a"
	.align	2
	.set	.LANCHOR1,. + 0
	.type	cat.0, @object
	.size	cat.0, 24
cat.0:
	.word	6
	.word	3
	.word	0
	.word	4
	.word	1
	.word	2
	.section	.rodata.catnames.1,"a"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	catnames.1, @object
	.size	catnames.1, 28
catnames.1:
	.word	.LC3
	.word	.LC23
	.word	.LC24
	.word	.LC25
	.word	.LC26
	.word	.LC27
	.word	0
	.section	.rodata.syslib,"a"
	.align	2
	.set	.LANCHOR2,. + 0
	.type	syslib, @object
	.size	syslib, 96
syslib:
	.word	.LC28
	.word	os_clock
	.word	.LC29
	.word	os_date
	.word	.LC30
	.word	os_difftime
	.word	.LC31
	.word	os_execute
	.word	.LC32
	.word	os_exit
	.word	.LC33
	.word	os_getenv
	.word	.LC34
	.word	os_remove
	.word	.LC35
	.word	os_rename
	.word	.LC36
	.word	os_setlocale
	.word	.LC27
	.word	os_time
	.word	.LC37
	.word	os_tmpname
	.word	0
	.word	0
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
