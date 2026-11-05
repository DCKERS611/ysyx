#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"rt-01.cpp"
	.option nopic
	.text
	.section	.text._ZL12UNLRT01Powerv,"ax",@progbits
	.align	2
	.type	_ZL12UNLRT01Powerv, @function
_ZL12UNLRT01Powerv:
	addi	sp,sp,-12
	li	a1,0
	li	a0,32768
	sw	ra,8(sp)
	call	_Z8setprg16jj
	li	a1,0
	li	a0,49152
	call	_Z8setprg16jj
	li	a1,0
	li	a0,0
	call	_Z7setchr2jj
	li	a0,4096
	li	a1,0
	addi	a0,a0,-2048
	call	_Z7setchr2jj
	li	a1,0
	li	a0,4096
	call	_Z7setchr2jj
	li	a0,8192
	li	a1,0
	addi	a0,a0,-2048
	call	_Z7setchr2jj
	lw	ra,8(sp)
	li	a1,65536
	lla	a2,_ZL11UNLRT01Readj
	addi	a1,a1,-1
	li	a0,32768
	addi	sp,sp,12
	tail	_Z14SetReadHandleriiPFhjE
	.size	_ZL12UNLRT01Powerv, .-_ZL12UNLRT01Powerv
	.section	.text._ZL11UNLRT01Readj,"ax",@progbits
	.align	2
	.type	_ZL11UNLRT01Readj, @function
_ZL11UNLRT01Readj:
	li	a4,-53248
	addi	a4,a4,384
	add	a4,a0,a4
	li	a3,127
	bleu	a4,a3,.L5
	li	a4,-65536
	addi	a4,a4,384
	add	a5,a0,a4
	bgtu	a5,a3,.L11
.L5:
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_Z21xoroshiro128plus_nextv
	lw	ra,8(sp)
	ori	a0,a0,-14
	andi	a0,a0,0xff
	addi	sp,sp,12
	jr	ra
.L11:
	tail	_Z6CartBRj
	.size	_ZL11UNLRT01Readj, .-_ZL11UNLRT01Readj
	.section	.text._Z12UNLRT01_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z12UNLRT01_InitP8CartInfo
	.hidden	_Z12UNLRT01_InitP8CartInfo
	.type	_Z12UNLRT01_InitP8CartInfo, @function
_Z12UNLRT01_InitP8CartInfo:
	lla	a5,_ZL12UNLRT01Powerv
	sw	a5,0(a0)
	ret
	.size	_Z12UNLRT01_InitP8CartInfo, .-_Z12UNLRT01_InitP8CartInfo
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
