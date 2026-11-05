#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"bmc70in1.cpp"
	.option nopic
	.text
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	la a5, .LANCHOR0; lbu a5, 0(a5);
	li	a4,32
	beq	a5,a4,.L2
	bgtu	a5,a4,.L3
	andi	a5,a5,239
	beq	a5,zero,.L10
.L5:
	la a0, .LANCHOR3; lbu a0, 0(a0);
	call	_Z9setmirrori
	la a5, .LANCHOR4; lbu a5, 0(a5);
	beq	a5,zero,.L11
.L1:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L3:
	li	a4,48
	bne	a5,a4,.L5
	lla	s1,.LANCHOR1
	lla	s0,.LANCHOR2
	lbu	a5,0(s0)
	lbu	a1,0(s1)
	li	a0,32768
	or	a1,a1,a5
	call	_Z8setprg16jj
	lbu	a5,0(s0)
	lbu	a1,0(s1)
	li	a0,49152
	or	a1,a1,a5
	call	_Z8setprg16jj
	la a0, .LANCHOR3; lbu a0, 0(a0);
	call	_Z9setmirrori
	la a5, .LANCHOR4; lbu a5, 0(a5);
	bne	a5,zero,.L1
.L11:
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	la a0, .LANCHOR5; lbu a0, 0(a0);
	addi	sp,sp,12
	tail	_Z7setchr8j
.L10:
	lla	s0,.LANCHOR1
	lbu	a1,0(s0)
	la a5, .LANCHOR2; lbu a5, 0(a5);
	li	a0,32768
	or	a1,a1,a5
	call	_Z8setprg16jj
	lbu	a1,0(s0)
	li	a0,49152
	ori	a1,a1,7
	call	_Z8setprg16jj
	j	.L5
.L2:
	la a5, .LANCHOR2; lbu a5, 0(a5);
	la a1, .LANCHOR1; lbu a1, 0(a1);
	or	a1,a1,a5
	srli	a1,a1,1
	li	a0,32768
	call	_Z8setprg32jj
	j	.L5
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	tail	_ZL4Syncv
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL13BMC70in1Resetv,"ax",@progbits
	.align	2
	.type	_ZL13BMC70in1Resetv, @function
_ZL13BMC70in1Resetv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	la a5, .LANCHOR0; sb zero, 0(a5);
	la a5, .LANCHOR1; sb zero, 0(a5);
	call	_ZL4Syncv
	lla	a4,.LANCHOR6
	lbu	a5,0(a4)
	addi	a5,a5,1
	andi	a5,a5,15
	sb	a5,0(a4)
	lw	ra,8(sp)
	addi	sp,sp,12
	jr	ra
	.size	_ZL13BMC70in1Resetv, .-_ZL13BMC70in1Resetv
	.section	.text._ZL13BMC70in1Writejh,"ax",@progbits
	.align	2
	.type	_ZL13BMC70in1Writejh, @function
_ZL13BMC70in1Writejh:
	li	a4,16384
	and	a4,a0,a4
	andi	a5,a0,0xff
	beq	a4,zero,.L16
	andi	a4,a5,48
	andi	a5,a5,7
	la a3, .LANCHOR0; sb a4, 0(a3);
	la a4, .LANCHOR2; sb a5, 0(a4);
	tail	_ZL4Syncv
.L16:
	srli	a0,a0,5
	xori	a0,a0,1
	andi	a0,a0,1
	la a4, .LANCHOR3; sb a0, 0(a4);
	la a4, .LANCHOR4; lbu a4, 0(a4);
	beq	a4,zero,.L18
	slli	a5,a5,3
	andi	a5,a5,24
	la a4, .LANCHOR1; sb a5, 0(a4);
	tail	_ZL4Syncv
.L18:
	andi	a5,a5,7
	la a4, .LANCHOR5; sb a5, 0(a4);
	tail	_ZL4Syncv
	.size	_ZL13BMC70in1Writejh, .-_ZL13BMC70in1Writejh
	.section	.text._ZL13BMC70in1Powerv,"ax",@progbits
	.align	2
	.type	_ZL13BMC70in1Powerv, @function
_ZL13BMC70in1Powerv:
	addi	sp,sp,-12
	li	a0,0
	sw	ra,8(sp)
	sw	s0,4(sp)
	call	_Z7setchr8j
	li	s0,65536
	la a5, .LANCHOR0; sb zero, 0(a5);
	la a5, .LANCHOR1; sb zero, 0(a5);
	call	_ZL4Syncv
	addi	a1,s0,-1
	lla	a2,_ZL12BMC70in1Readj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_ZL13BMC70in1Writejh
	li	a0,32768
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL13BMC70in1Powerv, .-_ZL13BMC70in1Powerv
	.section	.text._ZL12BMC70in1Readj,"ax",@progbits
	.align	2
	.type	_ZL12BMC70in1Readj, @function
_ZL12BMC70in1Readj:
	la a3, .LANCHOR0; lbu a3, 0(a3);
	li	a4,16
	beq	a3,a4,.L23
	tail	_Z6CartBRj
.L23:
	li	a4,65536
	addi	a4,a4,-16
	and	a0,a0,a4
	la a5, .LANCHOR6; lbu a5, 0(a5);
	or	a0,a0,a5
	tail	_Z6CartBRj
	.size	_ZL12BMC70in1Readj, .-_ZL12BMC70in1Readj
	.section	.text._Z13BMC70in1_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13BMC70in1_InitP8CartInfo
	.hidden	_Z13BMC70in1_InitP8CartInfo
	.type	_Z13BMC70in1_InitP8CartInfo, @function
_Z13BMC70in1_InitP8CartInfo:
	li	a5,13
	la a4, .LANCHOR6; sb a5, 0(a4);
	lla	a5,_ZL13BMC70in1Powerv
	sw	a5,0(a0)
	lla	a5,_ZL13BMC70in1Resetv
	sw	a5,4(a0)
	la a5, .LANCHOR4; sb zero, 0(a5);
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR7
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z13BMC70in1_InitP8CartInfo, .-_Z13BMC70in1_InitP8CartInfo
	.section	.text._Z14BMC70in1B_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14BMC70in1B_InitP8CartInfo
	.hidden	_Z14BMC70in1B_InitP8CartInfo
	.type	_Z14BMC70in1B_InitP8CartInfo, @function
_Z14BMC70in1B_InitP8CartInfo:
	li	a5,6
	la a4, .LANCHOR6; sb a5, 0(a4);
	lla	a5,_ZL13BMC70in1Powerv
	sw	a5,0(a0)
	lla	a5,_ZL13BMC70in1Resetv
	sw	a5,4(a0)
	li	a5,1
	la a4, .LANCHOR4; sb a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR7
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14BMC70in1B_InitP8CartInfo, .-_Z14BMC70in1B_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"LB"
	.align	2
.LC1:
	.string	"DPSW"
	.align	2
.LC2:
	.string	"PRG"
	.align	2
.LC3:
	.string	"CHR"
	.align	2
.LC4:
	.string	"BM"
	.align	2
.LC5:
	.string	"MIRR"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR7,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 84
_ZL9StateRegs:
	.word	_ZL10large_bank
	.word	1
	.word	.LC0
	.word	_ZL9hw_switch
	.word	1
	.word	.LC1
	.word	_ZL8prg_bank
	.word	1
	.word	.LC2
	.word	_ZL8chr_bank
	.word	1
	.word	.LC3
	.word	_ZL9bank_mode
	.word	1
	.word	.LC4
	.word	_ZL9mirroring
	.word	1
	.word	.LC5
	.word	0
	.zero	8
	.section	.sbss._ZL10large_bank,"aw",@nobits
	.set	.LANCHOR1,. + 0
	.type	_ZL10large_bank, @object
	.size	_ZL10large_bank, 1
_ZL10large_bank:
	.zero	1
	.section	.sbss._ZL14is_large_banks,"aw",@nobits
	.set	.LANCHOR4,. + 0
	.type	_ZL14is_large_banks, @object
	.size	_ZL14is_large_banks, 1
_ZL14is_large_banks:
	.zero	1
	.section	.sbss._ZL8chr_bank,"aw",@nobits
	.set	.LANCHOR5,. + 0
	.type	_ZL8chr_bank, @object
	.size	_ZL8chr_bank, 1
_ZL8chr_bank:
	.zero	1
	.section	.sbss._ZL8prg_bank,"aw",@nobits
	.set	.LANCHOR2,. + 0
	.type	_ZL8prg_bank, @object
	.size	_ZL8prg_bank, 1
_ZL8prg_bank:
	.zero	1
	.section	.sbss._ZL9bank_mode,"aw",@nobits
	.set	.LANCHOR0,. + 0
	.type	_ZL9bank_mode, @object
	.size	_ZL9bank_mode, 1
_ZL9bank_mode:
	.zero	1
	.section	.sbss._ZL9hw_switch,"aw",@nobits
	.set	.LANCHOR6,. + 0
	.type	_ZL9hw_switch, @object
	.size	_ZL9hw_switch, 1
_ZL9hw_switch:
	.zero	1
	.section	.sbss._ZL9mirroring,"aw",@nobits
	.set	.LANCHOR3,. + 0
	.type	_ZL9mirroring, @object
	.size	_ZL9mirroring, 1
_ZL9mirroring:
	.zero	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
