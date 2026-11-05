#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"68.cpp"
	.option nopic
	.text
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR0
	lbu	a1,0(s0)
	li	a0,0
	sw	ra,8(sp)
	call	_Z7setchr2jj
	lbu	a1,1(s0)
	li	a0,4096
	addi	a0,a0,-2048
	call	_Z7setchr2jj
	lbu	a1,2(s0)
	li	a0,4096
	call	_Z7setchr2jj
	lbu	a1,3(s0)
	li	a0,8192
	addi	a0,a0,-2048
	call	_Z7setchr2jj
	li	a0,16
	li	a2,0
	li	a1,24576
	call	_Z8setprg8rijj
	la a5, PRGptr+4; lw a5, 0(a5);
	li	a0,0
	beq	a5,zero,.L2
	la a0, .LANCHOR1; lbu a0, 0(a0);
.L2:
	li	a1,32768
	la a2, .LANCHOR2; lbu a2, 0(a2);
	call	_Z9setprg16rijj
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a1,-1
	li	a0,49152
	addi	sp,sp,12
	tail	_Z8setprg16jj
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL11M68WriteROMjh,"ax",@progbits
	.align	2
	.type	_ZL11M68WriteROMjh, @function
_ZL11M68WriteROMjh:
	srli	a5,a1,3
	xori	a5,a5,1
	andi	a1,a1,7
	andi	a5,a5,1
	la a4, .LANCHOR2; sb a1, 0(a4);
	la a4, .LANCHOR1; sb a5, 0(a4);
	tail	_ZL4Syncv
	.size	_ZL11M68WriteROMjh, .-_ZL11M68WriteROMjh
	.section	.text._ZL11M68WriteCHRjh,"ax",@progbits
	.align	2
	.type	_ZL11M68WriteCHRjh, @function
_ZL11M68WriteCHRjh:
	srli	a0,a0,12
	andi	a0,a0,3
	lla	a5,.LANCHOR0
	add	a5,a5,a0
	sb	a1,0(a5)
	tail	_ZL4Syncv
	.size	_ZL11M68WriteCHRjh, .-_ZL11M68WriteCHRjh
	.section	.text._ZL8M68NTfixv,"ax",@progbits
	.align	2
	.type	_ZL8M68NTfixv, @function
_ZL8M68NTfixv:
	la a4, .LANCHOR3; lbu a4, 0(a4);
	la a3, UNIFchrrama; lw a3, 0(a3);
	andi	a5,a4,3
	beq	a3,zero,.L22
.L11:
	li	a4,2
	beq	a5,a4,.L16
	li	a4,3
	beq	a5,a4,.L17
	li	a4,1
	beq	a5,a4,.L18
	li	a0,1
	tail	_Z9setmirrori
.L22:
	andi	a4,a4,16
	beq	a4,zero,.L11
	la a4, PPUNTARAM; sb zero, 0(a4);
	li	a3,2
	la a4, CHRptr; lw a4, 0(a4);
	la a2, CHRmask1; lw a2, 0(a2);
	beq	a5,a3,.L12
	li	a3,3
	beq	a5,a3,.L13
	li	a3,1
	beq	a5,a3,.L14
	la a3, .LANCHOR4; lbu a3, 0(a3);
	la a5, .LANCHOR5; lbu a5, 0(a5);
	ori	a3,a3,128
	ori	a5,a5,128
	and	a3,a3,a2
	and	a5,a5,a2
	slli	a3,a3,10
	slli	a5,a5,10
	lla	a2,vnapage
	add	a3,a4,a3
	add	a5,a4,a5
	sw	a3,8(a2)
	sw	a3,0(a2)
	sw	a5,12(a2)
	sw	a5,4(a2)
	ret
.L18:
	li	a0,0
	tail	_Z9setmirrori
.L17:
	li	a0,3
	tail	_Z9setmirrori
.L16:
	li	a0,2
	tail	_Z9setmirrori
.L12:
	la a5, .LANCHOR4; lbu a5, 0(a5);
	ori	a5,a5,128
	and	a5,a5,a2
	slli	a5,a5,10
	add	a5,a4,a5
	lla	a4,vnapage
	sw	a5,12(a4)
	sw	a5,8(a4)
	sw	a5,4(a4)
	sw	a5,0(a4)
	ret
.L14:
	la a3, .LANCHOR4; lbu a3, 0(a3);
	la a5, .LANCHOR5; lbu a5, 0(a5);
	ori	a3,a3,128
	ori	a5,a5,128
	and	a3,a3,a2
	and	a5,a5,a2
	slli	a3,a3,10
	slli	a5,a5,10
	lla	a2,vnapage
	add	a3,a4,a3
	add	a5,a4,a5
	sw	a3,4(a2)
	sw	a3,0(a2)
	sw	a5,12(a2)
	sw	a5,8(a2)
	ret
.L13:
	la a5, .LANCHOR5; lbu a5, 0(a5);
	ori	a5,a5,128
	and	a5,a5,a2
	slli	a5,a5,10
	add	a4,a4,a5
	lla	a5,vnapage
	sw	a4,12(a5)
	sw	a4,8(a5)
	sw	a4,4(a5)
	sw	a4,0(a5)
	ret
	.size	_ZL8M68NTfixv, .-_ZL8M68NTfixv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_ZL4Syncv
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_ZL8M68NTfixv
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL11M68WriteMIRjh,"ax",@progbits
	.align	2
	.type	_ZL11M68WriteMIRjh, @function
_ZL11M68WriteMIRjh:
	la a5, .LANCHOR3; sb a1, 0(a5);
	tail	_ZL8M68NTfixv
	.size	_ZL11M68WriteMIRjh, .-_ZL11M68WriteMIRjh
	.section	.text._ZL11M68WriteNT2jh,"ax",@progbits
	.align	2
	.type	_ZL11M68WriteNT2jh, @function
_ZL11M68WriteNT2jh:
	la a5, .LANCHOR5; sb a1, 0(a5);
	tail	_ZL8M68NTfixv
	.size	_ZL11M68WriteNT2jh, .-_ZL11M68WriteNT2jh
	.section	.text._ZL11M68WriteNT1jh,"ax",@progbits
	.align	2
	.type	_ZL11M68WriteNT1jh, @function
_ZL11M68WriteNT1jh:
	la a5, .LANCHOR4; sb a1, 0(a5);
	tail	_ZL8M68NTfixv
	.size	_ZL11M68WriteNT1jh, .-_ZL11M68WriteNT1jh
	.section	.text._ZL8M68Closev,"ax",@progbits
	.align	2
	.type	_ZL8M68Closev, @function
_ZL8M68Closev:
	la a0, .LANCHOR6; lw a0, 0(a0);
	beq	a0,zero,.L34
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_Z10FCEU_gfreePv
	lw	ra,8(sp)
	la a5, .LANCHOR6; sw zero, 0(a5);
	addi	sp,sp,12
	jr	ra
.L34:
	la a5, .LANCHOR6; sw zero, 0(a5);
	ret
	.size	_ZL8M68Closev, .-_ZL8M68Closev
	.section	.text._ZL7M68Readj,"ax",@progbits
	.align	2
	.type	_ZL7M68Readj, @function
_ZL7M68Readj:
	addi	sp,sp,-12
	la a5, .LANCHOR1; lbu a5, 0(a5);
	sw	s0,4(sp)
	sw	ra,8(sp)
	andi	a5,a5,8
	mv	s0,a0
	bne	a5,zero,.L39
	lla	a4,.LANCHOR7
	lw	a5,0(a4)
	li	a3,1784
	addi	a5,a5,1
	sw	a5,0(a4)
	beq	a5,a3,.L42
.L39:
	mv	a0,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_Z6CartBRj
.L42:
	li	a0,0
	la a2, .LANCHOR2; lbu a2, 0(a2);
	li	a1,32768
	call	_Z9setprg16rijj
	mv	a0,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_Z6CartBRj
	.size	_ZL7M68Readj, .-_ZL7M68Readj
	.section	.text._ZL10M68WriteLojh,"ax",@progbits
	.align	2
	.type	_ZL10M68WriteLojh, @function
_ZL10M68WriteLojh:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	mv	s0,a1
	mv	s1,a0
	bne	a1,zero,.L44
	la a5, .LANCHOR7; sw zero, 0(a5);
	la a5, PRGptr+4; lw a5, 0(a5);
	li	a0,0
	beq	a5,zero,.L45
	la a0, .LANCHOR1; lbu a0, 0(a0);
.L45:
	la a2, .LANCHOR2; lbu a2, 0(a2);
	li	a1,32768
	call	_Z9setprg16rijj
.L44:
	mv	a1,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	mv	a0,s1
	lw	s1,0(sp)
	addi	sp,sp,12
	tail	_Z6CartBWjh
	.size	_ZL10M68WriteLojh, .-_ZL10M68WriteLojh
	.section	.text._ZL8M68Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M68Powerv, @function
_ZL8M68Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	li	s0,32768
	la a5, .LANCHOR2; sb zero, 0(a5);
	la a5, .LANCHOR1; sb zero, 0(a5);
	call	_ZL4Syncv
	call	_ZL8M68NTfixv
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	li	a5,49152
	addi	a1,a5,-1
	lla	a2,_ZL7M68Readj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	li	s1,65536
	addi	a1,s1,-1
	lla	a2,_Z6CartBRj
	li	a0,49152
	call	_Z14SetReadHandleriiPFhjE
	li	a5,49152
	addi	a1,a5,-1
	lla	a2,_ZL11M68WriteCHRjh
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,53248
	lla	a2,_ZL11M68WriteNT1jh
	addi	a1,a1,-1
	li	a0,49152
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,57344
	lla	a2,_ZL11M68WriteNT2jh
	addi	a1,a1,-1
	li	a0,53248
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,61440
	lla	a2,_ZL11M68WriteMIRjh
	addi	a1,a1,-1
	li	a0,57344
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s1,-1
	lla	a2,_ZL11M68WriteROMjh
	li	a0,61440
	call	_Z15SetWriteHandleriiPFvjhE
	lla	a2,_ZL10M68WriteLojh
	li	a1,24576
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	li	a0,24576
	addi	a1,s0,-1
	lla	a2,_Z6CartBWjh
	addi	a0,a0,1
	call	_Z15SetWriteHandleriiPFvjhE
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	la a0, .LANCHOR8; lw a0, 0(a0);
	la a2, .LANCHOR6; lw a2, 0(a2);
	li	a1,24576
	srli	a0,a0,10
	addi	sp,sp,12
	tail	_Z16FCEU_CheatAddRAMijPh
	.size	_ZL8M68Powerv, .-_ZL8M68Powerv
	.section	.rodata._Z13Mapper68_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.section	.text._Z13Mapper68_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper68_InitP8CartInfo
	.hidden	_Z13Mapper68_InitP8CartInfo
	.type	_Z13Mapper68_InitP8CartInfo, @function
_Z13Mapper68_InitP8CartInfo:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	lla	a5,_ZL8M68Powerv
	sw	a5,0(a0)
	lla	a5,_ZL8M68Closev
	sw	a5,8(a0)
	lla	a5,_ZL12StateRestorei
	lla	s1,.LANCHOR8
	la a4, GameStateRestore; sw a5, 0(a4);
	mv	s0,a0
	li	a5,8192
	li	a0,8192
	sw	a5,0(s1)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s1)
	mv	a1,a0
	lla	a5,.LANCHOR6
	li	a0,16
	li	a3,1
	sw	a1,0(a5)
	call	_Z19SetupCartPRGMappingiPhji
	lw	a4,48(s0)
	lla	a5,.LANCHOR6
	lw	a0,0(a5)
	lw	a1,0(s1)
	beq	a4,zero,.L53
	sw	a0,12(s0)
	sw	a1,28(s0)
.L53:
	lla	a3,.LC0
	li	a2,0
	call	_Z10AddExStatePvjiPKc
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR9
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z13Mapper68_InitP8CartInfo, .-_Z13Mapper68_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"NT1"
	.align	2
.LC2:
	.string	"NT2"
	.align	2
.LC3:
	.string	"MIRR"
	.align	2
.LC4:
	.string	"PRG"
	.align	2
.LC5:
	.string	"KGME"
	.align	2
.LC6:
	.string	"CNT"
	.align	2
.LC7:
	.string	"CHR"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR9,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 96
_ZL9StateRegs:
	.word	_ZL3nt1
	.word	1
	.word	.LC1
	.word	_ZL3nt2
	.word	1
	.word	.LC2
	.word	_ZL4mirr
	.word	1
	.word	.LC3
	.word	_ZL7prg_reg
	.word	1
	.word	.LC4
	.word	_ZL6kogame
	.word	1
	.word	.LC5
	.word	_ZL5count
	.word	4
	.word	.LC6
	.word	_ZL7chr_reg
	.word	4
	.word	.LC7
	.word	0
	.zero	8
	.section	.sbss._ZL3nt1,"aw",@nobits
	.set	.LANCHOR4,. + 0
	.type	_ZL3nt1, @object
	.size	_ZL3nt1, 1
_ZL3nt1:
	.zero	1
	.section	.sbss._ZL3nt2,"aw",@nobits
	.set	.LANCHOR5,. + 0
	.type	_ZL3nt2, @object
	.size	_ZL3nt2, 1
_ZL3nt2:
	.zero	1
	.section	.sbss._ZL4WRAM,"aw",@nobits
	.align	2
	.set	.LANCHOR6,. + 0
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
	.section	.sbss._ZL5count,"aw",@nobits
	.align	2
	.set	.LANCHOR7,. + 0
	.type	_ZL5count, @object
	.size	_ZL5count, 4
_ZL5count:
	.zero	4
	.section	.sbss._ZL6kogame,"aw",@nobits
	.set	.LANCHOR1,. + 0
	.type	_ZL6kogame, @object
	.size	_ZL6kogame, 1
_ZL6kogame:
	.zero	1
	.section	.sbss._ZL7chr_reg,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL7chr_reg, @object
	.size	_ZL7chr_reg, 4
_ZL7chr_reg:
	.zero	4
	.section	.sbss._ZL7prg_reg,"aw",@nobits
	.set	.LANCHOR2,. + 0
	.type	_ZL7prg_reg, @object
	.size	_ZL7prg_reg, 1
_ZL7prg_reg:
	.zero	1
	.section	.sbss._ZL8WRAMSIZE,"aw",@nobits
	.align	2
	.set	.LANCHOR8,. + 0
	.type	_ZL8WRAMSIZE, @object
	.size	_ZL8WRAMSIZE, 4
_ZL8WRAMSIZE:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
