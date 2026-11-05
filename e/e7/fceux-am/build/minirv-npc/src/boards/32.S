#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"32.cpp"
	.option nopic
	.text
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	la s0, .LANCHOR0; lbu s0, 0(s0);
	not	a0,s0
	li	a5,16384
	andi	a0,a0,1
	slli	s0,s0,13
	and	s0,s0,a5
	sw	ra,8(sp)
	sw	s1,0(sp)
	call	_Z9setmirrori
	li	a2,0
	li	a1,24576
	li	a0,16
	call	_Z8setprg8rijj
	lla	s1,.LANCHOR1
	lbu	a1,0(s1)
	li	a0,32768
	or	a0,s0,a0
	call	_Z7setprg8jj
	lbu	a1,1(s1)
	li	a0,40960
	lla	s1,.LANCHOR2
	call	_Z7setprg8jj
	li	a0,49152
	xor	a0,s0,a0
	li	a1,-2
	call	_Z7setprg8jj
	li	a1,-1
	li	a0,57344
	call	_Z7setprg8jj
	li	s0,0
.L2:
	lbu	a1,0(s1)
	mv	a0,s0
	addi	s0,s0,1024
	call	_Z7setchr1jj
	li	a5,8192
	addi	s1,s1,1
	bne	s0,a5,.L2
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	tail	_ZL4Syncv
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL9M32Write3jh,"ax",@progbits
	.align	2
	.type	_ZL9M32Write3jh, @function
_ZL9M32Write3jh:
	andi	a0,a0,7
	lla	a5,.LANCHOR2
	add	a5,a5,a0
	sb	a1,0(a5)
	tail	_ZL4Syncv
	.size	_ZL9M32Write3jh, .-_ZL9M32Write3jh
	.section	.text._ZL9M32Write2jh,"ax",@progbits
	.align	2
	.type	_ZL9M32Write2jh, @function
_ZL9M32Write2jh:
	la a5, .LANCHOR1+1; sb a1, 0(a5);
	tail	_ZL4Syncv
	.size	_ZL9M32Write2jh, .-_ZL9M32Write2jh
	.section	.text._ZL9M32Write1jh,"ax",@progbits
	.align	2
	.type	_ZL9M32Write1jh, @function
_ZL9M32Write1jh:
	la a5, .LANCHOR0; sb a1, 0(a5);
	tail	_ZL4Syncv
	.size	_ZL9M32Write1jh, .-_ZL9M32Write1jh
	.section	.text._ZL9M32Write0jh,"ax",@progbits
	.align	2
	.type	_ZL9M32Write0jh, @function
_ZL9M32Write0jh:
	la a5, .LANCHOR1; sb a1, 0(a5);
	tail	_ZL4Syncv
	.size	_ZL9M32Write0jh, .-_ZL9M32Write0jh
	.section	.text._ZL8M32Closev,"ax",@progbits
	.align	2
	.type	_ZL8M32Closev, @function
_ZL8M32Closev:
	la a0, .LANCHOR3; lw a0, 0(a0);
	beq	a0,zero,.L17
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_Z10FCEU_gfreePv
	lw	ra,8(sp)
	la a5, .LANCHOR3; sw zero, 0(a5);
	addi	sp,sp,12
	jr	ra
.L17:
	la a5, .LANCHOR3; sw zero, 0(a5);
	ret
	.size	_ZL8M32Closev, .-_ZL8M32Closev
	.section	.text._ZL8M32Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M32Powerv, @function
_ZL8M32Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	call	_ZL4Syncv
	li	s0,32768
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lla	a2,_Z6CartBWjh
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	li	a1,36864
	lla	a2,_ZL9M32Write0jh
	addi	a1,a1,-1
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,40960
	lla	a2,_ZL9M32Write1jh
	addi	a1,a1,-1
	li	a0,36864
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,45056
	lla	a2,_ZL9M32Write2jh
	addi	a1,a1,-1
	li	a0,40960
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,49152
	lla	a2,_ZL9M32Write3jh
	addi	a1,a1,-1
	li	a0,45056
	call	_Z15SetWriteHandleriiPFvjhE
	lw	s0,4(sp)
	lw	ra,8(sp)
	la a0, .LANCHOR4; lw a0, 0(a0);
	la a2, .LANCHOR3; lw a2, 0(a2);
	li	a1,24576
	srli	a0,a0,10
	addi	sp,sp,12
	tail	_Z16FCEU_CheatAddRAMijPh
	.size	_ZL8M32Powerv, .-_ZL8M32Powerv
	.section	.rodata._Z13Mapper32_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.section	.text._Z13Mapper32_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper32_InitP8CartInfo
	.hidden	_Z13Mapper32_InitP8CartInfo
	.type	_Z13Mapper32_InitP8CartInfo, @function
_Z13Mapper32_InitP8CartInfo:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	lla	a5,_ZL8M32Powerv
	sw	a5,0(a0)
	lla	a5,_ZL8M32Closev
	sw	a5,8(a0)
	lla	a5,_ZL12StateRestorei
	lla	s0,.LANCHOR4
	la a4, GameStateRestore; sw a5, 0(a4);
	li	a0,8192
	li	a5,8192
	sw	a5,0(s0)
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
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR5
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z13Mapper32_InitP8CartInfo, .-_Z13Mapper32_InitP8CartInfo
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
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR5,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 48
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
	.word	0
	.zero	8
	.section	.sbss._ZL4WRAM,"aw",@nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	_ZL4WRAM, @object
	.size	_ZL4WRAM, 4
_ZL4WRAM:
	.zero	4
	.section	.sbss._ZL4creg,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL4creg, @object
	.size	_ZL4creg, 8
_ZL4creg:
	.zero	8
	.section	.sbss._ZL4mirr,"aw",@nobits
	.set	.LANCHOR0,. + 0
	.type	_ZL4mirr, @object
	.size	_ZL4mirr, 1
_ZL4mirr:
	.zero	1
	.section	.sbss._ZL4preg,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	_ZL4preg, @object
	.size	_ZL4preg, 2
_ZL4preg:
	.zero	2
	.section	.sbss._ZL8WRAMSIZE,"aw",@nobits
	.align	2
	.set	.LANCHOR4,. + 0
	.type	_ZL8WRAMSIZE, @object
	.size	_ZL8WRAMSIZE, 4
_ZL8WRAMSIZE:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
