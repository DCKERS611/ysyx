#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"input.cpp"
	.option nopic
	.text
	.section	.text._Z18InputUserActiveFixv,"ax",@progbits
	.align	2
	.globl	_Z18InputUserActiveFixv
	.hidden	_Z18InputUserActiveFixv
	.type	_Z18InputUserActiveFixv, @function
_Z18InputUserActiveFixv:
	lla	a5,.LANCHOR1
	lw	a2,0(a5)
	lw	a3,4(a5)
	lw	a4,8(a5)
	lla	a5,.LANCHOR0
	sw	a2,0(a5)
	sw	a3,4(a5)
	sw	a4,8(a5)
	ret
	.size	_Z18InputUserActiveFixv, .-_Z18InputUserActiveFixv
	.section	.text._Z12ParseGIInputP6FCEUGI,"ax",@progbits
	.align	2
	.globl	_Z12ParseGIInputP6FCEUGI
	.hidden	_Z12ParseGIInputP6FCEUGI
	.type	_Z12ParseGIInputP6FCEUGI, @function
_Z12ParseGIInputP6FCEUGI:
	lw	a4,8(a0)
	lw	a3,16(a0)
	lla	a5,.LANCHOR1
	la a2, gametype; sw a4, 0(a2);
	lw	a1,0(a5)
	lw	a2,4(a5)
	lw	a4,8(a5)
	blt	a3,zero,.L4
	mv	a1,a3
.L4:
	lw	a3,20(a0)
	lla	a5,.LANCHOR0
	sw	a1,0(a5)
	blt	a3,zero,.L5
	mv	a2,a3
.L5:
	lw	a3,24(a0)
	sw	a2,4(a5)
	blt	a3,zero,.L6
	mv	a4,a3
.L6:
	sw	a4,8(a5)
	ret
	.size	_Z12ParseGIInputP6FCEUGI, .-_Z12ParseGIInputP6FCEUGI
	.section	.text._Z11GetKeyboardv,"ax",@progbits
	.align	2
	.globl	_Z11GetKeyboardv
	.hidden	_Z11GetKeyboardv
	.type	_Z11GetKeyboardv, @function
_Z11GetKeyboardv:
	lla	a0,.LANCHOR2
	ret
	.size	_Z11GetKeyboardv, .-_Z11GetKeyboardv
	.section	.text._Z12GetMouseDataRA3_j,"ax",@progbits
	.align	2
	.globl	_Z12GetMouseDataRA3_j
	.hidden	_Z12GetMouseDataRA3_j
	.type	_Z12GetMouseDataRA3_j, @function
_Z12GetMouseDataRA3_j:
	ret
	.size	_Z12GetMouseDataRA3_j, .-_Z12GetMouseDataRA3_j
	.section	.rodata._Z17FCEUD_UpdateInputv.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"AM Panic: "
	.align	2
.LC1:
	.string	"Assertion `ev.keycode < 256' failed"
	.align	2
.LC2:
	.string	" @ /home/ysyx/ysyx-workbench/fceux-am/src/drivers/sdl/input.cpp:109  \n"
	.section	.text._Z17FCEUD_UpdateInputv,"ax",@progbits
	.align	2
	.globl	_Z17FCEUD_UpdateInputv
	.hidden	_Z17FCEUD_UpdateInputv
	.type	_Z17FCEUD_UpdateInputv, @function
_Z17FCEUD_UpdateInputv:
	addi	sp,sp,-28
	sw	s0,20(sp)
	sw	ra,24(sp)
	sw	s1,16(sp)
	lla	s0,.LANCHOR2
.L16:
	addi	a1,sp,8
	li	a0,8
	call	ioe_read
	lw	a5,12(sp)
	li	a3,255
	lbu	a4,8(sp)
	bgt	a5,a3,.L51
	add	a3,s0,a5
	sb	a4,0(a3)
	beq	a4,zero,.L14
	li	a4,1
	beq	a5,a4,.L15
	li	a4,29
	beq	a5,a4,.L15
.L14:
	bne	a5,zero,.L16
	lla	a4,.LANCHOR3
	lw	a5,0(a4)
	lla	a3,.LANCHOR0
	lw	a2,0(a3)
	andi	a5,a5,-2
	sw	a5,0(a4)
	li	a5,1
	beq	a2,a5,.L17
	lw	a4,4(a3)
	beq	a4,a5,.L17
	lw	ra,24(sp)
	lw	s0,20(sp)
	lw	s1,16(sp)
	addi	sp,sp,28
	jr	ra
.L17:
	lla	a5,.LANCHOR4
	lw	a4,0(a5)
	lla	a3,.LANCHOR5
	sw	a3,0(sp)
	sw	a4,4(sp)
	xori	a4,a4,1
	sw	a4,0(a5)
	li	t0,0
	li	t1,0
	li	s1,1
	li	t2,8
.L19:
	lw	a2,0(sp)
	li	a0,0
.L36:
	lw	a1,16(a2)
	mv	a4,a2
	li	a5,0
	ble	a1,zero,.L24
.L22:
	add	a3,a2,a5
	lbu	a3,0(a3)
	bne	a3,zero,.L20
	lhu	a3,8(a4)
	add	a3,s0,a3
	lbu	a3,0(a3)
	bne	a3,zero,.L21
.L20:
	addi	a5,a5,1
	addi	a4,a4,2
	bne	a5,a1,.L22
.L24:
	addi	a0,a0,1
	addi	a2,a2,20
	bne	a0,t2,.L36
.L23:
	lw	a5,4(sp)
	bne	a5,s1,.L52
.L25:
	lw	a5,0(sp)
	addi	t0,t0,8
	addi	a5,a5,200
	sw	a5,0(sp)
	li	a5,32
	bne	t0,a5,.L19
	lw	ra,24(sp)
	lw	s0,20(sp)
	la a5, .LANCHOR6; sw t1, 0(a5);
	lw	s1,16(sp)
	addi	sp,sp,28
	jr	ra
.L21:
	sll	a5,s1,a0
	sll	a5,a5,t0
	addi	a0,a0,1
	or	t1,t1,a5
	addi	a2,a2,20
	bne	a0,t2,.L36
	j	.L23
.L52:
	lw	a4,0(sp)
	lw	a1,176(a4)
	ble	a1,zero,.L26
	slli	a2,t0,1
	add	a2,a2,t0
	slli	a2,a2,3
	lla	a5,.LANCHOR5
	add	a2,a2,t0
	add	a2,a2,a5
	li	a5,0
.L28:
	add	a3,a2,a5
	lbu	a3,160(a3)
	bne	a3,zero,.L30
	lhu	a3,168(a4)
	add	a3,s0,a3
	lbu	a3,0(a3)
	bne	a3,zero,.L53
.L30:
	addi	a5,a5,1
	addi	a4,a4,2
	bne	a1,a5,.L28
.L26:
	lw	a4,0(sp)
	lw	a1,196(a4)
	ble	a1,zero,.L25
	slli	a2,t0,1
	add	a2,a2,t0
	slli	a2,a2,3
	lla	a5,.LANCHOR5
	add	a2,a2,t0
	add	a2,a2,a5
	li	a5,0
	j	.L32
.L34:
	addi	a5,a5,1
	addi	a4,a4,2
	beq	a1,a5,.L25
.L32:
	add	a3,a2,a5
	lbu	a3,180(a3)
	bne	a3,zero,.L34
	lhu	a3,188(a4)
	add	a3,s0,a3
	lbu	a3,0(a3)
	beq	a3,zero,.L34
	li	a5,2
	sll	a5,a5,t0
	or	t1,t1,a5
	j	.L25
.L53:
	sll	a5,s1,t0
	or	t1,t1,a5
	j	.L26
.L15:
	li	a0,0
	call	halt
.L51:
	lla	s0,.LC0
	li	a0,65
.L11:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L11
	lla	s0,.LC1
	li	a0,65
.L12:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L12
	lla	s0,.LC2
	li	a0,32
.L13:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L13
	li	a0,1
	call	halt
	.size	_Z17FCEUD_UpdateInputv, .-_Z17FCEUD_UpdateInputv
	.section	.text._Z18InitInputInterfacev,"ax",@progbits
	.align	2
	.globl	_Z18InitInputInterfacev
	.hidden	_Z18InitInputInterfacev
	.type	_Z18InitInputInterfacev, @function
_Z18InitInputInterfacev:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR0
	lw	a1,0(s0)
	sw	ra,8(sp)
	li	a5,1
	lla	a2,.LANCHOR6
	beq	a1,a5,.L55
	li	a2,0
.L55:
	li	a3,0
	li	a0,0
	call	_Z14FCEUI_SetInputi3ESIPvi
	lw	a1,4(s0)
	li	a5,1
	li	a2,0
	bne	a1,a5,.L56
	lla	a2,.LANCHOR6
.L56:
	li	a3,0
	li	a0,1
	call	_Z14FCEUI_SetInputi3ESIPvi
	lw	a0,8(s0)
	li	a2,0
	li	a1,0
	call	_Z16FCEUI_SetInputFC5ESIFCPvi
	lw	s0,4(sp)
	lw	ra,8(sp)
	la a0, eoptions; lw a0, 0(a0);
	srli	a0,a0,5
	andi	a0,a0,1
	addi	sp,sp,12
	tail	_Z23FCEUI_SetInputFourscoreb
	.size	_Z18InitInputInterfacev, .-_Z18InitInputInterfacev
	.section	.text._Z11UpdateInputv,"ax",@progbits
	.align	2
	.globl	_Z11UpdateInputv
	.hidden	_Z11UpdateInputv
	.type	_Z11UpdateInputv, @function
_Z11UpdateInputv:
	lla	a5,.LANCHOR1
	li	a4,1
	sw	a4,0(a5)
	sw	a4,4(a5)
	lla	a2,.LANCHOR7+40
	la a5, .LANCHOR1+8; sw zero, 0(a5);
	lla	a0,.LANCHOR5
	lla	t1,.LANCHOR7+160
	li	a3,49
	li	a1,1
.L62:
	addi	a4,a2,-40
	mv	a5,a0
	j	.L65
.L63:
	lw	a3,0(a4)
.L65:
	sh	a3,8(a5)
	sb	zero,0(a5)
	sb	zero,4(a5)
	sw	a1,16(a5)
	addi	a4,a4,4
	addi	a5,a5,20
	bne	a4,a2,.L63
	addi	a0,a0,200
	beq	a2,t1,.L61
	lw	a3,0(a2)
	addi	a2,a2,40
	j	.L62
.L61:
	ret
	.size	_Z11UpdateInputv, .-_Z11UpdateInputv
	.hidden	DefaultGamePad
	.globl	DefaultGamePad
	.hidden	DefaultGamePadDevice
	.globl	DefaultGamePadDevice
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC3:
	.string	"Keyboard"
	.align	2
.LC4:
	.string	"None"
	.hidden	GamePadNames
	.globl	GamePadNames
	.align	2
.LC5:
	.string	"A"
	.align	2
.LC6:
	.string	"B"
	.align	2
.LC7:
	.string	"Select"
	.align	2
.LC8:
	.string	"Start"
	.align	2
.LC9:
	.string	"Up"
	.align	2
.LC10:
	.string	"Down"
	.align	2
.LC11:
	.string	"Left"
	.align	2
.LC12:
	.string	"Right"
	.align	2
.LC13:
	.string	"TurboA"
	.align	2
.LC14:
	.string	"TurboB"
	.hidden	GamePadConfig
	.globl	GamePadConfig
	.hidden	NoWaiting
	.globl	NoWaiting
	.section	.bss._ZL10g_keyState,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL10g_keyState, @object
	.size	_ZL10g_keyState, 256
_ZL10g_keyState:
	.zero	256
	.section	.bss._ZL12CurInputType,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL12CurInputType, @object
	.size	_ZL12CurInputType, 12
_ZL12CurInputType:
	.zero	12
	.section	.bss._ZL12UsrInputType,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	_ZL12UsrInputType, @object
	.size	_ZL12UsrInputType, 12
_ZL12UsrInputType:
	.zero	12
	.section	.data.DefaultGamePadDevice,"aw"
	.align	2
	.type	DefaultGamePadDevice, @object
	.size	DefaultGamePadDevice, 16
DefaultGamePadDevice:
	.word	.LC3
	.word	.LC4
	.word	.LC4
	.word	.LC4
	.section	.data.GamePadConfig,"aw"
	.align	2
	.set	.LANCHOR5,. + 0
	.type	GamePadConfig, @object
	.size	GamePadConfig, 800
GamePadConfig:
	.string	""
	.string	""
	.zero	2
	.string	""
	.string	""
	.zero	2
	.half	49
	.zero	6
	.word	1
	.string	""
	.string	""
	.zero	2
	.string	""
	.string	""
	.zero	2
	.half	50
	.zero	6
	.word	1
	.string	""
	.string	""
	.zero	2
	.string	""
	.string	""
	.zero	2
	.half	35
	.zero	6
	.word	1
	.string	""
	.string	""
	.zero	2
	.string	""
	.string	""
	.zero	2
	.half	36
	.zero	6
	.word	1
	.string	""
	.string	""
	.zero	2
	.string	""
	.string	""
	.zero	2
	.half	30
	.zero	6
	.word	1
	.string	""
	.string	""
	.zero	2
	.string	""
	.string	""
	.zero	2
	.half	44
	.zero	6
	.word	1
	.string	""
	.string	""
	.zero	2
	.string	""
	.string	""
	.zero	2
	.half	43
	.zero	6
	.word	1
	.string	""
	.string	""
	.zero	2
	.string	""
	.string	""
	.zero	2
	.half	45
	.zero	6
	.word	1
	.string	""
	.string	""
	.zero	2
	.string	""
	.string	""
	.zero	2
	.half	0
	.zero	6
	.word	0
	.string	""
	.string	""
	.zero	2
	.string	""
	.string	""
	.zero	2
	.half	0
	.zero	6
	.word	0
	.string	""
	.string	""
	.zero	2
	.string	""
	.string	""
	.zero	2
	.half	0
	.zero	6
	.word	0
	.string	""
	.string	""
	.zero	2
	.string	""
	.string	""
	.zero	2
	.half	0
	.zero	6
	.word	0
	.string	""
	.string	""
	.zero	2
	.string	""
	.string	""
	.zero	2
	.half	0
	.zero	6
	.word	0
	.string	""
	.string	""
	.zero	2
	.string	""
	.string	""
	.zero	2
	.half	0
	.zero	6
	.word	0
	.zero	120
	.string	""
	.string	""
	.zero	2
	.string	""
	.string	""
	.zero	2
	.half	0
	.zero	6
	.word	0
	.string	""
	.string	""
	.zero	2
	.string	""
	.string	""
	.zero	2
	.half	0
	.zero	6
	.word	0
	.string	""
	.string	""
	.zero	2
	.string	""
	.string	""
	.zero	2
	.half	0
	.zero	6
	.word	0
	.string	""
	.string	""
	.zero	2
	.string	""
	.string	""
	.zero	2
	.half	0
	.zero	6
	.word	0
	.zero	120
	.string	""
	.string	""
	.zero	2
	.string	""
	.string	""
	.zero	2
	.half	0
	.zero	6
	.word	0
	.string	""
	.string	""
	.zero	2
	.string	""
	.string	""
	.zero	2
	.half	0
	.zero	6
	.word	0
	.string	""
	.string	""
	.zero	2
	.string	""
	.string	""
	.zero	2
	.half	0
	.zero	6
	.word	0
	.string	""
	.string	""
	.zero	2
	.string	""
	.string	""
	.zero	2
	.half	0
	.zero	6
	.word	0
	.zero	120
	.section	.data.GamePadNames,"aw"
	.align	2
	.type	GamePadNames, @object
	.size	GamePadNames, 40
GamePadNames:
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
	.section	.rodata.DefaultGamePad,"a"
	.align	2
	.set	.LANCHOR7,. + 0
	.type	DefaultGamePad, @object
	.size	DefaultGamePad, 160
DefaultGamePad:
	.word	49
	.word	50
	.word	35
	.word	36
	.word	30
	.word	44
	.word	43
	.word	45
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.section	.sbss._ZL8JSreturn,"aw",@nobits
	.align	2
	.set	.LANCHOR6,. + 0
	.type	_ZL8JSreturn, @object
	.size	_ZL8JSreturn, 4
_ZL8JSreturn:
	.zero	4
	.section	.sbss._ZZL13UpdateGamepadvE5rapid,"aw",@nobits
	.align	2
	.set	.LANCHOR4,. + 0
	.type	_ZZL13UpdateGamepadvE5rapid, @object
	.size	_ZZL13UpdateGamepadvE5rapid, 4
_ZZL13UpdateGamepadvE5rapid:
	.zero	4
	.section	.sdata.NoWaiting,"aw"
	.align	2
	.set	.LANCHOR3,. + 0
	.type	NoWaiting, @object
	.size	NoWaiting, 4
NoWaiting:
	.word	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
