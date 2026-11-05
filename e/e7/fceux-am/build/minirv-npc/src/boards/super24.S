#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"super24.cpp"
	.option nopic
	.text
	.section	.text._ZL9Super24PWjh,"ax",@progbits
	.align	2
	.type	_ZL9Super24PWjh, @function
_ZL9Super24PWjh:
	lla	a4,EXPREGS
	lbu	a5,0(a4)
	lla	a3,.LANCHOR0
	lbu	a4,1(a4)
	andi	a5,a5,7
	slli	a5,a5,2
	add	a5,a3,a5
	lw	a5,0(a5)
	slli	a4,a4,1
	and	a2,a1,a5
	or	a2,a2,a4
	mv	a1,a0
	srli	a0,a2,6
	tail	_Z8setprg8rijj
	.size	_ZL9Super24PWjh, .-_ZL9Super24PWjh
	.section	.text._ZL12Super24Closev,"ax",@progbits
	.align	2
	.type	_ZL12Super24Closev, @function
_ZL12Super24Closev:
	la a0, .LANCHOR1; lw a0, 0(a0);
	beq	a0,zero,.L9
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_Z10FCEU_gfreePv
	lw	ra,8(sp)
	la a5, .LANCHOR1; sw zero, 0(a5);
	addi	sp,sp,12
	jr	ra
.L9:
	la a5, .LANCHOR1; sw zero, 0(a5);
	ret
	.size	_ZL12Super24Closev, .-_ZL12Super24Closev
	.section	.text._ZL12Super24Resetv,"ax",@progbits
	.align	2
	.type	_ZL12Super24Resetv, @function
_ZL12Super24Resetv:
	lla	a5,EXPREGS
	li	a4,36
	sb	a4,0(a5)
	li	a4,-97
	sb	a4,1(a5)
	sb	zero,2(a5)
	tail	_Z12MMC3RegResetv
	.size	_ZL12Super24Resetv, .-_ZL12Super24Resetv
	.section	.text._ZL12Super24Powerv,"ax",@progbits
	.align	2
	.type	_ZL12Super24Powerv, @function
_ZL12Super24Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	lla	a5,EXPREGS
	li	a4,36
	sb	a4,0(a5)
	li	a4,-97
	sb	a4,1(a5)
	sb	zero,2(a5)
	call	_Z12GenMMC3Powerv
	li	a1,32768
	lla	a2,_ZL12Super24Writejh
	addi	a1,a1,-1
	li	a0,20480
	call	_Z15SetWriteHandleriiPFvjhE
	lw	ra,8(sp)
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,32768
	addi	sp,sp,12
	tail	_Z14SetReadHandleriiPFhjE
	.size	_ZL12Super24Powerv, .-_ZL12Super24Powerv
	.section	.text._ZL9Super24CWjh,"ax",@progbits
	.align	2
	.type	_ZL9Super24CWjh, @function
_ZL9Super24CWjh:
	lla	a4,EXPREGS
	lbu	a5,0(a4)
	mv	a2,a1
	mv	a1,a0
	andi	a5,a5,32
	beq	a5,zero,.L16
	li	a0,16
	tail	_Z8setchr1rijj
.L16:
	lbu	a0,2(a4)
	slli	a5,a0,3
	or	a2,a5,a2
	srli	a0,a0,6
	tail	_Z8setchr1rijj
	.size	_ZL9Super24CWjh, .-_ZL9Super24CWjh
	.section	.text._ZL12Super24Writejh,"ax",@progbits
	.align	2
	.type	_ZL12Super24Writejh, @function
_ZL12Super24Writejh:
	li	a5,24576
	addi	a4,a5,-15
	beq	a0,a4,.L18
	addi	a4,a5,-14
	beq	a0,a4,.L19
	addi	a5,a5,-16
	beq	a0,a5,.L24
	ret
.L18:
	la a0, MMC3_cmd; lbu a0, 0(a0);
	la a5, EXPREGS+1; sb a1, 0(a5);
	tail	_Z10FixMMC3PRGi
.L24:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,MMC3_cmd
	lbu	a0,0(s0)
	sw	ra,8(sp)
	la a5, EXPREGS; sb a1, 0(a5);
	call	_Z10FixMMC3PRGi
	lbu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_Z10FixMMC3CHRi
.L19:
	la a0, MMC3_cmd; lbu a0, 0(a0);
	la a5, EXPREGS+2; sb a1, 0(a5);
	tail	_Z10FixMMC3CHRi
	.size	_ZL12Super24Writejh, .-_ZL12Super24Writejh
	.section	.rodata._Z12Super24_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"CHRR"
	.align	2
.LC1:
	.string	"BIG2"
	.section	.text._Z12Super24_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z12Super24_InitP8CartInfo
	.hidden	_Z12Super24_InitP8CartInfo
	.type	_Z12Super24_InitP8CartInfo, @function
_Z12Super24_InitP8CartInfo:
	addi	sp,sp,-12
	li	a4,0
	li	a3,0
	li	a2,256
	li	a1,128
	sw	ra,8(sp)
	sw	s0,4(sp)
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL12Super24Powerv
	sw	a5,0(s0)
	lla	a5,_ZL12Super24Resetv
	sw	a5,4(s0)
	lla	a5,_ZL12Super24Closev
	sw	a5,8(s0)
	lla	a5,_ZL9Super24CWjh
	la a4, cwrap; sw a5, 0(a4);
	li	a0,8192
	lla	a5,_ZL9Super24PWjh
	la a4, pwrap; sw a5, 0(a4);
	call	_Z12FCEU_gmallocj
	mv	a1,a0
	lla	s0,.LANCHOR1
	li	a3,1
	li	a2,8192
	li	a0,16
	sw	a1,0(s0)
	call	_Z19SetupCartCHRMappingiPhji
	lw	a0,0(s0)
	lla	a3,.LC0
	li	a2,0
	li	a1,8192
	call	_Z10AddExStatePvjiPKc
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a3,.LC1
	li	a2,0
	li	a1,3
	lla	a0,EXPREGS
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z12Super24_InitP8CartInfo, .-_Z12Super24_InitP8CartInfo
	.section	.rodata._ZL6masko8,"a"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL6masko8, @object
	.size	_ZL6masko8, 32
_ZL6masko8:
	.word	63
	.word	31
	.word	15
	.word	1
	.word	3
	.word	0
	.word	0
	.word	0
	.section	.sbss._ZL6CHRRAM,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	_ZL6CHRRAM, @object
	.size	_ZL6CHRRAM, 4
_ZL6CHRRAM:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
