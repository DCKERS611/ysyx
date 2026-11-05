#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"206.cpp"
	.option nopic
	.text
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
	sw	s1,0(sp)
	call	_Z7setchr2jj
	lbu	a1,1(s0)
	li	s1,4096
	addi	a0,s1,-2048
	call	_Z7setchr2jj
	lbu	a1,2(s0)
	li	a0,4096
	call	_Z7setchr1jj
	lbu	a1,3(s0)
	addi	a0,s1,1024
	call	_Z7setchr1jj
	lbu	a1,4(s0)
	li	a5,8192
	addi	a0,a5,-2048
	mv	s1,a5
	call	_Z7setchr1jj
	lbu	a1,5(s0)
	addi	a0,s1,-1024
	call	_Z7setchr1jj
	lbu	a1,6(s0)
	li	a0,32768
	call	_Z7setprg8jj
	lbu	a1,7(s0)
	li	a0,40960
	call	_Z7setprg8jj
	li	a1,-2
	li	a0,49152
	call	_Z7setprg8jj
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	li	a1,-1
	li	a0,57344
	addi	sp,sp,12
	tail	_Z7setprg8jj
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	tail	_ZL4Syncv
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL9M206Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M206Powerv, @function
_ZL9M206Powerv:
	la a5, .LANCHOR1; sb zero, 0(a5);
	addi	sp,sp,-12
	li	a5,256
	sw	ra,8(sp)
	sw	s0,4(sp)
	la a4, .LANCHOR0+6; sh a5, 0(a4);
	li	s0,65536
	call	_ZL4Syncv
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_ZL9M206Writejh
	li	a0,32768
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL9M206Powerv, .-_ZL9M206Powerv
	.section	.text._ZL9M206Writejh,"ax",@progbits
	.align	2
	.type	_ZL9M206Writejh, @function
_ZL9M206Writejh:
	li	a4,32768
	addi	a5,a4,1
	and	a0,a0,a5
	beq	a0,a4,.L8
	bne	a0,a5,.L14
	la a5, .LANCHOR1; lbu a5, 0(a5);
	li	a4,5
	andi	a3,a1,15
	bgtu	a5,a4,.L13
	li	a4,1
	andi	a3,a1,63
	bgtu	a5,a4,.L13
	srli	a3,a3,1
.L13:
	andi	a5,a5,7
	lla	a4,.LANCHOR0
	add	a5,a4,a5
	sb	a3,0(a5)
	tail	_ZL4Syncv
.L14:
	ret
.L8:
	andi	a1,a1,7
	la a5, .LANCHOR1; sb a1, 0(a5);
	ret
	.size	_ZL9M206Writejh, .-_ZL9M206Writejh
	.section	.text._Z14Mapper206_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper206_InitP8CartInfo
	.hidden	_Z14Mapper206_InitP8CartInfo
	.type	_Z14Mapper206_InitP8CartInfo, @function
_Z14Mapper206_InitP8CartInfo:
	lla	a5,_ZL9M206Powerv
	sw	a5,0(a0)
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR2
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper206_InitP8CartInfo, .-_Z14Mapper206_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"CMD"
	.align	2
.LC1:
	.string	"DREG"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 36
_ZL9StateRegs:
	.word	_ZL3cmd
	.word	1
	.word	.LC0
	.word	_ZL5DRegs
	.word	8
	.word	.LC1
	.word	0
	.zero	8
	.section	.sbss._ZL3cmd,"aw",@nobits
	.set	.LANCHOR1,. + 0
	.type	_ZL3cmd, @object
	.size	_ZL3cmd, 1
_ZL3cmd:
	.zero	1
	.section	.sbss._ZL5DRegs,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL5DRegs, @object
	.size	_ZL5DRegs, 8
_ZL5DRegs:
	.zero	8
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
