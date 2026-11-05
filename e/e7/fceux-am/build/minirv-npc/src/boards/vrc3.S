#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"vrc3.cpp"
	.option nopic
	.text
	.section	.text._ZL8M73Closev,"ax",@progbits
	.align	2
	.type	_ZL8M73Closev, @function
_ZL8M73Closev:
	la a0, .LANCHOR0; lw a0, 0(a0);
	beq	a0,zero,.L7
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_Z10FCEU_gfreePv
	lw	ra,8(sp)
	la a5, .LANCHOR0; sw zero, 0(a5);
	addi	sp,sp,12
	jr	ra
.L7:
	la a5, .LANCHOR0; sw zero, 0(a5);
	ret
	.size	_ZL8M73Closev, .-_ZL8M73Closev
	.section	.text._ZL8M73Writejh,"ax",@progbits
	.align	2
	.type	_ZL8M73Writejh, @function
_ZL8M73Writejh:
	li	a4,61440
	and	a0,a0,a4
	li	a3,45056
	mv	a5,a1
	beq	a0,a3,.L12
	bgtu	a0,a3,.L13
	li	a4,36864
	beq	a0,a4,.L14
	li	a4,40960
	bne	a0,a4,.L29
	lla	a2,.LANCHOR1
	lhu	a4,0(a2)
	li	a3,-4096
	addi	a3,a3,255
	and	a4,a4,a3
	li	a3,4096
	slli	a5,a1,8
	addi	a3,a3,-256
	and	a5,a5,a3
	or	a5,a4,a5
	sh	a5,0(a2)
	ret
.L13:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	li	a3,53248
	beq	a0,a3,.L18
	bne	a0,a4,.L30
	li	a2,0
	lla	s0,.LANCHOR6
	li	a1,24576
	li	a0,16
	sb	a5,0(s0)
	call	_Z8setprg8rijj
	lbu	a1,0(s0)
	li	a0,32768
	call	_Z8setprg16jj
	li	a0,49152
	li	a1,-1
	call	_Z8setprg16jj
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a0,0
	addi	sp,sp,12
	tail	_Z7setchr8j
.L29:
	li	a4,32768
	bne	a0,a4,.L31
	lla	a3,.LANCHOR1
	lhu	a4,0(a3)
	andi	a2,a1,15
	andi	a5,a4,-16
	or	a5,a5,a2
	sh	a5,0(a3)
	ret
.L30:
	li	a4,49152
	bne	a0,a4,.L11
	andi	a3,a1,1
	andi	a4,a1,4
	andi	a5,a1,2
	la a2, .LANCHOR3; sb a3, 0(a2);
	la a2, .LANCHOR2; sb a4, 0(a2);
	la a3, .LANCHOR4; sb a5, 0(a3);
	beq	a5,zero,.L21
	la a5, .LANCHOR1; lhu a5, 0(a5);
	beq	a4,zero,.L22
	lla	a3,.LANCHOR5
	lhu	a4,0(a3)
	andi	a5,a5,255
	or	a5,a4,a5
	sh	a5,0(a3)
.L21:
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a0,1
	addi	sp,sp,12
	tail	_Z12X6502_IRQEndi
.L18:
	li	a0,1
	call	_Z12X6502_IRQEndi
	la a5, .LANCHOR3; lbu a5, 0(a5);
	la a4, .LANCHOR4; sb a5, 0(a4);
.L11:
	lw	ra,8(sp)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
.L31:
	ret
.L12:
	lla	a3,.LANCHOR1
	lhu	a4,0(a3)
	slli	a2,a1,12
	slli	a5,a4,20
	srli	a5,a5,20
	or	a5,a5,a2
	sh	a5,0(a3)
	ret
.L14:
	lla	a2,.LANCHOR1
	lhu	a4,0(a2)
	slli	a5,a1,4
	andi	a3,a5,255
	andi	a5,a4,-241
	or	a5,a5,a3
	sh	a5,0(a2)
	ret
.L22:
	la a4, .LANCHOR5; sh a5, 0(a4);
	j	.L21
	.size	_ZL8M73Writejh, .-_ZL8M73Writejh
	.section	.text._ZL10M73IRQHooki,"ax",@progbits
	.align	2
	.type	_ZL10M73IRQHooki, @function
_ZL10M73IRQHooki:
	la a5, .LANCHOR4; lbu a5, 0(a5);
	beq	a5,zero,.L42
	mv	a2,a0
	ble	a0,zero,.L42
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	li	s1,0
	lla	a3,.LANCHOR5
	lla	s0,.LANCHOR2
	j	.L39
.L46:
	andi	a4,a5,0xff
	andi	a5,a5,-256
	slli	a5,a5,16
	addi	t1,a4,1
	srli	a5,a5,16
	or	a5,a5,t1
	beq	a4,a0,.L38
	sh	a5,0(a3)
.L37:
	addi	s1,s1,1
	beq	a2,s1,.L45
.L39:
	lbu	t1,0(s0)
	li	a5,65536
	addi	a4,a5,-1
	li	a0,255
	lhu	a5,0(a3)
	bne	t1,zero,.L46
	addi	a0,a5,1
	beq	a5,a4,.L38
	sh	a0,0(a3)
	addi	s1,s1,1
	bne	a2,s1,.L39
.L45:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L38:
	lla	a5,.LANCHOR1
	lhu	a5,0(a5)
	li	a0,1
	sw	a2,0(sp)
	sh	a5,0(a3)
	call	_Z14X6502_IRQBegini
	lw	a2,0(sp)
	lla	a3,.LANCHOR5
	j	.L37
.L42:
	ret
	.size	_ZL10M73IRQHooki, .-_ZL10M73IRQHooki
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	addi	sp,sp,-12
	li	a2,0
	li	a1,24576
	li	a0,16
	sw	ra,8(sp)
	call	_Z8setprg8rijj
	la a1, .LANCHOR6; lbu a1, 0(a1);
	li	a0,32768
	call	_Z8setprg16jj
	li	a0,49152
	li	a1,-1
	call	_Z8setprg16jj
	lw	ra,8(sp)
	li	a0,0
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL8M73Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M73Powerv, @function
_ZL8M73Powerv:
	addi	sp,sp,-12
	li	a2,0
	li	a1,24576
	li	a0,16
	sw	ra,8(sp)
	sw	s0,4(sp)
	la a5, .LANCHOR3; sb zero, 0(a5);
	la a5, .LANCHOR2; sb zero, 0(a5);
	la a5, .LANCHOR1; sh zero, 0(a5);
	call	_Z8setprg8rijj
	la a1, .LANCHOR6; lbu a1, 0(a1);
	li	a0,32768
	call	_Z8setprg16jj
	li	a1,-1
	li	a0,49152
	call	_Z8setprg16jj
	li	a0,0
	call	_Z7setchr8j
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	li	a1,32768
	lla	a2,_Z6CartBWjh
	addi	a1,a1,-1
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lla	a2,_ZL8M73Writejh
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	lw	s0,4(sp)
	lw	ra,8(sp)
	la a0, .LANCHOR7; lw a0, 0(a0);
	la a2, .LANCHOR0; lw a2, 0(a2);
	li	a1,24576
	srli	a0,a0,10
	addi	sp,sp,12
	tail	_Z16FCEU_CheatAddRAMijPh
	.size	_ZL8M73Powerv, .-_ZL8M73Powerv
	.section	.rodata._Z13Mapper73_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.section	.text._Z13Mapper73_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper73_InitP8CartInfo
	.hidden	_Z13Mapper73_InitP8CartInfo
	.type	_Z13Mapper73_InitP8CartInfo, @function
_Z13Mapper73_InitP8CartInfo:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	lla	a5,_ZL8M73Powerv
	sw	a5,0(a0)
	lla	a5,_ZL8M73Closev
	sw	a5,8(a0)
	lla	a5,_ZL10M73IRQHooki
	lla	s0,.LANCHOR7
	la a4, MapIRQHook; sw a5, 0(a4);
	li	a0,8192
	li	a5,8192
	sw	a5,0(s0)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s0)
	mv	a1,a0
	lla	s1,.LANCHOR0
	li	a3,1
	li	a0,16
	sw	a1,0(s1)
	call	_Z19SetupCartPRGMappingiPhji
	lw	a1,0(s0)
	lw	a0,0(s1)
	lla	a3,.LC0
	li	a2,0
	call	_Z10AddExStatePvjiPKc
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR8
	call	_Z10AddExStatePvjiPKc
	lw	ra,8(sp)
	lw	s0,4(sp)
	lla	a5,_ZL12StateRestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
	.size	_Z13Mapper73_InitP8CartInfo, .-_Z13Mapper73_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"PREG"
	.align	2
.LC2:
	.string	"IRQA"
	.align	2
.LC3:
	.string	"IRQX"
	.align	2
.LC4:
	.string	"IRQM"
	.align	2
.LC5:
	.string	"IRQR"
	.align	2
.LC6:
	.string	"IRQC"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR8,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 84
_ZL9StateRegs:
	.word	_ZL4preg
	.word	1
	.word	.LC1
	.word	_ZL4IRQa
	.word	1
	.word	.LC2
	.word	_ZL4IRQx
	.word	1
	.word	.LC3
	.word	_ZL4IRQm
	.word	1
	.word	.LC4
	.word	_ZL9IRQReload
	.word	2
	.word	.LC5
	.word	_ZL8IRQCount
	.word	2
	.word	.LC6
	.word	0
	.zero	8
	.section	.sbss._ZL4IRQa,"aw",@nobits
	.set	.LANCHOR4,. + 0
	.type	_ZL4IRQa, @object
	.size	_ZL4IRQa, 1
_ZL4IRQa:
	.zero	1
	.section	.sbss._ZL4IRQm,"aw",@nobits
	.set	.LANCHOR2,. + 0
	.type	_ZL4IRQm, @object
	.size	_ZL4IRQm, 1
_ZL4IRQm:
	.zero	1
	.section	.sbss._ZL4IRQx,"aw",@nobits
	.set	.LANCHOR3,. + 0
	.type	_ZL4IRQx, @object
	.size	_ZL4IRQx, 1
_ZL4IRQx:
	.zero	1
	.section	.sbss._ZL4WRAM,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL4WRAM, @object
	.size	_ZL4WRAM, 4
_ZL4WRAM:
	.zero	4
	.section	.sbss._ZL4preg,"aw",@nobits
	.set	.LANCHOR6,. + 0
	.type	_ZL4preg, @object
	.size	_ZL4preg, 1
_ZL4preg:
	.zero	1
	.section	.sbss._ZL8IRQCount,"aw",@nobits
	.align	1
	.set	.LANCHOR5,. + 0
	.type	_ZL8IRQCount, @object
	.size	_ZL8IRQCount, 2
_ZL8IRQCount:
	.zero	2
	.section	.sbss._ZL8WRAMSIZE,"aw",@nobits
	.align	2
	.set	.LANCHOR7,. + 0
	.type	_ZL8WRAMSIZE, @object
	.size	_ZL8WRAMSIZE, 4
_ZL8WRAMSIZE:
	.zero	4
	.section	.sbss._ZL9IRQReload,"aw",@nobits
	.align	1
	.set	.LANCHOR1,. + 0
	.type	_ZL9IRQReload, @object
	.size	_ZL9IRQReload, 2
_ZL9IRQReload:
	.zero	2
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
