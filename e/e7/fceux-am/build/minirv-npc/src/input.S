#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"input.cpp"
	.option nopic
	.text
	.section	.text._ZL6JPReadj,"ax",@progbits
	.align	2
	.type	_ZL6JPReadj, @function
_ZL6JPReadj:
	addi	sp,sp,-12
	sw	s0,4(sp)
	andi	s0,a0,1
	slli	a5,s0,2
	add	a5,a5,s0
	slli	a5,a5,2
	lla	a4,.LANCHOR0
	add	a5,a4,a5
	lw	a5,16(a5)
	sw	ra,8(sp)
	lw	a5,0(a5)
	beq	a5,zero,.L4
	mv	a0,s0
	jalr	a5
.L2:
	la a5, .LANCHOR1+12; lw a5, 0(a5);
	beq	a5,zero,.L3
	lw	a5,0(a5)
	beq	a5,zero,.L3
	mv	a1,a0
	mv	a0,s0
	jalr	a5
.L3:
	lw	ra,8(sp)
	lw	s0,4(sp)
	la a5, X+24; lbu a5, 0(a5);
	andi	a5,a5,-64
	or	a0,a0,a5
	andi	a0,a0,0xff
	addi	sp,sp,12
	jr	ra
.L4:
	li	a0,0
	j	.L2
	.size	_ZL6JPReadj, .-_ZL6JPReadj
	.section	.text._ZL5B4016jh,"ax",@progbits
	.align	2
	.type	_ZL5B4016jh, @function
_ZL5B4016jh:
	lla	a5,.LANCHOR1
	lw	a5,12(a5)
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	sw	s1,0(sp)
	mv	s0,a1
	beq	a5,zero,.L14
	lw	a5,4(a5)
	beq	a5,zero,.L14
	andi	a0,a1,7
	jalr	a5
.L14:
	lla	a3,.LANCHOR0
	lw	a5,16(a3)
	andi	s1,s0,1
	lw	a5,4(a5)
	beq	a5,zero,.L15
	mv	a0,s1
	jalr	a5
	lla	a3,.LANCHOR0
.L15:
	lw	a5,36(a3)
	lw	a5,4(a5)
	beq	a5,zero,.L16
	mv	a0,s1
	jalr	a5
	lla	a3,.LANCHOR0
.L16:
	lla	a2,.LANCHOR2
	lbu	a5,0(a2)
	andi	a5,a5,1
	beq	a5,zero,.L18
	bne	s1,zero,.L18
	lw	a5,16(a3)
	lw	a5,8(a5)
	beq	a5,zero,.L20
	li	a0,0
	jalr	a5
	lla	a2,.LANCHOR2
	lla	a3,.LANCHOR0
.L20:
	lw	a5,36(a3)
	lw	a5,8(a5)
	beq	a5,zero,.L21
	li	a0,1
	jalr	a5
	lla	a2,.LANCHOR2
.L21:
	lla	a5,.LANCHOR1
	lw	a5,12(a5)
	beq	a5,zero,.L18
	lw	a5,8(a5)
	beq	a5,zero,.L18
	jalr	a5
	lla	a2,.LANCHOR2
.L18:
	sb	s1,0(a2)
	lw	ra,8(sp)
	la a5, .LANCHOR3; sb s0, 0(a5);
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
	.size	_ZL5B4016jh, .-_ZL5B4016jh
	.section	.text._ZL6ReadGPi,"ax",@progbits
	.align	2
	.type	_ZL6ReadGPi, @function
_ZL6ReadGPi:
	lla	a3,.LANCHOR4
	add	a4,a3,a0
	lbu	a4,0(a4)
	li	a1,7
	mv	a5,a0
	la a2, .LANCHOR5; lbu a2, 0(a2);
	bleu	a4,a1,.L48
	li	a1,15
	li	a0,0
	bleu	a4,a1,.L60
	bne	a2,zero,.L52
.L54:
	li	a0,1
.L50:
	la a2, fceuindbg; lw a2, 0(a2);
	bne	a2,zero,.L55
.L61:
	add	a5,a3,a5
	addi	a4,a4,1
	sb	a4,0(a5)
	ret
.L48:
	lla	a1,.LANCHOR6
	add	a1,a1,a0
	lbu	a0,0(a1)
	sra	a0,a0,a4
	andi	a0,a0,1
	beq	a2,zero,.L50
.L52:
	li	a2,19
	sub	a2,a2,a5
	beq	a2,a4,.L54
	la a2, fceuindbg; lw a2, 0(a2);
	beq	a2,zero,.L61
.L55:
	ret
.L60:
	lla	a1,.LANCHOR6
	add	a1,a1,a5
	lbu	a0,2(a1)
	andi	a1,a4,7
	sra	a0,a0,a1
	andi	a0,a0,1
	beq	a2,zero,.L54
	j	.L52
	.size	_ZL6ReadGPi, .-_ZL6ReadGPi
	.section	.text._ZL8StrobeGPi,"ax",@progbits
	.align	2
	.type	_ZL8StrobeGPi, @function
_ZL8StrobeGPi:
	lla	a5,.LANCHOR4
	add	a5,a5,a0
	sb	zero,0(a5)
	ret
	.size	_ZL8StrobeGPi, .-_ZL8StrobeGPi
	.section	.text._ZL8UpdateGPiPvi,"ax",@progbits
	.align	2
	.type	_ZL8UpdateGPiPvi, @function
_ZL8UpdateGPiPvi:
	bne	a0,zero,.L64
	la a5, .LANCHOR0+12; lw a5, 0(a5);
	lw	a3,0(a5)
	lhu	a4,2(a5)
	lla	a5,.LANCHOR6
	sb	a3,0(a5)
	sb	a4,2(a5)
	ret
.L64:
	la a4, .LANCHOR0+32; lw a4, 0(a4);
	lw	a5,0(a4)
	lbu	a3,3(a4)
	lla	a4,.LANCHOR6
	srli	a5,a5,8
	sb	a5,1(a4)
	sb	a3,3(a4)
	ret
	.size	_ZL8UpdateGPiPvi, .-_ZL8UpdateGPiPvi
	.section	.text._Z14FCEU_GetJoyJoyv,"ax",@progbits
	.align	2
	.globl	_Z14FCEU_GetJoyJoyv
	.hidden	_Z14FCEU_GetJoyJoyv
	.type	_Z14FCEU_GetJoyJoyv, @function
_Z14FCEU_GetJoyJoyv:
	lla	a4,.LANCHOR6
	lbu	a5,0(a4)
	lbu	a2,1(a4)
	lbu	a3,2(a4)
	lbu	a0,3(a4)
	or	a5,a5,a2
	or	a5,a5,a3
	or	a0,a5,a0
	ret
	.size	_Z14FCEU_GetJoyJoyv, .-_Z14FCEU_GetJoyJoyv
	.section	.text._Z14FCEU_DrawInputPh,"ax",@progbits
	.align	2
	.globl	_Z14FCEU_DrawInputPh
	.hidden	_Z14FCEU_DrawInputPh
	.type	_Z14FCEU_DrawInputPh, @function
_Z14FCEU_DrawInputPh:
	addi	sp,sp,-12
	sw	s1,0(sp)
	lla	s1,.LANCHOR0
	lw	a5,16(s1)
	sw	s0,4(sp)
	sw	ra,8(sp)
	lw	a5,20(a5)
	mv	s0,a0
	beq	a5,zero,.L68
	lw	a2,4(s1)
	mv	a1,a0
	li	a0,0
	jalr	a5
.L68:
	lw	a5,36(s1)
	lw	a5,20(a5)
	beq	a5,zero,.L69
	lw	a2,24(s1)
	mv	a1,s0
	li	a0,1
	jalr	a5
.L69:
	lla	a4,.LANCHOR1
	lw	a5,12(a4)
	beq	a5,zero,.L67
	lw	a5,20(a5)
	beq	a5,zero,.L67
	mv	a0,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	lw	a1,0(a4)
	addi	sp,sp,12
	jr	a5
.L67:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
	.size	_Z14FCEU_DrawInputPh, .-_Z14FCEU_DrawInputPh
	.section	.text._Z16FCEU_UpdateInputv,"ax",@progbits
	.align	2
	.globl	_Z16FCEU_UpdateInputv
	.hidden	_Z16FCEU_UpdateInputv
	.type	_Z16FCEU_UpdateInputv, @function
_Z16FCEU_UpdateInputv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR0
	lw	a5,16(s0)
	sw	ra,8(sp)
	lw	a5,12(a5)
	beq	a5,zero,.L85
	lw	a2,4(s0)
	lw	a1,12(s0)
	li	a0,0
	jalr	a5
.L85:
	lw	a5,36(s0)
	lw	a5,12(a5)
	beq	a5,zero,.L86
	lw	a2,24(s0)
	lw	a1,32(s0)
	li	a0,1
	jalr	a5
.L86:
	lla	a5,.LANCHOR1
	lw	a4,12(a5)
	lw	a4,12(a4)
	beq	a4,zero,.L84
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	a1,0(a5)
	lw	a0,8(a5)
	addi	sp,sp,12
	jr	a4
.L84:
	lw	ra,8(sp)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
	.size	_Z16FCEU_UpdateInputv, .-_Z16FCEU_UpdateInputv
	.section	.text._Z17InputScanlineHookPhS_ji,"ax",@progbits
	.align	2
	.globl	_Z17InputScanlineHookPhS_ji
	.hidden	_Z17InputScanlineHookPhS_ji
	.type	_Z17InputScanlineHookPhS_ji, @function
_Z17InputScanlineHookPhS_ji:
	lla	t1,.LANCHOR0
	lw	a5,16(t1)
	addi	sp,sp,-20
	sw	s0,12(sp)
	lw	t2,16(a5)
	sw	s1,8(sp)
	sw	ra,16(sp)
	mv	s0,a0
	mv	s1,a1
	mv	a5,a2
	mv	a4,a3
	beq	t2,zero,.L96
	sw	a3,4(sp)
	sw	a2,0(sp)
	mv	a3,a2
	mv	a2,a1
	mv	a1,a0
	li	a0,0
	jalr	t2
	lw	a4,4(sp)
	lw	a5,0(sp)
	lla	t1,.LANCHOR0
.L96:
	lw	a3,36(t1)
	lw	t1,16(a3)
	beq	t1,zero,.L97
	mv	a3,a5
	mv	a2,s1
	mv	a1,s0
	li	a0,1
	sw	a4,4(sp)
	sw	a5,0(sp)
	jalr	t1
	lw	a4,4(sp)
	lw	a5,0(sp)
.L97:
	la a3, .LANCHOR1+12; lw a3, 0(a3);
	lw	t1,16(a3)
	beq	t1,zero,.L95
	mv	a0,s0
	lw	s0,12(sp)
	lw	ra,16(sp)
	mv	a1,s1
	lw	s1,8(sp)
	mv	a3,a4
	mv	a2,a5
	addi	sp,sp,20
	jr	t1
.L95:
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
	.size	_Z17InputScanlineHookPhS_ji, .-_Z17InputScanlineHookPhS_ji
	.section	.text._Z14FCEUI_SetInputi3ESIPvi,"ax",@progbits
	.align	2
	.globl	_Z14FCEUI_SetInputi3ESIPvi
	.hidden	_Z14FCEUI_SetInputi3ESIPvi
	.type	_Z14FCEUI_SetInputi3ESIPvi, @function
_Z14FCEUI_SetInputi3ESIPvi:
	slli	a5,a0,2
	add	a0,a5,a0
	slli	a5,a0,2
	lla	a0,.LANCHOR0
	add	a0,a0,a5
	sw	a3,4(a0)
	sw	a1,8(a0)
	sw	a2,12(a0)
	beq	a1,zero,.L107
	li	a5,1
	bne	a1,a5,.L106
	lla	a5,.LANCHOR7
	sw	a5,16(a0)
	ret
.L107:
	lla	a5,.LANCHOR8
	sw	a5,16(a0)
.L106:
	ret
	.size	_Z14FCEUI_SetInputi3ESIPvi, .-_Z14FCEUI_SetInputi3ESIPvi
	.section	.text._Z16FCEUI_SetInputFC5ESIFCPvi,"ax",@progbits
	.align	2
	.globl	_Z16FCEUI_SetInputFC5ESIFCPvi
	.hidden	_Z16FCEUI_SetInputFC5ESIFCPvi
	.type	_Z16FCEUI_SetInputFC5ESIFCPvi, @function
_Z16FCEUI_SetInputFC5ESIFCPvi:
	lla	a5,.LANCHOR1
	sw	a2,0(a5)
	sw	a0,4(a5)
	sw	a1,8(a5)
	bne	a0,zero,.L109
	lla	a4,.LANCHOR9
	sw	a4,12(a5)
.L109:
	ret
	.size	_Z16FCEUI_SetInputFC5ESIFCPvi, .-_Z16FCEUI_SetInputFC5ESIFCPvi
	.section	.text._Z15InitializeInputv,"ax",@progbits
	.align	2
	.globl	_Z15InitializeInputv
	.hidden	_Z15InitializeInputv
	.type	_Z15InitializeInputv, @function
_Z15InitializeInputv:
	addi	sp,sp,-12
	li	a2,2
	li	a1,0
	lla	a0,.LANCHOR4
	sw	ra,8(sp)
	sw	s0,4(sp)
	call	memset
	li	a2,4
	li	a1,0
	lla	a0,.LANCHOR6
	call	memset
	li	s0,16384
	lla	a2,_ZL6JPReadj
	addi	a1,s0,23
	addi	a0,s0,22
	la a5, .LANCHOR2; sb zero, 0(a5);
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,22
	lla	a2,_ZL5B4016jh
	mv	a0,a1
	call	_Z15SetWriteHandleriiPFvjhE
	lla	a5,.LANCHOR0
	lw	a4,8(a5)
	beq	a4,zero,.L112
	li	a3,1
	bne	a4,a3,.L113
	lla	a4,.LANCHOR7
	sw	a4,16(a5)
.L113:
	lw	a4,28(a5)
	beq	a4,zero,.L114
.L118:
	li	a3,1
	bne	a4,a3,.L115
	lla	a4,.LANCHOR7
	sw	a4,36(a5)
.L115:
	lla	a5,.LANCHOR1
	lw	a4,4(a5)
	bne	a4,zero,.L111
	lla	a4,.LANCHOR9
	sw	a4,12(a5)
.L111:
	lw	ra,8(sp)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
.L112:
	lla	a4,.LANCHOR8
	sw	a4,16(a5)
	lw	a4,28(a5)
	bne	a4,zero,.L118
.L114:
	lla	a4,.LANCHOR8
	sw	a4,36(a5)
	j	.L115
	.size	_Z15InitializeInputv, .-_Z15InitializeInputv
	.section	.text._Z23FCEUI_SetInputFourscoreb,"ax",@progbits
	.align	2
	.globl	_Z23FCEUI_SetInputFourscoreb
	.hidden	_Z23FCEUI_SetInputFourscoreb
	.type	_Z23FCEUI_SetInputFourscoreb, @function
_Z23FCEUI_SetInputFourscoreb:
	la a5, .LANCHOR5; sb a0, 0(a5);
	ret
	.size	_Z23FCEUI_SetInputFourscoreb, .-_Z23FCEUI_SetInputFourscoreb
	.section	.text.startup._GLOBAL__sub_I_joy,"ax",@progbits
	.align	2
	.type	_GLOBAL__sub_I_joy, @function
_GLOBAL__sub_I_joy:
	lla	a5,.LANCHOR0
	li	a4,1
	sw	zero,0(a5)
	sw	a4,20(a5)
	ret
	.size	_GLOBAL__sub_I_joy, .-_GLOBAL__sub_I_joy
	.section	.init_array,"aw"
	.align	2
	.word	_GLOBAL__sub_I_joy
	.hidden	portFC
	.globl	portFC
	.hidden	joyports
	.globl	joyports
	.hidden	RawReg4016
	.globl	RawReg4016
	.hidden	snesjoy
	.globl	snesjoy
	.hidden	joy
	.globl	joy
	.section	.bss._ZL10DummyJPort,"aw",@nobits
	.align	2
	.set	.LANCHOR8,. + 0
	.type	_ZL10DummyJPort, @object
	.size	_ZL10DummyJPort, 24
_ZL10DummyJPort:
	.zero	24
	.section	.bss._ZL11DummyPortFC,"aw",@nobits
	.align	2
	.set	.LANCHOR9,. + 0
	.type	_ZL11DummyPortFC, @object
	.size	_ZL11DummyPortFC, 24
_ZL11DummyPortFC:
	.zero	24
	.section	.bss.joyports,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	joyports, @object
	.size	joyports, 40
joyports:
	.zero	40
	.section	.bss.portFC,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	portFC, @object
	.size	portFC, 16
portFC:
	.zero	16
	.section	.data._ZL3GPC,"aw"
	.align	2
	.set	.LANCHOR7,. + 0
	.type	_ZL3GPC, @object
	.size	_ZL3GPC, 24
_ZL3GPC:
	.word	_ZL6ReadGPi
	.word	0
	.word	_ZL8StrobeGPi
	.word	_ZL8UpdateGPiPvi
	.word	0
	.word	0
	.section	.sbss.RawReg4016,"aw",@nobits
	.set	.LANCHOR3,. + 0
	.type	RawReg4016, @object
	.size	RawReg4016, 1
RawReg4016:
	.zero	1
	.section	.sbss._ZL10FSAttached,"aw",@nobits
	.set	.LANCHOR5,. + 0
	.type	_ZL10FSAttached, @object
	.size	_ZL10FSAttached, 1
_ZL10FSAttached:
	.zero	1
	.section	.sbss._ZL10LastStrobe,"aw",@nobits
	.set	.LANCHOR2,. + 0
	.type	_ZL10LastStrobe, @object
	.size	_ZL10LastStrobe, 1
_ZL10LastStrobe:
	.zero	1
	.section	.sbss._ZL11joy_readbit,"aw",@nobits
	.align	2
	.set	.LANCHOR4,. + 0
	.type	_ZL11joy_readbit, @object
	.size	_ZL11joy_readbit, 2
_ZL11joy_readbit:
	.zero	2
	.section	.sbss.joy,"aw",@nobits
	.align	2
	.set	.LANCHOR6,. + 0
	.type	joy, @object
	.size	joy, 4
joy:
	.zero	4
	.section	.sbss.snesjoy,"aw",@nobits
	.align	2
	.type	snesjoy, @object
	.size	snesjoy, 8
snesjoy:
	.zero	8
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
