#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"vidblit.cpp"
	.option nopic
	.text
	.section	.rodata._Z14InitBlitToHighijjjiii.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"AM Panic: "
	.align	2
.LC1:
	.string	"Assertion `b == 4' failed"
	.align	2
.LC2:
	.string	" @ /home/ysyx/ysyx-workbench/fceux-am/src/drivers/common/vidblit.cpp:56  \n"
	.section	.text._Z14InitBlitToHighijjjiii,"ax",@progbits
	.align	2
	.globl	_Z14InitBlitToHighijjjiii
	.hidden	_Z14InitBlitToHighijjjiii
	.type	_Z14InitBlitToHighijjjiii, @function
_Z14InitBlitToHighijjjiii:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	li	a4,4
	sw	a3,0(sp)
	bne	a0,a4,.L13
	mv	a5,a0
	li	a0,4096
	addi	a0,a0,-1024
	la a4, .LANCHOR0; sw a5, 0(a4);
	mv	s1,a1
	mv	s0,a2
	call	_Z12FCEU_dmallocj
	la a5, .LANCHOR1; sw a0, 0(a5);
	beq	a0,zero,.L7
	lw	a4,0(sp)
	lla	a5,.LANCHOR2
	lw	ra,12(sp)
	sw	s0,4(a5)
	lw	s0,8(sp)
	sw	s1,0(a5)
	sw	a4,8(a5)
	lw	s1,4(sp)
	li	a0,1
	addi	sp,sp,16
	jr	ra
.L7:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	li	a0,0
	addi	sp,sp,16
	jr	ra
.L13:
	lla	s0,.LC0
	li	a0,65
.L3:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L3
	lla	s0,.LC1
	li	a0,65
.L4:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L4
	lla	s0,.LC2
	li	a0,32
.L5:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L5
	li	a0,1
	call	halt
	.size	_Z14InitBlitToHighijjjiii, .-_Z14InitBlitToHighijjjiii
	.section	.text._Z14KillBlitToHighv,"ax",@progbits
	.align	2
	.globl	_Z14KillBlitToHighv
	.hidden	_Z14KillBlitToHighv
	.type	_Z14KillBlitToHighv, @function
_Z14KillBlitToHighv:
	la a0, .LANCHOR1; lw a0, 0(a0);
	beq	a0,zero,.L20
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	free
	lw	ra,8(sp)
	la a5, .LANCHOR1; sw zero, 0(a5);
	addi	sp,sp,12
	jr	ra
.L20:
	ret
	.size	_Z14KillBlitToHighv, .-_Z14KillBlitToHighv
	.section	.rodata._Z20SetPaletteBlitToHighPh.str1.4,"aMS",@progbits,1
	.align	2
.LC3:
	.string	"Assertion `Bpp == 4' failed"
	.align	2
.LC4:
	.string	" @ /home/ysyx/ysyx-workbench/fceux-am/src/drivers/common/vidblit.cpp:93  \n"
	.section	.text._Z20SetPaletteBlitToHighPh,"ax",@progbits
	.align	2
	.globl	_Z20SetPaletteBlitToHighPh
	.hidden	_Z20SetPaletteBlitToHighPh
	.type	_Z20SetPaletteBlitToHighPh, @function
_Z20SetPaletteBlitToHighPh:
	addi	sp,sp,-40
	li	a5,-1
	sw	s0,32(sp)
	sw	s1,28(sp)
	sw	a0,0(sp)
	sw	ra,36(sp)
	sw	a5,24(sp)
	sw	a5,20(sp)
	sw	a5,16(sp)
	lla	t2,.LANCHOR2
	addi	s0,sp,4
	addi	t1,sp,16
	lla	s1,.LANCHOR2+12
	li	a0,1
	li	t0,-1
	li	a1,32
.L24:
	lw	a2,0(t2)
	li	a3,0
	li	a5,0
.L27:
	sll	a4,a0,a5
	and	a4,a4,a2
	beq	a4,zero,.L25
	lw	a4,0(t1)
	beq	a4,t0,.L49
.L26:
	addi	a3,a3,1
.L25:
	addi	a5,a5,1
	bne	a5,a1,.L27
	li	a5,8
	sub	a3,a5,a3
	sw	a3,0(s0)
	addi	t2,t2,4
	addi	s0,s0,4
	addi	t1,t1,4
	bne	s1,t2,.L24
	la a4, .LANCHOR0; lw a4, 0(a4);
	li	a5,4
	bne	a4,a5,.L50
	lw	a4,0(sp)
	lw	a3,16(sp)
	lw	a2,20(sp)
	lw	a1,24(sp)
	la a0, .LANCHOR1; lw a0, 0(a0);
	mv	t1,a0
	addi	t0,a4,1024
.L33:
	lbu	a5,0(a4)
	lbu	s0,1(a4)
	lbu	t2,2(a4)
	sll	a5,a5,a3
	sll	s0,s0,a2
	or	a5,a5,s0
	sll	t2,t2,a1
	or	a5,a5,t2
	sw	a5,0(t1)
	addi	a4,a4,4
	addi	t1,t1,4
	bne	t0,a4,.L33
	la a4, palo; lw a4, 0(a4);
	beq	a4,zero,.L23
	addi	a0,a0,1024
	addi	t0,a4,1536
.L35:
	lbu	a5,0(a4)
	lbu	t2,1(a4)
	lbu	t1,2(a4)
	sll	a5,a5,a3
	sll	t2,t2,a2
	or	a5,a5,t2
	sll	t1,t1,a1
	or	a5,a5,t1
	sw	a5,0(a0)
	addi	a4,a4,3
	addi	a0,a0,4
	bne	t0,a4,.L35
.L23:
	lw	ra,36(sp)
	lw	s0,32(sp)
	lw	s1,28(sp)
	addi	sp,sp,40
	jr	ra
.L49:
	sw	a5,0(t1)
	j	.L26
.L50:
	lla	s0,.LC0
	li	a0,65
.L30:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L30
	lla	s0,.LC3
	li	a0,65
.L31:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L31
	lla	s0,.LC4
	li	a0,32
.L32:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L32
	li	a0,1
	call	halt
	.size	_Z20SetPaletteBlitToHighPh, .-_Z20SetPaletteBlitToHighPh
	.section	.rodata._Z11Blit8ToHighPhS_iiiii.str1.4,"aMS",@progbits,1
	.align	2
.LC5:
	.string	" @ /home/ysyx/ysyx-workbench/fceux-am/src/drivers/common/vidblit.cpp:119  \n"
	.align	2
.LC6:
	.string	"Assertion `xr % 8 == 0' failed"
	.align	2
.LC7:
	.string	" @ /home/ysyx/ysyx-workbench/fceux-am/src/drivers/common/vidblit.cpp:122  \n"
	.align	2
.LC8:
	.string	"Assertion `pinc % 4 == 0' failed"
	.align	2
.LC9:
	.string	" @ /home/ysyx/ysyx-workbench/fceux-am/src/drivers/common/vidblit.cpp:123  \n"
	.section	.text._Z11Blit8ToHighPhS_iiiii,"ax",@progbits
	.align	2
	.globl	_Z11Blit8ToHighPhS_iiiii
	.hidden	_Z11Blit8ToHighPhS_iiiii
	.type	_Z11Blit8ToHighPhS_iiiii, @function
_Z11Blit8ToHighPhS_iiiii:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	la t0, .LANCHOR0; lw t0, 0(t0);
	li	t1,4
	bne	t0,t1,.L88
	mv	a5,a4
	slli	t1,a2,2
	andi	a4,a2,7
	sub	a5,a5,t1
	bne	a4,zero,.L89
	andi	a4,a5,3
	bne	a4,zero,.L69
	beq	a3,zero,.L51
	srai	s0,a5,31
	addi	t2,a2,-8
	andi	s0,s0,3
	srli	t2,t2,3
	add	s0,s0,a5
	addi	t2,t2,1
	li	s1,256
	la a4, .LANCHOR1; lw a4, 0(a4);
	andi	s0,s0,-4
	sub	s1,s1,a2
	slli	t2,t2,5
.L63:
	add	t0,a0,a2
	mv	a5,a1
	beq	a2,zero,.L90
.L66:
	lbu	t1,0(a0)
	addi	a5,a5,32
	addi	a0,a0,8
	slli	t1,t1,2
	add	t1,a4,t1
	lw	t1,0(t1)
	sw	t1,-32(a5)
	lbu	t1,-7(a0)
	slli	t1,t1,2
	add	t1,a4,t1
	lw	t1,0(t1)
	sw	t1,-28(a5)
	lbu	t1,-6(a0)
	slli	t1,t1,2
	add	t1,a4,t1
	lw	t1,0(t1)
	sw	t1,-24(a5)
	lbu	t1,-5(a0)
	slli	t1,t1,2
	add	t1,a4,t1
	lw	t1,0(t1)
	sw	t1,-20(a5)
	lbu	t1,-4(a0)
	slli	t1,t1,2
	add	t1,a4,t1
	lw	t1,0(t1)
	sw	t1,-16(a5)
	lbu	t1,-3(a0)
	slli	t1,t1,2
	add	t1,a4,t1
	lw	t1,0(t1)
	sw	t1,-12(a5)
	lbu	t1,-2(a0)
	slli	t1,t1,2
	add	t1,a4,t1
	lw	t1,0(t1)
	sw	t1,-8(a5)
	lbu	t1,-1(a0)
	slli	t1,t1,2
	add	t1,a4,t1
	lw	t1,0(t1)
	sw	t1,-4(a5)
	bne	a0,t0,.L66
	add	a1,a1,t2
.L68:
	addi	a3,a3,-1
	add	a1,a1,s0
	add	a0,t0,s1
	bne	a3,zero,.L63
.L51:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L90:
	mv	t0,a0
	j	.L68
.L88:
	lla	s0,.LC0
	li	a0,65
.L53:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L53
	lla	s0,.LC3
	li	a0,65
.L54:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L54
	lla	s0,.LC5
	li	a0,32
.L55:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L55
.L60:
	li	a0,1
	call	halt
.L69:
	lla	s0,.LC0
	li	a0,65
.L61:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L61
	lla	s0,.LC8
	li	a0,65
.L64:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L64
	lla	s0,.LC9
	li	a0,32
.L65:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L65
	j	.L60
.L89:
	lla	s0,.LC0
	li	a0,65
.L57:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L57
	lla	s0,.LC6
	li	a0,65
.L58:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L58
	lla	s0,.LC7
	li	a0,32
.L59:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L59
	j	.L60
	.size	_Z11Blit8ToHighPhS_iiiii, .-_Z11Blit8ToHighPhS_iiiii
	.hidden	paldeemphswap
	.globl	paldeemphswap
	.section	.bss._ZL3CBM,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL3CBM, @object
	.size	_ZL3CBM, 12
_ZL3CBM:
	.zero	12
	.section	.sbss._ZL16palettetranslate,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	_ZL16palettetranslate, @object
	.size	_ZL16palettetranslate, 4
_ZL16palettetranslate:
	.zero	4
	.section	.sbss._ZL3Bpp,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL3Bpp, @object
	.size	_ZL3Bpp, 4
_ZL3Bpp:
	.zero	4
	.section	.sbss.paldeemphswap,"aw",@nobits
	.type	paldeemphswap, @object
	.size	paldeemphswap, 1
paldeemphswap:
	.zero	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
