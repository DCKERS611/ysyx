#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"208.cpp"
	.option nopic
	.text
	.section	.text._ZL12M208ProtReadj,"ax",@progbits
	.align	2
	.type	_ZL12M208ProtReadj, @function
_ZL12M208ProtReadj:
	andi	a0,a0,3
	lla	a5,EXPREGS
	add	a5,a5,a0
	lbu	a0,0(a5)
	ret
	.size	_ZL12M208ProtReadj, .-_ZL12M208ProtReadj
	.section	.text._ZL9M208Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M208Powerv, @function
_ZL9M208Powerv:
	addi	sp,sp,-12
	li	a5,3
	sw	ra,8(sp)
	sw	s0,4(sp)
	la a4, EXPREGS+5; sb a5, 0(a4);
	call	_Z12GenMMC3Powerv
	li	a0,20480
	addi	a1,a0,-1
	lla	a2,_ZL9M208Writejh
	addi	a0,a0,-2048
	call	_Z15SetWriteHandleriiPFvjhE
	li	a0,28672
	addi	a1,a0,-1
	lla	a2,_ZL9M208Writejh
	addi	a0,a0,-2048
	call	_Z15SetWriteHandleriiPFvjhE
	li	s0,24576
	addi	a1,s0,-1
	lla	a2,_ZL13M208ProtWritejh
	li	a0,20480
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	addi	a0,s0,-2048
	lla	a2,_ZL12M208ProtReadj
	call	_Z14SetReadHandleriiPFhjE
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,32768
	addi	sp,sp,12
	tail	_Z14SetReadHandleriiPFhjE
	.size	_ZL9M208Powerv, .-_ZL9M208Powerv
	.section	.text._ZL9M208Writejh,"ax",@progbits
	.align	2
	.type	_ZL9M208Writejh, @function
_ZL9M208Writejh:
	srli	a5,a1,3
	andi	a5,a5,2
	andi	a1,a1,1
	or	a5,a5,a1
	la a0, MMC3_cmd; lbu a0, 0(a0);
	la a4, EXPREGS+5; sb a5, 0(a4);
	tail	_Z10FixMMC3PRGi
	.size	_ZL9M208Writejh, .-_ZL9M208Writejh
	.section	.text._ZL6M208PWjh,"ax",@progbits
	.align	2
	.type	_ZL6M208PWjh, @function
_ZL6M208PWjh:
	la a1, EXPREGS+5; lbu a1, 0(a1);
	li	a0,32768
	tail	_Z8setprg32jj
	.size	_ZL6M208PWjh, .-_ZL6M208PWjh
	.section	.text._ZL13M208ProtWritejh,"ax",@progbits
	.align	2
	.type	_ZL13M208ProtWritejh, @function
_ZL13M208ProtWritejh:
	li	a5,20480
	addi	a5,a5,2047
	bgtu	a0,a5,.L8
	la a5, EXPREGS+4; sb a1, 0(a5);
	ret
.L8:
	lla	a5,EXPREGS
	lbu	a3,4(a5)
	lla	a4,.LANCHOR0
	andi	a0,a0,3
	add	a4,a4,a3
	lbu	a4,0(a4)
	add	a5,a5,a0
	xor	a1,a1,a4
	sb	a1,0(a5)
	ret
	.size	_ZL13M208ProtWritejh, .-_ZL13M208ProtWritejh
	.section	.rodata._Z14Mapper208_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"EXPR"
	.section	.text._Z14Mapper208_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper208_InitP8CartInfo
	.hidden	_Z14Mapper208_InitP8CartInfo
	.type	_Z14Mapper208_InitP8CartInfo, @function
_Z14Mapper208_InitP8CartInfo:
	addi	sp,sp,-12
	li	a3,0
	li	a2,256
	li	a1,128
	li	a4,0
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL6M208PWjh
	la a4, pwrap; sw a5, 0(a4);
	lla	a5,_ZL9M208Powerv
	sw	a5,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a3,.LC0
	li	a2,0
	li	a1,6
	lla	a0,EXPREGS
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper208_InitP8CartInfo, .-_Z14Mapper208_InitP8CartInfo
	.section	.rodata._ZL3lut,"a"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL3lut, @object
	.size	_ZL3lut, 256
_ZL3lut:
	.string	"YYYYYYYYYI\031\tYI\031\tYYYYYYYYQA\021\001QA\021\001YYYYYYYYYI\031\tYI\031\tYYYYYYYYQA\021\001QA\021\001"
	.string	"\020@P"
	.string	"\020@P"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\b\030HX\b\030HX"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\020@P"
	.string	"\020@P"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\b\030HX\b\030HX"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"YYYYYYYYXH\030\bXH\030\bYYYYYYYYP@\020"
	.string	"P@\020"
	.string	"YYYYYYYYXH\030\bXH\030\bYYYYYYYYP@\020"
	.string	"P@\020"
	.string	"\001\021AQ\001\021AQ"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\t\031IY\t\031IY"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\001\021AQ\001\021AQ"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\t\031IY\t\031IY"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
