#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"lbaselib.c"
	.option nopic
	.text
	.section	.text.dofilecont,"ax",@progbits
	.align	2
	.type	dofilecont, @function
dofilecont:
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	lua_gettop
	lw	ra,8(sp)
	addi	a0,a0,-1
	addi	sp,sp,12
	jr	ra
	.size	dofilecont, .-dofilecont
	.section	.rodata.luaB_type.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"value expected"
	.section	.text.luaB_type,"ax",@progbits
	.align	2
	.type	luaB_type, @function
luaB_type:
	addi	sp,sp,-12
	li	a1,1
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	lua_type
	li	a5,-1
	mv	s1,a0
	beq	a0,a5,.L7
.L5:
	mv	a1,s1
	mv	a0,s0
	call	lua_typename
	mv	a1,a0
	mv	a0,s0
	call	lua_pushstring
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
.L7:
	lla	a2,.LC0
	li	a1,1
	mv	a0,s0
	call	luaL_argerror
	j	.L5
	.size	luaB_type, .-luaB_type
	.section	.text.luaB_tostring,"ax",@progbits
	.align	2
	.type	luaB_tostring, @function
luaB_tostring:
	addi	sp,sp,-12
	li	a1,1
	sw	ra,8(sp)
	sw	s0,4(sp)
	mv	s0,a0
	call	luaL_checkany
	mv	a0,s0
	li	a2,0
	li	a1,1
	call	luaL_tolstring
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
	.size	luaB_tostring, .-luaB_tostring
	.section	.rodata.luaB_select.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"index out of range"
	.section	.text.luaB_select,"ax",@progbits
	.align	2
	.type	luaB_select, @function
luaB_select:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	mv	s1,a0
	call	lua_gettop
	mv	s0,a0
	li	a1,1
	mv	a0,s1
	call	lua_type
	li	a5,4
	bne	a0,a5,.L11
	li	a2,0
	li	a1,1
	mv	a0,s1
	call	lua_tolstring
	lbu	a4,0(a0)
	li	a5,35
	beq	a4,a5,.L18
.L11:
	li	a1,1
	mv	a0,s1
	call	luaL_checkinteger
	add	a5,s0,a0
	blt	a0,zero,.L14
	mv	a5,s0
	bgt	s0,a0,.L19
.L14:
	ble	a5,zero,.L20
.L16:
	lw	ra,12(sp)
	sub	a0,s0,a5
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L19:
	mv	a5,a0
	bgt	a5,zero,.L16
.L20:
	lla	a2,.LC1
	li	a1,1
	mv	a0,s1
	sw	a5,0(sp)
	call	luaL_argerror
	lw	a5,0(sp)
	j	.L16
.L18:
	mv	a0,s1
	addi	a1,s0,-1
	call	lua_pushinteger
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	li	a0,1
	addi	sp,sp,16
	jr	ra
	.size	luaB_select, .-luaB_select
	.section	.rodata.luaB_setmetatable.str1.4,"aMS",@progbits,1
	.align	2
.LC2:
	.string	"nil or table expected"
	.align	2
.LC3:
	.string	"__metatable"
	.align	2
.LC4:
	.string	"cannot change a protected metatable"
	.section	.text.luaB_setmetatable,"ax",@progbits
	.align	2
	.type	luaB_setmetatable, @function
luaB_setmetatable:
	addi	sp,sp,-12
	li	a1,2
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	lua_type
	mv	s1,a0
	li	a2,5
	li	a1,1
	mv	a0,s0
	call	luaL_checktype
	beq	s1,zero,.L22
	li	a5,5
	bne	s1,a5,.L28
.L22:
	lla	a2,.LC3
	li	a1,1
	mv	a0,s0
	call	luaL_getmetafield
	bne	a0,zero,.L29
.L23:
	mv	a0,s0
	li	a1,2
	call	lua_settop
	mv	a0,s0
	li	a1,1
	call	lua_setmetatable
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
.L28:
	lla	a2,.LC2
	li	a1,2
	mv	a0,s0
	call	luaL_argerror
	lla	a2,.LC3
	li	a1,1
	mv	a0,s0
	call	luaL_getmetafield
	beq	a0,zero,.L23
.L29:
	mv	a0,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	lla	a1,.LC4
	addi	sp,sp,12
	tail	luaL_error
	.size	luaB_setmetatable, .-luaB_setmetatable
	.section	.text.luaB_rawset,"ax",@progbits
	.align	2
	.type	luaB_rawset, @function
luaB_rawset:
	addi	sp,sp,-12
	li	a2,5
	li	a1,1
	sw	ra,8(sp)
	sw	s0,4(sp)
	mv	s0,a0
	call	luaL_checktype
	mv	a0,s0
	li	a1,2
	call	luaL_checkany
	mv	a0,s0
	li	a1,3
	call	luaL_checkany
	mv	a0,s0
	li	a1,3
	call	lua_settop
	mv	a0,s0
	li	a1,1
	call	lua_rawset
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
	.size	luaB_rawset, .-luaB_rawset
	.section	.text.luaB_rawget,"ax",@progbits
	.align	2
	.type	luaB_rawget, @function
luaB_rawget:
	addi	sp,sp,-12
	li	a2,5
	li	a1,1
	sw	ra,8(sp)
	sw	s0,4(sp)
	mv	s0,a0
	call	luaL_checktype
	mv	a0,s0
	li	a1,2
	call	luaL_checkany
	mv	a0,s0
	li	a1,2
	call	lua_settop
	mv	a0,s0
	li	a1,1
	call	lua_rawget
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
	.size	luaB_rawget, .-luaB_rawget
	.section	.rodata.luaB_rawlen.str1.4,"aMS",@progbits,1
	.align	2
.LC5:
	.string	"table or string expected"
	.section	.text.luaB_rawlen,"ax",@progbits
	.align	2
	.type	luaB_rawlen, @function
luaB_rawlen:
	addi	sp,sp,-12
	li	a1,1
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	lua_type
	addi	a0,a0,-4
	li	a5,1
	bleu	a0,a5,.L35
	lla	a2,.LC5
	li	a1,1
	mv	a0,s0
	call	luaL_argerror
.L35:
	li	a1,1
	mv	a0,s0
	call	lua_rawlen
	mv	a1,a0
	mv	a0,s0
	call	lua_pushinteger
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
	.size	luaB_rawlen, .-luaB_rawlen
	.section	.text.luaB_rawequal,"ax",@progbits
	.align	2
	.type	luaB_rawequal, @function
luaB_rawequal:
	addi	sp,sp,-12
	li	a1,1
	sw	ra,8(sp)
	sw	s0,4(sp)
	mv	s0,a0
	call	luaL_checkany
	mv	a0,s0
	li	a1,2
	call	luaL_checkany
	li	a2,2
	li	a1,1
	mv	a0,s0
	call	lua_rawequal
	mv	a1,a0
	mv	a0,s0
	call	lua_pushboolean
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
	.size	luaB_rawequal, .-luaB_rawequal
	.section	.rodata.luaB_print.str1.4,"aMS",@progbits,1
	.align	2
.LC6:
	.string	"tostring"
	.align	2
.LC7:
	.string	"\n"
	.align	2
.LC8:
	.string	"'tostring' must return a string to 'print'"
	.align	2
.LC9:
	.string	"\t"
	.section	.text.luaB_print,"ax",@progbits
	.align	2
	.type	luaB_print, @function
luaB_print:
	addi	sp,sp,-28
	sw	ra,24(sp)
	sw	s0,20(sp)
	sw	s1,16(sp)
	mv	s0,a0
	call	lua_gettop
	sw	a0,4(sp)
	lla	a1,.LC6
	mv	a0,s0
	call	lua_getglobal
	lw	a5,4(sp)
	li	s1,1
	bgt	a5,zero,.L40
	j	.L51
.L42:
	lla	a3,stdout
	sw	a3,8(sp)
	beq	s1,a4,.L43
	lw	a3,0(a3)
	sw	a5,0(sp)
	call	fwrite
	lw	a5,0(sp)
.L43:
	lla	a4,stdout
	lw	a3,0(a4)
	lw	a2,12(sp)
	mv	a0,a5
	li	a1,1
	call	fwrite
	li	a1,-2
	mv	a0,s0
	call	lua_settop
	lw	a5,4(sp)
	addi	s1,s1,1
	blt	a5,s1,.L44
.L40:
	li	a1,-1
	mv	a0,s0
	call	lua_pushvalue
	mv	a1,s1
	mv	a0,s0
	call	lua_pushvalue
	li	a4,0
	li	a3,0
	li	a1,1
	mv	a0,s0
	li	a2,1
	call	lua_callk
	addi	a2,sp,12
	li	a1,-1
	mv	a0,s0
	call	lua_tolstring
	mv	a5,a0
	li	a4,1
	li	a2,1
	li	a1,1
	lla	a0,.LC9
	bne	a5,zero,.L42
	mv	a0,s0
	lla	a1,.LC8
	call	luaL_error
	lw	ra,24(sp)
	lw	s0,20(sp)
	lw	s1,16(sp)
	addi	sp,sp,28
	jr	ra
.L51:
	lla	a5,stdout
	sw	a5,8(sp)
.L44:
	lw	s0,8(sp)
	li	a2,1
	li	a1,1
	lw	a3,0(s0)
	lla	a0,.LC7
	call	fwrite
	lw	a0,0(s0)
	call	fflush
	lw	ra,24(sp)
	lw	s0,20(sp)
	lw	s1,16(sp)
	li	a0,0
	addi	sp,sp,28
	jr	ra
	.size	luaB_print, .-luaB_print
	.section	.text.luaB_ipairs,"ax",@progbits
	.align	2
	.type	luaB_ipairs, @function
luaB_ipairs:
	addi	sp,sp,-12
	li	a1,1
	sw	ra,8(sp)
	sw	s0,4(sp)
	mv	s0,a0
	call	luaL_checkany
	li	a2,0
	mv	a0,s0
	lla	a1,ipairsaux
	call	lua_pushcclosure
	mv	a0,s0
	li	a1,1
	call	lua_pushvalue
	mv	a0,s0
	li	a1,0
	call	lua_pushinteger
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,3
	addi	sp,sp,12
	jr	ra
	.size	luaB_ipairs, .-luaB_ipairs
	.section	.text.luaB_next,"ax",@progbits
	.align	2
	.type	luaB_next, @function
luaB_next:
	addi	sp,sp,-12
	li	a2,5
	li	a1,1
	sw	ra,8(sp)
	sw	s0,4(sp)
	mv	s0,a0
	call	luaL_checktype
	li	a1,2
	mv	a0,s0
	call	lua_settop
	li	a1,1
	mv	a0,s0
	call	lua_next
	beq	a0,zero,.L58
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,2
	addi	sp,sp,12
	jr	ra
.L58:
	mv	a0,s0
	call	lua_pushnil
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
	.size	luaB_next, .-luaB_next
	.section	.rodata.generic_reader.str1.4,"aMS",@progbits,1
	.align	2
.LC10:
	.string	"too many nested functions"
	.align	2
.LC11:
	.string	"reader function must return a string"
	.section	.text.generic_reader,"ax",@progbits
	.align	2
	.type	generic_reader, @function
generic_reader:
	addi	sp,sp,-12
	sw	s1,0(sp)
	li	a1,2
	mv	s1,a2
	lla	a2,.LC10
	sw	ra,8(sp)
	sw	s0,4(sp)
	mv	s0,a0
	call	luaL_checkstack
	li	a1,1
	mv	a0,s0
	call	lua_pushvalue
	li	a1,0
	mv	a0,s0
	li	a4,0
	li	a3,0
	li	a2,1
	call	lua_callk
	li	a1,-1
	mv	a0,s0
	call	lua_type
	beq	a0,zero,.L64
	li	a1,-1
	mv	a0,s0
	call	lua_isstring
	beq	a0,zero,.L66
.L62:
	li	a2,5
	mv	a0,s0
	li	a1,-1
	call	lua_copy
	mv	a0,s0
	li	a1,-2
	call	lua_settop
	mv	a0,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	mv	a2,s1
	lw	s1,0(sp)
	li	a1,5
	addi	sp,sp,12
	tail	lua_tolstring
.L66:
	lla	a1,.LC11
	mv	a0,s0
	call	luaL_error
	j	.L62
.L64:
	mv	a0,s0
	li	a1,-2
	call	lua_settop
	lw	ra,8(sp)
	lw	s0,4(sp)
	sw	zero,0(s1)
	li	a0,0
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
	.size	generic_reader, .-generic_reader
	.section	.text.ipairsaux,"ax",@progbits
	.align	2
	.type	ipairsaux, @function
ipairsaux:
	addi	sp,sp,-12
	li	a1,2
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	mv	s0,a0
	call	luaL_checkinteger
	addi	s1,a0,1
	mv	a1,s1
	mv	a0,s0
	call	lua_pushinteger
	mv	a2,s1
	mv	a0,s0
	li	a1,1
	call	lua_geti
	lw	ra,8(sp)
	lw	s0,4(sp)
	snez	a0,a0
	lw	s1,0(sp)
	addi	a0,a0,1
	addi	sp,sp,12
	jr	ra
	.size	ipairsaux, .-ipairsaux
	.section	.text.luaB_error,"ax",@progbits
	.align	2
	.type	luaB_error, @function
luaB_error:
	addi	sp,sp,-12
	li	a2,1
	li	a1,2
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	mv	s0,a0
	call	luaL_optinteger
	li	a1,1
	mv	s1,a0
	mv	a0,s0
	call	lua_settop
	li	a1,1
	mv	a0,s0
	call	lua_type
	li	a5,4
	beq	a0,a5,.L74
.L72:
	mv	a0,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	tail	lua_error
.L74:
	ble	s1,zero,.L72
	mv	a1,s1
	mv	a0,s0
	call	luaL_where
	mv	a0,s0
	li	a1,1
	call	lua_pushvalue
	mv	a0,s0
	li	a1,2
	call	lua_concat
	mv	a0,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	tail	lua_error
	.size	luaB_error, .-luaB_error
	.section	.rodata.luaB_collectgarbage.str1.4,"aMS",@progbits,1
	.align	2
.LC12:
	.string	"collect"
	.section	.text.luaB_collectgarbage,"ax",@progbits
	.align	2
	.type	luaB_collectgarbage, @function
luaB_collectgarbage:
	addi	sp,sp,-16
	lla	a3,.LANCHOR0
	lla	a2,.LC12
	li	a1,1
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	mv	s0,a0
	call	luaL_checkoption
	slli	a0,a0,2
	lla	a5,.LANCHOR1
	add	a5,a5,a0
	lw	s1,0(a5)
	li	a2,0
	li	a1,2
	mv	a0,s0
	call	luaL_optinteger
	mv	a2,a0
	mv	a1,s1
	mv	a0,s0
	call	lua_gc
	addi	a5,s1,-5
	andi	a5,a5,-5
	beq	a5,zero,.L76
	li	a5,3
	beq	s1,a5,.L80
	mv	a1,a0
	mv	a0,s0
	call	lua_pushinteger
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	li	a0,1
	addi	sp,sp,16
	jr	ra
.L76:
	mv	a1,a0
	mv	a0,s0
	call	lua_pushboolean
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	li	a0,1
	addi	sp,sp,16
	jr	ra
.L80:
	sw	a0,0(sp)
	li	a2,0
	li	a1,4
	mv	a0,s0
	call	lua_gc
	srai	a1,a0,31
	lw	a4,0(sp)
	andi	a1,a1,1023
	add	a1,a1,a0
	srai	a1,a1,10
	mv	a0,s0
	add	a1,a1,a4
	call	lua_pushnumber
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	li	a0,1
	addi	sp,sp,16
	jr	ra
	.size	luaB_collectgarbage, .-luaB_collectgarbage
	.section	.text.finishpcall,"ax",@progbits
	.align	2
	.type	finishpcall, @function
finishpcall:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	li	a5,1
	bgtu	a1,a5,.L85
	mv	s0,a2
	call	lua_gettop
	lw	ra,8(sp)
	sub	a0,a0,s0
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L85:
	li	a1,0
	mv	s1,a0
	call	lua_pushboolean
	mv	a0,s1
	li	a1,-2
	call	lua_pushvalue
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	li	a0,2
	addi	sp,sp,12
	jr	ra
	.size	finishpcall, .-finishpcall
	.section	.text.load_aux,"ax",@progbits
	.align	2
	.type	load_aux, @function
load_aux:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	bne	a1,zero,.L87
	bne	a2,zero,.L88
.L92:
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
.L88:
	mv	a1,a2
	call	lua_pushvalue
	li	a2,1
	li	a1,-2
	mv	a0,s0
	call	lua_setupvalue
	bne	a0,zero,.L92
	li	a1,-2
	mv	a0,s0
	call	lua_settop
	j	.L92
.L87:
	call	lua_pushnil
	mv	a0,s0
	li	a2,1
	li	a1,-2
	call	lua_rotate
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,2
	addi	sp,sp,12
	jr	ra
	.size	load_aux, .-load_aux
	.section	.rodata.luaB_load.str1.4,"aMS",@progbits,1
	.align	2
.LC13:
	.string	"bt"
	.align	2
.LC14:
	.string	"=(load)"
	.section	.text.luaB_load,"ax",@progbits
	.align	2
	.type	luaB_load, @function
luaB_load:
	addi	sp,sp,-24
	addi	a2,sp,8
	li	a1,1
	sw	ra,20(sp)
	sw	s0,16(sp)
	sw	s1,12(sp)
	mv	s0,a0
	call	lua_tolstring
	mv	t1,a0
	li	a3,0
	lla	a2,.LC13
	li	a1,3
	mv	a0,s0
	sw	t1,0(sp)
	call	luaL_optlstring
	mv	s1,a0
	li	a1,4
	mv	a0,s0
	call	lua_type
	addi	a5,a0,1
	snez	a5,a5
	lw	t1,0(sp)
	slli	a5,a5,2
	sw	a5,4(sp)
	beq	t1,zero,.L94
	mv	a2,t1
	li	a1,2
	li	a3,0
	mv	a0,s0
	call	luaL_optlstring
	lw	t1,0(sp)
	lw	a2,8(sp)
	mv	a3,a0
	mv	a1,t1
	mv	a4,s1
	mv	a0,s0
	call	luaL_loadbufferx
	lw	a5,4(sp)
	mv	a1,a0
.L95:
	mv	a0,s0
	mv	a2,a5
	call	load_aux
	lw	ra,20(sp)
	lw	s0,16(sp)
	lw	s1,12(sp)
	addi	sp,sp,24
	jr	ra
.L94:
	li	a3,0
	lla	a2,.LC14
	li	a1,2
	mv	a0,s0
	call	luaL_optlstring
	mv	a3,a0
	li	a2,6
	li	a1,1
	mv	a0,s0
	sw	a3,0(sp)
	call	luaL_checktype
	li	a1,5
	mv	a0,s0
	call	lua_settop
	lw	a3,0(sp)
	lla	a1,generic_reader
	mv	a4,s1
	li	a2,0
	mv	a0,s0
	call	lua_load
	lw	a5,4(sp)
	mv	a1,a0
	j	.L95
	.size	luaB_load, .-luaB_load
	.section	.text.luaB_loadfile,"ax",@progbits
	.align	2
	.type	luaB_loadfile, @function
luaB_loadfile:
	addi	sp,sp,-16
	li	a3,0
	li	a2,0
	li	a1,1
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	mv	s0,a0
	call	luaL_optlstring
	li	a3,0
	li	a2,0
	li	a1,2
	mv	s1,a0
	mv	a0,s0
	call	luaL_optlstring
	mv	a2,a0
	li	a1,3
	mv	a0,s0
	sw	a2,0(sp)
	call	lua_type
	li	a5,-1
	lw	a2,0(sp)
	beq	a0,a5,.L101
	li	a5,3
.L98:
	mv	a1,s1
	mv	a0,s0
	sw	a5,0(sp)
	call	luaL_loadfilex
	lw	a5,0(sp)
	mv	a1,a0
	mv	a0,s0
	lw	s0,8(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	mv	a2,a5
	addi	sp,sp,16
	tail	load_aux
.L101:
	li	a5,0
	j	.L98
	.size	luaB_loadfile, .-luaB_loadfile
	.section	.text.luaB_getmetatable,"ax",@progbits
	.align	2
	.type	luaB_getmetatable, @function
luaB_getmetatable:
	addi	sp,sp,-12
	li	a1,1
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	luaL_checkany
	li	a1,1
	mv	a0,s0
	call	lua_getmetatable
	beq	a0,zero,.L106
	mv	a0,s0
	lla	a2,.LC3
	li	a1,1
	call	luaL_getmetafield
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
.L106:
	mv	a0,s0
	call	lua_pushnil
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
	.size	luaB_getmetatable, .-luaB_getmetatable
	.section	.text.luaB_dofile,"ax",@progbits
	.align	2
	.type	luaB_dofile, @function
luaB_dofile:
	addi	sp,sp,-12
	li	a2,0
	li	a3,0
	li	a1,1
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	mv	s0,a0
	call	luaL_optlstring
	mv	s1,a0
	li	a1,1
	mv	a0,s0
	call	lua_settop
	li	a2,0
	mv	a1,s1
	mv	a0,s0
	call	luaL_loadfilex
	bne	a0,zero,.L110
	mv	a0,s0
	lla	a4,dofilecont
	li	a3,0
	li	a2,-1
	li	a1,0
	call	lua_callk
	mv	a0,s0
	call	lua_gettop
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	a0,a0,-1
	addi	sp,sp,12
	jr	ra
.L110:
	mv	a0,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	tail	lua_error
	.size	luaB_dofile, .-luaB_dofile
	.section	.rodata.luaB_assert.str1.4,"aMS",@progbits,1
	.align	2
.LC15:
	.string	"assertion failed!"
	.section	.text.luaB_assert,"ax",@progbits
	.align	2
	.type	luaB_assert, @function
luaB_assert:
	addi	sp,sp,-12
	li	a1,1
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	lua_toboolean
	beq	a0,zero,.L112
	mv	a0,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	lua_gettop
.L112:
	mv	a0,s0
	li	a1,1
	call	luaL_checkany
	li	a2,-1
	mv	a0,s0
	li	a1,1
	call	lua_rotate
	mv	a0,s0
	li	a1,-2
	call	lua_settop
	lla	a1,.LC15
	mv	a0,s0
	call	lua_pushstring
	mv	a0,s0
	li	a1,1
	call	lua_settop
	mv	a0,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	luaB_error
	.size	luaB_assert, .-luaB_assert
	.section	.rodata.luaB_pairs.str1.4,"aMS",@progbits,1
	.align	2
.LC16:
	.string	"__pairs"
	.section	.text.luaB_pairs,"ax",@progbits
	.align	2
	.type	luaB_pairs, @function
luaB_pairs:
	addi	sp,sp,-12
	li	a1,1
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	luaL_checkany
	lla	a2,.LC16
	li	a1,1
	mv	a0,s0
	call	luaL_getmetafield
	bne	a0,zero,.L115
	li	a2,0
	mv	a0,s0
	lla	a1,luaB_next
	call	lua_pushcclosure
	mv	a0,s0
	li	a1,1
	call	lua_pushvalue
	mv	a0,s0
	call	lua_pushnil
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,3
	addi	sp,sp,12
	jr	ra
.L115:
	mv	a0,s0
	li	a1,1
	call	lua_pushvalue
	mv	a0,s0
	li	a4,0
	li	a3,0
	li	a2,3
	li	a1,1
	call	lua_callk
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,3
	addi	sp,sp,12
	jr	ra
	.size	luaB_pairs, .-luaB_pairs
	.section	.rodata.luaB_tonumber.str1.4,"aMS",@progbits,1
	.align	2
.LC17:
	.string	"base out of range"
	.align	2
.LC18:
	.string	" \f\n\r\t\013"
	.globl	__mulsi3
	.section	.text.luaB_tonumber,"ax",@progbits
	.align	2
	.type	luaB_tonumber, @function
luaB_tonumber:
	addi	sp,sp,-36
	li	a1,2
	sw	s0,28(sp)
	sw	ra,32(sp)
	sw	s1,24(sp)
	mv	s0,a0
	sw	a0,8(sp)
	call	lua_type
	ble	a0,zero,.L143
	lw	s0,8(sp)
	li	a1,2
	mv	a0,s0
	call	luaL_checkinteger
	mv	a5,a0
	li	a2,4
	li	a1,1
	mv	a0,s0
	mv	s1,a5
	sw	a5,4(sp)
	call	luaL_checktype
	addi	a2,sp,20
	li	a1,1
	mv	a0,s0
	call	lua_tolstring
	addi	a4,s1,-2
	li	a5,34
	sw	a0,12(sp)
	bgtu	a4,a5,.L144
.L124:
	lw	s0,12(sp)
	lla	a1,.LC18
	mv	a0,s0
	call	strspn
	add	s0,s0,a0
	lbu	a0,0(s0)
	li	a5,45
	beq	a0,a5,.L145
	li	a5,43
	sw	zero,16(sp)
	bne	a0,a5,.L126
	lbu	a0,1(s0)
	addi	s0,s0,1
	call	isalnum
	bne	a0,zero,.L146
.L123:
	lw	a0,8(sp)
	call	lua_pushnil
.L121:
	lw	ra,32(sp)
	lw	s0,28(sp)
	lw	s1,24(sp)
	li	a0,1
	addi	sp,sp,36
	jr	ra
.L145:
	li	a5,1
	lbu	a0,1(s0)
	sw	a5,16(sp)
	addi	s0,s0,1
.L126:
	call	isalnum
	beq	a0,zero,.L123
.L146:
	li	s1,0
	j	.L130
.L148:
	lbu	a5,0(s0)
	addi	a5,a5,-48
.L129:
	lw	a4,4(sp)
	sw	a5,0(sp)
	mv	a1,s1
	mv	a0,a4
	addi	s0,s0,1
	ble	a4,a5,.L123
	call	__mulsi3
	mv	s1,a0
	lw	a5,0(sp)
	lbu	a0,0(s0)
	add	s1,a5,s1
	call	isalnum
	beq	a0,zero,.L147
.L130:
	lbu	a0,0(s0)
	call	isdigit
	bne	a0,zero,.L148
	lbu	a0,0(s0)
	call	toupper
	addi	a5,a0,-55
	j	.L129
.L143:
	li	a1,1
	mv	a0,s0
	call	luaL_checkany
	li	a1,1
	mv	a0,s0
	call	lua_type
	li	a5,3
	beq	a0,a5,.L149
	lw	s0,8(sp)
	li	a1,1
	addi	a2,sp,20
	mv	a0,s0
	call	lua_tolstring
	mv	a1,a0
	beq	a0,zero,.L123
	mv	a0,s0
	call	lua_stringtonumber
	lw	a5,20(sp)
	addi	a5,a5,1
	bne	a0,a5,.L123
	j	.L121
.L147:
	mv	a0,s0
	lla	a1,.LC18
	call	strspn
	lw	a5,16(sp)
	add	s0,s0,a0
	beq	a5,zero,.L132
	neg	s1,s1
.L132:
	lw	a5,20(sp)
	lw	a4,12(sp)
	add	a5,a4,a5
	bne	s0,a5,.L123
	lw	a0,8(sp)
	mv	a1,s1
	call	lua_pushinteger
	j	.L121
.L144:
	lw	a0,8(sp)
	lla	a2,.LC17
	li	a1,2
	call	luaL_argerror
	j	.L124
.L149:
	lw	a0,8(sp)
	li	a1,1
	call	lua_settop
	j	.L121
	.size	luaB_tonumber, .-luaB_tonumber
	.section	.text.luaB_pcall,"ax",@progbits
	.align	2
	.type	luaB_pcall, @function
luaB_pcall:
	addi	sp,sp,-12
	li	a1,1
	sw	ra,8(sp)
	sw	s0,4(sp)
	mv	s0,a0
	call	luaL_checkany
	li	a1,1
	mv	a0,s0
	call	lua_pushboolean
	li	a2,1
	li	a1,1
	mv	a0,s0
	call	lua_rotate
	mv	a0,s0
	call	lua_gettop
	lla	a5,finishpcall
	addi	a1,a0,-2
	li	a4,0
	li	a3,0
	li	a2,-1
	mv	a0,s0
	call	lua_pcallk
	li	a5,1
	bgtu	a0,a5,.L154
	mv	a0,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	lua_gettop
.L154:
	mv	a0,s0
	li	a1,0
	call	lua_pushboolean
	mv	a0,s0
	li	a1,-2
	call	lua_pushvalue
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,2
	addi	sp,sp,12
	jr	ra
	.size	luaB_pcall, .-luaB_pcall
	.section	.text.luaB_xpcall,"ax",@progbits
	.align	2
	.type	luaB_xpcall, @function
luaB_xpcall:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	mv	s0,a0
	call	lua_gettop
	li	a2,6
	mv	s1,a0
	li	a1,2
	mv	a0,s0
	call	luaL_checktype
	li	a1,1
	mv	a0,s0
	call	lua_pushboolean
	li	a1,1
	mv	a0,s0
	call	lua_pushvalue
	li	a2,2
	li	a1,3
	mv	a0,s0
	call	lua_rotate
	lla	a5,finishpcall
	li	a4,2
	li	a3,2
	li	a2,-1
	addi	a1,s1,-2
	mv	a0,s0
	call	lua_pcallk
	li	a5,1
	bgtu	a0,a5,.L160
	mv	a0,s0
	call	lua_gettop
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	a0,a0,-2
	addi	sp,sp,12
	jr	ra
.L160:
	mv	a0,s0
	li	a1,0
	call	lua_pushboolean
	mv	a0,s0
	li	a1,-2
	call	lua_pushvalue
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	li	a0,2
	addi	sp,sp,12
	jr	ra
	.size	luaB_xpcall, .-luaB_xpcall
	.section	.rodata.luaopen_base.str1.4,"aMS",@progbits,1
	.align	2
.LC19:
	.string	"_G"
	.align	2
.LC20:
	.string	"Lua 5.3"
	.align	2
.LC21:
	.string	"_VERSION"
	.section	.text.luaopen_base,"ax",@progbits
	.align	2
	.globl	luaopen_base
	.hidden	luaopen_base
	.type	luaopen_base, @function
luaopen_base:
	li	a1,-999424
	addi	sp,sp,-12
	li	a2,2
	addi	a1,a1,-1576
	sw	ra,8(sp)
	sw	s0,4(sp)
	mv	s0,a0
	call	lua_rawgeti
	li	a2,0
	mv	a0,s0
	lla	a1,.LANCHOR2
	call	luaL_setfuncs
	mv	a0,s0
	li	a1,-1
	call	lua_pushvalue
	lla	a2,.LC19
	mv	a0,s0
	li	a1,-2
	call	lua_setfield
	lla	a1,.LC20
	mv	a0,s0
	call	lua_pushstring
	mv	a0,s0
	lla	a2,.LC21
	li	a1,-2
	call	lua_setfield
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
	.size	luaopen_base, .-luaopen_base
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC22:
	.string	"stop"
	.align	2
.LC23:
	.string	"restart"
	.align	2
.LC24:
	.string	"count"
	.align	2
.LC25:
	.string	"step"
	.align	2
.LC26:
	.string	"setpause"
	.align	2
.LC27:
	.string	"setstepmul"
	.align	2
.LC28:
	.string	"isrunning"
	.align	2
.LC29:
	.string	"assert"
	.align	2
.LC30:
	.string	"collectgarbage"
	.align	2
.LC31:
	.string	"dofile"
	.align	2
.LC32:
	.string	"error"
	.align	2
.LC33:
	.string	"getmetatable"
	.align	2
.LC34:
	.string	"ipairs"
	.align	2
.LC35:
	.string	"loadfile"
	.align	2
.LC36:
	.string	"load"
	.align	2
.LC37:
	.string	"next"
	.align	2
.LC38:
	.string	"pairs"
	.align	2
.LC39:
	.string	"pcall"
	.align	2
.LC40:
	.string	"print"
	.align	2
.LC41:
	.string	"rawequal"
	.align	2
.LC42:
	.string	"rawlen"
	.align	2
.LC43:
	.string	"rawget"
	.align	2
.LC44:
	.string	"rawset"
	.align	2
.LC45:
	.string	"select"
	.align	2
.LC46:
	.string	"setmetatable"
	.align	2
.LC47:
	.string	"tonumber"
	.align	2
.LC48:
	.string	"type"
	.align	2
.LC49:
	.string	"xpcall"
	.section	.rodata.base_funcs,"a"
	.align	2
	.set	.LANCHOR2,. + 0
	.type	base_funcs, @object
	.size	base_funcs, 200
base_funcs:
	.word	.LC29
	.word	luaB_assert
	.word	.LC30
	.word	luaB_collectgarbage
	.word	.LC31
	.word	luaB_dofile
	.word	.LC32
	.word	luaB_error
	.word	.LC33
	.word	luaB_getmetatable
	.word	.LC34
	.word	luaB_ipairs
	.word	.LC35
	.word	luaB_loadfile
	.word	.LC36
	.word	luaB_load
	.word	.LC37
	.word	luaB_next
	.word	.LC38
	.word	luaB_pairs
	.word	.LC39
	.word	luaB_pcall
	.word	.LC40
	.word	luaB_print
	.word	.LC41
	.word	luaB_rawequal
	.word	.LC42
	.word	luaB_rawlen
	.word	.LC43
	.word	luaB_rawget
	.word	.LC44
	.word	luaB_rawset
	.word	.LC45
	.word	luaB_select
	.word	.LC46
	.word	luaB_setmetatable
	.word	.LC47
	.word	luaB_tonumber
	.word	.LC6
	.word	luaB_tostring
	.word	.LC48
	.word	luaB_type
	.word	.LC49
	.word	luaB_xpcall
	.word	.LC19
	.word	0
	.word	.LC21
	.word	0
	.word	0
	.word	0
	.section	.rodata.opts.1,"a"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	opts.1, @object
	.size	opts.1, 36
opts.1:
	.word	.LC22
	.word	.LC23
	.word	.LC12
	.word	.LC24
	.word	.LC25
	.word	.LC26
	.word	.LC27
	.word	.LC28
	.word	0
	.section	.rodata.optsnum.0,"a"
	.align	2
	.set	.LANCHOR1,. + 0
	.type	optsnum.0, @object
	.size	optsnum.0, 32
optsnum.0:
	.word	0
	.word	1
	.word	2
	.word	3
	.word	5
	.word	6
	.word	7
	.word	9
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
