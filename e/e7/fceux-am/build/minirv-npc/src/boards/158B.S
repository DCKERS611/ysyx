#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"158B.cpp"
	.option nopic
	.text
	.section	.text._ZL15UNL158BProtReadj,"ax",@progbits
	.align	2
	.type	_ZL15UNL158BProtReadj, @function
_ZL15UNL158BProtReadj:
	andi	a0,a0,7
	lla	a5,.LANCHOR0
	add	a5,a5,a0
	lbu	a0,0(a5)
	la a5, X+24; lbu a5, 0(a5);
	or	a0,a0,a5
	ret
	.size	_ZL15UNL158BProtReadj, .-_ZL15UNL158BProtReadj
	.section	.text._ZL12UNL158BPowerv,"ax",@progbits
	.align	2
	.type	_ZL12UNL158BPowerv, @function
_ZL12UNL158BPowerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	call	_Z12GenMMC3Powerv
	li	s0,24576
	addi	a1,s0,-1
	lla	a2,_ZL16UNL158BProtWritejh
	li	a0,20480
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_ZL15UNL158BProtReadj
	li	a0,20480
	addi	sp,sp,12
	tail	_Z14SetReadHandleriiPFhjE
	.size	_ZL12UNL158BPowerv, .-_ZL12UNL158BPowerv
	.section	.text._ZL9UNL158BPWjh,"ax",@progbits
	.align	2
	.type	_ZL9UNL158BPWjh, @function
_ZL9UNL158BPWjh:
	la a5, EXPREGS; lbu a5, 0(a5);
	slli	a4,a5,24
	srai	a4,a4,24
	bge	a4,zero,.L6
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	andi	a4,a5,32
	andi	s0,a5,7
	beq	a4,zero,.L7
	srli	a1,s0,1
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a0,32768
	addi	sp,sp,12
	tail	_Z8setprg32jj
.L7:
	mv	a1,s0
	li	a0,32768
	call	_Z8setprg16jj
	mv	a1,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a0,49152
	addi	sp,sp,12
	tail	_Z8setprg16jj
.L6:
	andi	a1,a1,15
	tail	_Z7setprg8jj
	.size	_ZL9UNL158BPWjh, .-_ZL9UNL158BPWjh
	.section	.rodata._ZL16UNL158BProtWritejh.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"UNK PROT WRITE\n"
	.section	.text._ZL16UNL158BProtWritejh,"ax",@progbits
	.align	2
	.type	_ZL16UNL158BProtWritejh, @function
_ZL16UNL158BProtWritejh:
	andi	a0,a0,7
	lla	a5,EXPREGS
	add	a5,a5,a0
	sb	a1,0(a5)
	beq	a0,zero,.L12
	li	a5,7
	bne	a0,a5,.L16
	lla	a0,.LC0
	tail	printf
.L16:
	ret
.L12:
	la a0, MMC3_cmd; lbu a0, 0(a0);
	tail	_Z10FixMMC3PRGi
	.size	_ZL16UNL158BProtWritejh, .-_ZL16UNL158BProtWritejh
	.section	.rodata._Z12UNL158B_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"EXPR"
	.section	.text._Z12UNL158B_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z12UNL158B_InitP8CartInfo
	.hidden	_Z12UNL158B_InitP8CartInfo
	.type	_Z12UNL158B_InitP8CartInfo, @function
_Z12UNL158B_InitP8CartInfo:
	addi	sp,sp,-12
	li	a3,0
	li	a2,128
	li	a1,128
	li	a4,0
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL9UNL158BPWjh
	la a4, pwrap; sw a5, 0(a4);
	lla	a5,_ZL12UNL158BPowerv
	sw	a5,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a3,.LC1
	li	a2,0
	li	a1,8
	lla	a0,EXPREGS
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z12UNL158B_InitP8CartInfo, .-_Z12UNL158B_InitP8CartInfo
	.section	.srodata._ZL3lut,"a"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL3lut, @object
	.size	_ZL3lut, 8
_ZL3lut:
	.string	""
	.string	""
	.string	""
	.string	"\001\002\004\017"
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
