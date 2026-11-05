#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"ltablib.c"
	.option nopic
	.text
	.section	.rodata.unpack.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"too many results to unpack"
	.section	.text.unpack,"ax",@progbits
	.align	2
	.type	unpack, @function
unpack:
	addi	sp,sp,-20
	li	a1,2
	li	a2,1
	sw	s0,12(sp)
	sw	s1,8(sp)
	sw	ra,16(sp)
	mv	s0,a0
	call	luaL_optinteger
	mv	s1,a0
	li	a1,3
	mv	a0,s0
	call	lua_type
	ble	a0,zero,.L16
	li	a1,3
	mv	a0,s0
	call	luaL_checkinteger
	mv	a4,a0
	blt	a4,s1,.L8
.L17:
	li	a3,-2147483648
	sub	a5,a4,s1
	sw	a4,0(sp)
	xori	a3,a3,-2
	bgtu	a5,a3,.L5
	addi	a5,a5,1
	mv	a1,a5
	mv	a0,s0
	sw	a5,4(sp)
	call	lua_checkstack
	beq	a0,zero,.L5
	lw	a4,0(sp)
	ble	a4,s1,.L7
.L6:
	mv	a2,s1
	li	a1,1
	mv	a0,s0
	sw	a4,0(sp)
	call	lua_geti
	lw	a4,0(sp)
	addi	s1,s1,1
	bne	a4,s1,.L6
.L7:
	mv	a0,s0
	mv	a2,a4
	li	a1,1
	call	lua_geti
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	a0,4(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L5:
	mv	a0,s0
	lw	s0,12(sp)
	lw	ra,16(sp)
	lw	s1,8(sp)
	lla	a1,.LC0
	addi	sp,sp,20
	tail	luaL_error
.L16:
	li	a1,1
	mv	a0,s0
	call	luaL_len
	mv	a4,a0
	bge	a4,s1,.L17
.L8:
	lw	ra,16(sp)
	lw	s0,12(sp)
	sw	zero,4(sp)
	lw	a0,4(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
	.size	unpack, .-unpack
	.section	.rodata.pack.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"n"
	.section	.text.pack,"ax",@progbits
	.align	2
	.type	pack, @function
pack:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	mv	s0,a0
	call	lua_gettop
	mv	a1,a0
	mv	s1,a0
	sw	a0,0(sp)
	li	a2,1
	mv	a0,s0
	call	lua_createtable
	li	a2,1
	li	a1,1
	mv	a0,s0
	call	lua_rotate
	ble	s1,zero,.L19
.L20:
	mv	a2,s1
	li	a1,1
	addi	s1,s1,-1
	mv	a0,s0
	call	lua_seti
	bne	s1,zero,.L20
.L19:
	lw	a1,0(sp)
	mv	a0,s0
	call	lua_pushinteger
	mv	a0,s0
	lla	a2,.LC1
	li	a1,1
	call	lua_setfield
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	li	a0,1
	addi	sp,sp,16
	jr	ra
	.size	pack, .-pack
	.section	.rodata.addfield.str1.4,"aMS",@progbits,1
	.align	2
.LC2:
	.string	"invalid value (%s) at index %d in table for 'concat'"
	.section	.text.addfield,"ax",@progbits
	.align	2
	.type	addfield, @function
addfield:
	addi	sp,sp,-16
	sw	s1,4(sp)
	mv	s1,a1
	li	a1,1
	sw	s0,8(sp)
	sw	ra,12(sp)
	mv	s0,a0
	sw	a2,0(sp)
	call	lua_geti
	li	a1,-1
	mv	a0,s0
	call	lua_isstring
	beq	a0,zero,.L26
	lw	s0,8(sp)
	lw	ra,12(sp)
	mv	a0,s1
	lw	s1,4(sp)
	addi	sp,sp,16
	tail	luaL_addvalue
.L26:
	li	a1,-1
	mv	a0,s0
	call	lua_type
	mv	a1,a0
	mv	a0,s0
	call	lua_typename
	lw	a3,0(sp)
	mv	a2,a0
	lla	a1,.LC2
	mv	a0,s0
	call	luaL_error
	lw	s0,8(sp)
	lw	ra,12(sp)
	mv	a0,s1
	lw	s1,4(sp)
	addi	sp,sp,16
	tail	luaL_addvalue
	.size	addfield, .-addfield
	.section	.text.sort_comp,"ax",@progbits
	.align	2
	.type	sort_comp, @function
sort_comp:
	addi	sp,sp,-16
	mv	a5,a1
	li	a1,2
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	mv	s0,a0
	sw	a5,0(sp)
	mv	s1,a2
	call	lua_type
	bne	a0,zero,.L28
	mv	a0,s0
	lw	s0,8(sp)
	lw	a1,0(sp)
	lw	ra,12(sp)
	mv	a2,s1
	lw	s1,4(sp)
	li	a3,1
	addi	sp,sp,16
	tail	lua_compare
.L28:
	mv	a0,s0
	li	a1,2
	call	lua_pushvalue
	lw	a5,0(sp)
	mv	a0,s0
	addi	a1,a5,-1
	call	lua_pushvalue
	addi	a1,s1,-2
	mv	a0,s0
	call	lua_pushvalue
	li	a4,0
	li	a3,0
	li	a2,1
	mv	a0,s0
	li	a1,2
	call	lua_callk
	li	a1,-1
	mv	a0,s0
	call	lua_toboolean
	mv	s1,a0
	li	a1,-2
	mv	a0,s0
	call	lua_settop
	lw	ra,12(sp)
	lw	s0,8(sp)
	mv	a0,s1
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
	.size	sort_comp, .-sort_comp
	.section	.rodata.checktab.part.0.str1.4,"aMS",@progbits,1
	.align	2
.LC3:
	.string	"__index"
	.align	2
.LC4:
	.string	"__newindex"
	.align	2
.LC5:
	.string	"__len"
	.section	.text.checktab.part.0,"ax",@progbits
	.align	2
	.type	checktab.part.0, @function
checktab.part.0:
	addi	sp,sp,-24
	sw	s0,16(sp)
	sw	s1,12(sp)
	sw	ra,20(sp)
	mv	s1,a0
	sw	a1,0(sp)
	mv	s0,a2
	call	lua_getmetatable
	beq	a0,zero,.L31
	andi	a4,s0,1
	li	a3,-2
	li	a2,1
	bne	a4,zero,.L56
	andi	a4,s0,2
	bne	a4,zero,.L57
.L33:
	sw	a2,4(sp)
	andi	s0,s0,4
	beq	s0,zero,.L34
	lla	a1,.LC5
	mv	a0,s1
	sw	a3,8(sp)
	call	lua_pushstring
	lw	a3,8(sp)
	mv	a0,s1
	mv	a1,a3
	call	lua_rawget
	beq	a0,zero,.L31
	lw	a2,4(sp)
	li	a3,-2
	sub	a3,a3,a2
.L34:
	lw	s0,16(sp)
	lw	ra,20(sp)
	mv	a0,s1
	lw	s1,12(sp)
	mv	a1,a3
	addi	sp,sp,24
	tail	lua_settop
.L56:
	lla	a1,.LC3
	mv	a0,s1
	call	lua_pushstring
	li	a1,-2
	mv	a0,s1
	call	lua_rawget
	bne	a0,zero,.L58
.L31:
	lw	s0,16(sp)
	lw	a1,0(sp)
	lw	ra,20(sp)
	mv	a0,s1
	lw	s1,12(sp)
	li	a2,5
	addi	sp,sp,24
	tail	luaL_checktype
.L57:
	lla	a1,.LC4
	mv	a0,s1
	sw	a3,4(sp)
	sw	a2,8(sp)
	call	lua_pushstring
	lw	a3,4(sp)
	mv	a0,s1
	mv	a1,a3
	call	lua_rawget
	beq	a0,zero,.L31
	lw	a2,8(sp)
	addi	a2,a2,1
	not	a3,a2
	j	.L33
.L58:
	andi	a4,s0,2
	li	a3,-3
	li	a2,2
	beq	a4,zero,.L33
	j	.L57
	.size	checktab.part.0, .-checktab.part.0
	.globl	__umodsi3
	.section	.rodata.auxsort.str1.4,"aMS",@progbits,1
	.align	2
.LC6:
	.string	"invalid order function for sorting"
	.section	.text.auxsort,"ax",@progbits
	.align	2
	.type	auxsort, @function
auxsort:
	addi	sp,sp,-68
	addi	a5,sp,51
	sw	a3,20(sp)
	andi	a3,a5,-8
	sw	a3,24(sp)
	sub	a3,a2,a1
	sw	ra,64(sp)
	sw	s0,60(sp)
	sw	s1,56(sp)
	sw	a1,12(sp)
	sw	a2,16(sp)
	sw	a3,0(sp)
	bgeu	a1,a2,.L59
	mv	s1,a0
.L60:
	lw	a2,12(sp)
	li	a1,1
	mv	a0,s1
	call	lua_geti
	lw	s0,16(sp)
	li	a1,1
	mv	a0,s1
	mv	a2,s0
	call	lua_geti
	li	a2,-2
	li	a1,-1
	mv	a0,s1
	call	sort_comp
	beq	a0,zero,.L61
	lw	a2,12(sp)
	mv	a0,s1
	li	a1,1
	call	lua_seti
	mv	a2,s0
	li	a1,1
	mv	a0,s1
	call	lua_seti
.L62:
	lw	a4,0(sp)
	li	a5,1
	beq	a4,a5,.L59
	li	a5,99
	bleu	a4,a5,.L64
	lw	a5,20(sp)
	beq	a5,zero,.L64
	lw	a5,0(sp)
	lw	a0,20(sp)
	srli	s0,a5,2
	slli	a1,s0,1
	call	__umodsi3
	lw	a5,12(sp)
	add	a5,s0,a5
	add	s0,a0,a5
.L66:
	li	a1,1
	mv	a2,s0
	mv	a0,s1
	call	lua_geti
	lw	a2,12(sp)
	li	a1,1
	mv	a0,s1
	call	lua_geti
	li	a2,-1
	li	a1,-2
	mv	a0,s1
	call	sort_comp
	beq	a0,zero,.L67
	mv	a0,s1
	mv	a2,s0
	li	a1,1
	call	lua_seti
	lw	a2,12(sp)
	li	a1,1
	mv	a0,s1
	call	lua_seti
.L68:
	lw	a4,0(sp)
	li	a5,2
	beq	a4,a5,.L59
	mv	a2,s0
	li	a1,1
	mv	a0,s1
	call	lua_geti
	li	a1,-1
	mv	a0,s1
	call	lua_pushvalue
	lw	a5,16(sp)
	li	a1,1
	mv	a0,s1
	addi	a5,a5,-1
	mv	a2,a5
	sw	a5,8(sp)
	call	lua_geti
	mv	a2,s0
	li	a1,1
	mv	a0,s1
	call	lua_seti
	lw	s0,8(sp)
	li	a1,1
	mv	a0,s1
	mv	a2,s0
	call	lua_seti
	lw	a5,12(sp)
	sw	a5,4(sp)
	j	.L70
.L72:
	lw	a5,8(sp)
	lw	a4,0(sp)
	beq	a5,a4,.L87
.L71:
	li	a1,-2
	mv	a0,s1
	call	lua_settop
.L79:
	lw	a5,0(sp)
	sw	a5,4(sp)
.L70:
	lw	a5,4(sp)
	li	a1,1
	mv	a0,s1
	addi	a5,a5,1
	mv	a2,a5
	sw	a5,0(sp)
	call	lua_geti
	li	a2,-2
	li	a1,-1
	mv	a0,s1
	call	sort_comp
	bne	a0,zero,.L72
	j	.L73
.L89:
	lla	a1,.LC6
	mv	a0,s1
	call	luaL_error
.L74:
	li	a1,-2
	mv	a0,s1
	call	lua_settop
.L73:
	addi	s0,s0,-1
	mv	a2,s0
	li	a1,1
	mv	a0,s1
	call	lua_geti
	li	a2,-1
	li	a1,-3
	mv	a0,s1
	call	sort_comp
	lw	a5,0(sp)
	beq	a0,zero,.L88
	bleu	a5,s0,.L74
	j	.L89
.L88:
	bgtu	a5,s0,.L90
	lw	a2,0(sp)
	mv	a0,s1
	li	a1,1
	call	lua_seti
	mv	a2,s0
	li	a1,1
	mv	a0,s1
	call	lua_seti
	j	.L79
.L87:
	lla	a1,.LC6
	mv	a0,s1
	call	luaL_error
	j	.L71
.L90:
	li	a1,-2
	mv	a0,s1
	call	lua_settop
	lw	a2,8(sp)
	li	a1,1
	mv	a0,s1
	call	lua_seti
	lw	a2,0(sp)
	lw	a5,12(sp)
	li	a1,1
	mv	a0,s1
	sub	s0,a2,a5
	lw	a5,16(sp)
	sub	a5,a5,a2
	sw	a5,0(sp)
	call	lua_seti
	lw	a4,4(sp)
	lw	a5,0(sp)
	addi	a4,a4,2
	bgeu	s0,a5,.L91
	lw	a1,12(sp)
	lw	a3,20(sp)
	lw	a2,4(sp)
	mv	a0,s1
	sw	a4,0(sp)
	call	auxsort
	lw	a4,0(sp)
	sw	a4,12(sp)
.L80:
	lw	a4,12(sp)
	lw	a5,16(sp)
	sub	a5,a5,a4
	sw	a5,0(sp)
	srli	a4,a5,7
	bgtu	a4,s0,.L92
.L81:
	lw	a5,12(sp)
	lw	a4,16(sp)
	bltu	a5,a4,.L60
.L59:
	lw	ra,64(sp)
	lw	s0,60(sp)
	lw	s1,56(sp)
	addi	sp,sp,68
	jr	ra
.L64:
	lw	a5,16(sp)
	lw	a4,12(sp)
	add	s0,a5,a4
	srli	s0,s0,1
	j	.L66
.L61:
	li	a1,-3
	mv	a0,s1
	call	lua_settop
	j	.L62
.L67:
	li	a1,-2
	mv	a0,s1
	call	lua_settop
	lw	a2,16(sp)
	li	a1,1
	mv	a0,s1
	call	lua_geti
	li	a2,-2
	li	a1,-1
	mv	a0,s1
	call	sort_comp
	beq	a0,zero,.L69
	mv	a0,s1
	mv	a2,s0
	li	a1,1
	call	lua_seti
	lw	a2,16(sp)
	li	a1,1
	mv	a0,s1
	call	lua_seti
	j	.L68
.L92:
	call	rand
	sw	a0,28(sp)
	call	rand
	lw	s0,24(sp)
	mv	a5,a0
	srai	a4,a0,31
	li	a2,4
	addi	a1,sp,28
	addi	a0,sp,32
	sw	a5,0(s0)
	sw	a4,4(s0)
	call	memcpy
	li	a2,8
	mv	a1,s0
	addi	a0,sp,36
	call	memcpy
	lw	a4,32(sp)
	lw	a5,36(sp)
	add	a5,a5,a4
	lw	a4,40(sp)
	add	a5,a5,a4
	sw	a5,20(sp)
	j	.L81
.L69:
	li	a1,-3
	mv	a0,s1
	call	lua_settop
	j	.L68
.L91:
	lw	a2,16(sp)
	lw	a3,20(sp)
	mv	a1,a4
	mv	a0,s1
	call	auxsort
	lw	a5,4(sp)
	lw	s0,0(sp)
	sw	a5,16(sp)
	j	.L80
	.size	auxsort, .-auxsort
	.section	.rodata.sort.str1.4,"aMS",@progbits,1
	.align	2
.LC7:
	.string	"array too big"
	.section	.text.sort,"ax",@progbits
	.align	2
	.type	sort, @function
sort:
	addi	sp,sp,-12
	li	a1,1
	sw	s0,4(sp)
	sw	ra,8(sp)
	sw	s1,0(sp)
	mv	s0,a0
	call	lua_type
	li	a5,5
	beq	a0,a5,.L94
	li	a2,7
	li	a1,1
	mv	a0,s0
	call	checktab.part.0
.L94:
	li	a1,1
	mv	a0,s0
	call	luaL_len
	li	a5,1
	mv	s1,a0
	ble	a0,a5,.L95
	li	a5,-2147483648
	xori	a5,a5,-1
	beq	a0,a5,.L99
	li	a1,2
	mv	a0,s0
	call	lua_type
	bgt	a0,zero,.L100
.L97:
	li	a1,2
	mv	a0,s0
	call	lua_settop
	li	a3,0
	mv	a2,s1
	li	a1,1
	mv	a0,s0
	call	auxsort
.L95:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	li	a0,0
	addi	sp,sp,12
	jr	ra
.L100:
	li	a2,6
	li	a1,2
	mv	a0,s0
	call	luaL_checktype
	j	.L97
.L99:
	li	a1,1
	lla	a2,.LC7
	mv	a0,s0
	call	luaL_argerror
	li	a1,2
	mv	a0,s0
	call	lua_type
	ble	a0,zero,.L97
	j	.L100
	.size	sort, .-sort
	.section	.rodata.tremove.str1.4,"aMS",@progbits,1
	.align	2
.LC8:
	.string	"position out of bounds"
	.section	.text.tremove,"ax",@progbits
	.align	2
	.type	tremove, @function
tremove:
	addi	sp,sp,-20
	li	a1,1
	sw	s0,12(sp)
	sw	ra,16(sp)
	sw	s1,8(sp)
	mv	s0,a0
	call	lua_type
	li	a5,5
	beq	a0,a5,.L102
	li	a2,7
	li	a1,1
	mv	a0,s0
	call	checktab.part.0
.L102:
	li	a1,1
	mv	a0,s0
	call	luaL_len
	sw	a0,4(sp)
	mv	a2,a0
	li	a1,2
	mv	a0,s0
	call	luaL_optinteger
	lw	a5,4(sp)
	mv	s1,a0
	beq	a5,a0,.L103
	ble	a0,zero,.L104
	addi	a4,a5,1
	bge	a4,a0,.L105
.L104:
	lla	a2,.LC8
	li	a1,1
	mv	a0,s0
	call	luaL_argerror
.L105:
	mv	a2,s1
	li	a1,1
	mv	a0,s0
	call	lua_geti
	lw	a5,4(sp)
	ble	a5,s1,.L108
.L107:
	sw	s1,0(sp)
	addi	s1,s1,1
	li	a1,1
	mv	a2,s1
	mv	a0,s0
	call	lua_geti
	lw	a4,0(sp)
	li	a1,1
	mv	a0,s0
	mv	a2,a4
	call	lua_seti
	lw	a5,4(sp)
	bne	s1,a5,.L107
.L106:
	mv	a0,s0
	call	lua_pushnil
	lw	a2,4(sp)
	mv	a0,s0
	li	a1,1
	call	lua_seti
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	li	a0,1
	addi	sp,sp,20
	jr	ra
.L103:
	lw	a2,4(sp)
	li	a1,1
	mv	a0,s0
	call	lua_geti
	j	.L106
.L108:
	sw	s1,4(sp)
	j	.L106
	.size	tremove, .-tremove
	.section	.rodata.tconcat.str1.4,"aMS",@progbits,1
	.align	2
.LC9:
	.string	""
	.section	.text.tconcat,"ax",@progbits
	.align	2
	.type	tconcat, @function
tconcat:
	addi	sp,sp,-2044
	sw	s1,2032(sp)
	sw	ra,2040(sp)
	sw	s0,2036(sp)
	li	a1,1
	addi	sp,sp,-48
	mv	s1,a0
	call	lua_type
	li	a5,5
	beq	a0,a5,.L113
	li	a2,5
	li	a1,1
	mv	a0,s1
	call	checktab.part.0
.L113:
	li	a1,1
	mv	a0,s1
	call	luaL_len
	li	a4,-4096
	li	a2,4096
	addi	a3,a4,2028
	addi	a2,a2,-2028
	addi	a4,sp,12
	add	a2,a2,a3
	add	a3,a2,a4
	mv	a5,a0
	lla	a2,.LC9
	li	a1,2
	mv	a0,s1
	sw	a5,0(sp)
	call	luaL_optlstring
	mv	a4,a0
	li	a2,1
	li	a1,3
	mv	a0,s1
	sw	a4,8(sp)
	call	luaL_optinteger
	lw	a5,0(sp)
	li	a1,4
	mv	s0,a0
	mv	a2,a5
	mv	a0,s1
	call	luaL_optinteger
	li	a4,-4096
	li	a2,4096
	addi	a1,a4,2032
	addi	a5,a2,-2028
	add	a5,a5,a1
	addi	a4,sp,12
	sw	a0,4(sp)
	add	a1,a5,a4
	mv	a0,s1
	call	luaL_buffinit
	lw	a5,4(sp)
	bge	s0,a5,.L114
.L115:
	li	a5,-4096
	li	a4,4096
	addi	a5,a5,2032
	addi	a4,a4,-2028
	add	a4,a4,a5
	addi	a5,sp,12
	add	a5,a4,a5
	mv	a2,s0
	mv	a1,a5
	mv	a0,s1
	sw	a5,0(sp)
	call	addfield
	lw	a5,0(sp)
	lw	a2,12(sp)
	lw	a1,8(sp)
	mv	a0,a5
	addi	s0,s0,1
	call	luaL_addlstring
	lw	a5,4(sp)
	bne	a5,s0,.L115
.L116:
	li	a1,-4096
	li	a5,4096
	addi	a1,a1,2032
	addi	a5,a5,-2028
	add	a5,a5,a1
	addi	a4,sp,12
	mv	a2,s0
	add	a1,a5,a4
	mv	a0,s1
	call	addfield
	j	.L117
.L114:
	lw	a5,4(sp)
	beq	s0,a5,.L116
.L117:
	li	a0,-4096
	li	a5,4096
	addi	a0,a0,2032
	addi	a5,a5,-2028
	addi	a4,sp,12
	add	a5,a5,a0
	add	a0,a5,a4
	call	luaL_pushresult
	addi	sp,sp,48
	lw	ra,2040(sp)
	lw	s0,2036(sp)
	lw	s1,2032(sp)
	li	a0,1
	addi	sp,sp,2044
	jr	ra
	.size	tconcat, .-tconcat
	.section	.rodata.tinsert.str1.4,"aMS",@progbits,1
	.align	2
.LC10:
	.string	"wrong number of arguments to 'insert'"
	.section	.text.tinsert,"ax",@progbits
	.align	2
	.type	tinsert, @function
tinsert:
	addi	sp,sp,-20
	li	a1,1
	sw	s0,12(sp)
	sw	ra,16(sp)
	sw	s1,8(sp)
	mv	s0,a0
	call	lua_type
	li	a5,5
	beq	a0,a5,.L121
	li	a2,7
	li	a1,1
	mv	a0,s0
	call	checktab.part.0
.L121:
	li	a1,1
	mv	a0,s0
	call	luaL_len
	mv	s1,a0
	mv	a0,s0
	call	lua_gettop
	li	a4,2
	addi	s1,s1,1
	beq	a0,a4,.L122
	li	a4,3
	bne	a0,a4,.L123
	li	a1,2
	mv	a0,s0
	call	luaL_checkinteger
	sw	a0,4(sp)
	ble	a0,zero,.L124
	blt	s1,a0,.L124
.L125:
	lw	a5,4(sp)
	ble	s1,a5,.L127
.L126:
	sw	s1,0(sp)
	addi	s1,s1,-1
	li	a1,1
	mv	a2,s1
	mv	a0,s0
	call	lua_geti
	lw	a4,0(sp)
	li	a1,1
	mv	a0,s0
	mv	a2,a4
	call	lua_seti
	lw	a5,4(sp)
	bgt	s1,a5,.L126
	mv	s1,a5
.L122:
	mv	a0,s0
	mv	a2,s1
	li	a1,1
	call	lua_seti
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	li	a0,0
	addi	sp,sp,20
	jr	ra
.L124:
	lla	a2,.LC8
	li	a1,2
	mv	a0,s0
	call	luaL_argerror
	j	.L125
.L123:
	mv	a0,s0
	lw	s0,12(sp)
	lw	ra,16(sp)
	lw	s1,8(sp)
	lla	a1,.LC10
	addi	sp,sp,20
	tail	luaL_error
.L127:
	lw	s1,4(sp)
	j	.L122
	.size	tinsert, .-tinsert
	.section	.rodata.tmove.str1.4,"aMS",@progbits,1
	.align	2
.LC11:
	.string	"too many elements to move"
	.align	2
.LC12:
	.string	"destination wrap around"
	.section	.text.tmove,"ax",@progbits
	.align	2
	.type	tmove, @function
tmove:
	addi	sp,sp,-28
	li	a1,2
	sw	ra,24(sp)
	sw	s0,20(sp)
	sw	s1,16(sp)
	mv	s0,a0
	call	luaL_checkinteger
	mv	a5,a0
	li	a1,3
	mv	a0,s0
	sw	a5,0(sp)
	call	luaL_checkinteger
	mv	a5,a0
	li	a1,4
	mv	a0,s0
	sw	a5,4(sp)
	call	luaL_checkinteger
	mv	a5,a0
	li	a1,5
	mv	a0,s0
	sw	a5,8(sp)
	call	lua_type
	sgt	a5,a0,zero
	li	a1,1
	mv	a0,s0
	slli	s1,a5,2
	call	lua_type
	li	a5,5
	addi	s1,s1,1
	beq	a0,a5,.L132
	li	a2,1
	li	a1,1
	mv	a0,s0
	call	checktab.part.0
.L132:
	mv	a1,s1
	mv	a0,s0
	call	lua_type
	li	a5,5
	beq	a0,a5,.L133
	li	a2,2
	mv	a1,s1
	mv	a0,s0
	call	checktab.part.0
.L133:
	lw	a4,0(sp)
	lw	a3,4(sp)
	bgt	a4,a3,.L134
	ble	a4,zero,.L149
.L135:
	lw	a5,4(sp)
	lw	a4,0(sp)
	lw	a3,8(sp)
	sub	a4,a5,a4
	li	a5,-2147483648
	xori	a5,a5,-1
	sub	a5,a5,a4
	blt	a5,a3,.L150
	lw	a5,4(sp)
	lw	a3,8(sp)
	bge	a5,a3,.L137
.L139:
	lw	a5,0(sp)
	addi	a3,a5,1
	add	a4,a3,a4
	sw	a4,4(sp)
	lw	a4,8(sp)
	sub	a4,a4,a5
	sw	a4,8(sp)
.L138:
	mv	a2,a5
	li	a1,1
	mv	a0,s0
	sw	a5,0(sp)
	call	lua_geti
	lw	a5,0(sp)
	lw	a4,8(sp)
	mv	a1,s1
	mv	a0,s0
	add	a2,a4,a5
	addi	a5,a5,1
	sw	a5,0(sp)
	call	lua_seti
	lw	a4,4(sp)
	lw	a5,0(sp)
	bne	a5,a4,.L138
.L134:
	mv	a0,s0
	mv	a1,s1
	call	lua_pushvalue
	lw	ra,24(sp)
	lw	s0,20(sp)
	lw	s1,16(sp)
	li	a0,1
	addi	sp,sp,28
	jr	ra
.L137:
	lw	a5,0(sp)
	lw	a3,8(sp)
	bge	a5,a3,.L139
	li	a5,1
	beq	s1,a5,.L141
	li	a3,0
	li	a2,5
	li	a1,1
	mv	a0,s0
	sw	a4,4(sp)
	call	lua_compare
	lw	a4,4(sp)
	beq	a0,zero,.L139
.L141:
	lw	a5,0(sp)
	li	a1,1
	mv	a0,s0
	add	a2,a5,a4
	sw	a4,4(sp)
	call	lua_geti
	lw	a4,4(sp)
	lw	a5,8(sp)
	mv	a1,s1
	mv	a0,s0
	add	a2,a5,a4
	addi	a4,a4,-1
	sw	a4,4(sp)
	call	lua_seti
	lw	a4,4(sp)
	li	a5,-1
	bne	a4,a5,.L141
	j	.L134
.L149:
	li	a5,-2147483648
	xori	a5,a5,-2
	add	a5,a4,a5
	bge	a5,a3,.L135
	lla	a2,.LC11
	li	a1,3
	mv	a0,s0
	call	luaL_argerror
	j	.L135
.L150:
	lla	a2,.LC12
	li	a1,4
	mv	a0,s0
	sw	a4,12(sp)
	call	luaL_argerror
	lw	a5,4(sp)
	lw	a3,8(sp)
	lw	a4,12(sp)
	bge	a5,a3,.L137
	j	.L139
	.size	tmove, .-tmove
	.section	.text.luaopen_table,"ax",@progbits
	.align	2
	.globl	luaopen_table
	.hidden	luaopen_table
	.type	luaopen_table, @function
luaopen_table:
	addi	sp,sp,-12
	li	a2,68
	li	a1,503
	sw	ra,8(sp)
	sw	s0,4(sp)
	mv	s0,a0
	call	luaL_checkversion_
	mv	a0,s0
	li	a2,7
	li	a1,0
	call	lua_createtable
	mv	a0,s0
	li	a2,0
	lla	a1,.LANCHOR0
	call	luaL_setfuncs
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
	.size	luaopen_table, .-luaopen_table
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC13:
	.string	"concat"
	.align	2
.LC14:
	.string	"insert"
	.align	2
.LC15:
	.string	"pack"
	.align	2
.LC16:
	.string	"unpack"
	.align	2
.LC17:
	.string	"remove"
	.align	2
.LC18:
	.string	"move"
	.align	2
.LC19:
	.string	"sort"
	.section	.rodata.tab_funcs,"a"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	tab_funcs, @object
	.size	tab_funcs, 64
tab_funcs:
	.word	.LC13
	.word	tconcat
	.word	.LC14
	.word	tinsert
	.word	.LC15
	.word	pack
	.word	.LC16
	.word	unpack
	.word	.LC17
	.word	tremove
	.word	.LC18
	.word	tmove
	.word	.LC19
	.word	sort
	.word	0
	.word	0
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
