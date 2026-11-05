#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"ltm.c"
	.option nopic
	.text
	.section	.rodata.luaT_init.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"__index"
	.section	.text.luaT_init,"ax",@progbits
	.align	2
	.globl	luaT_init
	.hidden	luaT_init
	.type	luaT_init, @function
luaT_init:
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	mv	s1,a0
	lla	a1,.LC0
	li	s0,0
	j	.L3
.L6:
	lw	a1,0(a5)
.L3:
	lw	a2,16(s1)
	mv	a0,s1
	sw	a2,0(sp)
	call	luaS_new
	lw	a2,0(sp)
	lw	a3,16(s1)
	addi	a5,s0,28
	slli	a5,a5,2
	add	a2,a2,a5
	add	a3,a3,a5
	sw	a0,12(a2)
	lw	a1,12(a3)
	mv	a0,s1
	addi	s0,s0,1
	call	luaC_fix
	slli	a5,s0,2
	lla	a4,.LANCHOR0
	li	a3,24
	add	a5,a4,a5
	bne	s0,a3,.L6
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
	.size	luaT_init, .-luaT_init
	.section	.text.luaT_gettm,"ax",@progbits
	.align	2
	.globl	luaT_gettm
	.hidden	luaT_gettm
	.type	luaT_gettm, @function
luaT_gettm:
	addi	sp,sp,-12
	sw	s1,0(sp)
	mv	s1,a1
	mv	a1,a2
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	luaH_getshortstr
	lw	a5,4(a0)
	beq	a5,zero,.L10
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L10:
	lbu	a5,6(s0)
	li	a4,1
	sll	a4,a4,s1
	or	a5,a5,a4
	sb	a5,6(s0)
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	li	a0,0
	addi	sp,sp,12
	jr	ra
	.size	luaT_gettm, .-luaT_gettm
	.section	.text.luaT_gettmbyobj,"ax",@progbits
	.align	2
	.globl	luaT_gettmbyobj
	.hidden	luaT_gettmbyobj
	.type	luaT_gettmbyobj, @function
luaT_gettmbyobj:
	lw	a5,4(a1)
	li	a4,5
	mv	a3,a0
	andi	a5,a5,15
	beq	a5,a4,.L12
	li	a4,7
	beq	a5,a4,.L13
	lw	a4,16(a0)
	addi	a5,a5,52
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a0,12(a5)
.L15:
	beq	a0,zero,.L16
	lw	a5,16(a3)
	addi	a2,a2,28
	slli	a2,a2,2
	add	a5,a5,a2
	lw	a1,12(a5)
	tail	luaH_getshortstr
.L16:
	lla	a0,luaO_nilobject_
	ret
.L12:
	lw	a5,0(a1)
	lw	a0,24(a5)
	j	.L15
.L13:
	lw	a5,0(a1)
	lw	a0,8(a5)
	j	.L15
	.size	luaT_gettmbyobj, .-luaT_gettmbyobj
	.section	.rodata.luaT_objtypename.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"__name"
	.section	.text.luaT_objtypename,"ax",@progbits
	.align	2
	.globl	luaT_objtypename
	.hidden	luaT_objtypename
	.type	luaT_objtypename, @function
luaT_objtypename:
	lw	a5,4(a1)
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	sw	s1,0(sp)
	li	a4,69
	mv	s0,a1
	beq	a5,a4,.L28
	li	a4,71
	beq	a5,a4,.L29
.L21:
	andi	a5,a5,15
	addi	a5,a5,1
	slli	a5,a5,2
	lla	a4,.LANCHOR1
	add	a5,a4,a5
	lw	a0,0(a5)
.L18:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L29:
	lw	a4,0(a1)
	lw	s1,8(a4)
	beq	s1,zero,.L21
.L20:
	lla	a1,.LC1
	call	luaS_new
	mv	a1,a0
	mv	a0,s1
	call	luaH_getshortstr
	lw	a5,4(a0)
	li	a4,4
	andi	a5,a5,15
	beq	a5,a4,.L22
	lw	a5,4(s0)
	j	.L21
.L28:
	lw	a4,0(a1)
	lw	s1,24(a4)
	bne	s1,zero,.L20
	j	.L21
.L22:
	lw	a0,0(a0)
	addi	a0,a0,16
	j	.L18
	.size	luaT_objtypename, .-luaT_objtypename
	.section	.text.luaT_callTM,"ax",@progbits
	.align	2
	.globl	luaT_callTM
	.hidden	luaT_callTM
	.type	luaT_callTM, @function
luaT_callTM:
	addi	sp,sp,-20
	sw	s1,8(sp)
	mv	s1,a0
	mv	a0,a1
	lw	t1,0(a0)
	lw	a1,12(s1)
	sw	s0,12(sp)
	sw	ra,16(sp)
	lw	t0,32(s1)
	sw	t1,0(a1)
	lw	t1,4(a0)
	mv	a0,a2
	sw	t0,0(sp)
	sw	t1,4(a1)
	lw	a2,0(a2)
	mv	s0,a4
	sw	a2,8(a1)
	lw	a0,4(a0)
	mv	a2,a5
	sw	a0,12(a1)
	lw	a5,0(a3)
	sw	a5,16(a1)
	lw	a5,4(a3)
	sw	a5,20(a1)
	beq	a2,zero,.L31
	addi	a5,a1,24
	sw	a5,12(s1)
.L32:
	lw	a5,20(s1)
	sw	a2,4(sp)
	mv	a0,s1
	lhu	a5,34(a5)
	andi	a5,a5,2
	beq	a5,zero,.L33
	call	luaD_call
	lw	a2,4(sp)
.L34:
	beq	a2,zero,.L30
	lw	a3,12(s1)
	lw	a4,0(sp)
	lw	a5,32(s1)
	lw	a2,-8(a3)
	sub	a4,s0,a4
	addi	a1,a3,-8
	add	a5,a5,a4
	sw	a1,12(s1)
	sw	a2,0(a5)
	lw	a4,-4(a3)
	sw	a4,4(a5)
.L30:
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L33:
	call	luaD_callnoyield
	lw	a2,4(sp)
	j	.L34
.L31:
	lw	a5,0(a4)
	addi	a3,a1,32
	sw	a3,12(s1)
	sw	a5,24(a1)
	lw	a5,4(a4)
	sw	a5,28(a1)
	j	.L32
	.size	luaT_callTM, .-luaT_callTM
	.section	.text.luaT_callbinTM,"ax",@progbits
	.align	2
	.globl	luaT_callbinTM
	.hidden	luaT_callbinTM
	.type	luaT_callbinTM, @function
luaT_callbinTM:
	lw	a5,4(a1)
	addi	sp,sp,-24
	sw	s0,16(sp)
	sw	s1,12(sp)
	sw	ra,20(sp)
	mv	s1,a1
	andi	a5,a5,15
	li	a1,5
	sw	a3,0(sp)
	mv	t0,a2
	mv	s0,a0
	mv	a2,a4
	beq	a5,a1,.L41
	li	a4,7
	beq	a5,a4,.L42
	lw	a4,16(a0)
	addi	a5,a5,52
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a0,12(a5)
.L44:
	lla	a1,luaO_nilobject_
	beq	a0,zero,.L45
	lw	a5,16(s0)
	addi	a4,a2,28
	slli	a4,a4,2
	add	a5,a5,a4
	lw	a1,12(a5)
	sw	t0,8(sp)
	sw	a2,4(sp)
	call	luaH_getshortstr
	lw	t0,8(sp)
	lw	a2,4(sp)
	mv	a1,a0
.L45:
	lw	a5,4(a1)
	beq	a5,zero,.L56
.L46:
	lw	a4,0(sp)
	mv	a0,s0
	mv	a2,s1
	li	a5,1
	mv	a3,t0
	call	luaT_callTM
	lw	ra,20(sp)
	lw	s0,16(sp)
	lw	s1,12(sp)
	li	a0,1
	addi	sp,sp,24
	jr	ra
.L56:
	mv	a1,t0
	mv	a0,s0
	sw	t0,4(sp)
	call	luaT_gettmbyobj
	mv	a1,a0
	lw	a0,4(a0)
	lw	t0,4(sp)
	bne	a0,zero,.L46
	lw	ra,20(sp)
	lw	s0,16(sp)
	lw	s1,12(sp)
	addi	sp,sp,24
	jr	ra
.L41:
	lw	a5,0(s1)
	lw	a0,24(a5)
	j	.L44
.L42:
	lw	a5,0(s1)
	lw	a0,8(a5)
	j	.L44
	.size	luaT_callbinTM, .-luaT_callbinTM
	.section	.rodata.luaT_trybinTM.str1.4,"aMS",@progbits,1
	.align	2
.LC2:
	.string	"perform bitwise operation on"
	.align	2
.LC3:
	.string	"perform arithmetic on"
	.section	.text.luaT_trybinTM,"ax",@progbits
	.align	2
	.globl	luaT_trybinTM
	.hidden	luaT_trybinTM
	.type	luaT_trybinTM, @function
luaT_trybinTM:
	addi	sp,sp,-24
	sw	s0,16(sp)
	sw	s1,12(sp)
	sw	ra,20(sp)
	sw	a0,0(sp)
	mv	s1,a1
	sw	a2,4(sp)
	mv	s0,a4
	call	luaT_callbinTM
	bne	a0,zero,.L57
	li	a4,19
	lw	a5,4(sp)
	beq	s0,a4,.L59
	bgtu	s0,a4,.L60
	addi	s0,s0,-13
	li	a4,4
	bgtu	s0,a4,.L61
.L59:
	lw	a3,4(s1)
	li	a4,3
	bne	a3,a4,.L62
	lw	a4,0(s1)
	sw	a4,8(sp)
.L63:
	lw	a3,4(a5)
	li	a4,3
	beq	a3,a4,.L74
	mv	a0,a5
	addi	a1,sp,8
	sw	a5,4(sp)
	call	luaV_tonumber_
	lw	a5,4(sp)
	beq	a0,zero,.L64
.L66:
	lw	a0,0(sp)
	mv	a2,a5
	mv	a1,s1
	call	luaG_tointerror
.L60:
	li	a4,22
	bne	s0,a4,.L61
	lw	a0,0(sp)
	mv	a2,a5
	mv	a1,s1
	call	luaG_concaterror
.L57:
	lw	ra,20(sp)
	lw	s0,16(sp)
	lw	s1,12(sp)
	addi	sp,sp,24
	jr	ra
.L62:
	addi	a1,sp,8
	mv	a0,s1
	sw	a5,4(sp)
	call	luaV_tonumber_
	lw	a5,4(sp)
	bne	a0,zero,.L63
.L64:
	lw	a0,0(sp)
	lla	a3,.LC2
	mv	a2,a5
	mv	a1,s1
	call	luaG_opinterror
.L61:
	lw	a0,0(sp)
	lla	a3,.LC3
	mv	a2,a5
	mv	a1,s1
	call	luaG_opinterror
.L74:
	lw	a4,0(a5)
	sw	a4,8(sp)
	j	.L66
	.size	luaT_trybinTM, .-luaT_trybinTM
	.section	.text.luaT_callorderTM,"ax",@progbits
	.align	2
	.globl	luaT_callorderTM
	.hidden	luaT_callorderTM
	.type	luaT_callorderTM, @function
luaT_callorderTM:
	lw	a5,12(a0)
	addi	sp,sp,-24
	sw	s0,16(sp)
	mv	s0,a2
	mv	a2,a3
	sw	s1,12(sp)
	sw	a3,0(sp)
	sw	a5,4(sp)
	sw	a1,8(sp)
	sw	ra,20(sp)
	mv	s1,a0
	call	luaT_gettmbyobj
	lw	a5,4(a0)
	lw	a3,0(sp)
	mv	a1,a0
	beq	a5,zero,.L87
.L76:
	lw	a4,4(sp)
	lw	a2,8(sp)
	li	a5,1
	mv	a0,s1
	mv	a3,s0
	call	luaT_callTM
	lw	a5,12(s1)
	lw	a0,4(a5)
	beq	a0,zero,.L75
	li	a4,1
	beq	a0,a4,.L88
	li	a0,1
.L75:
	lw	ra,20(sp)
	lw	s0,16(sp)
	lw	s1,12(sp)
	addi	sp,sp,24
	jr	ra
.L87:
	mv	a1,s0
	mv	a2,a3
	mv	a0,s1
	call	luaT_gettmbyobj
	lw	a5,4(a0)
	mv	a1,a0
	li	a0,-1
	bne	a5,zero,.L76
	lw	ra,20(sp)
	lw	s0,16(sp)
	lw	s1,12(sp)
	addi	sp,sp,24
	jr	ra
.L88:
	lw	a0,0(a5)
	snez	a0,a0
	j	.L75
	.size	luaT_callorderTM, .-luaT_callorderTM
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC4:
	.string	"__newindex"
	.align	2
.LC5:
	.string	"__gc"
	.align	2
.LC6:
	.string	"__mode"
	.align	2
.LC7:
	.string	"__len"
	.align	2
.LC8:
	.string	"__eq"
	.align	2
.LC9:
	.string	"__add"
	.align	2
.LC10:
	.string	"__sub"
	.align	2
.LC11:
	.string	"__mul"
	.align	2
.LC12:
	.string	"__mod"
	.align	2
.LC13:
	.string	"__pow"
	.align	2
.LC14:
	.string	"__div"
	.align	2
.LC15:
	.string	"__idiv"
	.align	2
.LC16:
	.string	"__band"
	.align	2
.LC17:
	.string	"__bor"
	.align	2
.LC18:
	.string	"__bxor"
	.align	2
.LC19:
	.string	"__shl"
	.align	2
.LC20:
	.string	"__shr"
	.align	2
.LC21:
	.string	"__unm"
	.align	2
.LC22:
	.string	"__bnot"
	.align	2
.LC23:
	.string	"__lt"
	.align	2
.LC24:
	.string	"__le"
	.align	2
.LC25:
	.string	"__concat"
	.align	2
.LC26:
	.string	"__call"
	.hidden	luaT_typenames_
	.globl	luaT_typenames_
	.align	2
.LC27:
	.string	"no value"
	.align	2
.LC28:
	.string	"nil"
	.align	2
.LC29:
	.string	"boolean"
	.align	2
.LC30:
	.string	"number"
	.align	2
.LC31:
	.string	"string"
	.align	2
.LC32:
	.string	"table"
	.align	2
.LC33:
	.string	"function"
	.align	2
.LC34:
	.string	"thread"
	.align	2
.LC35:
	.string	"proto"
	.section	.rodata.luaT_eventname.0,"a"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	luaT_eventname.0, @object
	.size	luaT_eventname.0, 96
luaT_eventname.0:
	.word	.LC0
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.word	.LC10
	.word	.LC11
	.word	.LC12
	.word	.LC13
	.word	.LC14
	.word	.LC15
	.word	.LC16
	.word	.LC17
	.word	.LC18
	.word	.LC19
	.word	.LC20
	.word	.LC21
	.word	.LC22
	.word	.LC23
	.word	.LC24
	.word	.LC25
	.word	.LC26
	.section	.rodata.luaT_typenames_,"a"
	.align	2
	.set	.LANCHOR1,. + 0
	.type	luaT_typenames_, @object
	.size	luaT_typenames_, 44
luaT_typenames_:
	.word	.LC27
	.word	.LC28
	.word	.LC29
	.word	udatatypename
	.word	.LC30
	.word	.LC31
	.word	.LC32
	.word	.LC33
	.word	udatatypename
	.word	.LC34
	.word	.LC35
	.section	.rodata.udatatypename,"a"
	.align	2
	.type	udatatypename, @object
	.size	udatatypename, 9
udatatypename:
	.string	"userdata"
	.hidden	luaG_opinterror
	.hidden	luaG_concaterror
	.hidden	luaG_tointerror
	.hidden	luaV_tonumber_
	.hidden	luaD_callnoyield
	.hidden	luaD_call
	.hidden	luaO_nilobject_
	.hidden	luaH_getshortstr
	.hidden	luaC_fix
	.hidden	luaS_new
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
