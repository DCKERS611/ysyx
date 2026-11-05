#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"emufile.cpp"
	.option nopic
	.text
	.section	.rodata._ZN12EMUFILE_FILE4openEPKcS1_.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"Found ROM '%s'\n"
	.align	2
.LC1:
	.string	"ROM '%s' not found, using default ROM '%s'\n"
	.section	.text._ZN12EMUFILE_FILE4openEPKcS1_,"ax",@progbits
	.align	2
	.globl	_ZN12EMUFILE_FILE4openEPKcS1_
	.hidden	_ZN12EMUFILE_FILE4openEPKcS1_
	.type	_ZN12EMUFILE_FILE4openEPKcS1_, @function
_ZN12EMUFILE_FILE4openEPKcS1_:
	addi	sp,sp,-20
	sw	s0,12(sp)
	sw	s1,8(sp)
	sw	ra,16(sp)
	la a5, .LANCHOR0; lw a5, 0(a5);
	sw	a1,0(sp)
	sw	a2,4(sp)
	mv	s0,a0
	lla	s1,.LANCHOR1
	ble	a5,zero,.L2
	lw	a0,0(s1)
	call	strcmp
	beq	a0,zero,.L8
.L2:
	lw	a2,0(s1)
	lw	a1,0(sp)
	lla	a0,.LC1
	call	printf
.L3:
	lw	a4,8(s1)
	lw	a3,4(s1)
	lw	a5,0(s1)
	lw	a4,0(a4)
	lw	a1,4(sp)
	sw	a3,0(s0)
	sw	zero,28(s0)
	sw	a4,32(s0)
	sw	a5,4(s0)
	addi	a0,s0,8
	call	strcpy
	lw	ra,16(sp)
	sb	zero,24(s0)
	lw	s0,12(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L8:
	lw	a1,0(sp)
	lla	a0,.LC0
	call	printf
	j	.L3
	.size	_ZN12EMUFILE_FILE4openEPKcS1_, .-_ZN12EMUFILE_FILE4openEPKcS1_
	.hidden	nroms
	.globl	nroms
	.hidden	roms
	.globl	roms
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC2:
	.string	"thwaite"
	.section	.data.roms,"aw"
	.align	2
	.set	.LANCHOR1,. + 0
	.type	roms, @object
	.size	roms, 12
roms:
	.word	.LC2
	.word	rom_thwaite_nes
	.word	rom_thwaite_nes_len
	.section	.sdata.nroms,"aw"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	nroms, @object
	.size	nroms, 4
nroms:
	.word	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
