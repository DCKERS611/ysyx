#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"n625092.cpp"
	.option nopic
	.text
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR0
	lhu	a0,0(s0)
	sw	ra,8(sp)
	sw	s1,0(sp)
	not	a0,a0
	andi	a0,a0,1
	call	_Z9setmirrori
	li	a0,0
	call	_Z7setchr8j
	lhu	a5,0(s0)
	andi	a4,a5,2
	beq	a4,zero,.L2
	srli	a4,a5,2
	lla	s1,.LANCHOR1
	andi	a5,a5,256
	lhu	a1,0(s1)
	andi	a4,a4,63
	bne	a5,zero,.L7
	andi	a1,a1,6
	or	a1,a4,a1
	li	a0,32768
	call	_Z8setprg16jj
	lhu	a1,0(s0)
	lhu	a5,0(s1)
	lw	s0,4(sp)
	srli	a1,a1,2
	lw	ra,8(sp)
	lw	s1,0(sp)
	andi	a1,a1,63
	andi	a5,a5,6
	or	a1,a1,a5
	li	a0,49152
	ori	a1,a1,1
	addi	sp,sp,12
	tail	_Z8setprg16jj
.L7:
	or	a1,a1,a4
	li	a0,32768
	call	_Z8setprg16jj
	lhu	a1,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	srli	a1,a1,2
	andi	a1,a1,56
	li	a0,49152
	ori	a1,a1,7
	addi	sp,sp,12
	tail	_Z8setprg16jj
.L2:
	lla	s1,.LANCHOR1
	lhu	a1,0(s1)
	srli	a5,a5,2
	andi	a5,a5,63
	or	a1,a5,a1
	li	a0,32768
	call	_Z8setprg16jj
	lhu	a5,0(s0)
	lhu	a1,0(s1)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	srli	a5,a5,2
	andi	a5,a5,63
	li	a0,49152
	or	a1,a5,a1
	addi	sp,sp,12
	tail	_Z8setprg16jj
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	tail	_ZL4Syncv
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL19UNLN625092WriteBankjh,"ax",@progbits
	.align	2
	.type	_ZL19UNLN625092WriteBankjh, @function
_ZL19UNLN625092WriteBankjh:
	andi	a0,a0,7
	la a5, .LANCHOR1; sh a0, 0(a5);
	tail	_ZL4Syncv
	.size	_ZL19UNLN625092WriteBankjh, .-_ZL19UNLN625092WriteBankjh
	.section	.text._ZL15UNLN625092Powerv,"ax",@progbits
	.align	2
	.type	_ZL15UNLN625092Powerv, @function
_ZL15UNLN625092Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	la a5, .LANCHOR0; sh zero, 0(a5);
	li	s0,65536
	la a5, .LANCHOR1; sh zero, 0(a5);
	call	_ZL4Syncv
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	li	a1,49152
	lla	a2,_ZL22UNLN625092WriteCommandjh
	addi	a1,a1,-1
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_ZL19UNLN625092WriteBankjh
	li	a0,49152
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL15UNLN625092Powerv, .-_ZL15UNLN625092Powerv
	.section	.rodata._ZL15UNLN625092Resetv.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"%04x\n"
	.section	.text._ZL15UNLN625092Resetv,"ax",@progbits
	.align	2
	.type	_ZL15UNLN625092Resetv, @function
_ZL15UNLN625092Resetv:
	lla	a5,.LANCHOR2
	lhu	a1,0(a5)
	lla	a0,.LC0
	la a4, .LANCHOR0; sh zero, 0(a4);
	addi	a1,a1,1
	slli	a1,a1,16
	srli	a1,a1,16
	la a4, .LANCHOR1; sh zero, 0(a4);
	sh	a1,0(a5)
	tail	printf
	.size	_ZL15UNLN625092Resetv, .-_ZL15UNLN625092Resetv
	.section	.text._ZL22UNLN625092WriteCommandjh,"ax",@progbits
	.align	2
	.type	_ZL22UNLN625092WriteCommandjh, @function
_ZL22UNLN625092WriteCommandjh:
	la a5, .LANCHOR0; sh a0, 0(a5);
	li	a5,32768
	addi	a5,a5,248
	beq	a0,a5,.L18
	tail	_ZL4Syncv
.L18:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR2
	lhu	a1,0(s0)
	li	a0,32768
	sw	ra,8(sp)
	call	_Z8setprg16jj
	lhu	a1,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a0,49152
	addi	sp,sp,12
	tail	_Z8setprg16jj
	.size	_ZL22UNLN625092WriteCommandjh, .-_ZL22UNLN625092WriteCommandjh
	.section	.text._Z15UNLN625092_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z15UNLN625092_InitP8CartInfo
	.hidden	_Z15UNLN625092_InitP8CartInfo
	.type	_Z15UNLN625092_InitP8CartInfo, @function
_Z15UNLN625092_InitP8CartInfo:
	lla	a5,_ZL15UNLN625092Powerv
	sw	a5,0(a0)
	lla	a5,_ZL15UNLN625092Resetv
	sw	a5,4(a0)
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR3
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z15UNLN625092_InitP8CartInfo, .-_Z15UNLN625092_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"CMD"
	.align	2
.LC2:
	.string	"BANK"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR3,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 36
_ZL9StateRegs:
	.word	_ZL3cmd
	.word	2
	.word	.LC1
	.word	_ZL4bank
	.word	2
	.word	.LC2
	.word	0
	.zero	8
	.section	.sbss._ZL3ass,"aw",@nobits
	.align	1
	.set	.LANCHOR2,. + 0
	.type	_ZL3ass, @object
	.size	_ZL3ass, 2
_ZL3ass:
	.zero	2
	.section	.sbss._ZL3cmd,"aw",@nobits
	.align	1
	.set	.LANCHOR0,. + 0
	.type	_ZL3cmd, @object
	.size	_ZL3cmd, 2
_ZL3cmd:
	.zero	2
	.section	.sbss._ZL4bank,"aw",@nobits
	.align	1
	.set	.LANCHOR1,. + 0
	.type	_ZL4bank, @object
	.size	_ZL4bank, 2
_ZL4bank:
	.zero	2
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
