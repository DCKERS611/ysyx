#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"80.cpp"
	.option nopic
	.text
	.section	.text._ZL11M80RamWritejh,"ax",@progbits
	.align	2
	.type	_ZL11M80RamWritejh, @function
_ZL11M80RamWritejh:
	la a4, .LANCHOR0; lbu a4, 0(a4);
	li	a5,163
	beq	a4,a5,.L4
	ret
.L4:
	andi	a0,a0,255
	lla	a5,.LANCHOR1
	add	a5,a5,a0
	sb	a1,0(a5)
	ret
	.size	_ZL11M80RamWritejh, .-_ZL11M80RamWritejh
	.section	.text._ZL10M80RamReadj,"ax",@progbits
	.align	2
	.type	_ZL10M80RamReadj, @function
_ZL10M80RamReadj:
	la a4, .LANCHOR0; lbu a4, 0(a4);
	li	a5,163
	beq	a4,a5,.L8
	li	a0,255
	ret
.L8:
	andi	a0,a0,255
	lla	a5,.LANCHOR1
	add	a5,a5,a0
	lbu	a0,0(a5)
	ret
	.size	_ZL10M80RamReadj, .-_ZL10M80RamReadj
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	lla	s1,.LANCHOR2
	lbu	a1,0(s1)
	li	a0,32768
	lla	s0,.LANCHOR3
	call	_Z7setprg8jj
	lbu	a1,1(s1)
	li	a0,40960
	call	_Z7setprg8jj
	lbu	a1,2(s1)
	li	a0,49152
	li	s1,4096
	call	_Z7setprg8jj
	li	a1,-1
	li	a0,57344
	call	_Z7setprg8jj
	lbu	a1,0(s0)
	li	a0,0
	srli	a1,a1,1
	andi	a1,a1,63
	call	_Z7setchr2jj
	lbu	a1,1(s0)
	addi	a0,s1,-2048
	srli	a1,a1,1
	andi	a1,a1,63
	call	_Z7setchr2jj
	lbu	a1,2(s0)
	li	a0,4096
	call	_Z7setchr1jj
	lbu	a1,3(s0)
	addi	a0,s1,1024
	call	_Z7setchr1jj
	lbu	a1,4(s0)
	li	a5,8192
	addi	a0,a5,-2048
	mv	s1,a5
	call	_Z7setchr1jj
	lbu	a1,5(s0)
	addi	a0,s1,-1024
	call	_Z7setchr1jj
	la a5, .LANCHOR4; lbu a5, 0(a5);
	beq	a5,zero,.L10
	la a4, .LANCHOR6; lw a4, 0(a4);
	lla	a5,.LANCHOR5
	add	a5,a5,a4
	lbu	a0,0(a5)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	addi	a0,a0,2
	addi	sp,sp,12
	tail	_Z9setmirrori
.L10:
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	la a0, .LANCHOR7; lbu a0, 0(a0);
	addi	sp,sp,12
	tail	_Z9setmirrori
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	tail	_ZL4Syncv
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL8M80Writejh,"ax",@progbits
	.align	2
	.type	_ZL8M80Writejh, @function
_ZL8M80Writejh:
	li	a5,-32768
	addi	a5,a5,272
	add	a0,a0,a5
	li	a5,15
	bgtu	a0,a5,.L14
	lla	a4,.L17
	slli	a0,a0,2
	add	a0,a0,a4
	lw	a5,0(a0)
	add	a5,a5,a4
	jr	a5
	.section	.rodata._ZL8M80Writejh,"a",@progbits
	.align	2
	.align	2
.L17:
	.word	.L27-.L17
	.word	.L26-.L17
	.word	.L25-.L17
	.word	.L24-.L17
	.word	.L23-.L17
	.word	.L22-.L17
	.word	.L21-.L17
	.word	.L14-.L17
	.word	.L20-.L17
	.word	.L14-.L17
	.word	.L19-.L17
	.word	.L19-.L17
	.word	.L18-.L17
	.word	.L18-.L17
	.word	.L16-.L17
	.word	.L16-.L17
	.section	.text._ZL8M80Writejh
.L16:
	la a5, .LANCHOR2+2; sb a1, 0(a5);
	tail	_ZL4Syncv
.L19:
	la a5, .LANCHOR2; sb a1, 0(a5);
	tail	_ZL4Syncv
.L18:
	la a5, .LANCHOR2+1; sb a1, 0(a5);
	tail	_ZL4Syncv
.L14:
	ret
.L24:
	srli	a5,a1,7
	la a4, .LANCHOR3+3; sb a1, 0(a4);
	la a4, .LANCHOR5+5; sb a5, 0(a4);
	tail	_ZL4Syncv
.L20:
	la a5, .LANCHOR0; sb a1, 0(a5);
	ret
.L23:
	srli	a5,a1,7
	la a4, .LANCHOR3+4; sb a1, 0(a4);
	la a4, .LANCHOR5+6; sb a5, 0(a4);
	tail	_ZL4Syncv
.L22:
	srli	a5,a1,7
	la a4, .LANCHOR3+5; sb a1, 0(a4);
	la a4, .LANCHOR5+7; sb a5, 0(a4);
	tail	_ZL4Syncv
.L21:
	andi	a1,a1,1
	la a5, .LANCHOR7; sb a1, 0(a5);
	tail	_ZL4Syncv
.L26:
	srli	a4,a1,7
	lla	a5,.LANCHOR5
	la a3, .LANCHOR3+1; sb a1, 0(a3);
	sb	a4,3(a5)
	sb	a4,2(a5)
	tail	_ZL4Syncv
.L25:
	srli	a5,a1,7
	la a4, .LANCHOR3+2; sb a1, 0(a4);
	la a4, .LANCHOR5+4; sb a5, 0(a4);
	tail	_ZL4Syncv
.L27:
	srli	a4,a1,7
	lla	a5,.LANCHOR5
	la a3, .LANCHOR3; sb a1, 0(a3);
	sb	a4,1(a5)
	sb	a4,0(a5)
	tail	_ZL4Syncv
	.size	_ZL8M80Writejh, .-_ZL8M80Writejh
	.section	.text._ZL8M80Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M80Powerv, @function
_ZL8M80Powerv:
	addi	sp,sp,-12
	li	a5,-1
	sw	ra,8(sp)
	sw	s0,4(sp)
	la a4, .LANCHOR0; sb a5, 0(a4);
	li	s0,32768
	call	_ZL4Syncv
	addi	a1,s0,-1
	addi	a0,s0,-256
	lla	a2,_ZL10M80RamReadj
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	addi	a0,s0,-256
	lla	a2,_ZL11M80RamWritejh
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-257
	addi	a0,s0,-272
	lla	a2,_ZL8M80Writejh
	call	_Z15SetWriteHandleriiPFvjhE
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,32768
	addi	sp,sp,12
	tail	_Z14SetReadHandleriiPFhjE
	.size	_ZL8M80Powerv, .-_ZL8M80Powerv
	.section	.text._ZL8M95Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M95Powerv, @function
_ZL8M95Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	lla	a5,.LANCHOR5
	li	a4,-2
	sw	zero,0(a5)
	sw	zero,4(a5)
	li	s0,65536
	la a3, .LANCHOR2+2; sb a4, 0(a3);
	call	_ZL4Syncv
	addi	a1,s0,-1
	lla	a2,_ZL8M95Writejh
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_Z6CartBRj
	li	a0,32768
	addi	sp,sp,12
	tail	_Z14SetReadHandleriiPFhjE
	.size	_ZL8M95Powerv, .-_ZL8M95Powerv
	.section	.text._ZL9M207Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M207Powerv, @function
_ZL9M207Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	lla	a5,.LANCHOR5
	sw	zero,0(a5)
	sw	zero,4(a5)
	call	_ZL4Syncv
	li	a0,32768
	addi	a1,a0,-257
	lla	a2,_ZL8M80Writejh
	addi	a0,a0,-272
	call	_Z15SetWriteHandleriiPFvjhE
	lw	ra,8(sp)
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,32768
	addi	sp,sp,12
	tail	_Z14SetReadHandleriiPFhjE
	.size	_ZL9M207Powerv, .-_ZL9M207Powerv
	.section	.text._ZL8M95Writejh,"ax",@progbits
	.align	2
	.type	_ZL8M95Writejh, @function
_ZL8M95Writejh:
	li	a5,61440
	addi	a5,a5,1
	and	a0,a0,a5
	li	a5,32768
	beq	a0,a5,.L35
	addi	a5,a5,1
	bne	a0,a5,.L50
	la a5, .LANCHOR8; lbu a5, 0(a5);
	andi	a5,a5,7
	lla	a4,.L40
	slli	a5,a5,2
	add	a5,a5,a4
	lw	a5,0(a5)
	addi	sp,sp,-12
	sw	ra,8(sp)
	add	a5,a5,a4
	jr	a5
	.section	.rodata._ZL8M95Writejh,"a",@progbits
	.align	2
	.align	2
.L40:
	.word	.L38-.L40
	.word	.L46-.L40
	.word	.L45-.L40
	.word	.L44-.L40
	.word	.L43-.L40
	.word	.L42-.L40
	.word	.L41-.L40
	.word	.L39-.L40
	.section	.text._ZL8M95Writejh
.L50:
	ret
.L35:
	la a5, .LANCHOR8; sb a1, 0(a5);
	ret
.L39:
	la a5, .LANCHOR2+1; sb a1, 0(a5);
	call	_ZL4Syncv
.L47:
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_ZL4Syncv
.L41:
	la a5, .LANCHOR2; sb a1, 0(a5);
	call	_ZL4Syncv
	j	.L47
.L42:
	srli	a5,a1,5
	andi	a5,a5,1
	andi	a1,a1,31
	la a4, .LANCHOR3+5; sb a1, 0(a4);
	la a4, .LANCHOR5+7; sb a5, 0(a4);
	call	_ZL4Syncv
	j	.L47
.L43:
	srli	a5,a1,5
	andi	a5,a5,1
	andi	a1,a1,31
	la a4, .LANCHOR3+4; sb a1, 0(a4);
	la a4, .LANCHOR5+6; sb a5, 0(a4);
	call	_ZL4Syncv
	j	.L47
.L44:
	srli	a5,a1,5
	andi	a5,a5,1
	andi	a1,a1,31
	la a4, .LANCHOR3+3; sb a1, 0(a4);
	la a4, .LANCHOR5+5; sb a5, 0(a4);
	call	_ZL4Syncv
	j	.L47
.L45:
	srli	a5,a1,5
	andi	a5,a5,1
	andi	a1,a1,31
	la a4, .LANCHOR3+2; sb a1, 0(a4);
	la a4, .LANCHOR5+4; sb a5, 0(a4);
	call	_ZL4Syncv
	j	.L47
.L46:
	srli	a5,a1,5
	andi	a5,a5,1
	lla	a4,.LANCHOR5
	andi	a1,a1,31
	sb	a5,3(a4)
	sb	a5,2(a4)
	la a3, .LANCHOR3+1; sb a1, 0(a3);
	call	_ZL4Syncv
	j	.L47
.L38:
	srli	a5,a1,5
	andi	a5,a5,1
	lla	a4,.LANCHOR5
	andi	a1,a1,31
	sb	a5,1(a4)
	sb	a5,0(a4)
	la a3, .LANCHOR3; sb a1, 0(a3);
	call	_ZL4Syncv
	j	.L47
	.size	_ZL8M95Writejh, .-_ZL8M95Writejh
	.section	.text._ZL10MExMirrPPUj,"ax",@progbits
	.align	2
	.type	_ZL10MExMirrPPUj, @function
_ZL10MExMirrPPUj:
	li	a5,8192
	bgeu	a0,a5,.L56
	addi	sp,sp,-12
	srli	a0,a0,10
	lla	a5,.LANCHOR5
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	add	a5,a5,a0
	lb	a5,0(a5)
	lla	s0,.LANCHOR10
	lb	a4,0(s0)
	lla	s1,.LANCHOR9
	la a3, .LANCHOR6; sw a0, 0(a3);
	sb	a5,0(s1)
	bne	a4,a5,.L59
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L56:
	ret
.L59:
	addi	a0,a5,2
	call	_Z9setmirrori
	lbu	a5,0(s1)
	lw	ra,8(sp)
	lw	s1,0(sp)
	sb	a5,0(s0)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
	.size	_ZL10MExMirrPPUj, .-_ZL10MExMirrPPUj
	.section	.text._Z13Mapper80_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper80_InitP8CartInfo
	.hidden	_Z13Mapper80_InitP8CartInfo
	.type	_Z13Mapper80_InitP8CartInfo, @function
_Z13Mapper80_InitP8CartInfo:
	lla	a4,_ZL8M80Powerv
	sw	a4,0(a0)
	lw	a5,48(a0)
	la a4, .LANCHOR4; sb zero, 0(a4);
	lla	a4,_ZL12StateRestorei
	la a3, GameStateRestore; sw a4, 0(a3);
	beq	a5,zero,.L61
	lla	a5,.LANCHOR1
	sw	a5,12(a0)
	li	a5,256
	sw	a5,28(a0)
.L61:
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR11
	tail	_Z10AddExStatePvjiPKc
	.size	_Z13Mapper80_InitP8CartInfo, .-_Z13Mapper80_InitP8CartInfo
	.section	.text._Z13Mapper95_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper95_InitP8CartInfo
	.hidden	_Z13Mapper95_InitP8CartInfo
	.type	_Z13Mapper95_InitP8CartInfo, @function
_Z13Mapper95_InitP8CartInfo:
	lla	a5,_ZL8M95Powerv
	sw	a5,0(a0)
	li	a5,1
	la a4, .LANCHOR4; sb a5, 0(a4);
	lla	a5,_ZL10MExMirrPPUj
	la a4, PPU_hook; sw a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR12
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z13Mapper95_InitP8CartInfo, .-_Z13Mapper95_InitP8CartInfo
	.section	.text._Z14Mapper207_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper207_InitP8CartInfo
	.hidden	_Z14Mapper207_InitP8CartInfo
	.type	_Z14Mapper207_InitP8CartInfo, @function
_Z14Mapper207_InitP8CartInfo:
	lla	a5,_ZL9M207Powerv
	sw	a5,0(a0)
	li	a5,1
	la a4, .LANCHOR4; sb a5, 0(a4);
	lla	a5,_ZL10MExMirrPPUj
	la a4, PPU_hook; sw a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR13
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper207_InitP8CartInfo, .-_Z14Mapper207_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"PREG"
	.align	2
.LC1:
	.string	"CREG"
	.align	2
.LC2:
	.string	"MCCH"
	.align	2
.LC3:
	.string	"LPPU"
	.align	2
.LC4:
	.string	"CMDR"
	.align	2
.LC5:
	.string	"WRAM"
	.align	2
.LC6:
	.string	"MIRR"
	.align	2
.LC7:
	.string	"WRME"
	.section	.bss._ZL4wram,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	_ZL4wram, @object
	.size	_ZL4wram, 256
_ZL4wram:
	.zero	256
	.section	.data._ZL11StateRegs80,"aw"
	.align	2
	.set	.LANCHOR11,. + 0
	.type	_ZL11StateRegs80, @object
	.size	_ZL11StateRegs80, 72
_ZL11StateRegs80:
	.word	_ZL4preg
	.word	3
	.word	.LC0
	.word	_ZL4creg
	.word	6
	.word	.LC1
	.word	_ZL4wram
	.word	256
	.word	.LC5
	.word	_ZL4mirr
	.word	1
	.word	.LC6
	.word	_ZL11wram_enable
	.word	1
	.word	.LC7
	.word	0
	.zero	8
	.section	.data._ZL11StateRegs95,"aw"
	.align	2
	.set	.LANCHOR12,. + 0
	.type	_ZL11StateRegs95, @object
	.size	_ZL11StateRegs95, 72
_ZL11StateRegs95:
	.word	_ZL3cmd
	.word	1
	.word	.LC4
	.word	_ZL4preg
	.word	3
	.word	.LC0
	.word	_ZL4creg
	.word	6
	.word	.LC1
	.word	_ZL6mcache
	.word	8
	.word	.LC2
	.word	_ZL7lastppu
	.word	4
	.word	.LC3
	.word	0
	.zero	8
	.section	.data._ZL12StateRegs207,"aw"
	.align	2
	.set	.LANCHOR13,. + 0
	.type	_ZL12StateRegs207, @object
	.size	_ZL12StateRegs207, 60
_ZL12StateRegs207:
	.word	_ZL4preg
	.word	3
	.word	.LC0
	.word	_ZL4creg
	.word	6
	.word	.LC1
	.word	_ZL6mcache
	.word	8
	.word	.LC2
	.word	_ZL7lastppu
	.word	4
	.word	.LC3
	.word	0
	.zero	8
	.section	.sbss._ZL11wram_enable,"aw",@nobits
	.set	.LANCHOR0,. + 0
	.type	_ZL11wram_enable, @object
	.size	_ZL11wram_enable, 1
_ZL11wram_enable:
	.zero	1
	.section	.sbss._ZL3cmd,"aw",@nobits
	.set	.LANCHOR8,. + 0
	.type	_ZL3cmd, @object
	.size	_ZL3cmd, 1
_ZL3cmd:
	.zero	1
	.section	.sbss._ZL4creg,"aw",@nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	_ZL4creg, @object
	.size	_ZL4creg, 6
_ZL4creg:
	.zero	6
	.section	.sbss._ZL4mirr,"aw",@nobits
	.set	.LANCHOR7,. + 0
	.type	_ZL4mirr, @object
	.size	_ZL4mirr, 1
_ZL4mirr:
	.zero	1
	.section	.sbss._ZL4preg,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL4preg, @object
	.size	_ZL4preg, 3
_ZL4preg:
	.zero	3
	.section	.sbss._ZL6mcache,"aw",@nobits
	.align	2
	.set	.LANCHOR5,. + 0
	.type	_ZL6mcache, @object
	.size	_ZL6mcache, 8
_ZL6mcache:
	.zero	8
	.section	.sbss._ZL7lastppu,"aw",@nobits
	.align	2
	.set	.LANCHOR6,. + 0
	.type	_ZL7lastppu, @object
	.size	_ZL7lastppu, 4
_ZL7lastppu:
	.zero	4
	.section	.sbss._ZL8isExMirr,"aw",@nobits
	.set	.LANCHOR4,. + 0
	.type	_ZL8isExMirr, @object
	.size	_ZL8isExMirr, 1
_ZL8isExMirr:
	.zero	1
	.section	.sbss._ZZL10MExMirrPPUjE7curmirr,"aw",@nobits
	.set	.LANCHOR9,. + 0
	.type	_ZZL10MExMirrPPUjE7curmirr, @object
	.size	_ZZL10MExMirrPPUjE7curmirr, 1
_ZZL10MExMirrPPUjE7curmirr:
	.zero	1
	.section	.sdata._ZZL10MExMirrPPUjE8lastmirr,"aw"
	.set	.LANCHOR10,. + 0
	.type	_ZZL10MExMirrPPUjE8lastmirr, @object
	.size	_ZZL10MExMirrPPUjE8lastmirr, 1
_ZZL10MExMirrPPUjE8lastmirr:
	.byte	-1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
