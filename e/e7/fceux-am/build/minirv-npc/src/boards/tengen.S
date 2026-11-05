#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"tengen.cpp"
	.option nopic
	.text
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-12
	la a5, .LANCHOR1; lbu a5, 0(a5);
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LANCHOR0
	sw	s1,0(sp)
	andi	a5,a5,32
	lbu	a1,0(s0)
	beq	a5,zero,.L2
	li	a0,0
	call	_Z7setchr1jj
	lbu	a1,8(s0)
	li	a0,1024
	li	s1,4096
	call	_Z7setchr1jj
	lbu	a1,1(s0)
	addi	a0,s1,-2048
	call	_Z7setchr1jj
	lbu	a1,9(s0)
	addi	a0,s1,-1024
	call	_Z7setchr1jj
.L3:
	lbu	a1,2(s0)
	li	a0,4096
	li	s1,8192
	call	_Z7setchr1jj
	lbu	a1,3(s0)
	li	a0,4096
	addi	a0,a0,1024
	call	_Z7setchr1jj
	lbu	a1,4(s0)
	addi	a0,s1,-2048
	call	_Z7setchr1jj
	lbu	a1,5(s0)
	addi	a0,s1,-1024
	call	_Z7setchr1jj
	lbu	a1,6(s0)
	li	a0,32768
	call	_Z7setprg8jj
	lbu	a1,7(s0)
	li	a0,40960
	call	_Z7setprg8jj
	lbu	a1,10(s0)
	li	a0,49152
	call	_Z7setprg8jj
	li	a0,57344
	li	a1,-1
	call	_Z7setprg8jj
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	la a0, .LANCHOR2; lbu a0, 0(a0);
	addi	sp,sp,12
	tail	_Z9setmirrori
.L2:
	srli	a1,a1,1
	li	a0,0
	call	_Z7setchr2jj
	lbu	a1,1(s0)
	li	a0,4096
	addi	a0,a0,-2048
	srli	a1,a1,1
	call	_Z7setchr2jj
	j	.L3
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	tail	_ZL4Syncv
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL8M64Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M64Powerv, @function
_ZL8M64Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	lla	a5,.LANCHOR0
	li	a4,-1
	sw	a4,0(a5)
	sw	a4,4(a5)
	sh	a4,8(a5)
	sb	a4,10(a5)
	li	s0,65536
	la a3, .LANCHOR2; sb zero, 0(a3);
	la a3, .LANCHOR1; sb zero, 0(a3);
	call	_ZL4Syncv
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_ZL8M64Writejh
	li	a0,32768
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL8M64Powerv, .-_ZL8M64Powerv
	.section	.text._ZL8M64Writejh,"ax",@progbits
	.align	2
	.type	_ZL8M64Writejh, @function
_ZL8M64Writejh:
	li	a5,61440
	addi	a5,a5,1
	and	a0,a0,a5
	li	a5,49152
	beq	a0,a5,.L10
	bgtu	a0,a5,.L11
	li	a5,32768
	addi	a4,a5,1
	beq	a0,a4,.L12
	li	a4,40960
	bne	a0,a4,.L26
	not	a1,a1
	andi	a1,a1,1
	la a5, .LANCHOR2; sb a1, 0(a5);
	tail	_ZL4Syncv
.L11:
	li	a4,57344
	beq	a0,a4,.L16
	addi	a4,a4,1
	bne	a0,a4,.L27
	li	a5,1
	la a4, .LANCHOR7; sb a5, 0(a4);
	la a4, .LANCHOR4; lbu a4, 0(a4);
	beq	a4,a5,.L28
.L24:
	ret
.L27:
	addi	a5,a5,1
	bne	a0,a5,.L29
	la a5, .LANCHOR3; lbu a5, 0(a5);
	li	a4,1
	andi	a1,a1,1
	la a3, .LANCHOR4; sb a4, 0(a3);
	la a4, .LANCHOR5; sb a5, 0(a4);
	la a5, .LANCHOR6; sb a1, 0(a5);
	ret
.L26:
	bne	a0,a5,.L30
	la a5, .LANCHOR1; sb a1, 0(a5);
	ret
.L29:
	ret
.L30:
	ret
.L10:
	la a5, .LANCHOR3; sb a1, 0(a5);
	la a4, .LANCHOR4; lbu a4, 0(a4);
	li	a5,1
	bne	a4,a5,.L24
	la a5, .LANCHOR5; sb a1, 0(a5);
	ret
.L12:
	la a5, .LANCHOR1; lbu a5, 0(a5);
	andi	a5,a5,15
	li	a4,9
	bgtu	a5,a4,.L19
	lla	a4,.LANCHOR0
	add	a5,a4,a5
	sb	a1,0(a5)
.L20:
	tail	_ZL4Syncv
.L16:
	addi	sp,sp,-12
	li	a0,1
	la a5, .LANCHOR7; sb zero, 0(a5);
	sw	ra,8(sp)
	call	_Z12X6502_IRQEndi
	la a4, .LANCHOR4; lbu a4, 0(a4);
	li	a5,1
	bne	a4,a5,.L9
	la a5, .LANCHOR3; lbu a5, 0(a5);
	la a4, .LANCHOR5; sb a5, 0(a4);
.L9:
	lw	ra,8(sp)
	addi	sp,sp,12
	jr	ra
.L19:
	li	a4,15
	bne	a5,a4,.L20
	la a5, .LANCHOR0+10; sb a1, 0(a5);
	j	.L20
.L28:
	la a5, .LANCHOR3; lbu a5, 0(a5);
	la a4, .LANCHOR5; sb a5, 0(a4);
	ret
	.size	_ZL8M64Writejh, .-_ZL8M64Writejh
	.section	.text._ZL10M64IRQHooki,"ax",@progbits
	.align	2
	.type	_ZL10M64IRQHooki, @function
_ZL10M64IRQHooki:
	la a5, .LANCHOR6; lbu a5, 0(a5);
	beq	a5,zero,.L41
	addi	sp,sp,-12
	sw	s1,0(sp)
	lla	s1,.LANCHOR8
	lw	a4,0(s1)
	sw	ra,8(sp)
	sw	s0,4(sp)
	add	a0,a0,a4
	li	a5,3
	sw	a0,0(s1)
	ble	a0,a5,.L31
	lla	s0,.LANCHOR5
	lla	a3,.LANCHOR7
	j	.L35
.L34:
	li	a5,3
	ble	a0,a5,.L31
.L35:
	lbu	a5,0(s0)
	addi	a0,a0,-4
	sw	a0,0(s1)
	addi	a5,a5,-1
	andi	a5,a5,0xff
	sb	a5,0(s0)
	li	a4,255
	bne	a5,a4,.L34
	lbu	a5,0(a3)
	beq	a5,zero,.L34
	li	a0,1
	call	_Z14X6502_IRQBegini
	lw	a0,0(s1)
	li	a5,3
	lla	a3,.LANCHOR7
	bgt	a0,a5,.L35
.L31:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L41:
	ret
	.size	_ZL10M64IRQHooki, .-_ZL10M64IRQHooki
	.section	.text._ZL9M64HBHookv,"ax",@progbits
	.align	2
	.type	_ZL9M64HBHookv, @function
_ZL9M64HBHookv:
	la a5, .LANCHOR6; lbu a5, 0(a5);
	bne	a5,zero,.L44
	la a4, scanline; lw a4, 0(a4);
	li	a5,240
	beq	a4,a5,.L44
	lla	a4,.LANCHOR5
	lbu	a5,0(a4)
	la a3, .LANCHOR4; sb zero, 0(a3);
	li	a3,255
	addi	a5,a5,-1
	andi	a5,a5,0xff
	sb	a5,0(a4)
	beq	a5,a3,.L51
.L44:
	ret
.L51:
	la a5, .LANCHOR7; lbu a5, 0(a5);
	beq	a5,zero,.L44
	li	a5,1
	li	a0,1
	la a4, .LANCHOR4; sb a5, 0(a4);
	tail	_Z14X6502_IRQBegini
	.size	_ZL9M64HBHookv, .-_ZL9M64HBHookv
	.section	.text._Z13Mapper64_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper64_InitP8CartInfo
	.hidden	_Z13Mapper64_InitP8CartInfo
	.type	_Z13Mapper64_InitP8CartInfo, @function
_Z13Mapper64_InitP8CartInfo:
	lla	a5,_ZL8M64Powerv
	sw	a5,0(a0)
	lla	a5,_ZL9M64HBHookv
	la a4, GameHBIRQHook; sw a5, 0(a4);
	lla	a5,_ZL10M64IRQHooki
	la a4, MapIRQHook; sw a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR9
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z13Mapper64_InitP8CartInfo, .-_Z13Mapper64_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"REGS"
	.align	2
.LC1:
	.string	"CMDR"
	.align	2
.LC2:
	.string	"MIRR"
	.align	2
.LC3:
	.string	"RMOD"
	.align	2
.LC4:
	.string	"IRQM"
	.align	2
.LC5:
	.string	"IRQC"
	.align	2
.LC6:
	.string	"IRQA"
	.align	2
.LC7:
	.string	"IRQL"
	.section	.bss._ZL4regs,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL4regs, @object
	.size	_ZL4regs, 11
_ZL4regs:
	.zero	11
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR9,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 108
_ZL9StateRegs:
	.word	_ZL4regs
	.word	11
	.word	.LC0
	.word	_ZL3cmd
	.word	1
	.word	.LC1
	.word	_ZL4mirr
	.word	1
	.word	.LC2
	.word	_ZL5rmode
	.word	1
	.word	.LC3
	.word	_ZL7IRQmode
	.word	1
	.word	.LC4
	.word	_ZL8IRQCount
	.word	1
	.word	.LC5
	.word	_ZL4IRQa
	.word	1
	.word	.LC6
	.word	_ZL8IRQLatch
	.word	1
	.word	.LC7
	.word	0
	.zero	8
	.section	.sbss._ZL3cmd,"aw",@nobits
	.set	.LANCHOR1,. + 0
	.type	_ZL3cmd, @object
	.size	_ZL3cmd, 1
_ZL3cmd:
	.zero	1
	.section	.sbss._ZL4IRQa,"aw",@nobits
	.set	.LANCHOR7,. + 0
	.type	_ZL4IRQa, @object
	.size	_ZL4IRQa, 1
_ZL4IRQa:
	.zero	1
	.section	.sbss._ZL4mirr,"aw",@nobits
	.set	.LANCHOR2,. + 0
	.type	_ZL4mirr, @object
	.size	_ZL4mirr, 1
_ZL4mirr:
	.zero	1
	.section	.sbss._ZL5rmode,"aw",@nobits
	.set	.LANCHOR4,. + 0
	.type	_ZL5rmode, @object
	.size	_ZL5rmode, 1
_ZL5rmode:
	.zero	1
	.section	.sbss._ZL7IRQmode,"aw",@nobits
	.set	.LANCHOR6,. + 0
	.type	_ZL7IRQmode, @object
	.size	_ZL7IRQmode, 1
_ZL7IRQmode:
	.zero	1
	.section	.sbss._ZL8IRQCount,"aw",@nobits
	.set	.LANCHOR5,. + 0
	.type	_ZL8IRQCount, @object
	.size	_ZL8IRQCount, 1
_ZL8IRQCount:
	.zero	1
	.section	.sbss._ZL8IRQLatch,"aw",@nobits
	.set	.LANCHOR3,. + 0
	.type	_ZL8IRQLatch, @object
	.size	_ZL8IRQLatch, 1
_ZL8IRQLatch:
	.zero	1
	.section	.sbss._ZZL10M64IRQHookiE10smallcount,"aw",@nobits
	.align	2
	.set	.LANCHOR8,. + 0
	.type	_ZZL10M64IRQHookiE10smallcount, @object
	.size	_ZZL10M64IRQHookiE10smallcount, 4
_ZZL10M64IRQHookiE10smallcount:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
