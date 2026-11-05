#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"lcorolib.c"
	.option nopic
	.text
	.section	.text.luaB_yieldable,"ax",@progbits
	.align	2
	.type	luaB_yieldable, @function
luaB_yieldable:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	mv	s0,a0
	call	lua_isyieldable
	mv	a1,a0
	mv	a0,s0
	call	lua_pushboolean
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
	.size	luaB_yieldable, .-luaB_yieldable
	.section	.text.luaB_yield,"ax",@progbits
	.align	2
	.type	luaB_yield, @function
luaB_yield:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	lua_gettop
	mv	a1,a0
	mv	a0,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a3,0
	li	a2,0
	addi	sp,sp,12
	tail	lua_yieldk
	.size	luaB_yield, .-luaB_yield
	.section	.rodata.auxresume.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"too many arguments to resume"
	.align	2
.LC1:
	.string	"cannot resume dead coroutine"
	.align	2
.LC2:
	.string	"too many results to resume"
	.section	.text.auxresume,"ax",@progbits
	.align	2
	.type	auxresume, @function
auxresume:
	addi	sp,sp,-16
	sw	s0,8(sp)
	mv	s0,a1
	sw	s1,4(sp)
	mv	a1,a2
	mv	s1,a0
	mv	a0,s0
	sw	a2,0(sp)
	sw	ra,12(sp)
	call	lua_checkstack
	lw	a2,0(sp)
	beq	a0,zero,.L13
	mv	a0,s0
	sw	a2,0(sp)
	call	lua_status
	lw	a2,0(sp)
	beq	a0,zero,.L14
.L9:
	mv	a1,s0
	mv	a0,s1
	sw	a2,0(sp)
	call	lua_xmove
	lw	a2,0(sp)
	mv	a1,s1
	mv	a0,s0
	call	lua_resume
	li	a5,1
	bgtu	a0,a5,.L10
	mv	a0,s0
	call	lua_gettop
	addi	a1,a0,1
	sw	a0,0(sp)
	mv	a0,s1
	call	lua_checkstack
	lw	a2,0(sp)
	beq	a0,zero,.L15
	mv	a1,s1
	mv	a0,s0
	sw	a2,0(sp)
	call	lua_xmove
	lw	a2,0(sp)
.L6:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	mv	a0,a2
	addi	sp,sp,16
	jr	ra
.L14:
	mv	a0,s0
	call	lua_gettop
	lw	a2,0(sp)
	bne	a0,zero,.L9
	lla	a1,.LC1
	mv	a0,s1
	call	lua_pushstring
	li	a2,-1
	j	.L6
.L15:
	not	a1,a2
	mv	a0,s0
	call	lua_settop
	lla	a1,.LC2
	mv	a0,s1
	call	lua_pushstring
	li	a2,-1
	j	.L6
.L10:
	li	a2,1
	mv	a1,s1
	mv	a0,s0
	call	lua_xmove
	li	a2,-1
	j	.L6
.L13:
	lla	a1,.LC0
	mv	a0,s1
	call	lua_pushstring
	li	a2,-1
	j	.L6
	.size	auxresume, .-auxresume
	.section	.text.luaB_corunning,"ax",@progbits
	.align	2
	.type	luaB_corunning, @function
luaB_corunning:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	mv	s0,a0
	call	lua_pushthread
	mv	a1,a0
	mv	a0,s0
	call	lua_pushboolean
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,2
	addi	sp,sp,12
	jr	ra
	.size	luaB_corunning, .-luaB_corunning
	.section	.text.luaB_cocreate,"ax",@progbits
	.align	2
	.type	luaB_cocreate, @function
luaB_cocreate:
	addi	sp,sp,-12
	li	a2,6
	li	a1,1
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	mv	s0,a0
	call	luaL_checktype
	mv	a0,s0
	call	lua_newthread
	mv	s1,a0
	li	a1,1
	mv	a0,s0
	call	lua_pushvalue
	mv	a0,s0
	mv	a1,s1
	li	a2,1
	call	lua_xmove
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
	.size	luaB_cocreate, .-luaB_cocreate
	.section	.text.luaB_auxwrap,"ax",@progbits
	.align	2
	.type	luaB_auxwrap, @function
luaB_auxwrap:
	li	a1,-999424
	addi	sp,sp,-12
	addi	a1,a1,-1577
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	mv	s0,a0
	call	lua_tothread
	mv	s1,a0
	mv	a0,s0
	call	lua_gettop
	mv	a2,a0
	mv	a1,s1
	mv	a0,s0
	call	auxresume
	blt	a0,zero,.L24
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L24:
	li	a1,-1
	mv	a0,s0
	call	lua_type
	li	a5,4
	beq	a0,a5,.L25
.L22:
	mv	a0,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	tail	lua_error
.L25:
	mv	a0,s0
	li	a1,1
	call	luaL_where
	mv	a0,s0
	li	a1,-2
	li	a2,1
	call	lua_rotate
	li	a1,2
	mv	a0,s0
	call	lua_concat
	j	.L22
	.size	luaB_auxwrap, .-luaB_auxwrap
	.section	.rodata.luaB_costatus.str1.4,"aMS",@progbits,1
	.align	2
.LC3:
	.string	"thread expected"
	.align	2
.LC4:
	.string	"running"
	.align	2
.LC5:
	.string	"suspended"
	.align	2
.LC6:
	.string	"normal"
	.align	2
.LC7:
	.string	"dead"
	.section	.text.luaB_costatus,"ax",@progbits
	.align	2
	.type	luaB_costatus, @function
luaB_costatus:
	addi	sp,sp,-112
	li	a1,1
	sw	s0,104(sp)
	sw	s1,100(sp)
	sw	ra,108(sp)
	mv	s1,a0
	call	lua_tothread
	mv	s0,a0
	beq	a0,zero,.L36
.L27:
	beq	s1,s0,.L37
	mv	a0,s0
	call	lua_status
	beq	a0,zero,.L30
	li	a5,1
	bne	a0,a5,.L31
.L34:
	mv	a0,s1
	lla	a1,.LC5
	call	lua_pushstring
	lw	ra,108(sp)
	lw	s0,104(sp)
	lw	s1,100(sp)
	li	a0,1
	addi	sp,sp,112
	jr	ra
.L30:
	mv	a2,sp
	li	a1,0
	mv	a0,s0
	call	lua_getstack
	bgt	a0,zero,.L38
	mv	a0,s0
	call	lua_gettop
	bne	a0,zero,.L34
.L31:
	mv	a0,s1
	lla	a1,.LC7
	call	lua_pushstring
	lw	ra,108(sp)
	lw	s0,104(sp)
	lw	s1,100(sp)
	li	a0,1
	addi	sp,sp,112
	jr	ra
.L37:
	mv	a0,s1
	lla	a1,.LC4
	call	lua_pushstring
	lw	ra,108(sp)
	lw	s0,104(sp)
	lw	s1,100(sp)
	li	a0,1
	addi	sp,sp,112
	jr	ra
.L36:
	lla	a2,.LC3
	li	a1,1
	mv	a0,s1
	call	luaL_argerror
	j	.L27
.L38:
	mv	a0,s1
	lla	a1,.LC6
	call	lua_pushstring
	lw	ra,108(sp)
	lw	s0,104(sp)
	lw	s1,100(sp)
	li	a0,1
	addi	sp,sp,112
	jr	ra
	.size	luaB_costatus, .-luaB_costatus
	.section	.text.luaB_coresume,"ax",@progbits
	.align	2
	.type	luaB_coresume, @function
luaB_coresume:
	addi	sp,sp,-12
	li	a1,1
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	mv	s1,a0
	call	lua_tothread
	mv	s0,a0
	beq	a0,zero,.L44
.L40:
	mv	a0,s1
	call	lua_gettop
	addi	a2,a0,-1
	mv	a1,s0
	mv	a0,s1
	call	auxresume
	mv	s0,a0
	blt	a0,zero,.L45
	mv	a0,s1
	li	a1,1
	call	lua_pushboolean
	mv	a0,s1
	not	a1,s0
	li	a2,1
	call	lua_rotate
	lw	ra,8(sp)
	addi	a0,s0,1
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L45:
	mv	a0,s1
	li	a1,0
	call	lua_pushboolean
	mv	a0,s1
	li	a2,1
	li	a1,-2
	call	lua_rotate
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	li	a0,2
	addi	sp,sp,12
	jr	ra
.L44:
	lla	a2,.LC3
	li	a1,1
	mv	a0,s1
	call	luaL_argerror
	j	.L40
	.size	luaB_coresume, .-luaB_coresume
	.section	.text.luaB_cowrap,"ax",@progbits
	.align	2
	.type	luaB_cowrap, @function
luaB_cowrap:
	addi	sp,sp,-12
	li	a2,6
	li	a1,1
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	mv	s0,a0
	call	luaL_checktype
	mv	a0,s0
	call	lua_newthread
	mv	s1,a0
	li	a1,1
	mv	a0,s0
	call	lua_pushvalue
	mv	a1,s1
	mv	a0,s0
	li	a2,1
	call	lua_xmove
	mv	a0,s0
	li	a2,1
	lla	a1,luaB_auxwrap
	call	lua_pushcclosure
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
	.size	luaB_cowrap, .-luaB_cowrap
	.section	.text.luaopen_coroutine,"ax",@progbits
	.align	2
	.globl	luaopen_coroutine
	.hidden	luaopen_coroutine
	.type	luaopen_coroutine, @function
luaopen_coroutine:
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
	.size	luaopen_coroutine, .-luaopen_coroutine
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC8:
	.string	"create"
	.align	2
.LC9:
	.string	"resume"
	.align	2
.LC10:
	.string	"status"
	.align	2
.LC11:
	.string	"wrap"
	.align	2
.LC12:
	.string	"yield"
	.align	2
.LC13:
	.string	"isyieldable"
	.section	.rodata.co_funcs,"a"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	co_funcs, @object
	.size	co_funcs, 64
co_funcs:
	.word	.LC8
	.word	luaB_cocreate
	.word	.LC9
	.word	luaB_coresume
	.word	.LC4
	.word	luaB_corunning
	.word	.LC10
	.word	luaB_costatus
	.word	.LC11
	.word	luaB_cowrap
	.word	.LC12
	.word	luaB_yield
	.word	.LC13
	.word	luaB_yieldable
	.word	0
	.word	0
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
