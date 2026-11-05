#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"156.cpp"
	.option nopic
	.text
	.section	.text._ZL9M156Resetv,"ax",@progbits
	.align	2
	.type	_ZL9M156Resetv, @function
_ZL9M156Resetv:
	lla	a5,.LANCHOR0
	lla	a4,.LANCHOR1
	lla	a3,.LANCHOR0+8
.L2:
	sb	zero,0(a5)
	sb	zero,0(a4)
	addi	a5,a5,1
	addi	a4,a4,1
	bne	a5,a3,.L2
	la a5, .LANCHOR2; sb zero, 0(a5);
	la a5, .LANCHOR3; sb zero, 0(a5);
	la a5, .LANCHOR4; sb zero, 0(a5);
	ret
	.size	_ZL9M156Resetv, .-_ZL9M156Resetv
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	lla	a3,.LANCHOR0
	lla	s1,.LANCHOR1
	li	s0,0
.L6:
	lbu	a5,0(s1)
	lbu	a1,0(a3)
	mv	a0,s0
	slli	a5,a5,8
	or	a1,a5,a1
	sw	a3,0(sp)
	call	_Z7setchr1jj
	lw	a3,0(sp)
	addi	s0,s0,1024
	li	a5,8192
	addi	a3,a3,1
	addi	s1,s1,1
	bne	s0,a5,.L6
	li	a2,0
	li	a1,24576
	li	a0,16
	call	_Z8setprg8rijj
	la a1, .LANCHOR2; lbu a1, 0(a1);
	li	a0,32768
	call	_Z8setprg16jj
	li	a0,49152
	li	a1,-1
	call	_Z8setprg16jj
	la a5, .LANCHOR4; lbu a5, 0(a5);
	li	a0,2
	beq	a5,zero,.L10
	la a0, .LANCHOR3; lbu a0, 0(a0);
	xori	a0,a0,1
.L10:
	lw	s0,8(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	tail	_Z9setmirrori
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	tail	_ZL4Syncv
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL9M156Writejh,"ax",@progbits
	.align	2
	.type	_ZL9M156Writejh, @function
_ZL9M156Writejh:
	li	a5,-49152
	add	a5,a0,a5
	li	a4,20
	bgtu	a5,a4,.L12
	lla	a4,.L15
	slli	a5,a5,2
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a5,a5,a4
	jr	a5
	.section	.rodata._ZL9M156Writejh,"a",@progbits
	.align	2
	.align	2
.L15:
	.word	.L20-.L15
	.word	.L20-.L15
	.word	.L20-.L15
	.word	.L20-.L15
	.word	.L19-.L15
	.word	.L19-.L15
	.word	.L19-.L15
	.word	.L19-.L15
	.word	.L18-.L15
	.word	.L18-.L15
	.word	.L18-.L15
	.word	.L18-.L15
	.word	.L17-.L15
	.word	.L17-.L15
	.word	.L17-.L15
	.word	.L17-.L15
	.word	.L16-.L15
	.word	.L12-.L15
	.word	.L12-.L15
	.word	.L12-.L15
	.word	.L14-.L15
	.section	.text._ZL9M156Writejh
.L17:
	andi	a0,a0,3
	lla	a5,.LANCHOR1
	add	a5,a5,a0
	sb	a1,4(a5)
	tail	_ZL4Syncv
.L20:
	andi	a0,a0,3
	lla	a5,.LANCHOR0
	add	a5,a5,a0
	sb	a1,0(a5)
	tail	_ZL4Syncv
.L19:
	andi	a0,a0,3
	lla	a5,.LANCHOR1
	add	a5,a5,a0
	sb	a1,0(a5)
	tail	_ZL4Syncv
.L18:
	andi	a0,a0,3
	lla	a5,.LANCHOR0
	add	a5,a5,a0
	sb	a1,4(a5)
	tail	_ZL4Syncv
.L12:
	ret
.L16:
	la a5, .LANCHOR2; sb a1, 0(a5);
	tail	_ZL4Syncv
.L14:
	la a5, .LANCHOR3; sb a1, 0(a5);
	li	a5,1
	la a4, .LANCHOR4; sb a5, 0(a4);
	tail	_ZL4Syncv
	.size	_ZL9M156Writejh, .-_ZL9M156Writejh
	.section	.text._ZL9M156Closev,"ax",@progbits
	.align	2
	.type	_ZL9M156Closev, @function
_ZL9M156Closev:
	la a0, .LANCHOR5; lw a0, 0(a0);
	beq	a0,zero,.L27
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_Z10FCEU_gfreePv
	lw	ra,8(sp)
	la a5, .LANCHOR5; sw zero, 0(a5);
	addi	sp,sp,12
	jr	ra
.L27:
	la a5, .LANCHOR5; sw zero, 0(a5);
	ret
	.size	_ZL9M156Closev, .-_ZL9M156Closev
	.section	.text._ZL9M156Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M156Powerv, @function
_ZL9M156Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	lla	a5,.LANCHOR0
	lla	a4,.LANCHOR1
	lla	a3,.LANCHOR0+8
.L31:
	sb	zero,0(a5)
	sb	zero,0(a4)
	addi	a5,a5,1
	addi	a4,a4,1
	bne	a5,a3,.L31
	la a5, .LANCHOR2; sb zero, 0(a5);
	la a5, .LANCHOR3; sb zero, 0(a5);
	la a5, .LANCHOR4; sb zero, 0(a5);
	call	_ZL4Syncv
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	li	a1,32768
	lla	a2,_Z6CartBWjh
	addi	a1,a1,-1
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,53248
	lla	a2,_ZL9M156Writejh
	addi	a1,a1,-1
	li	a0,49152
	call	_Z15SetWriteHandleriiPFvjhE
	lw	ra,8(sp)
	la a0, .LANCHOR6; lw a0, 0(a0);
	la a2, .LANCHOR5; lw a2, 0(a2);
	li	a1,24576
	srli	a0,a0,10
	addi	sp,sp,12
	tail	_Z16FCEU_CheatAddRAMijPh
	.size	_ZL9M156Powerv, .-_ZL9M156Powerv
	.section	.rodata._Z14Mapper156_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.section	.text._Z14Mapper156_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper156_InitP8CartInfo
	.hidden	_Z14Mapper156_InitP8CartInfo
	.type	_Z14Mapper156_InitP8CartInfo, @function
_Z14Mapper156_InitP8CartInfo:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	lla	a5,_ZL9M156Resetv
	sw	a5,4(a0)
	lla	a5,_ZL9M156Powerv
	sw	a5,0(a0)
	lla	a5,_ZL9M156Closev
	lla	s0,.LANCHOR6
	sw	a5,8(a0)
	li	a5,8192
	li	a0,8192
	sw	a5,0(s0)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s0)
	mv	a1,a0
	lla	s1,.LANCHOR5
	li	a3,1
	li	a0,16
	sw	a1,0(s1)
	call	_Z19SetupCartPRGMappingiPhji
	lw	a1,0(s0)
	lw	a0,0(s1)
	lla	a3,.LC0
	li	a2,0
	call	_Z10AddExStatePvjiPKc
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	lla	a5,_ZL12StateRestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR7
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper156_InitP8CartInfo, .-_Z14Mapper156_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"PREG"
	.align	2
.LC2:
	.string	"CRGL"
	.align	2
.LC3:
	.string	"CRGH"
	.align	2
.LC4:
	.string	"MIRR"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR7,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 60
_ZL9StateRegs:
	.word	_ZL3prg
	.word	1
	.word	.LC1
	.word	_ZL5chrlo
	.word	8
	.word	.LC2
	.word	_ZL5chrhi
	.word	8
	.word	.LC3
	.word	_ZL4mirr
	.word	1
	.word	.LC4
	.word	0
	.zero	8
	.section	.sbss._ZL10mirrisused,"aw",@nobits
	.set	.LANCHOR4,. + 0
	.type	_ZL10mirrisused, @object
	.size	_ZL10mirrisused, 1
_ZL10mirrisused:
	.zero	1
	.section	.sbss._ZL3prg,"aw",@nobits
	.set	.LANCHOR2,. + 0
	.type	_ZL3prg, @object
	.size	_ZL3prg, 1
_ZL3prg:
	.zero	1
	.section	.sbss._ZL4WRAM,"aw",@nobits
	.align	2
	.set	.LANCHOR5,. + 0
	.type	_ZL4WRAM, @object
	.size	_ZL4WRAM, 4
_ZL4WRAM:
	.zero	4
	.section	.sbss._ZL4mirr,"aw",@nobits
	.set	.LANCHOR3,. + 0
	.type	_ZL4mirr, @object
	.size	_ZL4mirr, 1
_ZL4mirr:
	.zero	1
	.section	.sbss._ZL5chrhi,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	_ZL5chrhi, @object
	.size	_ZL5chrhi, 8
_ZL5chrhi:
	.zero	8
	.section	.sbss._ZL5chrlo,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL5chrlo, @object
	.size	_ZL5chrlo, 8
_ZL5chrlo:
	.zero	8
	.section	.sbss._ZL8WRAMSIZE,"aw",@nobits
	.align	2
	.set	.LANCHOR6,. + 0
	.type	_ZL8WRAMSIZE, @object
	.size	_ZL8WRAMSIZE, 4
_ZL8WRAMSIZE:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
