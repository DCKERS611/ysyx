#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"103.cpp"
	.option nopic
	.text
	.section	.text._ZL13M103RamWrite0jh,"ax",@progbits
	.align	2
	.type	_ZL13M103RamWrite0jh, @function
_ZL13M103RamWrite0jh:
	slli	a0,a0,19
	srli	a0,a0,19
	la a5, .LANCHOR0; lw a5, 0(a5);
	add	a5,a5,a0
	sb	a1,0(a5)
	ret
	.size	_ZL13M103RamWrite0jh, .-_ZL13M103RamWrite0jh
	.section	.text._ZL13M103RamWrite1jh,"ax",@progbits
	.align	2
	.type	_ZL13M103RamWrite1jh, @function
_ZL13M103RamWrite1jh:
	li	a4,-45056
	li	a5,8192
	addi	a4,a4,-2048
	add	a0,a0,a4
	addi	a4,a5,-1
	and	a0,a0,a4
	la a4, .LANCHOR0; lw a4, 0(a4);
	add	a4,a4,a0
	add	a5,a5,a4
	sb	a1,0(a5)
	ret
	.size	_ZL13M103RamWrite1jh, .-_ZL13M103RamWrite1jh
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-12
	li	a0,0
	sw	ra,8(sp)
	call	_Z7setchr8j
	li	a1,12
	li	a0,32768
	call	_Z7setprg8jj
	li	a1,15
	li	a0,57344
	call	_Z7setprg8jj
	la a5, .LANCHOR1; lbu a5, 0(a5);
	andi	a5,a5,16
	beq	a5,zero,.L5
	la a1, .LANCHOR2; lbu a1, 0(a1);
	li	a0,24576
	call	_Z7setprg8jj
	li	a1,13
	li	a0,40960
	call	_Z7setprg8jj
	li	a0,49152
	li	a1,14
	call	_Z7setprg8jj
	lw	ra,8(sp)
	la a0, .LANCHOR3; lbu a0, 0(a0);
	xori	a0,a0,1
	addi	sp,sp,12
	tail	_Z9setmirrori
.L5:
	li	a2,0
	li	a1,24576
	li	a0,16
	call	_Z8setprg8rijj
	li	a1,26
	li	a0,40960
	call	_Z7setprg4jj
	li	a1,54
	li	a0,45056
	call	_Z7setprg2jj
	li	a1,49152
	li	a2,4
	addi	a1,a1,-2048
	li	a0,16
	call	_Z8setprg2rijj
	li	a2,5
	li	a1,49152
	li	a0,16
	call	_Z8setprg2rijj
	li	a1,53248
	li	a2,6
	addi	a1,a1,-2048
	li	a0,16
	call	_Z8setprg2rijj
	li	a1,53248
	li	a0,16
	li	a2,7
	call	_Z8setprg2rijj
	li	a0,57344
	addi	a0,a0,-2048
	li	a1,59
	call	_Z7setprg2jj
	lw	ra,8(sp)
	la a0, .LANCHOR3; lbu a0, 0(a0);
	xori	a0,a0,1
	addi	sp,sp,12
	tail	_Z9setmirrori
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	tail	_ZL4Syncv
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL10M103Write2jh,"ax",@progbits
	.align	2
	.type	_ZL10M103Write2jh, @function
_ZL10M103Write2jh:
	la a5, .LANCHOR1; sb a1, 0(a5);
	tail	_ZL4Syncv
	.size	_ZL10M103Write2jh, .-_ZL10M103Write2jh
	.section	.text._ZL10M103Write1jh,"ax",@progbits
	.align	2
	.type	_ZL10M103Write1jh, @function
_ZL10M103Write1jh:
	srli	a1,a1,3
	andi	a1,a1,1
	la a5, .LANCHOR3; sb a1, 0(a5);
	tail	_ZL4Syncv
	.size	_ZL10M103Write1jh, .-_ZL10M103Write1jh
	.section	.text._ZL10M103Write0jh,"ax",@progbits
	.align	2
	.type	_ZL10M103Write0jh, @function
_ZL10M103Write0jh:
	andi	a1,a1,15
	la a5, .LANCHOR2; sb a1, 0(a5);
	tail	_ZL4Syncv
	.size	_ZL10M103Write0jh, .-_ZL10M103Write0jh
	.section	.text._ZL9M103Closev,"ax",@progbits
	.align	2
	.type	_ZL9M103Closev, @function
_ZL9M103Closev:
	la a0, .LANCHOR0; lw a0, 0(a0);
	beq	a0,zero,.L18
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_Z10FCEU_gfreePv
	lw	ra,8(sp)
	la a5, .LANCHOR0; sw zero, 0(a5);
	addi	sp,sp,12
	jr	ra
.L18:
	la a5, .LANCHOR0; sw zero, 0(a5);
	ret
	.size	_ZL9M103Closev, .-_ZL9M103Closev
	.section	.text._ZL9M103Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M103Powerv, @function
_ZL9M103Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	la a5, .LANCHOR3; sb zero, 0(a5);
	li	s0,32768
	la a5, .LANCHOR2; sb zero, 0(a5);
	la a5, .LANCHOR1; sb zero, 0(a5);
	call	_ZL4Syncv
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lla	a2,_ZL13M103RamWrite0jh
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	li	a1,53248
	li	a0,49152
	lla	a2,_ZL13M103RamWrite1jh
	addi	a1,a1,2047
	addi	a0,a0,-2048
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,36864
	lla	a2,_ZL10M103Write0jh
	addi	a1,a1,-1
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,61440
	lla	a2,_ZL10M103Write1jh
	addi	a1,a1,-1
	li	a0,57344
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_ZL10M103Write2jh
	li	a0,61440
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL9M103Powerv, .-_ZL9M103Powerv
	.section	.rodata._Z14Mapper103_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.section	.text._Z14Mapper103_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper103_InitP8CartInfo
	.hidden	_Z14Mapper103_InitP8CartInfo
	.type	_Z14Mapper103_InitP8CartInfo, @function
_Z14Mapper103_InitP8CartInfo:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	lla	a5,_ZL9M103Powerv
	sw	a5,0(a0)
	lla	a5,_ZL9M103Closev
	sw	a5,8(a0)
	lla	a5,_ZL12StateRestorei
	lla	s0,.LANCHOR4
	la a4, GameStateRestore; sw a5, 0(a4);
	li	a0,16384
	li	a5,16384
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
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR5
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper103_InitP8CartInfo, .-_Z14Mapper103_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"REG0"
	.align	2
.LC2:
	.string	"REG1"
	.align	2
.LC3:
	.string	"REG2"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR5,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 48
_ZL9StateRegs:
	.word	_ZL4reg0
	.word	1
	.word	.LC1
	.word	_ZL4reg1
	.word	1
	.word	.LC2
	.word	_ZL4reg2
	.word	1
	.word	.LC3
	.word	0
	.zero	8
	.section	.sbss._ZL4WRAM,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL4WRAM, @object
	.size	_ZL4WRAM, 4
_ZL4WRAM:
	.zero	4
	.section	.sbss._ZL4reg0,"aw",@nobits
	.set	.LANCHOR2,. + 0
	.type	_ZL4reg0, @object
	.size	_ZL4reg0, 1
_ZL4reg0:
	.zero	1
	.section	.sbss._ZL4reg1,"aw",@nobits
	.set	.LANCHOR3,. + 0
	.type	_ZL4reg1, @object
	.size	_ZL4reg1, 1
_ZL4reg1:
	.zero	1
	.section	.sbss._ZL4reg2,"aw",@nobits
	.set	.LANCHOR1,. + 0
	.type	_ZL4reg2, @object
	.size	_ZL4reg2, 1
_ZL4reg2:
	.zero	1
	.section	.sbss._ZL8WRAMSIZE,"aw",@nobits
	.align	2
	.set	.LANCHOR4,. + 0
	.type	_ZL8WRAMSIZE, @object
	.size	_ZL8WRAMSIZE, 4
_ZL8WRAMSIZE:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
