#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"sdl-video.cpp"
	.option nopic
	.text
	.section	.text._Z9KillVideov,"ax",@progbits
	.align	2
	.globl	_Z9KillVideov
	.hidden	_Z9KillVideov
	.type	_Z9KillVideov, @function
_Z9KillVideov:
	la a5, .LANCHOR0; lw a5, 0(a5);
	beq	a5,zero,.L3
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_Z14KillBlitToHighv
	lw	ra,8(sp)
	la a5, .LANCHOR0; sw zero, 0(a5);
	li	a0,0
	addi	sp,sp,12
	jr	ra
.L3:
	li	a0,-1
	ret
	.size	_Z9KillVideov, .-_Z9KillVideov
	.section	.text._Z18FCEUD_VideoChangedv,"ax",@progbits
	.align	2
	.globl	_Z18FCEUD_VideoChangedv
	.hidden	_Z18FCEUD_VideoChangedv
	.type	_Z18FCEUD_VideoChangedv, @function
_Z18FCEUD_VideoChangedv:
	la a5, PAL; sb zero, 0(a5);
	ret
	.size	_Z18FCEUD_VideoChangedv, .-_Z18FCEUD_VideoChangedv
	.section	.rodata._Z9InitVideoP6FCEUGI.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"Initializing video...\n"
	.section	.text._Z9InitVideoP6FCEUGI,"ax",@progbits
	.align	2
	.globl	_Z9InitVideoP6FCEUGI
	.hidden	_Z9InitVideoP6FCEUGI
	.type	_Z9InitVideoP6FCEUGI, @function
_Z9InitVideoP6FCEUGI:
	addi	sp,sp,-16
	lla	a0,.LC0
	sw	ra,12(sp)
	sw	s0,8(sp)
	call	printf
	li	s0,1
	li	a0,1
	la a5, .LANCHOR0; sw s0, 0(a5);
	call	_Z16FCEUI_SetShowFPSb
	li	a2,65536
	sw	zero,0(sp)
	li	a5,0
	li	a4,0
	li	a3,255
	addi	a2,a2,-256
	li	a1,16711680
	li	a0,4
	la t1, .LANCHOR1; sw s0, 0(t1);
	call	_Z14InitBlitToHighijjjiii
	lw	ra,12(sp)
	lw	s0,8(sp)
	li	a0,0
	addi	sp,sp,16
	jr	ra
	.size	_Z9InitVideoP6FCEUGI, .-_Z9InitVideoP6FCEUGI
	.section	.text._Z16FCEUD_SetPalettehhhh,"ax",@progbits
	.align	2
	.globl	_Z16FCEUD_SetPalettehhhh
	.hidden	_Z16FCEUD_SetPalettehhhh
	.type	_Z16FCEUD_SetPalettehhhh, @function
_Z16FCEUD_SetPalettehhhh:
	slli	a0,a0,2
	lla	a5,.LANCHOR2
	add	a5,a5,a0
	sb	a1,0(a5)
	sb	a2,1(a5)
	sb	a3,2(a5)
	li	a5,1
	la a4, .LANCHOR1; sw a5, 0(a4);
	ret
	.size	_Z16FCEUD_SetPalettehhhh, .-_Z16FCEUD_SetPalettehhhh
	.section	.rodata._Z10BlitScreenPh.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"\033[0;0H"
	.align	2
.LC2:
	.string	"o. *O0@#"
	.globl	__udivsi3
	.section	.text._Z10BlitScreenPh,"ax",@progbits
	.align	2
	.globl	_Z10BlitScreenPh
	.hidden	_Z10BlitScreenPh
	.type	_Z10BlitScreenPh, @function
_Z10BlitScreenPh:
	addi	sp,sp,-24
	sw	ra,20(sp)
	sw	s0,16(sp)
	sw	s1,12(sp)
	la a5, .LANCHOR1; lw a5, 0(a5);
	sw	a0,4(sp)
	bne	a5,zero,.L23
.L14:
	lla	a0,.LC1
	call	printf
	lw	a4,4(sp)
	li	a5,61440
	add	a5,a4,a5
	sw	a5,8(sp)
.L16:
	lw	a0,4(sp)
	li	a5,1
	lla	a1,.LANCHOR3
	sw	a5,0(sp)
	li	a4,1024
	li	a3,1
	li	a2,256
	call	_Z11Blit8ToHighPhS_iiiii
	li	a1,2236416
	lla	s1,.LANCHOR3
	addi	s0,a1,546
.L15:
	lw	a0,0(s1)
	mv	a1,s0
	addi	s1,s1,8
	call	__udivsi3
	lla	a5,.LC2
	add	a0,a5,a0
	lbu	a0,0(a0)
	call	putch
	lla	a5,.LANCHOR3+1024
	bne	s1,a5,.L15
	lw	a5,4(sp)
	li	a0,10
	addi	a5,a5,1024
	mv	s0,a5
	sw	a5,4(sp)
	call	putch
	lw	a4,8(sp)
	bne	a4,s0,.L16
	lw	ra,20(sp)
	lw	s0,16(sp)
	lw	s1,12(sp)
	addi	sp,sp,24
	jr	ra
.L23:
	lla	a0,.LANCHOR2
	call	_Z20SetPaletteBlitToHighPh
	la a5, .LANCHOR1; sw zero, 0(a5);
	j	.L14
	.size	_Z10BlitScreenPh, .-_Z10BlitScreenPh
	.section	.bss._ZL6s_psdl,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL6s_psdl, @object
	.size	_ZL6s_psdl, 1024
_ZL6s_psdl:
	.zero	1024
	.section	.bss._ZZ10BlitScreenPhE11canvas_line,"aw",@nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	_ZZ10BlitScreenPhE11canvas_line, @object
	.size	_ZZ10BlitScreenPhE11canvas_line, 1024
_ZZ10BlitScreenPhE11canvas_line:
	.zero	1024
	.section	.sbss._ZL16s_paletterefresh,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	_ZL16s_paletterefresh, @object
	.size	_ZL16s_paletterefresh, 4
_ZL16s_paletterefresh:
	.zero	4
	.section	.sbss._ZL8s_inited,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL8s_inited, @object
	.size	_ZL8s_inited, 4
_ZL8s_inited:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
