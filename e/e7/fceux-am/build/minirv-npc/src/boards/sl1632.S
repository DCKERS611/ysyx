#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"sl1632.cpp"
	.option nopic
	.text
	.section	.text._ZL11UNLSL1632CWjh,"ax",@progbits
	.align	2
	.type	_ZL11UNLSL1632CWjh, @function
_ZL11UNLSL1632CWjh:
	addi	sp,sp,-24
	sw	s1,12(sp)
	lla	s1,DRegBuf
	lbu	a1,0(s1)
	sw	s0,16(sp)
	la a5, .LANCHOR0; lbu a5, 0(a5);
	la s0, MMC3_cmd; lbu s0, 0(s0);
	li	a3,4096
	slli	a4,a5,5
	slli	s0,s0,5
	and	s0,s0,a3
	andi	a2,a4,256
	andi	a1,a1,-2
	slli	a4,a5,3
	slli	a5,a5,1
	andi	a5,a5,256
	andi	a4,a4,256
	or	a1,a1,a2
	mv	a0,s0
	sw	ra,20(sp)
	sw	a5,8(sp)
	sw	a4,4(sp)
	sw	a2,0(sp)
	call	_Z7setchr1jj
	lw	a2,0(sp)
	lbu	a1,0(s1)
	ori	a0,s0,1024
	or	a1,a1,a2
	ori	a1,a1,1
	call	_Z7setchr1jj
	lbu	a1,1(s1)
	lw	a2,0(sp)
	li	a3,4096
	addi	a0,a3,-2048
	andi	a1,a1,-2
	xor	a0,s0,a0
	or	a1,a1,a2
	call	_Z7setchr1jj
	lw	a2,0(sp)
	lbu	a1,1(s1)
	li	a3,4096
	addi	a0,a3,-1024
	or	a1,a1,a2
	xor	a0,s0,a0
	ori	a1,a1,1
	call	_Z7setchr1jj
	lw	a4,4(sp)
	lbu	a1,2(s1)
	li	a3,4096
	xor	a0,s0,a3
	or	a1,a1,a4
	call	_Z7setchr1jj
	lw	a4,4(sp)
	lbu	a1,3(s1)
	li	a3,4096
	addi	a0,a3,1024
	xor	a0,s0,a0
	or	a1,a1,a4
	call	_Z7setchr1jj
	lw	a5,8(sp)
	lbu	a1,4(s1)
	li	a4,8192
	addi	a0,a4,-2048
	xor	a0,s0,a0
	or	a1,a1,a5
	call	_Z7setchr1jj
	li	a4,8192
	addi	a0,a4,-1024
	lbu	a1,5(s1)
	lw	a5,8(sp)
	xor	a0,s0,a0
	lw	s0,16(sp)
	lw	ra,20(sp)
	lw	s1,12(sp)
	or	a1,a1,a5
	addi	sp,sp,24
	tail	_Z7setchr1jj
	.size	_ZL11UNLSL1632CWjh, .-_ZL11UNLSL1632CWjh
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-12
	la a1, .LANCHOR1; lbu a1, 0(a1);
	li	a0,32768
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	call	_Z7setprg8jj
	la a1, .LANCHOR2; lbu a1, 0(a1);
	li	a0,40960
	call	_Z7setprg8jj
	li	a1,-2
	li	a0,49152
	call	_Z7setprg8jj
	li	a1,-1
	li	a0,57344
	call	_Z7setprg8jj
	lla	s1,.LANCHOR3
	li	s0,0
.L5:
	lbu	a1,0(s1)
	mv	a0,s0
	addi	s0,s0,1024
	call	_Z7setchr1jj
	li	a5,8192
	addi	s1,s1,1
	bne	s0,a5,.L5
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	la a0, .LANCHOR4; lbu a0, 0(a0);
	xori	a0,a0,1
	addi	sp,sp,12
	tail	_Z9setmirrori
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL14UNLSL1632Powerv,"ax",@progbits
	.align	2
	.type	_ZL14UNLSL1632Powerv, @function
_ZL14UNLSL1632Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_Z12GenMMC3Powerv
	lw	ra,8(sp)
	li	a1,65536
	li	a0,16384
	lla	a2,_ZL17UNLSL1632CMDWritejh
	addi	a1,a1,-1
	addi	a0,a0,256
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL14UNLSL1632Powerv, .-_ZL14UNLSL1632Powerv
	.section	.text._ZL17UNLSL1632CMDWritejh,"ax",@progbits
	.align	2
	.type	_ZL17UNLSL1632CMDWritejh, @function
_ZL17UNLSL1632CMDWritejh:
	addi	sp,sp,-12
	li	a5,40960
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	addi	a5,a5,305
	mv	s0,a0
	mv	s1,a1
	beq	a0,a5,.L21
	la a5, .LANCHOR0; lbu a5, 0(a5);
	andi	a5,a5,2
	bne	a5,zero,.L22
	li	a4,-45056
	li	a5,12288
	add	a4,a0,a4
	addi	a5,a5,3
	bgtu	a4,a5,.L13
	srli	a4,a0,10
	andi	a5,a0,2
	or	a5,a5,a4
	srli	a5,a5,1
	addi	a5,a5,2
	andi	a5,a5,7
	lla	a4,.LANCHOR3
	add	a4,a4,a5
	lbu	a5,0(a4)
	slli	s0,a0,2
	andi	s0,s0,4
	li	a3,240
	sra	a3,a3,s0
	andi	s1,a1,15
	and	a5,a5,a3
	sll	s1,s1,s0
	or	a5,a5,s1
	sb	a5,0(a4)
.L16:
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	tail	_ZL4Syncv
.L22:
	lla	a5,MMC3_cmd
	lbu	a0,0(a5)
	call	_Z10FixMMC3PRGi
	lla	a5,MMC3_cmd
	lbu	a0,0(a5)
	call	_Z10FixMMC3CHRi
	li	a5,49152
	bltu	s0,a5,.L19
	mv	a0,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	mv	a1,s1
	lw	s1,0(sp)
	addi	sp,sp,12
	tail	_Z13MMC3_IRQWritejh
.L21:
	la a5, .LANCHOR0; sb a1, 0(a5);
	andi	a5,a1,2
	bne	a5,zero,.L23
.L13:
	li	a5,61440
	addi	a5,a5,3
	and	a5,s0,a5
	li	a4,36864
	beq	a5,a4,.L17
	li	a4,40960
	beq	a5,a4,.L18
	li	a4,32768
	bne	a5,a4,.L16
	la a5, .LANCHOR1; sb s1, 0(a5);
	j	.L16
.L23:
	lla	a5,MMC3_cmd
	lbu	a0,0(a5)
	call	_Z10FixMMC3PRGi
	lla	a5,MMC3_cmd
	lbu	a0,0(a5)
	call	_Z10FixMMC3CHRi
.L19:
	mv	a0,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	mv	a1,s1
	lw	s1,0(sp)
	addi	sp,sp,12
	tail	_Z13MMC3_CMDWritejh
.L18:
	la a5, .LANCHOR2; sb s1, 0(a5);
	j	.L16
.L17:
	andi	s1,s1,1
	la a5, .LANCHOR4; sb s1, 0(a5);
	j	.L16
	.size	_ZL17UNLSL1632CMDWritejh, .-_ZL17UNLSL1632CMDWritejh
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	la a5, .LANCHOR0; lbu a5, 0(a5);
	andi	a5,a5,2
	beq	a5,zero,.L25
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,MMC3_cmd
	lbu	a0,0(s0)
	sw	ra,8(sp)
	call	_Z10FixMMC3PRGi
	lbu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_Z10FixMMC3CHRi
.L25:
	tail	_ZL4Syncv
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._Z14UNLSL1632_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14UNLSL1632_InitP8CartInfo
	.hidden	_Z14UNLSL1632_InitP8CartInfo
	.type	_Z14UNLSL1632_InitP8CartInfo, @function
_Z14UNLSL1632_InitP8CartInfo:
	addi	sp,sp,-12
	li	a4,0
	li	a3,0
	li	a2,512
	li	a1,256
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL11UNLSL1632CWjh
	la a4, cwrap; sw a5, 0(a4);
	lla	a5,_ZL14UNLSL1632Powerv
	sw	a5,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a5,_ZL12StateRestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR5
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14UNLSL1632_InitP8CartInfo, .-_Z14UNLSL1632_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"CHRC"
	.align	2
.LC1:
	.string	"PRG0"
	.align	2
.LC2:
	.string	"PRG1"
	.align	2
.LC3:
	.string	"BRK"
	.align	2
.LC4:
	.string	"MIRR"
	.align	2
.LC5:
	.string	"SWAP"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR5,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 84
_ZL9StateRegs:
	.word	_ZL6chrcmd
	.word	8
	.word	.LC0
	.word	_ZL4prg0
	.word	1
	.word	.LC1
	.word	_ZL4prg1
	.word	1
	.word	.LC2
	.word	_ZL4bbrk
	.word	1
	.word	.LC3
	.word	_ZL4mirr
	.word	1
	.word	.LC4
	.word	_ZL4swap
	.word	1
	.word	.LC5
	.word	0
	.zero	8
	.section	.sbss._ZL4bbrk,"aw",@nobits
	.set	.LANCHOR0,. + 0
	.type	_ZL4bbrk, @object
	.size	_ZL4bbrk, 1
_ZL4bbrk:
	.zero	1
	.section	.sbss._ZL4mirr,"aw",@nobits
	.set	.LANCHOR4,. + 0
	.type	_ZL4mirr, @object
	.size	_ZL4mirr, 1
_ZL4mirr:
	.zero	1
	.section	.sbss._ZL4prg0,"aw",@nobits
	.set	.LANCHOR1,. + 0
	.type	_ZL4prg0, @object
	.size	_ZL4prg0, 1
_ZL4prg0:
	.zero	1
	.section	.sbss._ZL4prg1,"aw",@nobits
	.set	.LANCHOR2,. + 0
	.type	_ZL4prg1, @object
	.size	_ZL4prg1, 1
_ZL4prg1:
	.zero	1
	.section	.sbss._ZL4swap,"aw",@nobits
	.type	_ZL4swap, @object
	.size	_ZL4swap, 1
_ZL4swap:
	.zero	1
	.section	.sbss._ZL6chrcmd,"aw",@nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	_ZL6chrcmd, @object
	.size	_ZL6chrcmd, 8
_ZL6chrcmd:
	.zero	8
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
