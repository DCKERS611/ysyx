#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"ltable.c"
	.option nopic
	.text
	.globl	__modsi3
	.globl	__umodsi3
	.section	.text.mainposition.isra.0,"ax",@progbits
	.align	2
	.type	mainposition.isra.0, @function
mainposition.isra.0:
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	andi	a2,a2,63
	li	a5,22
	lw	s1,16(a0)
	mv	s0,a0
	mv	a0,a1
	bgtu	a2,a5,.L2
	lla	a4,.L4
	slli	a2,a2,2
	add	a2,a2,a4
	lw	a5,0(a2)
	add	a5,a5,a4
	jr	a5
	.section	.rodata.mainposition.isra.0,"a",@progbits
	.align	2
	.align	2
.L4:
	.word	.L2-.L4
	.word	.L6-.L4
	.word	.L2-.L4
	.word	.L8-.L4
	.word	.L7-.L4
	.word	.L2-.L4
	.word	.L2-.L4
	.word	.L2-.L4
	.word	.L2-.L4
	.word	.L2-.L4
	.word	.L2-.L4
	.word	.L2-.L4
	.word	.L2-.L4
	.word	.L2-.L4
	.word	.L2-.L4
	.word	.L2-.L4
	.word	.L2-.L4
	.word	.L2-.L4
	.word	.L2-.L4
	.word	.L6-.L4
	.word	.L5-.L4
	.word	.L2-.L4
	.word	.L2-.L4
	.section	.text.mainposition.isra.0
.L2:
	lbu	a5,7(s0)
	li	a1,1
	sll	a1,a1,a5
	addi	a1,a1,-1
	ori	a1,a1,1
	call	__umodsi3
	lw	ra,12(sp)
	lw	s0,8(sp)
	slli	a5,a0,2
	add	a5,a5,a0
	slli	a5,a5,2
	add	a0,s1,a5
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L6:
	lbu	a4,7(s0)
	li	a5,1
	lw	ra,12(sp)
	sll	a5,a5,a4
	addi	a5,a5,-1
	and	a5,a1,a5
	lw	s0,8(sp)
	slli	a4,a5,2
	add	a5,a4,a5
	slli	a5,a5,2
	add	a0,s1,a5
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L5:
	call	luaS_hashlongstr
	lbu	a4,7(s0)
	li	a5,1
	lw	ra,12(sp)
	sll	a5,a5,a4
	addi	a5,a5,-1
	and	a0,a5,a0
	lw	s0,8(sp)
	slli	a5,a0,2
	add	a5,a5,a0
	slli	a5,a5,2
	add	a0,s1,a5
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L8:
	mv	a1,sp
	call	frexp
	lbu	a5,7(s0)
	lw	a4,0(sp)
	slli	a0,a0,31
	li	a1,1
	add	a0,a0,a4
	sll	a1,a1,a5
	addi	a1,a1,-1
	srai	a5,a0,31
	xor	a0,a0,a5
	ori	a1,a1,1
	call	__modsi3
	lw	ra,12(sp)
	lw	s0,8(sp)
	slli	a5,a0,2
	add	a5,a5,a0
	slli	a5,a5,2
	add	a0,s1,a5
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L7:
	lbu	a3,7(s0)
	lw	a4,8(a1)
	li	a5,1
	sll	a5,a5,a3
	addi	a5,a5,-1
	and	a5,a5,a4
	lw	ra,12(sp)
	lw	s0,8(sp)
	slli	a4,a5,2
	add	a5,a4,a5
	slli	a5,a5,2
	add	a0,s1,a5
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
	.size	mainposition.isra.0, .-mainposition.isra.0
	.section	.rodata.luaH_next.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"invalid key to 'next'"
	.section	.text.luaH_next,"ax",@progbits
	.align	2
	.globl	luaH_next
	.hidden	luaH_next
	.type	luaH_next, @function
luaH_next:
	addi	sp,sp,-20
	sw	s1,8(sp)
	mv	s1,a2
	lw	a2,4(a2)
	sw	ra,16(sp)
	sw	s0,12(sp)
	sw	a0,4(sp)
	sw	a1,0(sp)
	beq	a2,zero,.L15
	li	a5,19
	lw	a1,0(s1)
	beq	a2,a5,.L35
.L16:
	lw	a0,0(sp)
	call	mainposition.isra.0
	mv	s0,a0
	j	.L21
.L19:
	lw	a2,16(s0)
	beq	a2,zero,.L36
	slli	a5,a2,2
	add	a5,a5,a2
	slli	a5,a5,2
	add	s0,s0,a5
.L21:
	mv	a2,s1
	addi	a1,s0,8
	li	a0,0
	call	luaV_equalobj
	bne	a0,zero,.L18
	lw	a5,12(s0)
	li	a4,10
	bne	a5,a4,.L19
	lw	a5,4(s1)
	andi	a5,a5,64
	beq	a5,zero,.L19
	lw	a2,8(s0)
	lw	a5,0(s1)
	bne	a2,a5,.L19
.L18:
	lw	a4,0(sp)
	lw	a5,16(a4)
	lw	a0,8(a4)
	sub	a4,s0,a5
	srai	a4,a4,2
	slli	a5,a4,1
	add	a5,a5,a4
	slli	a4,a5,4
	add	a5,a5,a4
	slli	a4,a5,8
	add	a5,a5,a4
	slli	a4,a5,16
	add	a5,a5,a4
	addi	a4,a0,1
	sub	a5,a4,a5
.L17:
	bgeu	a5,a0,.L22
	lw	a4,0(sp)
	slli	a2,a5,3
	lw	a4,12(a4)
	add	a4,a4,a2
	j	.L25
.L23:
	addi	a4,a4,8
	beq	a5,a0,.L22
.L25:
	lw	a2,4(a4)
	addi	a5,a5,1
	beq	a2,zero,.L23
	li	a2,19
	sw	a2,4(s1)
	sw	a5,0(s1)
	lw	a5,0(a4)
	li	a0,1
	sw	a5,8(s1)
	lw	a5,4(a4)
	sw	a5,12(s1)
.L14:
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L22:
	lw	a3,0(sp)
	li	a2,1
	sub	a5,a5,a0
	lbu	a4,7(a3)
	sll	a2,a2,a4
	ble	a2,a5,.L28
	lw	a4,16(a3)
	slli	a1,a5,2
	add	a1,a1,a5
	slli	a1,a1,2
	add	a4,a4,a1
	j	.L27
.L26:
	addi	a5,a5,1
	addi	a4,a4,20
	ble	a2,a5,.L14
.L27:
	lw	a0,4(a4)
	beq	a0,zero,.L26
	lw	a5,8(a4)
	lw	ra,16(sp)
	lw	s0,12(sp)
	sw	a5,0(s1)
	lw	a5,12(a4)
	li	a0,1
	sw	a5,4(s1)
	lw	a5,0(a4)
	sw	a5,8(s1)
	lw	a5,4(a4)
	sw	a5,12(s1)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L35:
	ble	a1,zero,.L16
	lw	a5,0(sp)
	lw	a0,8(a5)
	mv	a5,a1
	bgtu	a1,a0,.L16
	j	.L17
.L15:
	lw	a5,0(sp)
	lw	a0,8(a5)
	li	a5,0
	j	.L17
.L28:
	li	a0,0
	j	.L14
.L36:
	lw	a0,4(sp)
	lla	a1,.LC0
	call	luaG_runerror
	.size	luaH_next, .-luaH_next
	.section	.text.luaH_new,"ax",@progbits
	.align	2
	.globl	luaH_new
	.hidden	luaH_new
	.type	luaH_new, @function
luaH_new:
	addi	sp,sp,-12
	li	a2,32
	li	a1,5
	sw	ra,8(sp)
	call	luaC_newobj
	lla	a4,.LANCHOR0
	sw	a4,16(a0)
	li	a4,255
	sh	a4,6(a0)
	lw	ra,8(sp)
	sw	zero,24(a0)
	sw	zero,8(a0)
	sw	zero,12(a0)
	sw	zero,20(a0)
	addi	sp,sp,12
	jr	ra
	.size	luaH_new, .-luaH_new
	.section	.text.luaH_free,"ax",@progbits
	.align	2
	.globl	luaH_free
	.hidden	luaH_free
	.type	luaH_free, @function
luaH_free:
	lw	a5,20(a1)
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	mv	s0,a1
	mv	s1,a0
	beq	a5,zero,.L40
	lbu	a5,7(a1)
	lw	a1,16(a1)
	li	a2,20
	li	a3,0
	sll	a2,a2,a5
	call	luaM_realloc_
.L40:
	lw	a2,8(s0)
	lw	a1,12(s0)
	li	a3,0
	slli	a2,a2,3
	mv	a0,s1
	call	luaM_realloc_
	mv	a1,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	mv	a0,s1
	lw	s1,0(sp)
	li	a3,0
	li	a2,32
	addi	sp,sp,12
	tail	luaM_realloc_
	.size	luaH_free, .-luaH_free
	.section	.text.luaH_getint,"ax",@progbits
	.align	2
	.globl	luaH_getint
	.hidden	luaH_getint
	.type	luaH_getint, @function
luaH_getint:
	lw	a5,8(a0)
	addi	a4,a1,-1
	bltu	a4,a5,.L51
	lbu	a4,7(a0)
	li	a5,1
	lw	a0,16(a0)
	sll	a5,a5,a4
	addi	a5,a5,-1
	and	a5,a5,a1
	slli	a4,a5,2
	add	a5,a4,a5
	slli	a5,a5,2
	add	a0,a0,a5
	li	a3,19
	j	.L49
.L48:
	lw	a4,16(a0)
	slli	a5,a4,2
	add	a5,a5,a4
	slli	a5,a5,2
	beq	a4,zero,.L50
	add	a0,a0,a5
.L49:
	lw	a5,12(a0)
	bne	a5,a3,.L48
	lw	a5,8(a0)
	bne	a1,a5,.L48
	ret
.L50:
	lla	a0,luaO_nilobject_
	ret
.L51:
	lw	a0,12(a0)
	slli	a1,a1,3
	addi	a1,a1,-8
	add	a0,a0,a1
	ret
	.size	luaH_getint, .-luaH_getint
	.section	.text.luaH_getshortstr,"ax",@progbits
	.align	2
	.globl	luaH_getshortstr
	.hidden	luaH_getshortstr
	.type	luaH_getshortstr, @function
luaH_getshortstr:
	lbu	a3,7(a0)
	lw	a4,8(a1)
	li	a5,1
	sll	a5,a5,a3
	addi	a5,a5,-1
	and	a5,a5,a4
	lw	a0,16(a0)
	slli	a4,a5,2
	add	a5,a4,a5
	slli	a5,a5,2
	add	a0,a0,a5
	li	a3,68
	j	.L55
.L53:
	lw	a4,16(a0)
	slli	a5,a4,2
	add	a5,a5,a4
	slli	a5,a5,2
	beq	a4,zero,.L56
	add	a0,a0,a5
.L55:
	lw	a5,12(a0)
	bne	a5,a3,.L53
	lw	a5,8(a0)
	bne	a5,a1,.L53
	ret
.L56:
	lla	a0,luaO_nilobject_
	ret
	.size	luaH_getshortstr, .-luaH_getshortstr
	.section	.text.luaH_getstr,"ax",@progbits
	.align	2
	.globl	luaH_getstr
	.hidden	luaH_getstr
	.type	luaH_getstr, @function
luaH_getstr:
	lbu	a2,4(a1)
	li	a5,4
	mv	a3,a1
	beq	a2,a5,.L70
	addi	sp,sp,-20
	ori	a2,a2,64
	sw	s0,12(sp)
	sw	ra,16(sp)
	sw	a1,0(sp)
	sw	a2,4(sp)
	call	mainposition.isra.0
	mv	s0,a0
	j	.L64
.L62:
	lw	a4,16(s0)
	slli	a5,a4,2
	add	a5,a5,a4
	slli	a5,a5,2
	beq	a4,zero,.L66
	add	s0,s0,a5
.L64:
	addi	a1,s0,8
	mv	a2,sp
	li	a0,0
	call	luaV_equalobj
	beq	a0,zero,.L62
	lw	ra,16(sp)
	mv	a0,s0
	lw	s0,12(sp)
	addi	sp,sp,20
	jr	ra
.L70:
	lbu	a1,7(a0)
	lw	a2,8(a3)
	li	a5,1
	sll	a5,a5,a1
	addi	a5,a5,-1
	and	a5,a5,a2
	lw	a0,16(a0)
	slli	a4,a5,2
	add	a5,a4,a5
	slli	a5,a5,2
	add	a0,a0,a5
	li	a2,68
	j	.L61
.L59:
	lw	a4,16(a0)
	slli	a5,a4,2
	add	a5,a5,a4
	slli	a5,a5,2
	beq	a4,zero,.L65
	add	a0,a0,a5
.L61:
	lw	a5,12(a0)
	bne	a5,a2,.L59
	lw	a5,8(a0)
	bne	a3,a5,.L59
	ret
.L66:
	lw	ra,16(sp)
	lw	s0,12(sp)
	lla	a0,luaO_nilobject_
	addi	sp,sp,20
	jr	ra
.L65:
	lla	a0,luaO_nilobject_
	ret
	.size	luaH_getstr, .-luaH_getstr
	.section	.text.luaH_get,"ax",@progbits
	.align	2
	.globl	luaH_get
	.hidden	luaH_get
	.type	luaH_get, @function
luaH_get:
	lw	a2,4(a1)
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	li	a4,4
	andi	a5,a2,63
	mv	s1,a1
	mv	s0,a0
	beq	a5,a4,.L72
	bgt	a5,a4,.L73
	lla	a0,luaO_nilobject_
	beq	a5,zero,.L71
	li	a4,3
	bne	a5,a4,.L76
	li	a2,0
	mv	a1,sp
	mv	a0,s1
	call	luaV_tointeger
	bne	a0,zero,.L91
	lw	a2,4(s1)
.L76:
	lw	a1,0(s1)
	mv	a0,s0
	call	mainposition.isra.0
	mv	s0,a0
	j	.L84
.L82:
	lw	a4,16(s0)
	slli	a5,a4,2
	add	a5,a5,a4
	slli	a5,a5,2
	beq	a4,zero,.L83
	add	s0,s0,a5
.L84:
	addi	a1,s0,8
	mv	a2,s1
	li	a0,0
	call	luaV_equalobj
	beq	a0,zero,.L82
	mv	a0,s0
.L71:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L73:
	li	a4,19
	bne	a5,a4,.L76
	lw	s0,8(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	lw	a1,0(a1)
	addi	sp,sp,16
	tail	luaH_getint
.L83:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	lla	a0,luaO_nilobject_
	addi	sp,sp,16
	jr	ra
.L72:
	lw	a2,0(a1)
	lbu	a3,7(a0)
	li	a5,1
	lw	a4,8(a2)
	sll	a5,a5,a3
	addi	a5,a5,-1
	and	a5,a5,a4
	lw	a0,16(a0)
	slli	a4,a5,2
	add	a5,a4,a5
	slli	a5,a5,2
	add	a0,a0,a5
	li	a3,68
	j	.L80
.L78:
	lw	a4,16(a0)
	slli	a5,a4,2
	add	a5,a5,a4
	slli	a5,a5,2
	beq	a4,zero,.L83
	add	a0,a0,a5
.L80:
	lw	a5,12(a0)
	bne	a5,a3,.L78
	lw	a5,8(a0)
	bne	a2,a5,.L78
	j	.L71
.L91:
	lw	a1,0(sp)
	mv	a0,s0
	call	luaH_getint
	j	.L71
	.size	luaH_get, .-luaH_get
	.section	.rodata.luaH_newkey.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"table index is nil"
	.section	.text.luaH_newkey,"ax",@progbits
	.align	2
	.globl	luaH_newkey
	.hidden	luaH_newkey
	.type	luaH_newkey, @function
luaH_newkey:
	addi	sp,sp,-172
	sw	s1,160(sp)
	mv	s1,a2
	lw	a2,4(a2)
	sw	ra,168(sp)
	sw	s0,164(sp)
	sw	a0,0(sp)
	beq	a2,zero,.L166
	li	a5,3
	mv	s0,a1
	beq	a2,a5,.L167
.L94:
	lw	a1,0(s1)
	mv	a0,s0
	call	mainposition.isra.0
	lw	a5,4(a0)
	mv	a3,a0
	bne	a5,zero,.L97
	lw	a5,20(s0)
	beq	a5,zero,.L100
	lw	a5,0(s1)
	sw	a5,8(a3)
	lw	a5,4(s1)
	sw	a5,12(a3)
	andi	a5,a5,64
	beq	a5,zero,.L123
.L172:
	lbu	a5,5(s0)
	andi	a5,a5,4
	beq	a5,zero,.L123
	lw	a5,0(s1)
	lbu	a5,5(a5)
	andi	a5,a5,3
	bne	a5,zero,.L168
.L123:
	mv	a0,a3
.L92:
	lw	ra,168(sp)
	lw	s0,164(sp)
	lw	s1,160(sp)
	addi	sp,sp,172
	jr	ra
.L100:
	addi	a5,sp,32
	sw	a5,4(sp)
	addi	a0,sp,160
.L99:
	sw	zero,0(a5)
	addi	a5,a5,4
	bne	a0,a5,.L99
	lw	ra,8(s0)
	addi	a2,sp,32
	li	t2,0
	li	a3,1
	li	a1,1
.L110:
	bgeu	ra,a1,.L104
	bltu	ra,a3,.L105
	mv	t0,ra
.L109:
	lw	a4,12(s0)
	slli	a5,a3,3
	li	t1,0
	add	a4,a4,a5
.L107:
	lw	a5,-4(a4)
	addi	a3,a3,1
	addi	a4,a4,8
	snez	a5,a5
	add	t1,t1,a5
	bgeu	t0,a3,.L107
	add	t2,t2,t1
.L108:
	lw	a5,0(a2)
	addi	a2,a2,4
	slli	a1,a1,1
	add	a5,a5,t1
	sw	a5,-4(a2)
	bne	a0,a2,.L110
.L105:
	lbu	a4,7(s0)
	li	a5,1
	mv	a3,t2
	sll	a5,a5,a4
	addi	a4,a5,-1
	beq	a5,zero,.L111
	li	a3,0
	li	a1,0
	li	a2,19
	j	.L114
.L112:
	addi	a5,a4,-1
	beq	a4,zero,.L169
	mv	a4,a5
.L114:
	lw	a0,16(s0)
	slli	a5,a4,2
	add	a5,a5,a4
	slli	a5,a5,2
	add	a5,a0,a5
	lw	a0,4(a5)
	beq	a0,zero,.L112
	lw	a0,12(a5)
	beq	a0,a2,.L170
.L113:
	addi	a3,a3,1
	j	.L112
.L97:
	lw	a5,20(s0)
	beq	a5,zero,.L100
	lw	a2,16(s0)
.L101:
	bleu	a5,a2,.L100
	lw	a4,-8(a5)
	addi	t1,a5,-20
	sw	t1,20(s0)
	beq	a4,zero,.L102
	mv	a5,t1
	j	.L101
.L102:
	lw	a2,12(a3)
	lw	a1,8(a3)
	mv	a0,s0
	sw	a5,12(sp)
	sw	t1,8(sp)
	sw	a3,4(sp)
	call	mainposition.isra.0
	lw	a3,4(sp)
	lw	t1,8(sp)
	lw	a5,12(sp)
	beq	a3,a0,.L171
.L120:
	lw	a1,16(a0)
	mv	a2,a0
	slli	a4,a1,2
	add	a4,a4,a1
	slli	a4,a4,2
	add	a0,a0,a4
	bne	a0,a3,.L120
	sub	a1,t1,a2
	srai	a1,a1,2
	slli	a4,a1,1
	add	a4,a4,a1
	slli	a1,a4,4
	add	a4,a4,a1
	slli	a1,a4,8
	add	a4,a4,a1
	slli	a1,a4,16
	add	a4,a4,a1
	neg	a4,a4
	sw	a4,16(a2)
	lw	a4,12(a3)
	lw	t0,0(a3)
	lw	a0,4(a3)
	lw	a1,8(a3)
	lw	a2,16(a3)
	sw	t0,-20(a5)
	sw	a0,-16(a5)
	sw	a1,-12(a5)
	sw	a4,-8(a5)
	sw	a2,-4(a5)
	lw	a4,16(a3)
	beq	a4,zero,.L121
	sub	a1,a3,t1
	srai	a1,a1,2
	slli	a4,a1,1
	add	a4,a4,a1
	slli	a1,a4,4
	add	a4,a4,a1
	slli	a1,a4,8
	add	a4,a4,a1
	slli	a1,a4,16
	add	a4,a4,a1
	sub	a2,a2,a4
	sw	a2,-4(a5)
	sw	zero,16(a3)
.L121:
	lw	a5,0(s1)
	sw	zero,4(a3)
	sw	a5,8(a3)
	lw	a5,4(s1)
	sw	a5,12(a3)
	andi	a5,a5,64
	beq	a5,zero,.L123
	j	.L172
.L167:
	li	a2,0
	addi	a1,sp,32
	mv	a0,s1
	call	luaV_tointeger
	beq	a0,zero,.L173
	li	a5,19
	sw	a5,28(sp)
	lw	a5,32(sp)
	li	a2,19
	addi	s1,sp,24
	sw	a5,24(sp)
	j	.L94
.L173:
	lw	a2,4(s1)
	j	.L94
.L168:
	lw	a0,0(sp)
	mv	a1,s0
	sw	a3,4(sp)
	call	luaC_barrierback_
	lw	a3,4(sp)
	j	.L123
.L170:
	lw	a0,8(a5)
	ble	a0,zero,.L113
	sw	t2,20(sp)
	sw	a3,16(sp)
	sw	a4,12(sp)
	sw	a1,8(sp)
	call	luaO_ceillog2
	slli	a5,a0,2
	addi	a4,sp,32
	add	a5,a4,a5
	lw	a0,0(a5)
	lw	a1,8(sp)
	lw	a3,16(sp)
	addi	a0,a0,1
	lw	t2,20(sp)
	lw	a4,12(sp)
	addi	a1,a1,1
	sw	a0,0(a5)
	li	a2,19
	addi	a3,a3,1
	j	.L112
.L104:
	mv	t0,a1
	bgeu	a1,a3,.L109
	li	t1,0
	j	.L108
.L171:
	lw	a4,16(a3)
	beq	a4,zero,.L122
	slli	a2,a4,2
	add	a2,a2,a4
	slli	a2,a2,2
	add	a2,a3,a2
	sub	a2,a2,t1
	srai	a2,a2,2
	slli	a4,a2,1
	add	a4,a4,a2
	slli	a2,a4,4
	add	a4,a4,a2
	slli	a2,a4,8
	add	a4,a4,a2
	slli	a2,a4,16
	add	a4,a4,a2
	neg	a4,a4
	sw	a4,-4(a5)
.L122:
	sub	a4,t1,a3
	srai	a4,a4,2
	slli	a5,a4,1
	add	a5,a5,a4
	slli	a4,a5,4
	add	a5,a5,a4
	slli	a4,a5,8
	add	a5,a5,a4
	slli	a4,a5,16
	add	a5,a5,a4
	neg	a5,a5
	sw	a5,16(a3)
	lw	a5,0(s1)
	mv	a3,t1
	sw	a5,8(a3)
	lw	a5,4(s1)
	sw	a5,12(a3)
	andi	a5,a5,64
	beq	a5,zero,.L123
	j	.L172
.L169:
	add	a3,t2,a3
	add	t2,t2,a1
.L111:
	lw	a4,4(s1)
	li	a5,19
	beq	a4,a5,.L174
.L115:
	addi	a3,a3,1
	li	a2,0
	li	t1,0
	beq	t2,zero,.L116
	lw	a1,4(sp)
	li	a5,1
	li	a4,0
	li	a0,0
.L118:
	lw	t0,0(a1)
	beq	t0,zero,.L117
	add	a0,a0,t0
	bleu	a0,a4,.L117
	mv	a2,a5
	mv	t1,a0
.L117:
	slli	a5,a5,1
	srli	a4,a5,1
	addi	a1,a1,4
	bltu	a4,t2,.L118
.L116:
	lw	a0,0(sp)
	sub	a3,a3,t1
	mv	a1,s0
	call	luaH_resize
	mv	a1,s1
	mv	a0,s0
	call	luaH_get
	lla	a5,luaO_nilobject_
	bne	a0,a5,.L92
	lw	a0,0(sp)
	mv	a2,s1
	mv	a1,s0
	call	luaH_newkey
	j	.L92
.L174:
	lw	a0,0(s1)
	ble	a0,zero,.L115
	sw	t2,12(sp)
	sw	a3,8(sp)
	call	luaO_ceillog2
	addi	a4,sp,32
	slli	a5,a0,2
	add	a5,a4,a5
	lw	a4,0(a5)
	lw	t2,12(sp)
	lw	a3,8(sp)
	addi	a4,a4,1
	addi	t2,t2,1
	sw	a4,0(a5)
	j	.L115
.L166:
	lla	a1,.LC1
	call	luaG_runerror
	.size	luaH_newkey, .-luaH_newkey
	.section	.rodata.luaH_resize.str1.4,"aMS",@progbits,1
	.align	2
.LC2:
	.string	"table overflow"
	.section	.text.luaH_resize,"ax",@progbits
	.align	2
	.globl	luaH_resize
	.hidden	luaH_resize
	.type	luaH_resize, @function
luaH_resize:
	lw	a5,20(a1)
	addi	sp,sp,-44
	sw	s0,36(sp)
	sw	s1,32(sp)
	sw	ra,40(sp)
	sw	a0,8(sp)
	sw	zero,0(sp)
	lw	s0,8(a1)
	mv	a4,a1
	mv	t1,a2
	mv	s1,a3
	beq	a5,zero,.L176
	lbu	a5,7(a1)
	li	a3,1
	sll	a5,a3,a5
	sw	a5,0(sp)
.L176:
	lw	a5,16(a4)
	sw	a5,16(sp)
	bltu	s0,t1,.L214
	bne	s1,zero,.L182
.L221:
	lla	a5,.LANCHOR0
	sw	a5,16(a4)
	li	a3,0
.L183:
	sb	s1,7(a4)
	sw	a3,20(a4)
	bgtu	s0,t1,.L215
.L187:
	lw	a5,0(sp)
	addi	s0,a5,-1
	blt	s0,zero,.L197
	slli	a2,s0,2
	lw	a5,16(sp)
	add	a2,a2,s0
	slli	a2,a2,2
	addi	a2,a2,8
	add	s1,a5,a2
	sw	a4,4(sp)
	j	.L196
.L194:
	addi	s0,s0,-1
	li	a4,-1
	addi	s1,s1,-20
	beq	s0,a4,.L197
.L196:
	lw	a4,-4(s1)
	beq	a4,zero,.L194
	lw	a0,4(sp)
	mv	a1,s1
	call	luaH_get
	lla	a5,luaO_nilobject_
	beq	a0,a5,.L216
.L195:
	lw	a4,-8(s1)
	addi	s0,s0,-1
	addi	s1,s1,-20
	sw	a4,0(a0)
	lw	a4,16(s1)
	sw	a4,4(a0)
	li	a4,-1
	bne	s0,a4,.L196
.L197:
	lw	a5,0(sp)
	bgt	a5,zero,.L217
	lw	ra,40(sp)
	lw	s0,36(sp)
	lw	s1,32(sp)
	addi	sp,sp,44
	jr	ra
.L215:
	sw	t1,8(a4)
	mv	a5,t1
	sw	t1,20(sp)
.L190:
	lw	s1,12(a4)
	slli	a3,a5,3
	addi	a5,a5,1
	add	s1,s1,a3
	lw	a3,4(s1)
	bne	a3,zero,.L218
	bne	s0,a5,.L190
.L220:
	lw	t1,20(sp)
	li	a3,536870912
	addi	a5,t1,1
	bgeu	a5,a3,.L185
	lw	a1,12(a4)
	lw	a0,8(sp)
	slli	a3,t1,3
	slli	a2,s0,3
	sw	a4,4(sp)
	call	luaM_realloc_
	lw	a4,4(sp)
	sw	a0,12(a4)
	j	.L187
.L218:
	mv	a1,a5
	mv	a0,a4
	sw	a5,12(sp)
	sw	a4,4(sp)
	call	luaH_getint
	lla	a3,luaO_nilobject_
	lw	a4,4(sp)
	lw	a5,12(sp)
	beq	a0,a3,.L219
.L189:
	lw	a3,0(s1)
	sw	a3,0(a0)
	lw	a3,4(s1)
	sw	a3,4(a0)
	bne	s0,a5,.L190
	j	.L220
.L214:
	addi	a5,t1,1
	li	a3,536870912
	bgeu	a5,a3,.L185
	lw	a1,12(a4)
	lw	a0,8(sp)
	slli	a3,t1,3
	slli	a2,s0,3
	sw	a4,20(sp)
	sw	t1,12(sp)
	sw	a3,4(sp)
	call	luaM_realloc_
	lw	a4,20(sp)
	lw	a3,4(sp)
	lw	t1,12(sp)
	lw	a2,8(a4)
	sw	a0,12(a4)
	add	a3,a0,a3
	slli	a5,a2,3
	add	a5,a0,a5
	bleu	t1,a2,.L181
.L180:
	sw	zero,4(a5)
	addi	a5,a5,8
	bne	a5,a3,.L180
.L181:
	sw	t1,8(a4)
	beq	s1,zero,.L221
.L182:
	mv	a0,s1
	sw	t1,12(sp)
	sw	a4,4(sp)
	call	luaO_ceillog2
	li	a5,30
	lw	a4,4(sp)
	lw	t1,12(sp)
	mv	s1,a0
	bgt	a0,a5,.L222
	li	a5,1
	sll	a5,a5,a0
	li	a3,214749184
	sw	t1,20(sp)
	sw	a4,12(sp)
	addi	a5,a5,1
	addi	a3,a3,-820
	bgtu	a5,a3,.L185
	li	a3,20
	sll	a3,a3,a0
	lw	a0,8(sp)
	li	a2,0
	li	a1,0
	sw	a3,4(sp)
	call	luaM_realloc_
	lw	a4,12(sp)
	lw	a3,4(sp)
	lw	t1,20(sp)
	mv	a5,a0
	sw	a0,16(a4)
	add	a3,a0,a3
.L186:
	sw	zero,16(a5)
	sw	zero,12(a5)
	sw	zero,4(a5)
	addi	a5,a5,20
	bne	a3,a5,.L186
	andi	s1,s1,0xff
	j	.L183
.L216:
	lw	a1,4(sp)
	lw	a0,8(sp)
	mv	a2,s1
	call	luaH_newkey
	j	.L195
.L217:
	lw	a5,0(sp)
	lw	s0,36(sp)
	lw	a1,16(sp)
	lw	a0,8(sp)
	lw	ra,40(sp)
	lw	s1,32(sp)
	slli	a2,a5,2
	add	a2,a2,a5
	li	a3,0
	slli	a2,a2,2
	addi	sp,sp,44
	tail	luaM_realloc_
.L219:
	lw	a0,8(sp)
	mv	a1,a4
	li	a3,19
	addi	a2,sp,24
	sw	a4,12(sp)
	sw	a5,24(sp)
	sw	a5,4(sp)
	sw	a3,28(sp)
	call	luaH_newkey
	lw	a4,12(sp)
	lw	a5,4(sp)
	j	.L189
.L185:
	lw	a0,8(sp)
	call	luaM_toobig
.L222:
	lw	a0,8(sp)
	lla	a1,.LC2
	call	luaG_runerror
	.size	luaH_resize, .-luaH_resize
	.section	.text.luaH_resizearray,"ax",@progbits
	.align	2
	.globl	luaH_resizearray
	.hidden	luaH_resizearray
	.type	luaH_resizearray, @function
luaH_resizearray:
	lw	a5,20(a1)
	li	a3,0
	beq	a5,zero,.L224
	lbu	a5,7(a1)
	li	a3,1
	sll	a3,a3,a5
.L224:
	tail	luaH_resize
	.size	luaH_resizearray, .-luaH_resizearray
	.section	.text.luaH_set,"ax",@progbits
	.align	2
	.globl	luaH_set
	.hidden	luaH_set
	.type	luaH_set, @function
luaH_set:
	addi	sp,sp,-16
	sw	s0,8(sp)
	mv	s0,a1
	sw	s1,4(sp)
	mv	a1,a2
	mv	s1,a0
	mv	a0,s0
	sw	a2,0(sp)
	sw	ra,12(sp)
	call	luaH_get
	lla	a5,luaO_nilobject_
	lw	a2,0(sp)
	beq	a5,a0,.L230
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L230:
	mv	a1,s0
	lw	s0,8(sp)
	lw	ra,12(sp)
	mv	a0,s1
	lw	s1,4(sp)
	addi	sp,sp,16
	tail	luaH_newkey
	.size	luaH_set, .-luaH_set
	.section	.text.luaH_setint,"ax",@progbits
	.align	2
	.globl	luaH_setint
	.hidden	luaH_setint
	.type	luaH_setint, @function
luaH_setint:
	addi	sp,sp,-28
	mv	a4,a1
	sw	s0,20(sp)
	mv	a1,a2
	mv	s0,a0
	mv	a0,a4
	sw	s1,16(sp)
	sw	a4,0(sp)
	mv	s1,a3
	sw	ra,24(sp)
	sw	a2,4(sp)
	call	luaH_getint
	lla	a3,luaO_nilobject_
	lw	a4,0(sp)
	lw	a5,4(sp)
	beq	a0,a3,.L234
.L232:
	lw	a5,0(s1)
	lw	ra,24(sp)
	lw	s0,20(sp)
	sw	a5,0(a0)
	lw	a5,4(s1)
	lw	s1,16(sp)
	sw	a5,4(a0)
	addi	sp,sp,28
	jr	ra
.L234:
	sw	a5,8(sp)
	addi	a2,sp,8
	li	a5,19
	mv	a1,a4
	mv	a0,s0
	sw	a5,12(sp)
	call	luaH_newkey
	j	.L232
	.size	luaH_setint, .-luaH_setint
	.section	.text.luaH_getn,"ax",@progbits
	.align	2
	.globl	luaH_getn
	.hidden	luaH_getn
	.type	luaH_getn, @function
luaH_getn:
	addi	sp,sp,-20
	sw	s0,12(sp)
	lw	s0,8(a0)
	sw	ra,16(sp)
	sw	s1,8(sp)
	mv	a3,a0
	beq	s0,zero,.L236
	li	a1,536870912
	lw	a0,12(a0)
	addi	a1,a1,-1
	add	a5,s0,a1
	slli	a5,a5,3
	add	a5,a0,a5
	lw	a5,4(a5)
	beq	a5,zero,.L261
.L236:
	lw	a4,20(a3)
	addi	s1,s0,1
	bne	a4,zero,.L242
.L260:
	lw	ra,16(sp)
	mv	a0,s0
	lw	s0,12(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L246:
	li	a5,1073741824
	bgeu	s1,a5,.L262
	mv	s0,s1
	slli	s1,s1,1
.L242:
	mv	a0,a3
	mv	a1,s1
	sw	a3,0(sp)
	call	luaH_getint
	lw	a4,4(a0)
	lw	a3,0(sp)
	bne	a4,zero,.L246
	j	.L248
.L249:
	sw	a3,4(sp)
	sw	a4,0(sp)
	call	luaH_getint
	lw	a2,4(a0)
	lw	a4,0(sp)
	lw	a3,4(sp)
	bne	a2,zero,.L263
	mv	s1,a4
.L248:
	add	a4,s1,s0
	srli	a4,a4,1
	sub	a2,s1,s0
	li	a5,1
	mv	a1,a4
	mv	a0,a3
	bgtu	a2,a5,.L249
	j	.L260
.L263:
	mv	s0,a4
	j	.L248
.L262:
	li	s0,1
	j	.L243
.L245:
	addi	s0,s0,1
.L243:
	mv	a0,a3
	mv	a1,s0
	sw	a3,0(sp)
	call	luaH_getint
	lw	a5,4(a0)
	lw	a3,0(sp)
	bne	a5,zero,.L245
	lw	ra,16(sp)
	addi	a0,s0,-1
	lw	s0,12(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L261:
	li	a3,0
	li	t1,1
	j	.L238
.L239:
	lw	a5,4(a5)
	bne	a5,zero,.L264
	mv	s0,a4
.L238:
	add	a4,s0,a3
	srli	a4,a4,1
	add	a5,a4,a1
	slli	a5,a5,3
	sub	a2,s0,a3
	add	a5,a0,a5
	bgtu	a2,t1,.L239
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	mv	a0,a3
	addi	sp,sp,20
	jr	ra
.L264:
	mv	a3,a4
	j	.L238
	.size	luaH_getn, .-luaH_getn
	.section	.rodata.dummynode_,"a"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	dummynode_, @object
	.size	dummynode_, 20
dummynode_:
	.zero	20
	.hidden	luaM_toobig
	.hidden	luaO_ceillog2
	.hidden	luaC_barrierback_
	.hidden	luaV_tointeger
	.hidden	luaO_nilobject_
	.hidden	luaM_realloc_
	.hidden	luaC_newobj
	.hidden	luaG_runerror
	.hidden	luaV_equalobj
	.hidden	luaS_hashlongstr
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
