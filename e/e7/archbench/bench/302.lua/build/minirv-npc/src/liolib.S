#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"liolib.c"
	.option nopic
	.text
	.section	.rodata.g_write.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"%ld"
	.section	.text.g_write,"ax",@progbits
	.align	2
	.type	g_write, @function
g_write:
	addi	sp,sp,-28
	sw	s0,20(sp)
	sw	s1,16(sp)
	sw	ra,24(sp)
	mv	s0,a0
	sw	a1,8(sp)
	mv	s1,a2
	call	lua_gettop
	sw	a0,4(sp)
	beq	a0,s1,.L10
	li	a5,1
	sw	a5,0(sp)
	j	.L8
.L3:
	call	luaL_checklstring
	lw	a5,0(sp)
	bne	a5,zero,.L23
.L6:
	lw	a5,4(sp)
	addi	s1,s1,1
	beq	a5,s1,.L24
.L8:
	mv	a1,s1
	mv	a0,s0
	call	lua_type
	mv	a3,a0
	li	a4,3
	mv	a1,s1
	addi	a2,sp,12
	mv	a0,s0
	bne	a3,a4,.L3
	call	lua_isinteger
	mv	a4,a0
	mv	a1,s1
	li	a2,0
	mv	a0,s0
	beq	a4,zero,.L4
	call	lua_tointegerx
	mv	a2,a0
	lw	a0,8(sp)
	lla	a1,.LC0
	call	fprintf
.L5:
	lw	a5,0(sp)
	beq	a5,zero,.L6
	sgt	a5,a0,zero
	sw	a5,0(sp)
	lw	a5,4(sp)
	addi	s1,s1,1
	bne	a5,s1,.L8
.L24:
	lw	a5,0(sp)
	beq	a5,zero,.L25
.L10:
	lw	ra,24(sp)
	lw	s0,20(sp)
	lw	s1,16(sp)
	li	a0,1
	addi	sp,sp,28
	jr	ra
.L23:
	lw	a2,12(sp)
	lw	a3,8(sp)
	li	a1,1
	call	fwrite
	lw	a5,12(sp)
	sub	a5,a5,a0
	seqz	a5,a5
	sw	a5,0(sp)
	j	.L6
.L4:
	li	a2,0
	call	lua_tonumberx
	mv	a2,a0
	lw	a0,8(sp)
	lla	a1,.LC0
	call	fprintf
	j	.L5
.L25:
	mv	a0,s0
	lw	s0,20(sp)
	lw	ra,24(sp)
	lw	s1,16(sp)
	li	a2,0
	li	a1,0
	addi	sp,sp,28
	tail	luaL_fileresult
	.size	g_write, .-g_write
	.section	.rodata.io_type.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"FILE*"
	.align	2
.LC2:
	.string	"closed file"
	.align	2
.LC3:
	.string	"file"
	.section	.text.io_type,"ax",@progbits
	.align	2
	.type	io_type, @function
io_type:
	addi	sp,sp,-12
	li	a1,1
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	luaL_checkany
	lla	a2,.LC1
	li	a1,1
	mv	a0,s0
	call	luaL_testudata
	beq	a0,zero,.L31
	lw	a5,4(a0)
	beq	a5,zero,.L32
	mv	a0,s0
	lla	a1,.LC3
	call	lua_pushstring
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
.L32:
	mv	a0,s0
	lla	a1,.LC2
	call	lua_pushstring
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
.L31:
	mv	a0,s0
	call	lua_pushnil
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
	.size	io_type, .-io_type
	.section	.rodata.io_noclose.str1.4,"aMS",@progbits,1
	.align	2
.LC4:
	.string	"cannot close standard file"
	.section	.text.io_noclose,"ax",@progbits
	.align	2
	.type	io_noclose, @function
io_noclose:
	addi	sp,sp,-12
	lla	a2,.LC1
	li	a1,1
	sw	ra,8(sp)
	sw	s0,4(sp)
	mv	s0,a0
	call	luaL_checkudata
	mv	a5,a0
	lla	a4,io_noclose
	mv	a0,s0
	sw	a4,4(a5)
	call	lua_pushnil
	mv	a0,s0
	lla	a1,.LC4
	call	lua_pushstring
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,2
	addi	sp,sp,12
	jr	ra
	.size	io_noclose, .-io_noclose
	.section	.text.io_fclose,"ax",@progbits
	.align	2
	.type	io_fclose, @function
io_fclose:
	addi	sp,sp,-12
	lla	a2,.LC1
	li	a1,1
	sw	ra,8(sp)
	sw	s0,4(sp)
	mv	s0,a0
	call	luaL_checkudata
	lw	a0,0(a0)
	call	fclose
	seqz	a1,a0
	mv	a0,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a2,0
	addi	sp,sp,12
	tail	luaL_fileresult
	.size	io_fclose, .-io_fclose
	.section	.text.read_chars,"ax",@progbits
	.align	2
	.type	read_chars, @function
read_chars:
	addi	sp,sp,-2044
	sw	s0,2036(sp)
	li	a5,4096
	li	s0,-4096
	sw	ra,2040(sp)
	sw	s1,2032(sp)
	addi	a5,a5,-2032
	addi	sp,sp,-40
	addi	s1,s0,2032
	addi	a4,sp,8
	add	a5,a5,s1
	add	s1,a5,a4
	mv	a3,a1
	mv	a1,s1
	sw	a3,4(sp)
	sw	a2,0(sp)
	call	luaL_buffinit
	lw	a2,0(sp)
	mv	a0,s1
	mv	a1,a2
	call	luaL_prepbuffsize
	lw	a3,4(sp)
	lw	a2,0(sp)
	li	a1,1
	call	fread
	li	a5,4096
	addi	a5,a5,-2032
	addi	a4,sp,8
	add	a5,a5,s0
	add	a5,a5,a4
	sw	a5,0(sp)
	lw	a5,2040(a5)
	lw	a4,0(sp)
	mv	s0,a0
	add	a5,a5,s0
	mv	a0,s1
	sw	a5,2040(a4)
	call	luaL_pushresult
	addi	sp,sp,40
	lw	ra,2040(sp)
	snez	a0,s0
	lw	s1,2032(sp)
	lw	s0,2036(sp)
	addi	sp,sp,2044
	jr	ra
	.size	read_chars, .-read_chars
	.section	.text.read_all,"ax",@progbits
	.align	2
	.type	read_all, @function
read_all:
	addi	sp,sp,-2044
	sw	s0,2036(sp)
	li	a5,4096
	li	s0,-4096
	sw	s1,2032(sp)
	addi	s0,s0,2032
	sw	ra,2040(sp)
	addi	a5,a5,-2032
	addi	sp,sp,-40
	add	a5,a5,s0
	addi	a4,sp,8
	add	s0,a5,a4
	mv	s1,a1
	mv	a1,s0
	sw	s1,4(sp)
	call	luaL_buffinit
.L40:
	li	s1,4096
	addi	a1,s1,-2048
	mv	a0,s0
	call	luaL_prepbuffsize
	lw	a3,4(sp)
	addi	a2,s1,-2048
	li	a1,1
	call	fread
	li	a5,4096
	addi	a4,sp,8
	addi	a5,a5,-2032
	add	a5,a5,a4
	sub	a5,a5,s1
	sw	a5,0(sp)
	lw	a5,2040(a5)
	lw	a3,0(sp)
	addi	a4,a0,-2048
	add	a5,a5,a0
	sw	a5,2040(a3)
	beq	a4,zero,.L40
	mv	a0,s0
	call	luaL_pushresult
	addi	sp,sp,40
	lw	ra,2040(sp)
	lw	s0,2036(sp)
	lw	s1,2032(sp)
	addi	sp,sp,2044
	jr	ra
	.size	read_all, .-read_all
	.section	.text.read_line,"ax",@progbits
	.align	2
	.type	read_line, @function
read_line:
	addi	sp,sp,-2044
	li	a5,-4096
	li	a4,4096
	sw	s1,2032(sp)
	addi	a5,a5,2032
	sw	ra,2040(sp)
	sw	s0,2036(sp)
	addi	a4,a4,-2032
	addi	sp,sp,-48
	add	a4,a4,a5
	addi	a5,sp,16
	add	a5,a4,a5
	mv	s1,a1
	mv	a1,a5
	sw	a5,4(sp)
	sw	a0,12(sp)
	sw	a2,8(sp)
	call	luaL_buffinit
.L52:
	lw	a0,4(sp)
	li	a1,4096
	addi	a1,a1,-2048
	call	luaL_prepbuffsize
	sw	a0,0(sp)
	li	s0,0
	j	.L45
.L59:
	beq	a0,a4,.L58
	lw	a5,0(sp)
	addi	s0,s0,1
	add	a4,a5,s0
	sb	a0,-1(a4)
	addi	a4,s0,-2048
	beq	a4,zero,.L46
.L45:
	mv	a0,s1
	call	getc
	li	a5,-1
	li	a4,10
	bne	a0,a5,.L59
	lw	a3,24(sp)
	li	a4,-4096
	li	a5,4096
	addi	a4,a4,2032
	addi	a5,a5,-2032
	add	a5,a5,a4
	addi	a4,sp,16
	add	a3,a3,s0
	add	a0,a5,a4
	sw	a3,24(sp)
	call	luaL_pushresult
	lw	a0,12(sp)
	li	a1,-1
	call	lua_rawlen
	addi	sp,sp,48
	lw	ra,2040(sp)
	lw	s0,2036(sp)
	lw	s1,2032(sp)
	snez	a0,a0
	addi	sp,sp,2044
	jr	ra
.L46:
	lw	a5,24(sp)
	li	a4,4096
	addi	a4,a4,-2048
	add	a5,a5,a4
	sw	a5,24(sp)
	j	.L52
.L58:
	lw	a3,24(sp)
	li	a4,-4096
	add	a5,s0,a3
	lw	a3,8(sp)
	sw	a5,24(sp)
	beq	a3,zero,.L60
	li	a5,4096
	addi	a4,a4,2032
	addi	a5,a5,-2032
	add	a5,a5,a4
	addi	a4,sp,16
	add	a0,a5,a4
	call	luaL_pushresult
	lw	a0,8(sp)
	addi	sp,sp,48
	lw	ra,2040(sp)
	lw	s0,2036(sp)
	lw	s1,2032(sp)
	addi	sp,sp,2044
	jr	ra
.L60:
	lw	a3,20(sp)
	bleu	a3,a5,.L61
.L50:
	lw	a3,16(sp)
	addi	a2,a5,1
	sw	a2,24(sp)
	add	a5,a3,a5
	li	a3,10
	sb	a3,0(a5)
	li	a4,-4096
	li	a5,4096
	addi	a4,a4,2032
	addi	a5,a5,-2032
	add	a5,a5,a4
	addi	a4,sp,16
	add	a0,a5,a4
	call	luaL_pushresult
	addi	sp,sp,48
	lw	ra,2040(sp)
	lw	s0,2036(sp)
	lw	s1,2032(sp)
	li	a0,1
	addi	sp,sp,2044
	jr	ra
.L61:
	li	a5,4096
	addi	a4,a4,2032
	addi	a5,a5,-2032
	add	a5,a5,a4
	addi	a4,sp,16
	add	a0,a5,a4
	li	a1,1
	call	luaL_prepbuffsize
	lw	a5,24(sp)
	j	.L50
	.size	read_line, .-read_line
	.section	.text.io_pclose,"ax",@progbits
	.align	2
	.type	io_pclose, @function
io_pclose:
	addi	sp,sp,-12
	li	a1,1
	lla	a2,.LC1
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	luaL_checkudata
	mv	a0,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a1,-1
	addi	sp,sp,12
	tail	luaL_execresult
	.size	io_pclose, .-io_pclose
	.section	.rodata.aux_lines.str1.4,"aMS",@progbits,1
	.align	2
.LC5:
	.string	"too many arguments"
	.section	.text.aux_lines,"ax",@progbits
	.align	2
	.type	aux_lines, @function
aux_lines:
	addi	sp,sp,-20
	sw	s0,12(sp)
	sw	s1,8(sp)
	sw	ra,16(sp)
	mv	s0,a0
	sw	a1,0(sp)
	call	lua_gettop
	addi	a4,a0,-1
	li	a3,250
	mv	s1,a0
	bgt	a4,a3,.L67
.L65:
	mv	a1,a4
	mv	a0,s0
	call	lua_pushinteger
	lw	a1,0(sp)
	mv	a0,s0
	call	lua_pushboolean
	mv	a0,s0
	li	a2,2
	li	a1,2
	call	lua_rotate
	mv	a0,s0
	lw	s0,12(sp)
	lw	ra,16(sp)
	addi	a2,s1,2
	lw	s1,8(sp)
	lla	a1,io_readline
	addi	sp,sp,20
	tail	lua_pushcclosure
.L67:
	lla	a2,.LC5
	li	a1,252
	mv	a0,s0
	sw	a4,4(sp)
	call	luaL_argerror
	lw	a4,4(sp)
	j	.L65
	.size	aux_lines, .-aux_lines
	.section	.rodata.io_flush.str1.4,"aMS",@progbits,1
	.align	2
.LC6:
	.string	"_IO_output"
	.align	2
.LC7:
	.string	"standard %s file is closed"
	.section	.text.io_flush,"ax",@progbits
	.align	2
	.type	io_flush, @function
io_flush:
	li	a1,-999424
	addi	sp,sp,-12
	lla	a2,.LC6
	addi	a1,a1,-1576
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	mv	s0,a0
	call	lua_getfield
	li	a1,-1
	mv	a0,s0
	call	lua_touserdata
	lw	a5,4(a0)
	mv	s1,a0
	beq	a5,zero,.L71
.L69:
	lw	a0,0(s1)
	call	fflush
	seqz	a1,a0
	mv	a0,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	li	a2,0
	addi	sp,sp,12
	tail	luaL_fileresult
.L71:
	lla	a2,.LC6+4
	lla	a1,.LC7
	mv	a0,s0
	call	luaL_error
	j	.L69
	.size	io_flush, .-io_flush
	.section	.rodata.f_tostring.str1.4,"aMS",@progbits,1
	.align	2
.LC8:
	.string	"file (closed)"
	.align	2
.LC9:
	.string	"file (%p)"
	.section	.text.f_tostring,"ax",@progbits
	.align	2
	.type	f_tostring, @function
f_tostring:
	addi	sp,sp,-12
	lla	a2,.LC1
	li	a1,1
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	luaL_checkudata
	lw	a5,4(a0)
	beq	a5,zero,.L76
	lw	a2,0(a0)
	lla	a1,.LC9
	mv	a0,s0
	call	lua_pushfstring
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
.L76:
	mv	a0,s0
	lla	a1,.LC8
	call	lua_pushstring
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
	.size	f_tostring, .-f_tostring
	.section	.text.readdigits,"ax",@progbits
	.align	2
	.type	readdigits, @function
readdigits:
	addi	sp,sp,-16
	sw	a1,0(sp)
	lw	a5,0(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	mv	s1,a0
	li	s0,0
	lw	a0,4(a0)
	beq	a5,zero,.L78
.L91:
	call	isxdigit
	beq	a0,zero,.L77
.L82:
	lw	a4,8(s1)
	li	a5,199
	ble	a4,a5,.L90
	sb	zero,12(s1)
.L77:
	lw	ra,12(sp)
	mv	a0,s0
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L90:
	lw	a3,4(s1)
	addi	a2,a4,1
	sw	a2,8(s1)
	add	a4,s1,a4
	sb	a3,12(a4)
	lw	a0,0(s1)
	addi	s0,s0,1
	call	getc
	lw	a5,0(sp)
	sw	a0,4(s1)
	bne	a5,zero,.L91
.L78:
	call	isdigit
	bne	a0,zero,.L82
	lw	ra,12(sp)
	mv	a0,s0
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
	.size	readdigits, .-readdigits
	.section	.text.io_tmpfile,"ax",@progbits
	.align	2
	.type	io_tmpfile, @function
io_tmpfile:
	addi	sp,sp,-12
	li	a1,8
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	mv	s1,a0
	call	lua_newuserdata
	mv	s0,a0
	lla	a1,.LC1
	mv	a0,s1
	sw	zero,4(s0)
	call	luaL_setmetatable
	lla	a5,io_fclose
	sw	zero,0(s0)
	sw	a5,4(s0)
	call	tmpfile
	sw	a0,0(s0)
	beq	a0,zero,.L95
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
.L95:
	lw	s0,4(sp)
	lw	ra,8(sp)
	mv	a0,s1
	lw	s1,0(sp)
	li	a2,0
	li	a1,0
	addi	sp,sp,12
	tail	luaL_fileresult
	.size	io_tmpfile, .-io_tmpfile
	.section	.rodata.opencheck.str1.4,"aMS",@progbits,1
	.align	2
.LC10:
	.string	"cannot open file '%s'"
	.section	.text.opencheck,"ax",@progbits
	.align	2
	.type	opencheck, @function
opencheck:
	addi	sp,sp,-20
	sw	s1,8(sp)
	mv	s1,a1
	li	a1,8
	sw	ra,16(sp)
	sw	a2,4(sp)
	sw	s0,12(sp)
	sw	a0,0(sp)
	call	lua_newuserdata
	mv	s0,a0
	lw	a0,0(sp)
	lla	a1,.LC1
	sw	zero,4(s0)
	call	luaL_setmetatable
	lw	a2,4(sp)
	lla	a4,io_fclose
	sw	zero,0(s0)
	sw	a4,4(s0)
	mv	a1,a2
	mv	a0,s1
	call	fopen
	sw	a0,0(s0)
	beq	a0,zero,.L99
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L99:
	lw	s0,12(sp)
	lw	a0,0(sp)
	lw	ra,16(sp)
	mv	a2,s1
	lw	s1,8(sp)
	lla	a1,.LC10
	addi	sp,sp,20
	tail	luaL_error
	.size	opencheck, .-opencheck
	.section	.rodata.g_iofile.str1.4,"aMS",@progbits,1
	.align	2
.LC11:
	.string	"attempt to use a closed file"
	.section	.text.g_iofile,"ax",@progbits
	.align	2
	.type	g_iofile, @function
g_iofile:
	addi	sp,sp,-16
	sw	s0,8(sp)
	mv	s0,a1
	li	a1,1
	sw	s1,4(sp)
	sw	ra,12(sp)
	mv	s1,a0
	sw	a2,0(sp)
	call	lua_type
	bgt	a0,zero,.L106
.L101:
	li	a1,-999424
	mv	a2,s0
	mv	a0,s1
	addi	a1,a1,-1576
	call	lua_getfield
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	li	a0,1
	addi	sp,sp,16
	jr	ra
.L106:
	li	a1,1
	li	a2,0
	mv	a0,s1
	call	lua_tolstring
	mv	a1,a0
	beq	a0,zero,.L102
	lw	a2,0(sp)
	mv	a0,s1
	call	opencheck
.L103:
	li	a1,-999424
	mv	a2,s0
	addi	a1,a1,-1576
	mv	a0,s1
	call	lua_setfield
	j	.L101
.L102:
	lla	a2,.LC1
	li	a1,1
	mv	a0,s1
	call	luaL_checkudata
	lw	a4,4(a0)
	beq	a4,zero,.L107
.L104:
	li	a1,1
	mv	a0,s1
	call	lua_pushvalue
	j	.L103
.L107:
	lla	a1,.LC11
	mv	a0,s1
	call	luaL_error
	j	.L104
	.size	g_iofile, .-g_iofile
	.section	.rodata.io_output.str1.4,"aMS",@progbits,1
	.align	2
.LC12:
	.string	"w"
	.section	.text.io_output,"ax",@progbits
	.align	2
	.type	io_output, @function
io_output:
	lla	a2,.LC12
	lla	a1,.LC6
	tail	g_iofile
	.size	io_output, .-io_output
	.section	.rodata.io_input.str1.4,"aMS",@progbits,1
	.align	2
.LC13:
	.string	"r"
	.align	2
.LC14:
	.string	"_IO_input"
	.section	.text.io_input,"ax",@progbits
	.align	2
	.type	io_input, @function
io_input:
	lla	a2,.LC13
	lla	a1,.LC14
	tail	g_iofile
	.size	io_input, .-io_input
	.section	.rodata.io_popen.str1.4,"aMS",@progbits,1
	.align	2
.LC15:
	.string	"'popen' not supported"
	.section	.text.io_popen,"ax",@progbits
	.align	2
	.type	io_popen, @function
io_popen:
	addi	sp,sp,-16
	li	a2,0
	li	a1,1
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	mv	s0,a0
	call	luaL_checklstring
	mv	a5,a0
	lla	a2,.LC13
	li	a3,0
	li	a1,2
	mv	a0,s0
	sw	a5,0(sp)
	call	luaL_optlstring
	li	a1,8
	mv	a0,s0
	call	lua_newuserdata
	mv	s1,a0
	lla	a1,.LC1
	mv	a0,s0
	sw	zero,4(s1)
	call	luaL_setmetatable
	lla	a1,.LC15
	mv	a0,s0
	call	luaL_error
	lw	a5,0(sp)
	lla	a4,io_pclose
	mv	a0,s0
	lw	s0,8(sp)
	lw	ra,12(sp)
	sw	zero,0(s1)
	sw	a4,4(s1)
	lw	s1,4(sp)
	mv	a2,a5
	li	a1,0
	addi	sp,sp,16
	tail	luaL_fileresult
	.size	io_popen, .-io_popen
	.section	.rodata.io_open.str1.4,"aMS",@progbits,1
	.align	2
.LC16:
	.string	"rwa"
	.align	2
.LC17:
	.string	"b"
	.align	2
.LC18:
	.string	"invalid mode"
	.section	.text.io_open,"ax",@progbits
	.align	2
	.type	io_open, @function
io_open:
	addi	sp,sp,-24
	li	a2,0
	li	a1,1
	sw	ra,20(sp)
	sw	s0,16(sp)
	sw	s1,12(sp)
	mv	s0,a0
	call	luaL_checklstring
	mv	a5,a0
	li	a3,0
	lla	a2,.LC13
	li	a1,2
	mv	a0,s0
	sw	a5,4(sp)
	call	luaL_optlstring
	mv	s1,a0
	li	a1,8
	mv	a0,s0
	sw	s1,0(sp)
	call	lua_newuserdata
	mv	s1,a0
	sw	zero,4(a0)
	lla	a1,.LC1
	mv	a0,s0
	call	luaL_setmetatable
	lla	a5,io_fclose
	sw	a5,4(s1)
	lw	a5,0(sp)
	sw	zero,0(s1)
	lbu	a1,0(a5)
	beq	a1,zero,.L113
	lla	a0,.LC16
	call	strchr
	beq	a0,zero,.L113
	lw	a5,0(sp)
	lla	a1,.LC17
	lbu	a0,1(a5)
	addi	a0,a0,-43
	seqz	a0,a0
	add	a0,a5,a0
	addi	a5,a0,1
	mv	a0,a5
	sw	a5,8(sp)
	call	strspn
	lw	a5,8(sp)
	mv	a4,a0
	sw	a4,8(sp)
	mv	a0,a5
	call	strlen
	lw	a4,8(sp)
	beq	a4,a0,.L116
.L113:
	lla	a2,.LC18
	li	a1,2
	mv	a0,s0
	call	luaL_argerror
.L116:
	lw	a1,0(sp)
	lw	a0,4(sp)
	call	fopen
	sw	a0,0(s1)
	beq	a0,zero,.L125
	lw	ra,20(sp)
	lw	s0,16(sp)
	lw	s1,12(sp)
	li	a0,1
	addi	sp,sp,24
	jr	ra
.L125:
	mv	a0,s0
	lw	s0,16(sp)
	lw	a2,4(sp)
	lw	ra,20(sp)
	lw	s1,12(sp)
	li	a1,0
	addi	sp,sp,24
	tail	luaL_fileresult
	.size	io_open, .-io_open
	.section	.text.lua_io_write,"ax",@progbits
	.align	2
	.type	lua_io_write, @function
lua_io_write:
	li	a1,-999424
	addi	sp,sp,-12
	lla	a2,.LC6
	addi	a1,a1,-1576
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	mv	s0,a0
	call	lua_getfield
	li	a1,-1
	mv	a0,s0
	call	lua_touserdata
	lw	a5,4(a0)
	mv	s1,a0
	beq	a5,zero,.L129
.L127:
	mv	a0,s0
	lw	s0,4(sp)
	lw	a1,0(s1)
	lw	ra,8(sp)
	lw	s1,0(sp)
	li	a2,1
	addi	sp,sp,12
	tail	g_write
.L129:
	lla	a2,.LC6+4
	lla	a1,.LC7
	mv	a0,s0
	call	luaL_error
	j	.L127
	.size	lua_io_write, .-lua_io_write
	.section	.text.f_gc,"ax",@progbits
	.align	2
	.type	f_gc, @function
f_gc:
	addi	sp,sp,-16
	lla	a2,.LC1
	li	a1,1
	sw	s0,8(sp)
	sw	ra,12(sp)
	mv	s0,a0
	call	luaL_checkudata
	lw	a5,4(a0)
	beq	a5,zero,.L131
	lw	a5,0(a0)
	beq	a5,zero,.L131
	lla	a2,.LC1
	li	a1,1
	mv	a0,s0
	call	luaL_checkudata
	lw	a4,4(a0)
	mv	a5,a0
	sw	zero,4(a5)
	sw	a4,0(sp)
	lw	a5,0(sp)
	mv	a0,s0
	jalr	a5
.L131:
	lw	ra,12(sp)
	lw	s0,8(sp)
	li	a0,0
	addi	sp,sp,16
	jr	ra
	.size	f_gc, .-f_gc
	.section	.text.f_lines,"ax",@progbits
	.align	2
	.type	f_lines, @function
f_lines:
	addi	sp,sp,-12
	lla	a2,.LC1
	li	a1,1
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	luaL_checkudata
	lw	a5,4(a0)
	beq	a5,zero,.L142
.L140:
	mv	a0,s0
	li	a1,0
	call	aux_lines
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
.L142:
	lla	a1,.LC11
	mv	a0,s0
	call	luaL_error
	j	.L140
	.size	f_lines, .-f_lines
	.section	.text.f_write,"ax",@progbits
	.align	2
	.type	f_write, @function
f_write:
	addi	sp,sp,-12
	lla	a2,.LC1
	li	a1,1
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	luaL_checkudata
	lw	a5,4(a0)
	mv	s1,a0
	beq	a5,zero,.L146
.L144:
	lw	s1,0(s1)
	mv	a0,s0
	li	a1,1
	call	lua_pushvalue
	mv	a0,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	mv	a1,s1
	lw	s1,0(sp)
	li	a2,2
	addi	sp,sp,12
	tail	g_write
.L146:
	lla	a1,.LC11
	mv	a0,s0
	call	luaL_error
	j	.L144
	.size	f_write, .-f_write
	.section	.text.f_flush,"ax",@progbits
	.align	2
	.type	f_flush, @function
f_flush:
	addi	sp,sp,-12
	lla	a2,.LC1
	li	a1,1
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	mv	s1,a0
	call	luaL_checkudata
	lw	a5,4(a0)
	mv	s0,a0
	beq	a5,zero,.L150
.L148:
	lw	a0,0(s0)
	call	fflush
	lw	s0,4(sp)
	lw	ra,8(sp)
	seqz	a1,a0
	mv	a0,s1
	lw	s1,0(sp)
	li	a2,0
	addi	sp,sp,12
	tail	luaL_fileresult
.L150:
	lla	a1,.LC11
	mv	a0,s1
	call	luaL_error
	j	.L148
	.size	f_flush, .-f_flush
	.section	.rodata.g_read.str1.4,"aMS",@progbits,1
	.align	2
.LC19:
	.string	"pP"
	.align	2
.LC20:
	.string	"eE"
	.align	2
.LC21:
	.string	""
	.align	2
.LC22:
	.string	"invalid format"
	.section	.text.g_read,"ax",@progbits
	.align	2
	.type	g_read, @function
g_read:
	addi	sp,sp,-248
	sw	ra,244(sp)
	sw	s0,240(sp)
	sw	s1,236(sp)
	sw	a2,12(sp)
	mv	s1,a1
	mv	s0,a0
	call	lua_gettop
	mv	a5,a0
	mv	a0,s1
	sw	a5,0(sp)
	call	clearerr
	lw	a5,0(sp)
	li	a4,1
	bne	a5,a4,.L152
	li	a2,1
	mv	a1,s1
	mv	a0,s0
	call	read_line
	lw	a4,12(sp)
	mv	a5,a0
	addi	a4,a4,1
.L153:
	mv	a0,s1
	sw	a4,4(sp)
	sw	a5,0(sp)
	call	ferror
	lw	a5,0(sp)
	lw	a4,4(sp)
	bne	a0,zero,.L187
	beq	a5,zero,.L188
.L186:
	lw	a5,12(sp)
	lw	ra,244(sp)
	lw	s0,240(sp)
	lw	s1,236(sp)
	sub	a0,a4,a5
	addi	sp,sp,248
	jr	ra
.L152:
	addi	a1,a5,19
	mv	a0,s0
	lla	a2,.LC5
	sw	a5,0(sp)
	call	luaL_checkstack
	lw	a5,0(sp)
	lw	a4,12(sp)
	addi	a0,a5,-2
.L154:
	addi	a5,a4,1
	sw	a0,4(sp)
	sw	a5,0(sp)
.L184:
	lw	a5,0(sp)
	mv	a0,s0
	addi	a1,a5,-1
	sw	a1,8(sp)
	call	lua_type
	li	a5,3
	lw	a1,8(sp)
	beq	a0,a5,.L204
	li	a2,0
	mv	a0,s0
	sw	a1,8(sp)
	call	luaL_checklstring
	lbu	a5,0(a0)
	li	a4,42
	lw	a1,8(sp)
	bne	a5,a4,.L158
	lbu	a5,1(a0)
.L158:
	li	a4,108
	beq	a5,a4,.L159
	bgtu	a5,a4,.L160
	li	a4,76
	beq	a5,a4,.L161
	li	a4,97
	bne	a5,a4,.L163
	mv	a1,s1
	mv	a0,s0
	call	read_all
	lw	a4,0(sp)
.L201:
	lw	a5,4(sp)
	beq	a5,zero,.L205
	lw	a5,4(sp)
	addi	a5,a5,-1
	sw	a5,4(sp)
	lw	a5,0(sp)
	addi	a5,a5,1
	sw	a5,0(sp)
	j	.L184
.L160:
	li	a4,110
	bne	a5,a4,.L163
	mv	a0,s1
	sw	s1,20(sp)
	sw	zero,28(sp)
	call	getc
	sw	a0,24(sp)
	call	isspace
	mv	a5,a0
	beq	a0,zero,.L164
.L206:
	lw	a0,20(sp)
	call	getc
	sw	a0,24(sp)
	call	isspace
	mv	a5,a0
	bne	a0,zero,.L206
.L164:
	lw	a3,24(sp)
	addi	a4,a3,-43
	andi	a4,a4,-3
	beq	a4,zero,.L207
.L166:
	li	a4,48
	beq	a3,a4,.L208
.L202:
	li	a2,0
.L169:
	mv	a1,a5
	addi	a0,sp,20
	sw	a2,16(sp)
	sw	a5,8(sp)
	call	readdigits
	lw	a2,16(sp)
	lw	a4,24(sp)
	li	a1,46
	lw	a5,8(sp)
	add	a3,a0,a2
	beq	a4,a1,.L198
	lw	a1,20(sp)
	ble	a3,zero,.L174
.L211:
	bne	a5,zero,.L190
	li	a5,101
	lla	a3,.LC20
.L175:
	beq	a5,a4,.L176
	lbu	a5,1(a3)
	bne	a5,a4,.L174
.L176:
	lw	a5,28(sp)
	li	a3,199
	ble	a5,a3,.L177
	sb	zero,32(sp)
.L174:
	mv	a0,a4
	call	ungetc
	lw	a5,28(sp)
	addi	a4,sp,20
	addi	a1,sp,32
	addi	a5,a5,216
	add	a5,a5,a4
	mv	a0,s0
	sb	zero,-204(a5)
	call	lua_stringtonumber
	lw	a4,0(sp)
	bne	a0,zero,.L201
	mv	a0,s0
	call	lua_pushnil
	lw	a4,0(sp)
.L181:
	mv	a0,s1
	sw	a4,0(sp)
	call	ferror
	lw	a4,0(sp)
	bne	a0,zero,.L187
.L188:
	mv	a0,s0
	li	a1,-2
	sw	a4,0(sp)
	call	lua_settop
	mv	a0,s0
	call	lua_pushnil
	lw	a4,0(sp)
	lw	a5,12(sp)
	lw	ra,244(sp)
	lw	s0,240(sp)
	lw	s1,236(sp)
	sub	a0,a4,a5
	addi	sp,sp,248
	jr	ra
.L204:
	mv	a0,s0
	call	luaL_checkinteger
	beq	a0,zero,.L209
	mv	a2,a0
	mv	a1,s1
	mv	a0,s0
	call	read_chars
	mv	a5,a0
.L157:
	lw	a3,4(sp)
	lw	a4,0(sp)
	addi	a0,a3,-1
	beq	a3,zero,.L153
	bne	a5,zero,.L154
	j	.L181
.L209:
	mv	a0,s1
	call	getc
	mv	a1,s1
	sw	a0,8(sp)
	call	ungetc
	lla	a1,.LC21
	mv	a0,s0
	call	lua_pushstring
	lw	a5,8(sp)
	addi	a5,a5,1
	snez	a5,a5
	j	.L157
.L161:
	li	a2,0
	mv	a1,s1
	mv	a0,s0
	call	read_line
	mv	a5,a0
	j	.L157
.L163:
	mv	a0,s0
	lw	s0,240(sp)
	lw	ra,244(sp)
	lw	s1,236(sp)
	lla	a2,.LC22
	addi	sp,sp,248
	tail	luaL_argerror
.L159:
	li	a2,1
	mv	a1,s1
	mv	a0,s0
	call	read_line
	mv	a5,a0
	j	.L157
.L205:
	mv	a0,s1
	sw	a4,0(sp)
	call	ferror
	lw	a4,0(sp)
	beq	a0,zero,.L186
.L187:
	mv	a0,s0
	lw	s0,240(sp)
	lw	ra,244(sp)
	lw	s1,236(sp)
	li	a2,0
	li	a1,0
	addi	sp,sp,248
	tail	luaL_fileresult
.L208:
	lw	a4,28(sp)
	li	a1,199
	ble	a4,a1,.L210
	sb	zero,32(sp)
	j	.L202
.L210:
	addi	a2,a4,1
	sw	a5,8(sp)
	lw	a0,20(sp)
	addi	a5,a4,216
	addi	a4,sp,20
	add	a4,a5,a4
	sb	a3,-204(a4)
	sw	a2,28(sp)
	call	getc
	mv	a4,a0
	sw	a0,24(sp)
	li	a3,88
	andi	a0,a0,-33
	lw	a5,8(sp)
	li	a2,1
	li	a1,199
	bne	a0,a3,.L169
	lw	a3,28(sp)
	ble	a3,a1,.L171
	sb	zero,32(sp)
	j	.L169
.L207:
	lw	a4,28(sp)
	li	a2,199
	ble	a4,a2,.L167
	sb	zero,32(sp)
	li	a4,48
	bne	a3,a4,.L202
	sb	zero,32(sp)
	j	.L202
.L198:
	lw	a2,28(sp)
	li	a0,199
	lw	a1,20(sp)
	ble	a2,a0,.L173
	sb	zero,32(sp)
	bgt	a3,zero,.L211
	j	.L174
.L173:
	sw	a3,16(sp)
	sw	a5,8(sp)
	addi	a3,sp,20
	addi	a5,a2,216
	addi	t1,a2,1
	add	a2,a5,a3
	sb	a4,-204(a2)
	mv	a0,a1
	sw	t1,28(sp)
	call	getc
	lw	a5,8(sp)
	mv	a4,a0
	addi	a0,sp,20
	mv	a1,a5
	sw	a4,24(sp)
	call	readdigits
	lw	a3,16(sp)
	lw	a4,24(sp)
	lw	a1,20(sp)
	add	a3,a3,a0
	lw	a5,8(sp)
	bgt	a3,zero,.L211
	j	.L174
.L190:
	li	a5,112
	lla	a3,.LC19
	j	.L175
.L177:
	addi	a2,a5,1
	addi	a3,sp,20
	addi	a5,a5,216
	add	a5,a5,a3
	sb	a4,-204(a5)
	mv	a0,a1
	sw	a2,28(sp)
	call	getc
	addi	a4,a0,-43
	sw	a0,24(sp)
	andi	a4,a4,-3
	mv	a5,a0
	li	a3,199
	beq	a4,zero,.L212
.L178:
	li	a1,0
	addi	a0,sp,20
	call	readdigits
	lw	a4,24(sp)
	lw	a1,20(sp)
	j	.L174
.L212:
	lw	a4,28(sp)
	ble	a4,a3,.L179
	sb	zero,32(sp)
	j	.L178
.L167:
	addi	a5,a4,216
	addi	a2,a4,1
	sw	a0,8(sp)
	addi	a4,sp,20
	lw	a0,20(sp)
	add	a4,a5,a4
	sb	a3,-204(a4)
	sw	a2,28(sp)
	call	getc
	lw	a5,8(sp)
	mv	a3,a0
	sw	a0,24(sp)
	j	.L166
.L171:
	addi	a5,a3,1
	addi	a2,sp,20
	lw	a0,20(sp)
	addi	a3,a3,216
	add	a3,a3,a2
	sb	a4,-204(a3)
	sw	a5,28(sp)
	call	getc
	sw	a0,24(sp)
	li	a2,0
	li	a5,1
	j	.L169
.L179:
	addi	a3,a4,1
	addi	a2,sp,20
	lw	a0,20(sp)
	addi	a4,a4,216
	add	a4,a4,a2
	sb	a5,-204(a4)
	sw	a3,28(sp)
	call	getc
	sw	a0,24(sp)
	j	.L178
	.size	g_read, .-g_read
	.section	.text.lua_io_read,"ax",@progbits
	.align	2
	.type	lua_io_read, @function
lua_io_read:
	li	a1,-999424
	addi	sp,sp,-12
	lla	a2,.LC14
	addi	a1,a1,-1576
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	mv	s0,a0
	call	lua_getfield
	li	a1,-1
	mv	a0,s0
	call	lua_touserdata
	lw	a5,4(a0)
	mv	s1,a0
	beq	a5,zero,.L216
.L214:
	mv	a0,s0
	lw	s0,4(sp)
	lw	a1,0(s1)
	lw	ra,8(sp)
	lw	s1,0(sp)
	li	a2,1
	addi	sp,sp,12
	tail	g_read
.L216:
	lla	a2,.LC14+4
	lla	a1,.LC7
	mv	a0,s0
	call	luaL_error
	j	.L214
	.size	lua_io_read, .-lua_io_read
	.section	.text.f_read,"ax",@progbits
	.align	2
	.type	f_read, @function
f_read:
	addi	sp,sp,-12
	lla	a2,.LC1
	li	a1,1
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	mv	s1,a0
	call	luaL_checkudata
	lw	a5,4(a0)
	mv	s0,a0
	beq	a5,zero,.L220
.L218:
	lw	a1,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	mv	a0,s1
	lw	s1,0(sp)
	li	a2,2
	addi	sp,sp,12
	tail	g_read
.L220:
	lla	a1,.LC11
	mv	a0,s1
	call	luaL_error
	j	.L218
	.size	f_read, .-f_read
	.section	.rodata.io_readline.str1.4,"aMS",@progbits,1
	.align	2
.LC23:
	.string	"file is already closed"
	.align	2
.LC24:
	.string	"%s"
	.section	.text.io_readline,"ax",@progbits
	.align	2
	.type	io_readline, @function
io_readline:
	addi	sp,sp,-28
	sw	s1,16(sp)
	li	s1,-999424
	addi	a1,s1,-1577
	sw	ra,24(sp)
	sw	s0,20(sp)
	mv	s0,a0
	call	lua_touserdata
	sw	a0,8(sp)
	li	a2,0
	addi	a1,s1,-1578
	mv	a0,s0
	call	lua_tointegerx
	lw	a5,8(sp)
	sw	a0,0(sp)
	lw	a5,4(a5)
	beq	a5,zero,.L232
	li	a1,1
	mv	a0,s0
	call	lua_settop
	lw	s1,0(sp)
	lla	a2,.LC5
	mv	a0,s0
	mv	a1,s1
	call	luaL_checkstack
	ble	s1,zero,.L223
	li	a5,-999424
	addi	a5,a5,-1579
	li	s1,1
	sw	a5,4(sp)
.L224:
	lw	a5,4(sp)
	mv	a0,s0
	sub	a1,a5,s1
	call	lua_pushvalue
	lw	a5,0(sp)
	addi	s1,s1,1
	bge	a5,s1,.L224
.L223:
	lw	a5,8(sp)
	li	a2,2
	mv	a0,s0
	lw	a1,0(a5)
	call	g_read
	mv	s1,a0
	neg	a1,a0
	mv	a0,s0
	call	lua_toboolean
	bne	a0,zero,.L221
	li	a1,1
	ble	s1,a1,.L226
	sub	a1,a1,s1
	li	a2,0
	mv	a0,s0
	call	lua_tolstring
	mv	a2,a0
	mv	a0,s0
	lw	s0,20(sp)
	lw	ra,24(sp)
	lw	s1,16(sp)
	lla	a1,.LC24
	addi	sp,sp,28
	tail	luaL_error
.L226:
	li	a5,-999424
	addi	a1,a5,-1579
	mv	a0,s0
	call	lua_toboolean
	mv	s1,a0
	bne	a0,zero,.L233
.L221:
	lw	ra,24(sp)
	lw	s0,20(sp)
	mv	a0,s1
	lw	s1,16(sp)
	addi	sp,sp,28
	jr	ra
.L233:
	mv	a0,s0
	li	a1,0
	call	lua_settop
	li	a5,-999424
	addi	a1,a5,-1577
	mv	a0,s0
	call	lua_pushvalue
	lla	a2,.LC1
	li	a1,1
	mv	a0,s0
	call	luaL_checkudata
	lw	a4,4(a0)
	mv	a5,a0
	sw	zero,4(a5)
	sw	a4,12(sp)
	lw	a4,12(sp)
	mv	a0,s0
	li	s1,0
	jalr	a4
	j	.L221
.L232:
	mv	a0,s0
	lw	s0,20(sp)
	lw	ra,24(sp)
	lw	s1,16(sp)
	lla	a1,.LC23
	addi	sp,sp,28
	tail	luaL_error
	.size	io_readline, .-io_readline
	.section	.text.f_setvbuf,"ax",@progbits
	.align	2
	.type	f_setvbuf, @function
f_setvbuf:
	addi	sp,sp,-16
	lla	a2,.LC1
	li	a1,1
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	mv	s0,a0
	call	luaL_checkudata
	lw	a5,4(a0)
	mv	s1,a0
	beq	a5,zero,.L237
.L235:
	lw	a4,0(s1)
	lla	a3,.LANCHOR0
	li	a2,0
	li	a1,2
	mv	a0,s0
	sw	a4,0(sp)
	call	luaL_checkoption
	li	a2,4096
	mv	s1,a0
	addi	a2,a2,-2048
	li	a1,3
	mv	a0,s0
	call	luaL_optinteger
	slli	s1,s1,2
	lla	a5,.LANCHOR1
	lw	a4,0(sp)
	add	a5,a5,s1
	lw	a2,0(a5)
	mv	a3,a0
	li	a1,0
	mv	a0,a4
	call	setvbuf
	seqz	a1,a0
	mv	a0,s0
	lw	s0,8(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	li	a2,0
	addi	sp,sp,16
	tail	luaL_fileresult
.L237:
	lla	a1,.LC11
	mv	a0,s0
	call	luaL_error
	j	.L235
	.size	f_setvbuf, .-f_setvbuf
	.section	.rodata.f_seek.str1.4,"aMS",@progbits,1
	.align	2
.LC25:
	.string	"cur"
	.section	.text.f_seek,"ax",@progbits
	.align	2
	.type	f_seek, @function
f_seek:
	addi	sp,sp,-16
	lla	a2,.LC1
	li	a1,1
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	mv	s0,a0
	call	luaL_checkudata
	lw	a5,4(a0)
	mv	s1,a0
	beq	a5,zero,.L242
.L239:
	lla	a3,.LANCHOR2
	lla	a2,.LC25
	li	a1,2
	mv	a0,s0
	lw	s1,0(s1)
	call	luaL_checkoption
	sw	a0,0(sp)
	li	a2,0
	li	a1,3
	mv	a0,s0
	call	luaL_optinteger
	lw	a5,0(sp)
	lla	a4,.LANCHOR3
	mv	a1,a0
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a2,0(a5)
	mv	a0,s1
	call	fseek
	beq	a0,zero,.L240
	mv	a0,s0
	lw	s0,8(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	li	a2,0
	li	a1,0
	addi	sp,sp,16
	tail	luaL_fileresult
.L240:
	mv	a0,s1
	call	ftell
	mv	a1,a0
	mv	a0,s0
	call	lua_pushinteger
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	li	a0,1
	addi	sp,sp,16
	jr	ra
.L242:
	lla	a1,.LC11
	mv	a0,s0
	call	luaL_error
	j	.L239
	.size	f_seek, .-f_seek
	.section	.text.io_close,"ax",@progbits
	.align	2
	.type	io_close, @function
io_close:
	addi	sp,sp,-16
	li	a1,1
	sw	s0,8(sp)
	sw	ra,12(sp)
	mv	s0,a0
	call	lua_type
	li	a5,-1
	beq	a0,a5,.L247
	lla	a2,.LC1
	li	a1,1
	mv	a0,s0
	call	luaL_checkudata
	lw	a5,4(a0)
	beq	a5,zero,.L248
.L245:
	mv	a0,s0
	lla	a2,.LC1
	li	a1,1
	call	luaL_checkudata
	lw	a4,4(a0)
	mv	a5,a0
	mv	a0,s0
	sw	a4,0(sp)
	lw	s0,8(sp)
	lw	ra,12(sp)
	sw	zero,4(a5)
	lw	a5,0(sp)
	addi	sp,sp,16
	jr	a5
.L247:
	li	a1,-999424
	lla	a2,.LC6
	addi	a1,a1,-1576
	mv	a0,s0
	call	lua_getfield
	lla	a2,.LC1
	li	a1,1
	mv	a0,s0
	call	luaL_checkudata
	lw	a5,4(a0)
	bne	a5,zero,.L245
.L248:
	lla	a1,.LC11
	mv	a0,s0
	call	luaL_error
	j	.L245
	.size	io_close, .-io_close
	.section	.text.io_lines,"ax",@progbits
	.align	2
	.type	io_lines, @function
io_lines:
	addi	sp,sp,-12
	li	a1,1
	sw	s0,4(sp)
	sw	ra,8(sp)
	sw	s1,0(sp)
	mv	s0,a0
	call	lua_type
	li	a5,-1
	beq	a0,a5,.L254
.L250:
	li	a1,1
	mv	a0,s0
	call	lua_type
	mv	s1,a0
	bne	a0,zero,.L251
	li	a1,-999424
	lla	a2,.LC14
	addi	a1,a1,-1576
	mv	a0,s0
	call	lua_getfield
	li	a2,1
	li	a1,-1
	mv	a0,s0
	call	lua_copy
	li	a1,-2
	mv	a0,s0
	call	lua_settop
	lla	a2,.LC1
	li	a1,1
	mv	a0,s0
	call	luaL_checkudata
	lw	a5,4(a0)
	beq	a5,zero,.L255
.L252:
	mv	a0,s0
	mv	a1,s1
	call	aux_lines
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
.L251:
	li	a2,0
	li	a1,1
	mv	a0,s0
	call	luaL_checklstring
	mv	a1,a0
	lla	a2,.LC13
	mv	a0,s0
	call	opencheck
	li	a2,1
	li	a1,-1
	mv	a0,s0
	call	lua_copy
	li	a1,-2
	mv	a0,s0
	call	lua_settop
	li	s1,1
	j	.L252
.L254:
	mv	a0,s0
	call	lua_pushnil
	j	.L250
.L255:
	lla	a1,.LC11
	mv	a0,s0
	call	luaL_error
	j	.L252
	.size	io_lines, .-io_lines
	.section	.rodata.luaopen_io.str1.4,"aMS",@progbits,1
	.align	2
.LC26:
	.string	"__index"
	.align	2
.LC27:
	.string	"stdin"
	.align	2
.LC28:
	.string	"stdout"
	.align	2
.LC29:
	.string	"stderr"
	.section	.text.luaopen_io,"ax",@progbits
	.align	2
	.globl	luaopen_io
	.hidden	luaopen_io
	.type	luaopen_io, @function
luaopen_io:
	addi	sp,sp,-16
	li	a2,68
	li	a1,503
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	mv	s0,a0
	call	luaL_checkversion_
	mv	a0,s0
	li	a2,11
	li	a1,0
	call	lua_createtable
	li	a2,0
	mv	a0,s0
	lla	a1,.LANCHOR4
	call	luaL_setfuncs
	lla	a1,.LC1
	mv	a0,s0
	call	luaL_newmetatable
	mv	a0,s0
	li	a1,-1
	call	lua_pushvalue
	mv	a0,s0
	lla	a2,.LC26
	li	a1,-2
	call	lua_setfield
	li	a2,0
	mv	a0,s0
	lla	a1,.LANCHOR5
	call	luaL_setfuncs
	mv	a0,s0
	li	a1,-2
	call	lua_settop
	la a4, stdin; lw a4, 0(a4);
	li	a1,8
	mv	a0,s0
	sw	a4,0(sp)
	call	lua_newuserdata
	mv	s1,a0
	lla	a1,.LC1
	mv	a0,s0
	sw	zero,4(s1)
	call	luaL_setmetatable
	lw	a4,0(sp)
	lla	a5,io_noclose
	sw	a5,4(s1)
	mv	a0,s0
	sw	a4,0(s1)
	li	a1,-1
	call	lua_pushvalue
	li	a4,-999424
	addi	a1,a4,-1576
	mv	a0,s0
	lla	a2,.LC14
	call	lua_setfield
	lla	a2,.LC27
	mv	a0,s0
	li	a1,-2
	call	lua_setfield
	la a3, stdout; lw a3, 0(a3);
	li	a1,8
	mv	a0,s0
	sw	a3,0(sp)
	call	lua_newuserdata
	mv	s1,a0
	lla	a1,.LC1
	mv	a0,s0
	sw	zero,4(s1)
	call	luaL_setmetatable
	lw	a3,0(sp)
	lla	a5,io_noclose
	sw	a5,4(s1)
	sw	a3,0(s1)
	mv	a0,s0
	li	a1,-1
	call	lua_pushvalue
	li	a4,-999424
	addi	a1,a4,-1576
	mv	a0,s0
	lla	a2,.LC6
	call	lua_setfield
	lla	a2,.LC28
	mv	a0,s0
	li	a1,-2
	call	lua_setfield
	la a4, stderr; lw a4, 0(a4);
	li	a1,8
	mv	a0,s0
	sw	a4,0(sp)
	call	lua_newuserdata
	mv	s1,a0
	lla	a1,.LC1
	mv	a0,s0
	sw	zero,4(s1)
	call	luaL_setmetatable
	lw	a4,0(sp)
	lla	a5,io_noclose
	mv	a0,s0
	sw	a4,0(s1)
	sw	a5,4(s1)
	lla	a2,.LC29
	li	a1,-2
	call	lua_setfield
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	li	a0,1
	addi	sp,sp,16
	jr	ra
	.size	luaopen_io, .-luaopen_io
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC30:
	.string	"set"
	.align	2
.LC31:
	.string	"end"
	.align	2
.LC32:
	.string	"no"
	.align	2
.LC33:
	.string	"full"
	.align	2
.LC34:
	.string	"line"
	.align	2
.LC35:
	.string	"close"
	.align	2
.LC36:
	.string	"flush"
	.align	2
.LC37:
	.string	"lines"
	.align	2
.LC38:
	.string	"read"
	.align	2
.LC39:
	.string	"seek"
	.align	2
.LC40:
	.string	"setvbuf"
	.align	2
.LC41:
	.string	"write"
	.align	2
.LC42:
	.string	"__gc"
	.align	2
.LC43:
	.string	"__tostring"
	.align	2
.LC44:
	.string	"input"
	.align	2
.LC45:
	.string	"open"
	.align	2
.LC46:
	.string	"output"
	.align	2
.LC47:
	.string	"popen"
	.align	2
.LC48:
	.string	"tmpfile"
	.align	2
.LC49:
	.string	"type"
	.section	.rodata.flib,"a"
	.align	2
	.set	.LANCHOR5,. + 0
	.type	flib, @object
	.size	flib, 80
flib:
	.word	.LC35
	.word	io_close
	.word	.LC36
	.word	f_flush
	.word	.LC37
	.word	f_lines
	.word	.LC38
	.word	f_read
	.word	.LC39
	.word	f_seek
	.word	.LC40
	.word	f_setvbuf
	.word	.LC41
	.word	f_write
	.word	.LC42
	.word	f_gc
	.word	.LC43
	.word	f_tostring
	.word	0
	.word	0
	.section	.rodata.iolib,"a"
	.align	2
	.set	.LANCHOR4,. + 0
	.type	iolib, @object
	.size	iolib, 96
iolib:
	.word	.LC35
	.word	io_close
	.word	.LC36
	.word	io_flush
	.word	.LC44
	.word	io_input
	.word	.LC37
	.word	io_lines
	.word	.LC45
	.word	io_open
	.word	.LC46
	.word	io_output
	.word	.LC47
	.word	io_popen
	.word	.LC38
	.word	lua_io_read
	.word	.LC48
	.word	io_tmpfile
	.word	.LC49
	.word	io_type
	.word	.LC41
	.word	lua_io_write
	.word	0
	.word	0
	.section	.rodata.mode.0,"a"
	.align	2
	.set	.LANCHOR3,. + 0
	.type	mode.0, @object
	.size	mode.0, 12
mode.0:
	.word	0
	.word	1
	.word	2
	.section	.rodata.mode.2,"a"
	.align	2
	.set	.LANCHOR1,. + 0
	.type	mode.2, @object
	.size	mode.2, 12
mode.2:
	.word	2
	.word	0
	.word	1
	.section	.rodata.modenames.1,"a"
	.align	2
	.set	.LANCHOR2,. + 0
	.type	modenames.1, @object
	.size	modenames.1, 16
modenames.1:
	.word	.LC30
	.word	.LC25
	.word	.LC31
	.word	0
	.section	.rodata.modenames.3,"a"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	modenames.3, @object
	.size	modenames.3, 16
modenames.3:
	.word	.LC32
	.word	.LC33
	.word	.LC34
	.word	0
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
