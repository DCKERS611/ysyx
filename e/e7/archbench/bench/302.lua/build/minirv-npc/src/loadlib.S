#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"loadlib.c"
	.option nopic
	.text
	.section	.rodata.findloader.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"searchers"
	.align	2
.LC1:
	.string	"'package.searchers' must be a table"
	.align	2
.LC2:
	.string	"module '%s' not found:%s"
	.section	.text.findloader,"ax",@progbits
	.align	2
	.type	findloader, @function
findloader:
	mv	a5,a1
	addi	sp,sp,-2044
	li	a1,-4096
	li	a4,4096
	sw	ra,2040(sp)
	sw	s0,2036(sp)
	sw	s1,2032(sp)
	addi	a1,a1,2032
	addi	sp,sp,-36
	addi	a4,a4,-2032
	add	a4,a4,a1
	addi	a3,sp,4
	add	a1,a4,a3
	sw	a5,0(sp)
	mv	s0,a0
	call	luaL_buffinit
	li	a1,-999424
	lla	a2,.LC0
	addi	a1,a1,-1577
	mv	a0,s0
	call	lua_getfield
	li	a5,5
	bne	a0,a5,.L11
.L2:
	li	s1,1
	mv	a2,s1
	li	a1,3
	mv	a0,s0
	call	lua_rawgeti
	beq	a0,zero,.L12
.L3:
	lw	a1,0(sp)
	mv	a0,s0
	call	lua_pushstring
	li	a4,0
	li	a3,0
	li	a2,2
	mv	a0,s0
	li	a1,1
	call	lua_callk
	li	a1,-2
	mv	a0,s0
	call	lua_type
	mv	a4,a0
	li	a5,6
	li	a1,-2
	mv	a0,s0
	beq	a4,a5,.L8
	call	lua_isstring
	mv	a5,a0
	li	a1,-2
	mv	a0,s0
	beq	a5,zero,.L5
	call	lua_settop
	li	a5,-4096
	addi	a0,a5,2032
	li	a5,4096
	addi	a5,a5,-2032
	add	a5,a5,a0
	addi	a4,sp,4
	add	a0,a5,a4
	call	luaL_addvalue
	addi	s1,s1,1
.L13:
	mv	a2,s1
	li	a1,3
	mv	a0,s0
	call	lua_rawgeti
	bne	a0,zero,.L3
.L12:
	mv	a0,s0
	li	a1,-2
	call	lua_settop
	li	a5,-4096
	addi	a0,a5,2032
	li	a5,4096
	addi	a5,a5,-2032
	add	a5,a5,a0
	addi	a4,sp,4
	add	a0,a5,a4
	call	luaL_pushresult
	mv	a0,s0
	li	a1,-1
	li	a2,0
	call	lua_tolstring
	lw	a2,0(sp)
	mv	a3,a0
	lla	a1,.LC2
	mv	a0,s0
	call	luaL_error
	j	.L3
.L5:
	li	a1,-3
	call	lua_settop
	addi	s1,s1,1
	j	.L13
.L8:
	addi	sp,sp,36
	lw	ra,2040(sp)
	lw	s0,2036(sp)
	lw	s1,2032(sp)
	addi	sp,sp,2044
	jr	ra
.L11:
	lla	a1,.LC1
	mv	a0,s0
	call	luaL_error
	j	.L2
	.size	findloader, .-findloader
	.section	.rodata.ll_require.str1.4,"aMS",@progbits,1
	.align	2
.LC3:
	.string	"_LOADED"
	.section	.text.ll_require,"ax",@progbits
	.align	2
	.type	ll_require, @function
ll_require:
	addi	sp,sp,-12
	li	a2,0
	li	a1,1
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	mv	s0,a0
	call	luaL_checklstring
	mv	s1,a0
	li	a1,1
	mv	a0,s0
	call	lua_settop
	li	a1,-999424
	addi	a1,a1,-1576
	lla	a2,.LC3
	mv	a0,s0
	call	lua_getfield
	li	a1,2
	mv	a2,s1
	mv	a0,s0
	call	lua_getfield
	li	a1,-1
	mv	a0,s0
	call	lua_toboolean
	beq	a0,zero,.L23
.L16:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
.L23:
	li	a1,-2
	mv	a0,s0
	call	lua_settop
	mv	a1,s1
	mv	a0,s0
	call	findloader
	mv	a1,s1
	mv	a0,s0
	call	lua_pushstring
	li	a2,1
	li	a1,-2
	mv	a0,s0
	call	lua_rotate
	li	a1,2
	mv	a0,s0
	li	a4,0
	li	a3,0
	li	a2,1
	call	lua_callk
	li	a1,-1
	mv	a0,s0
	call	lua_type
	bne	a0,zero,.L24
.L17:
	mv	a2,s1
	li	a1,2
	mv	a0,s0
	call	lua_getfield
	bne	a0,zero,.L16
	mv	a0,s0
	li	a1,1
	call	lua_pushboolean
	mv	a0,s0
	li	a1,-1
	call	lua_pushvalue
	mv	a0,s0
	mv	a2,s1
	li	a1,2
	call	lua_setfield
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
.L24:
	mv	a2,s1
	li	a1,2
	mv	a0,s0
	call	lua_setfield
	j	.L17
	.size	ll_require, .-ll_require
	.section	.rodata.searcher_preload.str1.4,"aMS",@progbits,1
	.align	2
.LC4:
	.string	"_PRELOAD"
	.align	2
.LC5:
	.string	"\n\tno field package.preload['%s']"
	.section	.text.searcher_preload,"ax",@progbits
	.align	2
	.type	searcher_preload, @function
searcher_preload:
	addi	sp,sp,-12
	li	a2,0
	li	a1,1
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	mv	s0,a0
	call	luaL_checklstring
	li	a1,-999424
	addi	a1,a1,-1576
	mv	s1,a0
	lla	a2,.LC4
	mv	a0,s0
	call	lua_getfield
	mv	a2,s1
	li	a1,-1
	mv	a0,s0
	call	lua_getfield
	beq	a0,zero,.L28
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
.L28:
	mv	a2,s1
	mv	a0,s0
	lla	a1,.LC5
	call	lua_pushfstring
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
	.size	searcher_preload, .-searcher_preload
	.section	.rodata.searchpath.str1.4,"aMS",@progbits,1
	.align	2
.LC6:
	.string	"\n\tno file '%s'"
	.align	2
.LC7:
	.string	"?"
	.align	2
.LC8:
	.string	"r"
	.section	.text.searchpath,"ax",@progbits
	.align	2
	.type	searchpath, @function
searchpath:
	addi	sp,sp,-2044
	sw	s0,2036(sp)
	sw	s1,2032(sp)
	sw	ra,2040(sp)
	addi	sp,sp,-44
	mv	a5,a1
	sw	a3,0(sp)
	li	a1,-4096
	li	a3,4096
	addi	a1,a1,2032
	addi	a3,a3,-2032
	add	a3,a3,a1
	addi	a1,sp,12
	add	a1,a3,a1
	sw	a4,8(sp)
	mv	s0,a0
	sw	a5,4(sp)
	mv	s1,a2
	call	luaL_buffinit
	lw	t1,0(sp)
	lbu	a4,0(t1)
	bne	a4,zero,.L45
.L30:
	li	t1,59
.L31:
	lbu	a4,0(s1)
	bne	a4,t1,.L33
.L34:
	lbu	a4,1(s1)
	addi	s1,s1,1
	beq	a4,t1,.L34
.L33:
	beq	a4,zero,.L46
	li	a1,59
	mv	a0,s1
	call	strchr
	mv	a4,a0
	beq	a0,zero,.L47
.L36:
	sub	a2,a4,s1
	mv	a1,s1
	mv	a0,s0
	sw	a4,0(sp)
	call	lua_pushlstring
	li	a2,0
	li	a1,-1
	mv	a0,s0
	call	lua_tolstring
	lw	a3,4(sp)
	mv	a1,a0
	lla	a2,.LC7
	mv	a0,s0
	call	luaL_gsub
	li	a2,-1
	mv	s1,a0
	li	a1,-2
	mv	a0,s0
	call	lua_rotate
	li	a1,-2
	mv	a0,s0
	call	lua_settop
	lla	a1,.LC8
	mv	a0,s1
	call	fopen
	lw	a4,0(sp)
	beq	a0,zero,.L48
	call	fclose
	addi	sp,sp,44
	lw	ra,2040(sp)
	mv	a0,s1
	lw	s0,2036(sp)
	lw	s1,2032(sp)
	addi	sp,sp,2044
	jr	ra
.L48:
	mv	a2,s1
	lla	a1,.LC6
	mv	a0,s0
	sw	a4,0(sp)
	call	lua_pushfstring
	li	a2,-1
	li	a1,-2
	mv	a0,s0
	call	lua_rotate
	li	a1,-2
	mv	a0,s0
	call	lua_settop
	li	a0,-4096
	li	a5,4096
	addi	a0,a0,2032
	addi	a5,a5,-2032
	addi	a4,sp,12
	add	a5,a5,a0
	add	a0,a5,a4
	call	luaL_addvalue
	lw	a4,0(sp)
	li	t1,59
	mv	s1,a4
	j	.L31
.L47:
	mv	a0,s1
	call	strlen
	add	a4,s1,a0
	j	.L36
.L46:
	li	a0,-4096
	li	a5,4096
	addi	a0,a0,2032
	addi	a5,a5,-2032
	addi	a4,sp,12
	add	a5,a5,a0
	add	a0,a5,a4
	call	luaL_pushresult
	addi	sp,sp,44
	lw	ra,2040(sp)
	li	s1,0
	mv	a0,s1
	lw	s0,2036(sp)
	lw	s1,2032(sp)
	addi	sp,sp,2044
	jr	ra
.L45:
	lw	a1,4(sp)
	lw	a3,8(sp)
	mv	a2,t1
	mv	a0,s0
	call	luaL_gsub
	sw	a0,4(sp)
	j	.L30
	.size	searchpath, .-searchpath
	.section	.rodata.ll_searchpath.str1.4,"aMS",@progbits,1
	.align	2
.LC9:
	.string	"."
	.align	2
.LC10:
	.string	"/"
	.section	.text.ll_searchpath,"ax",@progbits
	.align	2
	.type	ll_searchpath, @function
ll_searchpath:
	addi	sp,sp,-20
	li	a2,0
	li	a1,1
	sw	ra,16(sp)
	sw	s0,12(sp)
	sw	s1,8(sp)
	mv	s0,a0
	call	luaL_checklstring
	mv	s1,a0
	li	a2,0
	li	a1,2
	mv	a0,s0
	call	luaL_checklstring
	mv	a5,a0
	li	a3,0
	lla	a2,.LC9
	li	a1,3
	mv	a0,s0
	sw	a5,4(sp)
	call	luaL_optlstring
	sw	a0,0(sp)
	li	a3,0
	lla	a2,.LC10
	li	a1,4
	mv	a0,s0
	call	luaL_optlstring
	lw	t1,0(sp)
	lw	a5,4(sp)
	mv	a4,a0
	mv	a3,t1
	mv	a2,a5
	mv	a1,s1
	mv	a0,s0
	call	searchpath
	beq	a0,zero,.L53
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	li	a0,1
	addi	sp,sp,20
	jr	ra
.L53:
	mv	a0,s0
	call	lua_pushnil
	mv	a0,s0
	li	a2,1
	li	a1,-2
	call	lua_rotate
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	li	a0,2
	addi	sp,sp,20
	jr	ra
	.size	ll_searchpath, .-ll_searchpath
	.section	.rodata.lookforfunc.str1.4,"aMS",@progbits,1
	.align	2
.LC11:
	.string	"dynamic libraries not enabled; check your Lua installation"
	.section	.text.lookforfunc,"ax",@progbits
	.align	2
	.type	lookforfunc, @function
lookforfunc:
	addi	sp,sp,-16
	mv	a5,a1
	li	a1,-999424
	sw	s1,4(sp)
	addi	a1,a1,-1576
	mv	s1,a2
	lla	a2,.LANCHOR0
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	a5,0(sp)
	mv	s0,a0
	call	lua_rawgetp
	lw	a5,0(sp)
	li	a1,-1
	mv	a0,s0
	mv	a2,a5
	call	lua_getfield
	li	a1,-1
	mv	a0,s0
	call	lua_touserdata
	sw	a0,0(sp)
	li	a1,-3
	mv	a0,s0
	call	lua_settop
	lw	a5,0(sp)
	beq	a5,zero,.L59
	lbu	a4,0(s1)
	li	a5,42
	beq	a4,a5,.L60
	lla	a1,.LC11
	mv	a0,s0
	call	lua_pushstring
	li	a0,2
.L54:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L60:
	mv	a0,s0
	li	a1,1
	call	lua_pushboolean
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	li	a0,0
	addi	sp,sp,16
	jr	ra
.L59:
	lla	a1,.LC11
	mv	a0,s0
	call	lua_pushstring
	li	a0,1
	j	.L54
	.size	lookforfunc, .-lookforfunc
	.section	.rodata.ll_loadlib.str1.4,"aMS",@progbits,1
	.align	2
.LC12:
	.string	"absent"
	.align	2
.LC13:
	.string	"init"
	.section	.text.ll_loadlib,"ax",@progbits
	.align	2
	.type	ll_loadlib, @function
ll_loadlib:
	addi	sp,sp,-12
	li	a2,0
	li	a1,1
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	mv	s0,a0
	call	luaL_checklstring
	mv	s1,a0
	li	a2,0
	li	a1,2
	mv	a0,s0
	call	luaL_checklstring
	mv	a2,a0
	mv	a1,s1
	mv	a0,s0
	call	lookforfunc
	bne	a0,zero,.L67
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
.L67:
	mv	s1,a0
	mv	a0,s0
	call	lua_pushnil
	li	a1,-2
	li	a2,1
	mv	a0,s0
	call	lua_rotate
	li	a5,1
	lla	a1,.LC12
	beq	s1,a5,.L63
	lla	a1,.LC13
.L63:
	mv	a0,s0
	call	lua_pushstring
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	li	a0,3
	addi	sp,sp,12
	jr	ra
	.size	ll_loadlib, .-ll_loadlib
	.section	.rodata.loadfunc.str1.4,"aMS",@progbits,1
	.align	2
.LC14:
	.string	"_"
	.align	2
.LC15:
	.string	"luaopen_%s"
	.section	.text.loadfunc,"ax",@progbits
	.align	2
	.type	loadfunc, @function
loadfunc:
	addi	sp,sp,-16
	mv	a5,a2
	sw	s1,4(sp)
	lla	a2,.LC9
	lla	a3,.LC14
	mv	s1,a1
	mv	a1,a5
	sw	ra,12(sp)
	sw	s0,8(sp)
	mv	s0,a0
	call	luaL_gsub
	li	a1,45
	sw	a0,0(sp)
	call	strchr
	lw	a2,0(sp)
	beq	a0,zero,.L69
	mv	a1,a2
	sw	a0,0(sp)
	sub	a2,a0,a2
	mv	a0,s0
	call	lua_pushlstring
	mv	a2,a0
	lla	a1,.LC15
	mv	a0,s0
	call	lua_pushfstring
	mv	a2,a0
	mv	a1,s1
	mv	a0,s0
	call	lookforfunc
	li	a4,2
	beq	a0,a4,.L75
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L75:
	lw	a5,0(sp)
	addi	a2,a5,1
.L69:
	lla	a1,.LC15
	mv	a0,s0
	call	lua_pushfstring
	mv	a2,a0
	mv	a0,s0
	lw	s0,8(sp)
	lw	ra,12(sp)
	mv	a1,s1
	lw	s1,4(sp)
	addi	sp,sp,16
	tail	lookforfunc
	.size	loadfunc, .-loadfunc
	.section	.text.gctm,"ax",@progbits
	.align	2
	.type	gctm, @function
gctm:
	addi	sp,sp,-12
	li	a1,1
	sw	s1,0(sp)
	sw	ra,8(sp)
	sw	s0,4(sp)
	mv	s1,a0
	call	luaL_len
	ble	a0,zero,.L77
	mv	s0,a0
.L78:
	mv	a2,s0
	li	a1,1
	mv	a0,s1
	call	lua_rawgeti
	li	a1,-1
	mv	a0,s1
	call	lua_touserdata
	addi	s0,s0,-1
	li	a1,-2
	mv	a0,s1
	call	lua_settop
	bne	s0,zero,.L78
.L77:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	li	a0,0
	addi	sp,sp,12
	jr	ra
	.size	gctm, .-gctm
	.section	.rodata.findfile.constprop.0.str1.4,"aMS",@progbits,1
	.align	2
.LC16:
	.string	"'package.%s' must be a string"
	.section	.text.findfile.constprop.0,"ax",@progbits
	.align	2
	.type	findfile.constprop.0, @function
findfile.constprop.0:
	addi	sp,sp,-20
	sw	s1,8(sp)
	mv	s1,a1
	li	a1,-999424
	addi	a1,a1,-1577
	sw	ra,16(sp)
	sw	s0,12(sp)
	sw	a2,0(sp)
	mv	s0,a0
	call	lua_getfield
	li	a2,0
	li	a1,-1
	mv	a0,s0
	call	lua_tolstring
	mv	a5,a0
	beq	a0,zero,.L84
.L82:
	mv	a0,s0
	lw	s0,12(sp)
	lw	ra,16(sp)
	mv	a1,s1
	lw	s1,8(sp)
	lla	a4,.LC10
	lla	a3,.LC9
	mv	a2,a5
	addi	sp,sp,20
	tail	searchpath
.L84:
	lw	a2,0(sp)
	sw	a0,4(sp)
	lla	a1,.LC16
	mv	a0,s0
	call	luaL_error
	lw	a5,4(sp)
	j	.L82
	.size	findfile.constprop.0, .-findfile.constprop.0
	.section	.rodata.searcher_Croot.str1.4,"aMS",@progbits,1
	.align	2
.LC17:
	.string	"cpath"
	.align	2
.LC18:
	.string	"error loading module '%s' from file '%s':\n\t%s"
	.align	2
.LC19:
	.string	"\n\tno module '%s' in file '%s'"
	.section	.text.searcher_Croot,"ax",@progbits
	.align	2
	.type	searcher_Croot, @function
searcher_Croot:
	addi	sp,sp,-16
	li	a1,1
	li	a2,0
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	mv	s0,a0
	call	luaL_checklstring
	li	a1,46
	mv	s1,a0
	call	strchr
	beq	a0,zero,.L89
	sub	a2,a0,s1
	mv	a1,s1
	mv	a0,s0
	call	lua_pushlstring
	li	a2,0
	li	a1,-1
	mv	a0,s0
	call	lua_tolstring
	mv	a1,a0
	lla	a2,.LC17
	mv	a0,s0
	call	findfile.constprop.0
	beq	a0,zero,.L90
	mv	a1,a0
	sw	a0,0(sp)
	mv	a2,s1
	mv	a0,s0
	call	loadfunc
	lw	a3,0(sp)
	beq	a0,zero,.L87
	li	a5,2
	beq	a0,a5,.L88
	li	a2,0
	li	a1,1
	mv	a0,s0
	call	lua_tolstring
	mv	s1,a0
	li	a1,-1
	li	a2,0
	mv	a0,s0
	call	lua_tolstring
	mv	a4,a0
	mv	a0,s0
	lw	s0,8(sp)
	lw	a3,0(sp)
	lw	ra,12(sp)
	mv	a2,s1
	lw	s1,4(sp)
	lla	a1,.LC18
	addi	sp,sp,16
	tail	luaL_error
.L90:
	li	a0,1
.L85:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L89:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	li	a0,0
	addi	sp,sp,16
	jr	ra
.L88:
	mv	a2,s1
	mv	a0,s0
	lla	a1,.LC19
	call	lua_pushfstring
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	li	a0,1
	addi	sp,sp,16
	jr	ra
.L87:
	mv	a1,a3
	mv	a0,s0
	call	lua_pushstring
	li	a0,2
	j	.L85
	.size	searcher_Croot, .-searcher_Croot
	.section	.text.searcher_C,"ax",@progbits
	.align	2
	.type	searcher_C, @function
searcher_C:
	addi	sp,sp,-16
	li	a2,0
	li	a1,1
	sw	s0,8(sp)
	sw	ra,12(sp)
	sw	s1,4(sp)
	mv	s0,a0
	call	luaL_checklstring
	mv	a1,a0
	sw	a0,0(sp)
	lla	a2,.LC17
	mv	a0,s0
	call	findfile.constprop.0
	beq	a0,zero,.L95
	lw	a1,0(sp)
	mv	s1,a0
	mv	a2,a1
	mv	a1,a0
	mv	a0,s0
	call	loadfunc
	beq	a0,zero,.L97
	li	a2,0
	li	a1,1
	mv	a0,s0
	call	lua_tolstring
	sw	a0,0(sp)
	li	a1,-1
	li	a2,0
	mv	a0,s0
	call	lua_tolstring
	lw	a5,0(sp)
	mv	a4,a0
	mv	a0,s0
	lw	s0,8(sp)
	lw	ra,12(sp)
	mv	a3,s1
	lw	s1,4(sp)
	mv	a2,a5
	lla	a1,.LC18
	addi	sp,sp,16
	tail	luaL_error
.L97:
	mv	a1,s1
	mv	a0,s0
	call	lua_pushstring
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	li	a0,2
	addi	sp,sp,16
	jr	ra
.L95:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	li	a0,1
	addi	sp,sp,16
	jr	ra
	.size	searcher_C, .-searcher_C
	.section	.rodata.searcher_Lua.str1.4,"aMS",@progbits,1
	.align	2
.LC20:
	.string	"path"
	.section	.text.searcher_Lua,"ax",@progbits
	.align	2
	.type	searcher_Lua, @function
searcher_Lua:
	addi	sp,sp,-16
	li	a2,0
	li	a1,1
	sw	s0,8(sp)
	sw	ra,12(sp)
	sw	s1,4(sp)
	mv	s0,a0
	call	luaL_checklstring
	mv	a1,a0
	lla	a2,.LC20
	mv	a0,s0
	call	findfile.constprop.0
	beq	a0,zero,.L101
	mv	s1,a0
	mv	a1,a0
	li	a2,0
	mv	a0,s0
	call	luaL_loadfilex
	beq	a0,zero,.L103
	li	a2,0
	li	a1,1
	mv	a0,s0
	call	lua_tolstring
	sw	a0,0(sp)
	li	a1,-1
	li	a2,0
	mv	a0,s0
	call	lua_tolstring
	lw	a5,0(sp)
	mv	a4,a0
	mv	a0,s0
	lw	s0,8(sp)
	lw	ra,12(sp)
	mv	a3,s1
	lw	s1,4(sp)
	mv	a2,a5
	lla	a1,.LC18
	addi	sp,sp,16
	tail	luaL_error
.L103:
	mv	a1,s1
	mv	a0,s0
	call	lua_pushstring
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	li	a0,2
	addi	sp,sp,16
	jr	ra
.L101:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	li	a0,1
	addi	sp,sp,16
	jr	ra
	.size	searcher_Lua, .-searcher_Lua
	.section	.rodata.luaopen_package.str1.4,"aMS",@progbits,1
	.align	2
.LC21:
	.string	"__gc"
	.align	2
.LC22:
	.string	"/\n;\n?\n!\n-\n"
	.align	2
.LC23:
	.string	"config"
	.align	2
.LC24:
	.string	"loaded"
	.align	2
.LC25:
	.string	"preload"
	.section	.text.luaopen_package,"ax",@progbits
	.align	2
	.globl	luaopen_package
	.hidden	luaopen_package
	.type	luaopen_package, @function
luaopen_package:
	addi	sp,sp,-16
	li	a2,0
	li	a1,0
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	mv	s0,a0
	call	lua_createtable
	li	a2,1
	li	a1,0
	mv	a0,s0
	call	lua_createtable
	li	a2,0
	lla	a1,gctm
	mv	a0,s0
	call	lua_pushcclosure
	lla	a2,.LC21
	li	a1,-2
	mv	a0,s0
	call	lua_setfield
	li	a1,-2
	mv	a0,s0
	call	lua_setmetatable
	li	a1,-999424
	lla	a2,.LANCHOR0
	addi	a1,a1,-1576
	mv	a0,s0
	call	lua_rawsetp
	li	a2,68
	li	a1,503
	mv	a0,s0
	call	luaL_checkversion_
	li	a2,7
	li	a1,0
	mv	a0,s0
	call	lua_createtable
	li	a2,0
	lla	a1,.LANCHOR1
	mv	a0,s0
	call	luaL_setfuncs
	li	a2,0
	li	a1,4
	mv	a0,s0
	call	lua_createtable
	li	s1,0
	lla	a5,searcher_preload
.L105:
	li	a1,-2
	mv	a0,s0
	sw	a5,0(sp)
	call	lua_pushvalue
	lw	a5,0(sp)
	li	a2,1
	mv	a0,s0
	mv	a1,a5
	call	lua_pushcclosure
	addi	s1,s1,1
	mv	a2,s1
	li	a1,-2
	mv	a0,s0
	call	lua_rawseti
	lla	a5,.LANCHOR2
	slli	a4,s1,2
	add	a4,a5,a4
	lw	a5,0(a4)
	bne	a5,zero,.L105
	lla	a2,.LC0
	mv	a0,s0
	li	a1,-2
	call	lua_setfield
	lla	a1,.LC22
	mv	a0,s0
	call	lua_pushstring
	mv	a0,s0
	lla	a2,.LC23
	li	a1,-2
	call	lua_setfield
	li	s1,-999424
	addi	a1,s1,-1576
	lla	a2,.LC3
	mv	a0,s0
	call	luaL_getsubtable
	mv	a0,s0
	lla	a2,.LC24
	li	a1,-2
	call	lua_setfield
	addi	a1,s1,-1576
	lla	a2,.LC4
	mv	a0,s0
	call	luaL_getsubtable
	mv	a0,s0
	lla	a2,.LC25
	li	a1,-2
	call	lua_setfield
	li	a2,2
	addi	a1,s1,-1576
	mv	a0,s0
	call	lua_rawgeti
	mv	a0,s0
	li	a1,-2
	call	lua_pushvalue
	mv	a0,s0
	li	a2,1
	lla	a1,.LANCHOR3
	call	luaL_setfuncs
	mv	a0,s0
	li	a1,-2
	call	lua_settop
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	li	a0,1
	addi	sp,sp,16
	jr	ra
	.size	luaopen_package, .-luaopen_package
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC26:
	.string	"require"
	.align	2
.LC27:
	.string	"loadlib"
	.align	2
.LC28:
	.string	"searchpath"
	.section	.rodata.ll_funcs,"a"
	.align	2
	.set	.LANCHOR3,. + 0
	.type	ll_funcs, @object
	.size	ll_funcs, 16
ll_funcs:
	.word	.LC26
	.word	ll_require
	.word	0
	.word	0
	.section	.rodata.pk_funcs,"a"
	.align	2
	.set	.LANCHOR1,. + 0
	.type	pk_funcs, @object
	.size	pk_funcs, 64
pk_funcs:
	.word	.LC27
	.word	ll_loadlib
	.word	.LC28
	.word	ll_searchpath
	.word	.LC25
	.word	0
	.word	.LC17
	.word	0
	.word	.LC20
	.word	0
	.word	.LC0
	.word	0
	.word	.LC24
	.word	0
	.word	0
	.word	0
	.section	.rodata.searchers.0,"a"
	.align	2
	.set	.LANCHOR2,. + 0
	.type	searchers.0, @object
	.size	searchers.0, 20
searchers.0:
	.word	searcher_preload
	.word	searcher_Lua
	.word	searcher_C
	.word	searcher_Croot
	.word	0
	.section	.srodata.CLIBS,"a"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	CLIBS, @object
	.size	CLIBS, 4
CLIBS:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
