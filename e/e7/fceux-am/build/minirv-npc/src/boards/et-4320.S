#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"et-4320.cpp"
	.option nopic
	.text
	.section	.text._ZL16BMC810131C_Closev,"ax",@progbits
	.align	2
	.type	_ZL16BMC810131C_Closev, @function
_ZL16BMC810131C_Closev:
	la a0, .LANCHOR0; lw a0, 0(a0);
	beq	a0,zero,.L7
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_Z10FCEU_gfreePv
	lw	ra,8(sp)
	la a5, .LANCHOR0; sw zero, 0(a5);
	addi	sp,sp,12
	jr	ra
.L7:
	la a5, .LANCHOR0; sw zero, 0(a5);
	ret
	.size	_ZL16BMC810131C_Closev, .-_ZL16BMC810131C_Closev
	.section	.text._ZL16BMC810131C_Resetv,"ax",@progbits
	.align	2
	.type	_ZL16BMC810131C_Resetv, @function
_ZL16BMC810131C_Resetv:
	la a5, EXPREGS; sb zero, 0(a5);
	tail	_Z12MMC3RegResetv
	.size	_ZL16BMC810131C_Resetv, .-_ZL16BMC810131C_Resetv
	.section	.text._ZL16BMC810131C_Powerv,"ax",@progbits
	.align	2
	.type	_ZL16BMC810131C_Powerv, @function
_ZL16BMC810131C_Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	la a5, EXPREGS; sb zero, 0(a5);
	call	_Z12GenMMC3Powerv
	lw	ra,8(sp)
	li	a1,32768
	lla	a2,_ZL16BMC810131C_Writejh
	addi	a1,a1,-1
	li	a0,24576
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL16BMC810131C_Powerv, .-_ZL16BMC810131C_Powerv
	.section	.text._ZL6TKSPPUj,"ax",@progbits
	.align	2
	.type	_ZL6TKSPPUj, @function
_ZL6TKSPPUj:
	srli	a0,a0,10
	la a5, EXPREGS; lbu a5, 0(a5);
	andi	a0,a0,7
	srli	a5,a5,3
	la a4, .LANCHOR1; sb a0, 0(a4);
	andi	a5,a5,1
	bne	a5,zero,.L16
	ret
.L16:
	lla	a5,.LANCHOR2
	add	a5,a5,a0
	lbu	a0,0(a5)
	addi	a0,a0,2
	tail	_Z9setmirrori
	.size	_ZL6TKSPPUj, .-_ZL6TKSPPUj
	.section	.text._ZL13BMC810131C_CWjh,"ax",@progbits
	.align	2
	.type	_ZL13BMC810131C_CWjh, @function
_ZL13BMC810131C_CWjh:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	lla	a3,EXPREGS
	lbu	a5,0(a3)
	mv	s1,a0
	mv	s0,a1
	srli	a4,a5,4
	andi	a4,a4,1
	bne	a4,zero,.L26
	slli	a1,a5,7
	li	a4,40
	andi	a5,a5,40
	andi	a1,a1,896
	beq	a5,a4,.L27
	andi	a5,s0,127
	or	a1,a5,a1
	call	_Z7setchr1jj
	lla	a3,EXPREGS
.L19:
	lbu	a5,0(a3)
	srli	a0,s1,10
	lla	a4,.LANCHOR2
	srli	s0,s0,7
	add	a4,a4,a0
	srli	a5,a5,3
	sb	s0,0(a4)
	andi	a5,a5,1
	beq	a5,zero,.L17
	la a5, .LANCHOR1; lbu a5, 0(a5);
	beq	a0,a5,.L28
.L17:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L26:
	mv	a2,a1
	mv	a1,a0
	li	a0,16
	call	_Z8setchr1rijj
	lla	a3,EXPREGS
	j	.L19
.L28:
	addi	a0,s0,2
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	tail	_Z9setmirrori
.L27:
	or	a1,s0,a1
	call	_Z7setchr1jj
	lla	a3,EXPREGS
	j	.L19
	.size	_ZL13BMC810131C_CWjh, .-_ZL13BMC810131C_CWjh
	.section	.text._ZL13BMC810131C_PWjh,"ax",@progbits
	.align	2
	.type	_ZL13BMC810131C_PWjh, @function
_ZL13BMC810131C_PWjh:
	la a5, EXPREGS; lbu a5, 0(a5);
	srli	a4,a5,3
	andi	a4,a4,1
	slli	a5,a5,4
	andi	a5,a5,112
	beq	a4,zero,.L30
	andi	a1,a1,31
	or	a1,a1,a5
	tail	_Z7setprg8jj
.L30:
	andi	a1,a1,15
	or	a1,a1,a5
	tail	_Z7setprg8jj
	.size	_ZL13BMC810131C_PWjh, .-_ZL13BMC810131C_PWjh
	.section	.text._ZL16BMC810131C_Writejh,"ax",@progbits
	.align	2
	.type	_ZL16BMC810131C_Writejh, @function
_ZL16BMC810131C_Writejh:
	la a5, A001B; lbu a5, 0(a5);
	andi	a4,a5,192
	li	a3,128
	mv	a5,a0
	bne	a4,a3,.L32
	lla	a3,EXPREGS
	lbu	a4,0(a3)
	andi	a4,a4,7
	beq	a4,zero,.L36
.L32:
	mv	a0,a5
	tail	_Z6CartBWjh
.L36:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,MMC3_cmd
	lbu	a0,0(s0)
	sw	ra,8(sp)
	andi	a5,a5,63
	sb	a5,0(a3)
	call	_Z10FixMMC3PRGi
	lbu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_Z10FixMMC3CHRi
	.size	_ZL16BMC810131C_Writejh, .-_ZL16BMC810131C_Writejh
	.section	.rodata._Z15BMC810131C_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"CHRR"
	.align	2
.LC1:
	.string	"EXPR"
	.section	.text._Z15BMC810131C_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z15BMC810131C_InitP8CartInfo
	.hidden	_Z15BMC810131C_InitP8CartInfo
	.type	_Z15BMC810131C_InitP8CartInfo, @function
_Z15BMC810131C_InitP8CartInfo:
	addi	sp,sp,-12
	li	a4,0
	li	a3,8
	li	a2,256
	li	a1,256
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	s1,.LANCHOR3
	li	a5,8192
	li	a0,8192
	sw	a5,0(s1)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s1)
	mv	a1,a0
	lla	a5,.LANCHOR0
	li	a3,1
	li	a0,16
	sw	a1,0(a5)
	call	_Z19SetupCartCHRMappingiPhji
	lla	a5,.LANCHOR0
	lw	a1,0(s1)
	lw	a0,0(a5)
	lla	a3,.LC0
	li	a2,0
	call	_Z10AddExStatePvjiPKc
	lla	a5,_ZL13BMC810131C_PWjh
	la a4, pwrap; sw a5, 0(a4);
	lla	a5,_ZL13BMC810131C_CWjh
	la a4, cwrap; sw a5, 0(a4);
	lla	a5,_ZL6TKSPPUj
	la a4, PPU_hook; sw a5, 0(a4);
	lla	a5,_ZL16BMC810131C_Powerv
	sw	a5,0(s0)
	lla	a5,_ZL16BMC810131C_Resetv
	sw	a5,4(s0)
	lla	a5,_ZL16BMC810131C_Closev
	sw	a5,8(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	lla	a3,.LC1
	li	a2,0
	li	a1,1
	lla	a0,EXPREGS
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z15BMC810131C_InitP8CartInfo, .-_Z15BMC810131C_InitP8CartInfo
	.section	.sbss._ZL10CHRRAMSize,"aw",@nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	_ZL10CHRRAMSize, @object
	.size	_ZL10CHRRAMSize, 4
_ZL10CHRRAMSize:
	.zero	4
	.section	.sbss._ZL6CHRRAM,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL6CHRRAM, @object
	.size	_ZL6CHRRAM, 4
_ZL6CHRRAM:
	.zero	4
	.section	.sbss._ZL6TKSMIR,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL6TKSMIR, @object
	.size	_ZL6TKSMIR, 8
_ZL6TKSMIR:
	.zero	8
	.section	.sbss._ZL9PPUCHRBus,"aw",@nobits
	.set	.LANCHOR1,. + 0
	.type	_ZL9PPUCHRBus, @object
	.size	_ZL9PPUCHRBus, 1
_ZL9PPUCHRBus:
	.zero	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
