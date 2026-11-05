#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"ffe.cpp"
	.option nopic
	.text
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
	la a5, .LANCHOR0; lbu a5, 0(a5);
	beq	a5,zero,.L2
	lla	s1,.LANCHOR1
	li	s0,0
.L3:
	lbu	a1,0(s1)
	mv	a0,s0
	addi	s0,s0,1024
	call	_Z7setchr1jj
	li	a5,8192
	addi	s1,s1,1
	bne	s0,a5,.L3
	lla	s0,.LANCHOR2
	lbu	a1,0(s0)
	li	a0,32768
	call	_Z7setprg8jj
	lbu	a1,1(s0)
	li	a0,40960
	call	_Z7setprg8jj
	lbu	a1,2(s0)
	li	a0,49152
	call	_Z7setprg8jj
	lbu	a1,3(s0)
	li	a0,57344
	call	_Z7setprg8jj
	la a5, .LANCHOR4; lbu a5, 0(a5);
	li	a4,2
	beq	a5,a4,.L5
.L18:
	bgtu	a5,a4,.L6
	li	a0,3
	beq	a5,zero,.L17
.L15:
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	tail	_Z9setmirrori
.L6:
	li	a4,3
	li	a0,0
	beq	a5,a4,.L15
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L2:
	lla	s0,.LANCHOR3
	lbu	a0,0(s0)
	andi	a0,a0,3
	call	_Z7setchr8j
	lbu	a1,0(s0)
	li	a0,32768
	srli	a1,a1,2
	call	_Z8setprg16jj
	li	a1,7
	li	a0,49152
	call	_Z8setprg16jj
	la a5, .LANCHOR4; lbu a5, 0(a5);
	li	a4,2
	bne	a5,a4,.L18
.L5:
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	li	a0,1
	addi	sp,sp,12
	tail	_Z9setmirrori
.L17:
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	li	a0,2
	addi	sp,sp,12
	tail	_Z9setmirrori
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	tail	_ZL4Syncv
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL13FFEWriteLatchjh,"ax",@progbits
	.align	2
	.type	_ZL13FFEWriteLatchjh, @function
_ZL13FFEWriteLatchjh:
	la a5, .LANCHOR3; sb a1, 0(a5);
	tail	_ZL4Syncv
	.size	_ZL13FFEWriteLatchjh, .-_ZL13FFEWriteLatchjh
	.section	.text._ZL11FFEWriteChrjh,"ax",@progbits
	.align	2
	.type	_ZL11FFEWriteChrjh, @function
_ZL11FFEWriteChrjh:
	andi	a0,a0,7
	lla	a5,.LANCHOR1
	add	a5,a5,a0
	sb	a1,0(a5)
	tail	_ZL4Syncv
	.size	_ZL11FFEWriteChrjh, .-_ZL11FFEWriteChrjh
	.section	.text._ZL11FFEWritePrgjh,"ax",@progbits
	.align	2
	.type	_ZL11FFEWritePrgjh, @function
_ZL11FFEWritePrgjh:
	andi	a0,a0,3
	lla	a5,.LANCHOR2
	add	a5,a5,a0
	sb	a1,0(a5)
	tail	_ZL4Syncv
	.size	_ZL11FFEWritePrgjh, .-_ZL11FFEWritePrgjh
	.section	.text._ZL12FFEWriteMirrjh,"ax",@progbits
	.align	2
	.type	_ZL12FFEWriteMirrjh, @function
_ZL12FFEWriteMirrjh:
	slli	a0,a0,1
	srli	a1,a1,4
	andi	a0,a0,2
	andi	a1,a1,1
	or	a0,a0,a1
	la a5, .LANCHOR4; sb a0, 0(a5);
	tail	_ZL4Syncv
	.size	_ZL12FFEWriteMirrjh, .-_ZL12FFEWriteMirrjh
	.section	.text._ZL8FFEClosev,"ax",@progbits
	.align	2
	.type	_ZL8FFEClosev, @function
_ZL8FFEClosev:
	la a0, .LANCHOR5; lw a0, 0(a0);
	beq	a0,zero,.L30
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_Z10FCEU_gfreePv
	lw	ra,8(sp)
	la a5, .LANCHOR5; sw zero, 0(a5);
	addi	sp,sp,12
	jr	ra
.L30:
	la a5, .LANCHOR5; sw zero, 0(a5);
	ret
	.size	_ZL8FFEClosev, .-_ZL8FFEClosev
	.section	.text._ZL8FFEPowerv,"ax",@progbits
	.align	2
	.type	_ZL8FFEPowerv, @function
_ZL8FFEPowerv:
	addi	sp,sp,-12
	li	a5,-1
	sw	ra,8(sp)
	la a4, .LANCHOR2+3; sb a5, 0(a4);
	sw	s0,4(sp)
	sw	s1,0(sp)
	call	_ZL4Syncv
	li	s1,65536
	addi	a1,s1,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	li	s0,16384
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,767
	addi	a0,s0,766
	lla	a2,_ZL12FFEWriteMirrjh
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,1283
	addi	a0,s0,1280
	lla	a2,_ZL11FFEWriteIRQjh
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,1287
	addi	a0,s0,1284
	lla	a2,_ZL11FFEWritePrgjh
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,1303
	addi	a0,s0,1296
	lla	a2,_ZL11FFEWriteChrjh
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,1303
	addi	a0,s0,1296
	lla	a2,_ZL11FFEWriteChrjh
	call	_Z15SetWriteHandleriiPFvjhE
	li	s0,32768
	addi	a1,s0,-1
	lla	a2,_Z6CartBWjh
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s1,-1
	lla	a2,_ZL13FFEWriteLatchjh
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	la a0, .LANCHOR6; lw a0, 0(a0);
	la a2, .LANCHOR5; lw a2, 0(a2);
	li	a1,24576
	srli	a0,a0,10
	addi	sp,sp,12
	tail	_Z16FCEU_CheatAddRAMijPh
	.size	_ZL8FFEPowerv, .-_ZL8FFEPowerv
	.section	.text._ZL10FFEIRQHooki,"ax",@progbits
	.align	2
	.type	_ZL10FFEIRQHooki, @function
_ZL10FFEIRQHooki:
	la a5, .LANCHOR7; lbu a5, 0(a5);
	beq	a5,zero,.L40
	lla	a5,.LANCHOR8
	lw	a3,0(a5)
	li	a4,65536
	add	a0,a0,a3
	sw	a0,0(a5)
	bge	a0,a4,.L43
.L40:
	ret
.L43:
	addi	sp,sp,-12
	li	a0,1
	sw	ra,8(sp)
	call	_Z14X6502_IRQBegini
	lw	ra,8(sp)
	la a5, .LANCHOR7; sb zero, 0(a5);
	la a5, .LANCHOR8; sw zero, 0(a5);
	addi	sp,sp,12
	jr	ra
	.size	_ZL10FFEIRQHooki, .-_ZL10FFEIRQHooki
	.section	.text._ZL11FFEWriteIRQjh,"ax",@progbits
	.align	2
	.type	_ZL11FFEWriteIRQjh, @function
_ZL11FFEWriteIRQjh:
	li	a5,16384
	addi	a4,a5,1282
	beq	a0,a4,.L45
	addi	a4,a5,1283
	beq	a0,a4,.L46
	addi	a5,a5,1281
	beq	a0,a5,.L48
	ret
.L45:
	lla	a3,.LANCHOR8
	lw	a5,0(a3)
	li	a4,65536
	addi	a4,a4,-256
	and	a5,a5,a4
	or	a5,a5,a1
	li	a0,1
	sw	a5,0(a3)
	tail	_Z12X6502_IRQEndi
.L48:
	li	a0,1
	la a5, .LANCHOR7; sb zero, 0(a5);
	tail	_Z12X6502_IRQEndi
.L46:
	lla	a4,.LANCHOR8
	lbu	a5,0(a4)
	slli	a1,a1,8
	li	a0,1
	or	a5,a5,a1
	sw	a5,0(a4)
	li	a5,1
	la a4, .LANCHOR7; sb a5, 0(a4);
	tail	_Z12X6502_IRQEndi
	.size	_ZL11FFEWriteIRQjh, .-_ZL11FFEWriteIRQjh
	.section	.rodata._Z12Mapper6_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.section	.text._Z12Mapper6_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z12Mapper6_InitP8CartInfo
	.hidden	_Z12Mapper6_InitP8CartInfo
	.type	_Z12Mapper6_InitP8CartInfo, @function
_Z12Mapper6_InitP8CartInfo:
	lw	a3,44(a0)
	li	a4,3
	addi	sp,sp,-16
	andi	a3,a3,1
	sub	a4,a4,a3
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	la a3, .LANCHOR4; sb a4, 0(a3);
	lla	a4,_ZL8FFEPowerv
	sw	a4,0(a0)
	lla	a4,_ZL8FFEClosev
	sw	a4,8(a0)
	la a4, .LANCHOR0; sb zero, 0(a4);
	lla	a4,_ZL10FFEIRQHooki
	la a3, MapIRQHook; sw a4, 0(a3);
	lla	a4,_ZL12StateRestorei
	lla	s0,.LANCHOR6
	la a3, GameStateRestore; sw a4, 0(a3);
	sw	a0,0(sp)
	li	a4,8192
	li	a0,8192
	sw	a4,0(s0)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s0)
	mv	a1,a0
	lla	s1,.LANCHOR5
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
	beq	a4,zero,.L50
	lw	a3,0(s1)
	lw	a4,0(s0)
	sw	a3,12(a5)
	sw	a4,28(a5)
.L50:
	lw	s0,8(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR9
	addi	sp,sp,16
	tail	_Z10AddExStatePvjiPKc
	.size	_Z12Mapper6_InitP8CartInfo, .-_Z12Mapper6_InitP8CartInfo
	.section	.text._Z13Mapper17_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper17_InitP8CartInfo
	.hidden	_Z13Mapper17_InitP8CartInfo
	.type	_Z13Mapper17_InitP8CartInfo, @function
_Z13Mapper17_InitP8CartInfo:
	li	a5,1
	la a4, .LANCHOR0; sb a5, 0(a4);
	tail	_Z12Mapper6_InitP8CartInfo
	.size	_Z13Mapper17_InitP8CartInfo, .-_Z13Mapper17_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"PREG"
	.align	2
.LC2:
	.string	"CREG"
	.align	2
.LC3:
	.string	"MIRR"
	.align	2
.LC4:
	.string	"IRQA"
	.align	2
.LC5:
	.string	"IRQC"
	.align	2
.LC6:
	.string	"IRQL"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR9,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 84
_ZL9StateRegs:
	.word	_ZL4preg
	.word	4
	.word	.LC1
	.word	_ZL4creg
	.word	8
	.word	.LC2
	.word	_ZL4mirr
	.word	1
	.word	.LC3
	.word	_ZL4IRQa
	.word	1
	.word	.LC4
	.word	_ZL8IRQCount
	.word	4
	.word	.LC5
	.word	_ZL8IRQLatch
	.word	4
	.word	.LC6
	.word	0
	.zero	8
	.section	.sbss._ZL4IRQa,"aw",@nobits
	.set	.LANCHOR7,. + 0
	.type	_ZL4IRQa, @object
	.size	_ZL4IRQa, 1
_ZL4IRQa:
	.zero	1
	.section	.sbss._ZL4WRAM,"aw",@nobits
	.align	2
	.set	.LANCHOR5,. + 0
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
	.set	.LANCHOR4,. + 0
	.type	_ZL4mirr, @object
	.size	_ZL4mirr, 1
_ZL4mirr:
	.zero	1
	.section	.sbss._ZL4preg,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL4preg, @object
	.size	_ZL4preg, 4
_ZL4preg:
	.zero	4
	.section	.sbss._ZL5latch,"aw",@nobits
	.set	.LANCHOR3,. + 0
	.type	_ZL5latch, @object
	.size	_ZL5latch, 1
_ZL5latch:
	.zero	1
	.section	.sbss._ZL7ffemode,"aw",@nobits
	.set	.LANCHOR0,. + 0
	.type	_ZL7ffemode, @object
	.size	_ZL7ffemode, 1
_ZL7ffemode:
	.zero	1
	.section	.sbss._ZL8IRQCount,"aw",@nobits
	.align	2
	.set	.LANCHOR8,. + 0
	.type	_ZL8IRQCount, @object
	.size	_ZL8IRQCount, 4
_ZL8IRQCount:
	.zero	4
	.section	.sbss._ZL8IRQLatch,"aw",@nobits
	.align	2
	.type	_ZL8IRQLatch, @object
	.size	_ZL8IRQLatch, 4
_ZL8IRQLatch:
	.zero	4
	.section	.sbss._ZL8WRAMSIZE,"aw",@nobits
	.align	2
	.set	.LANCHOR6,. + 0
	.type	_ZL8WRAMSIZE, @object
	.size	_ZL8WRAMSIZE, 4
_ZL8WRAMSIZE:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
