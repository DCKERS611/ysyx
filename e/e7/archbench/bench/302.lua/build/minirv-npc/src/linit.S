#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"linit.c"
	.option nopic
	.text
	.section	.rodata.luaL_openlibs.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"_G"
	.section	.text.luaL_openlibs,"ax",@progbits
	.align	2
	.globl	luaL_openlibs
	.hidden	luaL_openlibs
	.type	luaL_openlibs, @function
luaL_openlibs:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	mv	s1,a0
	lla	a1,.LC0
	lla	s0,.LANCHOR0
	lla	a2,luaopen_base
	j	.L3
.L6:
	lw	a1,0(s0)
.L3:
	li	a3,1
	mv	a0,s1
	call	luaL_requiref
	li	a1,-2
	mv	a0,s1
	addi	s0,s0,8
	call	lua_settop
	lw	a2,4(s0)
	bne	a2,zero,.L6
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
	.size	luaL_openlibs, .-luaL_openlibs
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"package"
	.align	2
.LC2:
	.string	"coroutine"
	.align	2
.LC3:
	.string	"table"
	.align	2
.LC4:
	.string	"io"
	.align	2
.LC5:
	.string	"os"
	.align	2
.LC6:
	.string	"string"
	.align	2
.LC7:
	.string	"math"
	.align	2
.LC8:
	.string	"utf8"
	.align	2
.LC9:
	.string	"debug"
	.section	.rodata.loadedlibs,"a"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	loadedlibs, @object
	.size	loadedlibs, 88
loadedlibs:
	.word	.LC0
	.word	luaopen_base
	.word	.LC1
	.word	luaopen_package
	.word	.LC2
	.word	luaopen_coroutine
	.word	.LC3
	.word	luaopen_table
	.word	.LC4
	.word	luaopen_io
	.word	.LC5
	.word	luaopen_os
	.word	.LC6
	.word	luaopen_string
	.word	.LC7
	.word	luaopen_math
	.word	.LC8
	.word	luaopen_utf8
	.word	.LC9
	.word	luaopen_debug
	.word	0
	.word	0
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
