#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"lauxlib.c"
	.option nopic
	.text
	.section	.text.getS,"ax",@progbits
	.align	2
	.type	getS, @function
getS:
	lw	a5,4(a1)
	beq	a5,zero,.L3
	sw	a5,0(a2)
	lw	a0,0(a1)
	sw	zero,4(a1)
	ret
.L3:
	li	a0,0
	ret
	.size	getS, .-getS
	.section	.rodata.findfield.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"."
	.section	.text.findfield,"ax",@progbits
	.align	2
	.type	findfield, @function
findfield:
	bne	a2,zero,.L6
	li	a0,0
	ret
.L6:
	addi	sp,sp,-16
	sw	s1,4(sp)
	mv	s1,a1
	li	a1,-1
	sw	s0,8(sp)
	sw	ra,12(sp)
	mv	s0,a0
	sw	a2,0(sp)
	call	lua_type
	li	a5,5
	beq	a0,a5,.L19
.L8:
	li	a0,0
.L5:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L19:
	mv	a0,s0
	call	lua_pushnil
	lw	a2,0(sp)
	addi	a5,a2,-1
	sw	a5,0(sp)
	j	.L9
.L10:
	li	a1,-2
	mv	a0,s0
	call	lua_settop
.L9:
	li	a1,-2
	mv	a0,s0
	call	lua_next
	mv	a5,a0
	li	a1,-2
	mv	a0,s0
	beq	a5,zero,.L8
	call	lua_type
	li	a5,4
	bne	a0,a5,.L10
	li	a2,-1
	mv	a1,s1
	mv	a0,s0
	call	lua_rawequal
	mv	a5,a0
	lw	a2,0(sp)
	mv	a1,s1
	mv	a0,s0
	bne	a5,zero,.L20
	call	findfield
	beq	a0,zero,.L10
	li	a2,-1
	li	a1,-2
	mv	a0,s0
	call	lua_rotate
	li	a1,-2
	mv	a0,s0
	call	lua_settop
	lla	a1,.LC0
	mv	a0,s0
	call	lua_pushstring
	li	a2,1
	li	a1,-2
	mv	a0,s0
	call	lua_rotate
	mv	a0,s0
	li	a1,3
	call	lua_concat
	li	a0,1
	j	.L5
.L20:
	li	a1,-2
	call	lua_settop
	li	a0,1
	j	.L5
	.size	findfield, .-findfield
	.section	.rodata.pushglobalfuncname.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"f"
	.align	2
.LC2:
	.string	"_LOADED"
	.align	2
.LC3:
	.string	"_G."
	.section	.text.pushglobalfuncname,"ax",@progbits
	.align	2
	.type	pushglobalfuncname, @function
pushglobalfuncname:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	mv	s0,a0
	mv	s1,a1
	call	lua_gettop
	mv	a5,a0
	mv	a2,s1
	lla	a1,.LC1
	mv	a0,s0
	mv	s1,a5
	call	lua_getinfo
	li	a1,-999424
	lla	a2,.LC2
	addi	a1,a1,-1576
	mv	a0,s0
	call	lua_getfield
	addi	a4,s1,1
	li	a2,2
	mv	a1,a4
	mv	a0,s0
	sw	a4,0(sp)
	call	findfield
	beq	a0,zero,.L22
	li	a2,0
	li	a1,-1
	mv	a0,s0
	call	lua_tolstring
	li	a2,3
	lla	a1,.LC3
	mv	s1,a0
	call	strncmp
	lw	a4,0(sp)
	beq	a0,zero,.L26
.L23:
	mv	a0,s0
	mv	a2,a4
	li	a1,-1
	call	lua_copy
	mv	a0,s0
	li	a1,-3
	call	lua_settop
	lw	ra,12(sp)
	lw	s0,8(sp)
	li	a5,1
	lw	s1,4(sp)
	mv	a0,a5
	addi	sp,sp,16
	jr	ra
.L22:
	sw	a0,0(sp)
	mv	a1,s1
	mv	a0,s0
	call	lua_settop
	lw	a5,0(sp)
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	mv	a0,a5
	addi	sp,sp,16
	jr	ra
.L26:
	addi	a1,s1,3
	mv	a0,s0
	call	lua_pushstring
	li	a1,-2
	mv	a0,s0
	li	a2,-1
	call	lua_rotate
	li	a1,-2
	mv	a0,s0
	call	lua_settop
	lw	a4,0(sp)
	j	.L23
	.size	pushglobalfuncname, .-pushglobalfuncname
	.section	.text.getF,"ax",@progbits
	.align	2
	.type	getF, @function
getF:
	lw	a5,0(a1)
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	mv	s0,a1
	mv	s1,a2
	ble	a5,zero,.L28
	sw	a5,0(a2)
	sw	zero,0(a1)
	addi	a5,a1,8
.L27:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	mv	a0,a5
	addi	sp,sp,16
	jr	ra
.L28:
	lw	a0,4(a1)
	li	a5,0
	sw	a5,0(sp)
	call	feof
	lw	a5,0(sp)
	bne	a0,zero,.L27
	lw	a3,4(s0)
	addi	a5,s0,8
	mv	a0,a5
	li	a2,8192
	li	a1,1
	sw	a5,0(sp)
	call	fread
	lw	a5,0(sp)
	lw	ra,12(sp)
	lw	s0,8(sp)
	sw	a0,0(s1)
	lw	s1,4(sp)
	mv	a0,a5
	addi	sp,sp,16
	jr	ra
	.size	getF, .-getF
	.section	.rodata.lua_panic.str1.4,"aMS",@progbits,1
	.align	2
.LC4:
	.string	"PANIC: unprotected error in call to Lua API (%s)\n"
	.section	.text.lua_panic,"ax",@progbits
	.align	2
	.type	lua_panic, @function
lua_panic:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,stderr
	sw	s1,0(sp)
	lw	s1,0(s0)
	li	a1,-1
	li	a2,0
	sw	ra,8(sp)
	call	lua_tolstring
	mv	a2,a0
	lla	a1,.LC4
	mv	a0,s1
	call	fprintf
	lw	a0,0(s0)
	call	fflush
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	li	a0,0
	addi	sp,sp,12
	jr	ra
	.size	lua_panic, .-lua_panic
	.section	.text.l_alloc,"ax",@progbits
	.align	2
	.type	l_alloc, @function
l_alloc:
	mv	a0,a1
	beq	a3,zero,.L39
	mv	a1,a3
	tail	realloc
.L39:
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	free
	lw	ra,8(sp)
	li	a0,0
	addi	sp,sp,12
	jr	ra
	.size	l_alloc, .-l_alloc
	.section	.rodata.skipcomment.str1.4,"aMS",@progbits,1
	.align	2
.LC5:
	.string	"\357\273\277"
	.section	.text.skipcomment,"ax",@progbits
	.align	2
	.type	skipcomment, @function
skipcomment:
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	mv	s1,a0
	sw	a1,0(sp)
	sw	zero,0(a0)
	lla	s0,.LC5
	j	.L45
.L54:
	lbu	a5,-1(s0)
	bne	a0,a5,.L44
	lw	a5,0(s1)
	lbu	a2,0(s0)
	addi	a1,a5,1
	sw	a1,0(s1)
	add	a5,s1,a5
	sb	a0,8(a5)
	beq	a2,zero,.L53
.L45:
	lw	a0,4(s1)
	addi	s0,s0,1
	call	getc
	li	a5,-1
	bne	a0,a5,.L54
	lw	a5,0(sp)
	li	a4,-1
	sw	a4,0(a5)
	li	a5,0
.L42:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	mv	a0,a5
	addi	sp,sp,16
	jr	ra
.L53:
	lw	a0,4(s1)
	sw	zero,0(s1)
	call	getc
.L44:
	lw	a5,0(sp)
	li	a3,35
	sw	a0,0(a5)
	li	a5,0
	bne	a0,a3,.L42
	li	s0,-1
	j	.L48
.L55:
	beq	a0,a5,.L47
.L48:
	lw	a0,4(s1)
	call	getc
	li	a5,10
	bne	a0,s0,.L55
.L47:
	lw	a0,4(s1)
	call	getc
	lw	a5,0(sp)
	lw	ra,12(sp)
	lw	s0,8(sp)
	sw	a0,0(a5)
	li	a5,1
	lw	s1,4(sp)
	mv	a0,a5
	addi	sp,sp,16
	jr	ra
	.size	skipcomment, .-skipcomment
	.section	.text.luaL_getmetafield.part.0,"ax",@progbits
	.align	2
	.type	luaL_getmetafield.part.0, @function
luaL_getmetafield.part.0:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	mv	s0,a0
	call	lua_pushstring
	li	a1,-2
	mv	a0,s0
	call	lua_rawget
	mv	s1,a0
	bne	a0,zero,.L57
	mv	a0,s0
	li	a1,-3
	call	lua_settop
	lw	ra,8(sp)
	lw	s0,4(sp)
	mv	a0,s1
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L57:
	mv	a0,s0
	li	a1,-2
	li	a2,-1
	call	lua_rotate
	mv	a0,s0
	li	a1,-2
	call	lua_settop
	lw	ra,8(sp)
	lw	s0,4(sp)
	mv	a0,s1
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
	.size	luaL_getmetafield.part.0, .-luaL_getmetafield.part.0
	.section	.rodata.luaL_where.str1.4,"aMS",@progbits,1
	.align	2
.LC6:
	.string	"Sl"
	.align	2
.LC7:
	.string	"%s:%d: "
	.align	2
.LC8:
	.string	""
	.section	.text.luaL_where,"ax",@progbits
	.align	2
	.globl	luaL_where
	.hidden	luaL_where
	.type	luaL_where, @function
luaL_where:
	addi	sp,sp,-112
	mv	a2,sp
	sw	s0,104(sp)
	sw	ra,108(sp)
	mv	s0,a0
	call	lua_getstack
	beq	a0,zero,.L61
	mv	a2,sp
	lla	a1,.LC6
	mv	a0,s0
	call	lua_getinfo
	lw	a3,20(sp)
	bgt	a3,zero,.L67
.L61:
	mv	a0,s0
	lla	a1,.LC8
	call	lua_pushfstring
	lw	ra,108(sp)
	lw	s0,104(sp)
	addi	sp,sp,112
	jr	ra
.L67:
	addi	a2,sp,36
	mv	a0,s0
	lla	a1,.LC7
	call	lua_pushfstring
	lw	ra,108(sp)
	lw	s0,104(sp)
	addi	sp,sp,112
	jr	ra
	.size	luaL_where, .-luaL_where
	.section	.text.luaL_error,"ax",@progbits
	.align	2
	.globl	luaL_error
	.hidden	luaL_error
	.type	luaL_error, @function
luaL_error:
	addi	sp,sp,-32
	sw	s1,4(sp)
	sw	a5,28(sp)
	mv	s1,a1
	addi	a5,sp,16
	li	a1,1
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	a3,20(sp)
	mv	s0,a0
	sw	a4,24(sp)
	sw	a5,0(sp)
	sw	a2,16(sp)
	call	luaL_where
	lw	a2,0(sp)
	mv	a1,s1
	mv	a0,s0
	call	lua_pushvfstring
	mv	a0,s0
	li	a1,2
	call	lua_concat
	mv	a0,s0
	call	lua_error
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,32
	jr	ra
	.size	luaL_error, .-luaL_error
	.section	.rodata.luaL_argerror.str1.4,"aMS",@progbits,1
	.align	2
.LC9:
	.string	"?"
	.align	2
.LC10:
	.string	"bad argument #%d (%s)"
	.align	2
.LC11:
	.string	"n"
	.align	2
.LC12:
	.string	"method"
	.align	2
.LC13:
	.string	"calling '%s' on bad self (%s)"
	.align	2
.LC14:
	.string	"bad argument #%d to '%s' (%s)"
	.section	.text.luaL_argerror,"ax",@progbits
	.align	2
	.globl	luaL_argerror
	.hidden	luaL_argerror
	.type	luaL_argerror, @function
luaL_argerror:
	addi	sp,sp,-116
	sw	s0,108(sp)
	sw	s1,104(sp)
	mv	s0,a1
	mv	s1,a2
	li	a1,0
	addi	a2,sp,4
	sw	ra,112(sp)
	sw	a0,0(sp)
	call	lua_getstack
	lw	a5,0(sp)
	beq	a0,zero,.L79
	mv	a0,a5
	addi	a2,sp,4
	lla	a1,.LC11
	sw	a5,0(sp)
	call	lua_getinfo
	lw	a0,12(sp)
	lla	a1,.LC12
	call	strcmp
	lw	a5,0(sp)
	bne	a0,zero,.L73
	addi	s0,s0,-1
	beq	s0,zero,.L80
.L73:
	lw	a3,8(sp)
	beq	a3,zero,.L81
.L74:
	mv	a4,s1
	mv	a2,s0
	lla	a1,.LC14
	mv	a0,a5
	call	luaL_error
.L70:
	lw	ra,112(sp)
	lw	s0,108(sp)
	lw	s1,104(sp)
	addi	sp,sp,116
	jr	ra
.L79:
	mv	a3,s1
	mv	a2,s0
	lla	a1,.LC10
	mv	a0,a5
	call	luaL_error
	lw	ra,112(sp)
	lw	s0,108(sp)
	lw	s1,104(sp)
	addi	sp,sp,116
	jr	ra
.L81:
	mv	a0,a5
	addi	a1,sp,4
	sw	a5,0(sp)
	call	pushglobalfuncname
	lw	a5,0(sp)
	lla	a3,.LC9
	bne	a0,zero,.L82
	sw	a3,8(sp)
	j	.L74
.L80:
	lw	a2,8(sp)
	mv	a3,s1
	lla	a1,.LC13
	mv	a0,a5
	call	luaL_error
	j	.L70
.L82:
	mv	a0,a5
	li	a2,0
	li	a1,-1
	call	lua_tolstring
	mv	a3,a0
	lw	a5,0(sp)
	sw	a3,8(sp)
	j	.L74
	.size	luaL_argerror, .-luaL_argerror
	.section	.rodata.typeerror.isra.0.str1.4,"aMS",@progbits,1
	.align	2
.LC15:
	.string	"light userdata"
	.align	2
.LC16:
	.string	"__name"
	.align	2
.LC17:
	.string	"%s expected, got %s"
	.section	.text.typeerror.isra.0,"ax",@progbits
	.align	2
	.type	typeerror.isra.0, @function
typeerror.isra.0:
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	mv	s0,a0
	mv	s1,a1
	sw	a2,0(sp)
	call	lua_getmetatable
	bne	a0,zero,.L91
.L84:
	mv	a1,s1
	mv	a0,s0
	call	lua_type
	li	a5,2
	lla	a3,.LC15
	bne	a0,a5,.L92
.L85:
	lw	a2,0(sp)
	lla	a1,.LC17
	mv	a0,s0
	call	lua_pushfstring
	mv	a2,a0
	mv	a0,s0
	lw	s0,8(sp)
	lw	ra,12(sp)
	mv	a1,s1
	lw	s1,4(sp)
	addi	sp,sp,16
	tail	luaL_argerror
.L92:
	mv	a1,s1
	mv	a0,s0
	call	lua_type
	mv	a1,a0
	mv	a0,s0
	call	lua_typename
	mv	a3,a0
	j	.L85
.L91:
	lla	a1,.LC16
	mv	a0,s0
	call	luaL_getmetafield.part.0
	li	a5,4
	bne	a0,a5,.L84
	li	a2,0
	li	a1,-1
	mv	a0,s0
	call	lua_tolstring
	mv	a3,a0
	j	.L85
	.size	typeerror.isra.0, .-typeerror.isra.0
	.section	.rodata.resizebox.str1.4,"aMS",@progbits,1
	.align	2
.LC18:
	.string	"not enough memory for buffer allocation"
	.section	.text.resizebox,"ax",@progbits
	.align	2
	.type	resizebox, @function
resizebox:
	addi	sp,sp,-28
	sw	s1,16(sp)
	mv	s1,a1
	addi	a1,sp,12
	sw	ra,24(sp)
	sw	s0,20(sp)
	sw	a0,0(sp)
	mv	s0,a2
	call	lua_getallocf
	mv	a4,a0
	lw	a0,0(sp)
	mv	a1,s1
	sw	a4,8(sp)
	call	lua_touserdata
	lw	a2,4(a0)
	lw	a1,0(a0)
	lw	a4,8(sp)
	sw	a0,4(sp)
	lw	a0,12(sp)
	mv	a3,s0
	jalr	a4
	lw	a5,4(sp)
	mv	a4,a0
	beq	a0,zero,.L99
.L94:
	lw	ra,24(sp)
	sw	s0,4(a5)
	lw	s0,20(sp)
	sw	a4,0(a5)
	lw	s1,16(sp)
	mv	a0,a4
	addi	sp,sp,28
	jr	ra
.L99:
	beq	s0,zero,.L94
	mv	a1,s1
	lw	s1,0(sp)
	sw	a0,8(sp)
	li	a2,0
	mv	a0,s1
	call	resizebox
	lla	a1,.LC18
	mv	a0,s1
	call	luaL_error
	lw	a4,8(sp)
	lw	a5,4(sp)
	j	.L94
	.size	resizebox, .-resizebox
	.section	.text.boxgc,"ax",@progbits
	.align	2
	.type	boxgc, @function
boxgc:
	addi	sp,sp,-12
	li	a2,0
	li	a1,1
	sw	ra,8(sp)
	call	resizebox
	lw	ra,8(sp)
	li	a0,0
	addi	sp,sp,12
	jr	ra
	.size	boxgc, .-boxgc
	.section	.rodata.luaL_traceback.str1.4,"aMS",@progbits,1
	.align	2
.LC19:
	.string	"%s\n"
	.align	2
.LC20:
	.string	"stack overflow"
	.align	2
.LC21:
	.string	"stack traceback:"
	.align	2
.LC22:
	.string	"\n\t..."
	.align	2
.LC23:
	.string	"Slnt"
	.align	2
.LC24:
	.string	"\n\t%s:"
	.align	2
.LC25:
	.string	"%d:"
	.align	2
.LC26:
	.string	" in "
	.align	2
.LC27:
	.string	"function '%s'"
	.align	2
.LC28:
	.string	"%s '%s'"
	.align	2
.LC29:
	.string	"main chunk"
	.align	2
.LC30:
	.string	"function <%s:%d>"
	.align	2
.LC31:
	.string	"\n\t(...tail calls...)"
	.section	.text.luaL_traceback,"ax",@progbits
	.align	2
	.globl	luaL_traceback
	.hidden	luaL_traceback
	.type	luaL_traceback, @function
luaL_traceback:
	addi	sp,sp,-136
	sw	s0,128(sp)
	sw	s1,124(sp)
	sw	ra,132(sp)
	mv	s1,a0
	sw	a1,0(sp)
	sw	a2,20(sp)
	sw	a3,8(sp)
	call	lua_gettop
	li	a5,1
	sw	a0,16(sp)
	li	s0,1
	sw	a5,4(sp)
	j	.L103
.L104:
	sw	s0,4(sp)
	slli	s0,s0,1
.L103:
	lw	a0,0(sp)
	mv	a1,s0
	addi	a2,sp,24
	call	lua_getstack
	bne	a0,zero,.L104
.L132:
	lw	a5,4(sp)
	ble	s0,a5,.L105
.L133:
	lw	a5,4(sp)
	lw	a0,0(sp)
	addi	a2,sp,24
	add	a1,s0,a5
	srai	a1,a1,1
	sw	a1,12(sp)
	call	lua_getstack
	lw	a1,12(sp)
	beq	a0,zero,.L122
	addi	a5,a1,1
	sw	a5,4(sp)
	lw	a5,4(sp)
	bgt	s0,a5,.L133
.L105:
	lw	a4,8(sp)
	addi	a5,s0,-1
	sub	a5,a5,a4
	li	a4,21
	sgt	a5,a5,a4
	neg	a5,a5
	andi	a5,a5,11
	addi	a5,a5,-1
	sw	a5,4(sp)
	lw	a5,20(sp)
	beq	a5,zero,.L109
	mv	a2,a5
	lla	a1,.LC19
	mv	a0,s1
	call	lua_pushfstring
.L109:
	li	a1,10
	mv	a0,s1
	call	lua_checkstack
	bne	a0,zero,.L110
	lla	a1,.LC20
	mv	a0,s1
	call	luaL_error
.L110:
	lla	a1,.LC21
	mv	a0,s1
	call	lua_pushstring
.L111:
	lw	a1,8(sp)
	lw	a0,0(sp)
	addi	a2,sp,24
	call	lua_getstack
	beq	a0,zero,.L134
.L121:
	lw	a5,4(sp)
	bne	a5,zero,.L112
	lla	a1,.LC22
	mv	a0,s1
	call	lua_pushstring
	addi	a5,s0,-11
	sw	a5,8(sp)
	lw	a1,8(sp)
	lw	a0,0(sp)
	li	a5,-1
	addi	a2,sp,24
	sw	a5,4(sp)
	call	lua_getstack
	bne	a0,zero,.L121
.L134:
	mv	a0,s1
	call	lua_gettop
	lw	a5,16(sp)
	sub	a1,a0,a5
	mv	a0,s1
	call	lua_concat
	lw	ra,132(sp)
	lw	s0,128(sp)
	lw	s1,124(sp)
	addi	sp,sp,136
	jr	ra
.L122:
	mv	s0,a1
	j	.L132
.L112:
	lw	a0,0(sp)
	lla	a1,.LC23
	addi	a2,sp,24
	call	lua_getinfo
	addi	a2,sp,60
	lla	a1,.LC24
	mv	a0,s1
	call	lua_pushfstring
	lw	a2,44(sp)
	ble	a2,zero,.L114
	lla	a1,.LC25
	mv	a0,s1
	call	lua_pushfstring
.L114:
	lla	a1,.LC26
	mv	a0,s1
	call	lua_pushstring
	addi	a1,sp,24
	mv	a0,s1
	call	pushglobalfuncname
	bne	a0,zero,.L135
	lw	a2,32(sp)
	lbu	a5,0(a2)
	bne	a5,zero,.L136
	lw	a5,36(sp)
	li	a4,109
	lbu	a5,0(a5)
	beq	a5,a4,.L137
	li	a4,67
	beq	a5,a4,.L119
	lw	a3,48(sp)
	addi	a2,sp,60
	lla	a1,.LC30
	mv	a0,s1
	call	lua_pushfstring
.L116:
	lbu	a5,59(sp)
	bne	a5,zero,.L138
.L120:
	mv	a0,s1
	call	lua_gettop
	lw	a5,16(sp)
	sub	a1,a0,a5
	lw	a5,4(sp)
	mv	a0,s1
	addi	a5,a5,-1
	sw	a5,4(sp)
	lw	a5,8(sp)
	addi	a5,a5,1
	sw	a5,8(sp)
	call	lua_concat
	j	.L111
.L135:
	li	a1,-1
	li	a2,0
	mv	a0,s1
	call	lua_tolstring
	mv	a2,a0
	lla	a1,.LC27
	mv	a0,s1
	call	lua_pushfstring
	mv	a0,s1
	li	a2,-1
	li	a1,-2
	call	lua_rotate
	li	a1,-2
	mv	a0,s1
	call	lua_settop
	lbu	a5,59(sp)
	beq	a5,zero,.L120
.L138:
	lla	a1,.LC31
	mv	a0,s1
	call	lua_pushstring
	j	.L120
.L136:
	lw	a3,28(sp)
	lla	a1,.LC28
	mv	a0,s1
	call	lua_pushfstring
	j	.L116
.L119:
	lla	a1,.LC9
	mv	a0,s1
	call	lua_pushstring
	j	.L116
.L137:
	lla	a1,.LC29
	mv	a0,s1
	call	lua_pushstring
	j	.L116
	.size	luaL_traceback, .-luaL_traceback
	.section	.rodata.luaL_fileresult.str1.4,"aMS",@progbits,1
	.align	2
.LC32:
	.string	"AM Panic: "
	.align	2
.LC33:
	.string	"Assertion `0' failed"
	.align	2
.LC34:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/302.lua/src/lauxlib.c:217  \n"
	.section	.text.luaL_fileresult,"ax",@progbits
	.align	2
	.globl	luaL_fileresult
	.hidden	luaL_fileresult
	.type	luaL_fileresult, @function
luaL_fileresult:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LC32
	li	a0,65
.L140:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L140
	lla	s0,.LC33
	li	a0,65
.L141:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L141
	lla	s0,.LC34
	li	a0,32
.L142:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L142
	li	a0,1
	call	halt
	.size	luaL_fileresult, .-luaL_fileresult
	.section	.rodata.luaL_execresult.str1.4,"aMS",@progbits,1
	.align	2
.LC35:
	.string	"exit"
	.section	.text.luaL_execresult,"ax",@progbits
	.align	2
	.globl	luaL_execresult
	.hidden	luaL_execresult
	.type	luaL_execresult, @function
luaL_execresult:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	li	a5,-1
	beq	a1,a5,.L152
	mv	s0,a1
	mv	s1,a0
	beq	a1,zero,.L153
	call	lua_pushnil
.L150:
	lla	a1,.LC35
	mv	a0,s1
	call	lua_pushstring
	mv	a0,s1
	mv	a1,s0
	call	lua_pushinteger
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	li	a0,3
	addi	sp,sp,12
	jr	ra
.L153:
	li	a1,1
	call	lua_pushboolean
	j	.L150
.L152:
	li	a2,0
	li	a1,0
	call	luaL_fileresult
	.size	luaL_execresult, .-luaL_execresult
	.section	.text.luaL_newmetatable,"ax",@progbits
	.align	2
	.globl	luaL_newmetatable
	.hidden	luaL_newmetatable
	.type	luaL_newmetatable, @function
luaL_newmetatable:
	addi	sp,sp,-12
	li	a5,-999424
	sw	s1,0(sp)
	mv	a2,a1
	mv	s1,a1
	addi	a1,a5,-1576
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	lua_getfield
	beq	a0,zero,.L158
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	li	a0,0
	addi	sp,sp,12
	jr	ra
.L158:
	mv	a0,s0
	li	a1,-2
	call	lua_settop
	li	a2,2
	mv	a0,s0
	li	a1,0
	call	lua_createtable
	mv	a1,s1
	mv	a0,s0
	call	lua_pushstring
	lla	a2,.LC16
	mv	a0,s0
	li	a1,-2
	call	lua_setfield
	mv	a0,s0
	li	a1,-1
	call	lua_pushvalue
	li	a5,-999424
	mv	a0,s0
	mv	a2,s1
	addi	a1,a5,-1576
	call	lua_setfield
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
	.size	luaL_newmetatable, .-luaL_newmetatable
	.section	.text.luaL_setmetatable,"ax",@progbits
	.align	2
	.globl	luaL_setmetatable
	.hidden	luaL_setmetatable
	.type	luaL_setmetatable, @function
luaL_setmetatable:
	mv	a2,a1
	li	a1,-999424
	addi	sp,sp,-12
	addi	a1,a1,-1576
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	lua_getfield
	mv	a0,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a1,-2
	addi	sp,sp,12
	tail	lua_setmetatable
	.size	luaL_setmetatable, .-luaL_setmetatable
	.section	.text.luaL_testudata,"ax",@progbits
	.align	2
	.globl	luaL_testudata
	.hidden	luaL_testudata
	.type	luaL_testudata, @function
luaL_testudata:
	addi	sp,sp,-20
	sw	s0,12(sp)
	sw	ra,16(sp)
	sw	s1,8(sp)
	mv	s0,a0
	sw	a1,0(sp)
	sw	a2,4(sp)
	call	lua_touserdata
	lw	a4,0(sp)
	beq	a0,zero,.L164
	mv	s1,a0
	mv	a1,a4
	mv	a0,s0
	call	lua_getmetatable
	bne	a0,zero,.L170
.L164:
	lw	ra,16(sp)
	lw	s0,12(sp)
	li	s1,0
	mv	a0,s1
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L170:
	lw	a2,4(sp)
	li	a1,-999424
	addi	a1,a1,-1576
	mv	a0,s0
	call	lua_getfield
	li	a1,-1
	li	a2,-2
	mv	a0,s0
	call	lua_rawequal
	snez	a4,a0
	neg	a4,a4
	mv	a0,s0
	li	a1,-3
	and	s1,s1,a4
	call	lua_settop
	lw	ra,16(sp)
	lw	s0,12(sp)
	mv	a0,s1
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
	.size	luaL_testudata, .-luaL_testudata
	.section	.text.luaL_checkudata,"ax",@progbits
	.align	2
	.globl	luaL_checkudata
	.hidden	luaL_checkudata
	.type	luaL_checkudata, @function
luaL_checkudata:
	addi	sp,sp,-20
	sw	s0,12(sp)
	sw	s1,8(sp)
	sw	ra,16(sp)
	sw	a0,0(sp)
	mv	s0,a1
	mv	s1,a2
	call	luaL_testudata
	mv	a5,a0
	beq	a0,zero,.L174
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	mv	a0,a5
	addi	sp,sp,20
	jr	ra
.L174:
	sw	a0,4(sp)
	lw	a0,0(sp)
	mv	a2,s1
	mv	a1,s0
	call	typeerror.isra.0
	lw	a5,4(sp)
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	mv	a0,a5
	addi	sp,sp,20
	jr	ra
	.size	luaL_checkudata, .-luaL_checkudata
	.section	.rodata.luaL_checkoption.str1.4,"aMS",@progbits,1
	.align	2
.LC36:
	.string	"invalid option '%s'"
	.section	.text.luaL_checkoption,"ax",@progbits
	.align	2
	.globl	luaL_checkoption
	.hidden	luaL_checkoption
	.type	luaL_checkoption, @function
luaL_checkoption:
	addi	sp,sp,-24
	sw	s1,12(sp)
	sw	ra,20(sp)
	sw	s0,16(sp)
	sw	a0,4(sp)
	sw	a1,8(sp)
	mv	s1,a3
	beq	a2,zero,.L176
	mv	s0,a2
	call	lua_type
	bgt	a0,zero,.L187
.L177:
	lw	a0,0(s1)
	beq	a0,zero,.L178
	addi	a3,s1,4
	li	s1,0
	j	.L180
.L188:
	lw	a3,0(sp)
	addi	s1,s1,1
	lw	a0,-4(a3)
	beq	a0,zero,.L178
.L180:
	addi	a3,a3,4
	mv	a1,s0
	sw	a3,0(sp)
	call	strcmp
	bne	a0,zero,.L188
	lw	ra,20(sp)
	lw	s0,16(sp)
	mv	a0,s1
	lw	s1,12(sp)
	addi	sp,sp,24
	jr	ra
.L178:
	mv	a2,s0
	lw	s0,4(sp)
	lla	a1,.LC36
	mv	a0,s0
	call	lua_pushfstring
	mv	a2,a0
	mv	a0,s0
	lw	s0,16(sp)
	lw	a1,8(sp)
	lw	ra,20(sp)
	lw	s1,12(sp)
	addi	sp,sp,24
	tail	luaL_argerror
.L187:
	lw	a1,8(sp)
	lw	a0,4(sp)
	li	a2,0
	call	lua_tolstring
	mv	s0,a0
	bne	a0,zero,.L177
	lw	a0,4(sp)
	li	a1,4
	j	.L186
.L176:
	call	lua_tolstring
	mv	s0,a0
	bne	a0,zero,.L177
	lw	a0,4(sp)
	li	a1,4
.L186:
	call	lua_typename
	mv	a2,a0
	lw	a1,8(sp)
	lw	a0,4(sp)
	call	typeerror.isra.0
	j	.L177
	.size	luaL_checkoption, .-luaL_checkoption
	.section	.rodata.luaL_checkstack.str1.4,"aMS",@progbits,1
	.align	2
.LC37:
	.string	"stack overflow (%s)"
	.section	.text.luaL_checkstack,"ax",@progbits
	.align	2
	.globl	luaL_checkstack
	.hidden	luaL_checkstack
	.type	luaL_checkstack, @function
luaL_checkstack:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	mv	s0,a0
	mv	s1,a2
	call	lua_checkstack
	bne	a0,zero,.L189
	beq	s1,zero,.L191
	mv	a0,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	mv	a2,s1
	lw	s1,0(sp)
	lla	a1,.LC37
	addi	sp,sp,12
	tail	luaL_error
.L189:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L191:
	mv	a0,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	lla	a1,.LC20
	addi	sp,sp,12
	tail	luaL_error
	.size	luaL_checkstack, .-luaL_checkstack
	.section	.text.luaL_checktype,"ax",@progbits
	.align	2
	.globl	luaL_checktype
	.hidden	luaL_checktype
	.type	luaL_checktype, @function
luaL_checktype:
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	a2,0(sp)
	sw	ra,12(sp)
	mv	s0,a0
	mv	s1,a1
	call	lua_type
	lw	a2,0(sp)
	bne	a0,a2,.L196
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L196:
	mv	a1,a2
	mv	a0,s0
	call	lua_typename
	mv	a2,a0
	mv	a0,s0
	lw	s0,8(sp)
	lw	ra,12(sp)
	mv	a1,s1
	lw	s1,4(sp)
	addi	sp,sp,16
	tail	typeerror.isra.0
	.size	luaL_checktype, .-luaL_checktype
	.section	.rodata.luaL_checkany.str1.4,"aMS",@progbits,1
	.align	2
.LC38:
	.string	"value expected"
	.section	.text.luaL_checkany,"ax",@progbits
	.align	2
	.globl	luaL_checkany
	.hidden	luaL_checkany
	.type	luaL_checkany, @function
luaL_checkany:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	mv	s0,a0
	mv	s1,a1
	call	lua_type
	li	a5,-1
	beq	a0,a5,.L200
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L200:
	mv	a0,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	mv	a1,s1
	lw	s1,0(sp)
	lla	a2,.LC38
	addi	sp,sp,12
	tail	luaL_argerror
	.size	luaL_checkany, .-luaL_checkany
	.section	.text.luaL_checklstring,"ax",@progbits
	.align	2
	.globl	luaL_checklstring
	.hidden	luaL_checklstring
	.type	luaL_checklstring, @function
luaL_checklstring:
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	mv	s0,a0
	mv	s1,a1
	call	lua_tolstring
	mv	a5,a0
	beq	a0,zero,.L204
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	mv	a0,a5
	addi	sp,sp,16
	jr	ra
.L204:
	sw	a0,0(sp)
	li	a1,4
	mv	a0,s0
	call	lua_typename
	mv	a2,a0
	mv	a1,s1
	mv	a0,s0
	call	typeerror.isra.0
	lw	a5,0(sp)
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	mv	a0,a5
	addi	sp,sp,16
	jr	ra
	.size	luaL_checklstring, .-luaL_checklstring
	.section	.text.luaL_optlstring,"ax",@progbits
	.align	2
	.globl	luaL_optlstring
	.hidden	luaL_optlstring
	.type	luaL_optlstring, @function
luaL_optlstring:
	addi	sp,sp,-24
	sw	s0,16(sp)
	sw	s1,12(sp)
	sw	ra,20(sp)
	sw	a0,0(sp)
	sw	a1,4(sp)
	mv	s0,a2
	mv	s1,a3
	call	lua_type
	bgt	a0,zero,.L206
	mv	a4,s0
	beq	s1,zero,.L205
	li	a0,0
	beq	s0,zero,.L208
	mv	a0,s0
	call	strlen
.L208:
	sw	a0,0(s1)
	mv	a4,s0
.L205:
	lw	ra,20(sp)
	lw	s0,16(sp)
	lw	s1,12(sp)
	mv	a0,a4
	addi	sp,sp,24
	jr	ra
.L206:
	lw	a1,4(sp)
	lw	a0,0(sp)
	mv	a2,s1
	call	lua_tolstring
	mv	a4,a0
	bne	a0,zero,.L205
	lw	s0,0(sp)
	sw	a0,8(sp)
	li	a1,4
	mv	a0,s0
	call	lua_typename
	lw	a1,4(sp)
	mv	a2,a0
	mv	a0,s0
	call	typeerror.isra.0
	lw	a4,8(sp)
	j	.L205
	.size	luaL_optlstring, .-luaL_optlstring
	.section	.text.luaL_checknumber,"ax",@progbits
	.align	2
	.globl	luaL_checknumber
	.hidden	luaL_checknumber
	.type	luaL_checknumber, @function
luaL_checknumber:
	addi	sp,sp,-20
	addi	a2,sp,4
	sw	s0,12(sp)
	sw	s1,8(sp)
	sw	ra,16(sp)
	mv	s0,a0
	mv	s1,a1
	call	lua_tonumberx
	lw	a4,4(sp)
	mv	a5,a0
	beq	a4,zero,.L217
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	mv	a0,a5
	addi	sp,sp,20
	jr	ra
.L217:
	sw	a0,0(sp)
	li	a1,3
	mv	a0,s0
	call	lua_typename
	mv	a2,a0
	mv	a1,s1
	mv	a0,s0
	call	typeerror.isra.0
	lw	a5,0(sp)
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	mv	a0,a5
	addi	sp,sp,20
	jr	ra
	.size	luaL_checknumber, .-luaL_checknumber
	.section	.text.luaL_optnumber,"ax",@progbits
	.align	2
	.globl	luaL_optnumber
	.hidden	luaL_optnumber
	.type	luaL_optnumber, @function
luaL_optnumber:
	addi	sp,sp,-20
	sw	s0,12(sp)
	sw	s1,8(sp)
	sw	ra,16(sp)
	mv	s0,a0
	sw	a1,0(sp)
	mv	s1,a2
	call	lua_type
	bgt	a0,zero,.L222
.L219:
	lw	ra,16(sp)
	lw	s0,12(sp)
	mv	a0,s1
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L222:
	lw	a1,0(sp)
	addi	a2,sp,4
	mv	a0,s0
	call	lua_tonumberx
	lw	a4,4(sp)
	mv	s1,a0
	bne	a4,zero,.L219
	li	a1,3
	mv	a0,s0
	call	lua_typename
	lw	a1,0(sp)
	mv	a2,a0
	mv	a0,s0
	call	typeerror.isra.0
	lw	ra,16(sp)
	lw	s0,12(sp)
	mv	a0,s1
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
	.size	luaL_optnumber, .-luaL_optnumber
	.section	.rodata.luaL_checkinteger.str1.4,"aMS",@progbits,1
	.align	2
.LC39:
	.string	"number has no integer representation"
	.section	.text.luaL_checkinteger,"ax",@progbits
	.align	2
	.globl	luaL_checkinteger
	.hidden	luaL_checkinteger
	.type	luaL_checkinteger, @function
luaL_checkinteger:
	addi	sp,sp,-20
	addi	a2,sp,4
	sw	s0,12(sp)
	sw	s1,8(sp)
	sw	ra,16(sp)
	mv	s0,a0
	mv	s1,a1
	call	lua_tointegerx
	lw	a4,4(sp)
	mv	a5,a0
	beq	a4,zero,.L227
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	mv	a0,a5
	addi	sp,sp,20
	jr	ra
.L227:
	sw	a0,0(sp)
	mv	a1,s1
	mv	a0,s0
	call	lua_isnumber
	lw	a5,0(sp)
	beq	a0,zero,.L225
	mv	a1,s1
	mv	a0,s0
	lla	a2,.LC39
	call	luaL_argerror
	lw	a5,0(sp)
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	mv	a0,a5
	addi	sp,sp,20
	jr	ra
.L225:
	li	a1,3
	mv	a0,s0
	sw	a5,0(sp)
	call	lua_typename
	mv	a2,a0
	mv	a1,s1
	mv	a0,s0
	call	typeerror.isra.0
	lw	a5,0(sp)
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	mv	a0,a5
	addi	sp,sp,20
	jr	ra
	.size	luaL_checkinteger, .-luaL_checkinteger
	.section	.text.luaL_optinteger,"ax",@progbits
	.align	2
	.globl	luaL_optinteger
	.hidden	luaL_optinteger
	.type	luaL_optinteger, @function
luaL_optinteger:
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	sw	a0,0(sp)
	mv	s1,a1
	mv	s0,a2
	call	lua_type
	bgt	a0,zero,.L231
	lw	ra,12(sp)
	mv	a0,s0
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L231:
	lw	s0,8(sp)
	lw	a0,0(sp)
	lw	ra,12(sp)
	mv	a1,s1
	lw	s1,4(sp)
	addi	sp,sp,16
	tail	luaL_checkinteger
	.size	luaL_optinteger, .-luaL_optinteger
	.section	.rodata.luaL_prepbuffsize.str1.4,"aMS",@progbits,1
	.align	2
.LC40:
	.string	"buffer too large"
	.align	2
.LC41:
	.string	"LUABOX"
	.align	2
.LC42:
	.string	"__gc"
	.section	.text.luaL_prepbuffsize,"ax",@progbits
	.align	2
	.globl	luaL_prepbuffsize
	.hidden	luaL_prepbuffsize
	.type	luaL_prepbuffsize, @function
luaL_prepbuffsize:
	lw	a5,4(a0)
	lw	a4,8(a0)
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	ra,12(sp)
	sw	s1,4(sp)
	sub	a3,a5,a4
	mv	s0,a0
	bltu	a3,a1,.L233
	lw	s1,0(a0)
	lw	ra,12(sp)
	lw	s0,8(sp)
	add	a0,s1,a4
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L233:
	slli	a5,a5,1
	sub	a3,a5,a4
	lw	s1,12(a0)
	bgeu	a3,a1,.L247
	add	a5,a4,a1
.L247:
	bgtu	a4,a5,.L248
	lw	a3,0(s0)
	addi	a4,s0,16
	beq	a3,a4,.L237
.L249:
	mv	a2,a5
	mv	a0,s1
	li	a1,-1
	sw	a5,0(sp)
	call	resizebox
	lw	a5,0(sp)
	mv	s1,a0
.L238:
	lw	a4,8(s0)
	sw	s1,0(s0)
	lw	ra,12(sp)
	sw	a5,4(s0)
	lw	s0,8(sp)
	add	a0,s1,a4
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L248:
	lla	a1,.LC40
	mv	a0,s1
	sw	a5,0(sp)
	call	luaL_error
	lw	a3,0(s0)
	addi	a4,s0,16
	lw	a5,0(sp)
	bne	a3,a4,.L249
.L237:
	li	a1,8
	mv	a0,s1
	sw	a5,0(sp)
	call	lua_newuserdata
	sw	zero,0(a0)
	sw	zero,4(a0)
	lla	a1,.LC41
	mv	a0,s1
	call	luaL_newmetatable
	lw	a5,0(sp)
	bne	a0,zero,.L250
.L239:
	li	a1,-2
	mv	a0,s1
	sw	a5,0(sp)
	call	lua_setmetatable
	lw	a5,0(sp)
	li	a1,-1
	mv	a0,s1
	mv	a2,a5
	call	resizebox
	lw	a2,8(s0)
	lw	a1,0(s0)
	mv	s1,a0
	call	memcpy
	lw	a5,0(sp)
	j	.L238
.L250:
	li	a2,0
	lla	a1,boxgc
	mv	a0,s1
	call	lua_pushcclosure
	lla	a2,.LC42
	li	a1,-2
	mv	a0,s1
	call	lua_setfield
	lw	a5,0(sp)
	j	.L239
	.size	luaL_prepbuffsize, .-luaL_prepbuffsize
	.section	.text.luaL_addlstring,"ax",@progbits
	.align	2
	.globl	luaL_addlstring
	.hidden	luaL_addlstring
	.type	luaL_addlstring, @function
luaL_addlstring:
	bne	a2,zero,.L260
	ret
.L260:
	addi	sp,sp,-16
	sw	a1,0(sp)
	mv	a1,a2
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	mv	s0,a2
	mv	s1,a0
	call	luaL_prepbuffsize
	lw	a5,0(sp)
	mv	a2,s0
	mv	a1,a5
	call	memcpy
	lw	a5,8(s1)
	lw	ra,12(sp)
	add	a5,a5,s0
	lw	s0,8(sp)
	sw	a5,8(s1)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
	.size	luaL_addlstring, .-luaL_addlstring
	.section	.text.luaL_addstring,"ax",@progbits
	.align	2
	.globl	luaL_addstring
	.hidden	luaL_addstring
	.type	luaL_addstring, @function
luaL_addstring:
	addi	sp,sp,-16
	sw	s1,4(sp)
	mv	s1,a0
	mv	a0,a1
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	a1,0(sp)
	call	strlen
	bne	a0,zero,.L267
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L267:
	mv	s0,a0
	mv	a1,a0
	mv	a0,s1
	call	luaL_prepbuffsize
	lw	a5,0(sp)
	mv	a2,s0
	mv	a1,a5
	call	memcpy
	lw	a5,8(s1)
	lw	ra,12(sp)
	add	a5,a5,s0
	lw	s0,8(sp)
	sw	a5,8(s1)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
	.size	luaL_addstring, .-luaL_addstring
	.section	.text.luaL_pushresult,"ax",@progbits
	.align	2
	.globl	luaL_pushresult
	.hidden	luaL_pushresult
	.type	luaL_pushresult, @function
luaL_pushresult:
	addi	sp,sp,-12
	sw	s1,0(sp)
	lw	s1,12(a0)
	lw	a2,8(a0)
	lw	a1,0(a0)
	sw	s0,4(sp)
	mv	s0,a0
	mv	a0,s1
	sw	ra,8(sp)
	call	lua_pushlstring
	lw	a5,0(s0)
	addi	s0,s0,16
	beq	a5,s0,.L268
	li	a2,0
	li	a1,-2
	mv	a0,s1
	call	resizebox
	mv	a0,s1
	li	a1,-2
	li	a2,-1
	call	lua_rotate
	lw	s0,4(sp)
	lw	ra,8(sp)
	mv	a0,s1
	lw	s1,0(sp)
	li	a1,-2
	addi	sp,sp,12
	tail	lua_settop
.L268:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
	.size	luaL_pushresult, .-luaL_pushresult
	.section	.text.luaL_pushresultsize,"ax",@progbits
	.align	2
	.globl	luaL_pushresultsize
	.hidden	luaL_pushresultsize
	.type	luaL_pushresultsize, @function
luaL_pushresultsize:
	lw	a4,8(a0)
	add	a4,a4,a1
	sw	a4,8(a0)
	tail	luaL_pushresult
	.size	luaL_pushresultsize, .-luaL_pushresultsize
	.section	.text.luaL_addvalue,"ax",@progbits
	.align	2
	.globl	luaL_addvalue
	.hidden	luaL_addvalue
	.type	luaL_addvalue, @function
luaL_addvalue:
	addi	sp,sp,-28
	sw	s1,16(sp)
	lw	s1,12(a0)
	sw	s0,20(sp)
	addi	a2,sp,12
	mv	s0,a0
	li	a1,-1
	mv	a0,s1
	sw	ra,24(sp)
	call	lua_tolstring
	lw	a5,0(s0)
	addi	a4,s0,16
	sw	a0,0(sp)
	beq	a5,a4,.L273
	li	a2,1
	li	a1,-2
	mv	a0,s1
	sw	a4,4(sp)
	call	lua_rotate
	lw	a2,12(sp)
	lw	a4,4(sp)
	bne	a2,zero,.L276
.L274:
	lw	a5,0(s0)
	li	a1,-2
	beq	a4,a5,.L277
.L275:
	mv	a0,s1
	li	a2,-1
	call	lua_rotate
	mv	a0,s1
	li	a1,-2
	call	lua_settop
	lw	ra,24(sp)
	lw	s0,20(sp)
	lw	s1,16(sp)
	addi	sp,sp,28
	jr	ra
.L273:
	lw	a2,12(sp)
	beq	a2,zero,.L277
.L276:
	mv	a1,a2
	mv	a0,s0
	sw	a4,8(sp)
	sw	a2,4(sp)
	call	luaL_prepbuffsize
	lw	a2,4(sp)
	lw	a1,0(sp)
	call	memcpy
	lw	a5,8(s0)
	lw	a2,4(sp)
	lw	a4,8(sp)
	add	a5,a5,a2
	sw	a5,8(s0)
	j	.L274
.L277:
	li	a1,-1
	j	.L275
	.size	luaL_addvalue, .-luaL_addvalue
	.section	.text.luaL_buffinit,"ax",@progbits
	.align	2
	.globl	luaL_buffinit
	.hidden	luaL_buffinit
	.type	luaL_buffinit, @function
luaL_buffinit:
	addi	a5,a1,16
	sw	a5,0(a1)
	li	a5,4096
	addi	a5,a5,-2048
	sw	a0,12(a1)
	sw	zero,8(a1)
	sw	a5,4(a1)
	ret
	.size	luaL_buffinit, .-luaL_buffinit
	.section	.text.luaL_buffinitsize,"ax",@progbits
	.align	2
	.globl	luaL_buffinitsize
	.hidden	luaL_buffinitsize
	.type	luaL_buffinitsize, @function
luaL_buffinitsize:
	addi	a4,a1,16
	sw	a4,0(a1)
	li	a4,4096
	mv	a5,a1
	addi	a4,a4,-2048
	sw	a0,12(a1)
	sw	zero,8(a1)
	sw	a4,4(a1)
	mv	a0,a5
	mv	a1,a2
	tail	luaL_prepbuffsize
	.size	luaL_buffinitsize, .-luaL_buffinitsize
	.section	.text.luaL_ref,"ax",@progbits
	.align	2
	.globl	luaL_ref
	.hidden	luaL_ref
	.type	luaL_ref, @function
luaL_ref:
	addi	sp,sp,-16
	sw	s1,4(sp)
	mv	s1,a1
	li	a1,-1
	sw	s0,8(sp)
	sw	ra,12(sp)
	mv	s0,a0
	call	lua_type
	beq	a0,zero,.L292
	mv	a1,s1
	mv	a0,s0
	call	lua_absindex
	mv	a1,a0
	li	a2,0
	sw	a0,0(sp)
	mv	a0,s0
	call	lua_rawgeti
	li	a1,-1
	li	a2,0
	mv	a0,s0
	call	lua_tointegerx
	mv	s1,a0
	li	a1,-2
	mv	a0,s0
	call	lua_settop
	lw	a5,0(sp)
	bne	s1,zero,.L293
	mv	a1,a5
	mv	a0,s0
	sw	a5,0(sp)
	call	lua_rawlen
	lw	a5,0(sp)
	addi	s1,a0,1
.L290:
	mv	a2,s1
	mv	a1,a5
	mv	a0,s0
	call	lua_rawseti
.L286:
	lw	ra,12(sp)
	lw	s0,8(sp)
	mv	a0,s1
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L293:
	mv	a1,a5
	mv	a2,s1
	mv	a0,s0
	call	lua_rawgeti
	lw	a5,0(sp)
	li	a2,0
	mv	a0,s0
	mv	a1,a5
	call	lua_rawseti
	lw	a5,0(sp)
	j	.L290
.L292:
	li	a1,-2
	mv	a0,s0
	call	lua_settop
	li	s1,-1
	j	.L286
	.size	luaL_ref, .-luaL_ref
	.section	.text.luaL_unref,"ax",@progbits
	.align	2
	.globl	luaL_unref
	.hidden	luaL_unref
	.type	luaL_unref, @function
luaL_unref:
	bge	a2,zero,.L299
	ret
.L299:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	mv	s0,a2
	mv	s1,a0
	call	lua_absindex
	mv	a1,a0
	sw	a0,0(sp)
	li	a2,0
	mv	a0,s1
	call	lua_rawgeti
	lw	a5,0(sp)
	mv	a2,s0
	mv	a0,s1
	mv	a1,a5
	call	lua_rawseti
	mv	a1,s0
	mv	a0,s1
	call	lua_pushinteger
	lw	a5,0(sp)
	lw	s0,8(sp)
	lw	ra,12(sp)
	mv	a0,s1
	lw	s1,4(sp)
	li	a2,0
	mv	a1,a5
	addi	sp,sp,16
	tail	lua_rawseti
	.size	luaL_unref, .-luaL_unref
	.section	.rodata.luaL_loadfilex.str1.4,"aMS",@progbits,1
	.align	2
.LC43:
	.string	"=stdin"
	.align	2
.LC44:
	.string	"@%s"
	.align	2
.LC45:
	.string	"r"
	.align	2
.LC46:
	.string	"open"
	.align	2
.LC47:
	.string	"cannot %s %s: %s"
	.align	2
.LC48:
	.string	"rb"
	.align	2
.LC49:
	.string	"reopen"
	.align	2
.LC50:
	.string	"read"
	.section	.text.luaL_loadfilex,"ax",@progbits
	.align	2
	.globl	luaL_loadfilex
	.hidden	luaL_loadfilex
	.type	luaL_loadfilex, @function
luaL_loadfilex:
	addi	sp,sp,-40
	li	t0,-8192
	sw	s0,32(sp)
	sw	s1,28(sp)
	sw	ra,36(sp)
	add	sp,sp,t0
	mv	s0,a0
	mv	s1,a1
	sw	a2,8(sp)
	call	lua_gettop
	addi	a5,a0,1
	sw	a5,4(sp)
	beq	s1,zero,.L323
	mv	a2,s1
	lla	a1,.LC44
	mv	a0,s0
	call	lua_pushfstring
	lla	a1,.LC45
	mv	a0,s1
	call	fopen64
	li	a4,8192
	li	a5,-8192
	addi	a4,a4,12
	add	a4,a4,a5
	addi	a5,sp,16
	add	a5,a4,a5
	sw	a5,0(sp)
	sw	a0,-4(a5)
	beq	a0,zero,.L324
.L302:
	li	a5,-8192
	addi	a1,a5,-12
	addi	a0,a5,-8
	li	a5,8192
	addi	a4,a5,12
	add	a4,a4,a1
	addi	a3,sp,16
	add	a1,a4,a3
	addi	a4,a5,12
	add	a4,a4,a0
	add	a0,a4,a3
	call	skipcomment
	bne	a0,zero,.L325
	lw	a5,16(sp)
	li	a3,27
	beq	a5,a3,.L326
.L305:
	li	a4,-1
	beq	a5,a4,.L309
.L321:
	andi	a5,a5,0xff
.L306:
	li	a3,8192
	li	a4,-8192
	addi	a3,a3,12
	add	a3,a3,a4
	addi	a4,sp,16
	add	a4,a3,a4
	sw	a4,0(sp)
	lw	a2,0(sp)
	lw	a4,-8(a4)
	addi	a3,a4,1
	add	a4,a2,a4
	sw	a3,-8(a2)
	sb	a5,0(a4)
.L309:
	li	a2,0
	li	a1,-1
	mv	a0,s0
	call	lua_tolstring
	li	a5,-8192
	li	a1,8192
	addi	a2,a5,-8
	lw	a4,8(sp)
	addi	a1,a1,12
	addi	a5,sp,16
	add	a1,a1,a2
	add	a2,a1,a5
	mv	a3,a0
	lla	a1,getF
	mv	a0,s0
	call	lua_load
	li	a1,8192
	addi	a3,a1,12
	li	a4,-8192
	add	a3,a3,a4
	addi	a4,sp,16
	add	a4,a3,a4
	mv	a5,a0
	lw	a0,-4(a4)
	sw	a5,0(sp)
	call	ferror
	mv	a5,a0
	beq	s1,zero,.L310
.L312:
	sw	a5,12(sp)
	li	a5,8192
	li	a4,-8192
	addi	a5,a5,12
	add	a5,a5,a4
	addi	a4,sp,16
	add	a5,a5,a4
	lw	a0,-4(a5)
	sw	a5,8(sp)
	call	fclose
	lw	a5,12(sp)
.L310:
	bne	a5,zero,.L327
	lw	a1,4(sp)
	mv	a0,s0
	li	a2,-1
	call	lua_rotate
	mv	a0,s0
	li	a1,-2
	call	lua_settop
	li	t0,8192
	lw	a0,0(sp)
	add	sp,sp,t0
	lw	ra,36(sp)
	lw	s0,32(sp)
	lw	s1,28(sp)
	addi	sp,sp,40
	jr	ra
.L325:
	li	a5,8192
	addi	a4,a5,12
	li	a5,-8192
	add	a4,a4,a5
	addi	a5,sp,16
	add	a5,a4,a5
	sw	a5,0(sp)
	lw	a5,-8(a5)
	lw	a3,0(sp)
	addi	a4,a5,1
	sw	a4,-8(a3)
	add	a5,a3,a5
	li	a4,10
	sb	a4,0(a5)
	lw	a5,16(sp)
	li	a3,27
	bne	a5,a3,.L305
.L326:
	beq	s1,zero,.L313
	lw	a2,24(sp)
	lla	a1,.LC48
	mv	a0,s1
	call	freopen64
	sw	a0,24(sp)
	li	a4,-8192
	beq	a0,zero,.L328
	li	a3,8192
	addi	t1,a4,-8
	addi	a5,a3,12
	addi	a2,sp,16
	add	a5,a5,t1
	add	t1,a5,a2
	addi	a1,a4,-12
	addi	a5,a3,12
	add	a5,a5,a1
	add	a1,a5,a2
	mv	a0,t1
	sw	t1,0(sp)
	call	skipcomment
	lw	a5,16(sp)
	li	a4,-1
	lw	t1,0(sp)
	bne	a5,a4,.L321
	li	a1,-1
	li	a2,0
	mv	a0,s0
	sw	t1,0(sp)
	call	lua_tolstring
	lw	t1,0(sp)
	lw	a4,8(sp)
	mv	a3,a0
	mv	a2,t1
	lla	a1,getF
	mv	a0,s0
	call	lua_load
	mv	a5,a0
	lw	a0,24(sp)
	sw	a5,0(sp)
	call	ferror
	mv	a5,a0
	j	.L312
.L327:
	lw	s1,4(sp)
	mv	a0,s0
	mv	a1,s1
	call	lua_settop
	li	a2,0
	mv	a1,s1
	mv	a0,s0
	call	lua_tolstring
	lla	a4,.LC8
	addi	a3,a0,1
	lla	a2,.LC50
.L322:
	lla	a1,.LC47
	mv	a0,s0
	call	lua_pushfstring
	mv	a1,s1
	mv	a0,s0
	li	a2,-1
	call	lua_rotate
	mv	a0,s0
	li	a1,-2
	call	lua_settop
	li	a5,7
	sw	a5,0(sp)
	li	t0,8192
	lw	a0,0(sp)
	add	sp,sp,t0
	lw	ra,36(sp)
	lw	s0,32(sp)
	lw	s1,28(sp)
	addi	sp,sp,40
	jr	ra
.L323:
	lla	a1,.LC43
	mv	a0,s0
	call	lua_pushstring
	li	a4,8192
	li	a5,-8192
	addi	a4,a4,12
	add	a4,a4,a5
	addi	a5,sp,16
	add	a5,a4,a5
	sw	a5,0(sp)
	lw	a4,0(sp)
	la a5, stdin; lw a5, 0(a5);
	sw	a5,-4(a4)
	j	.L302
.L313:
	li	a5,27
	j	.L306
.L328:
	lw	s1,4(sp)
	li	a2,0
	mv	a0,s0
	mv	a1,s1
	call	lua_tolstring
	lla	a4,.LC8
	addi	a3,a0,1
	lla	a2,.LC49
	j	.L322
.L324:
	lw	s1,4(sp)
	li	a2,0
	mv	a0,s0
	mv	a1,s1
	call	lua_tolstring
	lla	a4,.LC8
	addi	a3,a0,1
	lla	a2,.LC46
	j	.L322
	.size	luaL_loadfilex, .-luaL_loadfilex
	.section	.text.luaL_loadbufferx,"ax",@progbits
	.align	2
	.globl	luaL_loadbufferx
	.hidden	luaL_loadbufferx
	.type	luaL_loadbufferx, @function
luaL_loadbufferx:
	addi	sp,sp,-20
	mv	t1,a1
	mv	a5,a2
	lla	a1,getS
	mv	a2,sp
	sw	ra,16(sp)
	sw	t1,0(sp)
	sw	a5,4(sp)
	call	lua_load
	lw	ra,16(sp)
	addi	sp,sp,20
	jr	ra
	.size	luaL_loadbufferx, .-luaL_loadbufferx
	.section	.text.luaL_loadstring,"ax",@progbits
	.align	2
	.globl	luaL_loadstring
	.hidden	luaL_loadstring
	.type	luaL_loadstring, @function
luaL_loadstring:
	addi	sp,sp,-20
	sw	s1,8(sp)
	mv	s1,a0
	mv	a0,a1
	sw	ra,16(sp)
	sw	s0,12(sp)
	mv	s0,a1
	call	strlen
	mv	a5,a0
	mv	a3,s0
	mv	a2,sp
	mv	a0,s1
	li	a4,0
	lla	a1,getS
	sw	s0,0(sp)
	sw	a5,4(sp)
	call	lua_load
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
	.size	luaL_loadstring, .-luaL_loadstring
	.section	.text.luaL_getmetafield,"ax",@progbits
	.align	2
	.globl	luaL_getmetafield
	.hidden	luaL_getmetafield
	.type	luaL_getmetafield, @function
luaL_getmetafield:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	mv	s0,a0
	mv	s1,a2
	call	lua_getmetatable
	bne	a0,zero,.L336
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L336:
	mv	a0,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	mv	a1,s1
	lw	s1,0(sp)
	addi	sp,sp,12
	tail	luaL_getmetafield.part.0
	.size	luaL_getmetafield, .-luaL_getmetafield
	.section	.text.luaL_callmeta,"ax",@progbits
	.align	2
	.globl	luaL_callmeta
	.hidden	luaL_callmeta
	.type	luaL_callmeta, @function
luaL_callmeta:
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	mv	s0,a0
	sw	a2,0(sp)
	call	lua_absindex
	mv	s1,a0
	mv	a1,a0
	mv	a0,s0
	call	lua_getmetatable
	bne	a0,zero,.L338
.L340:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	li	a0,0
	addi	sp,sp,16
	jr	ra
.L338:
	lw	a1,0(sp)
	mv	a0,s0
	call	luaL_getmetafield.part.0
	beq	a0,zero,.L340
	mv	a1,s1
	mv	a0,s0
	call	lua_pushvalue
	mv	a0,s0
	li	a4,0
	li	a3,0
	li	a2,1
	li	a1,1
	call	lua_callk
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	li	a0,1
	addi	sp,sp,16
	jr	ra
	.size	luaL_callmeta, .-luaL_callmeta
	.section	.rodata.luaL_len.str1.4,"aMS",@progbits,1
	.align	2
.LC51:
	.string	"object length is not an integer"
	.section	.text.luaL_len,"ax",@progbits
	.align	2
	.globl	luaL_len
	.hidden	luaL_len
	.type	luaL_len, @function
luaL_len:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	mv	s0,a0
	call	lua_len
	mv	a2,sp
	li	a1,-1
	mv	a0,s0
	call	lua_tointegerx
	lw	a5,0(sp)
	mv	s1,a0
	beq	a5,zero,.L348
.L346:
	mv	a0,s0
	li	a1,-2
	call	lua_settop
	lw	ra,12(sp)
	lw	s0,8(sp)
	mv	a0,s1
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L348:
	lla	a1,.LC51
	mv	a0,s0
	call	luaL_error
	j	.L346
	.size	luaL_len, .-luaL_len
	.section	.rodata.luaL_tolstring.str1.4,"aMS",@progbits,1
	.align	2
.LC52:
	.string	"true"
	.align	2
.LC53:
	.string	"false"
	.align	2
.LC54:
	.string	"__tostring"
	.align	2
.LC55:
	.string	"'__tostring' must return a string"
	.align	2
.LC56:
	.string	"%I"
	.align	2
.LC57:
	.string	"%f"
	.align	2
.LC58:
	.string	"nil"
	.align	2
.LC59:
	.string	"%s: %p"
	.section	.text.luaL_tolstring,"ax",@progbits
	.align	2
	.globl	luaL_tolstring
	.hidden	luaL_tolstring
	.type	luaL_tolstring, @function
luaL_tolstring:
	addi	sp,sp,-20
	mv	a5,a2
	lla	a2,.LC54
	sw	s0,12(sp)
	sw	s1,8(sp)
	sw	ra,16(sp)
	mv	s0,a0
	mv	s1,a1
	sw	a5,0(sp)
	call	luaL_callmeta
	beq	a0,zero,.L350
	li	a1,-1
	mv	a0,s0
	call	lua_isstring
	beq	a0,zero,.L371
.L352:
	mv	a0,s0
	lw	s0,12(sp)
	lw	a2,0(sp)
	lw	ra,16(sp)
	lw	s1,8(sp)
	li	a1,-1
	addi	sp,sp,20
	tail	lua_tolstring
.L350:
	mv	a1,s1
	mv	a0,s0
	call	lua_type
	li	a5,3
	beq	a0,a5,.L353
	bgt	a0,a5,.L354
	beq	a0,zero,.L355
	li	a5,1
	bne	a0,a5,.L357
	mv	a1,s1
	mv	a0,s0
	call	lua_toboolean
	lla	a1,.LC52
	beq	a0,zero,.L372
.L370:
	mv	a0,s0
	call	lua_pushstring
	j	.L352
.L354:
	li	a5,4
	bne	a0,a5,.L357
	mv	a1,s1
	mv	a0,s0
	call	lua_pushvalue
	j	.L352
.L371:
	lla	a1,.LC55
	mv	a0,s0
	call	luaL_error
	j	.L352
.L372:
	lla	a1,.LC53
	j	.L370
.L357:
	mv	a1,s1
	mv	a0,s0
	call	lua_getmetatable
	bne	a0,zero,.L373
	mv	a1,s1
	mv	a0,s0
	call	lua_type
	mv	a1,a0
	mv	a0,s0
	call	lua_typename
	mv	a1,s1
	mv	s1,a0
	mv	a0,s0
	call	lua_topointer
	mv	a3,a0
	mv	a2,s1
	lla	a1,.LC59
	mv	a0,s0
	call	lua_pushfstring
	j	.L352
.L355:
	lla	a1,.LC58
	mv	a0,s0
	call	lua_pushstring
	j	.L352
.L353:
	mv	a1,s1
	mv	a0,s0
	call	lua_isinteger
	mv	a1,s1
	beq	a0,zero,.L359
	mv	a0,s0
	li	a2,0
	call	lua_tointegerx
	mv	a2,a0
	lla	a1,.LC56
	mv	a0,s0
	call	lua_pushfstring
	j	.L352
.L359:
	mv	a0,s0
	li	a2,0
	call	lua_tonumberx
	mv	a2,a0
	lla	a1,.LC57
	mv	a0,s0
	call	lua_pushfstring
	j	.L352
.L373:
	lla	a1,.LC16
	mv	a0,s0
	call	luaL_getmetafield.part.0
	li	a4,4
	bne	a0,a4,.L362
	li	a2,0
	li	a1,-1
	mv	a0,s0
	call	lua_tolstring
	mv	a1,s1
	mv	s1,a0
	mv	a0,s0
	call	lua_topointer
	mv	a3,a0
	mv	a2,s1
	lla	a1,.LC59
	mv	a0,s0
	call	lua_pushfstring
.L363:
	mv	a0,s0
	li	a1,-2
	li	a2,-1
	call	lua_rotate
	li	a1,-2
	mv	a0,s0
	call	lua_settop
	j	.L352
.L362:
	mv	a1,s1
	sw	a0,4(sp)
	mv	a0,s0
	call	lua_type
	mv	a1,a0
	mv	a0,s0
	call	lua_typename
	mv	a1,s1
	mv	s1,a0
	mv	a0,s0
	call	lua_topointer
	mv	a3,a0
	mv	a2,s1
	lla	a1,.LC59
	mv	a0,s0
	call	lua_pushfstring
	lw	a5,4(sp)
	beq	a5,zero,.L352
	j	.L363
	.size	luaL_tolstring, .-luaL_tolstring
	.section	.rodata.luaL_setfuncs.str1.4,"aMS",@progbits,1
	.align	2
.LC60:
	.string	"too many upvalues"
	.section	.text.luaL_setfuncs,"ax",@progbits
	.align	2
	.globl	luaL_setfuncs
	.hidden	luaL_setfuncs
	.type	luaL_setfuncs, @function
luaL_setfuncs:
	addi	sp,sp,-28
	mv	a5,a1
	mv	a1,a2
	sw	s0,20(sp)
	sw	ra,24(sp)
	sw	s1,16(sp)
	sw	a2,0(sp)
	mv	s0,a0
	sw	a5,8(sp)
	call	lua_checkstack
	bne	a0,zero,.L375
	lla	a2,.LC60
	lla	a1,.LC37
	mv	a0,s0
	call	luaL_error
.L375:
	lw	a5,8(sp)
	lw	a5,0(a5)
	beq	a5,zero,.L376
	lw	a4,0(sp)
	li	a5,-2
	sub	a5,a5,a4
	sw	a5,12(sp)
	neg	a5,a4
	sw	a5,4(sp)
.L377:
	lw	a5,0(sp)
	li	s1,0
	ble	a5,zero,.L380
.L378:
	lw	a1,4(sp)
	mv	a0,s0
	addi	s1,s1,1
	call	lua_pushvalue
	lw	a5,0(sp)
	bne	a5,s1,.L378
.L380:
	lw	s1,8(sp)
	lw	a2,0(sp)
	mv	a0,s0
	lw	a1,4(s1)
	call	lua_pushcclosure
	lw	a2,0(s1)
	lw	a1,12(sp)
	addi	a5,s1,8
	mv	a0,s0
	mv	s1,a5
	sw	a5,8(sp)
	call	lua_setfield
	lw	a5,0(s1)
	bne	a5,zero,.L377
.L376:
	lw	a5,0(sp)
	mv	a0,s0
	lw	s0,20(sp)
	lw	ra,24(sp)
	lw	s1,16(sp)
	not	a1,a5
	addi	sp,sp,28
	tail	lua_settop
	.size	luaL_setfuncs, .-luaL_setfuncs
	.section	.text.luaL_getsubtable,"ax",@progbits
	.align	2
	.globl	luaL_getsubtable
	.hidden	luaL_getsubtable
	.type	luaL_getsubtable, @function
luaL_getsubtable:
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	mv	s0,a0
	mv	s1,a1
	sw	a2,0(sp)
	call	lua_getfield
	li	a5,5
	bne	a0,a5,.L394
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	li	a0,1
	addi	sp,sp,16
	jr	ra
.L394:
	mv	a0,s0
	li	a1,-2
	call	lua_settop
	mv	a1,s1
	mv	a0,s0
	call	lua_absindex
	mv	s1,a0
	li	a2,0
	mv	a0,s0
	li	a1,0
	call	lua_createtable
	mv	a0,s0
	li	a1,-1
	call	lua_pushvalue
	lw	a2,0(sp)
	mv	a0,s0
	mv	a1,s1
	call	lua_setfield
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	li	a0,0
	addi	sp,sp,16
	jr	ra
	.size	luaL_getsubtable, .-luaL_getsubtable
	.section	.text.luaL_requiref,"ax",@progbits
	.align	2
	.globl	luaL_requiref
	.hidden	luaL_requiref
	.type	luaL_requiref, @function
luaL_requiref:
	addi	sp,sp,-20
	sw	s1,8(sp)
	mv	s1,a1
	li	a1,-999424
	mv	a5,a2
	addi	a1,a1,-1576
	lla	a2,.LC2
	sw	ra,16(sp)
	sw	s0,12(sp)
	sw	a5,4(sp)
	mv	s0,a0
	sw	a3,0(sp)
	call	luaL_getsubtable
	li	a1,-1
	mv	a2,s1
	mv	a0,s0
	call	lua_getfield
	li	a1,-1
	mv	a0,s0
	call	lua_toboolean
	beq	a0,zero,.L399
.L396:
	li	a1,-2
	mv	a0,s0
	li	a2,-1
	call	lua_rotate
	li	a1,-2
	mv	a0,s0
	call	lua_settop
	lw	a5,0(sp)
	bne	a5,zero,.L400
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L399:
	mv	a0,s0
	li	a1,-2
	call	lua_settop
	lw	a1,4(sp)
	li	a2,0
	mv	a0,s0
	call	lua_pushcclosure
	mv	a1,s1
	mv	a0,s0
	call	lua_pushstring
	li	a4,0
	li	a3,0
	li	a2,1
	mv	a0,s0
	li	a1,1
	call	lua_callk
	mv	a0,s0
	li	a1,-1
	call	lua_pushvalue
	mv	a2,s1
	li	a1,-3
	mv	a0,s0
	call	lua_setfield
	j	.L396
.L400:
	mv	a0,s0
	li	a1,-1
	call	lua_pushvalue
	mv	a0,s0
	lw	s0,12(sp)
	lw	ra,16(sp)
	mv	a1,s1
	lw	s1,8(sp)
	addi	sp,sp,20
	tail	lua_setglobal
	.size	luaL_requiref, .-luaL_requiref
	.section	.text.luaL_gsub,"ax",@progbits
	.align	2
	.globl	luaL_gsub
	.hidden	luaL_gsub
	.type	luaL_gsub, @function
luaL_gsub:
	addi	sp,sp,-2044
	mv	a5,a0
	sw	s0,2036(sp)
	sw	s1,2032(sp)
	sw	ra,2040(sp)
	mv	a0,a2
	addi	sp,sp,-52
	mv	s0,a5
	sw	a5,16(sp)
	sw	a2,4(sp)
	mv	s1,a1
	sw	a3,0(sp)
	call	strlen
	li	a4,4096
	li	a5,-4096
	addi	a4,a4,-2032
	add	a4,a4,a5
	addi	a5,sp,20
	add	a4,a4,a5
	addi	a5,sp,36
	sw	a5,2032(a4)
	li	a5,4096
	addi	a5,a5,-2048
	sw	a4,12(sp)
	sw	a0,8(sp)
	sw	s0,2044(a4)
	sw	zero,2040(a4)
	sw	a5,2036(a4)
	j	.L402
.L403:
	lw	a0,0(sp)
	call	strlen
	mv	s1,a0
	bne	a0,zero,.L417
.L404:
	lw	a5,8(sp)
	add	s1,s0,a5
.L402:
	lw	a1,4(sp)
	mv	a0,s1
	call	strstr
	mv	s0,a0
	beq	a0,zero,.L418
	sub	a2,s0,s1
	beq	s0,s1,.L403
	li	a5,-4096
	addi	a0,a5,2032
	li	a5,4096
	addi	a5,a5,-2032
	add	a5,a5,a0
	addi	a4,sp,20
	add	a0,a5,a4
	mv	a1,a2
	sw	a2,12(sp)
	call	luaL_prepbuffsize
	lw	a2,12(sp)
	mv	a1,s1
	call	memcpy
	lw	a4,28(sp)
	lw	a2,12(sp)
	lw	a0,0(sp)
	add	a4,a4,a2
	sw	a4,28(sp)
	call	strlen
	mv	s1,a0
	beq	a0,zero,.L404
.L417:
	li	a5,-4096
	addi	a0,a5,2032
	li	a5,4096
	addi	a5,a5,-2032
	addi	a4,sp,20
	add	a5,a5,a0
	add	a0,a5,a4
	mv	a1,s1
	call	luaL_prepbuffsize
	lw	a1,0(sp)
	mv	a2,s1
	call	memcpy
	lw	a4,28(sp)
	add	a4,a4,s1
	sw	a4,28(sp)
	j	.L404
.L418:
	mv	a0,s1
	call	strlen
	mv	s0,a0
	bne	a0,zero,.L419
.L406:
	li	a0,-4096
	li	a5,4096
	addi	a0,a0,2032
	addi	a5,a5,-2032
	addi	a4,sp,20
	add	a5,a5,a0
	add	a0,a5,a4
	call	luaL_pushresult
	lw	a0,16(sp)
	li	a2,0
	li	a1,-1
	call	lua_tolstring
	addi	sp,sp,52
	lw	ra,2040(sp)
	lw	s0,2036(sp)
	lw	s1,2032(sp)
	addi	sp,sp,2044
	jr	ra
.L419:
	li	a5,-4096
	addi	a0,a5,2032
	li	a5,4096
	addi	a5,a5,-2032
	add	a5,a5,a0
	addi	a4,sp,20
	add	a0,a5,a4
	mv	a1,s0
	call	luaL_prepbuffsize
	mv	a2,s0
	mv	a1,s1
	call	memcpy
	li	a5,4096
	addi	a4,a5,-2032
	li	a5,-4096
	add	a4,a4,a5
	addi	a5,sp,20
	add	a5,a4,a5
	sw	a5,0(sp)
	lw	a5,2040(a5)
	lw	a4,0(sp)
	add	a5,a5,s0
	sw	a5,2040(a4)
	j	.L406
	.size	luaL_gsub, .-luaL_gsub
	.section	.text.luaL_newstate,"ax",@progbits
	.align	2
	.globl	luaL_newstate
	.hidden	luaL_newstate
	.type	luaL_newstate, @function
luaL_newstate:
	addi	sp,sp,-12
	li	a1,0
	lla	a0,l_alloc
	sw	s0,4(sp)
	sw	ra,8(sp)
	call	lua_newstate
	mv	s0,a0
	beq	a0,zero,.L420
	lla	a1,lua_panic
	call	lua_atpanic
.L420:
	lw	ra,8(sp)
	mv	a0,s0
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
	.size	luaL_newstate, .-luaL_newstate
	.section	.rodata.luaL_checkversion_.str1.4,"aMS",@progbits,1
	.align	2
.LC61:
	.string	"core and library have incompatible numeric types"
	.align	2
.LC62:
	.string	"multiple Lua VMs detected"
	.align	2
.LC63:
	.string	"version mismatch: app. needs %f, Lua core provides %f"
	.section	.text.luaL_checkversion_,"ax",@progbits
	.align	2
	.globl	luaL_checkversion_
	.hidden	luaL_checkversion_
	.type	luaL_checkversion_, @function
luaL_checkversion_:
	addi	sp,sp,-20
	sw	s0,12(sp)
	sw	s1,8(sp)
	sw	a2,0(sp)
	sw	ra,16(sp)
	mv	s1,a0
	sw	a1,4(sp)
	call	lua_version
	lw	a2,0(sp)
	li	a5,68
	mv	s0,a0
	beq	a2,a5,.L427
	lla	a1,.LC61
	mv	a0,s1
	call	luaL_error
.L427:
	li	a0,0
	call	lua_version
	beq	s0,a0,.L428
	lw	s0,12(sp)
	lw	ra,16(sp)
	mv	a0,s1
	lw	s1,8(sp)
	lla	a1,.LC62
	addi	sp,sp,20
	tail	luaL_error
.L428:
	lw	a3,0(s0)
	lw	a5,4(sp)
	beq	a3,a5,.L426
	lw	s0,12(sp)
	lw	ra,16(sp)
	mv	a0,s1
	lw	s1,8(sp)
	mv	a2,a5
	lla	a1,.LC63
	addi	sp,sp,20
	tail	luaL_error
.L426:
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
	.size	luaL_checkversion_, .-luaL_checkversion_
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
