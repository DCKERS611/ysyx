#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"176.cpp"
	.option nopic
	.text
	.section	.text._ZL14M176Write_A001jh,"ax",@progbits
	.align	2
	.type	_ZL14M176Write_A001jh, @function
_ZL14M176Write_A001jh:
	ret
	.size	_ZL14M176Write_A001jh, .-_ZL14M176Write_A001jh
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-12
	li	a2,0
	li	a1,24576
	li	a0,16
	sw	ra,8(sp)
	sw	s0,4(sp)
	call	_Z8setprg8rijj
	lla	s0,.LANCHOR0
	lbu	a1,0(s0)
	li	a0,32768
	call	_Z7setprg8jj
	lbu	a1,1(s0)
	li	a0,40960
	call	_Z7setprg8jj
	lbu	a1,2(s0)
	li	a0,49152
	call	_Z7setprg8jj
	lbu	a1,3(s0)
	li	a0,57344
	call	_Z7setprg8jj
	lw	s0,4(sp)
	lw	ra,8(sp)
	la a0, .LANCHOR1; lbu a0, 0(a0);
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	tail	_ZL4Syncv
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL9M176Closev,"ax",@progbits
	.align	2
	.type	_ZL9M176Closev, @function
_ZL9M176Closev:
	la a0, .LANCHOR2; lw a0, 0(a0);
	beq	a0,zero,.L12
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_Z10FCEU_gfreePv
	lw	ra,8(sp)
	la a5, .LANCHOR2; sw zero, 0(a5);
	addi	sp,sp,12
	jr	ra
.L12:
	la a5, .LANCHOR2; sw zero, 0(a5);
	ret
	.size	_ZL9M176Closev, .-_ZL9M176Closev
	.section	.text._ZL9M176Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M176Powerv, @function
_ZL9M176Powerv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	li	s0,32768
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,24576
	sw	ra,8(sp)
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lla	a2,_ZL19M176Write_WriteSRAMjh
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	li	a1,40960
	addi	a1,a1,1
	mv	a0,a1
	lla	a2,_ZL14M176Write_A001jh
	call	_Z15SetWriteHandleriiPFvjhE
	li	s0,20480
	addi	a1,s0,1
	mv	a0,a1
	lla	a2,_ZL14M176Write_5001jh
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,16
	mv	a0,a1
	lla	a2,_ZL14M176Write_5010jh
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,17
	mv	a0,a1
	lla	a2,_ZL14M176Write_5011jh
	call	_Z15SetWriteHandleriiPFvjhE
	li	s0,24576
	addi	a1,s0,-15
	mv	a0,a1
	lla	a2,_ZL14M176Write_5FF1jh
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-14
	mv	a0,a1
	lla	a2,_ZL14M176Write_5FF2jh
	call	_Z15SetWriteHandleriiPFvjhE
	la a0, .LANCHOR3; lw a0, 0(a0);
	la a2, .LANCHOR2; lw a2, 0(a2);
	li	a1,24576
	srli	a0,a0,10
	call	_Z16FCEU_CheatAddRAMijPh
	la a5, ROM_size; lbu a5, 0(a5);
	addi	a3,a5,-2
	la a2, .LANCHOR4; sb zero, 0(a2);
	addi	a5,a5,-1
	lla	a4,.LANCHOR0
	andi	a3,a3,63
	andi	a5,a5,63
	li	a2,256
	sh	a2,0(a4)
	sb	a3,2(a4)
	sb	a5,3(a4)
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_ZL4Syncv
	.size	_ZL9M176Powerv, .-_ZL9M176Powerv
	.section	.rodata._ZL14M176Write_5FF2jh.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"%04X = $%02X\n"
	.section	.text._ZL14M176Write_5FF2jh,"ax",@progbits
	.align	2
	.type	_ZL14M176Write_5FF2jh, @function
_ZL14M176Write_5FF2jh:
	addi	sp,sp,-12
	sw	s0,4(sp)
	mv	s0,a1
	mv	a2,s0
	mv	a1,a0
	lla	a0,.LC0
	sw	ra,8(sp)
	call	printf
	la a5, .LANCHOR1; sb s0, 0(a5);
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_ZL4Syncv
	.size	_ZL14M176Write_5FF2jh, .-_ZL14M176Write_5FF2jh
	.section	.text._ZL14M176Write_5FF1jh,"ax",@progbits
	.align	2
	.type	_ZL14M176Write_5FF1jh, @function
_ZL14M176Write_5FF1jh:
	addi	sp,sp,-12
	sw	s0,4(sp)
	mv	s0,a1
	mv	a2,s0
	mv	a1,a0
	lla	a0,.LC0
	sw	ra,8(sp)
	call	printf
	slli	a2,s0,1
	andi	a2,a2,252
	lla	a5,.LANCHOR0
	addi	a1,a2,1
	addi	a3,a2,2
	addi	a4,a2,3
	sb	a2,0(a5)
	sb	a1,1(a5)
	sb	a3,2(a5)
	sb	a4,3(a5)
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_ZL4Syncv
	.size	_ZL14M176Write_5FF1jh, .-_ZL14M176Write_5FF1jh
	.section	.text._ZL14M176Write_5011jh,"ax",@progbits
	.align	2
	.type	_ZL14M176Write_5011jh, @function
_ZL14M176Write_5011jh:
	addi	sp,sp,-12
	sw	s0,4(sp)
	mv	s0,a1
	mv	a2,s0
	mv	a1,a0
	lla	a0,.LC0
	sw	ra,8(sp)
	call	printf
	la a5, .LANCHOR4; lbu a5, 0(a5);
	beq	a5,zero,.L22
	slli	s0,s0,1
	andi	s0,s0,252
	lla	a5,.LANCHOR0
	addi	a2,s0,1
	addi	a3,s0,2
	addi	a4,s0,3
	sb	s0,0(a5)
	sb	a2,1(a5)
	sb	a3,2(a5)
	sb	a4,3(a5)
.L22:
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_ZL4Syncv
	.size	_ZL14M176Write_5011jh, .-_ZL14M176Write_5011jh
	.section	.text._ZL14M176Write_5010jh,"ax",@progbits
	.align	2
	.type	_ZL14M176Write_5010jh, @function
_ZL14M176Write_5010jh:
	addi	sp,sp,-12
	sw	s0,4(sp)
	mv	s0,a1
	mv	a2,s0
	mv	a1,a0
	lla	a0,.LC0
	sw	ra,8(sp)
	call	printf
	li	a5,36
	bne	s0,a5,.L28
	li	a5,1
	la a4, .LANCHOR4; sb a5, 0(a4);
.L28:
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_ZL4Syncv
	.size	_ZL14M176Write_5010jh, .-_ZL14M176Write_5010jh
	.section	.text._ZL14M176Write_5001jh,"ax",@progbits
	.align	2
	.type	_ZL14M176Write_5001jh, @function
_ZL14M176Write_5001jh:
	addi	sp,sp,-12
	sw	s0,4(sp)
	mv	s0,a1
	mv	a2,s0
	mv	a1,a0
	lla	a0,.LC0
	sw	ra,8(sp)
	call	printf
	la a5, .LANCHOR4; lbu a5, 0(a5);
	beq	a5,zero,.L31
	slli	s0,s0,2
	andi	s0,s0,0xff
	lla	a5,.LANCHOR0
	addi	a2,s0,1
	addi	a3,s0,2
	addi	a4,s0,3
	sb	s0,0(a5)
	sb	a2,1(a5)
	sb	a3,2(a5)
	sb	a4,3(a5)
.L31:
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_ZL4Syncv
	.size	_ZL14M176Write_5001jh, .-_ZL14M176Write_5001jh
	.section	.text._ZL19M176Write_WriteSRAMjh,"ax",@progbits
	.align	2
	.type	_ZL19M176Write_WriteSRAMjh, @function
_ZL19M176Write_WriteSRAMjh:
	tail	_Z6CartBWjh
	.size	_ZL19M176Write_WriteSRAMjh, .-_ZL19M176Write_WriteSRAMjh
	.section	.rodata._Z14Mapper176_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"WRAM"
	.section	.text._Z14Mapper176_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper176_InitP8CartInfo
	.hidden	_Z14Mapper176_InitP8CartInfo
	.type	_Z14Mapper176_InitP8CartInfo, @function
_Z14Mapper176_InitP8CartInfo:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	lla	a5,_ZL9M176Powerv
	sw	a5,0(a0)
	lla	a5,_ZL9M176Closev
	sw	a5,8(a0)
	lla	a5,_ZL12StateRestorei
	lla	s0,.LANCHOR3
	la a4, GameStateRestore; sw a5, 0(a4);
	li	a0,8192
	li	a5,8192
	sw	a5,0(s0)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s0)
	mv	a1,a0
	lla	s1,.LANCHOR2
	li	a3,1
	li	a0,16
	sw	a1,0(s1)
	call	_Z19SetupCartPRGMappingiPhji
	lw	a1,0(s0)
	lw	a0,0(s1)
	lla	a3,.LC1
	li	a2,0
	call	_Z10AddExStatePvjiPKc
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR5
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper176_InitP8CartInfo, .-_Z14Mapper176_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC2:
	.string	"PRG"
	.align	2
.LC3:
	.string	"CHR"
	.align	2
.LC4:
	.string	"SBW"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR5,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 48
_ZL9StateRegs:
	.word	_ZL3prg
	.word	4
	.word	.LC2
	.word	_ZL3chr
	.word	1
	.word	.LC3
	.word	_ZL3sbw
	.word	1
	.word	.LC4
	.word	0
	.zero	8
	.section	.sbss._ZL3chr,"aw",@nobits
	.set	.LANCHOR1,. + 0
	.type	_ZL3chr, @object
	.size	_ZL3chr, 1
_ZL3chr:
	.zero	1
	.section	.sbss._ZL3prg,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL3prg, @object
	.size	_ZL3prg, 4
_ZL3prg:
	.zero	4
	.section	.sbss._ZL3sbw,"aw",@nobits
	.set	.LANCHOR4,. + 0
	.type	_ZL3sbw, @object
	.size	_ZL3sbw, 1
_ZL3sbw:
	.zero	1
	.section	.sbss._ZL4WRAM,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL4WRAM, @object
	.size	_ZL4WRAM, 4
_ZL4WRAM:
	.zero	4
	.section	.sbss._ZL8WRAMSIZE,"aw",@nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	_ZL8WRAMSIZE, @object
	.size	_ZL8WRAMSIZE, 4
_ZL8WRAMSIZE:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
