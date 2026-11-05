#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"ldo.c"
	.option nopic
	.text
	.section	.rodata.seterrorobj.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"error in error handling"
	.section	.text.seterrorobj,"ax",@progbits
	.align	2
	.type	seterrorobj, @function
seterrorobj:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	li	a5,4
	mv	s1,a0
	mv	s0,a2
	beq	a1,a5,.L2
	li	a5,6
	beq	a1,a5,.L3
	lw	a5,12(a0)
	addi	s0,s0,8
	lw	a4,-8(a5)
	sw	a4,0(a2)
	lw	a5,-4(a5)
	sw	a5,4(a2)
	sw	s0,12(s1)
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L2:
	lw	a5,16(a0)
	addi	s0,s0,8
	lw	a5,120(a5)
	sw	a5,0(a2)
	lbu	a5,4(a5)
	ori	a5,a5,64
	sw	a5,4(a2)
	sw	s0,12(s1)
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L3:
	li	a2,23
	lla	a1,.LC0
	call	luaS_newlstr
	sw	a0,0(s0)
	lbu	a5,4(a0)
	addi	s0,s0,8
	ori	a5,a5,64
	sw	a5,-4(s0)
	sw	s0,12(s1)
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
	.size	seterrorobj, .-seterrorobj
	.section	.text.luaD_throw,"ax",@progbits
	.align	2
	.globl	luaD_throw
	.hidden	luaD_throw
	.type	luaD_throw, @function
luaD_throw:
	lw	a4,48(a0)
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	beq	a4,zero,.L10
	sw	a1,192(a4)
	addi	a0,a4,4
	li	a1,1
	call	longjmp
.L10:
	lw	s1,16(a0)
	sb	a1,8(a0)
	mv	s0,a0
	lw	a5,112(s1)
	lw	a4,48(a5)
	beq	a4,zero,.L11
	lw	a4,12(a5)
	mv	a0,a5
	addi	a3,a4,8
	sw	a3,12(a5)
	lw	a5,12(s0)
	lw	a3,-8(a5)
	sw	a3,0(a4)
	lw	a5,-4(a5)
	sw	a5,4(a4)
	call	luaD_throw
.L11:
	lw	a5,108(s1)
	beq	a5,zero,.L12
	lw	a2,12(a0)
	call	seterrorobj
	lw	a5,20(s0)
	lw	a4,12(s0)
	lw	a3,4(a5)
	bgeu	a3,a4,.L13
	sw	a4,4(a5)
.L13:
	lw	a5,108(s1)
	mv	a0,s0
	jalr	a5
.L12:
	call	abort
	.size	luaD_throw, .-luaD_throw
	.section	.rodata.f_parser.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"binary"
	.align	2
.LC2:
	.string	"attempt to load a %s chunk (mode is '%s')"
	.align	2
.LC3:
	.string	"text"
	.section	.text.f_parser,"ax",@progbits
	.align	2
	.type	f_parser, @function
f_parser:
	lw	a5,0(a1)
	addi	sp,sp,-20
	sw	s0,12(sp)
	lw	a4,0(a5)
	sw	s1,8(sp)
	sw	ra,16(sp)
	addi	a3,a4,-1
	sw	a3,0(a5)
	mv	s0,a1
	mv	s1,a0
	beq	a4,zero,.L19
	lw	a4,4(a5)
	addi	a3,a4,1
	sw	a3,4(a5)
	lbu	a5,0(a4)
.L20:
	li	a4,27
	lw	a3,52(s0)
	beq	a5,a4,.L33
	beq	a3,zero,.L24
	mv	a0,a3
	li	a1,116
	sw	a5,4(sp)
	sw	a3,0(sp)
	call	strchr
	lw	a3,0(sp)
	lw	a5,4(sp)
	beq	a0,zero,.L34
.L24:
	lw	a1,0(s0)
	lw	a4,56(s0)
	addi	a3,s0,16
	addi	a2,s0,4
	mv	a0,s1
	call	luaY_parser
	lw	s0,12(sp)
	lw	ra,16(sp)
	mv	a1,a0
	mv	a0,s1
	lw	s1,8(sp)
	addi	sp,sp,20
	tail	luaF_initupvals
.L33:
	beq	a3,zero,.L22
	li	a1,98
	mv	a0,a3
	sw	a3,0(sp)
	call	strchr
	lw	a3,0(sp)
	lla	a1,.LC2
	lla	a2,.LC1
	beq	a0,zero,.L32
.L22:
	lw	a1,0(s0)
	lw	a2,56(s0)
	mv	a0,s1
	call	luaU_undump
	lw	s0,12(sp)
	lw	ra,16(sp)
	mv	a1,a0
	mv	a0,s1
	lw	s1,8(sp)
	addi	sp,sp,20
	tail	luaF_initupvals
.L19:
	mv	a0,a5
	call	luaZ_fill
	mv	a5,a0
	j	.L20
.L34:
	lla	a1,.LC2
	lla	a2,.LC3
.L32:
	mv	a0,s1
	call	luaO_pushfstring
	li	a1,3
	mv	a0,s1
	call	luaD_throw
	.size	f_parser, .-f_parser
	.section	.text.luaD_rawrunprotected,"ax",@progbits
	.align	2
	.globl	luaD_rawrunprotected
	.hidden	luaD_rawrunprotected
	.type	luaD_rawrunprotected, @function
luaD_rawrunprotected:
	mv	a4,a0
	addi	sp,sp,-224
	lw	a5,48(a0)
	lhu	a4,110(a4)
	sw	ra,220(sp)
	addi	a3,sp,16
	sw	a0,0(sp)
	sw	a3,48(a0)
	addi	a0,sp,20
	sw	a4,4(sp)
	sw	a1,8(sp)
	sw	a2,12(sp)
	sw	zero,208(sp)
	sw	a5,16(sp)
	call	_setjmp
	bne	a0,zero,.L38
	lw	a1,12(sp)
	lw	a0,0(sp)
	lw	a5,8(sp)
	jalr	a5
.L38:
	lw	a4,0(sp)
	lw	a5,4(sp)
	lw	ra,220(sp)
	lw	a0,208(sp)
	sh	a5,110(a4)
	lw	a5,16(sp)
	sw	a5,48(a4)
	addi	sp,sp,224
	jr	ra
	.size	luaD_rawrunprotected, .-luaD_rawrunprotected
	.section	.text.luaD_reallocstack,"ax",@progbits
	.align	2
	.globl	luaD_reallocstack
	.hidden	luaD_reallocstack
	.type	luaD_reallocstack, @function
luaD_reallocstack:
	addi	sp,sp,-28
	sw	s0,20(sp)
	sw	ra,24(sp)
	sw	s1,16(sp)
	addi	a2,a1,1
	li	a3,536870912
	lw	s0,32(a0)
	lw	a4,96(a0)
	bgeu	a2,a3,.L63
	slli	a3,a1,3
	slli	a2,a4,3
	sw	a1,4(sp)
	mv	a1,s0
	mv	s1,a0
	sw	a4,8(sp)
	sw	a3,0(sp)
	sw	a2,12(sp)
	call	luaM_realloc_
	lw	a5,4(sp)
	lw	a4,8(sp)
	sw	a0,32(s1)
	lw	a3,0(sp)
	bge	a4,a5,.L43
	lw	a2,12(sp)
	add	a4,a0,a3
	add	a2,a0,a2
.L44:
	sw	zero,4(a2)
	addi	a2,a2,8
	bne	a2,a4,.L44
.L43:
	lw	a2,12(s1)
	addi	a3,a3,-40
	lw	a4,36(s1)
	sub	a2,a2,s0
	add	a3,a0,a3
	add	a2,a0,a2
	sw	a5,96(s1)
	sw	a3,28(s1)
	sw	a2,12(s1)
	beq	a4,zero,.L45
.L46:
	lw	a5,0(a4)
	sub	a5,a5,s0
	add	a5,a0,a5
	sw	a5,0(a4)
	lw	a4,8(a4)
	bne	a4,zero,.L46
.L45:
	lw	a5,20(s1)
	beq	a5,zero,.L41
.L49:
	lw	a3,4(a5)
	lw	a4,0(a5)
	lhu	a2,34(a5)
	sub	a3,a3,s0
	sub	a4,a4,s0
	add	a4,a0,a4
	add	a3,a0,a3
	sw	a4,0(a5)
	sw	a3,4(a5)
	andi	a4,a2,2
	beq	a4,zero,.L48
	lw	a4,16(a5)
	sub	a4,a4,s0
	add	a4,a0,a4
	sw	a4,16(a5)
.L48:
	lw	a5,8(a5)
	bne	a5,zero,.L49
.L41:
	lw	ra,24(sp)
	lw	s0,20(sp)
	lw	s1,16(sp)
	addi	sp,sp,28
	jr	ra
.L63:
	call	luaM_toobig
	.size	luaD_reallocstack, .-luaD_reallocstack
	.section	.rodata.luaD_growstack.str1.4,"aMS",@progbits,1
	.align	2
.LC4:
	.string	"stack overflow"
	.section	.text.luaD_growstack,"ax",@progbits
	.align	2
	.globl	luaD_growstack
	.hidden	luaD_growstack
	.type	luaD_growstack, @function
luaD_growstack:
	lw	a4,96(a0)
	addi	sp,sp,-12
	li	a3,999424
	sw	ra,8(sp)
	sw	s0,4(sp)
	addi	a3,a3,576
	bgt	a4,a3,.L70
	lw	a5,12(a0)
	lw	a2,32(a0)
	slli	a4,a4,1
	mv	s0,a0
	sub	a5,a5,a2
	srai	a5,a5,3
	add	a1,a5,a1
	addi	a1,a1,5
	bgt	a4,a3,.L71
	blt	a1,a4,.L72
.L67:
	li	a5,999424
	addi	a4,a5,576
	bgt	a1,a4,.L73
	mv	a0,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	luaD_reallocstack
.L72:
	mv	a1,a4
	j	.L67
.L71:
	mv	a4,a3
	bge	a1,a4,.L67
	j	.L72
.L70:
	li	a1,6
	call	luaD_throw
.L73:
	addi	a1,a5,776
	mv	a0,s0
	call	luaD_reallocstack
	lla	a1,.LC4
	mv	a0,s0
	call	luaG_runerror
	.size	luaD_growstack, .-luaD_growstack
	.section	.text.luaD_shrinkstack,"ax",@progbits
	.align	2
	.globl	luaD_shrinkstack
	.hidden	luaD_shrinkstack
	.type	luaD_shrinkstack, @function
luaD_shrinkstack:
	lw	a5,20(a0)
	addi	sp,sp,-12
	sw	s1,0(sp)
	sw	ra,8(sp)
	sw	s0,4(sp)
	lw	a4,12(a0)
	mv	s1,a0
	beq	a5,zero,.L75
.L77:
	lw	a3,4(a5)
	bgeu	a4,a3,.L76
	mv	a4,a3
.L76:
	lw	a5,8(a5)
	bne	a5,zero,.L77
.L75:
	lw	a5,32(s1)
	lw	a3,96(s1)
	mv	a0,s1
	sub	s0,a4,a5
	li	a5,999424
	srai	s0,s0,3
	addi	a5,a5,576
	addi	s0,s0,1
	ble	a3,a5,.L78
	call	luaE_freeCI
.L79:
	li	a5,999424
	addi	a4,a5,571
	bgt	s0,a4,.L74
	srai	a1,s0,31
	andi	a1,a1,7
	add	a1,a1,s0
	srai	a1,a1,3
	add	a1,a1,s0
	addi	a1,a1,10
	addi	a5,a5,576
	bgt	a1,a5,.L87
	lw	a5,96(s1)
	bgt	a5,a1,.L88
.L74:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L78:
	call	luaE_shrinkCI
	j	.L79
.L87:
	mv	a1,a5
	lw	a5,96(s1)
	ble	a5,a1,.L74
.L88:
	lw	s0,4(sp)
	lw	ra,8(sp)
	mv	a0,s1
	lw	s1,0(sp)
	addi	sp,sp,12
	tail	luaD_reallocstack
	.size	luaD_shrinkstack, .-luaD_shrinkstack
	.section	.text.luaD_inctop,"ax",@progbits
	.align	2
	.globl	luaD_inctop
	.hidden	luaD_inctop
	.type	luaD_inctop, @function
luaD_inctop:
	lw	a5,12(a0)
	lw	a4,28(a0)
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	li	a3,8
	sub	a4,a4,a5
	mv	s0,a0
	ble	a4,a3,.L92
	addi	a5,a5,8
	lw	ra,8(sp)
	sw	a5,12(s0)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
.L92:
	li	a1,1
	call	luaD_growstack
	lw	a5,12(s0)
	lw	ra,8(sp)
	addi	a5,a5,8
	sw	a5,12(s0)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
	.size	luaD_inctop, .-luaD_inctop
	.section	.text.luaD_hook,"ax",@progbits
	.align	2
	.globl	luaD_hook
	.hidden	luaD_hook
	.type	luaD_hook, @function
luaD_hook:
	lw	a4,88(a0)
	beq	a4,zero,.L103
	lbu	a3,116(a0)
	mv	a5,a0
	beq	a3,zero,.L103
	addi	sp,sp,-124
	sw	s1,112(sp)
	lw	s1,20(a0)
	lw	a3,12(a0)
	lw	t2,32(a0)
	lw	t0,28(a0)
	sw	s0,116(sp)
	lw	s0,4(s1)
	sub	t1,a3,t2
	sw	a1,12(sp)
	sw	a2,32(sp)
	sw	ra,120(sp)
	sw	s1,108(sp)
	sub	a2,t0,a3
	li	a1,160
	sw	t1,0(sp)
	sub	s0,s0,t2
	ble	a2,a1,.L106
.L95:
	addi	a3,a3,160
	sw	a3,4(s1)
	sb	zero,116(a5)
	lhu	a3,34(s1)
	sw	a5,4(sp)
	addi	a1,sp,12
	ori	a3,a3,4
	sh	a3,34(s1)
	mv	a0,a5
	jalr	a4
	lw	a5,4(sp)
	li	a3,1
	lw	a2,0(sp)
	lw	a4,32(a5)
	sb	a3,116(a5)
	lhu	a3,34(s1)
	add	s0,a4,s0
	sw	s0,4(s1)
	lw	ra,120(sp)
	lw	s0,116(sp)
	add	a4,a4,a2
	sw	a4,12(a5)
	andi	a5,a3,-5
	sh	a5,34(s1)
	lw	s1,112(sp)
	addi	sp,sp,124
	jr	ra
.L103:
	ret
.L106:
	li	a1,20
	sw	a4,4(sp)
	sw	a0,8(sp)
	call	luaD_growstack
	lw	a5,8(sp)
	lw	a4,4(sp)
	lw	a3,12(a5)
	j	.L95
	.size	luaD_hook, .-luaD_hook
	.section	.text.luaD_poscall,"ax",@progbits
	.align	2
	.globl	luaD_poscall
	.hidden	luaD_poscall
	.type	luaD_poscall, @function
luaD_poscall:
	lw	t1,112(a0)
	addi	sp,sp,-24
	sw	s0,16(sp)
	sw	s1,12(sp)
	sw	ra,20(sp)
	mv	s1,a1
	andi	a1,t1,6
	lh	a4,32(s1)
	mv	s0,a0
	mv	a5,a2
	bne	a1,zero,.L108
	lw	a2,8(s1)
.L109:
	lw	a1,0(s1)
	sw	a2,20(s0)
	li	a0,0
	beq	a4,zero,.L111
	li	a2,1
	beq	a4,a2,.L112
	li	a2,-1
	beq	a4,a2,.L141
	bgt	a4,a3,.L142
	slli	a0,a4,3
	ble	a4,zero,.L111
	mv	a2,a5
	slli	a0,a4,3
	mv	a5,a1
	add	a3,a2,a0
.L123:
	lw	a4,0(a2)
	addi	a2,a2,8
	addi	a5,a5,8
	sw	a4,-8(a5)
	lw	a4,-4(a2)
	sw	a4,-4(a5)
	bne	a3,a2,.L123
.L111:
	add	a1,a1,a0
	lw	ra,20(sp)
	sw	a1,12(s0)
	lw	s0,16(sp)
	lw	s1,12(sp)
	li	a0,1
	addi	sp,sp,24
	jr	ra
.L108:
	andi	t1,t1,2
	bne	t1,zero,.L143
	lw	a2,8(s1)
	lw	a1,20(a2)
	sw	a1,24(s0)
	j	.L109
.L141:
	ble	a3,zero,.L144
	mv	a2,a5
	slli	a3,a3,3
	mv	a5,a1
	add	a0,a2,a3
.L117:
	lw	a4,0(a2)
	addi	a2,a2,8
	addi	a5,a5,8
	sw	a4,-8(a5)
	lw	a4,-4(a2)
	sw	a4,-4(a5)
	bne	a2,a0,.L117
.L118:
	add	a1,a1,a3
	lw	ra,20(sp)
	sw	a1,12(s0)
	lw	s0,16(sp)
	lw	s1,12(sp)
	li	a0,0
	addi	sp,sp,24
	jr	ra
.L112:
	bne	a3,zero,.L116
	lla	a5,luaO_nilobject_
.L116:
	lw	a3,0(a5)
	slli	a0,a4,3
	sw	a3,0(a1)
	lw	a5,4(a5)
	sw	a5,4(a1)
	j	.L111
.L143:
	lw	t1,32(a0)
	li	a2,-1
	li	a1,1
	sub	a5,a5,t1
	sw	a3,8(sp)
	sw	a4,4(sp)
	sw	a5,0(sp)
	call	luaD_hook
	lw	a2,32(s0)
	lw	a5,0(sp)
	lw	a3,8(sp)
	lw	a4,4(sp)
	add	a5,a2,a5
	lw	a2,8(s1)
	lw	a1,20(a2)
	sw	a1,24(s0)
	j	.L109
.L142:
	ble	a3,zero,.L145
	mv	a2,a5
	slli	a3,a3,3
	mv	a5,a1
	add	t1,a2,a3
.L125:
	lw	a0,0(a2)
	addi	a2,a2,8
	addi	a5,a5,8
	sw	a0,-8(a5)
	lw	a0,-4(a2)
	sw	a0,-4(a5)
	bne	a2,t1,.L125
.L126:
	slli	a0,a4,3
	add	a3,a1,a3
	add	a5,a1,a0
.L127:
	sw	zero,4(a3)
	addi	a3,a3,8
	bne	a3,a5,.L127
	j	.L111
.L144:
	slli	a3,a3,3
	j	.L118
.L145:
	slli	a0,a4,3
	ble	a4,zero,.L111
	li	a3,0
	j	.L126
	.size	luaD_poscall, .-luaD_poscall
	.section	.text.finishCcall,"ax",@progbits
	.align	2
	.type	finishCcall, @function
finishCcall:
	addi	sp,sp,-12
	sw	s1,0(sp)
	lw	s1,20(a0)
	sw	s0,4(sp)
	sw	ra,8(sp)
	lhu	a5,34(s1)
	mv	s0,a0
	andi	a4,a5,16
	beq	a4,zero,.L147
	lw	a4,20(s1)
	andi	a5,a5,-17
	sh	a5,34(s1)
	sw	a4,92(a0)
.L147:
	lh	a4,32(s1)
	li	a5,-1
	beq	a4,a5,.L153
.L148:
	lw	a2,24(s1)
	lw	a5,16(s1)
	mv	a0,s0
	jalr	a5
	lw	a2,12(s0)
	slli	a5,a0,3
	mv	a3,a0
	mv	a0,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	mv	a1,s1
	lw	s1,0(sp)
	sub	a2,a2,a5
	addi	sp,sp,12
	tail	luaD_poscall
.L153:
	lw	a5,12(s0)
	lw	a4,4(s1)
	bgeu	a4,a5,.L148
	sw	a5,4(s1)
	j	.L148
	.size	finishCcall, .-finishCcall
	.section	.text.unroll,"ax",@progbits
	.align	2
	.type	unroll, @function
unroll:
	addi	sp,sp,-12
	sw	s1,0(sp)
	sw	ra,8(sp)
	sw	s0,4(sp)
	mv	s1,a0
	beq	a1,zero,.L155
	lw	a1,0(a1)
	call	finishCcall
.L155:
	lw	a5,20(s1)
	addi	s0,s1,52
	bne	a5,s0,.L159
	j	.L154
.L165:
	call	finishCcall
	lw	a5,20(s1)
	beq	a5,s0,.L154
.L159:
	lhu	a5,34(a5)
	mv	a0,s1
	li	a1,1
	andi	a5,a5,2
	beq	a5,zero,.L165
	call	luaV_finishOp
	mv	a0,s1
	call	luaV_execute
	lw	a5,20(s1)
	bne	a5,s0,.L159
.L154:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
	.size	unroll, .-unroll
	.section	.rodata.luaD_precall.str1.4,"aMS",@progbits,1
	.align	2
.LC5:
	.string	"call"
	.section	.text.luaD_precall,"ax",@progbits
	.align	2
	.globl	luaD_precall
	.hidden	luaD_precall
	.type	luaD_precall, @function
luaD_precall:
	addi	sp,sp,-36
	sw	s1,24(sp)
	mv	s1,a1
	lw	a5,4(s1)
	sw	s0,28(sp)
	mv	s0,a0
	lw	a4,12(a0)
	lw	a1,28(s0)
	sw	ra,32(sp)
	sw	a2,0(sp)
	li	t1,22
	andi	a5,a5,63
	sub	a1,a1,a4
	beq	a5,t1,.L167
.L223:
	li	a3,38
	beq	a5,a3,.L168
	li	a3,6
	beq	a5,a3,.L221
	li	a5,8
	bgt	a1,a5,.L193
	lw	a5,16(s0)
	lw	a4,32(s0)
	lw	a5,12(a5)
	sub	s1,s1,a4
	ble	a5,zero,.L194
	mv	a0,s0
	call	luaC_step
.L194:
	li	a1,1
	mv	a0,s0
	call	luaD_growstack
	lw	a5,32(s0)
	add	s1,a5,s1
.L193:
	li	a2,23
	mv	a1,s1
	mv	a0,s0
	call	luaT_gettmbyobj
	lw	a5,4(a0)
	li	a4,6
	li	t1,22
	andi	a5,a5,15
	bne	a5,a4,.L222
	lw	a4,12(s0)
	mv	a5,a4
	bgeu	s1,a4,.L198
.L196:
	lw	a2,-8(a5)
	lw	a3,-4(a5)
	addi	a5,a5,-8
	sw	a2,8(a5)
	sw	a3,12(a5)
	bltu	s1,a5,.L196
.L198:
	lw	a5,0(a0)
	addi	a4,a4,8
	sw	a4,12(s0)
	sw	a5,0(s1)
	lw	a5,4(a0)
	lw	a1,28(s0)
	sw	a5,4(s1)
	lw	a5,4(s1)
	sub	a1,a1,a4
	andi	a5,a5,63
	bne	a5,t1,.L223
.L167:
	lw	a5,0(s1)
	sw	a5,4(sp)
	j	.L171
.L221:
	lw	a2,0(s1)
	srai	a0,a1,3
	sub	a4,a4,s1
	lw	a2,12(a2)
	srai	a3,a4,3
	addi	t1,a3,-1
	lbu	a1,8(a2)
	bgt	a0,a1,.L177
	lw	a0,16(s0)
	lw	a5,32(s0)
	lw	a0,12(a0)
	sub	s1,s1,a5
	ble	a0,zero,.L178
	mv	a0,s0
	sw	t1,20(sp)
	sw	a2,16(sp)
	sw	a1,12(sp)
	sw	a3,8(sp)
	sw	a4,4(sp)
	call	luaC_step
	lw	t1,20(sp)
	lw	a2,16(sp)
	lw	a1,12(sp)
	lw	a3,8(sp)
	lw	a4,4(sp)
.L178:
	mv	a0,s0
	sw	t1,20(sp)
	sw	a2,16(sp)
	sw	a3,12(sp)
	sw	a4,8(sp)
	sw	a1,4(sp)
	call	luaD_growstack
	lw	a5,32(s0)
	lw	t1,20(sp)
	lw	a2,16(sp)
	lw	a3,12(sp)
	lw	a4,8(sp)
	lw	a1,4(sp)
	add	s1,a5,s1
.L177:
	lbu	t0,7(a2)
	lbu	a0,6(a2)
	bne	t0,zero,.L179
	bge	t1,a0,.L181
	lw	t0,12(s0)
	slli	t1,a0,3
	addi	t2,t0,12
	add	t2,t2,t1
	sub	a4,t2,a4
	addi	t1,t0,4
.L190:
	sw	zero,0(t1)
	addi	t1,t1,8
	bne	t1,a4,.L190
	sub	a3,a0,a3
	addi	a4,a3,1
	slli	a4,a4,3
	add	a4,t0,a4
	slli	a3,a3,3
	sw	a4,12(s0)
	add	t0,t0,a3
	sw	zero,4(t0)
.L181:
	addi	a5,s1,8
.L182:
	lw	a4,20(s0)
	lw	a4,12(a4)
	beq	a4,zero,.L224
.L191:
	lw	a3,48(a2)
	lw	a2,0(sp)
	slli	a1,a1,3
	lw	a0,112(s0)
	sw	a4,20(s0)
	add	a1,a5,a1
	sh	a2,32(a4)
	sw	s1,0(a4)
	sw	a5,16(a4)
	sw	a1,4(a4)
	sw	a1,12(s0)
	li	a2,2
	sw	a3,20(a4)
	sh	a2,34(a4)
	andi	a0,a0,1
	bne	a0,zero,.L225
	lw	ra,32(sp)
	lw	s0,28(sp)
	lw	s1,24(sp)
	addi	sp,sp,36
	jr	ra
.L168:
	lw	a4,0(s1)
	lw	a5,12(a4)
	sw	a5,4(sp)
.L171:
	li	a4,160
	bgt	a1,a4,.L172
	lw	a4,16(s0)
	lw	a3,32(s0)
	lw	a4,12(a4)
	sub	s1,s1,a3
	bgt	a4,zero,.L226
.L173:
	li	a1,20
	mv	a0,s0
	call	luaD_growstack
	lw	a4,32(s0)
	add	s1,a4,s1
.L172:
	lw	a4,20(s0)
	lw	a4,12(a4)
	beq	a4,zero,.L227
.L174:
	lw	a2,12(s0)
	lw	a3,112(s0)
	lw	a5,0(sp)
	sw	a4,20(s0)
	addi	a2,a2,160
	sh	a5,32(a4)
	sw	s1,0(a4)
	sw	a2,4(a4)
	sh	zero,34(a4)
	andi	a3,a3,1
	bne	a3,zero,.L228
.L175:
	lw	a5,4(sp)
	sw	a4,0(sp)
	mv	a0,s0
	jalr	a5
	lw	a1,12(s0)
	lw	a4,0(sp)
	slli	a2,a0,3
	mv	a3,a0
	sub	a2,a1,a2
	mv	a0,s0
	mv	a1,a4
	call	luaD_poscall
	lw	ra,32(sp)
	lw	s0,28(sp)
	lw	s1,24(sp)
	li	a0,1
	addi	sp,sp,36
	jr	ra
.L228:
	li	a2,-1
	li	a1,0
	mv	a0,s0
	sw	a4,0(sp)
	call	luaD_hook
	lw	a4,0(sp)
	j	.L175
.L226:
	mv	a0,s0
	call	luaC_step
	j	.L173
.L227:
	mv	a0,s0
	call	luaE_extendCI
	mv	a4,a0
	j	.L174
.L179:
	li	a3,8
	lw	a5,12(s0)
	sub	a3,a3,a4
	beq	a0,zero,.L182
	ble	t1,zero,.L199
	addi	a4,a5,8
	add	a3,a5,a3
	li	t0,0
	sw	a5,4(sp)
	j	.L184
.L230:
	addi	a4,a4,8
	addi	a3,a3,8
	beq	t1,t0,.L229
.L184:
	lw	t2,0(a3)
	sw	a4,12(s0)
	addi	t0,t0,1
	sw	t2,-8(a4)
	lw	a5,4(a3)
	mv	t2,a4
	sw	a5,-4(a4)
	sw	zero,4(a3)
	bne	t0,a0,.L230
	lw	a5,4(sp)
	j	.L182
.L225:
	lw	a2,8(a4)
	addi	a3,a3,4
	sw	a3,20(a4)
	lhu	a3,34(a2)
	li	a1,0
	andi	a3,a3,2
	beq	a3,zero,.L192
	lw	a3,20(a2)
	li	a2,37
	lw	a3,-4(a3)
	andi	a3,a3,63
	beq	a3,a2,.L231
.L192:
	mv	a0,s0
	li	a2,-1
	sw	a4,0(sp)
	call	luaD_hook
	lw	a4,0(sp)
	lw	ra,32(sp)
	lw	s0,28(sp)
	lw	a5,20(a4)
	lw	s1,24(sp)
	li	a0,0
	addi	a5,a5,-4
	sw	a5,20(a4)
	addi	sp,sp,36
	jr	ra
.L224:
	mv	a0,s0
	sw	a2,12(sp)
	sw	a5,8(sp)
	sw	a1,4(sp)
	call	luaE_extendCI
	lw	a2,12(sp)
	lw	a5,8(sp)
	lw	a1,4(sp)
	mv	a4,a0
	j	.L191
.L231:
	li	a3,34
	sh	a3,34(a4)
	li	a1,4
	j	.L192
.L229:
	lw	a5,4(sp)
.L183:
	addi	a3,t2,4
	mv	a4,t0
.L185:
	sw	zero,0(a3)
	addi	a4,a4,1
	addi	a3,a3,8
	blt	a4,a0,.L185
	li	a4,8
	bge	t0,a0,.L187
	sub	a4,a0,t0
	slli	a4,a4,3
.L187:
	add	a4,t2,a4
	sw	a4,12(s0)
	li	a4,0
	bge	t0,a0,.L189
	addi	a4,a0,-1
	sub	a4,a4,t0
	slli	a4,a4,3
.L189:
	add	a4,t2,a4
	sw	zero,4(a4)
	j	.L182
.L199:
	mv	t2,a5
	li	t0,0
	j	.L183
.L222:
	lla	a2,.LC5
	mv	a1,s1
	mv	a0,s0
	call	luaG_typeerror
	.size	luaD_precall, .-luaD_precall
	.section	.text.resume,"ax",@progbits
	.align	2
	.type	resume, @function
resume:
	addi	sp,sp,-12
	lw	a3,0(a1)
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	lw	a1,12(a0)
	lbu	a5,8(a0)
	slli	a4,a3,3
	lw	s1,20(a0)
	mv	s0,a0
	sub	a1,a1,a4
	beq	a5,zero,.L247
	sb	zero,8(a0)
	lw	a4,32(a0)
	lw	a2,28(s1)
	lhu	a5,34(s1)
	add	a4,a4,a2
	sw	a4,0(s1)
	andi	a5,a5,2
	bne	a5,zero,.L248
	lw	a5,16(s1)
	beq	a5,zero,.L237
	lw	a2,24(s1)
	li	a1,1
	jalr	a5
	lw	a1,12(s0)
	slli	a5,a0,3
	mv	a3,a0
	sub	a1,a1,a5
.L237:
	mv	a2,a1
	mv	a0,s0
	mv	a1,s1
	call	luaD_poscall
.L238:
	lw	a5,20(s0)
	addi	s1,s0,52
	bne	s1,a5,.L236
	j	.L232
.L249:
	call	finishCcall
	lw	a5,20(s0)
	beq	s1,a5,.L232
.L236:
	lhu	a5,34(a5)
	mv	a0,s0
	li	a1,1
	andi	a5,a5,2
	beq	a5,zero,.L249
	call	luaV_finishOp
	mv	a0,s0
	call	luaV_execute
	lw	a5,20(s0)
	bne	s1,a5,.L236
.L232:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L248:
	call	luaV_execute
	j	.L238
.L247:
	li	a2,-1
	addi	a1,a1,-8
	call	luaD_precall
	bne	a0,zero,.L232
	mv	a0,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	tail	luaV_execute
	.size	resume, .-resume
	.section	.rodata.luaD_call.str1.4,"aMS",@progbits,1
	.align	2
.LC6:
	.string	"C stack overflow"
	.section	.text.luaD_call,"ax",@progbits
	.align	2
	.globl	luaD_call
	.hidden	luaD_call
	.type	luaD_call, @function
luaD_call:
	lhu	a5,110(a0)
	addi	sp,sp,-12
	sw	s0,4(sp)
	addi	a5,a5,1
	slli	a5,a5,16
	sw	ra,8(sp)
	srli	a5,a5,16
	sh	a5,110(a0)
	li	a4,199
	mv	s0,a0
	bgtu	a5,a4,.L255
.L251:
	mv	a0,s0
	call	luaD_precall
	beq	a0,zero,.L256
	lhu	a5,110(s0)
	lw	ra,8(sp)
	addi	a5,a5,-1
	sh	a5,110(s0)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
.L255:
	li	a4,200
	beq	a5,a4,.L257
	li	a4,224
	bleu	a5,a4,.L251
	li	a1,6
	call	luaD_throw
.L256:
	mv	a0,s0
	call	luaV_execute
	lhu	a5,110(s0)
	lw	ra,8(sp)
	addi	a5,a5,-1
	sh	a5,110(s0)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
.L257:
	lla	a1,.LC6
	call	luaG_runerror
	.size	luaD_call, .-luaD_call
	.section	.text.luaD_callnoyield,"ax",@progbits
	.align	2
	.globl	luaD_callnoyield
	.hidden	luaD_callnoyield
	.type	luaD_callnoyield, @function
luaD_callnoyield:
	lhu	a5,110(a0)
	lhu	a4,108(a0)
	addi	sp,sp,-12
	addi	a5,a5,1
	slli	a5,a5,16
	sw	s0,4(sp)
	sw	ra,8(sp)
	addi	a4,a4,1
	srli	a5,a5,16
	sh	a4,108(a0)
	sh	a5,110(a0)
	li	a4,199
	mv	s0,a0
	bgtu	a5,a4,.L263
.L259:
	mv	a0,s0
	call	luaD_precall
	beq	a0,zero,.L264
.L261:
	lhu	a4,110(s0)
	lhu	a5,108(s0)
	lw	ra,8(sp)
	addi	a4,a4,-1
	addi	a5,a5,-1
	sh	a4,110(s0)
	sh	a5,108(s0)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
.L263:
	li	a4,200
	beq	a5,a4,.L265
	li	a4,224
	bleu	a5,a4,.L259
	li	a1,6
	call	luaD_throw
.L264:
	mv	a0,s0
	call	luaV_execute
	j	.L261
.L265:
	lla	a1,.LC6
	call	luaG_runerror
	.size	luaD_callnoyield, .-luaD_callnoyield
	.section	.rodata.lua_resume.str1.4,"aMS",@progbits,1
	.align	2
.LC7:
	.string	"cannot resume non-suspended coroutine"
	.align	2
.LC8:
	.string	"cannot resume dead coroutine"
	.section	.text.lua_resume,"ax",@progbits
	.align	2
	.globl	lua_resume
	.hidden	lua_resume
	.type	lua_resume, @function
lua_resume:
	addi	sp,sp,-32
	sw	s1,20(sp)
	lhu	a4,108(a0)
	sw	ra,28(sp)
	sw	s0,24(sp)
	lbu	a5,8(a0)
	sw	a2,12(sp)
	sw	a4,8(sp)
	mv	s1,a0
	bne	a5,zero,.L267
	lw	a3,20(a0)
	addi	a5,a0,52
	bne	a3,a5,.L286
.L268:
	beq	a1,zero,.L287
	lhu	a5,110(a1)
	li	a3,199
	addi	a5,a5,1
	slli	a5,a5,16
	srli	a5,a5,16
	sh	a5,110(s1)
	bleu	a5,a3,.L271
	lw	a5,12(sp)
	lw	s0,12(s1)
	lla	a1,.LC6
	slli	a5,a5,3
	sub	s0,s0,a5
	sw	s0,12(s1)
	mv	a0,s1
.L285:
	call	luaS_new
	sw	a0,0(s0)
	lbu	a2,4(a0)
	lw	a5,12(s1)
	lw	ra,28(sp)
	ori	a2,a2,64
	sw	a2,4(s0)
	lw	s0,24(sp)
	addi	a5,a5,8
	sw	a5,12(s1)
	li	a4,2
	lw	s1,20(sp)
	mv	a0,a4
	addi	sp,sp,32
	jr	ra
.L267:
	li	a3,1
	beq	a5,a3,.L268
	lw	s0,12(a0)
	slli	a5,a2,3
	lla	a1,.LC8
	sub	s0,s0,a5
	sw	s0,12(a0)
	j	.L285
.L287:
	li	a5,1
	sh	a5,110(s1)
.L271:
	sh	zero,108(s1)
	addi	a2,sp,12
	lla	a1,resume
	mv	a0,s1
	call	luaD_rawrunprotected
	sw	a0,16(sp)
	li	a5,-1
	mv	a4,a0
	beq	a0,a5,.L278
	li	a5,1
	ble	a0,a5,.L272
.L277:
	lw	s0,20(s1)
	bne	s0,zero,.L276
	j	.L274
.L288:
	lw	s0,8(s0)
	beq	s0,zero,.L274
.L276:
	lhu	a5,34(s0)
	andi	a5,a5,16
	beq	a5,zero,.L288
	lw	a5,28(s0)
	lw	a2,32(s1)
	mv	a0,s1
	sw	a4,4(sp)
	add	a2,a2,a5
	mv	a1,a2
	sw	a2,0(sp)
	call	luaF_close
	lw	a4,4(sp)
	lw	a2,0(sp)
	mv	a0,s1
	mv	a1,a4
	call	seterrorobj
	lhu	a5,34(s0)
	mv	a0,s1
	sw	s0,20(s1)
	andi	a5,a5,1
	sb	a5,116(s1)
	sh	zero,108(s1)
	call	luaD_shrinkstack
	lw	a5,20(s0)
	addi	a2,sp,16
	lla	a1,unroll
	sw	a5,92(s1)
	mv	a0,s1
	call	luaD_rawrunprotected
	sw	a0,16(sp)
	li	a5,1
	mv	a4,a0
	bgt	a0,a5,.L277
.L272:
	lhu	a5,110(s1)
	lw	a3,8(sp)
	addi	a5,a5,-1
	sh	a3,108(s1)
	sh	a5,110(s1)
.L289:
	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	s1,20(sp)
	mv	a0,a4
	addi	sp,sp,32
	jr	ra
.L286:
	lw	s0,12(a0)
	slli	a5,a2,3
	lla	a1,.LC7
	sub	s0,s0,a5
	sw	s0,12(a0)
	j	.L285
.L278:
	lhu	a5,110(s1)
	lw	a3,8(sp)
	li	a4,2
	addi	a5,a5,-1
	sh	a3,108(s1)
	sh	a5,110(s1)
	j	.L289
.L274:
	lw	a4,16(sp)
	li	a5,1
	ble	a4,a5,.L272
	lw	a2,12(s1)
	sb	a4,8(s1)
	mv	a1,a4
	mv	a0,s1
	call	seterrorobj
	lw	a5,20(s1)
	lw	a2,12(s1)
	lw	a3,8(sp)
	lw	a4,16(sp)
	sw	a2,4(a5)
	lhu	a5,110(s1)
	sh	a3,108(s1)
	addi	a5,a5,-1
	sh	a5,110(s1)
	j	.L289
	.size	lua_resume, .-lua_resume
	.section	.text.lua_isyieldable,"ax",@progbits
	.align	2
	.globl	lua_isyieldable
	.hidden	lua_isyieldable
	.type	lua_isyieldable, @function
lua_isyieldable:
	lhu	a0,108(a0)
	seqz	a0,a0
	ret
	.size	lua_isyieldable, .-lua_isyieldable
	.section	.rodata.lua_yieldk.str1.4,"aMS",@progbits,1
	.align	2
.LC9:
	.string	"attempt to yield across a C-call boundary"
	.align	2
.LC10:
	.string	"attempt to yield from outside a coroutine"
	.section	.text.lua_yieldk,"ax",@progbits
	.align	2
	.globl	lua_yieldk
	.hidden	lua_yieldk
	.type	lua_yieldk, @function
lua_yieldk:
	lhu	a4,108(a0)
	addi	sp,sp,-12
	sw	ra,8(sp)
	lw	t1,20(a0)
	mv	a5,a0
	beq	a4,zero,.L292
	lw	a4,16(a0)
	lw	a4,112(a4)
	beq	a4,a0,.L293
	lla	a1,.LC9
	call	luaG_runerror
.L292:
	li	a4,1
	sb	a4,8(a0)
	lw	t0,32(a0)
	lw	a0,0(t1)
	lhu	a4,34(t1)
	sub	a0,a0,t0
	sw	a0,28(t1)
	andi	a4,a4,2
	beq	a4,zero,.L300
	lw	ra,8(sp)
	li	a0,0
	addi	sp,sp,12
	jr	ra
.L293:
	lla	a1,.LC10
	call	luaG_runerror
.L300:
	sw	a3,16(t1)
	beq	a3,zero,.L295
	sw	a2,24(t1)
.L295:
	lw	a3,12(a5)
	not	a4,a1
	slli	a4,a4,3
	add	a4,a3,a4
	sw	a4,0(t1)
	li	a1,1
	mv	a0,a5
	call	luaD_throw
	.size	lua_yieldk, .-lua_yieldk
	.section	.text.luaD_pcall,"ax",@progbits
	.align	2
	.globl	luaD_pcall
	.hidden	luaD_pcall
	.type	luaD_pcall, @function
luaD_pcall:
	lw	a5,92(a0)
	addi	sp,sp,-32
	sw	s0,24(sp)
	sw	a5,0(sp)
	lw	a5,20(a0)
	sw	s1,20(sp)
	sw	ra,28(sp)
	sw	a5,4(sp)
	lbu	a5,116(a0)
	sw	a4,92(a0)
	mv	s1,a0
	sw	a5,8(sp)
	lhu	a5,108(a0)
	mv	s0,a3
	sw	a5,12(sp)
	call	luaD_rawrunprotected
	mv	a4,a0
	bne	a0,zero,.L307
	lw	a5,0(sp)
	lw	ra,28(sp)
	lw	s0,24(sp)
	sw	a5,92(s1)
	mv	a0,a4
	lw	s1,20(sp)
	addi	sp,sp,32
	jr	ra
.L307:
	lw	a2,32(s1)
	sw	a0,16(sp)
	mv	a0,s1
	add	s0,a2,s0
	mv	a1,s0
	call	luaF_close
	lw	a4,16(sp)
	mv	a2,s0
	mv	a0,s1
	mv	a1,a4
	call	seterrorobj
	lw	a5,4(sp)
	mv	a0,s1
	sw	a5,20(s1)
	lw	a5,8(sp)
	sb	a5,116(s1)
	lw	a5,12(sp)
	sh	a5,108(s1)
	call	luaD_shrinkstack
	lw	a5,0(sp)
	lw	a4,16(sp)
	lw	ra,28(sp)
	lw	s0,24(sp)
	sw	a5,92(s1)
	mv	a0,a4
	lw	s1,20(sp)
	addi	sp,sp,32
	jr	ra
	.size	luaD_pcall, .-luaD_pcall
	.section	.text.luaD_protectedparser,"ax",@progbits
	.align	2
	.globl	luaD_protectedparser
	.hidden	luaD_protectedparser
	.type	luaD_protectedparser, @function
luaD_protectedparser:
	addi	sp,sp,-72
	lhu	a5,108(a0)
	sw	s1,60(sp)
	lw	t2,32(a0)
	lw	s1,12(a0)
	lw	a4,92(a0)
	sw	ra,68(sp)
	sw	s0,64(sp)
	addi	a5,a5,1
	mv	ra,a1
	mv	t0,a2
	mv	t1,a3
	mv	a2,sp
	sub	a3,s1,t2
	sh	a5,108(a0)
	lla	a1,f_parser
	mv	s0,a0
	sw	ra,0(sp)
	sw	t0,56(sp)
	sw	t1,52(sp)
	sw	zero,16(sp)
	sw	zero,24(sp)
	sw	zero,28(sp)
	sw	zero,36(sp)
	sw	zero,40(sp)
	sw	zero,48(sp)
	sw	zero,4(sp)
	sw	zero,12(sp)
	call	luaD_pcall
	lw	a2,12(sp)
	lw	a1,4(sp)
	mv	s1,a0
	li	a3,0
	mv	a0,s0
	call	luaM_realloc_
	lw	a2,24(sp)
	lw	a1,16(sp)
	mv	a5,a0
	li	a3,0
	slli	a2,a2,1
	mv	a0,s0
	sw	a5,4(sp)
	sw	zero,12(sp)
	call	luaM_realloc_
	lw	a2,36(sp)
	lw	a1,28(sp)
	li	a3,0
	slli	a2,a2,4
	mv	a0,s0
	call	luaM_realloc_
	lw	a2,48(sp)
	lw	a1,40(sp)
	mv	a0,s0
	li	a3,0
	slli	a2,a2,4
	call	luaM_realloc_
	lhu	a5,108(s0)
	lw	ra,68(sp)
	mv	a0,s1
	addi	a5,a5,-1
	sh	a5,108(s0)
	lw	s0,64(sp)
	lw	s1,60(sp)
	addi	sp,sp,72
	jr	ra
	.size	luaD_protectedparser, .-luaD_protectedparser
	.hidden	luaF_close
	.hidden	luaS_new
	.hidden	luaG_typeerror
	.hidden	luaE_extendCI
	.hidden	luaT_gettmbyobj
	.hidden	luaC_step
	.hidden	luaV_execute
	.hidden	luaV_finishOp
	.hidden	luaO_nilobject_
	.hidden	luaE_shrinkCI
	.hidden	luaE_freeCI
	.hidden	luaG_runerror
	.hidden	luaM_toobig
	.hidden	luaM_realloc_
	.hidden	luaO_pushfstring
	.hidden	luaZ_fill
	.hidden	luaU_undump
	.hidden	luaF_initupvals
	.hidden	luaY_parser
	.hidden	luaS_newlstr
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
