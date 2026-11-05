#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"lstrlib.c"
	.option nopic
	.text
	.section	.text.str_len,"ax",@progbits
	.align	2
	.type	str_len, @function
str_len:
	addi	sp,sp,-16
	mv	a2,sp
	li	a1,1
	sw	ra,12(sp)
	sw	s0,8(sp)
	mv	s0,a0
	call	luaL_checklstring
	lw	a1,0(sp)
	mv	a0,s0
	call	lua_pushinteger
	lw	ra,12(sp)
	lw	s0,8(sp)
	li	a0,1
	addi	sp,sp,16
	jr	ra
	.size	str_len, .-str_len
	.section	.rodata.unpackint.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"%d-byte integer does not fit into Lua Integer"
	.section	.text.unpackint,"ax",@progbits
	.align	2
	.type	unpackint, @function
unpackint:
	addi	sp,sp,-32
	sw	s0,24(sp)
	sw	ra,28(sp)
	mv	s0,a3
	sw	s1,20(sp)
	li	a5,4
	mv	t0,a0
	mv	a3,a1
	mv	t1,a2
	ble	s0,a5,.L5
	li	s1,4
	li	a5,3
.L26:
	li	a2,0
	addi	t2,s0,-1
	li	a0,-1
.L9:
	mv	a1,a5
	slli	a2,a2,8
	bne	t1,zero,.L8
	sub	a1,t2,a5
.L8:
	add	a1,a3,a1
	lbu	a1,0(a1)
	addi	a5,a5,-1
	or	a2,a1,a2
	bne	a5,a0,.L9
	li	a5,3
	bgt	s0,a5,.L10
.L28:
	sw	a2,16(sp)
	beq	a4,zero,.L4
	slli	s0,s0,3
	addi	s0,s0,-1
	li	a5,1
	sll	a5,a5,s0
	xor	a4,a5,a2
	sub	a5,a4,a5
	sw	a5,16(sp)
.L4:
	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	a0,16(sp)
	lw	s1,20(sp)
	addi	sp,sp,32
	jr	ra
.L5:
	addi	a5,s0,-1
	mv	s1,s0
	bge	a5,zero,.L26
	li	a5,3
	li	a2,0
	ble	s0,a5,.L28
.L10:
	li	a5,4
	sw	a2,16(sp)
	beq	s0,a5,.L4
	bne	a4,zero,.L29
.L13:
	addi	s1,s1,1
	lla	t2,.LC0
	j	.L17
.L20:
	mv	s1,a5
.L17:
	mv	a2,s0
	mv	a1,t2
	mv	a0,t0
	addi	a5,s1,-1
	bne	t1,zero,.L15
	sub	a5,s0,s1
.L15:
	add	a5,a3,a5
	lbu	a5,0(a5)
	beq	a5,a4,.L16
	sw	a4,12(sp)
	sw	t1,8(sp)
	sw	a3,4(sp)
	sw	t0,0(sp)
	call	luaL_error
	lw	a4,12(sp)
	lw	t1,8(sp)
	lw	a3,4(sp)
	lw	t0,0(sp)
	lla	t2,.LC0
.L16:
	addi	a5,s1,1
	bgt	s0,s1,.L20
	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	a0,16(sp)
	lw	s1,20(sp)
	addi	sp,sp,32
	jr	ra
.L29:
	not	a4,a2
	srai	a4,a4,31
	andi	a4,a4,-255
	addi	a4,a4,255
	j	.L13
	.size	unpackint, .-unpackint
	.section	.rodata.classend.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"malformed pattern (ends with '%%')"
	.align	2
.LC2:
	.string	"malformed pattern (missing ']')"
	.section	.text.classend,"ax",@progbits
	.align	2
	.type	classend, @function
classend:
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	lbu	a4,0(a1)
	li	a3,37
	mv	a5,a1
	mv	s1,a0
	addi	s0,a1,1
	beq	a4,a3,.L31
	li	a3,91
	bne	a4,a3,.L30
	lbu	a3,1(a1)
	li	a4,94
	beq	a3,a4,.L43
.L35:
	lla	a1,.LC2
.L38:
	lw	a5,8(s1)
	beq	a5,s0,.L44
.L36:
	lbu	a3,0(s0)
	li	a4,37
	addi	a5,s0,1
	beq	a3,a4,.L45
.L40:
	mv	s0,a5
.L37:
	lbu	a4,0(s0)
	li	a5,93
	bne	a4,a5,.L38
	addi	s0,s0,1
.L30:
	lw	ra,12(sp)
	mv	a0,s0
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L45:
	lw	a4,8(s1)
	addi	s0,s0,2
	bleu	a4,a5,.L40
	j	.L37
.L44:
	lw	a0,12(s1)
	call	luaL_error
	lla	a1,.LC2
	j	.L36
.L31:
	lw	a4,8(a0)
	beq	a4,s0,.L46
	addi	s0,a5,2
.L47:
	lw	ra,12(sp)
	mv	a0,s0
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L43:
	addi	s0,a1,2
	j	.L35
.L46:
	lw	a0,12(a0)
	sw	a1,0(sp)
	lla	a1,.LC1
	call	luaL_error
	lw	a5,0(sp)
	addi	s0,a5,2
	j	.L47
	.size	classend, .-classend
	.section	.text.writer,"ax",@progbits
	.align	2
	.type	writer, @function
writer:
	addi	sp,sp,-12
	mv	a0,a3
	sw	ra,8(sp)
	call	luaL_addlstring
	lw	ra,8(sp)
	li	a0,0
	addi	sp,sp,12
	jr	ra
	.size	writer, .-writer
	.section	.text.str_upper,"ax",@progbits
	.align	2
	.type	str_upper, @function
str_upper:
	addi	sp,sp,-2044
	sw	s1,2032(sp)
	li	a5,4096
	li	s1,-4096
	sw	ra,2040(sp)
	sw	s0,2036(sp)
	addi	a2,s1,2028
	addi	sp,sp,-40
	addi	a5,a5,-2028
	add	a5,a5,a2
	addi	a4,sp,4
	add	a2,a5,a4
	li	a1,1
	mv	s0,a0
	call	luaL_checklstring
	li	a4,4096
	addi	a1,s1,2032
	lw	a2,4(sp)
	addi	a4,a4,-2028
	add	a4,a4,a1
	addi	a3,sp,4
	mv	a5,a0
	add	a1,a4,a3
	mv	a0,s0
	sw	a5,0(sp)
	call	luaL_buffinitsize
	lw	a1,4(sp)
	beq	a1,zero,.L51
	mv	s1,a0
	li	s0,0
.L52:
	lw	a5,0(sp)
	add	a4,a5,s0
	lbu	a0,0(a4)
	call	toupper
	add	a4,s1,s0
	sb	a0,0(a4)
	lw	a1,4(sp)
	addi	s0,s0,1
	bgtu	a1,s0,.L52
.L51:
	li	a0,-4096
	li	a5,4096
	addi	a0,a0,2032
	addi	a5,a5,-2028
	addi	a4,sp,4
	add	a5,a5,a0
	add	a0,a5,a4
	call	luaL_pushresultsize
	addi	sp,sp,40
	lw	ra,2040(sp)
	lw	s0,2036(sp)
	lw	s1,2032(sp)
	li	a0,1
	addi	sp,sp,2044
	jr	ra
	.size	str_upper, .-str_upper
	.section	.text.str_reverse,"ax",@progbits
	.align	2
	.type	str_reverse, @function
str_reverse:
	addi	sp,sp,-2044
	sw	s1,2032(sp)
	li	a5,4096
	li	s1,-4096
	addi	a2,s1,2028
	addi	a5,a5,-2028
	sw	ra,2040(sp)
	sw	s0,2036(sp)
	add	a5,a5,a2
	addi	sp,sp,-36
	add	a2,a5,sp
	li	a1,1
	mv	s0,a0
	call	luaL_checklstring
	li	a4,4096
	addi	a1,s1,2032
	lw	a2,0(sp)
	addi	a4,a4,-2028
	add	a4,a4,a1
	mv	a5,a0
	add	a1,a4,sp
	mv	a0,s0
	mv	s0,a5
	call	luaL_buffinitsize
	lw	a1,0(sp)
	beq	a1,zero,.L59
	li	a5,0
.L60:
	sub	a1,a1,a5
	add	a1,s0,a1
	lbu	a3,-1(a1)
	add	a4,a0,a5
	addi	a5,a5,1
	sb	a3,0(a4)
	lw	a1,0(sp)
	bgtu	a1,a5,.L60
.L59:
	li	a0,-4096
	li	a5,4096
	addi	a0,a0,2032
	addi	a5,a5,-2028
	add	a5,a5,a0
	add	a0,a5,sp
	call	luaL_pushresultsize
	addi	sp,sp,36
	lw	ra,2040(sp)
	lw	s0,2036(sp)
	lw	s1,2032(sp)
	li	a0,1
	addi	sp,sp,2044
	jr	ra
	.size	str_reverse, .-str_reverse
	.section	.rodata.str_rep.str1.4,"aMS",@progbits,1
	.align	2
.LC3:
	.string	""
	.globl	__udivsi3
	.globl	__divsi3
	.align	2
.LC4:
	.string	"resulting string too large"
	.globl	__mulsi3
	.section	.text.str_rep,"ax",@progbits
	.align	2
	.type	str_rep, @function
str_rep:
	addi	sp,sp,-2044
	li	a5,-4096
	li	a3,4096
	sw	ra,2040(sp)
	sw	s0,2036(sp)
	sw	s1,2032(sp)
	addi	a2,a5,2024
	addi	sp,sp,-60
	addi	a3,a3,-2024
	add	a3,a3,a2
	addi	a5,sp,20
	add	a2,a3,a5
	li	a1,1
	mv	s0,a0
	call	luaL_checklstring
	mv	s1,a0
	li	a1,2
	mv	a0,s0
	sw	s1,0(sp)
	call	luaL_checkinteger
	li	a4,-4096
	addi	a3,a4,2028
	li	a4,4096
	addi	a4,a4,-2024
	add	a4,a4,a3
	addi	a3,sp,20
	mv	a5,a0
	add	a3,a4,a3
	lla	a2,.LC3
	li	a1,3
	mv	a0,s0
	mv	s1,a5
	sw	a5,4(sp)
	call	luaL_optlstring
	sw	a0,8(sp)
	ble	s1,zero,.L80
	lw	a3,24(sp)
	lw	s1,20(sp)
	sw	a3,16(sp)
	add	a4,s1,a3
	sw	a4,12(sp)
	bgtu	s1,a4,.L69
	lw	a1,4(sp)
	li	a0,-2147483648
	xori	a0,a0,-1
	call	__udivsi3
	lw	a4,12(sp)
	lw	a3,16(sp)
	bleu	a4,a0,.L70
.L69:
	mv	a0,s0
	lla	a1,.LC4
	call	luaL_error
	addi	sp,sp,60
	lw	ra,2040(sp)
	lw	s0,2036(sp)
	lw	s1,2032(sp)
	addi	sp,sp,2044
	jr	ra
.L70:
	lw	a1,4(sp)
	mv	a0,s1
	sw	a3,12(sp)
	call	__mulsi3
	lw	a5,4(sp)
	lw	a3,12(sp)
	mv	a4,a0
	addi	s1,a5,-1
	mv	a1,a3
	mv	a0,s1
	sw	a4,12(sp)
	call	__mulsi3
	lw	a4,12(sp)
	addi	a5,sp,20
	add	a2,a4,a0
	li	a4,-4096
	addi	a1,a4,2032
	li	a4,4096
	addi	a4,a4,-2024
	add	a4,a4,a1
	add	a1,a4,a5
	mv	a0,s0
	sw	a2,12(sp)
	call	luaL_buffinitsize
	lw	a5,4(sp)
	li	a4,1
	lw	a2,20(sp)
	mv	s0,a0
	beq	a5,a4,.L74
.L73:
	lw	a1,0(sp)
	mv	a0,s0
	addi	s1,s1,-1
	call	memcpy
	lw	a2,20(sp)
	lw	a4,24(sp)
	add	s0,s0,a2
	bne	a4,zero,.L81
	bne	s1,zero,.L73
.L74:
	lw	a1,0(sp)
	mv	a0,s0
	call	memcpy
	li	a0,-4096
	li	a5,4096
	lw	a1,12(sp)
	addi	a0,a0,2032
	addi	a5,a5,-2024
	addi	a4,sp,20
	add	a5,a5,a0
	add	a0,a5,a4
	call	luaL_pushresultsize
	addi	sp,sp,60
	lw	ra,2040(sp)
	lw	s0,2036(sp)
	lw	s1,2032(sp)
	li	a0,1
	addi	sp,sp,2044
	jr	ra
.L81:
	lw	a1,8(sp)
	mv	a2,a4
	mv	a0,s0
	call	memcpy
	lw	a4,24(sp)
	lw	a2,20(sp)
	add	s0,s0,a4
	bne	s1,zero,.L73
	j	.L74
.L80:
	mv	a0,s0
	lla	a1,.LC3
	call	lua_pushstring
	addi	sp,sp,60
	lw	ra,2040(sp)
	lw	s0,2036(sp)
	lw	s1,2032(sp)
	li	a0,1
	addi	sp,sp,2044
	jr	ra
	.size	str_rep, .-str_rep
	.section	.text.str_lower,"ax",@progbits
	.align	2
	.type	str_lower, @function
str_lower:
	addi	sp,sp,-2044
	sw	s1,2032(sp)
	li	a5,4096
	li	s1,-4096
	sw	ra,2040(sp)
	sw	s0,2036(sp)
	addi	a2,s1,2028
	addi	sp,sp,-40
	addi	a5,a5,-2028
	add	a5,a5,a2
	addi	a4,sp,4
	add	a2,a5,a4
	li	a1,1
	mv	s0,a0
	call	luaL_checklstring
	li	a4,4096
	addi	a1,s1,2032
	lw	a2,4(sp)
	addi	a4,a4,-2028
	add	a4,a4,a1
	addi	a3,sp,4
	mv	a5,a0
	add	a1,a4,a3
	mv	a0,s0
	sw	a5,0(sp)
	call	luaL_buffinitsize
	lw	a1,4(sp)
	beq	a1,zero,.L83
	mv	s1,a0
	li	s0,0
.L84:
	lw	a5,0(sp)
	add	a4,a5,s0
	lbu	a0,0(a4)
	call	tolower
	add	a4,s1,s0
	sb	a0,0(a4)
	lw	a1,4(sp)
	addi	s0,s0,1
	bgtu	a1,s0,.L84
.L83:
	li	a0,-4096
	li	a5,4096
	addi	a0,a0,2032
	addi	a5,a5,-2028
	addi	a4,sp,4
	add	a5,a5,a0
	add	a0,a5,a4
	call	luaL_pushresultsize
	addi	sp,sp,40
	lw	ra,2040(sp)
	lw	s0,2036(sp)
	lw	s1,2032(sp)
	li	a0,1
	addi	sp,sp,2044
	jr	ra
	.size	str_lower, .-str_lower
	.section	.text.match_class,"ax",@progbits
	.align	2
	.type	match_class, @function
match_class:
	addi	sp,sp,-12
	sw	s0,4(sp)
	mv	s0,a0
	mv	a0,a1
	sw	s1,0(sp)
	sw	ra,8(sp)
	mv	s1,a1
	call	tolower
	addi	a0,a0,-97
	li	a5,25
	bgtu	a0,a5,.L91
	lla	a4,.L93
	slli	a0,a0,2
	add	a0,a0,a4
	lw	a5,0(a0)
	add	a5,a5,a4
	jr	a5
	.section	.rodata.match_class,"a",@progbits
	.align	2
	.align	2
.L93:
	.word	.L103-.L93
	.word	.L91-.L93
	.word	.L102-.L93
	.word	.L101-.L93
	.word	.L91-.L93
	.word	.L91-.L93
	.word	.L100-.L93
	.word	.L91-.L93
	.word	.L91-.L93
	.word	.L91-.L93
	.word	.L91-.L93
	.word	.L99-.L93
	.word	.L91-.L93
	.word	.L91-.L93
	.word	.L91-.L93
	.word	.L98-.L93
	.word	.L91-.L93
	.word	.L91-.L93
	.word	.L97-.L93
	.word	.L91-.L93
	.word	.L96-.L93
	.word	.L91-.L93
	.word	.L95-.L93
	.word	.L94-.L93
	.word	.L91-.L93
	.word	.L92-.L93
	.section	.text.match_class
.L91:
	sub	a1,s1,s0
	seqz	s0,a1
.L90:
	lw	ra,8(sp)
	mv	a0,s0
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L103:
	mv	a0,s0
	call	isalpha
	mv	s0,a0
.L104:
	mv	a0,s1
	call	islower
	bne	a0,zero,.L90
	seqz	s0,s0
	lw	ra,8(sp)
	mv	a0,s0
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L102:
	mv	a0,s0
	call	iscntrl
	mv	s0,a0
	j	.L104
.L101:
	mv	a0,s0
	call	isdigit
	mv	s0,a0
	j	.L104
.L100:
	mv	a0,s0
	call	isgraph
	mv	s0,a0
	j	.L104
.L99:
	mv	a0,s0
	call	islower
	mv	s0,a0
	j	.L104
.L98:
	mv	a0,s0
	call	ispunct
	mv	s0,a0
	j	.L104
.L97:
	mv	a0,s0
	call	isspace
	mv	s0,a0
	j	.L104
.L96:
	mv	a0,s0
	call	isupper
	mv	s0,a0
	j	.L104
.L95:
	mv	a0,s0
	call	isalnum
	mv	s0,a0
	j	.L104
.L94:
	mv	a0,s0
	call	isxdigit
	mv	s0,a0
	j	.L104
.L92:
	seqz	s0,s0
	j	.L104
	.size	match_class, .-match_class
	.section	.text.matchbracketclass,"ax",@progbits
	.align	2
	.type	matchbracketclass, @function
matchbracketclass:
	addi	sp,sp,-20
	sw	s0,12(sp)
	sw	s1,8(sp)
	sw	ra,16(sp)
	lbu	a4,1(a1)
	li	a3,1
	li	a5,94
	sw	a3,4(sp)
	mv	s0,a1
	mv	t1,a0
	mv	s1,a2
	bne	a4,a5,.L108
	addi	s0,a1,1
	sw	zero,4(sp)
.L108:
	addi	a4,s0,1
	li	t0,37
	bleu	s1,a4,.L114
.L113:
	lbu	a5,1(s0)
	lbu	a1,2(s0)
	beq	a5,t0,.L120
	li	a3,45
	beq	a1,a3,.L121
.L112:
	beq	t1,a5,.L107
	mv	s0,a4
.L111:
	addi	a4,s0,1
	bltu	a4,s1,.L113
.L114:
	lw	a5,4(sp)
	xori	a5,a5,1
	sw	a5,4(sp)
.L107:
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	a0,4(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L121:
	addi	a3,s0,3
	bgeu	a3,s1,.L112
	blt	t1,a5,.L116
	lbu	a5,3(s0)
	bge	a5,t1,.L107
.L116:
	mv	s0,a3
	j	.L111
.L120:
	mv	a0,t1
	sw	t1,0(sp)
	call	match_class
	lw	t1,0(sp)
	addi	s0,s0,2
	li	t0,37
	beq	a0,zero,.L111
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	a0,4(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
	.size	matchbracketclass, .-matchbracketclass
	.section	.text.gmatch,"ax",@progbits
	.align	2
	.type	gmatch, @function
gmatch:
	addi	sp,sp,-24
	addi	a2,sp,4
	li	a1,1
	sw	ra,20(sp)
	sw	s0,16(sp)
	sw	s1,12(sp)
	mv	s0,a0
	call	luaL_checklstring
	mv	s1,a0
	addi	a2,sp,8
	li	a1,2
	mv	a0,s0
	call	luaL_checklstring
	mv	a4,a0
	li	a1,2
	mv	a0,s0
	sw	a4,0(sp)
	call	lua_settop
	li	a1,292
	mv	a0,s0
	call	lua_newuserdata
	lw	a2,4(sp)
	lw	a3,8(sp)
	lw	a4,0(sp)
	mv	a5,a0
	add	a2,s1,a2
	add	a3,a4,a3
	li	a1,200
	mv	a0,s0
	sw	s0,24(a5)
	sw	a1,28(a5)
	sw	s1,12(a5)
	sw	a2,16(a5)
	sw	s1,0(a5)
	sw	a3,20(a5)
	sw	a4,4(a5)
	sw	zero,8(a5)
	li	a2,3
	lla	a1,gmatch_aux
	call	lua_pushcclosure
	lw	ra,20(sp)
	lw	s0,16(sp)
	lw	s1,12(sp)
	li	a0,1
	addi	sp,sp,24
	jr	ra
	.size	gmatch, .-gmatch
	.section	.rodata.str_char.str1.4,"aMS",@progbits,1
	.align	2
.LC5:
	.string	"value out of range"
	.section	.text.str_char,"ax",@progbits
	.align	2
	.type	str_char, @function
str_char:
	addi	sp,sp,-2044
	sw	ra,2040(sp)
	sw	s0,2036(sp)
	sw	s1,2032(sp)
	addi	sp,sp,-44
	mv	s1,a0
	call	lua_gettop
	li	a1,-4096
	li	a4,4096
	addi	a1,a1,2032
	addi	a4,a4,-2032
	add	a4,a4,a1
	addi	a5,sp,12
	sw	a0,0(sp)
	mv	a2,a0
	mv	s0,a0
	add	a1,a4,a5
	mv	a0,s1
	call	luaL_buffinitsize
	sw	a0,4(sp)
	ble	s0,zero,.L125
	li	s0,1
.L127:
	mv	a1,s0
	mv	a0,s1
	call	luaL_checkinteger
	mv	a4,a0
	andi	t0,a0,255
	mv	a1,s0
	lla	a2,.LC5
	mv	a0,s1
	andi	t1,a4,0xff
	beq	t0,a4,.L126
	sw	t1,8(sp)
	call	luaL_argerror
	lw	t1,8(sp)
.L126:
	lw	a5,4(sp)
	add	a4,a5,s0
	lw	a5,0(sp)
	sb	t1,-1(a4)
	addi	s0,s0,1
	bge	a5,s0,.L127
.L125:
	li	a0,-4096
	li	a5,4096
	lw	a1,0(sp)
	addi	a0,a0,2032
	addi	a5,a5,-2032
	addi	a4,sp,12
	add	a5,a5,a0
	add	a0,a5,a4
	call	luaL_pushresultsize
	addi	sp,sp,44
	lw	ra,2040(sp)
	lw	s0,2036(sp)
	lw	s1,2032(sp)
	li	a0,1
	addi	sp,sp,2044
	jr	ra
	.size	str_char, .-str_char
	.section	.text.addlenmod,"ax",@progbits
	.align	2
	.type	addlenmod, @function
addlenmod:
	addi	sp,sp,-24
	sw	ra,20(sp)
	sw	s0,16(sp)
	sw	s1,12(sp)
	mv	s0,a0
	sw	a1,0(sp)
	call	strlen
	lw	a1,0(sp)
	mv	s1,a0
	mv	a0,a1
	sw	a1,8(sp)
	call	strlen
	addi	a5,s1,-1
	add	a5,s0,a5
	lbu	a3,0(a5)
	lw	a1,8(sp)
	sw	a0,0(sp)
	mv	a0,a5
	sw	a3,4(sp)
	call	strcpy
	lw	a4,0(sp)
	lw	a3,4(sp)
	add	s1,s1,a4
	add	s0,s0,s1
	sb	a3,-1(s0)
	sb	zero,0(s0)
	lw	ra,20(sp)
	lw	s0,16(sp)
	lw	s1,12(sp)
	addi	sp,sp,24
	jr	ra
	.size	addlenmod, .-addlenmod
	.section	.rodata.str_format.str1.4,"aMS",@progbits,1
	.align	2
.LC6:
	.string	"0x%lx"
	.align	2
.LC7:
	.string	"%ld"
	.align	2
.LC8:
	.string	"no value"
	.align	2
.LC9:
	.string	"-+ #0"
	.align	2
.LC10:
	.string	"invalid format (repeated flags)"
	.align	2
.LC11:
	.string	"invalid format (width or precision too long)"
	.align	2
.LC12:
	.string	"l"
	.align	2
.LC13:
	.string	"\\%d"
	.align	2
.LC14:
	.string	"\\%03d"
	.align	2
.LC15:
	.string	"value has no literal form"
	.align	2
.LC16:
	.string	"string contains zeros"
	.align	2
.LC17:
	.string	"invalid option '%%%c' to 'format'"
	.section	.text.str_format,"ax",@progbits
	.align	2
	.type	str_format, @function
str_format:
	addi	sp,sp,-2044
	sw	ra,2040(sp)
	sw	s0,2036(sp)
	sw	s1,2032(sp)
	addi	sp,sp,-112
	mv	s1,a0
	call	lua_gettop
	li	s0,-4096
	li	a4,4096
	addi	a2,s0,1980
	addi	a4,a4,-1980
	add	a4,a4,a2
	addi	a3,sp,28
	mv	a5,a0
	add	a2,a4,a3
	li	a1,1
	mv	a0,s1
	sw	s1,16(sp)
	sw	a5,20(sp)
	call	luaL_checklstring
	lw	a4,28(sp)
	addi	a1,s0,2032
	mv	s1,a0
	add	s0,a0,a4
	li	a4,4096
	addi	a5,a4,-1980
	lw	a0,16(sp)
	add	a5,a5,a1
	addi	a4,sp,28
	add	a1,a5,a4
	sw	s0,8(sp)
	call	luaL_buffinit
	li	a5,1
	sw	a5,12(sp)
	bltu	s1,s0,.L133
	j	.L192
.L224:
	lw	a4,88(sp)
	lw	a3,84(sp)
	li	a0,-4096
	bgeu	a4,a3,.L223
.L136:
	li	a5,4096
	li	a3,-4096
	addi	a5,a5,-1980
	add	a5,a5,a3
	addi	a3,sp,28
	add	a5,a5,a3
	addi	a2,a4,1
	lw	a3,2032(a5)
	sw	a2,2040(a5)
	lbu	a2,0(s1)
	sw	a5,4(sp)
	add	a4,a3,a4
	lw	s1,0(sp)
	sb	a2,0(a4)
.L137:
	lw	a5,8(sp)
	bgeu	s1,a5,.L192
.L133:
	lbu	a4,0(s1)
	addi	a5,s1,1
	li	a3,37
	sw	a5,0(sp)
	bne	a4,a3,.L224
	lbu	a3,1(s1)
	bne	a3,a4,.L138
	lw	a4,88(sp)
	lw	a3,84(sp)
	li	a0,-4096
	bgeu	a4,a3,.L225
.L139:
	li	a5,4096
	li	a3,-4096
	addi	a5,a5,-1980
	add	a5,a5,a3
	addi	a3,sp,28
	add	a5,a5,a3
	addi	a2,a4,1
	lw	a3,2032(a5)
	sw	a2,2040(a5)
	lbu	a2,1(s1)
	sw	a5,0(sp)
	add	a4,a3,a4
	sb	a2,0(a4)
	lw	a5,8(sp)
	addi	s1,s1,2
	bltu	s1,a5,.L133
.L192:
	li	a0,-4096
	li	a5,4096
	addi	a0,a0,2032
	addi	a5,a5,-1980
	addi	a4,sp,28
	add	a5,a5,a0
	add	a0,a5,a4
	call	luaL_pushresult
	addi	sp,sp,112
	lw	ra,2040(sp)
	lw	s0,2036(sp)
	lw	s1,2032(sp)
	li	a0,1
	addi	sp,sp,2044
	jr	ra
.L223:
	li	a5,4096
	addi	a0,a0,2032
	addi	a5,a5,-1980
	addi	a4,sp,28
	add	a5,a5,a0
	add	a0,a5,a4
	li	a1,1
	call	luaL_prepbuffsize
	lw	a4,88(sp)
	j	.L136
.L138:
	li	a0,-4096
	li	a5,4096
	addi	a0,a0,2032
	addi	a5,a5,-1980
	add	a5,a5,a0
	addi	a4,sp,28
	add	a0,a5,a4
	li	a1,140
	call	luaL_prepbuffsize
	lw	a5,12(sp)
	lw	a4,20(sp)
	sw	a0,4(sp)
	addi	a5,a5,1
	sw	a5,12(sp)
	blt	a4,a5,.L226
.L140:
	lbu	a1,1(s1)
	lw	s0,0(sp)
	mv	s1,s0
	bne	a1,zero,.L141
	j	.L142
.L144:
	lbu	a1,1(s1)
	beq	a1,zero,.L195
.L141:
	lla	a0,.LC9
	call	strchr
	mv	s1,s0
	addi	s0,s0,1
	bne	a0,zero,.L144
	lw	a5,0(sp)
	li	a3,5
	sub	a4,s1,a5
	bgtu	a4,a3,.L145
.L218:
	lbu	a1,0(s1)
.L142:
	mv	a0,a1
	call	isdigit
	snez	a0,a0
	add	s1,s1,a0
	lbu	a0,0(s1)
	call	isdigit
	snez	a0,a0
	add	s1,s1,a0
	lbu	a0,0(s1)
	li	a4,46
	beq	a0,a4,.L227
.L148:
	call	isdigit
	bne	a0,zero,.L228
.L152:
	lw	a1,0(sp)
	li	s0,4096
	li	a3,-4096
	addi	a5,s0,-1980
	add	a5,a5,a3
	addi	a3,sp,28
	sub	a4,s1,a1
	add	a0,a5,a3
	addi	a2,a4,1
	li	t1,37
	addi	a0,a0,2001
	sw	a4,0(sp)
	sb	t1,48(sp)
	call	memcpy
	lw	a4,0(sp)
	addi	a5,s0,-1980
	li	a3,-4096
	add	a5,a5,a4
	addi	a4,sp,28
	add	a4,a5,a4
	add	a4,a3,a4
	sb	zero,2002(a4)
	lbu	a2,0(s1)
	li	a4,103
	addi	s1,s1,1
	bgtu	a2,a4,.L153
	li	a4,64
	bgtu	a2,a4,.L154
.L155:
	lw	a0,16(sp)
	lla	a1,.LC17
	call	luaL_error
	addi	sp,sp,112
	lw	ra,2040(sp)
	lw	s0,2036(sp)
	lw	s1,2032(sp)
	addi	sp,sp,2044
	jr	ra
.L145:
	lw	a0,16(sp)
	lla	a1,.LC10
	call	luaL_error
	j	.L218
.L154:
	addi	a4,a2,-65
	andi	a4,a4,0xff
	li	a3,38
	bgtu	a4,a3,.L155
	lla	a3,.L160
	slli	a4,a4,2
	add	a4,a4,a3
	lw	a4,0(a4)
	add	a4,a4,a3
	jr	a4
	.section	.rodata.str_format,"a",@progbits
	.align	2
	.align	2
.L160:
	.word	.L162-.L160
	.word	.L155-.L160
	.word	.L155-.L160
	.word	.L155-.L160
	.word	.L159-.L160
	.word	.L155-.L160
	.word	.L159-.L160
	.word	.L155-.L160
	.word	.L155-.L160
	.word	.L155-.L160
	.word	.L155-.L160
	.word	.L155-.L160
	.word	.L155-.L160
	.word	.L155-.L160
	.word	.L155-.L160
	.word	.L155-.L160
	.word	.L155-.L160
	.word	.L155-.L160
	.word	.L155-.L160
	.word	.L155-.L160
	.word	.L155-.L160
	.word	.L155-.L160
	.word	.L155-.L160
	.word	.L156-.L160
	.word	.L155-.L160
	.word	.L155-.L160
	.word	.L155-.L160
	.word	.L155-.L160
	.word	.L155-.L160
	.word	.L155-.L160
	.word	.L155-.L160
	.word	.L155-.L160
	.word	.L162-.L160
	.word	.L155-.L160
	.word	.L161-.L160
	.word	.L156-.L160
	.word	.L159-.L160
	.word	.L159-.L160
	.word	.L159-.L160
	.section	.text.str_format
.L153:
	addi	a1,a2,-105
	andi	a1,a1,0xff
	li	a4,15
	bgtu	a1,a4,.L155
	li	s0,1
	li	a0,36864
	sll	a4,s0,a1
	addi	a0,a0,65
	and	a4,a4,a0
	bne	a4,zero,.L156
	li	a0,8
	beq	a1,a0,.L157
	li	a0,10
	bne	a1,a0,.L155
	li	a5,4096
	addi	a3,a3,1988
	lw	a1,12(sp)
	lw	a0,16(sp)
	addi	a5,a5,-1980
	add	a5,a5,a3
	sw	a4,0(sp)
	addi	a4,sp,28
	add	a2,a5,a4
	call	luaL_tolstring
	lbu	a3,50(sp)
	lw	a4,0(sp)
	mv	s0,a0
	beq	a3,zero,.L191
	sw	a4,0(sp)
	call	strlen
	lw	a3,36(sp)
	lw	a4,0(sp)
	beq	a0,a3,.L189
	lw	a1,12(sp)
	lw	a0,16(sp)
	lla	a2,.LC16
	call	luaL_argerror
	lw	a4,0(sp)
.L189:
	li	a3,-4096
	li	a5,4096
	addi	a0,a3,2000
	addi	a5,a5,-1980
	sw	a4,0(sp)
	add	a5,a5,a0
	addi	a4,sp,28
	li	a1,46
	add	a0,a5,a4
	call	strchr
	beq	a0,zero,.L229
.L190:
	li	a2,-4096
	li	a5,4096
	addi	a2,a2,2000
	lw	a0,4(sp)
	addi	a5,a5,-1980
	addi	a4,sp,28
	add	a5,a5,a2
	mv	a3,s0
	add	a2,a5,a4
	li	a1,140
	call	snprintf
	mv	s0,a0
	lw	a0,16(sp)
	li	a1,-2
	call	lua_settop
	mv	a4,s0
.L188:
	li	a5,4096
	li	a3,-4096
	addi	a5,a5,-1980
	add	a5,a5,a3
	addi	a3,sp,28
	add	a5,a5,a3
	lw	a3,2040(a5)
	sw	a5,0(sp)
	add	a4,a4,a3
	j	.L164
.L195:
	lw	a5,0(sp)
	mv	s1,s0
	li	a3,5
	sub	a4,s1,a5
	bleu	a4,a3,.L218
	j	.L145
.L225:
	li	a5,4096
	addi	a0,a0,2032
	addi	a5,a5,-1980
	addi	a4,sp,28
	add	a5,a5,a0
	add	a0,a5,a4
	li	a1,1
	call	luaL_prepbuffsize
	lw	a4,88(sp)
	j	.L139
.L228:
	lw	a0,16(sp)
	lla	a1,.LC11
	call	luaL_error
	j	.L152
.L226:
	lw	a0,16(sp)
	lla	a2,.LC8
	mv	a1,a5
	call	luaL_argerror
	j	.L140
.L159:
	lw	a1,12(sp)
	lw	a0,16(sp)
	li	s0,-4096
	call	luaL_checknumber
	li	a5,4096
	addi	a2,s0,2000
	addi	a5,a5,-1980
	add	a5,a5,a2
	addi	a4,sp,28
	mv	a3,a0
	add	a2,a5,a4
	lla	a1,.LC3
.L222:
	mv	a0,a2
	sw	a2,24(sp)
	sw	a3,0(sp)
	call	addlenmod
	lw	a3,0(sp)
	lw	a2,24(sp)
.L221:
	lw	a0,4(sp)
	li	a1,140
	call	snprintf
	li	a5,4096
	addi	a5,a5,-1980
	addi	a4,sp,28
	add	a5,a5,s0
	add	a5,a5,a4
	lw	a4,2040(a5)
	sw	a5,0(sp)
	add	a4,a0,a4
.L164:
	li	a5,4096
	li	a3,-4096
	addi	a5,a5,-1980
	add	a5,a5,a3
	addi	a3,sp,28
	add	a5,a5,a3
	sw	a5,0(sp)
	sw	a4,2040(a5)
	j	.L137
.L162:
	li	s0,-4096
	li	a5,4096
	addi	a2,s0,2000
	addi	a5,a5,-1980
	add	a5,a5,a2
	addi	a4,sp,28
	add	a2,a5,a4
	mv	a0,a2
	lla	a1,.LC3
	sw	a2,0(sp)
	call	addlenmod
	lw	a1,12(sp)
	lw	a0,16(sp)
	call	luaL_checknumber
	lw	a2,0(sp)
	mv	a3,a0
	j	.L221
.L156:
	lw	a1,12(sp)
	lw	a0,16(sp)
	li	s0,-4096
	call	luaL_checkinteger
	li	a5,4096
	addi	a2,s0,2000
	addi	a5,a5,-1980
	add	a5,a5,a2
	addi	a4,sp,28
	mv	a3,a0
	add	a2,a5,a4
	lla	a1,.LC12
	j	.L222
.L161:
	lw	a1,12(sp)
	lw	a0,16(sp)
	li	s0,-4096
	call	luaL_checkinteger
	li	a5,4096
	addi	a2,s0,2000
	addi	a5,a5,-1980
	add	a5,a5,a2
	addi	a4,sp,28
	mv	a3,a0
	add	a2,a5,a4
	j	.L221
.L227:
	lbu	a0,1(s1)
	call	isdigit
	mv	a4,s1
	snez	s1,a0
	add	s1,s1,a4
	lbu	a0,1(s1)
	addi	s1,s1,1
	call	isdigit
	bne	a0,zero,.L151
	lbu	a0,0(s1)
	j	.L148
.L157:
	lw	a1,12(sp)
	lw	a0,16(sp)
	call	lua_type
	li	a4,3
	li	a3,-4096
	beq	a0,a4,.L165
	bgt	a0,a4,.L166
	bgtu	a0,s0,.L167
	lw	a1,12(sp)
	lw	a0,16(sp)
	li	a2,0
	call	luaL_tolstring
	li	a3,-4096
	li	a5,4096
	addi	a3,a3,2032
	addi	a5,a5,-1980
	addi	a4,sp,28
	add	a5,a5,a3
	add	a0,a5,a4
	call	luaL_addvalue
	lw	a4,88(sp)
	j	.L164
.L166:
	li	a4,4
	bne	a0,a4,.L167
	li	a5,4096
	addi	a2,a3,1984
	lw	a1,12(sp)
	lw	a0,16(sp)
	addi	a5,a5,-1980
	add	a5,a5,a2
	addi	a4,sp,28
	add	a2,a5,a4
	call	lua_tolstring
	lw	a2,88(sp)
	lw	a1,84(sp)
	lw	t1,32(sp)
	mv	s0,a0
	li	a3,-4096
	bgeu	a2,a1,.L230
.L169:
	li	a5,4096
	li	a3,-4096
	addi	a5,a5,-1980
	add	a5,a5,a3
	addi	a4,sp,28
	add	a5,a5,a4
	lw	a3,2032(a5)
	addi	a1,a2,1
	sw	a1,2040(a5)
	add	a3,a3,a2
	li	a2,34
	sw	a5,0(sp)
	sb	a2,0(a3)
	add	a5,s0,t1
	beq	t1,zero,.L183
	sw	s1,4(sp)
	mv	s1,s0
	mv	s0,a5
	j	.L182
.L234:
	li	a4,92
	beq	a0,a4,.L173
	li	a4,10
	beq	a0,a4,.L173
	call	iscntrl
	bne	a0,zero,.L231
	lw	a4,88(sp)
	lw	a2,84(sp)
	li	a3,-4096
	bgeu	a4,a2,.L232
.L181:
	li	a5,4096
	li	a3,-4096
	addi	a5,a5,-1980
	add	a5,a5,a3
	addi	a3,sp,28
	add	a5,a5,a3
	addi	a2,a4,1
	lw	a3,2032(a5)
	sw	a2,2040(a5)
	lbu	a2,0(s1)
	sw	a5,0(sp)
	add	a4,a3,a4
	sb	a2,0(a4)
.L177:
	addi	s1,s1,1
	beq	s0,s1,.L233
.L182:
	lbu	a0,0(s1)
	li	a5,34
	bne	a0,a5,.L234
.L173:
	lw	a4,88(sp)
	lw	a2,84(sp)
	li	a3,-4096
	bgeu	a4,a2,.L235
.L175:
	lw	a3,80(sp)
	addi	a1,a4,1
	sw	a1,88(sp)
	add	a4,a3,a4
	li	a3,92
	sb	a3,0(a4)
	lw	a4,88(sp)
	lw	a3,84(sp)
	li	a2,-4096
	bltu	a4,a3,.L181
	li	a5,4096
	addi	a2,a2,2032
	addi	a5,a5,-1980
	addi	a4,sp,28
	add	a5,a5,a2
	add	a0,a5,a4
	li	a1,1
	call	luaL_prepbuffsize
	lw	a4,88(sp)
	j	.L181
.L151:
	lbu	a0,1(s1)
	addi	s1,s1,1
	j	.L148
.L167:
	lw	a1,12(sp)
	lw	a0,16(sp)
	lla	a2,.LC15
	call	luaL_argerror
	li	a5,4096
	li	a4,-4096
	addi	a5,a5,-1980
	add	a5,a5,a4
	addi	a4,sp,28
	add	a5,a5,a4
	lw	a4,2040(a5)
	sw	a5,0(sp)
	j	.L164
.L229:
	li	a5,4096
	li	a3,-4096
	addi	a5,a5,-1980
	add	a5,a5,a3
	addi	a4,sp,28
	add	a5,a5,a4
	lw	a2,1988(a5)
	sw	a5,24(sp)
	li	a3,99
	lw	a4,0(sp)
	bleu	a2,a3,.L190
.L191:
	li	a0,-4096
	li	a5,4096
	addi	a0,a0,2032
	addi	a5,a5,-1980
	sw	a4,0(sp)
	add	a5,a5,a0
	addi	a4,sp,28
	add	a0,a5,a4
	call	luaL_addvalue
	lw	a4,0(sp)
	j	.L188
.L235:
	li	a5,4096
	addi	a3,a3,2032
	addi	a5,a5,-1980
	addi	a4,sp,28
	add	a5,a5,a3
	add	a0,a5,a4
	li	a1,1
	call	luaL_prepbuffsize
	lw	a4,88(sp)
	j	.L175
.L165:
	li	a5,4096
	addi	a3,a3,2032
	addi	a5,a5,-1980
	add	a5,a5,a3
	addi	a4,sp,28
	li	a1,140
	add	a0,a5,a4
	call	luaL_prepbuffsize
	lw	a1,12(sp)
	mv	s0,a0
	lw	a0,16(sp)
	call	lua_isinteger
	lw	a1,12(sp)
	li	a2,0
	bne	a0,zero,.L184
	lw	a0,16(sp)
	call	lua_tonumberx
	mv	a3,a0
.L220:
	lla	a2,.LC7
.L186:
	li	a1,140
	mv	a0,s0
	call	snprintf
	mv	a4,a0
	j	.L188
.L233:
	lw	s1,4(sp)
.L183:
	lw	a4,88(sp)
	lw	a2,84(sp)
	li	a3,-4096
	bgeu	a4,a2,.L236
.L171:
	li	a5,4096
	li	a3,-4096
	addi	a5,a5,-1980
	add	a5,a5,a3
	addi	a3,sp,28
	add	a5,a5,a3
	lw	a3,2032(a5)
	addi	a2,a4,1
	sw	a2,2040(a5)
	add	a4,a3,a4
	li	a3,34
	sb	a3,0(a4)
	lw	a4,2040(a5)
	sw	a5,0(sp)
	j	.L164
.L184:
	lw	a0,16(sp)
	call	lua_tointegerx
	li	a4,-2147483648
	mv	a3,a0
	lla	a2,.LC6
	bne	a0,a4,.L220
	j	.L186
.L230:
	li	a5,4096
	addi	a3,a3,2032
	addi	a5,a5,-1980
	add	a5,a5,a3
	addi	a4,sp,28
	li	a1,1
	add	a0,a5,a4
	sw	t1,0(sp)
	call	luaL_prepbuffsize
	lw	a2,88(sp)
	lw	t1,0(sp)
	j	.L169
.L236:
	li	a5,4096
	addi	a3,a3,2032
	addi	a5,a5,-1980
	addi	a4,sp,28
	add	a5,a5,a3
	add	a0,a5,a4
	li	a1,1
	call	luaL_prepbuffsize
	lw	a4,88(sp)
	j	.L171
.L231:
	lbu	a0,1(s1)
	call	isdigit
	lbu	a3,0(s1)
	lla	a2,.LC13
	beq	a0,zero,.L219
	lla	a2,.LC14
.L219:
	li	a0,-4096
	li	a5,4096
	addi	a0,a0,1988
	addi	a5,a5,-1980
	addi	a4,sp,28
	add	a5,a5,a0
	add	a0,a5,a4
	li	a1,10
	call	snprintf
	li	a3,4096
	li	a4,-4096
	addi	a1,a4,1988
	addi	a5,a3,-1980
	addi	a2,sp,28
	add	a5,a5,a1
	addi	a4,a4,2032
	add	a1,a5,a2
	addi	a5,a3,-1980
	add	a5,a5,a4
	add	a0,a5,a2
	call	luaL_addstring
	j	.L177
.L232:
	li	a5,4096
	addi	a3,a3,2032
	addi	a5,a5,-1980
	addi	a4,sp,28
	add	a5,a5,a3
	add	a0,a5,a4
	li	a1,1
	call	luaL_prepbuffsize
	lw	a4,88(sp)
	j	.L181
	.size	str_format, .-str_format
	.section	.rodata.str_dump.str1.4,"aMS",@progbits,1
	.align	2
.LC18:
	.string	"unable to dump given function"
	.section	.text.str_dump,"ax",@progbits
	.align	2
	.type	str_dump, @function
str_dump:
	addi	sp,sp,-2044
	sw	ra,2040(sp)
	sw	s0,2036(sp)
	sw	s1,2032(sp)
	li	a1,2
	addi	sp,sp,-36
	mv	s1,a0
	call	lua_toboolean
	mv	a3,a0
	li	a2,6
	li	a1,1
	mv	a0,s1
	sw	a3,0(sp)
	call	luaL_checktype
	li	a1,1
	mv	a0,s1
	call	lua_settop
	li	s0,-4096
	li	a5,4096
	addi	s0,s0,2032
	addi	a5,a5,-2032
	add	a5,a5,s0
	addi	a4,sp,4
	add	s0,a5,a4
	mv	a1,s0
	mv	a0,s1
	call	luaL_buffinit
	lw	a3,0(sp)
	mv	a2,s0
	lla	a1,writer
	mv	a0,s1
	call	lua_dump
	bne	a0,zero,.L241
	mv	a0,s0
	call	luaL_pushresult
	addi	sp,sp,36
	lw	ra,2040(sp)
	lw	s0,2036(sp)
	lw	s1,2032(sp)
	li	a0,1
	addi	sp,sp,2044
	jr	ra
.L241:
	mv	a0,s1
	lla	a1,.LC18
	call	luaL_error
	addi	sp,sp,36
	lw	ra,2040(sp)
	lw	s0,2036(sp)
	lw	s1,2032(sp)
	addi	sp,sp,2044
	jr	ra
	.size	str_dump, .-str_dump
	.section	.rodata.push_onecapture.str1.4,"aMS",@progbits,1
	.align	2
.LC19:
	.string	"invalid capture index %%%d"
	.align	2
.LC20:
	.string	"unfinished capture"
	.section	.text.push_onecapture,"ax",@progbits
	.align	2
	.type	push_onecapture, @function
push_onecapture:
	addi	sp,sp,-16
	sw	s1,4(sp)
	sw	ra,12(sp)
	sw	s0,8(sp)
	lbu	a4,20(a0)
	mv	s1,a0
	lw	a0,12(a0)
	bgt	a4,a1,.L243
	bne	a1,zero,.L244
	lw	s0,8(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	mv	a1,a2
	sub	a2,a3,a2
	addi	sp,sp,16
	tail	lua_pushlstring
.L243:
	slli	a5,a1,3
	add	s0,s1,a5
	lw	a2,28(s0)
	li	a5,-1
	beq	a2,a5,.L248
	li	a5,-2
	lw	a1,24(s0)
	beq	a2,a5,.L249
	lw	s0,8(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	tail	lua_pushlstring
.L244:
	lw	s0,8(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	addi	a2,a1,1
	lla	a1,.LC19
	addi	sp,sp,16
	tail	luaL_error
.L248:
	lla	a1,.LC20
	sw	a2,0(sp)
	call	luaL_error
	lw	a1,24(s0)
	lw	s0,8(sp)
	lw	a0,12(s1)
	lw	a2,0(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	tail	lua_pushlstring
.L249:
	lw	a5,0(s1)
	lw	s0,8(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	sub	a1,a1,a5
	addi	a1,a1,1
	addi	sp,sp,16
	tail	lua_pushinteger
	.size	push_onecapture, .-push_onecapture
	.section	.text.singlematch.part.0.isra.0,"ax",@progbits
	.align	2
	.type	singlematch.part.0.isra.0, @function
singlematch.part.0.isra.0:
	lbu	a4,0(a1)
	li	t1,46
	beq	a4,t1,.L254
	li	t1,91
	beq	a4,t1,.L252
	sub	a5,a4,a0
	li	a2,37
	seqz	a5,a5
	beq	a4,a2,.L255
	mv	a0,a5
	ret
.L254:
	li	a5,1
	mv	a0,a5
	ret
.L255:
	lbu	a1,1(a1)
	tail	match_class
.L252:
	addi	a2,a2,-1
	tail	matchbracketclass
	.size	singlematch.part.0.isra.0, .-singlematch.part.0.isra.0
	.section	.rodata.getnumlimit.str1.4,"aMS",@progbits,1
	.align	2
.LC21:
	.string	"integral size (%d) out of limits [1,%d]"
	.section	.text.getnumlimit,"ax",@progbits
	.align	2
	.type	getnumlimit, @function
getnumlimit:
	lw	a4,0(a1)
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lbu	a5,0(a4)
	li	a3,9
	mv	s0,a2
	addi	a5,a5,-48
	bgtu	a5,a3,.L257
	li	a2,214749184
	addi	a4,a4,1
	li	s0,0
	li	t1,9
	addi	a2,a2,-821
	j	.L259
.L262:
	addi	a4,a4,1
	bgt	s0,a2,.L258
.L259:
	sw	a4,0(a1)
	lbu	t0,-1(a4)
	lbu	a3,0(a4)
	slli	a5,s0,2
	add	a5,a5,s0
	slli	a5,a5,1
	addi	t0,t0,-48
	addi	a3,a3,-48
	add	s0,t0,a5
	bleu	a3,t1,.L262
.L258:
	addi	a5,s0,-1
	li	a4,15
	bleu	a5,a4,.L257
	lw	a0,0(a0)
	li	a3,16
	mv	a2,s0
	lla	a1,.LC21
	call	luaL_error
.L257:
	lw	ra,8(sp)
	mv	a0,s0
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
	.size	getnumlimit, .-getnumlimit
	.section	.text.str_sub,"ax",@progbits
	.align	2
	.type	str_sub, @function
str_sub:
	addi	sp,sp,-20
	addi	a2,sp,4
	li	a1,1
	sw	ra,16(sp)
	sw	s0,12(sp)
	sw	s1,8(sp)
	mv	s0,a0
	call	luaL_checklstring
	mv	s1,a0
	li	a1,2
	mv	a0,s0
	call	luaL_checkinteger
	lw	a4,4(sp)
	mv	a5,a0
	bge	a0,zero,.L264
	neg	a3,a0
	bgeu	a4,a3,.L273
	li	a5,0
.L264:
	li	a2,-1
	li	a1,3
	mv	a0,s0
	sw	a5,0(sp)
	call	luaL_optinteger
	lw	a4,4(sp)
	lw	a5,0(sp)
	bge	a0,zero,.L266
	neg	a3,a0
	bgeu	a4,a3,.L274
.L267:
	mv	a0,s0
	lla	a1,.LC3
	call	lua_pushstring
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	li	a0,1
	addi	sp,sp,20
	jr	ra
.L274:
	add	a0,a0,a4
	addi	a0,a0,1
.L266:
	ble	a5,zero,.L275
	bgt	a0,a4,.L276
.L269:
	blt	a0,a5,.L267
.L277:
	sub	a0,a0,a5
	addi	a5,a5,-1
	addi	a2,a0,1
	add	a1,s1,a5
	mv	a0,s0
	call	lua_pushlstring
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	li	a0,1
	addi	sp,sp,20
	jr	ra
.L276:
	mv	a0,a4
	bge	a0,a5,.L277
	j	.L267
.L275:
	li	a5,1
	ble	a0,a4,.L269
	j	.L276
.L273:
	add	a4,a4,a0
	addi	a5,a4,1
	j	.L264
	.size	str_sub, .-str_sub
	.section	.rodata.str_byte.str1.4,"aMS",@progbits,1
	.align	2
.LC22:
	.string	"string slice too long"
	.section	.text.str_byte,"ax",@progbits
	.align	2
	.type	str_byte, @function
str_byte:
	addi	sp,sp,-28
	addi	a2,sp,12
	li	a1,1
	sw	ra,24(sp)
	sw	s0,20(sp)
	sw	s1,16(sp)
	mv	s1,a0
	call	luaL_checklstring
	li	a2,1
	mv	s0,a0
	li	a1,2
	mv	a0,s1
	call	luaL_optinteger
	lw	a5,12(sp)
	mv	a2,a0
	bge	a0,zero,.L279
	neg	a4,a0
	bgeu	a5,a4,.L291
	li	a2,0
.L279:
	li	a1,3
	mv	a0,s1
	sw	a2,0(sp)
	call	luaL_optinteger
	lw	a4,12(sp)
	lw	a2,0(sp)
	bge	a0,zero,.L281
	neg	a5,a0
	sw	zero,4(sp)
	bgeu	a4,a5,.L292
.L278:
	lw	ra,24(sp)
	lw	s0,20(sp)
	lw	a0,4(sp)
	lw	s1,16(sp)
	addi	sp,sp,28
	jr	ra
.L292:
	add	a0,a0,a4
	addi	a0,a0,1
.L281:
	mv	a5,a2
	ble	a2,zero,.L293
	bgt	a0,a4,.L294
.L284:
	sw	zero,4(sp)
	bgt	a5,a0,.L278
.L295:
	sub	a4,a0,a5
	sw	a5,8(sp)
	addi	a5,a4,1
	lla	a2,.LC22
	mv	a1,a5
	mv	a0,s1
	sw	a4,0(sp)
	sw	a5,4(sp)
	call	luaL_checkstack
	lw	a5,8(sp)
	lw	a4,0(sp)
	add	a2,s0,a5
	addi	a3,a5,-1
	add	a5,a2,a4
	add	s0,s0,a3
	sw	a5,0(sp)
.L285:
	lbu	a1,0(s0)
	mv	a0,s1
	addi	s0,s0,1
	call	lua_pushinteger
	lw	a5,0(sp)
	bne	a5,s0,.L285
	lw	ra,24(sp)
	lw	s0,20(sp)
	lw	a0,4(sp)
	lw	s1,16(sp)
	addi	sp,sp,28
	jr	ra
.L294:
	mv	a0,a4
	sw	zero,4(sp)
	ble	a5,a0,.L295
	j	.L278
.L293:
	li	a5,1
	ble	a0,a4,.L284
	j	.L294
.L291:
	add	a5,a5,a0
	addi	a2,a5,1
	j	.L279
	.size	str_byte, .-str_byte
	.section	.rodata.getoption.str1.4,"aMS",@progbits,1
	.align	2
.LC23:
	.string	"missing size for format option 'c'"
	.align	2
.LC24:
	.string	"invalid format option '%c'"
	.section	.text.getoption,"ax",@progbits
	.align	2
	.type	getoption, @function
getoption:
	lw	a4,0(a1)
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	addi	a5,a4,1
	sw	a5,0(a1)
	mv	s0,a2
	lbu	a2,0(a4)
	li	a3,90
	sw	zero,0(s0)
	addi	a5,a2,-32
	andi	a5,a5,0xff
	mv	s1,a0
	bgtu	a5,a3,.L297
	lla	a3,.L299
	slli	a5,a5,2
	add	a5,a5,a3
	lw	a5,0(a5)
	add	a5,a5,a3
	jr	a5
	.section	.rodata.getoption,"a",@progbits
	.align	2
	.align	2
.L299:
	.word	.L328-.L299
	.word	.L316-.L299
	.word	.L297-.L299
	.word	.L297-.L299
	.word	.L297-.L299
	.word	.L297-.L299
	.word	.L297-.L299
	.word	.L297-.L299
	.word	.L297-.L299
	.word	.L297-.L299
	.word	.L297-.L299
	.word	.L297-.L299
	.word	.L297-.L299
	.word	.L297-.L299
	.word	.L297-.L299
	.word	.L297-.L299
	.word	.L297-.L299
	.word	.L297-.L299
	.word	.L297-.L299
	.word	.L297-.L299
	.word	.L297-.L299
	.word	.L297-.L299
	.word	.L297-.L299
	.word	.L297-.L299
	.word	.L297-.L299
	.word	.L297-.L299
	.word	.L297-.L299
	.word	.L297-.L299
	.word	.L315-.L299
	.word	.L315-.L299
	.word	.L314-.L299
	.word	.L297-.L299
	.word	.L297-.L299
	.word	.L297-.L299
	.word	.L313-.L299
	.word	.L297-.L299
	.word	.L297-.L299
	.word	.L297-.L299
	.word	.L297-.L299
	.word	.L297-.L299
	.word	.L312-.L299
	.word	.L311-.L299
	.word	.L310-.L299
	.word	.L297-.L299
	.word	.L310-.L299
	.word	.L297-.L299
	.word	.L297-.L299
	.word	.L297-.L299
	.word	.L297-.L299
	.word	.L297-.L299
	.word	.L297-.L299
	.word	.L297-.L299
	.word	.L310-.L299
	.word	.L297-.L299
	.word	.L297-.L299
	.word	.L297-.L299
	.word	.L309-.L299
	.word	.L297-.L299
	.word	.L297-.L299
	.word	.L297-.L299
	.word	.L297-.L299
	.word	.L297-.L299
	.word	.L297-.L299
	.word	.L297-.L299
	.word	.L297-.L299
	.word	.L297-.L299
	.word	.L308-.L299
	.word	.L307-.L299
	.word	.L306-.L299
	.word	.L297-.L299
	.word	.L302-.L299
	.word	.L297-.L299
	.word	.L305-.L299
	.word	.L304-.L299
	.word	.L303-.L299
	.word	.L297-.L299
	.word	.L303-.L299
	.word	.L297-.L299
	.word	.L302-.L299
	.word	.L297-.L299
	.word	.L297-.L299
	.word	.L297-.L299
	.word	.L297-.L299
	.word	.L301-.L299
	.word	.L297-.L299
	.word	.L297-.L299
	.word	.L297-.L299
	.word	.L297-.L299
	.word	.L300-.L299
	.word	.L297-.L299
	.word	.L323-.L299
	.section	.text.getoption
.L310:
	li	a5,4
	sw	a5,0(s0)
	li	a0,1
.L296:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L315:
	li	a5,1
	sw	a5,4(a0)
.L328:
	li	a0,8
	j	.L296
.L302:
	li	a5,4
	sw	a5,0(s0)
	li	a0,2
	j	.L296
.L303:
	li	a5,4
	sw	a5,0(s0)
	li	a0,0
	j	.L296
.L297:
	lw	a0,0(s1)
	lla	a1,.LC24
	call	luaL_error
	li	a0,8
	j	.L296
.L307:
	lbu	a5,1(a4)
	li	a3,9
	addi	a5,a5,-48
	bgtu	a5,a3,.L318
	li	a0,214749184
	addi	a4,a4,2
	li	t0,0
	li	t1,9
	addi	a0,a0,-821
	j	.L320
.L330:
	addi	a4,a4,1
	bgt	t0,a0,.L329
.L320:
	sw	a4,0(a1)
	lbu	a2,-1(a4)
	lbu	a3,0(a4)
	slli	a5,t0,2
	add	a5,a5,t0
	slli	a5,a5,1
	addi	a2,a2,-48
	addi	a3,a3,-48
	add	t0,a2,a5
	bleu	a3,t1,.L330
	sw	t0,0(s0)
	li	a5,-1
	li	a0,3
	bne	t0,a5,.L296
.L322:
	lw	a0,0(s1)
	lla	a1,.LC23
	call	luaL_error
	li	a0,3
	j	.L296
.L308:
	li	a5,1
	sw	a5,0(s0)
	li	a0,0
	j	.L296
.L305:
	li	a5,2
	sw	a5,0(s0)
	li	a0,0
	j	.L296
.L316:
	li	a2,8
	call	getnumlimit
	sw	a0,8(s1)
	li	a0,8
	j	.L296
.L309:
	li	a0,7
	j	.L296
.L300:
	li	a5,1
	sw	a5,0(s0)
	li	a0,6
	j	.L296
.L301:
	li	a2,4
	call	getnumlimit
	sw	a0,0(s0)
	li	a0,4
	j	.L296
.L311:
	li	a2,4
	call	getnumlimit
	sw	a0,0(s0)
	li	a0,1
	j	.L296
.L304:
	li	a2,4
	call	getnumlimit
	sw	a0,0(s0)
	li	a0,0
	j	.L296
.L306:
	li	a5,8
	sw	a5,0(s0)
	li	a0,2
	j	.L296
.L314:
	sw	zero,4(a0)
	li	a0,8
	j	.L296
.L312:
	li	a5,2
	sw	a5,0(s0)
	li	a0,1
	j	.L296
.L313:
	li	a5,1
	sw	a5,0(s0)
	li	a0,1
	j	.L296
.L323:
	li	a0,5
	j	.L296
.L318:
	li	a5,-1
	sw	a5,0(s0)
	j	.L322
.L329:
	sw	t0,0(s0)
	li	a0,3
	j	.L296
	.size	getoption, .-getoption
	.section	.rodata.getdetails.str1.4,"aMS",@progbits,1
	.align	2
.LC25:
	.string	"invalid next option for option 'X'"
	.align	2
.LC26:
	.string	"format asks for alignment not power of 2"
	.section	.text.getdetails,"ax",@progbits
	.align	2
	.type	getdetails, @function
getdetails:
	mv	t1,a2
	addi	sp,sp,-32
	mv	a5,a1
	mv	a2,a3
	mv	a1,t1
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	a3,4(sp)
	sw	t1,0(sp)
	sw	a5,8(sp)
	mv	s0,a4
	sw	ra,28(sp)
	mv	s1,a0
	call	getoption
	lw	a3,4(sp)
	li	a4,7
	lw	t1,0(sp)
	lw	a3,0(a3)
	mv	a5,a0
	sw	a3,16(sp)
	beq	a0,a4,.L350
	li	a4,1
	ble	a3,a4,.L336
	li	a4,3
	bne	a0,a4,.L341
.L336:
	li	a4,0
	lw	ra,28(sp)
	sw	a4,0(s0)
	lw	s0,24(sp)
	lw	s1,20(sp)
	mv	a0,a5
	addi	sp,sp,32
	jr	ra
.L350:
	lw	a4,0(t1)
	lbu	a4,0(a4)
	bne	a4,zero,.L351
.L333:
	lw	a0,0(s1)
	lla	a2,.LC25
	li	a1,1
	sw	a5,4(sp)
	sw	a3,0(sp)
	call	luaL_argerror
	lw	a3,0(sp)
	lw	a5,4(sp)
.L335:
	li	a4,1
	ble	a3,a4,.L336
.L341:
	lw	a4,8(s1)
	bge	a4,a3,.L352
	addi	a3,a4,-1
	and	a2,a3,a4
	bne	a2,zero,.L353
.L340:
	lw	a2,8(sp)
	lw	ra,28(sp)
	lw	s1,20(sp)
	and	a2,a2,a3
	sub	a4,a4,a2
	and	a4,a4,a3
	sw	a4,0(s0)
	lw	s0,24(sp)
	mv	a0,a5
	addi	sp,sp,32
	jr	ra
.L352:
	lw	a4,16(sp)
	addi	a3,a4,-1
	and	a2,a3,a4
	beq	a2,zero,.L340
.L353:
	lw	a0,0(s1)
	lla	a2,.LC26
	li	a1,1
	sw	a5,12(sp)
	sw	a3,4(sp)
	sw	a4,0(sp)
	call	luaL_argerror
	lw	a5,12(sp)
	lw	a3,4(sp)
	lw	a4,0(sp)
	j	.L340
.L351:
	sw	a0,0(sp)
	addi	a2,sp,16
	mv	a1,t1
	mv	a0,s1
	call	getoption
	li	a4,3
	lw	a5,0(sp)
	lw	a3,16(sp)
	beq	a0,a4,.L333
	bne	a3,zero,.L335
	lw	a0,0(s1)
	lla	a2,.LC25
	li	a1,1
	sw	a5,0(sp)
	call	luaL_argerror
	lw	a5,0(sp)
	j	.L336
	.size	getdetails, .-getdetails
	.section	.rodata.str_packsize.str1.4,"aMS",@progbits,1
	.align	2
.LC27:
	.string	"format result too large"
	.align	2
.LC28:
	.string	"variable-length format"
	.section	.text.str_packsize,"ax",@progbits
	.align	2
	.type	str_packsize, @function
str_packsize:
	addi	sp,sp,-44
	li	a1,1
	li	a2,0
	sw	s0,36(sp)
	sw	ra,40(sp)
	mv	s0,a0
	sw	s1,32(sp)
	call	luaL_checklstring
	li	a5,1
	sw	a0,8(sp)
	sw	s0,20(sp)
	sw	a5,24(sp)
	sw	a5,28(sp)
	lbu	a5,0(a0)
	li	a1,0
	beq	a5,zero,.L356
	addi	a4,sp,16
	addi	a3,sp,12
	addi	a2,sp,8
	li	a1,0
	addi	a0,sp,20
	call	getdetails
	lw	a3,12(sp)
	lw	a4,16(sp)
	mv	a5,a0
	li	s1,0
	add	a3,a3,a4
.L360:
	addi	a0,a5,-4
	li	a5,1
	add	s1,s1,a3
	bleu	a0,a5,.L363
.L358:
	lw	a5,8(sp)
	addi	a4,sp,16
	addi	a3,sp,12
	lbu	a5,0(a5)
	addi	a2,sp,8
	mv	a1,s1
	addi	a0,sp,20
	beq	a5,zero,.L356
.L359:
	call	getdetails
	lw	a5,16(sp)
	lw	a3,12(sp)
	li	a4,-2147483648
	xori	a4,a4,-1
	add	a3,a3,a5
	sub	a4,a4,a3
	mv	a5,a0
	bgeu	a4,s1,.L360
	sw	a0,4(sp)
	lla	a2,.LC27
	li	a1,1
	mv	a0,s0
	sw	a3,0(sp)
	call	luaL_argerror
	lw	a5,4(sp)
	lw	a3,0(sp)
	addi	a0,a5,-4
	li	a5,1
	add	s1,s1,a3
	bgtu	a0,a5,.L358
.L363:
	lla	a2,.LC28
	li	a1,1
	mv	a0,s0
	call	luaL_argerror
	lw	a5,8(sp)
	addi	a4,sp,16
	addi	a3,sp,12
	lbu	a5,0(a5)
	addi	a2,sp,8
	mv	a1,s1
	addi	a0,sp,20
	bne	a5,zero,.L359
.L356:
	mv	a0,s0
	call	lua_pushinteger
	lw	ra,40(sp)
	lw	s0,36(sp)
	lw	s1,32(sp)
	li	a0,1
	addi	sp,sp,44
	jr	ra
	.size	str_packsize, .-str_packsize
	.section	.rodata.str_unpack.str1.4,"aMS",@progbits,1
	.align	2
.LC29:
	.string	"AM Panic: "
	.align	2
.LC30:
	.string	"Assertion `0' failed"
	.align	2
.LC31:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/302.lua/src/lstrlib.c:1456  \n"
	.align	2
.LC32:
	.string	"initial position out of string"
	.align	2
.LC33:
	.string	"data string too short"
	.align	2
.LC34:
	.string	"too many results"
	.section	.text.str_unpack,"ax",@progbits
	.align	2
	.type	str_unpack, @function
str_unpack:
	addi	sp,sp,-96
	addi	a5,sp,63
	andi	a5,a5,-8
	li	a2,0
	li	a1,1
	sw	ra,92(sp)
	sw	s0,88(sp)
	sw	a5,24(sp)
	mv	s0,a0
	sw	s1,84(sp)
	sw	a0,0(sp)
	call	luaL_checklstring
	mv	a5,a0
	addi	a2,sp,32
	li	a1,2
	mv	a0,s0
	sw	a5,28(sp)
	call	luaL_checklstring
	mv	a5,a0
	li	a2,1
	li	a1,3
	mv	a0,s0
	sw	a5,16(sp)
	call	luaL_optinteger
	lw	a5,32(sp)
	bge	a0,zero,.L365
	neg	a4,a0
	bgeu	a5,a4,.L404
	li	s0,-1
.L366:
	lw	a0,0(sp)
	lla	a2,.LC32
	li	a1,3
	call	luaL_argerror
	j	.L367
.L404:
	add	a0,a5,a0
	addi	a0,a0,1
.L365:
	addi	s0,a0,-1
	bltu	a5,s0,.L366
.L367:
	li	a5,1
	lw	a4,0(sp)
	sw	a5,48(sp)
	sw	a5,52(sp)
	lw	a5,28(sp)
	sw	a4,44(sp)
	lbu	a5,0(a5)
	beq	a5,zero,.L390
	sw	zero,4(sp)
.L388:
	addi	a4,sp,40
	addi	a3,sp,36
	addi	a2,sp,28
	mv	a1,s0
	addi	a0,sp,44
	call	getdetails
	lw	a5,40(sp)
	lw	a3,36(sp)
	not	a4,s0
	sw	a5,12(sp)
	sw	a3,8(sp)
	add	a5,a5,a3
	mv	s1,a0
	bgtu	a5,a4,.L369
	lw	a4,32(sp)
	add	a5,a5,s0
	bleu	a5,a4,.L370
.L369:
	lw	a0,0(sp)
	lla	a2,.LC33
	li	a1,2
	call	luaL_argerror
.L370:
	lw	a0,0(sp)
	lla	a2,.LC34
	li	a1,2
	call	luaL_checkstack
	lw	a4,12(sp)
	li	a5,8
	add	s0,a4,s0
	lw	a4,4(sp)
	addi	t1,a4,1
	bgtu	s1,a5,.L371
	lla	a4,.L373
	slli	a5,s1,2
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a5,a5,a4
	jr	a5
	.section	.rodata.str_unpack,"a",@progbits
	.align	2
	.align	2
.L373:
	.word	.L378-.L373
	.word	.L378-.L373
	.word	.L377-.L373
	.word	.L376-.L373
	.word	.L375-.L373
	.word	.L374-.L373
	.word	.L372-.L373
	.word	.L372-.L373
	.word	.L372-.L373
	.section	.text.str_unpack
.L372:
	lw	a5,8(sp)
	mv	s1,t1
	add	s0,a5,s0
.L379:
	lw	a5,28(sp)
	lbu	a5,0(a5)
	bne	a5,zero,.L388
.L368:
	lw	a0,0(sp)
	addi	a1,s0,1
	call	lua_pushinteger
	lw	ra,92(sp)
	lw	s0,88(sp)
	mv	a0,s1
	lw	s1,84(sp)
	addi	sp,sp,96
	jr	ra
.L378:
	xori	a4,s1,1
	lw	a1,16(sp)
	lw	s1,0(sp)
	lw	a2,48(sp)
	lw	a3,8(sp)
	add	a1,a1,s0
	mv	a0,s1
	sw	t1,12(sp)
	call	unpackint
	lw	a4,4(sp)
	mv	a1,a0
	mv	a0,s1
	addi	s1,a4,2
	call	lua_pushinteger
	lw	a5,8(sp)
	lw	t1,12(sp)
	add	s0,a5,s0
	sw	t1,4(sp)
	j	.L379
.L374:
	lw	a5,16(sp)
	sw	t1,20(sp)
	add	s1,a5,s0
	mv	a0,s1
	call	strlen
	mv	a2,a0
	sw	a0,12(sp)
	lw	a0,0(sp)
	mv	a1,s1
	call	lua_pushlstring
	lw	a5,8(sp)
	lw	a2,12(sp)
	lw	t1,20(sp)
	addi	a5,a5,1
	add	s0,a5,s0
	lw	a5,4(sp)
	add	s0,s0,a2
	sw	t1,4(sp)
	addi	s1,a5,2
	j	.L379
.L375:
	lw	a1,16(sp)
	lw	a2,48(sp)
	lw	a3,8(sp)
	lw	a0,0(sp)
	li	a4,0
	add	a1,a1,s0
	sw	t1,12(sp)
	call	unpackint
	lw	a5,8(sp)
	lw	a4,32(sp)
	lw	t1,12(sp)
	add	a5,a5,s0
	add	s0,a0,a5
	mv	s1,a0
	bgtu	s0,a4,.L405
.L387:
	lw	a4,16(sp)
	lw	a0,0(sp)
	mv	a2,s1
	add	a1,a4,a5
	lw	a5,4(sp)
	sw	t1,8(sp)
	addi	s1,a5,2
	call	lua_pushlstring
	lw	t1,8(sp)
	sw	t1,4(sp)
	j	.L379
.L376:
	lw	a4,16(sp)
	lw	a2,8(sp)
	lw	a0,0(sp)
	add	a1,a4,s0
	lw	a4,4(sp)
	sw	t1,12(sp)
	addi	s1,a4,2
	call	lua_pushlstring
	lw	a5,8(sp)
	lw	t1,12(sp)
	add	s0,a5,s0
	sw	t1,4(sp)
	j	.L379
.L371:
	lw	a5,4(sp)
	sw	t1,4(sp)
	addi	s1,a5,2
	lw	a5,8(sp)
	add	s0,a5,s0
	j	.L379
.L405:
	lw	a0,0(sp)
	lla	a2,.LC33
	li	a1,2
	sw	a5,12(sp)
	sw	t1,8(sp)
	call	luaL_argerror
	lw	a5,12(sp)
	lw	t1,8(sp)
	j	.L387
.L390:
	li	s1,1
	j	.L368
.L377:
	lw	a5,8(sp)
	lw	a4,16(sp)
	lw	a2,48(sp)
	addi	a5,a5,-1
	li	a3,1
	add	s0,a4,s0
	mv	a4,a5
	beq	a2,a3,.L406
	lw	a5,24(sp)
	add	a4,a5,a4
	lw	a5,8(sp)
	beq	a5,zero,.L383
	add	a5,s0,a5
.L384:
	lbu	a3,0(s0)
	addi	s0,s0,1
	addi	a4,a4,-1
	andi	a3,a3,0xff
	sb	a3,1(a4)
	bne	a5,s0,.L384
.L383:
	lla	s0,.LC29
	li	a0,65
.L382:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L382
	lla	s0,.LC30
	li	a0,65
.L385:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L385
	lla	s0,.LC31
	li	a0,32
.L386:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L386
	li	a0,1
	call	halt
.L406:
	lw	a4,24(sp)
	lw	a3,8(sp)
	add	s0,s0,a5
	addi	a4,a4,-1
	add	a4,a4,a3
	li	a2,-1
	beq	a3,zero,.L383
.L381:
	sub	a3,s0,a5
	lbu	a3,0(a3)
	sub	a1,a4,a5
	addi	a5,a5,-1
	andi	a3,a3,0xff
	sb	a3,0(a1)
	bne	a5,a2,.L381
	j	.L383
	.size	str_unpack, .-str_unpack
	.section	.rodata.str_pack.str1.4,"aMS",@progbits,1
	.align	2
.LC35:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/302.lua/src/lstrlib.c:1319  \n"
	.align	2
.LC36:
	.string	"integer overflow"
	.align	2
.LC37:
	.string	"unsigned overflow"
	.align	2
.LC38:
	.string	"string longer than given size"
	.align	2
.LC39:
	.string	"string length does not fit in given size"
	.section	.text.str_pack,"ax",@progbits
	.align	2
	.type	str_pack, @function
str_pack:
	addi	sp,sp,-2044
	sw	ra,2040(sp)
	sw	s0,2036(sp)
	sw	s1,2032(sp)
	li	a2,0
	addi	sp,sp,-80
	li	a1,1
	mv	s1,a0
	sw	a0,16(sp)
	call	luaL_checklstring
	mv	a4,a0
	li	a5,1
	mv	a0,s1
	sw	a4,20(sp)
	sw	a5,40(sp)
	sw	a5,44(sp)
	sw	s1,36(sp)
	call	lua_pushnil
	li	s0,-4096
	li	a5,4096
	addi	a1,s0,2032
	addi	a5,a5,-2004
	add	a5,a5,a1
	addi	a4,sp,20
	add	a1,a5,a4
	mv	a0,s1
	call	luaL_buffinit
	lw	a5,20(sp)
	li	a4,1
	sw	zero,4(sp)
	sw	a4,12(sp)
	lbu	a5,0(a5)
	beq	a5,zero,.L458
.L408:
	li	s1,-4096
	li	s0,4096
	addi	a4,s1,2012
	addi	a5,s0,-2004
	add	a5,a5,a4
	addi	a4,sp,20
	addi	a3,s1,2008
	add	a4,a5,a4
	addi	a5,s0,-2004
	add	a5,a5,a3
	addi	a3,sp,20
	addi	a2,s1,2004
	add	a3,a5,a3
	addi	a5,s0,-2004
	add	a5,a5,a2
	addi	a2,sp,20
	addi	a0,s1,2020
	add	a2,a5,a2
	lw	a1,4(sp)
	addi	a5,s0,-2004
	add	a5,a5,a0
	addi	a0,sp,20
	add	a0,a5,a0
	call	getdetails
	addi	a5,s0,-2004
	add	a5,a5,s1
	addi	a4,sp,20
	add	a5,a5,a4
	sw	a5,0(sp)
	lw	a4,0(sp)
	lw	a5,2012(a5)
	lw	a3,4(sp)
	lw	s0,2008(a4)
	lw	a2,0(sp)
	addi	s1,a5,-1
	add	a4,a5,s0
	add	a4,a3,a4
	sw	a0,8(sp)
	sw	s1,2012(a2)
	sw	a4,4(sp)
	li	a3,-4096
	bgt	a5,zero,.L409
	j	.L421
.L420:
	lw	a4,48(sp)
	addi	a2,a5,1
	sw	a2,56(sp)
	add	a5,a4,a5
	addi	s1,s1,-1
	sb	zero,0(a5)
	sw	s1,28(sp)
	li	a5,-1
	beq	s1,a5,.L421
.L409:
	lw	a5,56(sp)
	lw	a4,52(sp)
	bltu	a5,a4,.L420
	li	a5,4096
	addi	a0,a3,2032
	addi	a5,a5,-2004
	add	a5,a5,a0
	addi	a4,sp,20
	add	a0,a5,a4
	li	a1,1
	call	luaL_prepbuffsize
	lw	a5,56(sp)
	li	a3,-4096
	j	.L420
.L421:
	lw	a4,12(sp)
	li	a5,8
	addi	s1,a4,1
	lw	a4,8(sp)
	bgtu	a4,a5,.L460
	slli	a5,a4,2
	lla	a4,.L412
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a5,a5,a4
	jr	a5
	.section	.rodata.str_pack,"a",@progbits
	.align	2
	.align	2
.L412:
	.word	.L419-.L412
	.word	.L418-.L412
	.word	.L417-.L412
	.word	.L416-.L412
	.word	.L415-.L412
	.word	.L414-.L412
	.word	.L413-.L412
	.word	.L410-.L412
	.word	.L410-.L412
	.section	.text.str_pack
.L418:
	lw	a0,16(sp)
	mv	a1,s1
	call	luaL_checkinteger
	li	a4,3
	mv	a5,a0
	mv	a3,a0
	bgt	s0,a4,.L435
	slli	a3,s0,3
	li	a4,1
	sll	a4,a4,a3
	mv	a3,a0
	bleu	a4,a0,.L485
.L435:
	sw	a5,8(sp)
	li	a4,-4096
	li	a5,4096
	lw	t0,40(sp)
	addi	a4,a4,2032
	addi	a5,a5,-2004
	add	a5,a5,a4
	addi	a4,sp,20
	add	a0,a5,a4
	mv	a1,s0
	sw	a3,12(sp)
	sw	t0,0(sp)
	call	luaL_prepbuffsize
	lw	t0,0(sp)
	lw	a5,8(sp)
	lw	a3,12(sp)
	mv	a2,a0
	mv	a4,a0
	bne	t0,zero,.L436
	addi	a4,s0,-1
	add	a4,a0,a4
.L436:
	sb	a5,0(a4)
	li	a5,1
	addi	a1,s0,-1
	ble	s0,a5,.L440
.L437:
	srli	a3,a3,8
	mv	a4,a5
	bne	t0,zero,.L439
	sub	a4,a1,a5
.L439:
	add	a4,a2,a4
	sb	a3,0(a4)
	addi	a5,a5,1
	bne	s0,a5,.L437
.L440:
	li	a4,4096
	li	a5,-4096
	addi	a4,a4,-2004
	add	a4,a4,a5
	addi	a5,sp,20
	add	a5,a4,a5
	sw	a5,0(sp)
	lw	a5,2040(a5)
	lw	a4,0(sp)
	sw	s1,12(sp)
	add	a5,a5,s0
	sw	a5,2040(a4)
.L410:
	li	a4,4096
	li	a5,-4096
	addi	a4,a4,-2004
	add	a4,a4,a5
	addi	a5,sp,20
	add	a5,a4,a5
	sw	a5,0(sp)
	lw	a5,2004(a5)
	lbu	a5,0(a5)
	bne	a5,zero,.L408
.L458:
	li	a0,-4096
	li	a5,4096
	addi	a0,a0,2032
	addi	a5,a5,-2004
	addi	a4,sp,20
	add	a5,a5,a0
	add	a0,a5,a4
	call	luaL_pushresult
	addi	sp,sp,80
	lw	ra,2040(sp)
	lw	s0,2036(sp)
	lw	s1,2032(sp)
	li	a0,1
	addi	sp,sp,2044
	jr	ra
.L413:
	lw	a5,56(sp)
	lw	a3,52(sp)
	li	a4,-4096
	bgeu	a5,a3,.L486
.L457:
	li	a3,4096
	li	a4,-4096
	addi	a3,a3,-2004
	add	a3,a3,a4
	addi	a4,sp,20
	add	a4,a3,a4
	sw	a4,0(sp)
	lw	a2,0(sp)
	lw	a4,2032(a4)
	addi	a3,a5,1
	sw	a3,2040(a2)
	add	a5,a4,a5
	sb	zero,0(a5)
	j	.L410
.L414:
	li	s0,-4096
	li	a5,4096
	addi	a2,s0,2016
	lw	a0,16(sp)
	addi	a5,a5,-2004
	add	a5,a5,a2
	addi	a4,sp,20
	add	a2,a5,a4
	mv	a1,s1
	call	luaL_checklstring
	li	a5,4096
	addi	a5,a5,-2004
	addi	a4,sp,20
	add	a5,a5,s0
	add	a5,a5,a4
	sw	a5,0(sp)
	sw	a0,8(sp)
	call	strlen
	lw	a5,0(sp)
	lw	a2,2016(a5)
	beq	a0,a2,.L455
	lw	a0,16(sp)
	lla	a2,.LC16
	mv	a1,s1
	call	luaL_argerror
	lw	a5,0(sp)
	lw	a2,2016(a5)
.L455:
	li	a5,-4096
	li	a3,4096
	addi	a0,a5,2032
	addi	a4,a3,-2004
	add	a4,a4,a0
	addi	a1,sp,20
	add	s0,a4,a1
	addi	a4,a3,-2004
	add	a4,a4,a5
	add	a5,a4,a1
	lw	a1,8(sp)
	mv	a0,s0
	sw	a5,0(sp)
	call	luaL_addlstring
	lw	a5,0(sp)
	lw	a4,0(sp)
	lw	a5,2040(a5)
	lw	a4,2036(a4)
	bgeu	a5,a4,.L487
.L456:
	li	a3,4096
	li	a4,-4096
	addi	a3,a3,-2004
	add	a3,a3,a4
	addi	a4,sp,20
	add	a4,a3,a4
	sw	a4,0(sp)
	lw	a2,0(sp)
	lw	a4,2032(a4)
	addi	a3,a5,1
	sw	a3,2040(a2)
	add	a5,a4,a5
	sb	zero,0(a5)
	lw	a5,2016(a2)
	lw	a4,4(sp)
	sw	s1,12(sp)
	addi	a5,a5,1
	add	a5,a4,a5
	sw	a5,4(sp)
	j	.L410
.L415:
	li	a5,-4096
	addi	a2,a5,2016
	li	a5,4096
	lw	a0,16(sp)
	addi	a5,a5,-2004
	add	a5,a5,a2
	addi	a4,sp,20
	add	a2,a5,a4
	mv	a1,s1
	call	luaL_checklstring
	li	a4,3
	mv	t0,a0
	li	a5,-4096
	ble	s0,a4,.L448
	li	a4,4096
	addi	a4,a4,-2004
	add	a4,a4,a5
	addi	a5,sp,20
	add	a5,a4,a5
	lw	a3,2016(a5)
	sw	a5,0(sp)
.L449:
	li	a5,-4096
	li	a4,4096
	lw	a2,40(sp)
	addi	a5,a5,2032
	addi	a4,a4,-2004
	add	a4,a4,a5
	addi	a5,sp,20
	add	a0,a4,a5
	mv	a1,s0
	sw	a3,12(sp)
	sw	t0,8(sp)
	sw	a2,0(sp)
	call	luaL_prepbuffsize
	lw	a2,0(sp)
	lw	t0,8(sp)
	lw	a3,12(sp)
	mv	a5,a0
	bne	a2,zero,.L450
	addi	a5,s0,-1
	add	a5,a0,a5
.L450:
	sb	a3,0(a5)
	li	a5,1
	addi	a1,s0,-1
	ble	s0,a5,.L454
.L451:
	srli	a3,a3,8
	mv	a4,a5
	bne	a2,zero,.L453
	sub	a4,a1,a5
.L453:
	add	a4,a0,a4
	sb	a3,0(a4)
	addi	a5,a5,1
	bne	s0,a5,.L451
.L454:
	lw	a4,56(sp)
	li	a5,-4096
	li	a3,4096
	addi	a5,a5,2032
	lw	a2,32(sp)
	addi	a3,a3,-2004
	add	a3,a3,a5
	addi	a5,sp,20
	add	a4,a4,s0
	add	a0,a3,a5
	mv	a1,t0
	sw	a4,56(sp)
	call	luaL_addlstring
	lw	a4,4(sp)
	lw	a5,32(sp)
	sw	s1,12(sp)
	add	a5,a4,a5
	sw	a5,4(sp)
	j	.L410
.L419:
	lw	a0,16(sp)
	mv	a1,s1
	call	luaL_checkinteger
	li	a5,3
	mv	t0,a0
	bgt	s0,a5,.L422
	slli	a4,s0,3
	addi	a4,a4,-1
	li	a5,1
	sll	a5,a5,a4
	neg	a4,a5
	bgt	a4,a0,.L423
	bge	a0,a5,.L423
.L422:
	li	a5,-4096
	li	a4,4096
	lw	a2,40(sp)
	addi	a5,a5,2032
	addi	a4,a4,-2004
	add	a4,a4,a5
	addi	a5,sp,20
	add	a0,a4,a5
	mv	a1,s0
	sw	t0,8(sp)
	sw	a2,0(sp)
	call	luaL_prepbuffsize
	lw	t0,8(sp)
	lw	a2,0(sp)
	mv	a5,a0
	mv	a3,t0
	bne	a2,zero,.L424
	addi	a5,s0,-1
	add	a5,a0,a5
.L424:
	sb	t0,0(a5)
	li	a5,1
	addi	a1,s0,-1
	ble	s0,a5,.L430
.L425:
	srli	a3,a3,8
	mv	a4,a5
	bne	a2,zero,.L429
	sub	a4,a1,a5
.L429:
	add	a4,a0,a4
	sb	a3,0(a4)
	addi	a5,a5,1
	bne	s0,a5,.L425
.L430:
	bge	t0,zero,.L440
	li	a5,4
	ble	s0,a5,.L440
	addi	a1,s0,-1
	li	a3,-1
.L433:
	mv	a4,a5
	bne	a2,zero,.L432
	sub	a4,a1,a5
.L432:
	add	a4,a0,a4
	sb	a3,0(a4)
	addi	a5,a5,1
	bne	s0,a5,.L433
	j	.L440
.L416:
	li	a5,-4096
	li	a3,4096
	addi	a2,a5,2016
	addi	a4,a3,-2004
	add	a4,a4,a2
	addi	a2,sp,20
	add	a2,a4,a2
	lw	a0,16(sp)
	addi	a4,a3,-2004
	add	a4,a4,a5
	addi	a5,sp,20
	add	a5,a4,a5
	mv	a1,s1
	sw	a5,0(sp)
	call	luaL_checklstring
	lw	a5,0(sp)
	lw	a2,2016(a5)
	mv	a5,a0
	bgtu	a2,s0,.L488
.L444:
	li	a4,-4096
	mv	a1,a5
	li	a5,4096
	addi	a0,a4,2032
	addi	a5,a5,-2004
	add	a5,a5,a0
	addi	a4,sp,20
	add	a0,a5,a4
	call	luaL_addlstring
	li	a5,4096
	li	a4,-4096
	addi	a5,a5,-2004
	add	a5,a5,a4
	addi	a4,sp,20
	add	a5,a5,a4
	sw	a5,0(sp)
	lw	a5,2016(a5)
	lw	a2,0(sp)
	li	a3,-4096
	addi	a4,a5,1
	sw	a4,2016(a2)
	bgtu	s0,a5,.L445
	j	.L460
.L446:
	lw	a4,48(sp)
	addi	a2,a5,1
	sw	a2,56(sp)
	add	a5,a4,a5
	sb	zero,0(a5)
	lw	a5,32(sp)
	addi	a4,a5,1
	sw	a4,32(sp)
	bleu	s0,a5,.L460
.L445:
	lw	a5,56(sp)
	lw	a4,52(sp)
	bltu	a5,a4,.L446
	li	a5,4096
	addi	a0,a3,2032
	addi	a5,a5,-2004
	add	a5,a5,a0
	addi	a4,sp,20
	add	a0,a5,a4
	li	a1,1
	call	luaL_prepbuffsize
	lw	a5,56(sp)
	li	a3,-4096
	j	.L446
.L423:
	lw	a0,16(sp)
	lla	a2,.LC36
	mv	a1,s1
	sw	t0,0(sp)
	call	luaL_argerror
	lw	t0,0(sp)
	j	.L422
.L460:
	sw	s1,12(sp)
	j	.L410
.L448:
	li	a4,4096
	addi	a4,a4,-2004
	add	a4,a4,a5
	addi	a5,sp,20
	add	a5,a4,a5
	lw	a3,2016(a5)
	sw	a5,0(sp)
	slli	a4,s0,3
	li	a5,1
	sll	a5,a5,a4
	bgtu	a5,a3,.L449
	sw	a0,8(sp)
	lw	a0,16(sp)
	lla	a2,.LC39
	mv	a1,s1
	call	luaL_argerror
	lw	a5,0(sp)
	lw	t0,8(sp)
	lw	a3,2016(a5)
	j	.L449
.L486:
	li	a5,4096
	addi	a4,a4,2032
	addi	a5,a5,-2004
	add	a5,a5,a4
	addi	a4,sp,20
	add	a0,a5,a4
	li	a1,1
	call	luaL_prepbuffsize
	lw	a5,56(sp)
	j	.L457
.L488:
	sw	a0,8(sp)
	lw	a0,16(sp)
	lla	a2,.LC38
	mv	a1,s1
	call	luaL_argerror
	lw	a5,0(sp)
	lw	a2,2016(a5)
	lw	a5,8(sp)
	j	.L444
.L487:
	li	a1,1
	mv	a0,s0
	call	luaL_prepbuffsize
	lw	a5,0(sp)
	lw	a5,2040(a5)
	j	.L456
.L485:
	sw	a0,8(sp)
	sw	a0,0(sp)
	lw	a0,16(sp)
	lla	a2,.LC37
	mv	a1,s1
	call	luaL_argerror
	lw	a3,8(sp)
	lw	a5,0(sp)
	j	.L435
.L417:
	li	a0,-4096
	li	a5,4096
	addi	a0,a0,2032
	addi	a5,a5,-2004
	add	a5,a5,a0
	addi	a4,sp,20
	mv	a1,s0
	add	a0,a5,a4
	call	luaL_prepbuffsize
	lw	a0,16(sp)
	mv	a1,s1
	lla	s0,.LC29
	call	luaL_checknumber
	li	a0,65
.L441:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L441
	lla	s0,.LC30
	li	a0,65
.L442:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L442
	lla	s0,.LC35
	li	a0,32
.L443:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L443
	li	a0,1
	call	halt
	.size	str_pack, .-str_pack
	.section	.rodata.match.str1.4,"aMS",@progbits,1
	.align	2
.LC40:
	.string	"pattern too complex"
	.align	2
.LC41:
	.string	"too many captures"
	.align	2
.LC42:
	.string	"invalid pattern capture"
	.align	2
.LC43:
	.string	"malformed pattern (missing arguments to '%%b')"
	.align	2
.LC44:
	.string	"missing '[' after '%%f' in pattern"
	.section	.text.match,"ax",@progbits
	.align	2
	.type	match, @function
match:
	lw	a4,16(a0)
	addi	sp,sp,-28
	sw	s0,20(sp)
	sw	s1,16(sp)
	sw	ra,24(sp)
	addi	a5,a4,-1
	sw	a5,16(a0)
	sw	a1,0(sp)
	mv	s0,a0
	mv	s1,a2
	beq	a4,zero,.L570
.L490:
	lw	a2,8(s0)
	li	a4,40
	beq	s1,a2,.L534
.L491:
	lbu	a5,0(s1)
	beq	a5,a4,.L493
	bgtu	a5,a4,.L494
	li	a3,36
	beq	a5,a3,.L495
	li	a3,37
	bne	a5,a3,.L497
	lbu	a5,1(s1)
	li	a3,98
	beq	a5,a3,.L505
	bgtu	a5,a3,.L506
	addi	a2,a5,-48
	andi	a1,a2,0xff
	li	a3,9
	bgtu	a1,a3,.L497
	addi	a0,a5,-49
	li	a3,-1
	beq	a0,a3,.L517
	lbu	a1,20(s0)
	bge	a0,a1,.L517
	addi	a5,a5,-47
	slli	a5,a5,3
	add	a5,s0,a5
	lw	t1,12(a5)
	beq	t1,a3,.L517
.L518:
	lw	a5,4(s0)
	lw	a4,0(sp)
	sub	a5,a5,a4
	bgtu	t1,a5,.L510
	addi	a5,a0,2
	slli	a5,a5,3
	add	a5,s0,a5
	lw	a0,8(a5)
	mv	a2,t1
	mv	a1,a4
	sw	t1,4(sp)
	call	memcmp
	bne	a0,zero,.L510
	lw	a4,0(sp)
	lw	t1,4(sp)
	addi	s1,s1,2
	add	a5,a4,t1
	sw	a5,0(sp)
	li	a4,40
	j	.L513
.L494:
	li	a3,41
	bne	a5,a3,.L497
	lbu	a4,20(s0)
	addi	a2,s1,1
	addi	a0,a4,-1
	beq	a4,zero,.L502
	slli	a4,a4,3
	addi	a4,a4,20
	add	a4,s0,a4
	li	a3,-1
	j	.L504
.L571:
	addi	a0,a0,-1
	beq	a0,a3,.L502
.L504:
	lw	a5,0(a4)
	addi	a4,a4,-8
	bne	a5,a3,.L571
.L503:
	slli	a0,a0,3
	add	s1,s0,a0
	lw	a5,0(sp)
	lw	a4,24(s1)
	mv	a0,s0
	mv	a1,a5
	sub	a4,a5,a4
	sw	a4,28(s1)
	call	match
	bne	a0,zero,.L492
	li	a5,-1
	sw	a5,28(s1)
	lw	a5,16(s0)
	lw	ra,24(sp)
	lw	s1,16(sp)
	addi	a5,a5,1
	sw	a5,16(s0)
	lw	s0,20(sp)
	addi	sp,sp,28
	jr	ra
.L495:
	addi	a5,s1,1
	beq	a2,a5,.L572
.L497:
	mv	a1,s1
	mv	a0,s0
	call	classend
	lw	a5,4(s0)
	lw	a3,0(sp)
	mv	a2,a0
	li	a4,40
	bleu	a5,a3,.L521
	lw	a5,0(sp)
	mv	a1,s1
	sw	a2,4(sp)
	lbu	a0,0(a5)
	call	singlematch.part.0.isra.0
	lw	a2,4(sp)
	li	a4,40
	beq	a0,zero,.L521
	lbu	a5,0(a2)
	li	a3,45
	beq	a5,a3,.L523
	bgtu	a5,a3,.L524
	li	a3,42
	beq	a5,a3,.L560
	li	a3,43
	bne	a5,a3,.L527
	lw	a5,0(sp)
	mv	a3,a2
	addi	a5,a5,1
	sw	a5,0(sp)
	j	.L525
.L521:
	lbu	a5,0(a2)
	li	a3,21
	addi	a5,a5,-42
	andi	a5,a5,0xff
	bleu	a5,a3,.L573
.L510:
	li	a0,0
.L492:
	lw	a5,16(s0)
	lw	ra,24(sp)
	lw	s1,16(sp)
	addi	a5,a5,1
	sw	a5,16(s0)
	lw	s0,20(sp)
	addi	sp,sp,28
	jr	ra
.L573:
	li	a3,-2097152
	addi	a3,a3,-10
	sra	a5,a3,a5
	andi	a5,a5,1
	bne	a5,zero,.L510
	addi	s1,a2,1
.L513:
	lw	a2,8(s0)
	bne	a2,s1,.L491
.L534:
	lw	a0,0(sp)
	j	.L492
.L506:
	li	a3,102
	bne	a5,a3,.L497
	lbu	a2,2(s1)
	li	a3,91
	addi	a5,s1,2
	bne	a2,a3,.L574
.L515:
	mv	a1,a5
	mv	a0,s0
	sw	a5,4(sp)
	call	classend
	lw	a3,0(s0)
	lw	a2,0(sp)
	mv	s1,a0
	lw	a5,4(sp)
	li	a0,0
	beq	a3,a2,.L516
	lbu	a0,-1(a2)
.L516:
	addi	a2,s1,-1
	mv	a1,a5
	sw	a2,8(sp)
	sw	a5,4(sp)
	call	matchbracketclass
	bne	a0,zero,.L510
	lw	a5,0(sp)
	lw	a2,8(sp)
	lbu	a0,0(a5)
	lw	a5,4(sp)
	mv	a1,a5
	call	matchbracketclass
	li	a4,40
	bne	a0,zero,.L513
	j	.L510
.L524:
	li	a3,63
	bne	a5,a3,.L527
	lw	a5,0(sp)
	addi	s1,a2,1
	mv	a2,s1
	addi	a1,a5,1
	mv	a0,s0
	call	match
	li	a4,40
	beq	a0,zero,.L513
	j	.L492
.L493:
	lbu	a2,1(s1)
	li	a3,41
	lbu	a4,20(s0)
	beq	a2,a3,.L575
	li	a3,31
	addi	a2,s1,1
	bgt	a4,a3,.L576
.L501:
	lw	a5,0(sp)
	slli	a3,a4,3
	add	a3,s0,a3
	sw	a5,24(a3)
	li	a1,-1
.L569:
	sw	a1,28(a3)
	addi	a4,a4,1
	sb	a4,20(s0)
	mv	a1,a5
	mv	a0,s0
	call	match
	bne	a0,zero,.L492
	lbu	a5,20(s0)
	addi	a5,a5,-1
	sb	a5,20(s0)
	lw	a5,16(s0)
	lw	ra,24(sp)
	lw	s1,16(sp)
	addi	a5,a5,1
	sw	a5,16(s0)
	lw	s0,20(sp)
	addi	sp,sp,28
	jr	ra
.L570:
	lw	a0,12(a0)
	lla	a1,.LC40
	call	luaL_error
	j	.L490
.L560:
	mv	a3,a2
.L525:
	lw	a2,4(s0)
	lw	a5,0(sp)
	li	a4,0
	bgeu	a5,a2,.L530
	mv	a2,a3
	mv	a1,s1
	mv	a3,s0
	mv	s1,a5
	mv	s0,a4
.L531:
	lbu	a0,0(s1)
	sw	a3,12(sp)
	sw	a2,8(sp)
	sw	a1,4(sp)
	call	singlematch.part.0.isra.0
	lw	a1,4(sp)
	lw	a2,8(sp)
	lw	a3,12(sp)
	addi	s1,s1,1
	beq	a0,zero,.L561
	lw	a5,4(a3)
	addi	s0,s0,1
	bgtu	a5,s1,.L531
.L561:
	mv	a4,s0
	mv	s0,a3
	mv	a3,a2
.L530:
	lw	a5,0(sp)
	addi	a2,a3,1
	add	s1,a5,a4
	j	.L533
.L539:
	mv	s1,a5
.L533:
	mv	a1,s1
	mv	a0,s0
	sw	a2,4(sp)
	call	match
	bne	a0,zero,.L492
	lw	a4,0(sp)
	lw	a2,4(sp)
	addi	a5,s1,-1
	bne	a4,s1,.L539
	j	.L510
.L505:
	addi	a5,s1,2
	addi	a2,a2,-1
	bgeu	a5,a2,.L577
.L509:
	lw	a3,0(sp)
	lbu	t1,2(s1)
	lbu	a5,0(a3)
	bne	a5,t1,.L510
	lw	t0,4(s0)
	addi	a5,a3,1
	lbu	t2,3(s1)
	bgeu	a5,t0,.L510
	sw	s1,0(sp)
	li	a0,1
	mv	s1,a3
	j	.L514
.L511:
	add	a0,a0,a3
.L512:
	mv	s1,a5
	beq	a1,t0,.L510
	mv	a5,a1
.L514:
	lbu	a2,0(a5)
	addi	a1,a5,1
	sub	a3,t1,a2
	seqz	a3,a3
	bne	t2,a2,.L511
	addi	a0,a0,-1
	bne	a0,zero,.L512
	mv	a5,s1
	lw	s1,0(sp)
	addi	a5,a5,2
	sw	a5,0(sp)
	addi	s1,s1,4
	j	.L513
.L527:
	lw	a5,0(sp)
	mv	s1,a2
	addi	a5,a5,1
	sw	a5,0(sp)
	j	.L513
.L576:
	lw	a0,12(s0)
	lla	a1,.LC41
	sw	a4,8(sp)
	sw	a2,4(sp)
	call	luaL_error
	lw	a4,8(sp)
	lw	a2,4(sp)
	j	.L501
.L502:
	lw	a0,12(s0)
	lla	a1,.LC42
	sw	a2,4(sp)
	call	luaL_error
	lw	a2,4(sp)
	j	.L503
.L517:
	lw	a0,12(s0)
	lla	a1,.LC19
	call	luaL_error
	addi	a5,a0,2
	slli	a5,a5,3
	add	a5,s0,a5
	lw	t1,12(a5)
	j	.L518
.L575:
	li	a3,31
	addi	a2,s1,2
	bgt	a4,a3,.L578
.L500:
	lw	a5,0(sp)
	slli	a3,a4,3
	add	a3,s0,a3
	sw	a5,24(a3)
	li	a1,-2
	j	.L569
.L523:
	sw	s1,12(sp)
	lw	s1,0(sp)
	addi	a5,a2,1
	sw	a5,4(sp)
	sw	a2,8(sp)
.L529:
	lw	a2,4(sp)
	mv	a1,s1
	mv	a0,s0
	call	match
	lw	a2,8(sp)
	lw	a1,12(sp)
	bne	a0,zero,.L492
	lw	a3,4(s0)
	bgeu	s1,a3,.L510
	lbu	a0,0(s1)
	addi	s1,s1,1
	call	singlematch.part.0.isra.0
	bne	a0,zero,.L529
	j	.L510
.L574:
	lw	a0,12(s0)
	lla	a1,.LC44
	sw	a5,4(sp)
	call	luaL_error
	lw	a5,4(sp)
	j	.L515
.L572:
	lw	a4,4(s0)
	lw	a0,0(sp)
	beq	a4,a0,.L492
	j	.L510
.L578:
	lw	a0,12(s0)
	lla	a1,.LC41
	sw	a4,8(sp)
	sw	a2,4(sp)
	call	luaL_error
	lw	a4,8(sp)
	lw	a2,4(sp)
	j	.L500
.L577:
	lw	a0,12(s0)
	lla	a1,.LC43
	call	luaL_error
	li	a4,40
	j	.L509
	.size	match, .-match
	.section	.text.gmatch_aux,"ax",@progbits
	.align	2
	.type	gmatch_aux, @function
gmatch_aux:
	li	a1,-999424
	addi	sp,sp,-24
	addi	a1,a1,-1579
	sw	s0,16(sp)
	sw	s1,12(sp)
	mv	s0,a0
	sw	ra,20(sp)
	call	lua_touserdata
	lw	s1,0(a0)
	lw	a3,16(a0)
	sw	s0,24(a0)
	mv	a5,a0
	addi	s0,a0,12
	bgtu	s1,a3,.L596
.L586:
	lw	a2,4(a5)
	sb	zero,32(a5)
	mv	a1,s1
	mv	a0,s0
	sw	a5,0(sp)
	call	match
	lw	a5,0(sp)
	mv	a3,a0
	beq	a0,zero,.L582
	lw	a2,8(a5)
	bne	a2,a0,.L597
.L582:
	lw	a3,16(a5)
	addi	s1,s1,1
	bgeu	a3,s1,.L586
.L596:
	lw	ra,20(sp)
	lw	s0,16(sp)
	li	a5,0
	lw	s1,12(sp)
	mv	a0,a5
	addi	sp,sp,24
	jr	ra
.L597:
	lbu	a4,32(a5)
	sw	a0,8(a5)
	sw	a0,0(a5)
	sw	a4,8(sp)
	sw	a3,0(sp)
	lw	a0,24(a5)
	beq	a4,zero,.L598
	lw	a1,8(sp)
	lla	a2,.LC41
	call	luaL_checkstack
	lw	a3,0(sp)
	li	a5,0
.L585:
	mv	a1,a5
	mv	a2,s1
	addi	a5,a5,1
	mv	a0,s0
	sw	a3,4(sp)
	sw	a5,0(sp)
	call	push_onecapture
	lw	a4,8(sp)
	lw	a5,0(sp)
	lw	a3,4(sp)
	bne	a4,a5,.L585
	lw	ra,20(sp)
	lw	s0,16(sp)
	lw	s1,12(sp)
	mv	a0,a5
	addi	sp,sp,24
	jr	ra
.L598:
	beq	s1,zero,.L584
	li	a1,1
	lla	a2,.LC41
	call	luaL_checkstack
	lw	a3,0(sp)
	mv	a0,s0
	mv	a2,s1
	li	a1,0
	call	push_onecapture
	lw	ra,20(sp)
	lw	s0,16(sp)
	li	a5,1
	lw	s1,12(sp)
	mv	a0,a5
	addi	sp,sp,24
	jr	ra
.L584:
	lla	a2,.LC41
	li	a1,0
	call	luaL_checkstack
	j	.L596
	.size	gmatch_aux, .-gmatch_aux
	.section	.rodata.str_gsub.str1.4,"aMS",@progbits,1
	.align	2
.LC45:
	.string	"string/function/table expected"
	.align	2
.LC46:
	.string	"invalid use of '%c' in replacement string"
	.align	2
.LC47:
	.string	"invalid replacement value (a %s)"
	.section	.text.str_gsub,"ax",@progbits
	.align	2
	.type	str_gsub, @function
str_gsub:
	addi	sp,sp,-2044
	sw	s1,2032(sp)
	li	a5,4096
	li	s1,-4096
	sw	ra,2040(sp)
	sw	s0,2036(sp)
	addi	a2,s1,1740
	addi	sp,sp,-368
	addi	a4,a5,-1740
	add	a4,a4,a2
	addi	a5,sp,44
	add	a2,a4,a5
	li	a1,1
	sw	a0,32(sp)
	call	luaL_checklstring
	li	a5,4096
	addi	a2,s1,1744
	addi	a3,a5,-1740
	mv	s0,a0
	lw	a0,32(sp)
	add	a3,a3,a2
	addi	a5,sp,44
	add	a2,a3,a5
	li	a1,2
	call	luaL_checklstring
	mv	a5,a0
	lw	a0,32(sp)
	li	a1,3
	sw	a5,16(sp)
	call	lua_type
	li	a4,4096
	addi	a4,a4,-1740
	addi	a5,sp,44
	add	a4,a4,s1
	add	a4,a4,a5
	lw	a2,1740(a4)
	lw	s1,32(sp)
	sw	a0,36(sp)
	li	a1,4
	addi	a2,a2,1
	mv	a0,s1
	sw	a4,0(sp)
	call	luaL_optinteger
	lw	a3,16(sp)
	lw	a4,36(sp)
	li	a5,3
	lbu	a3,0(a3)
	addi	a4,a4,-3
	sw	a0,28(sp)
	sw	a3,20(sp)
	bleu	a4,a5,.L600
	lla	a2,.LC45
	li	a1,3
	mv	a0,s1
	call	luaL_argerror
.L600:
	li	s1,-4096
	li	a5,4096
	addi	a1,s1,2032
	lw	a0,32(sp)
	addi	a5,a5,-1740
	add	a5,a5,a1
	addi	a4,sp,44
	add	a1,a5,a4
	call	luaL_buffinit
	lw	a4,20(sp)
	li	a5,94
	beq	a4,a5,.L601
	li	a5,4096
	addi	a5,a5,-1740
	add	a5,a5,s1
	addi	a4,sp,44
	add	a5,a5,a4
	sw	a5,0(sp)
	lw	a5,1744(a5)
.L602:
	li	a3,4096
	li	a4,-4096
	addi	a3,a3,-1740
	add	a3,a3,a4
	addi	a4,sp,44
	add	a4,a3,a4
	lw	a3,16(sp)
	sw	a4,0(sp)
	lw	a2,32(sp)
	add	a5,a3,a5
	lw	a3,0(sp)
	lw	a4,1740(a4)
	sw	zero,4(sp)
	sw	a2,1764(a3)
	lw	a2,0(sp)
	add	a4,s0,a4
	li	a3,200
	sw	a3,1768(a2)
	sw	s0,1752(a2)
	sw	a4,1756(a2)
	sw	a5,1760(a2)
	li	s1,0
.L603:
	lw	a5,4(sp)
	lw	a4,28(sp)
	bge	a5,a4,.L639
	li	a5,-4096
	li	a4,4096
	addi	a5,a5,1752
	addi	a4,a4,-1740
	add	a4,a4,a5
	lw	a2,16(sp)
	addi	a5,sp,44
	add	a5,a4,a5
	mv	a1,s0
	mv	a0,a5
	sw	a5,8(sp)
	sb	zero,76(sp)
	call	match
	sw	a0,0(sp)
	beq	a0,zero,.L604
	beq	s1,a0,.L604
	lw	a2,4(sp)
	lw	a0,68(sp)
	li	a4,5
	addi	a2,a2,1
	sw	a2,4(sp)
	lw	a2,36(sp)
	sw	a0,12(sp)
	lw	a5,8(sp)
	beq	a2,a4,.L605
	li	a4,6
	bne	a2,a4,.L606
	li	a1,3
	call	lua_pushvalue
	lbu	a4,76(sp)
	lw	a5,8(sp)
	sw	a4,24(sp)
	bne	a4,zero,.L607
	lw	a0,68(sp)
	beq	s0,zero,.L608
	li	a1,1
	lla	a2,.LC41
	call	luaL_checkstack
	lw	a5,8(sp)
	lw	a3,0(sp)
	mv	a2,s0
	li	a1,0
	mv	a0,a5
	call	push_onecapture
	lw	a0,12(sp)
	li	s1,1
	li	a4,0
	li	a3,0
	li	a2,1
	mv	a1,s1
	call	lua_callk
.L644:
	lw	s1,12(sp)
	li	a1,-1
	mv	a0,s1
	call	lua_toboolean
	beq	a0,zero,.L640
.L622:
	lw	a0,12(sp)
	li	a1,-1
	call	lua_isstring
	bne	a0,zero,.L623
	lw	s0,12(sp)
	li	a1,-1
	mv	a0,s0
	call	lua_type
	mv	a1,a0
	mv	a0,s0
	call	lua_typename
	mv	a2,a0
	lla	a1,.LC47
	mv	a0,s0
	call	luaL_error
	j	.L623
.L604:
	lw	a2,60(sp)
	bleu	a2,s0,.L624
	lw	a5,344(sp)
	lw	a4,340(sp)
	bgeu	a5,a4,.L641
.L625:
	addi	a3,a5,1
	lw	a4,336(sp)
	sw	a3,344(sp)
	lbu	a3,0(s0)
	add	a5,a4,a5
	addi	s0,s0,1
	sb	a3,0(a5)
.L613:
	lw	a4,20(sp)
	li	a5,94
	bne	a4,a5,.L603
.L639:
	li	a4,4096
	li	a5,-4096
	addi	a4,a4,-1740
	add	a4,a4,a5
	addi	a5,sp,44
	add	a5,a4,a5
	lw	a2,1756(a5)
	sw	a5,0(sp)
.L624:
	li	a5,-4096
	li	a4,4096
	addi	a5,a5,2032
	addi	a4,a4,-1740
	add	a4,a4,a5
	addi	a5,sp,44
	add	s1,a4,a5
	sub	a2,a2,s0
	mv	a1,s0
	mv	a0,s1
	call	luaL_addlstring
	mv	a0,s1
	call	luaL_pushresult
	lw	a0,32(sp)
	lw	a1,4(sp)
	call	lua_pushinteger
	addi	sp,sp,368
	lw	ra,2040(sp)
	lw	s0,2036(sp)
	lw	s1,2032(sp)
	li	a0,2
	addi	sp,sp,2044
	jr	ra
.L641:
	li	a5,-4096
	addi	a0,a5,2032
	li	a5,4096
	addi	a5,a5,-1740
	add	a5,a5,a0
	addi	a4,sp,44
	add	a0,a5,a4
	li	a1,1
	call	luaL_prepbuffsize
	lw	a5,344(sp)
	j	.L625
.L606:
	li	a5,-4096
	addi	a2,a5,1748
	li	a5,4096
	lw	a0,12(sp)
	addi	a5,a5,-1740
	add	a5,a5,a2
	addi	a4,sp,44
	add	a2,a5,a4
	li	a1,3
	call	lua_tolstring
	lw	a5,52(sp)
	li	s1,0
	beq	a5,zero,.L621
	sw	s0,40(sp)
	mv	s0,a0
	j	.L612
.L615:
	addi	a1,a4,1
	lw	a3,336(sp)
	sw	a1,344(sp)
	lbu	a2,0(a2)
	add	a4,a3,a4
	sb	a2,0(a4)
.L616:
	lw	a4,52(sp)
	addi	s1,s1,1
	bgeu	s1,a4,.L621
.L612:
	add	a2,s0,s1
	lbu	a4,0(a2)
	li	a3,37
	beq	a4,a3,.L614
	lw	a4,344(sp)
	lw	a3,340(sp)
	bltu	a4,a3,.L615
	li	a5,-4096
	addi	a0,a5,2032
	li	a5,4096
	addi	a5,a5,-1740
	addi	a4,sp,44
	add	a5,a5,a0
	add	a0,a5,a4
	li	a1,1
	sw	a2,8(sp)
	call	luaL_prepbuffsize
	lw	a4,344(sp)
	lw	a2,8(sp)
	j	.L615
.L614:
	addi	s1,s1,1
	add	a3,s0,s1
	lbu	a0,0(a3)
	sw	a3,8(sp)
	sw	a4,24(sp)
	call	isdigit
	lw	a3,8(sp)
	bne	a0,zero,.L617
	lbu	a2,0(a3)
	lw	a4,24(sp)
	beq	a2,a4,.L618
	lw	a0,12(sp)
	li	a2,37
	lla	a1,.LC46
	call	luaL_error
	lw	a3,8(sp)
.L618:
	lw	a4,344(sp)
	lw	a2,340(sp)
	bgeu	a4,a2,.L642
.L619:
	addi	a1,a4,1
	lw	a2,336(sp)
	sw	a1,344(sp)
	lbu	a3,0(a3)
	add	a4,a2,a4
	addi	s1,s1,1
	sb	a3,0(a4)
	lw	a4,52(sp)
	bltu	s1,a4,.L612
.L621:
	lw	s1,0(sp)
	mv	s0,s1
	j	.L613
.L605:
	lw	a3,0(sp)
	mv	a0,a5
	mv	a2,s0
	li	a1,0
	call	push_onecapture
	lw	a0,12(sp)
	li	a1,3
	call	lua_gettable
	lw	s1,12(sp)
	li	a1,-1
	mv	a0,s1
	call	lua_toboolean
	bne	a0,zero,.L622
.L640:
	mv	a0,s1
	li	a1,-2
	call	lua_settop
	lw	a5,0(sp)
	mv	a1,s0
	mv	a0,s1
	sub	a2,a5,s0
	call	lua_pushlstring
.L623:
	li	a5,-4096
	addi	a0,a5,2032
	li	a5,4096
	lw	s1,0(sp)
	addi	a5,a5,-1740
	add	a5,a5,a0
	addi	a4,sp,44
	add	a0,a5,a4
	call	luaL_addvalue
	mv	s0,s1
	j	.L613
.L617:
	lbu	a1,0(a3)
	li	a4,48
	li	a5,-4096
	beq	a1,a4,.L643
	li	a4,4096
	lw	a3,0(sp)
	lw	a2,40(sp)
	addi	a0,a5,1752
	addi	a4,a4,-1740
	addi	a5,sp,44
	add	a4,a4,a0
	add	a0,a4,a5
	addi	a1,a1,-49
	call	push_onecapture
	lw	a0,12(sp)
	li	a2,0
	li	a1,-1
	call	luaL_tolstring
	lw	a0,12(sp)
	li	a2,-1
	li	a1,-2
	call	lua_rotate
	lw	a0,12(sp)
	li	a1,-2
	call	lua_settop
	li	a5,-4096
	li	a4,4096
	addi	a0,a5,2032
	addi	a5,a4,-1740
	add	a5,a5,a0
	addi	a4,sp,44
	add	a0,a5,a4
	call	luaL_addvalue
	j	.L616
.L607:
	lw	a0,68(sp)
	lw	a1,24(sp)
	lla	a2,.LC41
	sw	a5,8(sp)
	call	luaL_checkstack
	lw	a5,8(sp)
	li	s1,0
	mv	a0,a5
.L610:
	lw	a3,0(sp)
	mv	a1,s1
	mv	a2,s0
	sw	a0,8(sp)
	call	push_onecapture
	lw	a5,24(sp)
	addi	s1,s1,1
	lw	a0,8(sp)
	bne	a5,s1,.L610
	lw	a0,12(sp)
	li	a4,0
	li	a3,0
	li	a2,1
	mv	a1,s1
	call	lua_callk
	j	.L644
.L643:
	lw	a4,0(sp)
	addi	a0,a5,2032
	lw	a5,40(sp)
	sub	a2,a4,a5
	mv	a1,a5
	li	a5,4096
	addi	a5,a5,-1740
	add	a5,a5,a0
	addi	a4,sp,44
	add	a0,a5,a4
	call	luaL_addlstring
	j	.L616
.L642:
	li	a5,-4096
	addi	a0,a5,2032
	li	a5,4096
	addi	a5,a5,-1740
	addi	a4,sp,44
	add	a5,a5,a0
	add	a0,a5,a4
	li	a1,1
	sw	a3,8(sp)
	call	luaL_prepbuffsize
	lw	a4,344(sp)
	lw	a3,8(sp)
	j	.L619
.L601:
	li	a5,4096
	addi	a5,a5,-1740
	addi	a4,sp,44
	add	a5,a5,s1
	add	a5,a5,a4
	lw	a4,16(sp)
	sw	a5,0(sp)
	lw	a5,1744(a5)
	addi	a4,a4,1
	sw	a4,16(sp)
	lw	a4,0(sp)
	addi	a5,a5,-1
	sw	a5,1744(a4)
	j	.L602
.L608:
	lla	a2,.LC41
	li	a1,0
	call	luaL_checkstack
	lw	a0,12(sp)
	li	s1,0
	li	a4,0
	li	a3,0
	li	a2,1
	mv	a1,s1
	call	lua_callk
	j	.L644
	.size	str_gsub, .-str_gsub
	.section	.rodata.str_find_aux.str1.4,"aMS",@progbits,1
	.align	2
.LC48:
	.string	"^$*+?.([%-"
	.section	.text.str_find_aux,"ax",@progbits
	.align	2
	.type	str_find_aux, @function
str_find_aux:
	addi	sp,sp,-328
	mv	a5,a1
	addi	a2,sp,28
	li	a1,1
	sw	ra,324(sp)
	sw	s0,320(sp)
	sw	s1,316(sp)
	sw	a5,16(sp)
	mv	s1,a0
	sw	a0,8(sp)
	call	luaL_checklstring
	mv	a5,a0
	addi	a2,sp,32
	li	a1,2
	mv	a0,s1
	sw	a5,12(sp)
	call	luaL_checklstring
	mv	s0,a0
	li	a2,1
	li	a1,3
	mv	a0,s1
	call	luaL_optinteger
	lw	a5,28(sp)
	bge	a0,zero,.L646
	neg	a4,a0
	bgeu	a5,a4,.L694
.L672:
	li	a4,1
	sw	a4,20(sp)
	lw	a4,16(sp)
	lw	s1,12(sp)
	beq	a4,zero,.L650
.L696:
	lw	a0,8(sp)
	li	a1,4
	call	lua_toboolean
	lw	a5,32(sp)
	sw	a5,4(sp)
	bne	a0,zero,.L655
	li	a4,0
	sw	s1,24(sp)
	sw	s0,0(sp)
	mv	s1,a4
	j	.L654
.L652:
	call	strlen
	lw	a5,4(sp)
	addi	a0,a0,1
	add	s1,s1,a0
	bltu	a5,s1,.L695
.L654:
	lw	a5,0(sp)
	lla	a1,.LC48
	add	a5,a5,s1
	mv	a0,a5
	mv	s0,a5
	call	strpbrk
	mv	a3,a0
	mv	a0,s0
	beq	a3,zero,.L652
	lw	s0,0(sp)
	lw	s1,24(sp)
	lw	a5,28(sp)
	j	.L653
.L694:
	add	a0,a5,a0
	addi	a0,a0,1
.L646:
	ble	a0,zero,.L672
	addi	a4,a5,1
	blt	a4,a0,.L648
	lw	a3,12(sp)
	addi	a4,a0,-1
	sw	a0,20(sp)
	add	s1,a3,a4
	lw	a4,16(sp)
	bne	a4,zero,.L696
.L650:
	lw	a4,32(sp)
	sw	a4,4(sp)
.L653:
	lbu	a4,0(s0)
	mv	a3,a4
	sw	a4,0(sp)
	li	a4,94
	bne	a3,a4,.L660
	lw	a4,4(sp)
	addi	s0,s0,1
	addi	a4,a4,-1
	sw	a4,4(sp)
	sw	a4,32(sp)
.L660:
	lw	a2,12(sp)
	lw	a3,8(sp)
	add	a4,a2,a5
	lw	a5,4(sp)
	sw	a3,48(sp)
	li	a3,200
	add	a5,s0,a5
	sw	a5,44(sp)
	mv	a5,s1
	sw	a3,52(sp)
	mv	s1,s0
	sw	a2,36(sp)
	sw	a4,40(sp)
	mv	s0,a5
	j	.L670
.L661:
	lw	a5,40(sp)
	bleu	a5,s0,.L648
	lw	a5,0(sp)
	li	a4,94
	addi	s0,s0,1
	beq	a5,a4,.L648
.L670:
	mv	a1,s0
	mv	a2,s1
	addi	a0,sp,36
	sb	zero,56(sp)
	call	match
	beq	a0,zero,.L661
	lw	a5,16(sp)
	mv	a3,a0
	mv	s1,s0
	beq	a5,zero,.L662
	lw	s0,12(sp)
	sw	a0,0(sp)
	sub	a1,s1,s0
	lw	s1,8(sp)
	addi	a1,a1,1
	mv	a0,s1
	call	lua_pushinteger
	lw	a3,0(sp)
	mv	a0,s1
	sub	a1,a3,s0
	call	lua_pushinteger
	lbu	s1,56(sp)
	lw	a0,48(sp)
	lla	a2,.LC41
	mv	a1,s1
	call	luaL_checkstack
	li	s0,0
	beq	s1,zero,.L665
.L663:
	mv	a1,s0
	li	a3,0
	addi	s0,s0,1
	li	a2,0
	addi	a0,sp,36
	call	push_onecapture
	bne	s1,s0,.L663
.L665:
	lw	ra,324(sp)
	lw	s0,320(sp)
	addi	a5,s1,2
	mv	a0,a5
	lw	s1,316(sp)
	addi	sp,sp,328
	jr	ra
.L695:
	lw	s0,0(sp)
	lw	s1,24(sp)
.L655:
	lw	a4,4(sp)
	lw	a5,28(sp)
	bne	a4,zero,.L697
	mv	s0,s1
	bne	s1,zero,.L658
.L648:
	lw	a0,8(sp)
	call	lua_pushnil
	li	a5,1
.L645:
	lw	ra,324(sp)
	lw	s0,320(sp)
	lw	s1,316(sp)
	mv	a0,a5
	addi	sp,sp,328
	jr	ra
.L697:
	lw	a3,20(sp)
	addi	a5,a5,1
	sub	a5,a5,a3
	bltu	a5,a4,.L648
	addi	a3,a4,-1
	sw	a3,16(sp)
	sub	a4,a5,a3
	beq	a5,a3,.L648
	lbu	a5,0(s0)
	sw	a5,20(sp)
	addi	a5,s0,1
	sw	a5,24(sp)
	mv	s0,a4
	j	.L657
.L659:
	sw	a5,4(sp)
	sw	a3,0(sp)
	call	memcmp
	lw	a3,0(sp)
	lw	a5,4(sp)
	sub	s1,a3,s1
	sub	s0,s0,s1
	beq	a0,zero,.L691
	beq	s0,zero,.L648
	mv	s1,a3
.L657:
	lw	a1,20(sp)
	mv	a2,s0
	mv	a0,s1
	call	memchr
	mv	a5,a0
	addi	a3,a0,1
	lw	a2,16(sp)
	lw	a1,24(sp)
	mv	a0,a3
	bne	a5,zero,.L659
	j	.L648
.L662:
	lbu	s0,56(sp)
	sw	a3,0(sp)
	lw	a0,48(sp)
	bne	s0,zero,.L666
	beq	s1,zero,.L667
	li	a1,1
	lla	a2,.LC41
	call	luaL_checkstack
	lw	a3,0(sp)
	mv	a2,s1
	li	a1,0
	addi	a0,sp,36
	call	push_onecapture
	li	a5,1
	j	.L645
.L691:
	mv	s0,a5
.L658:
	lw	a5,12(sp)
	lw	s1,8(sp)
	sub	s0,s0,a5
	addi	a1,s0,1
	mv	a0,s1
	call	lua_pushinteger
	lw	a1,32(sp)
	li	a5,2
	mv	a0,s1
	add	a1,s0,a1
	sw	a5,0(sp)
	call	lua_pushinteger
	lw	a5,0(sp)
	j	.L645
.L666:
	mv	a1,s0
	lla	a2,.LC41
	call	luaL_checkstack
	lw	a3,0(sp)
	li	a5,0
	sw	s0,4(sp)
	mv	s0,a5
.L668:
	mv	a1,s0
	mv	a2,s1
	addi	a0,sp,36
	sw	a3,0(sp)
	call	push_onecapture
	lw	a5,4(sp)
	addi	s0,s0,1
	lw	a3,0(sp)
	bne	a5,s0,.L668
	mv	a5,s0
	j	.L645
.L667:
	lla	a2,.LC41
	li	a1,0
	call	luaL_checkstack
	li	a5,0
	j	.L645
	.size	str_find_aux, .-str_find_aux
	.section	.text.str_match,"ax",@progbits
	.align	2
	.type	str_match, @function
str_match:
	li	a1,0
	tail	str_find_aux
	.size	str_match, .-str_match
	.section	.text.str_find,"ax",@progbits
	.align	2
	.type	str_find, @function
str_find:
	li	a1,1
	tail	str_find_aux
	.size	str_find, .-str_find
	.section	.rodata.luaopen_string.str1.4,"aMS",@progbits,1
	.align	2
.LC49:
	.string	"__index"
	.section	.text.luaopen_string,"ax",@progbits
	.align	2
	.globl	luaopen_string
	.hidden	luaopen_string
	.type	luaopen_string, @function
luaopen_string:
	addi	sp,sp,-12
	li	a2,68
	li	a1,503
	sw	ra,8(sp)
	sw	s0,4(sp)
	mv	s0,a0
	call	luaL_checkversion_
	mv	a0,s0
	li	a2,17
	li	a1,0
	call	lua_createtable
	mv	a0,s0
	li	a2,0
	lla	a1,.LANCHOR0
	call	luaL_setfuncs
	li	a2,1
	mv	a0,s0
	li	a1,0
	call	lua_createtable
	lla	a1,.LC3
	mv	a0,s0
	call	lua_pushstring
	mv	a0,s0
	li	a1,-2
	call	lua_pushvalue
	li	a1,-2
	mv	a0,s0
	call	lua_setmetatable
	mv	a0,s0
	li	a1,-2
	call	lua_settop
	mv	a0,s0
	li	a1,-2
	call	lua_pushvalue
	mv	a0,s0
	lla	a2,.LC49
	li	a1,-2
	call	lua_setfield
	mv	a0,s0
	li	a1,-2
	call	lua_settop
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
	.size	luaopen_string, .-luaopen_string
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC50:
	.string	"byte"
	.align	2
.LC51:
	.string	"char"
	.align	2
.LC52:
	.string	"dump"
	.align	2
.LC53:
	.string	"find"
	.align	2
.LC54:
	.string	"format"
	.align	2
.LC55:
	.string	"gmatch"
	.align	2
.LC56:
	.string	"gsub"
	.align	2
.LC57:
	.string	"len"
	.align	2
.LC58:
	.string	"lower"
	.align	2
.LC59:
	.string	"match"
	.align	2
.LC60:
	.string	"rep"
	.align	2
.LC61:
	.string	"reverse"
	.align	2
.LC62:
	.string	"sub"
	.align	2
.LC63:
	.string	"upper"
	.align	2
.LC64:
	.string	"pack"
	.align	2
.LC65:
	.string	"packsize"
	.align	2
.LC66:
	.string	"unpack"
	.section	.rodata.strlib,"a"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	strlib, @object
	.size	strlib, 144
strlib:
	.word	.LC50
	.word	str_byte
	.word	.LC51
	.word	str_char
	.word	.LC52
	.word	str_dump
	.word	.LC53
	.word	str_find
	.word	.LC54
	.word	str_format
	.word	.LC55
	.word	gmatch
	.word	.LC56
	.word	str_gsub
	.word	.LC57
	.word	str_len
	.word	.LC58
	.word	str_lower
	.word	.LC59
	.word	str_match
	.word	.LC60
	.word	str_rep
	.word	.LC61
	.word	str_reverse
	.word	.LC62
	.word	str_sub
	.word	.LC63
	.word	str_upper
	.word	.LC64
	.word	str_pack
	.word	.LC65
	.word	str_packsize
	.word	.LC66
	.word	str_unpack
	.word	0
	.word	0
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
