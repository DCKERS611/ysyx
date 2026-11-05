#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"01-222.cpp"
	.option nopic
	.text
	.section	.text._ZL15UNL22211WriteLojh,"ax",@progbits
	.align	2
	.type	_ZL15UNL22211WriteLojh, @function
_ZL15UNL22211WriteLojh:
	andi	a0,a0,3
	lla	a5,.LANCHOR0
	add	a5,a5,a0
	sb	a1,0(a5)
	ret
	.size	_ZL15UNL22211WriteLojh, .-_ZL15UNL22211WriteLojh
	.section	.text._ZL14UNL22211ReadLoj,"ax",@progbits
	.align	2
	.type	_ZL14UNL22211ReadLoj, @function
_ZL14UNL22211ReadLoj:
	lla	a4,.LANCHOR0
	la a5, .LANCHOR1; lbu a5, 0(a5);
	lbu	a0,1(a4)
	snez	a5,a5
	lbu	a4,2(a4)
	neg	a5,a5
	andi	a5,a5,-63
	xor	a0,a0,a4
	addi	a5,a5,64
	or	a0,a0,a5
	andi	a0,a0,0xff
	ret
	.size	_ZL14UNL22211ReadLoj, .-_ZL14UNL22211ReadLoj
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR0
	lbu	a1,2(s0)
	li	a0,32768
	sw	ra,8(sp)
	srli	a1,a1,2
	andi	a1,a1,1
	call	_Z8setprg32jj
	la a5, .LANCHOR2; lbu a5, 0(a5);
	beq	a5,zero,.L7
	lbu	a5,2(s0)
	la a4, .LANCHOR3; lbu a4, 0(a4);
	lw	s0,4(sp)
	xor	a5,a5,a4
	lw	ra,8(sp)
	srli	a0,a5,3
	srli	a5,a5,5
	andi	a0,a0,2
	andi	a5,a5,1
	or	a0,a0,a5
	addi	sp,sp,12
	tail	_Z7setchr8j
.L7:
	lbu	a0,2(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	andi	a0,a0,3
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	tail	_ZL4Syncv
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL15UNL22211WriteHijh,"ax",@progbits
	.align	2
	.type	_ZL15UNL22211WriteHijh, @function
_ZL15UNL22211WriteHijh:
	la a5, .LANCHOR3; sb a1, 0(a5);
	tail	_ZL4Syncv
	.size	_ZL15UNL22211WriteHijh, .-_ZL15UNL22211WriteHijh
	.section	.text._ZL13UNL22211Powerv,"ax",@progbits
	.align	2
	.type	_ZL13UNL22211Powerv, @function
_ZL13UNL22211Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	call	_ZL4Syncv
	li	s1,65536
	addi	a1,s1,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	li	s0,16384
	addi	a1,s0,256
	mv	a0,a1
	lla	a2,_ZL14UNL22211ReadLoj
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,259
	addi	a0,s0,256
	lla	a2,_ZL15UNL22211WriteLojh
	call	_Z15SetWriteHandleriiPFvjhE
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	a1,s1,-1
	lw	s1,0(sp)
	lla	a2,_ZL15UNL22211WriteHijh
	li	a0,32768
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL13UNL22211Powerv, .-_ZL13UNL22211Powerv
	.section	.text._Z13UNL22211_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13UNL22211_InitP8CartInfo
	.hidden	_Z13UNL22211_InitP8CartInfo
	.type	_Z13UNL22211_InitP8CartInfo, @function
_Z13UNL22211_InitP8CartInfo:
	lla	a5,_ZL13UNL22211Powerv
	sw	a5,0(a0)
	la a5, .LANCHOR2; sb zero, 0(a5);
	la a5, .LANCHOR1; sb zero, 0(a5);
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR4
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z13UNL22211_InitP8CartInfo, .-_Z13UNL22211_InitP8CartInfo
	.section	.text._Z14Mapper172_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper172_InitP8CartInfo
	.hidden	_Z14Mapper172_InitP8CartInfo
	.type	_Z14Mapper172_InitP8CartInfo, @function
_Z14Mapper172_InitP8CartInfo:
	lla	a5,_ZL13UNL22211Powerv
	sw	a5,0(a0)
	li	a5,1
	la a4, .LANCHOR2; sb a5, 0(a4);
	la a5, .LANCHOR1; sb zero, 0(a5);
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR4
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper172_InitP8CartInfo, .-_Z14Mapper172_InitP8CartInfo
	.section	.text._Z14Mapper173_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper173_InitP8CartInfo
	.hidden	_Z14Mapper173_InitP8CartInfo
	.type	_Z14Mapper173_InitP8CartInfo, @function
_Z14Mapper173_InitP8CartInfo:
	lla	a5,_ZL13UNL22211Powerv
	sw	a5,0(a0)
	la a5, .LANCHOR2; sb zero, 0(a5);
	li	a5,1
	la a4, .LANCHOR1; sb a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR4
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper173_InitP8CartInfo, .-_Z14Mapper173_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"REGS"
	.align	2
.LC1:
	.string	"CMD"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR4,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 36
_ZL9StateRegs:
	.word	_ZL3reg
	.word	4
	.word	.LC0
	.word	_ZL3cmd
	.word	1
	.word	.LC1
	.word	0
	.zero	8
	.section	.sbss._ZL3cmd,"aw",@nobits
	.set	.LANCHOR3,. + 0
	.type	_ZL3cmd, @object
	.size	_ZL3cmd, 1
_ZL3cmd:
	.zero	1
	.section	.sbss._ZL3reg,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL3reg, @object
	.size	_ZL3reg, 4
_ZL3reg:
	.zero	4
	.section	.sbss._ZL5is172,"aw",@nobits
	.set	.LANCHOR2,. + 0
	.type	_ZL5is172, @object
	.size	_ZL5is172, 1
_ZL5is172:
	.zero	1
	.section	.sbss._ZL5is173,"aw",@nobits
	.set	.LANCHOR1,. + 0
	.type	_ZL5is173, @object
	.size	_ZL5is173, 1
_ZL5is173:
	.zero	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
