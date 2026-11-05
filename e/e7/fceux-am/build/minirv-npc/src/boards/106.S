#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"106.cpp"
	.option nopic
	.text
	.section	.text._ZL9M106Resetv,"ax",@progbits
	.align	2
	.type	_ZL9M106Resetv, @function
_ZL9M106Resetv:
	ret
	.size	_ZL9M106Resetv, .-_ZL9M106Resetv
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR0
	lbu	a1,0(s0)
	li	a0,0
	sw	ra,8(sp)
	andi	a1,a1,254
	sw	s1,0(sp)
	call	_Z7setchr1jj
	lbu	a1,1(s0)
	li	a0,1024
	li	s1,4096
	ori	a1,a1,1
	call	_Z7setchr1jj
	lbu	a1,2(s0)
	addi	a0,s1,-2048
	andi	a1,a1,254
	call	_Z7setchr1jj
	lbu	a1,3(s0)
	addi	a0,s1,-1024
	ori	a1,a1,1
	call	_Z7setchr1jj
	lbu	a1,4(s0)
	li	a0,4096
	call	_Z7setchr1jj
	lbu	a1,5(s0)
	addi	a0,s1,1024
	call	_Z7setchr1jj
	lbu	a1,6(s0)
	li	a5,8192
	addi	a0,a5,-2048
	mv	s1,a5
	call	_Z7setchr1jj
	lbu	a1,7(s0)
	addi	a0,s1,-1024
	call	_Z7setchr1jj
	li	a2,0
	li	a1,24576
	li	a0,16
	call	_Z8setprg8rijj
	lbu	a1,8(s0)
	li	a0,32768
	andi	a1,a1,15
	ori	a1,a1,16
	call	_Z7setprg8jj
	lbu	a1,9(s0)
	li	a0,40960
	andi	a1,a1,31
	call	_Z7setprg8jj
	lbu	a1,10(s0)
	li	a0,49152
	andi	a1,a1,31
	call	_Z7setprg8jj
	lbu	a1,11(s0)
	li	a0,57344
	andi	a1,a1,15
	ori	a1,a1,16
	call	_Z7setprg8jj
	lbu	a0,12(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	not	a0,a0
	andi	a0,a0,1
	addi	sp,sp,12
	tail	_Z9setmirrori
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	tail	_ZL4Syncv
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL9M106Closev,"ax",@progbits
	.align	2
	.type	_ZL9M106Closev, @function
_ZL9M106Closev:
	la a0, .LANCHOR1; lw a0, 0(a0);
	beq	a0,zero,.L12
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_Z10FCEU_gfreePv
	lw	ra,8(sp)
	la a5, .LANCHOR1; sw zero, 0(a5);
	addi	sp,sp,12
	jr	ra
.L12:
	la a5, .LANCHOR1; sw zero, 0(a5);
	ret
	.size	_ZL9M106Closev, .-_ZL9M106Closev
	.section	.text._ZL9M106Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M106Powerv, @function
_ZL9M106Powerv:
	addi	sp,sp,-12
	li	a5,-1
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	la a4, .LANCHOR0+8; sw a5, 0(a4);
	li	s1,32768
	call	_ZL4Syncv
	addi	a1,s1,-1
	lla	a2,_Z6CartBRj
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s1,-1
	lla	a2,_Z6CartBWjh
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	lla	a2,_ZL9M106Writejh
	li	a0,32768
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL9M106Powerv, .-_ZL9M106Powerv
	.section	.text._Z11M106CpuHooki,"ax",@progbits
	.align	2
	.globl	_Z11M106CpuHooki
	.hidden	_Z11M106CpuHooki
	.type	_Z11M106CpuHooki, @function
_Z11M106CpuHooki:
	la a5, .LANCHOR2; lbu a5, 0(a5);
	beq	a5,zero,.L22
	lla	a5,.LANCHOR3
	lw	a3,0(a5)
	li	a4,65536
	add	a0,a0,a3
	sw	a0,0(a5)
	bgtu	a0,a4,.L25
.L22:
	ret
.L25:
	addi	sp,sp,-12
	li	a0,1
	sw	ra,8(sp)
	call	_Z14X6502_IRQBegini
	lw	ra,8(sp)
	la a5, .LANCHOR2; sb zero, 0(a5);
	addi	sp,sp,12
	jr	ra
	.size	_Z11M106CpuHooki, .-_Z11M106CpuHooki
	.section	.text._ZL9M106Writejh,"ax",@progbits
	.align	2
	.type	_ZL9M106Writejh, @function
_ZL9M106Writejh:
	andi	a0,a0,15
	li	a5,14
	beq	a0,a5,.L27
	li	a5,15
	beq	a0,a5,.L28
	li	a5,13
	beq	a0,a5,.L31
	lla	a5,.LANCHOR0
	add	a5,a5,a0
	sb	a1,0(a5)
	tail	_ZL4Syncv
.L27:
	lla	a3,.LANCHOR3
	lw	a5,0(a3)
	li	a4,65536
	addi	a4,a4,-256
	and	a5,a5,a4
	or	a5,a5,a1
	sw	a5,0(a3)
	ret
.L31:
	li	a0,1
	la a5, .LANCHOR2; sb zero, 0(a5);
	la a5, .LANCHOR3; sw zero, 0(a5);
	tail	_Z12X6502_IRQEndi
.L28:
	lla	a4,.LANCHOR3
	lbu	a5,0(a4)
	slli	a1,a1,8
	or	a1,a5,a1
	li	a5,1
	sw	a1,0(a4)
	la a4, .LANCHOR2; sb a5, 0(a4);
	ret
	.size	_ZL9M106Writejh, .-_ZL9M106Writejh
	.section	.rodata._Z14Mapper106_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.section	.text._Z14Mapper106_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper106_InitP8CartInfo
	.hidden	_Z14Mapper106_InitP8CartInfo
	.type	_Z14Mapper106_InitP8CartInfo, @function
_Z14Mapper106_InitP8CartInfo:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	lla	a5,_ZL9M106Powerv
	sw	a5,0(a0)
	lla	a5,_ZL9M106Resetv
	sw	a5,4(a0)
	lla	a5,_ZL9M106Closev
	sw	a5,8(a0)
	lla	a5,_Z11M106CpuHooki
	la a4, MapIRQHook; sw a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	lla	s0,.LANCHOR4
	la a4, GameStateRestore; sw a5, 0(a4);
	li	a0,8192
	li	a5,8192
	sw	a5,0(s0)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s0)
	mv	a1,a0
	lla	s1,.LANCHOR1
	li	a3,1
	li	a0,16
	sw	a1,0(s1)
	call	_Z19SetupCartPRGMappingiPhji
	lw	a1,0(s0)
	lw	a0,0(s1)
	lla	a3,.LC0
	li	a2,0
	call	_Z10AddExStatePvjiPKc
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR5
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper106_InitP8CartInfo, .-_Z14Mapper106_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"IRQA"
	.align	2
.LC2:
	.string	"IRQC"
	.align	2
.LC3:
	.string	"REGS"
	.section	.bss._ZL3reg,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL3reg, @object
	.size	_ZL3reg, 16
_ZL3reg:
	.zero	16
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR5,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 48
_ZL9StateRegs:
	.word	_ZL4IRQa
	.word	1
	.word	.LC1
	.word	_ZL8IRQCount
	.word	4
	.word	.LC2
	.word	_ZL3reg
	.word	16
	.word	.LC3
	.word	0
	.zero	8
	.section	.sbss._ZL4IRQa,"aw",@nobits
	.set	.LANCHOR2,. + 0
	.type	_ZL4IRQa, @object
	.size	_ZL4IRQa, 1
_ZL4IRQa:
	.zero	1
	.section	.sbss._ZL4WRAM,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	_ZL4WRAM, @object
	.size	_ZL4WRAM, 4
_ZL4WRAM:
	.zero	4
	.section	.sbss._ZL8IRQCount,"aw",@nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	_ZL8IRQCount, @object
	.size	_ZL8IRQCount, 4
_ZL8IRQCount:
	.zero	4
	.section	.sbss._ZL8WRAMSIZE,"aw",@nobits
	.align	2
	.set	.LANCHOR4,. + 0
	.type	_ZL8WRAMSIZE, @object
	.size	_ZL8WRAMSIZE, 4
_ZL8WRAMSIZE:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
