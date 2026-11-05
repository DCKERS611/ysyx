#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"lua.c"
	.option nopic
	.text
	.section	.rodata.l_message.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"%s: "
	.align	2
.LC1:
	.string	"%s\n"
	.section	.text.l_message,"ax",@progbits
	.align	2
	.type	l_message, @function
l_message:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	mv	s1,a1
	lla	s0,stderr
	beq	a0,zero,.L2
	mv	a2,a0
	lw	a0,0(s0)
	lla	a1,.LC0
	call	fprintf
	lw	a0,0(s0)
	call	fflush
.L2:
	lw	a0,0(s0)
	mv	a2,s1
	lla	a1,.LC1
	call	fprintf
	lw	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	tail	fflush
	.size	l_message, .-l_message
	.section	.text.docall,"ax",@progbits
	.align	2
	.type	docall, @function
docall:
	addi	sp,sp,-20
	sw	ra,16(sp)
	sw	s0,12(sp)
	sw	s1,8(sp)
	mv	s0,a0
	mv	s1,a1
	sw	a2,4(sp)
	call	lua_gettop
	mv	a3,a0
	sub	a3,a3,s1
	mv	a0,s0
	li	a2,0
	lla	a1,msghandler
	sw	a3,0(sp)
	call	lua_pushcclosure
	lw	a3,0(sp)
	li	a2,1
	mv	a0,s0
	mv	a1,a3
	call	lua_rotate
	lla	a1,laction
	li	a0,2
	la a5, .LANCHOR0; sw s0, 0(a5);
	call	signal
	lw	t1,4(sp)
	lw	a3,0(sp)
	li	a5,0
	mv	a2,t1
	li	a4,0
	mv	a1,s1
	mv	a0,s0
	call	lua_pcallk
	mv	s1,a0
	li	a1,0
	li	a0,2
	call	signal
	lw	a3,0(sp)
	mv	a0,s0
	li	a2,-1
	mv	a1,a3
	call	lua_rotate
	mv	a0,s0
	li	a1,-2
	call	lua_settop
	lw	ra,16(sp)
	lw	s0,12(sp)
	mv	a0,s1
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
	.size	docall, .-docall
	.section	.text.laction,"ax",@progbits
	.align	2
	.type	laction, @function
laction:
	addi	sp,sp,-12
	li	a1,0
	sw	ra,8(sp)
	call	signal
	lw	ra,8(sp)
	la a0, .LANCHOR0; lw a0, 0(a0);
	li	a3,1
	li	a2,11
	lla	a1,lstop
	addi	sp,sp,12
	tail	lua_sethook
	.size	laction, .-laction
	.section	.rodata.lstop.str1.4,"aMS",@progbits,1
	.align	2
.LC2:
	.string	"interrupted!"
	.section	.text.lstop,"ax",@progbits
	.align	2
	.type	lstop, @function
lstop:
	addi	sp,sp,-12
	li	a1,0
	li	a3,0
	li	a2,0
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	lua_sethook
	mv	a0,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a1,.LC2
	addi	sp,sp,12
	tail	luaL_error
	.size	lstop, .-lstop
	.section	.rodata.msghandler.str1.4,"aMS",@progbits,1
	.align	2
.LC3:
	.string	"__tostring"
	.align	2
.LC4:
	.string	"(error object is a %s value)"
	.section	.text.msghandler,"ax",@progbits
	.align	2
	.type	msghandler, @function
msghandler:
	addi	sp,sp,-12
	li	a2,0
	li	a1,1
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	lua_tolstring
	mv	a2,a0
	beq	a0,zero,.L21
.L15:
	li	a3,1
	mv	a1,s0
	mv	a0,s0
	call	luaL_traceback
.L17:
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
.L21:
	lla	a2,.LC3
	li	a1,1
	mv	a0,s0
	call	luaL_callmeta
	beq	a0,zero,.L18
	li	a1,-1
	mv	a0,s0
	call	lua_type
	li	a5,4
	beq	a0,a5,.L17
.L18:
	li	a1,1
	mv	a0,s0
	call	lua_type
	mv	a1,a0
	mv	a0,s0
	call	lua_typename
	mv	a2,a0
	lla	a1,.LC4
	mv	a0,s0
	call	lua_pushfstring
	mv	a2,a0
	j	.L15
	.size	msghandler, .-msghandler
	.section	.rodata.print_version.str1.4,"aMS",@progbits,1
	.align	2
.LC5:
	.string	"Lua 5.3.4  Copyright (C) 1994-2017 Lua.org, PUC-Rio"
	.align	2
.LC6:
	.string	"\n"
	.section	.text.print_version,"ax",@progbits
	.align	2
	.type	print_version, @function
print_version:
	addi	sp,sp,-12
	lla	a0,.LC5
	sw	ra,8(sp)
	sw	s0,4(sp)
	call	strlen
	lla	s0,stdout
	lw	a3,0(s0)
	mv	a2,a0
	li	a1,1
	lla	a0,.LC5
	call	fwrite
	lw	a3,0(s0)
	li	a2,1
	li	a1,1
	lla	a0,.LC6
	call	fwrite
	lw	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	fflush
	.size	print_version, .-print_version
	.section	.rodata.pushline.str1.4,"aMS",@progbits,1
	.align	2
.LC7:
	.string	"> "
	.align	2
.LC8:
	.string	">> "
	.align	2
.LC9:
	.string	"return %s"
	.align	2
.LC10:
	.string	"_PROMPT"
	.align	2
.LC11:
	.string	"_PROMPT2"
	.section	.text.pushline,"ax",@progbits
	.align	2
	.type	pushline, @function
pushline:
	addi	sp,sp,-524
	sw	s0,516(sp)
	sw	s1,512(sp)
	sw	ra,520(sp)
	mv	s1,a1
	mv	s0,a0
	beq	a1,zero,.L41
	lla	a1,.LC10
	call	lua_getglobal
	li	a2,0
	li	a1,-1
	mv	a0,s0
	call	lua_tolstring
	beq	a0,zero,.L42
.L30:
	lla	a5,stdout
	lw	a1,0(a5)
	call	fputs
	lla	a5,stdout
	lw	a0,0(a5)
	call	fflush
	la a2, stdin; lw a2, 0(a2);
	li	a1,512
	mv	a0,sp
	call	fgets
	li	a5,0
	beq	a0,zero,.L24
	li	a1,-2
	mv	a0,s0
	call	lua_settop
	mv	a0,sp
	call	strlen
	mv	a2,a0
	beq	a0,zero,.L28
	addi	a5,a0,-1
	add	a4,sp,a5
	lbu	a1,0(a4)
	li	a3,10
	beq	a1,a3,.L43
.L28:
	beq	s1,zero,.L29
.L45:
	lbu	a4,0(sp)
	li	a5,61
	beq	a4,a5,.L44
.L29:
	mv	a1,sp
	mv	a0,s0
	call	lua_pushlstring
	li	a5,1
.L24:
	lw	ra,520(sp)
	lw	s0,516(sp)
	lw	s1,512(sp)
	mv	a0,a5
	addi	sp,sp,524
	jr	ra
.L41:
	lla	a1,.LC11
	call	lua_getglobal
	li	a2,0
	li	a1,-1
	mv	a0,s0
	call	lua_tolstring
	bne	a0,zero,.L30
	lla	a0,.LC8
	j	.L30
.L42:
	lla	a0,.LC7
	j	.L30
.L43:
	sb	zero,0(a4)
	mv	a2,a5
	bne	s1,zero,.L45
	j	.L29
.L44:
	addi	a2,sp,1
	lla	a1,.LC9
	mv	a0,s0
	call	lua_pushfstring
	mv	a5,s1
	j	.L24
	.size	pushline, .-pushline
	.section	.rodata.doREPL.str1.4,"aMS",@progbits,1
	.align	2
.LC12:
	.string	"too many results to print"
	.align	2
.LC13:
	.string	"print"
	.align	2
.LC14:
	.string	"error calling 'print' (%s)"
	.align	2
.LC15:
	.string	"return %s;"
	.align	2
.LC16:
	.string	"=stdin"
	.align	2
.LC17:
	.string	"<eof>"
	.section	.text.doREPL,"ax",@progbits
	.align	2
	.type	doREPL, @function
doREPL:
	addi	sp,sp,-28
	sw	s1,16(sp)
	lla	s1,.LANCHOR1
	lw	a5,0(s1)
	sw	s0,20(sp)
	sw	ra,24(sp)
	sw	a5,4(sp)
	mv	s0,a0
	la a5, .LANCHOR1; sw zero, 0(a5);
.L47:
	li	a1,0
	mv	a0,s0
	call	lua_settop
	li	a1,1
	mv	a0,s0
	call	pushline
	beq	a0,zero,.L52
	li	a1,-1
	li	a2,0
	mv	a0,s0
	call	lua_tolstring
	mv	a2,a0
	lla	a1,.LC15
	mv	a0,s0
	call	lua_pushfstring
	sw	a0,0(sp)
	call	strlen
	lw	a1,0(sp)
	mv	a2,a0
	li	a4,0
	lla	a3,.LC16
	mv	a0,s0
	call	luaL_loadbufferx
	beq	a0,zero,.L70
	li	a1,-3
	mv	a0,s0
	call	lua_settop
.L60:
	addi	a2,sp,8
	li	a1,1
	mv	a0,s0
	call	lua_tolstring
	lw	a2,8(sp)
	mv	a1,a0
	li	a4,0
	lla	a3,.LC16
	mv	a0,s0
	call	luaL_loadbufferx
	li	a4,3
	beq	a0,a4,.L71
	sw	a0,0(sp)
	li	a2,-1
	li	a1,1
	mv	a0,s0
	call	lua_rotate
	li	a1,-2
	mv	a0,s0
	call	lua_settop
	lw	a5,0(sp)
	li	a4,-1
	beq	a5,a4,.L52
	beq	a5,zero,.L54
	j	.L48
.L70:
	li	a2,-1
	mv	a0,s0
	li	a1,-2
	call	lua_rotate
	mv	a0,s0
	li	a1,-2
	call	lua_settop
	mv	a0,s0
	li	a1,1
	li	a2,-1
	call	lua_rotate
	li	a1,-2
	mv	a0,s0
	call	lua_settop
.L54:
	li	a2,-1
	li	a1,0
	mv	a0,s0
	call	docall
	bne	a0,zero,.L48
	mv	a0,s0
	call	lua_gettop
	sw	a0,0(sp)
	ble	a0,zero,.L47
	lla	a2,.LC12
	li	a1,20
	mv	a0,s0
	call	luaL_checkstack
	lla	a1,.LC13
	mv	a0,s0
	call	lua_getglobal
	li	a2,1
	li	a1,1
	mv	a0,s0
	call	lua_rotate
	lw	t1,0(sp)
	li	a5,0
	li	a4,0
	li	a3,0
	li	a2,0
	mv	a1,t1
	mv	a0,s0
	call	lua_pcallk
	beq	a0,zero,.L47
	lw	a5,0(s1)
	li	a1,-1
	li	a2,0
	mv	a0,s0
	sw	a5,0(sp)
	call	lua_tolstring
	mv	a2,a0
	lla	a1,.LC14
	mv	a0,s0
	call	lua_pushfstring
	lw	a5,0(sp)
	mv	a1,a0
	mv	a0,a5
	call	l_message
	j	.L47
.L71:
	addi	a2,sp,12
	li	a1,-1
	mv	a0,s0
	call	lua_tolstring
	lw	a5,12(sp)
	li	a4,4
	bgtu	a5,a4,.L72
.L57:
	mv	a0,s0
	li	a1,1
	li	a2,-1
	call	lua_rotate
	li	a1,-2
	mv	a0,s0
	call	lua_settop
.L48:
	li	a2,0
	mv	a0,s0
	li	a1,-1
	call	lua_tolstring
	mv	a1,a0
	lw	a0,0(s1)
	call	l_message
	li	a1,-2
	mv	a0,s0
	call	lua_settop
	j	.L47
.L72:
	addi	a5,a5,-5
	lla	a1,.LC17
	add	a0,a0,a5
	call	strcmp
	bne	a0,zero,.L57
	mv	a0,s0
	li	a1,-2
	call	lua_settop
	li	a1,0
	mv	a0,s0
	call	pushline
	mv	a5,a0
	lla	a1,.LC6
	mv	a0,s0
	beq	a5,zero,.L57
	call	lua_pushstring
	mv	a0,s0
	li	a2,1
	li	a1,-2
	call	lua_rotate
	li	a1,3
	mv	a0,s0
	call	lua_concat
	j	.L60
.L52:
	mv	a0,s0
	li	a1,0
	call	lua_settop
	lla	s0,stdout
	lw	a3,0(s0)
	li	a2,1
	li	a1,1
	lla	a0,.LC6
	call	fwrite
	lw	a0,0(s0)
	call	fflush
	lw	a5,4(sp)
	lw	ra,24(sp)
	lw	s0,20(sp)
	sw	a5,0(s1)
	lw	s1,16(sp)
	addi	sp,sp,28
	jr	ra
	.size	doREPL, .-doREPL
	.section	.rodata.pmain.str1.4,"aMS",@progbits,1
	.align	2
.LC18:
	.string	"'%s' needs argument\n"
	.align	2
.LC19:
	.string	"unrecognized option '%s'\n"
	.align	2
.LC20:
	.ascii	"usage: %s [options] [script [args]]\nAvailable options are:\n"
	.ascii	"  -e stat  execute string 'sta"
	.string	"t'\n  -i       enter interactive mode after executing 'script'\n  -l name  require library 'name'\n  -v       show version information\n  -E       ignore environment variables\n  --       stop handling options\n  -        stop handling options and execute stdin\n"
	.align	2
.LC21:
	.string	"LUA_NOENV"
	.align	2
.LC22:
	.string	"arg"
	.align	2
.LC23:
	.string	"=(command line)"
	.align	2
.LC24:
	.string	"require"
	.align	2
.LC25:
	.string	"-"
	.align	2
.LC26:
	.string	"--"
	.align	2
.LC27:
	.string	"'arg' is not a table"
	.align	2
.LC28:
	.string	"too many arguments to script"
	.section	.text.pmain,"ax",@progbits
	.align	2
	.type	pmain, @function
pmain:
	addi	sp,sp,-36
	li	a2,0
	li	a1,1
	sw	ra,32(sp)
	sw	s1,24(sp)
	sw	s0,28(sp)
	mv	s1,a0
	call	lua_tointegerx
	mv	a5,a0
	li	a1,2
	mv	a0,s1
	sw	a5,12(sp)
	call	lua_touserdata
	lw	a4,4(a0)
	sw	a0,4(sp)
	beq	a4,zero,.L74
	li	s0,0
	li	t2,1
	li	a3,45
	li	a2,101
	li	t0,108
	li	t1,118
	li	a0,105
	li	a1,69
.L86:
	lbu	a5,0(a4)
	bne	a5,a3,.L168
	lbu	a5,1(a4)
	beq	a5,a2,.L76
	bgtu	a5,a2,.L77
	beq	a5,a3,.L78
	bne	a5,a1,.L180
	lbu	a5,2(a4)
	bne	a5,zero,.L172
	ori	s0,s0,16
	j	.L85
.L77:
	beq	a5,t0,.L81
	bne	a5,t1,.L181
.L82:
	lbu	a5,2(a4)
	bne	a5,zero,.L172
	ori	s0,s0,4
.L85:
	lw	a4,4(sp)
	addi	t2,t2,1
	slli	a5,t2,2
	add	a5,a4,a5
	lw	a4,0(a5)
	bne	a4,zero,.L86
.L168:
	sw	t2,0(sp)
	sw	s0,20(sp)
	j	.L75
.L180:
	sw	t2,0(sp)
	sw	s0,20(sp)
	bne	a5,zero,.L84
.L75:
	li	a2,68
	li	a1,503
	mv	a0,s1
	call	luaL_checkversion_
	lw	a5,4(sp)
	lw	a5,0(a5)
	beq	a5,zero,.L89
	lbu	a4,0(a5)
	beq	a4,zero,.L89
.L130:
	la a4, .LANCHOR1; sw a5, 0(a4);
.L89:
	lw	a4,20(sp)
	andi	a5,a4,4
	andi	s0,a4,16
	bne	a5,zero,.L182
.L94:
	beq	s0,zero,.L95
	mv	a0,s1
	li	a1,1
	call	lua_pushboolean
	li	a1,-999424
	lla	a2,.LC21
	addi	a1,a1,-1576
	mv	a0,s1
	call	lua_setfield
.L95:
	mv	a0,s1
	call	luaL_openlibs
	lw	a5,0(sp)
	lw	s0,12(sp)
	beq	s0,a5,.L96
	addi	a2,a5,1
	sub	a1,s0,a2
	mv	a0,s1
	call	lua_createtable
	lw	a5,0(sp)
	sw	a5,16(sp)
	ble	s0,zero,.L101
.L97:
	lw	a4,16(sp)
	lw	a5,4(sp)
	neg	s0,a4
	mv	a4,s1
	mv	s1,s0
	mv	s0,a4
.L100:
	lw	a1,0(a5)
	mv	a0,s0
	addi	a5,a5,4
	sw	a5,8(sp)
	call	lua_pushstring
	mv	a2,s1
	li	a1,-2
	mv	a0,s0
	call	lua_rawseti
	lw	a5,16(sp)
	lw	a4,12(sp)
	addi	s1,s1,1
	add	a3,a5,s1
	lw	a5,8(sp)
	bgt	a4,a3,.L100
	mv	s1,s0
.L101:
	li	a5,1
	lla	a1,.LC22
	mv	a0,s1
	sw	a5,8(sp)
	call	lua_setglobal
	lw	a4,0(sp)
	lw	a5,8(sp)
	bne	a4,a5,.L98
	j	.L99
.L184:
	li	a2,108
	beq	a3,a2,.L183
.L104:
	lw	a4,0(sp)
	addi	a5,a5,1
	ble	a4,a5,.L99
.L98:
	lw	a3,4(sp)
	slli	a4,a5,2
	li	a2,101
	add	a4,a3,a4
	lw	s0,0(a4)
	lbu	a3,1(s0)
	bne	a3,a2,.L184
	lbu	a3,2(s0)
	bne	a3,zero,.L185
	lw	s0,4(a4)
	addi	a5,a5,1
.L128:
	mv	a0,s0
	sw	a5,8(sp)
	call	strlen
	mv	a2,a0
	li	a4,0
	lla	a3,.LC23
	mv	a1,s0
	mv	a0,s1
	call	luaL_loadbufferx
	lw	a5,8(sp)
	beq	a0,zero,.L105
.L107:
	li	a2,0
	li	a1,-1
	mv	a0,s1
	call	lua_tolstring
	mv	a1,a0
	la a0, .LANCHOR1; lw a0, 0(a0);
	call	l_message
	mv	a0,s1
	li	a1,-2
	call	lua_settop
	lw	ra,32(sp)
	lw	s0,28(sp)
	lw	s1,24(sp)
	li	a0,0
	addi	sp,sp,36
	jr	ra
.L181:
	bne	a5,a0,.L172
	ori	s0,s0,2
	j	.L82
.L183:
	lbu	a3,2(s0)
	bne	a3,zero,.L186
	lw	s0,4(a4)
	addi	a5,a5,1
.L129:
	lla	a1,.LC24
	mv	a0,s1
	sw	a5,8(sp)
	call	lua_getglobal
	mv	a1,s0
	mv	a0,s1
	call	lua_pushstring
	li	a2,1
	li	a1,1
	mv	a0,s1
	call	docall
	bne	a0,zero,.L107
	mv	a1,s0
	mv	a0,s1
	call	lua_setglobal
	lw	a5,8(sp)
	lw	a4,0(sp)
	addi	a5,a5,1
	bgt	a4,a5,.L98
.L99:
	lw	a5,12(sp)
	lw	a4,0(sp)
	bgt	a5,a4,.L187
	lw	a5,20(sp)
	andi	a5,a5,2
	bne	a5,zero,.L177
	lw	a5,12(sp)
	lw	a4,0(sp)
	beq	a5,a4,.L188
.L116:
	mv	a0,s1
	li	a1,1
	call	lua_pushboolean
	li	a0,1
.L191:
	lw	ra,32(sp)
	lw	s0,28(sp)
	lw	s1,24(sp)
	addi	sp,sp,36
	jr	ra
.L185:
	addi	s0,s0,2
	j	.L128
.L105:
	li	a2,0
	li	a1,0
	mv	a0,s1
	sw	a5,8(sp)
	call	docall
	lw	a5,8(sp)
	beq	a0,zero,.L104
	j	.L107
.L186:
	addi	s0,s0,2
	j	.L129
.L76:
	ori	s0,s0,8
.L81:
	lbu	a5,2(a4)
	bne	a5,zero,.L85
	lw	ra,4(sp)
	addi	a4,t2,1
	slli	a5,a4,2
	add	a5,ra,a5
	lw	a5,0(a5)
	beq	a5,zero,.L172
	lbu	a5,0(a5)
	beq	a5,a3,.L172
	mv	t2,a4
	j	.L85
.L182:
	call	print_version
	j	.L94
.L172:
	sw	t2,0(sp)
.L84:
	mv	a0,s1
	li	a2,68
	li	a1,503
	call	luaL_checkversion_
	lw	a5,4(sp)
	lla	s1,.LANCHOR1
	lw	a5,0(a5)
	beq	a5,zero,.L88
	lbu	a4,0(a5)
	lla	s1,.LANCHOR1
	beq	a4,zero,.L88
	sw	a5,0(s1)
.L88:
	lw	a5,0(sp)
	lw	a4,4(sp)
	lla	s0,stderr
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a5,0(a5)
	lw	a2,0(s1)
	lw	a0,0(s0)
	lla	a1,.LC0
	sw	a5,0(sp)
	call	fprintf
	lw	a0,0(s0)
	call	fflush
	lw	a5,0(sp)
	li	a3,101
	lw	a0,0(s0)
	lbu	a4,1(a5)
	mv	a2,a5
	beq	a4,a3,.L90
	li	a3,108
	bne	a4,a3,.L91
.L90:
	lla	a1,.LC18
	call	fprintf
	lw	a0,0(s0)
	call	fflush
.L92:
	lw	a2,0(s1)
	lw	a0,0(s0)
	lla	a1,.LC20
	call	fprintf
	lw	a0,0(s0)
	call	fflush
	lw	ra,32(sp)
	lw	s0,28(sp)
	lw	s1,24(sp)
	li	a0,0
	addi	sp,sp,36
	jr	ra
.L96:
	lw	a5,12(sp)
	li	a2,1
	mv	a0,s1
	addi	a1,a5,-1
	call	lua_createtable
	sw	zero,16(sp)
	j	.L97
.L78:
	lbu	a5,2(a4)
	sw	t2,0(sp)
	sw	s0,20(sp)
	bne	a5,zero,.L84
	addi	a5,t2,1
	sw	a5,0(sp)
	j	.L75
.L187:
	lw	a5,0(sp)
	lla	a1,.LC25
	slli	s0,a5,2
	lw	a5,4(sp)
	add	a5,a5,s0
	lw	s0,0(a5)
	sw	a5,0(sp)
	mv	a0,s0
	call	strcmp
	lw	a5,0(sp)
	beq	a0,zero,.L189
.L108:
	li	a2,0
	mv	a1,s0
	mv	a0,s1
	call	luaL_loadfilex
	bne	a0,zero,.L107
	lla	a1,.LC22
	mv	a0,s1
	call	lua_getglobal
	li	a5,5
	bne	a0,a5,.L190
.L110:
	li	a1,-1
	mv	a0,s1
	call	luaL_len
	mv	s0,a0
	addi	a1,a0,3
	lla	a2,.LC28
	mv	a0,s1
	call	luaL_checkstack
	ble	s0,zero,.L133
	li	a2,1
	sw	s0,0(sp)
	mv	s0,a2
.L112:
	mv	a2,s0
	neg	a1,s0
	mv	a0,s1
	call	lua_rawgeti
	lw	a4,0(sp)
	mv	a5,s0
	addi	s0,s0,1
	bge	a4,s0,.L112
	mv	s0,a4
	not	a1,a5
.L111:
	li	a2,-1
	mv	a0,s1
	call	lua_rotate
	li	a1,-2
	mv	a0,s1
	call	lua_settop
	li	a2,-1
	mv	a1,s0
	mv	a0,s1
	call	docall
	bne	a0,zero,.L107
	lw	a5,20(sp)
	andi	a5,a5,2
	beq	a5,zero,.L116
.L177:
	mv	a0,s1
	call	doREPL
	mv	a0,s1
	li	a1,1
	call	lua_pushboolean
	li	a0,1
	j	.L191
.L188:
	lw	a5,20(sp)
	andi	a5,a5,12
	bne	a5,zero,.L116
	call	print_version
	j	.L177
.L189:
	lw	a0,-4(a5)
	lla	a1,.LC26
	call	strcmp
	seqz	a5,a0
	neg	a5,a5
	and	s0,s0,a5
	j	.L108
.L91:
	lla	a1,.LC19
	call	fprintf
	lw	a0,0(s0)
	call	fflush
	j	.L92
.L190:
	lla	a1,.LC27
	mv	a0,s1
	call	luaL_error
	j	.L110
.L74:
	li	a2,68
	li	a1,503
	mv	a0,s1
	call	luaL_checkversion_
	lw	a5,4(sp)
	lw	a5,0(a5)
	beq	a5,zero,.L134
	lbu	a4,0(a5)
	beq	a4,zero,.L134
	li	a4,1
	sw	zero,20(sp)
	sw	a4,0(sp)
	j	.L130
.L134:
	li	a5,1
	sw	zero,20(sp)
	sw	a5,0(sp)
	j	.L95
.L133:
	li	a1,-1
	j	.L111
	.size	pmain, .-pmain
	.section	.text.bench_init,"ax",@progbits
	.align	2
	.globl	bench_init
	.hidden	bench_init
	.type	bench_init, @function
bench_init:
	slli	a0,a0,4
	lla	a5,.LANCHOR3
	add	a5,a5,a0
	la a4, .LANCHOR2; sw a5, 0(a4);
	ret
	.size	bench_init, .-bench_init
	.section	.rodata.bench_run.str1.4,"aMS",@progbits,1
	.align	2
.LC29:
	.string	"lua"
	.align	2
.LC30:
	.string	"cannot create state: not enough memory"
	.section	.text.bench_run,"ax",@progbits
	.align	2
	.globl	bench_run
	.hidden	bench_run
	.type	bench_run, @function
bench_run:
	addi	sp,sp,-24
	sw	s1,12(sp)
	lla	s1,.LANCHOR2
	lw	a5,0(s1)
	lla	a4,.LC29
	sw	s0,16(sp)
	lw	a5,0(a5)
	sw	ra,20(sp)
	sw	a4,0(sp)
	sw	zero,8(sp)
	sw	a5,4(sp)
	call	luaL_newstate
	mv	s0,a0
	beq	a0,zero,.L200
.L194:
	li	a2,0
	lla	a1,pmain
	mv	a0,s0
	call	lua_pushcclosure
	li	a1,2
	mv	a0,s0
	call	lua_pushinteger
	mv	a1,sp
	mv	a0,s0
	call	lua_pushlightuserdata
	li	a5,0
	li	a4,0
	li	a3,0
	li	a2,1
	li	a1,2
	mv	a0,s0
	call	lua_pcallk
	mv	a4,a0
	lla	a5,.LANCHOR4
	li	a1,-1
	mv	a0,s0
	sw	a4,0(a5)
	call	lua_toboolean
	lla	a5,.LANCHOR4
	lw	a5,0(a5)
	la a4, .LANCHOR5; sw a0, 0(a4);
	bne	a5,zero,.L201
.L195:
	mv	a0,s0
	call	lua_close
	lw	a5,0(s1)
	lw	ra,20(sp)
	lw	s0,16(sp)
	lw	a0,8(a5)
	lw	a1,12(a5)
	lw	s1,12(sp)
	addi	sp,sp,24
	jr	ra
.L201:
	li	a2,0
	li	a1,-1
	mv	a0,s0
	call	lua_tolstring
	mv	a1,a0
	la a0, .LANCHOR1; lw a0, 0(a0);
	call	l_message
	li	a1,-2
	mv	a0,s0
	call	lua_settop
	j	.L195
.L200:
	lw	a0,0(sp)
	lla	a1,.LC30
	call	l_message
	li	a0,1
	call	bench_exit
	j	.L194
	.size	bench_run, .-bench_run
	.section	.text.bench_validate,"ax",@progbits
	.align	2
	.globl	bench_validate
	.hidden	bench_validate
	.type	bench_validate, @function
bench_validate:
	la a5, .LANCHOR5; lw a5, 0(a5);
	li	a0,1
	beq	a5,zero,.L202
	la a0, .LANCHOR4; lw a0, 0(a0);
	snez	a0,a0
.L202:
	ret
	.size	bench_validate, .-bench_validate
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC31:
	.string	"input/test-hello.lua"
	.align	2
.LC32:
	.string	"input/train-sort.lua"
	.align	2
.LC33:
	.string	"input/ref-perm.lua"
	.align	2
.LC34:
	.string	"input/huge-qsort.lua"
	.section	.rodata.settings,"a"
	.align	3
	.set	.LANCHOR3,. + 0
	.type	settings, @object
	.size	settings, 64
settings:
	.word	.LC31
	.zero	4
	.word	0
	.word	0
	.word	.LC32
	.zero	4
	.word	69
	.word	0
	.word	.LC33
	.zero	4
	.word	316318
	.word	0
	.word	.LC34
	.zero	4
	.word	33976145
	.word	0
	.section	.sbss.globalL,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	globalL, @object
	.size	globalL, 4
globalL:
	.zero	4
	.section	.sbss.ps,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	ps, @object
	.size	ps, 4
ps:
	.zero	4
	.section	.sbss.result,"aw",@nobits
	.align	2
	.set	.LANCHOR5,. + 0
	.type	result, @object
	.size	result, 4
result:
	.zero	4
	.section	.sbss.status,"aw",@nobits
	.align	2
	.set	.LANCHOR4,. + 0
	.type	status, @object
	.size	status, 4
status:
	.zero	4
	.section	.sdata.progname,"aw"
	.align	2
	.set	.LANCHOR1,. + 0
	.type	progname, @object
	.size	progname, 4
progname:
	.word	.LC29
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
