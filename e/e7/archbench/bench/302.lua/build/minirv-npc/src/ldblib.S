#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"ldblib.c"
	.option nopic
	.text
	.section	.text.db_getregistry,"ax",@progbits
	.align	2
	.type	db_getregistry, @function
db_getregistry:
	li	a1,-999424
	addi	sp,sp,-12
	addi	a1,a1,-1576
	sw	ra,8(sp)
	call	lua_pushvalue
	lw	ra,8(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
	.size	db_getregistry, .-db_getregistry
	.section	.text.auxupvalue,"ax",@progbits
	.align	2
	.type	auxupvalue, @function
auxupvalue:
	addi	sp,sp,-16
	sw	s1,4(sp)
	mv	s1,a1
	li	a1,2
	sw	ra,12(sp)
	sw	s0,8(sp)
	mv	s0,a0
	call	luaL_checkinteger
	mv	a5,a0
	li	a2,6
	li	a1,1
	mv	a0,s0
	sw	a5,0(sp)
	call	luaL_checktype
	lw	a5,0(sp)
	li	a1,1
	mv	a0,s0
	mv	a2,a5
	beq	s1,zero,.L5
	call	lua_getupvalue
	mv	a1,a0
.L6:
	li	a0,0
	beq	a1,zero,.L4
	mv	a0,s0
	call	lua_pushstring
	mv	a0,s0
	li	a2,1
	not	a1,s1
	call	lua_rotate
	addi	a0,s1,1
.L4:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L5:
	call	lua_setupvalue
	mv	a1,a0
	j	.L6
	.size	auxupvalue, .-auxupvalue
	.section	.text.db_setupvalue,"ax",@progbits
	.align	2
	.type	db_setupvalue, @function
db_setupvalue:
	addi	sp,sp,-12
	li	a1,3
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	luaL_checkany
	mv	a0,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a1,0
	addi	sp,sp,12
	tail	auxupvalue
	.size	db_setupvalue, .-db_setupvalue
	.section	.text.db_getupvalue,"ax",@progbits
	.align	2
	.type	db_getupvalue, @function
db_getupvalue:
	li	a1,1
	tail	auxupvalue
	.size	db_getupvalue, .-db_getupvalue
	.section	.rodata.db_setmetatable.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"nil or table expected"
	.section	.text.db_setmetatable,"ax",@progbits
	.align	2
	.type	db_setmetatable, @function
db_setmetatable:
	addi	sp,sp,-12
	li	a1,2
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	lua_type
	beq	a0,zero,.L15
	li	a5,5
	bne	a0,a5,.L20
.L15:
	mv	a0,s0
	li	a1,2
	call	lua_settop
	mv	a0,s0
	li	a1,1
	call	lua_setmetatable
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
.L20:
	lla	a2,.LC0
	li	a1,2
	mv	a0,s0
	call	luaL_argerror
	j	.L15
	.size	db_setmetatable, .-db_setmetatable
	.section	.text.db_setuservalue,"ax",@progbits
	.align	2
	.type	db_setuservalue, @function
db_setuservalue:
	addi	sp,sp,-12
	li	a2,7
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
	call	lua_setuservalue
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
	.size	db_setuservalue, .-db_setuservalue
	.section	.text.db_getmetatable,"ax",@progbits
	.align	2
	.type	db_getmetatable, @function
db_getmetatable:
	addi	sp,sp,-12
	li	a1,1
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	luaL_checkany
	li	a1,1
	mv	a0,s0
	call	lua_getmetatable
	beq	a0,zero,.L26
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
.L26:
	mv	a0,s0
	call	lua_pushnil
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
	.size	db_getmetatable, .-db_getmetatable
	.section	.text.db_getuservalue,"ax",@progbits
	.align	2
	.type	db_getuservalue, @function
db_getuservalue:
	addi	sp,sp,-12
	li	a1,1
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	lua_type
	li	a5,7
	beq	a0,a5,.L28
	mv	a0,s0
	call	lua_pushnil
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
.L28:
	mv	a0,s0
	li	a1,1
	call	lua_getuservalue
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
	.size	db_getuservalue, .-db_getuservalue
	.section	.rodata.db_debug.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"lua_debug> "
	.align	2
.LC2:
	.string	"%s"
	.align	2
.LC3:
	.string	"cont\n"
	.align	2
.LC4:
	.string	"=(debug command)"
	.align	2
.LC5:
	.string	"%s\n"
	.section	.text.db_debug,"ax",@progbits
	.align	2
	.type	db_debug, @function
db_debug:
	addi	sp,sp,-268
	sw	s0,260(sp)
	sw	s1,256(sp)
	sw	ra,264(sp)
	mv	s0,a0
	lla	s1,stderr
	j	.L37
.L43:
	call	strcmp
	mv	a5,a0
	addi	a0,sp,4
	beq	a5,zero,.L39
	call	strlen
	mv	a2,a0
	li	a4,0
	lla	a3,.LC4
	addi	a1,sp,4
	mv	a0,s0
	call	luaL_loadbufferx
	mv	t1,a0
	li	a5,0
	li	a4,0
	li	a3,0
	li	a2,0
	li	a1,0
	mv	a0,s0
	bne	t1,zero,.L36
	call	lua_pcallk
	beq	a0,zero,.L35
.L36:
	lw	a5,0(s1)
	li	a1,-1
	li	a2,0
	mv	a0,s0
	sw	a5,0(sp)
	call	lua_tolstring
	lw	a5,0(sp)
	mv	a2,a0
	lla	a1,.LC5
	mv	a0,a5
	call	fprintf
	lw	a0,0(s1)
	call	fflush
.L35:
	li	a1,0
	mv	a0,s0
	call	lua_settop
.L37:
	lw	a0,0(s1)
	lla	a2,.LC1
	lla	a1,.LC2
	call	fprintf
	lw	a0,0(s1)
	call	fflush
	lla	a5,stdin
	lw	a2,0(a5)
	li	a1,250
	addi	a0,sp,4
	call	fgets
	mv	a5,a0
	lla	a1,.LC3
	addi	a0,sp,4
	bne	a5,zero,.L43
.L39:
	lw	ra,264(sp)
	lw	s0,260(sp)
	lw	s1,256(sp)
	li	a0,0
	addi	sp,sp,268
	jr	ra
	.size	db_debug, .-db_debug
	.section	.text.hookf,"ax",@progbits
	.align	2
	.type	hookf, @function
hookf:
	addi	sp,sp,-12
	sw	s1,0(sp)
	mv	s1,a1
	li	a1,-999424
	lla	a2,.LANCHOR0
	addi	a1,a1,-1576
	sw	ra,8(sp)
	sw	s0,4(sp)
	mv	s0,a0
	call	lua_rawgetp
	mv	a0,s0
	call	lua_pushthread
	li	a1,-2
	mv	a0,s0
	call	lua_rawget
	li	a5,6
	beq	a0,a5,.L49
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L49:
	lw	a4,0(s1)
	lla	a5,.LANCHOR1
	mv	a0,s0
	slli	a4,a4,2
	add	a5,a5,a4
	lw	a1,0(a5)
	call	lua_pushstring
	lw	a1,20(s1)
	mv	a0,s0
	blt	a1,zero,.L46
	call	lua_pushinteger
.L47:
	mv	a0,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	li	a4,0
	li	a3,0
	li	a2,0
	li	a1,2
	addi	sp,sp,12
	tail	lua_callk
.L46:
	call	lua_pushnil
	j	.L47
	.size	hookf, .-hookf
	.section	.rodata.db_upvalueid.str1.4,"aMS",@progbits,1
	.align	2
.LC6:
	.string	"invalid upvalue index"
	.section	.text.db_upvalueid,"ax",@progbits
	.align	2
	.type	db_upvalueid, @function
db_upvalueid:
	addi	sp,sp,-12
	li	a1,2
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	mv	s0,a0
	call	luaL_checkinteger
	mv	s1,a0
	li	a1,1
	mv	a0,s0
	li	a2,6
	call	luaL_checktype
	mv	a2,s1
	li	a1,1
	mv	a0,s0
	call	lua_getupvalue
	beq	a0,zero,.L53
.L51:
	mv	a2,s1
	li	a1,1
	mv	a0,s0
	call	lua_upvalueid
	mv	a1,a0
	mv	a0,s0
	call	lua_pushlightuserdata
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
.L53:
	lla	a2,.LC6
	li	a1,2
	mv	a0,s0
	call	luaL_argerror
	j	.L51
	.size	db_upvalueid, .-db_upvalueid
	.section	.text.db_traceback,"ax",@progbits
	.align	2
	.type	db_traceback, @function
db_traceback:
	addi	sp,sp,-24
	li	a1,1
	sw	s1,12(sp)
	sw	ra,20(sp)
	sw	s0,16(sp)
	mv	s1,a0
	call	lua_type
	li	a4,8
	beq	a0,a4,.L60
	mv	s0,s1
	li	a1,1
	sw	zero,4(sp)
.L55:
	li	a2,0
	mv	a0,s1
	sw	a1,0(sp)
	call	lua_tolstring
	lw	a1,0(sp)
	mv	a4,a0
	beq	a0,zero,.L61
.L56:
	lw	a5,4(sp)
	sub	a2,s1,s0
	seqz	a2,a2
	addi	a1,a5,2
	mv	a0,s1
	sw	a4,0(sp)
	call	luaL_optinteger
	lw	a4,0(sp)
	mv	a3,a0
	mv	a1,s0
	mv	a0,s1
	mv	a2,a4
	call	luaL_traceback
	lw	ra,20(sp)
	lw	s0,16(sp)
	lw	s1,12(sp)
	li	a0,1
	addi	sp,sp,24
	jr	ra
.L61:
	sw	a0,0(sp)
	mv	a0,s1
	sw	a1,8(sp)
	call	lua_type
	lw	a4,0(sp)
	ble	a0,zero,.L56
	lw	a1,8(sp)
	mv	a0,s1
	call	lua_pushvalue
	lw	ra,20(sp)
	lw	s0,16(sp)
	lw	s1,12(sp)
	li	a0,1
	addi	sp,sp,24
	jr	ra
.L60:
	li	a1,1
	mv	a0,s1
	call	lua_tothread
	li	a5,1
	mv	s0,a0
	li	a1,2
	sw	a5,4(sp)
	j	.L55
	.size	db_traceback, .-db_traceback
	.section	.rodata.db_upvaluejoin.str1.4,"aMS",@progbits,1
	.align	2
.LC7:
	.string	"Lua function expected"
	.section	.text.db_upvaluejoin,"ax",@progbits
	.align	2
	.type	db_upvaluejoin, @function
db_upvaluejoin:
	addi	sp,sp,-16
	li	a1,2
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	mv	s0,a0
	call	luaL_checkinteger
	mv	s1,a0
	li	a1,1
	mv	a0,s0
	li	a2,6
	call	luaL_checktype
	mv	a2,s1
	li	a1,1
	mv	a0,s0
	call	lua_getupvalue
	beq	a0,zero,.L74
.L63:
	li	a1,4
	mv	a0,s0
	call	luaL_checkinteger
	mv	a5,a0
	li	a1,3
	mv	a0,s0
	li	a2,6
	sw	a5,0(sp)
	call	luaL_checktype
	lw	a2,0(sp)
	li	a1,3
	mv	a0,s0
	call	lua_getupvalue
	beq	a0,zero,.L75
.L64:
	li	a1,1
	mv	a0,s0
	call	lua_iscfunction
	bne	a0,zero,.L76
	li	a1,3
	mv	a0,s0
	call	lua_iscfunction
	bne	a0,zero,.L77
.L66:
	lw	a4,0(sp)
	mv	a0,s0
	mv	a2,s1
	li	a3,3
	li	a1,1
	call	lua_upvaluejoin
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	li	a0,0
	addi	sp,sp,16
	jr	ra
.L76:
	li	a1,1
	lla	a2,.LC7
	mv	a0,s0
	call	luaL_argerror
	li	a1,3
	mv	a0,s0
	call	lua_iscfunction
	beq	a0,zero,.L66
.L77:
	lla	a2,.LC7
	li	a1,3
	mv	a0,s0
	call	luaL_argerror
	j	.L66
.L75:
	lla	a2,.LC6
	li	a1,4
	mv	a0,s0
	call	luaL_argerror
	j	.L64
.L74:
	lla	a2,.LC6
	li	a1,2
	mv	a0,s0
	call	luaL_argerror
	j	.L63
	.size	db_upvaluejoin, .-db_upvaluejoin
	.section	.rodata.db_getinfo.str1.4,"aMS",@progbits,1
	.align	2
.LC8:
	.string	"flnStu"
	.align	2
.LC9:
	.string	"stack overflow"
	.align	2
.LC10:
	.string	">%s"
	.align	2
.LC11:
	.string	"invalid option"
	.align	2
.LC12:
	.string	"source"
	.align	2
.LC13:
	.string	"short_src"
	.align	2
.LC14:
	.string	"linedefined"
	.align	2
.LC15:
	.string	"lastlinedefined"
	.align	2
.LC16:
	.string	"what"
	.align	2
.LC17:
	.string	"currentline"
	.align	2
.LC18:
	.string	"nups"
	.align	2
.LC19:
	.string	"nparams"
	.align	2
.LC20:
	.string	"isvararg"
	.align	2
.LC21:
	.string	"name"
	.align	2
.LC22:
	.string	"namewhat"
	.align	2
.LC23:
	.string	"istailcall"
	.align	2
.LC24:
	.string	"activelines"
	.align	2
.LC25:
	.string	"func"
	.section	.text.db_getinfo,"ax",@progbits
	.align	2
	.type	db_getinfo, @function
db_getinfo:
	addi	sp,sp,-124
	li	a1,1
	sw	s0,116(sp)
	sw	ra,120(sp)
	sw	s1,112(sp)
	mv	s0,a0
	call	lua_type
	li	a5,8
	beq	a0,a5,.L118
	li	a3,0
	lla	a2,.LC8
	li	a1,2
	mv	a0,s0
	call	luaL_optlstring
	li	a4,2
	mv	s1,a0
	sw	s0,0(sp)
	li	a5,1
	sw	a4,8(sp)
.L80:
	mv	a1,a5
	mv	a0,s0
	sw	a5,4(sp)
	call	lua_type
	li	a4,6
	lw	a5,4(sp)
	beq	a0,a4,.L119
.L81:
	mv	a1,a5
	mv	a0,s0
	call	luaL_checkinteger
	mv	a1,a0
	lw	a0,0(sp)
	addi	a2,sp,12
	sw	a2,4(sp)
	call	lua_getstack
	lw	a2,4(sp)
	beq	a0,zero,.L120
	lw	a0,0(sp)
	mv	a1,s1
	call	lua_getinfo
	beq	a0,zero,.L121
.L84:
	li	a1,0
	mv	a0,s0
	li	a2,0
	call	lua_createtable
	li	a1,83
	mv	a0,s1
	call	strchr
	beq	a0,zero,.L85
	lw	a1,28(sp)
	mv	a0,s0
	call	lua_pushstring
	lla	a2,.LC12
	li	a1,-2
	mv	a0,s0
	call	lua_setfield
	addi	a1,sp,48
	mv	a0,s0
	call	lua_pushstring
	lla	a2,.LC13
	li	a1,-2
	mv	a0,s0
	call	lua_setfield
	lw	a1,36(sp)
	mv	a0,s0
	call	lua_pushinteger
	lla	a2,.LC14
	li	a1,-2
	mv	a0,s0
	call	lua_setfield
	lw	a1,40(sp)
	mv	a0,s0
	call	lua_pushinteger
	lla	a2,.LC15
	li	a1,-2
	mv	a0,s0
	call	lua_setfield
	lw	a1,24(sp)
	mv	a0,s0
	call	lua_pushstring
	lla	a2,.LC16
	li	a1,-2
	mv	a0,s0
	call	lua_setfield
.L85:
	li	a1,108
	mv	a0,s1
	call	strchr
	beq	a0,zero,.L86
	lw	a1,32(sp)
	mv	a0,s0
	call	lua_pushinteger
	lla	a2,.LC17
	li	a1,-2
	mv	a0,s0
	call	lua_setfield
.L86:
	li	a1,117
	mv	a0,s1
	call	strchr
	beq	a0,zero,.L87
	lbu	a1,44(sp)
	mv	a0,s0
	call	lua_pushinteger
	lla	a2,.LC18
	li	a1,-2
	mv	a0,s0
	call	lua_setfield
	lbu	a1,45(sp)
	mv	a0,s0
	call	lua_pushinteger
	lla	a2,.LC19
	li	a1,-2
	mv	a0,s0
	call	lua_setfield
	lbu	a1,46(sp)
	mv	a0,s0
	call	lua_pushboolean
	lla	a2,.LC20
	li	a1,-2
	mv	a0,s0
	call	lua_setfield
.L87:
	li	a1,110
	mv	a0,s1
	call	strchr
	beq	a0,zero,.L88
	lw	a1,16(sp)
	mv	a0,s0
	call	lua_pushstring
	lla	a2,.LC21
	li	a1,-2
	mv	a0,s0
	call	lua_setfield
	lw	a1,20(sp)
	mv	a0,s0
	call	lua_pushstring
	lla	a2,.LC22
	li	a1,-2
	mv	a0,s0
	call	lua_setfield
.L88:
	li	a1,116
	mv	a0,s1
	call	strchr
	beq	a0,zero,.L89
	lbu	a1,47(sp)
	mv	a0,s0
	call	lua_pushboolean
	lla	a2,.LC23
	li	a1,-2
	mv	a0,s0
	call	lua_setfield
.L89:
	li	a1,76
	mv	a0,s1
	call	strchr
	beq	a0,zero,.L90
	lw	a5,0(sp)
	li	a2,1
	beq	s0,a5,.L122
	lw	a0,0(sp)
	mv	a1,s0
	call	lua_xmove
.L92:
	lla	a2,.LC24
	li	a1,-2
	mv	a0,s0
	call	lua_setfield
.L90:
	li	a1,102
	mv	a0,s1
	call	strchr
	mv	a5,a0
	li	a0,1
	beq	a5,zero,.L78
	lw	a5,0(sp)
	li	a2,1
	beq	s0,a5,.L123
	lw	a0,0(sp)
	mv	a1,s0
	call	lua_xmove
.L94:
	mv	a0,s0
	lla	a2,.LC25
	li	a1,-2
	call	lua_setfield
	li	a0,1
.L78:
	lw	ra,120(sp)
	lw	s0,116(sp)
	lw	s1,112(sp)
	addi	sp,sp,124
	jr	ra
.L118:
	li	a1,1
	mv	a0,s0
	call	lua_tothread
	mv	a5,a0
	li	a3,0
	lla	a2,.LC8
	li	a1,3
	mv	a0,s0
	sw	a5,0(sp)
	call	luaL_optlstring
	lw	a5,0(sp)
	mv	s1,a0
	beq	s0,a5,.L95
	mv	a0,a5
	li	a1,3
	call	lua_checkstack
	li	a4,3
	sw	a4,8(sp)
	li	a5,2
	bne	a0,zero,.L80
	lla	a1,.LC9
	mv	a0,s0
	sw	a5,4(sp)
	call	luaL_error
	lw	a5,4(sp)
	mv	a0,s0
	mv	a1,a5
	sw	a5,4(sp)
	call	lua_type
	li	a4,6
	lw	a5,4(sp)
	bne	a0,a4,.L81
.L119:
	mv	a2,s1
	lla	a1,.LC10
	mv	a0,s0
	call	lua_pushfstring
	lw	a5,4(sp)
	mv	s1,a0
	mv	a0,s0
	mv	a1,a5
	call	lua_pushvalue
	lw	a1,0(sp)
	li	a2,1
	mv	a0,s0
	call	lua_xmove
	lw	a0,0(sp)
	addi	a2,sp,12
	mv	a1,s1
	call	lua_getinfo
	bne	a0,zero,.L84
.L121:
	lw	a1,8(sp)
	mv	a0,s0
	lla	a2,.LC11
	call	luaL_argerror
	lw	ra,120(sp)
	lw	s0,116(sp)
	lw	s1,112(sp)
	addi	sp,sp,124
	jr	ra
.L120:
	mv	a0,s0
	call	lua_pushnil
	lw	ra,120(sp)
	lw	s0,116(sp)
	lw	s1,112(sp)
	li	a0,1
	addi	sp,sp,124
	jr	ra
.L122:
	li	a1,-2
	mv	a0,s0
	call	lua_rotate
	j	.L92
.L123:
	li	a1,-2
	mv	a0,s0
	call	lua_rotate
	j	.L94
.L95:
	li	a4,3
	li	a5,2
	sw	a4,8(sp)
	j	.L80
	.size	db_getinfo, .-db_getinfo
	.section	.rodata.db_setlocal.str1.4,"aMS",@progbits,1
	.align	2
.LC26:
	.string	"level out of range"
	.section	.text.db_setlocal,"ax",@progbits
	.align	2
	.type	db_setlocal, @function
db_setlocal:
	addi	sp,sp,-120
	li	a1,1
	sw	s0,112(sp)
	sw	ra,116(sp)
	sw	s1,108(sp)
	mv	s0,a0
	call	lua_type
	li	a5,8
	li	a1,1
	beq	a0,a5,.L136
	mv	a0,s0
	call	luaL_checkinteger
	addi	a5,sp,8
	mv	s1,a0
	li	a1,2
	mv	a0,s0
	sw	a5,0(sp)
	call	luaL_checkinteger
	lw	a2,0(sp)
	mv	a5,a0
	mv	a1,s1
	mv	a0,s0
	sw	a5,4(sp)
	call	lua_getstack
	li	a1,1
	bne	a0,zero,.L137
.L130:
	mv	a0,s0
	lla	a2,.LC26
	call	luaL_argerror
	lw	ra,116(sp)
	lw	s0,112(sp)
	lw	s1,108(sp)
	addi	sp,sp,120
	jr	ra
.L137:
	li	a1,3
	mv	a0,s0
	call	luaL_checkany
	li	a1,3
	mv	a0,s0
	call	lua_settop
	mv	s1,s0
.L128:
	li	a2,1
	mv	a1,s1
	mv	a0,s0
	call	lua_xmove
	lw	a2,4(sp)
	lw	a1,0(sp)
	mv	a0,s1
	call	lua_setlocal
	mv	a5,a0
	beq	a0,zero,.L138
.L129:
	mv	a0,s0
	mv	a1,a5
	call	lua_pushstring
	lw	ra,116(sp)
	lw	s0,112(sp)
	lw	s1,108(sp)
	li	a0,1
	addi	sp,sp,120
	jr	ra
.L136:
	mv	a0,s0
	call	lua_tothread
	mv	s1,a0
	li	a1,2
	mv	a0,s0
	call	luaL_checkinteger
	mv	a5,a0
	li	a1,3
	sw	a5,4(sp)
	mv	a0,s0
	addi	a5,sp,8
	sw	a5,0(sp)
	call	luaL_checkinteger
	lw	a5,4(sp)
	lw	a2,0(sp)
	mv	a4,a0
	mv	a1,a5
	mv	a0,s1
	sw	a4,4(sp)
	call	lua_getstack
	beq	a0,zero,.L139
	li	a1,4
	mv	a0,s0
	call	luaL_checkany
	li	a1,4
	mv	a0,s0
	call	lua_settop
	beq	s0,s1,.L128
	li	a1,1
	mv	a0,s1
	call	lua_checkstack
	bne	a0,zero,.L128
	lla	a1,.LC9
	mv	a0,s0
	call	luaL_error
	j	.L128
.L138:
	sw	a0,0(sp)
	li	a1,-2
	mv	a0,s1
	call	lua_settop
	lw	a5,0(sp)
	j	.L129
.L139:
	li	a1,2
	j	.L130
	.size	db_setlocal, .-db_setlocal
	.section	.rodata.db_gethook.str1.4,"aMS",@progbits,1
	.align	2
.LC27:
	.string	"external hook"
	.section	.text.db_gethook,"ax",@progbits
	.align	2
	.type	db_gethook, @function
db_gethook:
	addi	sp,sp,-24
	li	a1,1
	sw	s0,16(sp)
	sw	s1,12(sp)
	mv	s0,a0
	sw	ra,20(sp)
	call	lua_type
	li	a5,8
	mv	s1,s0
	beq	a0,a5,.L161
.L141:
	mv	a0,s1
	call	lua_gethookmask
	mv	a5,a0
	mv	a0,s1
	sw	a5,0(sp)
	call	lua_gethook
	beq	a0,zero,.L162
	lla	a5,hookf
	beq	a0,a5,.L144
	lla	a1,.LC27
	mv	a0,s0
	call	lua_pushstring
.L143:
	lw	a5,0(sp)
	andi	a4,a5,1
	beq	a4,zero,.L152
	li	a5,99
	sb	a5,4(sp)
	addi	a3,sp,5
	addi	a1,sp,4
.L148:
	lw	a5,0(sp)
	andi	a5,a5,2
	beq	a5,zero,.L149
	addi	a4,a4,1
	li	a5,114
	sb	a5,0(a3)
	add	a3,a1,a4
.L149:
	lw	a5,0(sp)
	andi	a5,a5,4
	beq	a5,zero,.L150
	addi	a4,a4,1
	li	a5,108
	sb	a5,0(a3)
	add	a3,a1,a4
.L150:
	sb	zero,0(a3)
	mv	a0,s0
	call	lua_pushstring
	mv	a0,s1
	call	lua_gethookcount
	mv	a1,a0
	mv	a0,s0
	call	lua_pushinteger
	lw	ra,20(sp)
	lw	s0,16(sp)
	lw	s1,12(sp)
	li	a0,3
	addi	sp,sp,24
	jr	ra
.L152:
	addi	a1,sp,4
	mv	a3,a1
	j	.L148
.L144:
	li	a1,-999424
	lla	a2,.LANCHOR0
	addi	a1,a1,-1576
	mv	a0,s0
	call	lua_rawgetp
	beq	s0,s1,.L146
	li	a1,1
	mv	a0,s1
	call	lua_checkstack
	beq	a0,zero,.L163
.L146:
	mv	a0,s1
	call	lua_pushthread
	li	a2,1
	mv	a1,s0
	mv	a0,s1
	call	lua_xmove
	li	a1,-2
	mv	a0,s0
	call	lua_rawget
	mv	a0,s0
	li	a1,-2
	li	a2,-1
	call	lua_rotate
	li	a1,-2
	mv	a0,s0
	call	lua_settop
	j	.L143
.L161:
	li	a1,1
	mv	a0,s0
	call	lua_tothread
	mv	s1,a0
	j	.L141
.L162:
	mv	a0,s0
	call	lua_pushnil
	j	.L143
.L163:
	lla	a1,.LC9
	mv	a0,s0
	call	luaL_error
	j	.L146
	.size	db_gethook, .-db_gethook
	.section	.text.db_getlocal,"ax",@progbits
	.align	2
	.type	db_getlocal, @function
db_getlocal:
	addi	sp,sp,-120
	li	a1,1
	sw	s0,112(sp)
	sw	ra,116(sp)
	sw	s1,108(sp)
	mv	s0,a0
	call	lua_type
	li	a5,8
	beq	a0,a5,.L175
	li	a5,1
	mv	s1,s0
	sw	a5,0(sp)
	li	a1,2
.L165:
	mv	a0,s0
	call	luaL_checkinteger
	lw	a1,0(sp)
	mv	a5,a0
	mv	a0,s0
	sw	a5,4(sp)
	call	lua_type
	li	a5,6
	lw	a1,0(sp)
	beq	a0,a5,.L176
	mv	a0,s0
	call	luaL_checkinteger
	mv	a1,a0
	addi	a2,sp,8
	mv	a0,s1
	call	lua_getstack
	beq	a0,zero,.L177
	beq	s0,s1,.L170
	li	a1,1
	mv	a0,s1
	call	lua_checkstack
	beq	a0,zero,.L178
.L170:
	lw	a2,4(sp)
	addi	a1,sp,8
	mv	a0,s1
	call	lua_getlocal
	sw	a0,0(sp)
	beq	a0,zero,.L172
.L179:
	li	a2,1
	mv	a1,s0
	mv	a0,s1
	call	lua_xmove
	lw	a5,0(sp)
	mv	a0,s0
	mv	a1,a5
	call	lua_pushstring
	mv	a0,s0
	li	a2,1
	li	a1,-2
	call	lua_rotate
	lw	ra,116(sp)
	lw	s0,112(sp)
	lw	s1,108(sp)
	li	a0,2
	addi	sp,sp,120
	jr	ra
.L172:
	mv	a0,s0
	call	lua_pushnil
	lw	ra,116(sp)
	lw	s0,112(sp)
	lw	s1,108(sp)
	li	a0,1
	addi	sp,sp,120
	jr	ra
.L176:
	mv	a0,s0
	call	lua_pushvalue
	lw	a2,4(sp)
	li	a1,0
	mv	a0,s0
	call	lua_getlocal
	mv	a1,a0
	mv	a0,s0
	call	lua_pushstring
	lw	ra,116(sp)
	lw	s0,112(sp)
	lw	s1,108(sp)
	li	a0,1
	addi	sp,sp,120
	jr	ra
.L175:
	li	a1,1
	mv	a0,s0
	call	lua_tothread
	li	a5,2
	mv	s1,a0
	sw	a5,0(sp)
	li	a1,3
	j	.L165
.L178:
	lla	a1,.LC9
	mv	a0,s0
	call	luaL_error
	lw	a2,4(sp)
	addi	a1,sp,8
	mv	a0,s1
	call	lua_getlocal
	sw	a0,0(sp)
	bne	a0,zero,.L179
	j	.L172
.L177:
	lw	a1,0(sp)
	mv	a0,s0
	lla	a2,.LC26
	call	luaL_argerror
	lw	ra,116(sp)
	lw	s0,112(sp)
	lw	s1,108(sp)
	addi	sp,sp,120
	jr	ra
	.size	db_getlocal, .-db_getlocal
	.section	.rodata.db_sethook.str1.4,"aMS",@progbits,1
	.align	2
.LC28:
	.string	"k"
	.align	2
.LC29:
	.string	"__mode"
	.section	.text.db_sethook,"ax",@progbits
	.align	2
	.type	db_sethook, @function
db_sethook:
	addi	sp,sp,-28
	li	a1,1
	sw	s0,20(sp)
	sw	ra,24(sp)
	sw	s1,16(sp)
	mv	s0,a0
	call	lua_type
	li	a5,8
	beq	a0,a5,.L199
	li	a5,1
	mv	s1,s0
	sw	a5,4(sp)
	sw	zero,0(sp)
.L181:
	lw	a1,4(sp)
	mv	a0,s0
	call	lua_type
	ble	a0,zero,.L200
	lw	a5,0(sp)
	li	a2,0
	mv	a0,s0
	addi	a1,a5,2
	call	luaL_checklstring
	lw	a1,4(sp)
	mv	a5,a0
	li	a2,6
	mv	a0,s0
	sw	a5,12(sp)
	call	luaL_checktype
	lw	a4,0(sp)
	li	a2,0
	mv	a0,s0
	addi	a1,a4,3
	call	luaL_optinteger
	mv	a5,a0
	lw	a0,12(sp)
	li	a1,99
	sw	a5,8(sp)
	call	strchr
	mv	a5,a0
	lw	a0,12(sp)
	snez	a5,a5
	li	a1,114
	sw	a5,0(sp)
	call	strchr
	beq	a0,zero,.L184
	lw	a5,0(sp)
	ori	a5,a5,2
	sw	a5,0(sp)
.L184:
	lw	a0,12(sp)
	li	a1,108
	call	strchr
	beq	a0,zero,.L185
	lw	a5,0(sp)
	ori	a5,a5,4
	sw	a5,0(sp)
.L185:
	lla	a5,hookf
	sw	a5,12(sp)
	lw	a5,8(sp)
	ble	a5,zero,.L183
	lw	a5,0(sp)
	ori	a5,a5,8
	sw	a5,0(sp)
.L183:
	li	a5,-999424
	lla	a2,.LANCHOR0
	addi	a1,a5,-1576
	mv	a0,s0
	call	lua_rawgetp
	beq	a0,zero,.L201
.L186:
	beq	s0,s1,.L188
	li	a1,1
	mv	a0,s1
	call	lua_checkstack
	beq	a0,zero,.L202
.L188:
	mv	a0,s1
	call	lua_pushthread
	li	a2,1
	mv	a1,s0
	mv	a0,s1
	call	lua_xmove
	lw	a1,4(sp)
	mv	a0,s0
	call	lua_pushvalue
	mv	a0,s0
	li	a1,-3
	call	lua_rawset
	lw	a3,8(sp)
	lw	a2,0(sp)
	lw	a1,12(sp)
	mv	a0,s1
	call	lua_sethook
	lw	ra,24(sp)
	lw	s0,20(sp)
	lw	s1,16(sp)
	li	a0,0
	addi	sp,sp,28
	jr	ra
.L201:
	li	a2,2
	mv	a0,s0
	li	a1,0
	call	lua_createtable
	mv	a0,s0
	li	a1,-1
	call	lua_pushvalue
	li	a5,-999424
	addi	a1,a5,-1576
	lla	a2,.LANCHOR0
	mv	a0,s0
	call	lua_rawsetp
	lla	a1,.LC28
	mv	a0,s0
	call	lua_pushstring
	lla	a2,.LC29
	mv	a0,s0
	li	a1,-2
	call	lua_setfield
	mv	a0,s0
	li	a1,-1
	call	lua_pushvalue
	li	a1,-2
	mv	a0,s0
	call	lua_setmetatable
	j	.L186
.L200:
	lw	a1,4(sp)
	mv	a0,s0
	call	lua_settop
	li	a5,-999424
	lla	a2,.LANCHOR0
	addi	a1,a5,-1576
	mv	a0,s0
	sw	zero,12(sp)
	sw	zero,8(sp)
	sw	zero,0(sp)
	call	lua_rawgetp
	bne	a0,zero,.L186
	j	.L201
.L199:
	li	a1,1
	mv	a0,s0
	call	lua_tothread
	li	a5,2
	sw	a5,4(sp)
	li	a5,1
	mv	s1,a0
	sw	a5,0(sp)
	j	.L181
.L202:
	lla	a1,.LC9
	mv	a0,s0
	call	luaL_error
	j	.L188
	.size	db_sethook, .-db_sethook
	.section	.text.luaopen_debug,"ax",@progbits
	.align	2
	.globl	luaopen_debug
	.hidden	luaopen_debug
	.type	luaopen_debug, @function
luaopen_debug:
	addi	sp,sp,-12
	li	a2,68
	li	a1,503
	sw	ra,8(sp)
	sw	s0,4(sp)
	mv	s0,a0
	call	luaL_checkversion_
	mv	a0,s0
	li	a2,16
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
	.size	luaopen_debug, .-luaopen_debug
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC30:
	.string	"call"
	.align	2
.LC31:
	.string	"return"
	.align	2
.LC32:
	.string	"line"
	.align	2
.LC33:
	.string	"count"
	.align	2
.LC34:
	.string	"tail call"
	.align	2
.LC35:
	.string	"debug"
	.align	2
.LC36:
	.string	"getuservalue"
	.align	2
.LC37:
	.string	"gethook"
	.align	2
.LC38:
	.string	"getinfo"
	.align	2
.LC39:
	.string	"getlocal"
	.align	2
.LC40:
	.string	"getregistry"
	.align	2
.LC41:
	.string	"getmetatable"
	.align	2
.LC42:
	.string	"getupvalue"
	.align	2
.LC43:
	.string	"upvaluejoin"
	.align	2
.LC44:
	.string	"upvalueid"
	.align	2
.LC45:
	.string	"setuservalue"
	.align	2
.LC46:
	.string	"sethook"
	.align	2
.LC47:
	.string	"setlocal"
	.align	2
.LC48:
	.string	"setmetatable"
	.align	2
.LC49:
	.string	"setupvalue"
	.align	2
.LC50:
	.string	"traceback"
	.section	.rodata.dblib,"a"
	.align	2
	.set	.LANCHOR2,. + 0
	.type	dblib, @object
	.size	dblib, 136
dblib:
	.word	.LC35
	.word	db_debug
	.word	.LC36
	.word	db_getuservalue
	.word	.LC37
	.word	db_gethook
	.word	.LC38
	.word	db_getinfo
	.word	.LC39
	.word	db_getlocal
	.word	.LC40
	.word	db_getregistry
	.word	.LC41
	.word	db_getmetatable
	.word	.LC42
	.word	db_getupvalue
	.word	.LC43
	.word	db_upvaluejoin
	.word	.LC44
	.word	db_upvalueid
	.word	.LC45
	.word	db_setuservalue
	.word	.LC46
	.word	db_sethook
	.word	.LC47
	.word	db_setlocal
	.word	.LC48
	.word	db_setmetatable
	.word	.LC49
	.word	db_setupvalue
	.word	.LC50
	.word	db_traceback
	.word	0
	.word	0
	.section	.rodata.hooknames.0,"a"
	.align	2
	.set	.LANCHOR1,. + 0
	.type	hooknames.0, @object
	.size	hooknames.0, 20
hooknames.0:
	.word	.LC30
	.word	.LC31
	.word	.LC32
	.word	.LC33
	.word	.LC34
	.section	.srodata.HOOKKEY,"a"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	HOOKKEY, @object
	.size	HOOKKEY, 4
HOOKKEY:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
