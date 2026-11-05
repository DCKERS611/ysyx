#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"tf-1201.cpp"
	.option nopic
	.text
	.section	.text._ZL7SyncPrgv,"ax",@progbits
	.align	2
	.type	_ZL7SyncPrgv, @function
_ZL7SyncPrgv:
	addi	sp,sp,-12
	la a5, .LANCHOR0; lbu a5, 0(a5);
	sw	ra,8(sp)
	andi	a5,a5,3
	beq	a5,zero,.L2
	li	a1,-2
	li	a0,32768
	call	_Z7setprg8jj
	la a1, .LANCHOR1; lbu a1, 0(a1);
	li	a0,49152
	call	_Z7setprg8jj
.L3:
	la a1, .LANCHOR2; lbu a1, 0(a1);
	li	a0,40960
	call	_Z7setprg8jj
	lw	ra,8(sp)
	li	a1,-1
	li	a0,57344
	addi	sp,sp,12
	tail	_Z7setprg8jj
.L2:
	la a1, .LANCHOR1; lbu a1, 0(a1);
	li	a0,32768
	call	_Z7setprg8jj
	li	a1,-2
	li	a0,49152
	call	_Z7setprg8jj
	j	.L3
	.size	_ZL7SyncPrgv, .-_ZL7SyncPrgv
	.section	.text._ZL19UNLTF1201IRQCounterv,"ax",@progbits
	.align	2
	.type	_ZL19UNLTF1201IRQCounterv, @function
_ZL19UNLTF1201IRQCounterv:
	la a5, .LANCHOR3; lbu a5, 0(a5);
	beq	a5,zero,.L6
	lla	a4,.LANCHOR4
	lbu	a5,0(a4)
	li	a3,237
	addi	a5,a5,1
	andi	a5,a5,0xff
	sb	a5,0(a4)
	beq	a5,a3,.L10
.L6:
	ret
.L10:
	li	a0,1
	tail	_Z14X6502_IRQBegini
	.size	_ZL19UNLTF1201IRQCounterv, .-_ZL19UNLTF1201IRQCounterv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	lla	s1,.LANCHOR5
	call	_ZL7SyncPrgv
	li	s0,0
.L12:
	lbu	a1,0(s1)
	mv	a0,s0
	addi	s0,s0,1024
	call	_Z7setchr1jj
	li	a5,8192
	addi	s1,s1,1
	bne	s0,a5,.L12
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	la a0, .LANCHOR6; lbu a0, 0(a0);
	xori	a0,a0,1
	addi	sp,sp,12
	tail	_Z9setmirrori
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL14UNLTF1201Powerv,"ax",@progbits
	.align	2
	.type	_ZL14UNLTF1201Powerv, @function
_ZL14UNLTF1201Powerv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	sw	ra,8(sp)
	sw	s1,0(sp)
	la a5, .LANCHOR3; sb zero, 0(a5);
	la a5, .LANCHOR4; sb zero, 0(a5);
	la a5, .LANCHOR7; sb zero, 0(a5);
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lla	a2,_ZL14UNLTF1201Writejh
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	lla	s1,.LANCHOR5
	call	_ZL7SyncPrgv
	li	s0,0
.L16:
	lbu	a1,0(s1)
	mv	a0,s0
	addi	s0,s0,1024
	call	_Z7setchr1jj
	li	a5,8192
	addi	s1,s1,1
	bne	s0,a5,.L16
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	la a0, .LANCHOR6; lbu a0, 0(a0);
	xori	a0,a0,1
	addi	sp,sp,12
	tail	_Z9setmirrori
	.size	_ZL14UNLTF1201Powerv, .-_ZL14UNLTF1201Powerv
	.section	.text._ZL14UNLTF1201Writejh,"ax",@progbits
	.align	2
	.type	_ZL14UNLTF1201Writejh, @function
_ZL14UNLTF1201Writejh:
	li	a4,61440
	srli	a5,a0,2
	addi	t1,a4,3
	and	a0,a0,t1
	andi	a5,a5,3
	addi	sp,sp,-12
	or	a5,a0,a5
	li	a2,-45056
	li	a3,12288
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	add	a2,a5,a2
	addi	a3,a3,3
	bleu	a2,a3,.L38
	li	a3,40960
	beq	a5,a3,.L22
	bgtu	a5,a3,.L23
	li	a4,36864
	beq	a5,a4,.L24
	addi	a4,a4,1
	bne	a5,a4,.L39
	andi	a1,a1,3
	la a5, .LANCHOR0; sb a1, 0(a5);
.L37:
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	tail	_ZL7SyncPrgv
.L23:
	addi	a3,a4,2
	beq	a5,a3,.L28
	bleu	a5,a3,.L40
	beq	a5,t1,.L31
.L19:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L40:
	bne	a5,a4,.L41
	lla	a4,.LANCHOR4
	lbu	a5,0(a4)
	andi	a1,a1,15
	andi	a5,a5,-16
	or	a5,a5,a1
	sb	a5,0(a4)
	j	.L19
.L41:
	addi	a4,a4,1
	bne	a5,a4,.L19
.L31:
	andi	a1,a1,2
	li	a0,1
	la a5, .LANCHOR3; sb a1, 0(a5);
	call	_Z12X6502_IRQEndi
	la a4, scanline; lw a4, 0(a4);
	li	a5,239
	bgt	a4,a5,.L19
	lla	a4,.LANCHOR4
	lbu	a5,0(a4)
	addi	a5,a5,-8
	sb	a5,0(a4)
	j	.L19
.L39:
	li	a4,32768
	bne	a5,a4,.L19
	la a5, .LANCHOR1; sb a1, 0(a5);
	j	.L37
.L38:
	srli	a3,a5,11
	andi	a4,a5,1
	addi	a3,a3,-6
	or	a3,a3,a4
	andi	a3,a3,7
	lla	a4,.LANCHOR5
	add	a3,a4,a3
	lbu	a2,0(a3)
	slli	a5,a5,1
	andi	a0,a5,4
	li	a5,240
	sra	a5,a5,a0
	andi	a1,a1,15
	and	a5,a2,a5
	sll	a1,a1,a0
	or	a5,a5,a1
	sb	a5,0(a3)
	mv	s1,a4
	li	s0,0
.L21:
	lbu	a1,0(s1)
	mv	a0,s0
	addi	s0,s0,1024
	call	_Z7setchr1jj
	li	a5,8192
	addi	s1,s1,1
	bne	s0,a5,.L21
	la a0, .LANCHOR6; lbu a0, 0(a0);
.L36:
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	xori	a0,a0,1
	addi	sp,sp,12
	tail	_Z9setmirrori
.L24:
	andi	a1,a1,1
	lla	a5,.LANCHOR6
	sb	a1,0(a5)
	lla	s1,.LANCHOR5
	li	s0,0
.L32:
	lbu	a1,0(s1)
	mv	a0,s0
	addi	s0,s0,1024
	call	_Z7setchr1jj
	li	a5,8192
	addi	s1,s1,1
	bne	s0,a5,.L32
	lla	a5,.LANCHOR6
	lbu	a0,0(a5)
	j	.L36
.L28:
	lla	a4,.LANCHOR4
	lbu	a5,0(a4)
	slli	a1,a1,4
	andi	a5,a5,15
	or	a5,a5,a1
	sb	a5,0(a4)
	j	.L19
.L22:
	la a5, .LANCHOR2; sb a1, 0(a5);
	j	.L37
	.size	_ZL14UNLTF1201Writejh, .-_ZL14UNLTF1201Writejh
	.section	.text._Z14UNLTF1201_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14UNLTF1201_InitP8CartInfo
	.hidden	_Z14UNLTF1201_InitP8CartInfo
	.type	_Z14UNLTF1201_InitP8CartInfo, @function
_Z14UNLTF1201_InitP8CartInfo:
	lla	a5,_ZL14UNLTF1201Powerv
	sw	a5,0(a0)
	lla	a5,_ZL19UNLTF1201IRQCounterv
	la a4, GameHBIRQHook; sw a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR8
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14UNLTF1201_InitP8CartInfo, .-_Z14UNLTF1201_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"PRG0"
	.align	2
.LC1:
	.string	"PRG1"
	.align	2
.LC2:
	.string	"MIRR"
	.align	2
.LC3:
	.string	"SWAP"
	.align	2
.LC4:
	.string	"CHR"
	.align	2
.LC5:
	.string	"IRQC"
	.align	2
.LC6:
	.string	"IRQP"
	.align	2
.LC7:
	.string	"IRQA"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR8,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 108
_ZL9StateRegs:
	.word	_ZL4prg0
	.word	1
	.word	.LC0
	.word	_ZL4prg0
	.word	1
	.word	.LC1
	.word	_ZL4mirr
	.word	1
	.word	.LC2
	.word	_ZL4swap
	.word	1
	.word	.LC3
	.word	_ZL3chr
	.word	8
	.word	.LC4
	.word	_ZL8IRQCount
	.word	1
	.word	.LC5
	.word	_ZL6IRQPre
	.word	1
	.word	.LC6
	.word	_ZL4IRQa
	.word	1
	.word	.LC7
	.word	0
	.zero	8
	.section	.sbss._ZL3chr,"aw",@nobits
	.align	2
	.set	.LANCHOR5,. + 0
	.type	_ZL3chr, @object
	.size	_ZL3chr, 8
_ZL3chr:
	.zero	8
	.section	.sbss._ZL4IRQa,"aw",@nobits
	.set	.LANCHOR3,. + 0
	.type	_ZL4IRQa, @object
	.size	_ZL4IRQa, 1
_ZL4IRQa:
	.zero	1
	.section	.sbss._ZL4mirr,"aw",@nobits
	.set	.LANCHOR6,. + 0
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
	.set	.LANCHOR0,. + 0
	.type	_ZL4swap, @object
	.size	_ZL4swap, 1
_ZL4swap:
	.zero	1
	.section	.sbss._ZL6IRQPre,"aw",@nobits
	.set	.LANCHOR7,. + 0
	.type	_ZL6IRQPre, @object
	.size	_ZL6IRQPre, 1
_ZL6IRQPre:
	.zero	1
	.section	.sbss._ZL8IRQCount,"aw",@nobits
	.set	.LANCHOR4,. + 0
	.type	_ZL8IRQCount, @object
	.size	_ZL8IRQCount, 1
_ZL8IRQCount:
	.zero	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
