#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"bmc42in1r.cpp"
	.option nopic
	.text
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-12
	sw	s1,0(sp)
	lla	s1,.LANCHOR0
	lbu	a5,1(s1)
	sw	ra,8(sp)
	sw	s0,4(sp)
	slli	a5,a5,6
	la a3, .LANCHOR1; lbu a3, 0(a3);
	lbu	a4,0(s1)
	andi	a5,a5,64
	beq	a3,zero,.L2
	la a3, .LANCHOR2; lbu a3, 0(a3);
	andi	a2,a4,31
	slli	a3,a3,5
	or	a3,a3,a2
	or	a5,a5,a3
	andi	a4,a4,32
	andi	s0,a5,0xff
	bne	a4,zero,.L4
.L8:
	srli	a1,s0,1
	li	a0,32768
	call	_Z8setprg32jj
.L5:
	lbu	a0,0(s1)
	srli	a0,a0,6
	andi	a0,a0,1
	call	_Z9setmirrori
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	li	a0,0
	addi	sp,sp,12
	tail	_Z7setchr8j
.L2:
	srli	s0,a4,2
	andi	a3,a4,31
	andi	s0,s0,32
	or	s0,s0,a3
	andi	a4,a4,32
	or	s0,s0,a5
	beq	a4,zero,.L8
.L4:
	mv	a1,s0
	li	a0,32768
	call	_Z8setprg16jj
	mv	a1,s0
	li	a0,49152
	call	_Z8setprg16jj
	j	.L5
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	tail	_ZL4Syncv
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL9M226Writejh,"ax",@progbits
	.align	2
	.type	_ZL9M226Writejh, @function
_ZL9M226Writejh:
	andi	a0,a0,1
	lla	a5,.LANCHOR0
	add	a5,a5,a0
	sb	a1,0(a5)
	tail	_ZL4Syncv
	.size	_ZL9M226Writejh, .-_ZL9M226Writejh
	.section	.text._ZL9M233Resetv,"ax",@progbits
	.align	2
	.type	_ZL9M233Resetv, @function
_ZL9M233Resetv:
	lla	a4,.LANCHOR2
	lbu	a5,0(a4)
	xori	a5,a5,1
	sb	a5,0(a4)
	tail	_ZL4Syncv
	.size	_ZL9M233Resetv, .-_ZL9M233Resetv
	.section	.text._ZL9M226Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M226Powerv, @function
_ZL9M226Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	la a5, .LANCHOR2; sb zero, 0(a5);
	li	s0,65536
	la a5, .LANCHOR0; sh zero, 0(a5);
	call	_ZL4Syncv
	addi	a1,s0,-1
	lla	a2,_ZL9M226Writejh
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_Z6CartBRj
	li	a0,32768
	addi	sp,sp,12
	tail	_Z14SetReadHandleriiPFhjE
	.size	_ZL9M226Powerv, .-_ZL9M226Powerv
	.section	.text._Z14Mapper226_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper226_InitP8CartInfo
	.hidden	_Z14Mapper226_InitP8CartInfo
	.type	_Z14Mapper226_InitP8CartInfo, @function
_Z14Mapper226_InitP8CartInfo:
	addi	sp,sp,-12
	sw	ra,8(sp)
	lla	a5,_ZL9M226Powerv
	sw	a5,0(a0)
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR3
	la a5, .LANCHOR1; sb zero, 0(a5);
	call	_Z10AddExStatePvjiPKc
	lw	ra,8(sp)
	lla	a5,_ZL12StateRestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	addi	sp,sp,12
	jr	ra
	.size	_Z14Mapper226_InitP8CartInfo, .-_Z14Mapper226_InitP8CartInfo
	.section	.text._Z14Mapper233_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper233_InitP8CartInfo
	.hidden	_Z14Mapper233_InitP8CartInfo
	.type	_Z14Mapper233_InitP8CartInfo, @function
_Z14Mapper233_InitP8CartInfo:
	addi	sp,sp,-12
	sw	ra,8(sp)
	lla	a5,_ZL9M226Powerv
	sw	a5,0(a0)
	lla	a5,_ZL9M233Resetv
	sw	a5,4(a0)
	li	a3,0
	li	a5,1
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR3
	la a4, .LANCHOR1; sb a5, 0(a4);
	call	_Z10AddExStatePvjiPKc
	lw	ra,8(sp)
	lla	a5,_ZL12StateRestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	addi	sp,sp,12
	jr	ra
	.size	_Z14Mapper233_InitP8CartInfo, .-_Z14Mapper233_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"RST"
	.align	2
.LC1:
	.string	"LATC"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR3,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 36
_ZL9StateRegs:
	.word	_ZL5reset
	.word	1
	.word	.LC0
	.word	_ZL6latche
	.word	2
	.word	.LC1
	.word	0
	.zero	8
	.section	.sbss._ZL12isresetbased,"aw",@nobits
	.set	.LANCHOR1,. + 0
	.type	_ZL12isresetbased, @object
	.size	_ZL12isresetbased, 1
_ZL12isresetbased:
	.zero	1
	.section	.sbss._ZL5reset,"aw",@nobits
	.set	.LANCHOR2,. + 0
	.type	_ZL5reset, @object
	.size	_ZL5reset, 1
_ZL5reset:
	.zero	1
	.section	.sbss._ZL6latche,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL6latche, @object
	.size	_ZL6latche, 2
_ZL6latche:
	.zero	2
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
