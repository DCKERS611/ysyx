#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"67.cpp"
	.option nopic
	.text
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-12
	sw	s1,0(sp)
	lla	s1,.LANCHOR0
	lbu	a0,0(s1)
	sw	ra,8(sp)
	sw	s0,4(sp)
	call	_Z9setmirrori
	la a1, .LANCHOR1; lbu a1, 0(a1);
	li	a0,32768
	call	_Z8setprg16jj
	li	a1,-1
	li	a0,49152
	call	_Z8setprg16jj
	lla	s0,.LANCHOR2
	lbu	a1,0(s0)
	li	a0,0
	call	_Z7setchr2jj
	lbu	a1,1(s0)
	li	a0,4096
	addi	a0,a0,-2048
	call	_Z7setchr2jj
	lbu	a1,2(s0)
	li	a0,4096
	call	_Z7setchr2jj
	lbu	a1,3(s0)
	li	a0,8192
	addi	a0,a0,-2048
	call	_Z7setchr2jj
	lbu	a5,0(s1)
	li	a4,2
	beq	a5,a4,.L2
	bgtu	a5,a4,.L3
	li	a0,0
	beq	a5,zero,.L13
.L11:
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	tail	_Z9setmirrori
.L3:
	li	a4,3
	li	a0,3
	beq	a5,a4,.L11
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L13:
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	li	a0,1
	addi	sp,sp,12
	tail	_Z9setmirrori
.L2:
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
	.section	.text._ZL8M67Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M67Powerv, @function
_ZL8M67Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	la a5, .LANCHOR3; sb zero, 0(a5);
	li	s0,65536
	call	_ZL4Syncv
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_ZL8M67Writejh
	li	a0,32768
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL8M67Powerv, .-_ZL8M67Powerv
	.section	.text._ZL8M67Writejh,"ax",@progbits
	.align	2
	.type	_ZL8M67Writejh, @function
_ZL8M67Writejh:
	li	a4,65536
	addi	a4,a4,-2048
	and	a0,a0,a4
	li	a5,49152
	beq	a0,a5,.L18
	bgtu	a0,a5,.L19
	li	a4,45056
	addi	a4,a4,-2048
	beq	a0,a4,.L20
	bleu	a0,a4,.L30
	addi	a5,a5,-2048
	bne	a0,a5,.L31
	la a5, .LANCHOR2+3; sb a1, 0(a5);
	tail	_ZL4Syncv
.L19:
	li	a5,61440
	addi	a5,a5,-2048
	beq	a0,a5,.L26
	bleu	a0,a5,.L32
	bne	a0,a4,.L33
	la a5, .LANCHOR1; sb a1, 0(a5);
	tail	_ZL4Syncv
.L30:
	li	a5,36864
	addi	a5,a5,-2048
	beq	a0,a5,.L22
	li	a5,40960
	addi	a5,a5,-2048
	bne	a0,a5,.L34
	la a5, .LANCHOR2+1; sb a1, 0(a5);
	tail	_ZL4Syncv
.L32:
	li	a5,53248
	addi	a5,a5,-2048
	beq	a0,a5,.L18
	li	a5,57344
	addi	a5,a5,-2048
	bne	a0,a5,.L35
	andi	a1,a1,16
	li	a0,1
	la a5, .LANCHOR3; sb zero, 0(a5);
	la a5, .LANCHOR5; sb a1, 0(a5);
	tail	_Z12X6502_IRQEndi
.L31:
	ret
.L33:
	ret
.L18:
	lla	a3,.LANCHOR3
	lbu	a5,0(a3)
	lla	a0,.LANCHOR4
	lhu	t1,0(a0)
	xori	a2,a5,1
	slli	a4,a5,3
	li	a5,255
	sll	a5,a5,a4
	slli	a4,a2,3
	and	a5,a5,t1
	sll	a4,a1,a4
	or	a5,a5,a4
	sh	a5,0(a0)
	sb	a2,0(a3)
	ret
.L22:
	la a5, .LANCHOR2; sb a1, 0(a5);
	tail	_ZL4Syncv
.L26:
	andi	a1,a1,3
	la a5, .LANCHOR0; sb a1, 0(a5);
	tail	_ZL4Syncv
.L20:
	la a5, .LANCHOR2+2; sb a1, 0(a5);
	tail	_ZL4Syncv
.L34:
	ret
.L35:
	ret
	.size	_ZL8M67Writejh, .-_ZL8M67Writejh
	.section	.text._Z6M67IRQi,"ax",@progbits
	.align	2
	.globl	_Z6M67IRQi
	.hidden	_Z6M67IRQi
	.type	_Z6M67IRQi, @function
_Z6M67IRQi:
	la a5, .LANCHOR5; lbu a5, 0(a5);
	beq	a5,zero,.L41
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR4
	lhu	a5,0(s0)
	sw	ra,8(sp)
	sub	a0,a5,a0
	slli	a0,a0,16
	srai	a0,a0,16
	sh	a0,0(s0)
	ble	a0,zero,.L44
	lw	ra,8(sp)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
.L41:
	ret
.L44:
	li	a0,1
	call	_Z14X6502_IRQBegini
	la a5, .LANCHOR5; sb zero, 0(a5);
	li	a5,-1
	lw	ra,8(sp)
	sh	a5,0(s0)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
	.size	_Z6M67IRQi, .-_Z6M67IRQi
	.section	.text._Z13Mapper67_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper67_InitP8CartInfo
	.hidden	_Z13Mapper67_InitP8CartInfo
	.type	_Z13Mapper67_InitP8CartInfo, @function
_Z13Mapper67_InitP8CartInfo:
	lla	a5,_ZL8M67Powerv
	sw	a5,0(a0)
	lla	a5,_Z6M67IRQi
	la a4, MapIRQHook; sw a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR6
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z13Mapper67_InitP8CartInfo, .-_Z13Mapper67_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"PREG"
	.align	2
.LC1:
	.string	"STOG"
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
	.set	.LANCHOR6,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 96
_ZL9StateRegs:
	.word	_ZL4preg
	.word	1
	.word	.LC0
	.word	_ZL9suntoggle
	.word	1
	.word	.LC1
	.word	_ZL4creg
	.word	4
	.word	.LC2
	.word	_ZL4mirr
	.word	1
	.word	.LC3
	.word	_ZL4IRQa
	.word	1
	.word	.LC4
	.word	_ZL8IRQCount
	.word	2
	.word	.LC5
	.word	_ZL8IRQLatch
	.word	2
	.word	.LC6
	.word	0
	.zero	8
	.section	.sbss._ZL4IRQa,"aw",@nobits
	.set	.LANCHOR5,. + 0
	.type	_ZL4IRQa, @object
	.size	_ZL4IRQa, 1
_ZL4IRQa:
	.zero	1
	.section	.sbss._ZL4creg,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL4creg, @object
	.size	_ZL4creg, 4
_ZL4creg:
	.zero	4
	.section	.sbss._ZL4mirr,"aw",@nobits
	.set	.LANCHOR0,. + 0
	.type	_ZL4mirr, @object
	.size	_ZL4mirr, 1
_ZL4mirr:
	.zero	1
	.section	.sbss._ZL4preg,"aw",@nobits
	.set	.LANCHOR1,. + 0
	.type	_ZL4preg, @object
	.size	_ZL4preg, 1
_ZL4preg:
	.zero	1
	.section	.sbss._ZL8IRQCount,"aw",@nobits
	.align	1
	.set	.LANCHOR4,. + 0
	.type	_ZL8IRQCount, @object
	.size	_ZL8IRQCount, 2
_ZL8IRQCount:
	.zero	2
	.section	.sbss._ZL8IRQLatch,"aw",@nobits
	.align	1
	.type	_ZL8IRQLatch, @object
	.size	_ZL8IRQLatch, 2
_ZL8IRQLatch:
	.zero	2
	.section	.sbss._ZL9suntoggle,"aw",@nobits
	.set	.LANCHOR3,. + 0
	.type	_ZL9suntoggle, @object
	.size	_ZL9suntoggle, 1
_ZL9suntoggle:
	.zero	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
