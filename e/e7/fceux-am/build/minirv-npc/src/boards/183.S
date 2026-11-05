#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"183.cpp"
	.option nopic
	.text
	.section	.text._ZL7SyncPrgv,"ax",@progbits
	.align	2
	.type	_ZL7SyncPrgv, @function
_ZL7SyncPrgv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR0
	lbu	a1,3(s0)
	li	a0,24576
	sw	ra,8(sp)
	call	_Z7setprg8jj
	lbu	a1,0(s0)
	li	a0,32768
	call	_Z7setprg8jj
	lbu	a1,1(s0)
	li	a0,40960
	call	_Z7setprg8jj
	lbu	a1,2(s0)
	li	a0,49152
	call	_Z7setprg8jj
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a1,-1
	li	a0,57344
	addi	sp,sp,12
	tail	_Z7setprg8jj
	.size	_ZL7SyncPrgv, .-_ZL7SyncPrgv
	.section	.text._ZL8SyncMirrv,"ax",@progbits
	.align	2
	.type	_ZL8SyncMirrv, @function
_ZL8SyncMirrv:
	la a5, .LANCHOR1; lbu a5, 0(a5);
	li	a4,2
	beq	a5,a4,.L5
	bgtu	a5,a4,.L6
	beq	a5,zero,.L13
	li	a0,0
	tail	_Z9setmirrori
.L6:
	li	a4,3
	bne	a5,a4,.L14
	li	a0,3
	tail	_Z9setmirrori
.L14:
	ret
.L13:
	li	a0,1
	tail	_Z9setmirrori
.L5:
	li	a0,2
	tail	_Z9setmirrori
	.size	_ZL8SyncMirrv, .-_ZL8SyncMirrv
	.section	.text._ZL9M183Writejh,"ax",@progbits
	.align	2
	.type	_ZL9M183Writejh, @function
_ZL9M183Writejh:
	li	a5,65536
	addi	a4,a5,-2048
	and	a3,a0,a4
	li	a4,28672
	addi	a4,a4,-2048
	beq	a3,a4,.L36
	addi	a5,a5,-2036
	and	a5,a0,a5
	li	a3,-45056
	li	a4,12288
	add	a3,a5,a3
	addi	a4,a4,12
	bleu	a3,a4,.L37
	li	a4,61440
	beq	a5,a4,.L20
	bgtu	a5,a4,.L21
	li	a4,40960
	beq	a5,a4,.L22
	bleu	a5,a4,.L38
	li	a4,45056
	addi	a4,a4,-2048
	bne	a5,a4,.L39
	la a5, .LANCHOR0+1; sb a1, 0(a5);
	tail	_ZL7SyncPrgv
.L38:
	li	a3,36864
	addi	a3,a3,-2048
	beq	a5,a3,.L24
	addi	a4,a4,-2048
	bne	a5,a4,.L40
	andi	a1,a1,3
	la a5, .LANCHOR1; sb a1, 0(a5);
	tail	_ZL8SyncMirrv
.L21:
	addi	a3,a4,8
	beq	a5,a3,.L27
	addi	a3,a4,12
	bne	a5,a3,.L41
	li	a5,16
	la a4, .LANCHOR5; sb a5, 0(a4);
	ret
.L41:
	addi	a4,a4,4
	bne	a5,a4,.L42
	lla	a4,.LANCHOR3
	lbu	a5,0(a4)
	slli	a1,a1,4
	andi	a5,a5,15
	or	a5,a5,a1
	sb	a5,0(a4)
	ret
.L37:
	srli	a4,a0,11
	srli	a5,a0,3
	addi	a4,a4,-6
	or	a4,a4,a5
	addi	sp,sp,-12
	lla	a5,.LANCHOR2
	andi	a4,a4,7
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	add	a4,a5,a4
	lbu	a3,0(a4)
	andi	a0,a0,4
	li	a2,240
	sra	a2,a2,a0
	andi	a1,a1,15
	and	a3,a3,a2
	sll	a1,a1,a0
	or	a3,a3,a1
	sb	a3,0(a4)
	mv	s1,a5
	li	s0,0
.L18:
	lbu	a1,0(s1)
	mv	a0,s0
	addi	s0,s0,1024
	call	_Z7setchr1jj
	li	a5,8192
	addi	s1,s1,1
	bne	s0,a5,.L18
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L36:
	andi	a0,a0,63
	la a5, .LANCHOR0+3; sb a0, 0(a5);
	tail	_ZL7SyncPrgv
.L24:
	la a5, .LANCHOR0; sb a1, 0(a5);
	tail	_ZL7SyncPrgv
.L27:
	la a5, .LANCHOR4; sb a1, 0(a5);
	bne	a1,zero,.L30
	la a5, .LANCHOR5; sb zero, 0(a5);
.L30:
	li	a0,1
	tail	_Z12X6502_IRQEndi
.L22:
	la a5, .LANCHOR0+2; sb a1, 0(a5);
	tail	_ZL7SyncPrgv
.L39:
	ret
.L20:
	lla	a4,.LANCHOR3
	lbu	a5,0(a4)
	andi	a1,a1,15
	andi	a5,a5,-16
	or	a5,a5,a1
	sb	a5,0(a4)
	ret
.L40:
	ret
.L42:
	ret
	.size	_ZL9M183Writejh, .-_ZL9M183Writejh
	.section	.text._ZL14M183IRQCounterv,"ax",@progbits
	.align	2
	.type	_ZL14M183IRQCounterv, @function
_ZL14M183IRQCounterv:
	la a5, .LANCHOR4; lbu a5, 0(a5);
	beq	a5,zero,.L43
	lla	a4,.LANCHOR3
	lbu	a5,0(a4)
	la a3, .LANCHOR5; lbu a3, 0(a3);
	addi	a5,a5,1
	andi	a5,a5,0xff
	sb	a5,0(a4)
	addi	a5,a5,-238
	beq	a5,a3,.L47
.L43:
	ret
.L47:
	li	a0,1
	tail	_Z14X6502_IRQBegini
	.size	_ZL14M183IRQCounterv, .-_ZL14M183IRQCounterv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	lla	s1,.LANCHOR2
	call	_ZL7SyncPrgv
	li	s0,0
.L49:
	lbu	a1,0(s1)
	mv	a0,s0
	addi	s0,s0,1024
	call	_Z7setchr1jj
	li	a5,8192
	addi	s1,s1,1
	bne	s0,a5,.L49
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	tail	_ZL8SyncMirrv
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL9M183Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M183Powerv, @function
_ZL9M183Powerv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,24576
	sw	ra,8(sp)
	sw	s1,0(sp)
	la a5, .LANCHOR4; sb zero, 0(a5);
	la a5, .LANCHOR3; sb zero, 0(a5);
	la a5, .LANCHOR5; sb zero, 0(a5);
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lla	a2,_ZL9M183Writejh
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	lla	s1,.LANCHOR2
	call	_ZL7SyncPrgv
	li	s0,0
.L53:
	lbu	a1,0(s1)
	mv	a0,s0
	addi	s0,s0,1024
	call	_Z7setchr1jj
	li	a5,8192
	addi	s1,s1,1
	bne	s0,a5,.L53
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
	.size	_ZL9M183Powerv, .-_ZL9M183Powerv
	.section	.text._Z14Mapper183_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper183_InitP8CartInfo
	.hidden	_Z14Mapper183_InitP8CartInfo
	.type	_Z14Mapper183_InitP8CartInfo, @function
_Z14Mapper183_InitP8CartInfo:
	lla	a5,_ZL9M183Powerv
	sw	a5,0(a0)
	lla	a5,_ZL14M183IRQCounterv
	la a4, GameHBIRQHook; sw a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR6
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper183_InitP8CartInfo, .-_Z14Mapper183_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"PRG"
	.align	2
.LC1:
	.string	"CHR"
	.align	2
.LC2:
	.string	"MIRR"
	.align	2
.LC3:
	.string	"IRQC"
	.align	2
.LC4:
	.string	"IRQP"
	.align	2
.LC5:
	.string	"IRQA"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR6,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 84
_ZL9StateRegs:
	.word	_ZL3prg
	.word	4
	.word	.LC0
	.word	_ZL3chr
	.word	8
	.word	.LC1
	.word	_ZL4mirr
	.word	1
	.word	.LC2
	.word	_ZL8IRQCount
	.word	1
	.word	.LC3
	.word	_ZL6IRQPre
	.word	1
	.word	.LC4
	.word	_ZL4IRQa
	.word	1
	.word	.LC5
	.word	0
	.zero	8
	.section	.sbss._ZL3chr,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL3chr, @object
	.size	_ZL3chr, 8
_ZL3chr:
	.zero	8
	.section	.sbss._ZL3prg,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL3prg, @object
	.size	_ZL3prg, 4
_ZL3prg:
	.zero	4
	.section	.sbss._ZL4IRQa,"aw",@nobits
	.set	.LANCHOR4,. + 0
	.type	_ZL4IRQa, @object
	.size	_ZL4IRQa, 1
_ZL4IRQa:
	.zero	1
	.section	.sbss._ZL4mirr,"aw",@nobits
	.set	.LANCHOR1,. + 0
	.type	_ZL4mirr, @object
	.size	_ZL4mirr, 1
_ZL4mirr:
	.zero	1
	.section	.sbss._ZL6IRQPre,"aw",@nobits
	.set	.LANCHOR5,. + 0
	.type	_ZL6IRQPre, @object
	.size	_ZL6IRQPre, 1
_ZL6IRQPre:
	.zero	1
	.section	.sbss._ZL8IRQCount,"aw",@nobits
	.set	.LANCHOR3,. + 0
	.type	_ZL8IRQCount, @object
	.size	_ZL8IRQCount, 1
_ZL8IRQCount:
	.zero	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
