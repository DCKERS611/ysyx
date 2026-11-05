#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"603-5052.cpp"
	.option nopic
	.text
	.section	.text._ZL19UNL6035052ProtWritejh,"ax",@progbits
	.align	2
	.type	_ZL19UNL6035052ProtWritejh, @function
_ZL19UNL6035052ProtWritejh:
	andi	a1,a1,3
	lla	a5,.LANCHOR0
	add	a5,a5,a1
	lbu	a5,0(a5)
	la a4, EXPREGS; sb a5, 0(a4);
	ret
	.size	_ZL19UNL6035052ProtWritejh, .-_ZL19UNL6035052ProtWritejh
	.section	.text._ZL18UNL6035052ProtReadj,"ax",@progbits
	.align	2
	.type	_ZL18UNL6035052ProtReadj, @function
_ZL18UNL6035052ProtReadj:
	la a0, EXPREGS; lbu a0, 0(a0);
	ret
	.size	_ZL18UNL6035052ProtReadj, .-_ZL18UNL6035052ProtReadj
	.section	.text._ZL15UNL6035052Powerv,"ax",@progbits
	.align	2
	.type	_ZL15UNL6035052Powerv, @function
_ZL15UNL6035052Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	li	s0,16384
	call	_Z12GenMMC3Powerv
	li	s1,32768
	addi	a1,s1,-1
	addi	a0,s0,32
	lla	a2,_ZL19UNL6035052ProtWritejh
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a0,s0,32
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	a1,s1,-1
	lw	s1,0(sp)
	lla	a2,_ZL18UNL6035052ProtReadj
	addi	sp,sp,12
	tail	_Z14SetReadHandleriiPFhjE
	.size	_ZL15UNL6035052Powerv, .-_ZL15UNL6035052Powerv
	.section	.rodata._Z15UNL6035052_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"EXPR"
	.section	.text._Z15UNL6035052_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z15UNL6035052_InitP8CartInfo
	.hidden	_Z15UNL6035052_InitP8CartInfo
	.type	_Z15UNL6035052_InitP8CartInfo, @function
_Z15UNL6035052_InitP8CartInfo:
	addi	sp,sp,-12
	li	a3,0
	li	a2,256
	li	a1,128
	li	a4,0
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL15UNL6035052Powerv
	sw	a5,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a3,.LC0
	li	a2,0
	li	a1,6
	lla	a0,EXPREGS
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z15UNL6035052_InitP8CartInfo, .-_Z15UNL6035052_InitP8CartInfo
	.section	.srodata._ZL3lut,"a"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL3lut, @object
	.size	_ZL3lut, 4
_ZL3lut:
	.string	""
	.ascii	"\002\002\003"
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
