#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"28.cpp"
	.option nopic
	.text
	.section	.text._ZL8WriteEXPjh,"ax",@progbits
	.align	2
	.type	_ZL8WriteEXPjh, @function
_ZL8WriteEXPjh:
	andi	a1,a1,129
	la a5, .LANCHOR0; sb a1, 0(a5);
	ret
	.size	_ZL8WriteEXPjh, .-_ZL8WriteEXPjh
	.section	.text._ZL8M28Closev,"ax",@progbits
	.align	2
	.type	_ZL8M28Closev, @function
_ZL8M28Closev:
	ret
	.size	_ZL8M28Closev, .-_ZL8M28Closev
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	la a5, .LANCHOR2; lbu a5, 0(a5);
	andi	a5,a5,60
	lla	a3,.L7
	slli	a5,a5,2
	add	a5,a5,a3
	lw	a4,0(a5)
	addi	sp,sp,-12
	la a5, .LANCHOR1; lbu a5, 0(a5);
	add	a4,a4,a3
	sw	ra,8(sp)
	sw	s0,4(sp)
	slli	a5,a5,1
	jr	a4
	.section	.rodata._ZL4Syncv,"a",@progbits
	.align	2
	.align	2
.L7:
	.word	.L21-.L7
	.word	.L19-.L7
	.word	.L19-.L7
	.word	.L19-.L7
	.word	.L21-.L7
	.word	.L19-.L7
	.word	.L19-.L7
	.word	.L19-.L7
	.word	.L17-.L7
	.word	.L19-.L7
	.word	.L19-.L7
	.word	.L19-.L7
	.word	.L16-.L7
	.word	.L19-.L7
	.word	.L19-.L7
	.word	.L19-.L7
	.word	.L15-.L7
	.word	.L19-.L7
	.word	.L19-.L7
	.word	.L19-.L7
	.word	.L15-.L7
	.word	.L19-.L7
	.word	.L19-.L7
	.word	.L19-.L7
	.word	.L14-.L7
	.word	.L19-.L7
	.word	.L19-.L7
	.word	.L19-.L7
	.word	.L13-.L7
	.word	.L19-.L7
	.word	.L19-.L7
	.word	.L19-.L7
	.word	.L12-.L7
	.word	.L19-.L7
	.word	.L19-.L7
	.word	.L19-.L7
	.word	.L12-.L7
	.word	.L19-.L7
	.word	.L19-.L7
	.word	.L19-.L7
	.word	.L11-.L7
	.word	.L19-.L7
	.word	.L19-.L7
	.word	.L19-.L7
	.word	.L10-.L7
	.word	.L19-.L7
	.word	.L19-.L7
	.word	.L19-.L7
	.word	.L9-.L7
	.word	.L19-.L7
	.word	.L19-.L7
	.word	.L19-.L7
	.word	.L9-.L7
	.word	.L19-.L7
	.word	.L19-.L7
	.word	.L19-.L7
	.word	.L8-.L7
	.word	.L19-.L7
	.word	.L19-.L7
	.word	.L19-.L7
	.word	.L6-.L7
	.section	.text._ZL4Syncv
.L19:
	li	a4,0
	li	a5,0
.L5:
	la a1, .LANCHOR4; lw a1, 0(a1);
	and	s0,a1,a4
	li	a0,32768
	and	a1,a1,a5
	call	_Z8setprg16jj
	mv	a1,s0
	li	a0,49152
	call	_Z8setprg16jj
	lw	s0,4(sp)
	lw	ra,8(sp)
	la a0, .LANCHOR5; lbu a0, 0(a0);
	addi	sp,sp,12
	tail	_Z7setchr8j
.L15:
	la a4, .LANCHOR3; lbu a4, 0(a4);
	slli	a4,a4,1
	andi	a4,a4,2
	andi	a5,a5,-3
	or	a5,a4,a5
.L21:
	ori	a4,a5,1
	j	.L5
.L12:
	la a4, .LANCHOR3; lbu a4, 0(a4);
	slli	a4,a4,1
	andi	a4,a4,6
	andi	a5,a5,-7
	or	a5,a4,a5
	ori	a4,a5,1
	j	.L5
.L9:
	la a4, .LANCHOR3; lbu a4, 0(a4);
	slli	a4,a4,1
	andi	a4,a4,14
	andi	a5,a5,-15
	or	a5,a4,a5
	ori	a4,a5,1
	j	.L5
.L10:
	la a3, .LANCHOR3; lbu a3, 0(a3);
	andi	a3,a3,7
	andi	a2,a5,-7
	ori	a4,a5,1
	or	a5,a3,a2
	j	.L5
.L8:
	la a4, .LANCHOR3; lbu a4, 0(a4);
	andi	a4,a4,15
	andi	a3,a5,-15
	or	a4,a4,a3
	j	.L5
.L11:
	la a4, .LANCHOR3; lbu a4, 0(a4);
	andi	a4,a4,7
	andi	a3,a5,-7
	or	a4,a4,a3
	j	.L5
.L13:
	la a3, .LANCHOR3; lbu a3, 0(a3);
	andi	a3,a3,3
	andi	a2,a5,-3
	ori	a4,a5,1
	or	a5,a3,a2
	j	.L5
.L6:
	la a3, .LANCHOR3; lbu a3, 0(a3);
	andi	a3,a3,15
	andi	a2,a5,-15
	ori	a4,a5,1
	or	a5,a3,a2
	j	.L5
.L17:
	la a4, .LANCHOR3; lbu a4, 0(a4);
	andi	a4,a4,1
	or	a4,a4,a5
	j	.L5
.L16:
	la a3, .LANCHOR3; lbu a3, 0(a3);
	andi	a3,a3,1
	ori	a4,a5,1
	or	a5,a3,a5
	j	.L5
.L14:
	la a4, .LANCHOR3; lbu a4, 0(a4);
	andi	a4,a4,3
	andi	a3,a5,-3
	or	a4,a4,a3
	j	.L5
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	tail	_ZL4Syncv
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL8M28Resetv,"ax",@progbits
	.align	2
	.type	_ZL8M28Resetv, @function
_ZL8M28Resetv:
	li	a5,63
	la a4, .LANCHOR1; sb a5, 0(a4);
	li	a5,15
	la a4, .LANCHOR3; sb a5, 0(a4);
	tail	_ZL4Syncv
	.size	_ZL8M28Resetv, .-_ZL8M28Resetv
	.section	.text._ZL8M28Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M28Powerv, @function
_ZL8M28Powerv:
	la a5, PRGsize; lw a5, 0(a5);
	li	a1,24576
	addi	sp,sp,-12
	addi	a5,a5,-1
	lla	a2,_ZL8WriteEXPjh
	addi	a1,a1,-1
	li	a0,20480
	sw	ra,8(sp)
	sw	s0,4(sp)
	la a4, .LANCHOR4; sw a5, 0(a4);
	li	s0,65536
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lla	a2,_ZL8WritePRGjh
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	li	s0,32768
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lla	a2,_Z6CartBWjh
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	li	a5,63
	lw	s0,4(sp)
	lw	ra,8(sp)
	la a4, .LANCHOR1; sb a5, 0(a4);
	li	a5,15
	la a4, .LANCHOR3; sb a5, 0(a4);
	addi	sp,sp,12
	tail	_ZL4Syncv
	.size	_ZL8M28Powerv, .-_ZL8M28Powerv
	.section	.text._Z10SyncMirrorv,"ax",@progbits
	.align	2
	.globl	_Z10SyncMirrorv
	.hidden	_Z10SyncMirrorv
	.type	_Z10SyncMirrorv, @function
_Z10SyncMirrorv:
	la a5, .LANCHOR2; lbu a5, 0(a5);
	andi	a5,a5,3
	li	a4,2
	beq	a5,a4,.L27
	li	a4,3
	beq	a5,a4,.L28
	li	a4,1
	beq	a5,a4,.L29
	li	a0,2
	tail	_Z9setmirrori
.L27:
	li	a0,1
	tail	_Z9setmirrori
.L29:
	li	a0,3
	tail	_Z9setmirrori
.L28:
	li	a0,0
	tail	_Z9setmirrori
	.size	_Z10SyncMirrorv, .-_Z10SyncMirrorv
	.section	.text._ZL8WritePRGjh,"ax",@progbits
	.align	2
	.type	_ZL8WritePRGjh, @function
_ZL8WritePRGjh:
	addi	sp,sp,-12
	sw	ra,8(sp)
	la a5, .LANCHOR0; lbu a5, 0(a5);
	li	a4,128
	beq	a5,a4,.L31
	bgtu	a5,a4,.L32
	beq	a5,zero,.L33
	li	a4,1
	bne	a5,a4,.L30
	lla	a4,.LANCHOR2
	lbu	a5,0(a4)
	andi	a3,a1,15
	la a2, .LANCHOR3; sb a3, 0(a2);
	andi	a3,a5,2
	bne	a3,zero,.L42
	srli	a1,a1,4
	andi	a1,a1,1
	andi	a5,a5,-2
	or	a1,a1,a5
	sb	a1,0(a4)
.L42:
	call	_Z10SyncMirrorv
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_ZL4Syncv
.L32:
	li	a4,129
	bne	a5,a4,.L30
	lw	ra,8(sp)
	andi	a1,a1,63
	la a5, .LANCHOR1; sb a1, 0(a5);
	addi	sp,sp,12
	tail	_ZL4Syncv
.L30:
	lw	ra,8(sp)
	addi	sp,sp,12
	jr	ra
.L33:
	lla	a4,.LANCHOR2
	lbu	a5,0(a4)
	andi	a3,a1,3
	la a2, .LANCHOR5; sb a3, 0(a2);
	andi	a3,a5,2
	bne	a3,zero,.L42
	srli	a1,a1,4
	andi	a1,a1,1
	andi	a5,a5,-2
	or	a1,a1,a5
	sb	a1,0(a4)
	j	.L42
.L31:
	andi	a1,a1,63
	la a5, .LANCHOR2; sb a1, 0(a5);
	call	_Z10SyncMirrorv
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_ZL4Syncv
	.size	_ZL8WritePRGjh, .-_ZL8WritePRGjh
	.section	.text._Z6Mirrorh,"ax",@progbits
	.align	2
	.globl	_Z6Mirrorh
	.hidden	_Z6Mirrorh
	.type	_Z6Mirrorh, @function
_Z6Mirrorh:
	lla	a4,.LANCHOR2
	lbu	a5,0(a4)
	andi	a3,a5,2
	bne	a3,zero,.L44
	srli	a0,a0,4
	andi	a0,a0,1
	andi	a5,a5,-2
	or	a5,a0,a5
	sb	a5,0(a4)
.L44:
	andi	a5,a5,3
	li	a4,2
	beq	a5,a4,.L45
	li	a4,3
	beq	a5,a4,.L46
	li	a4,1
	beq	a5,a4,.L47
	li	a0,2
	tail	_Z9setmirrori
.L45:
	li	a0,1
	tail	_Z9setmirrori
.L47:
	li	a0,3
	tail	_Z9setmirrori
.L46:
	li	a0,0
	tail	_Z9setmirrori
	.size	_Z6Mirrorh, .-_Z6Mirrorh
	.section	.text._Z13Mapper28_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper28_InitP8CartInfo
	.hidden	_Z13Mapper28_InitP8CartInfo
	.type	_Z13Mapper28_InitP8CartInfo, @function
_Z13Mapper28_InitP8CartInfo:
	lla	a5,_ZL8M28Powerv
	sw	a5,0(a0)
	lla	a5,_ZL8M28Resetv
	sw	a5,4(a0)
	lla	a5,_ZL8M28Closev
	sw	a5,8(a0)
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR6
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z13Mapper28_InitP8CartInfo, .-_Z13Mapper28_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"REG"
	.align	2
.LC1:
	.string	"CHR"
	.align	2
.LC2:
	.string	"PRG"
	.align	2
.LC3:
	.string	"MODE"
	.align	2
.LC4:
	.string	"OUTR"
	.hidden	outer
	.globl	outer
	.hidden	mode
	.globl	mode
	.hidden	prg
	.globl	prg
	.hidden	chr
	.globl	chr
	.hidden	reg
	.globl	reg
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR6,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 72
_ZL9StateRegs:
	.word	reg
	.word	1
	.word	.LC0
	.word	chr
	.word	1
	.word	.LC1
	.word	prg
	.word	1
	.word	.LC2
	.word	mode
	.word	1
	.word	.LC3
	.word	outer
	.word	1
	.word	.LC4
	.word	0
	.zero	8
	.section	.sbss._ZL12prg_mask_16k,"aw",@nobits
	.align	2
	.set	.LANCHOR4,. + 0
	.type	_ZL12prg_mask_16k, @object
	.size	_ZL12prg_mask_16k, 4
_ZL12prg_mask_16k:
	.zero	4
	.section	.sbss.chr,"aw",@nobits
	.set	.LANCHOR5,. + 0
	.type	chr, @object
	.size	chr, 1
chr:
	.zero	1
	.section	.sbss.mode,"aw",@nobits
	.set	.LANCHOR2,. + 0
	.type	mode, @object
	.size	mode, 1
mode:
	.zero	1
	.section	.sbss.outer,"aw",@nobits
	.set	.LANCHOR1,. + 0
	.type	outer, @object
	.size	outer, 1
outer:
	.zero	1
	.section	.sbss.prg,"aw",@nobits
	.set	.LANCHOR3,. + 0
	.type	prg, @object
	.size	prg, 1
prg:
	.zero	1
	.section	.sbss.reg,"aw",@nobits
	.set	.LANCHOR0,. + 0
	.type	reg, @object
	.size	reg, 1
reg:
	.zero	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
