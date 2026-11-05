#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"lutf8lib.c"
	.option nopic
	.text
	.section	.text.utf8_decode,"ax",@progbits
	.align	2
	.type	utf8_decode, @function
utf8_decode:
	lbu	a4,0(a0)
	li	a5,127
	bgtu	a4,a5,.L23
	beq	a1,zero,.L18
	sw	a4,0(a1)
.L18:
	addi	a0,a0,1
	ret
.L23:
	andi	a5,a4,64
	beq	a5,zero,.L6
	addi	sp,sp,-4
	sw	s0,0(sp)
	li	a2,0
	li	a3,0
	li	s0,128
	j	.L4
.L25:
	or	a3,a5,a3
	beq	t2,zero,.L24
.L4:
	addi	a2,a2,1
	add	t1,a0,a2
	lbu	a5,0(t1)
	slli	a4,a4,1
	slli	a3,a3,6
	andi	t0,a5,192
	andi	t2,a4,64
	andi	a5,a5,63
	beq	t0,s0,.L25
.L10:
	lw	s0,0(sp)
	li	a0,0
	addi	sp,sp,4
	jr	ra
.L24:
	slli	a5,a2,2
	add	a0,a5,a2
	andi	a4,a4,127
	sll	a4,a4,a0
	li	a0,3
	or	a4,a4,a3
	bgt	a2,a0,.L10
	li	a3,1114112
	bgeu	a4,a3,.L10
	lla	a3,.LANCHOR0
	add	a5,a3,a5
	lw	a5,0(a5)
	bleu	a4,a5,.L10
	mv	a0,t1
	beq	a1,zero,.L5
	sw	a4,0(a1)
.L5:
	lw	s0,0(sp)
	addi	a0,a0,1
	addi	sp,sp,4
	jr	ra
.L6:
	li	a0,0
	ret
	.size	utf8_decode, .-utf8_decode
	.section	.text.iter_codes,"ax",@progbits
	.align	2
	.type	iter_codes, @function
iter_codes:
	addi	sp,sp,-12
	li	a2,0
	li	a1,1
	sw	ra,8(sp)
	sw	s0,4(sp)
	mv	s0,a0
	call	luaL_checklstring
	li	a2,0
	mv	a0,s0
	lla	a1,iter_aux
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
	.size	iter_codes, .-iter_codes
	.section	.rodata.iter_aux.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"invalid UTF-8 code"
	.section	.text.iter_aux,"ax",@progbits
	.align	2
	.type	iter_aux, @function
iter_aux:
	addi	sp,sp,-24
	addi	a2,sp,4
	li	a1,1
	sw	ra,20(sp)
	sw	s1,12(sp)
	sw	s0,16(sp)
	mv	s1,a0
	call	luaL_checklstring
	mv	a4,a0
	li	a2,0
	li	a1,2
	mv	a0,s1
	sw	a4,0(sp)
	call	lua_tointegerx
	addi	a5,a0,-1
	lw	a4,0(sp)
	blt	a5,zero,.L29
	lw	a2,4(sp)
	mv	s0,a0
	li	a0,0
	ble	a2,a5,.L28
	add	a5,a4,s0
	lbu	a5,0(a5)
	li	a3,128
	andi	a5,a5,192
	bne	a5,a3,.L31
.L32:
	addi	s0,s0,1
	add	a5,a4,s0
	lbu	a5,0(a5)
	andi	a5,a5,192
	beq	a5,a3,.L32
.L31:
	li	a0,0
	bge	s0,a2,.L28
	addi	a1,sp,8
	add	a0,a4,s0
	call	utf8_decode
	beq	a0,zero,.L33
	lbu	a5,0(a0)
	li	a4,128
	andi	a5,a5,192
	beq	a5,a4,.L33
	addi	a1,s0,1
	mv	a0,s1
	call	lua_pushinteger
	lw	a1,8(sp)
	mv	a0,s1
	call	lua_pushinteger
	li	a0,2
.L28:
	lw	ra,20(sp)
	lw	s0,16(sp)
	lw	s1,12(sp)
	addi	sp,sp,24
	jr	ra
.L29:
	lw	a2,4(sp)
	li	s0,0
	j	.L31
.L33:
	mv	a0,s1
	lla	a1,.LC0
	call	luaL_error
	lw	ra,20(sp)
	lw	s0,16(sp)
	lw	s1,12(sp)
	addi	sp,sp,24
	jr	ra
	.size	iter_aux, .-iter_aux
	.section	.rodata.byteoffset.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"position out of range"
	.align	2
.LC2:
	.string	"initial position is a continuation byte"
	.section	.text.byteoffset,"ax",@progbits
	.align	2
	.type	byteoffset, @function
byteoffset:
	addi	sp,sp,-24
	addi	a2,sp,8
	li	a1,1
	sw	ra,20(sp)
	sw	s1,12(sp)
	sw	s0,16(sp)
	mv	s1,a0
	call	luaL_checklstring
	mv	a4,a0
	li	a1,2
	mv	a0,s1
	sw	a4,0(sp)
	call	luaL_checkinteger
	lw	a4,0(sp)
	mv	a3,a0
	li	a2,1
	bge	a0,zero,.L44
	lw	a2,8(sp)
	addi	a2,a2,1
.L44:
	li	a1,3
	mv	a0,s1
	sw	a3,4(sp)
	sw	a4,0(sp)
	call	luaL_optinteger
	lw	a5,8(sp)
	lw	a4,0(sp)
	lw	a3,4(sp)
	mv	s0,a0
	bge	a0,zero,.L45
	neg	a2,a0
	bgeu	a5,a2,.L46
	lla	a2,.LC1
	li	a1,3
	mv	a0,s1
	sw	a3,0(sp)
	sw	a4,4(sp)
	call	luaL_argerror
	lw	a3,0(sp)
	bne	a3,zero,.L86
.L67:
	li	a1,1
	j	.L47
.L46:
	add	s0,a5,a0
	addi	s0,s0,1
.L45:
	ble	s0,zero,.L49
	addi	s0,s0,-1
	blt	a5,s0,.L49
	add	a5,a4,s0
	bne	a3,zero,.L48
.L90:
	li	a3,128
	bgt	s0,zero,.L52
	j	.L79
.L54:
	addi	s0,s0,-1
	beq	s0,zero,.L67
.L52:
	add	a5,a4,s0
	lbu	a5,0(a5)
	andi	a5,a5,192
	beq	a5,a3,.L54
.L79:
	addi	a1,s0,1
.L47:
	mv	a0,s1
	call	lua_pushinteger
	lw	ra,20(sp)
	lw	s0,16(sp)
	lw	s1,12(sp)
	li	a0,1
	addi	sp,sp,24
	jr	ra
.L86:
	lw	a4,4(sp)
	li	s0,0
	mv	a5,a4
.L48:
	lbu	a5,0(a5)
	li	a2,128
	andi	a5,a5,192
	beq	a5,a2,.L87
	li	a2,128
	blt	a3,zero,.L56
.L91:
	addi	a1,a3,-1
	beq	a1,zero,.L79
	lw	a0,8(sp)
	li	a3,128
.L62:
	ble	a0,s0,.L60
.L63:
	mv	a2,s0
	addi	s0,s0,1
	add	a5,a4,s0
	lbu	a5,0(a5)
	andi	a5,a5,192
	beq	a5,a3,.L63
	addi	a1,a1,-1
	bne	a1,zero,.L62
	addi	a1,a2,2
	j	.L47
.L88:
	addi	a3,a3,1
	beq	a3,zero,.L79
.L56:
	bgt	s0,zero,.L59
	j	.L60
.L89:
	lbu	a5,0(a5)
	andi	a5,a5,192
	bne	a5,a2,.L88
.L59:
	addi	s0,s0,-1
	add	a5,a4,s0
	bne	s0,zero,.L89
	addi	a3,a3,1
	bne	a3,zero,.L56
	j	.L79
.L60:
	mv	a0,s1
	call	lua_pushnil
	lw	ra,20(sp)
	lw	s0,16(sp)
	lw	s1,12(sp)
	li	a0,1
	addi	sp,sp,24
	jr	ra
.L49:
	lla	a2,.LC1
	li	a1,3
	mv	a0,s1
	sw	a3,4(sp)
	sw	a4,0(sp)
	call	luaL_argerror
	lw	a4,0(sp)
	lw	a3,4(sp)
	add	a5,a4,s0
	bne	a3,zero,.L48
	j	.L90
.L87:
	lla	a1,.LC2
	mv	a0,s1
	sw	a3,4(sp)
	sw	a4,0(sp)
	call	luaL_error
	lw	a3,4(sp)
	lw	a4,0(sp)
	li	a2,128
	bge	a3,zero,.L91
	j	.L56
	.size	byteoffset, .-byteoffset
	.section	.rodata.utflen.str1.4,"aMS",@progbits,1
	.align	2
.LC3:
	.string	"initial position out of string"
	.align	2
.LC4:
	.string	"final position out of string"
	.section	.text.utflen,"ax",@progbits
	.align	2
	.type	utflen, @function
utflen:
	addi	sp,sp,-28
	addi	a2,sp,12
	li	a1,1
	sw	ra,24(sp)
	sw	s0,20(sp)
	sw	s1,16(sp)
	sw	a0,8(sp)
	mv	s1,a0
	call	luaL_checklstring
	mv	s0,a0
	li	a2,1
	mv	a0,s1
	li	a1,2
	call	luaL_optinteger
	lw	a4,12(sp)
	mv	s1,a0
	bge	a0,zero,.L93
	neg	a3,a0
	bgeu	a4,a3,.L110
	lw	a0,8(sp)
	li	a2,-1
	li	a1,3
	call	luaL_optinteger
	lw	a5,12(sp)
	bge	a0,zero,.L111
	neg	a4,a0
	bltu	a5,a4,.L107
	add	a5,a5,a0
	sw	a5,4(sp)
	li	s1,0
	j	.L97
.L110:
	add	a4,a4,a0
	addi	s1,a4,1
.L93:
	lw	a0,8(sp)
	li	a2,-1
	li	a1,3
	call	luaL_optinteger
	lw	a4,12(sp)
	bge	a0,zero,.L112
	li	a5,-1
	neg	a3,a0
	sw	a5,4(sp)
	bltu	a4,a3,.L96
	add	a5,a4,a0
	sw	a5,4(sp)
.L96:
	ble	s1,zero,.L97
	addi	s1,s1,-1
	bge	a4,s1,.L98
.L97:
	lw	a0,8(sp)
	lla	a2,.LC3
	li	a1,2
	call	luaL_argerror
	lw	a4,12(sp)
.L98:
	lw	a5,4(sp)
	ble	a4,a5,.L113
.L99:
	lw	a5,4(sp)
	li	a4,0
	ble	s1,a5,.L103
	j	.L100
.L101:
	lw	a5,4(sp)
	sub	s1,a0,s0
	addi	a4,a4,1
	bgt	s1,a5,.L100
.L103:
	add	a0,s0,s1
	li	a1,0
	sw	a4,0(sp)
	call	utf8_decode
	lw	a4,0(sp)
	bne	a0,zero,.L101
	lw	s0,8(sp)
	mv	a0,s0
	call	lua_pushnil
	mv	a0,s0
	addi	a1,s1,1
	call	lua_pushinteger
	lw	ra,24(sp)
	lw	s0,20(sp)
	lw	s1,16(sp)
	li	a0,2
	addi	sp,sp,28
	jr	ra
.L112:
	addi	a5,a0,-1
	sw	a5,4(sp)
	j	.L96
.L100:
	lw	a0,8(sp)
	mv	a1,a4
	call	lua_pushinteger
	lw	ra,24(sp)
	lw	s0,20(sp)
	lw	s1,16(sp)
	li	a0,1
	addi	sp,sp,28
	jr	ra
.L113:
	lw	a0,8(sp)
	lla	a2,.LC4
	li	a1,3
	call	luaL_argerror
	j	.L99
.L111:
	addi	a5,a0,-1
	sw	a5,4(sp)
	li	s1,0
	j	.L97
.L107:
	li	a5,-1
	sw	a5,4(sp)
	li	s1,0
	j	.L97
	.size	utflen, .-utflen
	.section	.rodata.codepoint.str1.4,"aMS",@progbits,1
	.align	2
.LC5:
	.string	"out of range"
	.align	2
.LC6:
	.string	"string slice too long"
	.section	.text.codepoint,"ax",@progbits
	.align	2
	.type	codepoint, @function
codepoint:
	addi	sp,sp,-28
	addi	a2,sp,8
	li	a1,1
	sw	ra,24(sp)
	sw	s1,16(sp)
	sw	s0,20(sp)
	mv	s1,a0
	call	luaL_checklstring
	mv	a5,a0
	li	a2,1
	li	a1,2
	mv	a0,s1
	sw	a5,0(sp)
	call	luaL_optinteger
	lw	a4,8(sp)
	mv	a5,a0
	bge	a0,zero,.L115
	neg	a3,a0
	bgeu	a4,a3,.L131
	li	a2,0
	li	a1,3
	mv	a0,s1
	call	luaL_optinteger
	lw	a3,8(sp)
	mv	s0,a0
	li	a5,0
	bge	a0,zero,.L125
	neg	a2,a0
	bltu	a3,a2,.L128
	add	a3,a3,a0
	addi	s0,a3,1
.L125:
	lla	a2,.LC5
	li	a1,2
	mv	a0,s1
	sw	a5,4(sp)
	call	luaL_argerror
	lw	a3,8(sp)
	lw	a5,4(sp)
	blt	a3,s0,.L132
.L119:
	blt	s0,a5,.L120
.L134:
	li	a3,-2147483648
	sub	a1,s0,a5
	xori	a3,a3,-1
	beq	a1,a3,.L133
	lla	a2,.LC6
	addi	a1,a1,1
	mv	a0,s1
	sw	a5,4(sp)
	call	luaL_checkstack
	lw	a5,4(sp)
	lw	a3,0(sp)
	addi	a5,a5,-1
	add	a4,a3,s0
	sw	a4,4(sp)
	add	a5,a3,a5
	bleu	a4,a5,.L120
	li	s0,0
	j	.L124
.L123:
	lw	a1,12(sp)
	sw	a5,0(sp)
	addi	s0,s0,1
	call	lua_pushinteger
	lw	a4,4(sp)
	lw	a5,0(sp)
	bleu	a4,a5,.L114
.L124:
	mv	a0,a5
	addi	a1,sp,12
	call	utf8_decode
	mv	a5,a0
	mv	a0,s1
	bne	a5,zero,.L123
	lla	a1,.LC0
	call	luaL_error
	mv	s0,a0
.L114:
	lw	ra,24(sp)
	mv	a0,s0
	lw	s0,20(sp)
	lw	s1,16(sp)
	addi	sp,sp,28
	jr	ra
.L131:
	add	a4,a4,a0
	addi	a5,a4,1
.L115:
	mv	a2,a5
	li	a1,3
	mv	a0,s1
	sw	a5,4(sp)
	call	luaL_optinteger
	lw	a5,4(sp)
	mv	s0,a0
	bge	a0,zero,.L117
	lw	a3,8(sp)
	neg	a2,a0
	bltu	a3,a2,.L126
	add	a3,a3,a0
	addi	s0,a3,1
.L117:
	ble	a5,zero,.L125
	lw	a3,8(sp)
	bge	a3,s0,.L119
.L132:
	lla	a2,.LC5
	li	a1,3
	mv	a0,s1
	sw	a5,4(sp)
	call	luaL_argerror
	lw	a5,4(sp)
	bge	s0,a5,.L134
.L120:
	li	s0,0
	lw	ra,24(sp)
	mv	a0,s0
	lw	s0,20(sp)
	lw	s1,16(sp)
	addi	sp,sp,28
	jr	ra
.L126:
	li	s0,0
	j	.L117
.L133:
	mv	a0,s1
	lla	a1,.LC6
	call	luaL_error
	mv	s0,a0
	lw	ra,24(sp)
	mv	a0,s0
	lw	s0,20(sp)
	lw	s1,16(sp)
	addi	sp,sp,28
	jr	ra
.L128:
	li	s0,0
	j	.L125
	.size	codepoint, .-codepoint
	.section	.rodata.utfchar.str1.4,"aMS",@progbits,1
	.align	2
.LC7:
	.string	"value out of range"
	.align	2
.LC8:
	.string	"%U"
	.section	.text.utfchar,"ax",@progbits
	.align	2
	.type	utfchar, @function
utfchar:
	addi	sp,sp,-2044
	sw	s1,2032(sp)
	sw	ra,2040(sp)
	sw	s0,2036(sp)
	addi	sp,sp,-44
	mv	s1,a0
	call	lua_gettop
	sw	a0,0(sp)
	li	a5,1
	beq	a0,a5,.L144
	li	a5,-4096
	li	a4,4096
	addi	a5,a5,2032
	addi	a4,a4,-2032
	add	a4,a4,a5
	addi	a5,sp,12
	add	a5,a4,a5
	mv	a1,a5
	mv	a0,s1
	sw	a5,4(sp)
	call	luaL_buffinit
	lw	a5,0(sp)
	ble	a5,zero,.L139
	li	s0,1
	j	.L141
.L140:
	mv	a2,a5
	lla	a1,.LC8
	mv	a0,s1
	call	lua_pushfstring
	lw	a0,4(sp)
	addi	s0,s0,1
	call	luaL_addvalue
	lw	a5,0(sp)
	blt	a5,s0,.L139
.L141:
	mv	a1,s0
	mv	a0,s1
	call	luaL_checkinteger
	li	a4,1114112
	mv	a5,a0
	bltu	a0,a4,.L140
	sw	a0,8(sp)
	mv	a1,s0
	lla	a2,.LC7
	mv	a0,s1
	call	luaL_argerror
	lw	a5,8(sp)
	j	.L140
.L139:
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
	lw	s0,2036(sp)
	lw	s1,2032(sp)
	li	a0,1
	addi	sp,sp,2044
	jr	ra
.L144:
	li	a1,1
	mv	a0,s1
	call	luaL_checkinteger
	li	a5,1114112
	mv	s0,a0
	bgeu	a0,a5,.L145
.L137:
	mv	a2,s0
	mv	a0,s1
	lla	a1,.LC8
	call	lua_pushfstring
	addi	sp,sp,44
	lw	ra,2040(sp)
	lw	s0,2036(sp)
	lw	s1,2032(sp)
	li	a0,1
	addi	sp,sp,2044
	jr	ra
.L145:
	lla	a2,.LC7
	li	a1,1
	mv	a0,s1
	call	luaL_argerror
	j	.L137
	.size	utfchar, .-utfchar
	.section	.rodata.luaopen_utf8.str1.4,"aMS",@progbits,1
	.align	2
.LC10:
	.string	"charpattern"
	.section	.text.luaopen_utf8,"ax",@progbits
	.align	2
	.globl	luaopen_utf8
	.hidden	luaopen_utf8
	.type	luaopen_utf8, @function
luaopen_utf8:
	addi	sp,sp,-12
	li	a2,68
	li	a1,503
	sw	ra,8(sp)
	sw	s0,4(sp)
	mv	s0,a0
	call	luaL_checkversion_
	mv	a0,s0
	li	a2,6
	li	a1,0
	call	lua_createtable
	mv	a0,s0
	li	a2,0
	lla	a1,.LANCHOR1
	call	luaL_setfuncs
	li	a2,14
	lla	a1,.LANCHOR2
	mv	a0,s0
	call	lua_pushlstring
	mv	a0,s0
	lla	a2,.LC10
	li	a1,-2
	call	lua_setfield
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
	.size	luaopen_utf8, .-luaopen_utf8
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC11:
	.string	"offset"
	.align	2
.LC12:
	.string	"codepoint"
	.align	2
.LC13:
	.string	"char"
	.align	2
.LC14:
	.string	"len"
	.align	2
.LC15:
	.string	"codes"
	.section	.rodata
	.align	2
	.set	.LANCHOR2,. + 0
.LC9:
	.string	"["
	.string	"-\177\302-\364][\200-\277]*"
	.section	.rodata.funcs,"a"
	.align	2
	.set	.LANCHOR1,. + 0
	.type	funcs, @object
	.size	funcs, 56
funcs:
	.word	.LC11
	.word	byteoffset
	.word	.LC12
	.word	codepoint
	.word	.LC13
	.word	utfchar
	.word	.LC14
	.word	utflen
	.word	.LC15
	.word	iter_codes
	.word	.LC10
	.word	0
	.word	0
	.word	0
	.section	.rodata.limits.0,"a"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	limits.0, @object
	.size	limits.0, 16
limits.0:
	.word	255
	.word	127
	.word	2047
	.word	65535
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
