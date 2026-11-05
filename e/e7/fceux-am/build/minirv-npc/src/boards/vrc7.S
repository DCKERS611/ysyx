#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"vrc7.cpp"
	.option nopic
	.text
	.section	.text._Z12UpdateOPLNEOPii,"ax",@progbits
	.align	2
	.globl	_Z12UpdateOPLNEOPii
	.hidden	_Z12UpdateOPLNEOPii
	.type	_Z12UpdateOPLNEOPii, @function
_Z12UpdateOPLNEOPii:
	ret
	.size	_Z12UpdateOPLNEOPii, .-_Z12UpdateOPLNEOPii
	.section	.text._Z9UpdateOPLi,"ax",@progbits
	.align	2
	.globl	_Z9UpdateOPLi
	.hidden	_Z9UpdateOPLi
	.type	_Z9UpdateOPLi, @function
_Z9UpdateOPLi:
	ret
	.size	_Z9UpdateOPLi, .-_Z9UpdateOPLi
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-12
	li	a2,0
	li	a1,24576
	li	a0,16
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	call	_Z8setprg8rijj
	lla	a5,.LANCHOR0
	lbu	a1,0(a5)
	li	a0,32768
	lla	s1,.LANCHOR1
	call	_Z7setprg8jj
	lla	a5,.LANCHOR0
	lbu	a1,1(a5)
	li	a0,40960
	li	s0,0
	call	_Z7setprg8jj
	lla	a5,.LANCHOR0
	lbu	a1,2(a5)
	li	a0,49152
	call	_Z7setprg8jj
	li	a1,-1
	li	a0,57344
	call	_Z7setprg8jj
.L5:
	lbu	a1,0(s1)
	mv	a0,s0
	addi	s0,s0,1024
	call	_Z7setchr1jj
	li	a5,8192
	addi	s1,s1,1
	bne	s0,a5,.L5
	la a5, .LANCHOR2; lbu a5, 0(a5);
	andi	a5,a5,3
	li	a4,2
	li	a0,2
	beq	a5,a4,.L11
	li	a4,3
	li	a0,3
	beq	a5,a4,.L11
	li	a4,1
	li	a0,1
	beq	a5,a4,.L12
.L11:
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	tail	_Z9setmirrori
.L12:
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	li	a0,0
	addi	sp,sp,12
	tail	_Z9setmirrori
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	tail	_ZL4Syncv
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL9VRC7Closev,"ax",@progbits
	.align	2
	.type	_ZL9VRC7Closev, @function
_ZL9VRC7Closev:
	la a0, .LANCHOR3; lw a0, 0(a0);
	beq	a0,zero,.L20
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_Z10FCEU_gfreePv
	lw	ra,8(sp)
	la a5, .LANCHOR3; sw zero, 0(a5);
	addi	sp,sp,12
	jr	ra
.L20:
	la a5, .LANCHOR3; sw zero, 0(a5);
	ret
	.size	_ZL9VRC7Closev, .-_ZL9VRC7Closev
	.section	.text._ZL9VRC7Powerv,"ax",@progbits
	.align	2
	.type	_ZL9VRC7Powerv, @function
_ZL9VRC7Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	call	_ZL4Syncv
	li	a1,32768
	lla	a2,_Z6CartBWjh
	addi	a1,a1,-1
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lla	a2,_ZL9VRC7Writejh
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	lw	s0,4(sp)
	lw	ra,8(sp)
	la a0, .LANCHOR4; lw a0, 0(a0);
	la a2, .LANCHOR3; lw a2, 0(a2);
	li	a1,24576
	srli	a0,a0,10
	addi	sp,sp,12
	tail	_Z16FCEU_CheatAddRAMijPh
	.size	_ZL9VRC7Powerv, .-_ZL9VRC7Powerv
	.section	.text._ZL9VRC7SKillv,"ax",@progbits
	.align	2
	.type	_ZL9VRC7SKillv, @function
_ZL9VRC7SKillv:
	la a0, .LANCHOR5; lw a0, 0(a0);
	beq	a0,zero,.L31
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	OPLL_delete
	lw	ra,8(sp)
	la a5, .LANCHOR5; sw zero, 0(a5);
	addi	sp,sp,12
	jr	ra
.L31:
	la a5, .LANCHOR5; sw zero, 0(a5);
	ret
	.size	_ZL9VRC7SKillv, .-_ZL9VRC7SKillv
	.section	.text._ZL6VRC7SCv,"ax",@progbits
	.align	2
	.type	_ZL6VRC7SCv, @function
_ZL6VRC7SCv:
	la a0, .LANCHOR5; lw a0, 0(a0);
	beq	a0,zero,.L34
	la a1, FSettings+60; lw a1, 0(a1);
	tail	OPLL_set_rate
.L34:
	ret
	.size	_ZL6VRC7SCv, .-_ZL6VRC7SCv
	.section	.text._ZL11VRC7IRQHooki,"ax",@progbits
	.align	2
	.type	_ZL11VRC7IRQHooki, @function
_ZL11VRC7IRQHooki:
	la a5, .LANCHOR6; lbu a5, 0(a5);
	beq	a5,zero,.L48
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR7
	lw	a4,0(s0)
	slli	a5,a0,1
	add	a5,a5,a0
	add	a5,a5,a4
	sw	s1,0(sp)
	sw	ra,8(sp)
	sw	a5,0(s0)
	lla	s1,.LANCHOR8
.L39:
	lw	a4,0(s1)
	li	a3,0
	li	a2,340
	li	a1,256
.L40:
	ble	a5,a2,.L51
	addi	a4,a4,1
	addi	a5,a5,-341
	li	a3,1
	bne	a4,a1,.L40
	la a4, .LANCHOR9; lbu a4, 0(a4);
	li	a0,1
	sw	a5,0(s0)
	sw	a4,0(s1)
	call	_Z14X6502_IRQBegini
	lw	a5,0(s0)
	j	.L39
.L48:
	ret
.L51:
	beq	a3,zero,.L36
	sw	a4,0(s1)
	sw	a5,0(s0)
.L36:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
	.size	_ZL11VRC7IRQHooki, .-_ZL11VRC7IRQHooki
	.section	.text._ZL9VRC7Writejh,"ax",@progbits
	.align	2
	.type	_ZL9VRC7Writejh, @function
_ZL9VRC7Writejh:
	slli	a5,a0,1
	andi	a5,a5,16
	or	a0,a5,a0
	li	a4,-40960
	add	a3,a0,a4
	li	a5,16384
	bltu	a3,a5,.L77
	li	a5,36864
	addi	a4,a5,48
	beq	a0,a4,.L78
	li	a2,61440
	addi	a3,a2,16
	and	a0,a0,a3
	li	a4,57344
	beq	a0,a4,.L56
	bgtu	a0,a4,.L57
	beq	a0,a5,.L58
	bleu	a0,a5,.L79
	addi	a5,a5,16
	bne	a0,a5,.L80
	la a5, .LANCHOR10; sb a1, 0(a5);
	ret
.L79:
	li	a5,32768
	beq	a0,a5,.L60
	addi	a5,a5,16
	bne	a0,a5,.L81
	la a5, .LANCHOR0+1; sb a1, 0(a5);
	tail	_ZL4Syncv
.L57:
	beq	a0,a2,.L63
	bne	a0,a3,.L82
	la a5, .LANCHOR11; lbu a5, 0(a5);
	li	a0,1
	la a4, .LANCHOR6; sb a5, 0(a4);
	tail	_Z12X6502_IRQEndi
.L82:
	addi	a4,a4,16
	bne	a0,a4,.L83
	li	a0,1
	la a5, .LANCHOR9; sb a1, 0(a5);
	tail	_Z12X6502_IRQEndi
.L77:
	li	a5,61440
	addi	a5,a5,16
	and	a5,a0,a5
	srli	a3,a5,4
	add	a5,a5,a4
	srli	a5,a5,11
	andi	a4,a3,1
	or	a5,a4,a5
	lla	a4,.LANCHOR1
	add	a5,a4,a5
	sb	a1,0(a5)
	tail	_ZL4Syncv
.L60:
	la a5, .LANCHOR0; sb a1, 0(a5);
	tail	_ZL4Syncv
.L63:
	andi	a5,a1,2
	andi	a1,a1,1
	la a4, .LANCHOR6; sb a5, 0(a4);
	la a4, .LANCHOR11; sb a1, 0(a4);
	beq	a5,zero,.L66
	la a5, .LANCHOR9; lbu a5, 0(a5);
	la a4, .LANCHOR8; sw a5, 0(a4);
.L66:
	li	a0,1
	la a5, .LANCHOR7; sw zero, 0(a5);
	tail	_Z12X6502_IRQEndi
.L58:
	la a5, .LANCHOR0+2; sb a1, 0(a5);
	tail	_ZL4Syncv
.L80:
	ret
.L56:
	andi	a1,a1,3
	la a5, .LANCHOR2; sb a1, 0(a5);
	tail	_ZL4Syncv
.L78:
	la a5, FSettings+60; lw a5, 0(a5);
	bne	a5,zero,.L84
	ret
.L84:
	addi	sp,sp,-12
	mv	a2,a1
	la a0, .LANCHOR5; lw a0, 0(a0);
	la a1, .LANCHOR10; lbu a1, 0(a1);
	sw	ra,8(sp)
	call	OPLL_writeReg
	lw	ra,8(sp)
	lla	a5,GameExpSound
	lla	a4,_Z9UpdateOPLi
	sw	a4,0(a5)
	lla	a4,_Z12UpdateOPLNEOPii
	sw	a4,4(a5)
	addi	sp,sp,12
	jr	ra
.L81:
	ret
.L83:
	ret
	.size	_ZL9VRC7Writejh, .-_ZL9VRC7Writejh
	.section	.rodata._Z13Mapper85_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.section	.text._Z13Mapper85_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper85_InitP8CartInfo
	.hidden	_Z13Mapper85_InitP8CartInfo
	.type	_Z13Mapper85_InitP8CartInfo, @function
_Z13Mapper85_InitP8CartInfo:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	lla	a4,_ZL9VRC7Powerv
	sw	a4,0(a0)
	lla	a4,_ZL9VRC7Closev
	sw	a4,8(a0)
	lla	a4,_ZL11VRC7IRQHooki
	lla	s0,.LANCHOR4
	la a3, MapIRQHook; sw a4, 0(a3);
	sw	a0,0(sp)
	li	a4,8192
	li	a0,8192
	sw	a4,0(s0)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s0)
	mv	a1,a0
	lla	s1,.LANCHOR3
	li	a3,1
	li	a0,16
	sw	a1,0(s1)
	call	_Z19SetupCartPRGMappingiPhji
	lw	a1,0(s0)
	lw	a0,0(s1)
	lla	a3,.LC0
	li	a2,0
	call	_Z10AddExStatePvjiPKc
	lw	a5,0(sp)
	lw	a4,48(a5)
	beq	a4,zero,.L86
	lw	a3,0(s1)
	lw	a4,0(s0)
	sw	a3,12(a5)
	sw	a4,28(a5)
.L86:
	lla	a4,_ZL12StateRestorei
	lla	a5,GameExpSound
	la a3, GameStateRestore; sw a4, 0(a3);
	lla	a4,_ZL6VRC7SCv
	sw	a4,16(a5)
	lla	a4,_ZL9VRC7SKillv
	sw	a4,20(a5)
	la a1, FSettings+60; lw a1, 0(a1);
	bne	a1,zero,.L87
	li	a1,49152
	addi	a1,a1,-1152
.L87:
	li	a0,3579904
	addi	a0,a0,-359
	call	OPLL_new
	lla	s0,.LANCHOR5
	sw	a0,0(s0)
	call	OPLL_reset
	lw	a0,0(s0)
	call	OPLL_reset
	lw	s0,8(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR12
	addi	sp,sp,16
	tail	_Z10AddExStatePvjiPKc
	.size	_Z13Mapper85_InitP8CartInfo, .-_Z13Mapper85_InitP8CartInfo
	.section	.text._Z12NSFVRC7_Initv,"ax",@progbits
	.align	2
	.globl	_Z12NSFVRC7_Initv
	.hidden	_Z12NSFVRC7_Initv
	.type	_Z12NSFVRC7_Initv, @function
_Z12NSFVRC7_Initv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	li	s0,36864
	lla	a2,_ZL9VRC7Writejh
	addi	a1,s0,31
	addi	a0,s0,16
	sw	ra,8(sp)
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,63
	lla	a2,_ZL9VRC7Writejh
	addi	a0,s0,48
	call	_Z15SetWriteHandleriiPFvjhE
	lla	a5,GameExpSound
	lla	a4,_ZL6VRC7SCv
	sw	a4,16(a5)
	lla	a4,_ZL9VRC7SKillv
	sw	a4,20(a5)
	la a1, FSettings+60; lw a1, 0(a1);
	bne	a1,zero,.L94
	li	a1,49152
	addi	a1,a1,-1152
.L94:
	li	a0,3579904
	addi	a0,a0,-359
	call	OPLL_new
	lla	s0,.LANCHOR5
	sw	a0,0(s0)
	call	OPLL_reset
	lw	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	OPLL_reset
	.size	_Z12NSFVRC7_Initv, .-_Z12NSFVRC7_Initv
	.section	.text.startup._GLOBAL__sub_I__Z12UpdateOPLNEOPii,"ax",@progbits
	.align	2
	.type	_GLOBAL__sub_I__Z12UpdateOPLNEOPii, @function
_GLOBAL__sub_I__Z12UpdateOPLNEOPii:
	lla	a5,.LANCHOR5
	la a4, .LANCHOR12+108; sw a5, 0(a4);
	ret
	.size	_GLOBAL__sub_I__Z12UpdateOPLNEOPii, .-_GLOBAL__sub_I__Z12UpdateOPLNEOPii
	.section	.init_array,"aw"
	.align	2
	.word	_GLOBAL__sub_I__Z12UpdateOPLNEOPii
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"VRCI"
	.align	2
.LC2:
	.string	"PREG"
	.align	2
.LC3:
	.string	"CREG"
	.align	2
.LC4:
	.string	"MIRR"
	.align	2
.LC5:
	.string	"IRQA"
	.align	2
.LC6:
	.string	"IRQD"
	.align	2
.LC7:
	.string	"IRQL"
	.align	2
.LC8:
	.string	"IRQC"
	.align	2
.LC9:
	.string	"CYCC"
	.align	2
.LC10:
	.string	"VRC7"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR12,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 132
_ZL9StateRegs:
	.word	_ZL7vrc7idx
	.word	1
	.word	.LC1
	.word	_ZL4preg
	.word	3
	.word	.LC2
	.word	_ZL4creg
	.word	8
	.word	.LC3
	.word	_ZL4mirr
	.word	1
	.word	.LC4
	.word	_ZL4IRQa
	.word	1
	.word	.LC5
	.word	_ZL4IRQd
	.word	1
	.word	.LC6
	.word	_ZL8IRQLatch
	.word	1
	.word	.LC7
	.word	_ZL8IRQCount
	.word	4
	.word	.LC8
	.word	_ZL10CycleCount
	.word	4
	.word	.LC9
	.zero	4
	.word	1073743488
	.word	.LC10
	.word	0
	.zero	8
	.section	.sbss._ZL10CycleCount,"aw",@nobits
	.align	2
	.set	.LANCHOR7,. + 0
	.type	_ZL10CycleCount, @object
	.size	_ZL10CycleCount, 4
_ZL10CycleCount:
	.zero	4
	.section	.sbss._ZL4IRQa,"aw",@nobits
	.set	.LANCHOR6,. + 0
	.type	_ZL4IRQa, @object
	.size	_ZL4IRQa, 1
_ZL4IRQa:
	.zero	1
	.section	.sbss._ZL4IRQd,"aw",@nobits
	.set	.LANCHOR11,. + 0
	.type	_ZL4IRQd, @object
	.size	_ZL4IRQd, 1
_ZL4IRQd:
	.zero	1
	.section	.sbss._ZL4WRAM,"aw",@nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	_ZL4WRAM, @object
	.size	_ZL4WRAM, 4
_ZL4WRAM:
	.zero	4
	.section	.sbss._ZL4creg,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	_ZL4creg, @object
	.size	_ZL4creg, 8
_ZL4creg:
	.zero	8
	.section	.sbss._ZL4mirr,"aw",@nobits
	.set	.LANCHOR2,. + 0
	.type	_ZL4mirr, @object
	.size	_ZL4mirr, 1
_ZL4mirr:
	.zero	1
	.section	.sbss._ZL4preg,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL4preg, @object
	.size	_ZL4preg, 3
_ZL4preg:
	.zero	3
	.section	.sbss._ZL7vrc7idx,"aw",@nobits
	.set	.LANCHOR10,. + 0
	.type	_ZL7vrc7idx, @object
	.size	_ZL7vrc7idx, 1
_ZL7vrc7idx:
	.zero	1
	.section	.sbss._ZL8IRQCount,"aw",@nobits
	.align	2
	.set	.LANCHOR8,. + 0
	.type	_ZL8IRQCount, @object
	.size	_ZL8IRQCount, 4
_ZL8IRQCount:
	.zero	4
	.section	.sbss._ZL8IRQLatch,"aw",@nobits
	.set	.LANCHOR9,. + 0
	.type	_ZL8IRQLatch, @object
	.size	_ZL8IRQLatch, 1
_ZL8IRQLatch:
	.zero	1
	.section	.sbss._ZL8WRAMSIZE,"aw",@nobits
	.align	2
	.set	.LANCHOR4,. + 0
	.type	_ZL8WRAMSIZE, @object
	.size	_ZL8WRAMSIZE, 4
_ZL8WRAMSIZE:
	.zero	4
	.section	.sbss._ZL9VRC7Sound,"aw",@nobits
	.align	2
	.set	.LANCHOR5,. + 0
	.type	_ZL9VRC7Sound, @object
	.size	_ZL9VRC7Sound, 4
_ZL9VRC7Sound:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
