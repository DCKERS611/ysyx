#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"ad_fileio.c"
	.option nopic
	.text
	.section	.rodata.open_file.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"Error: File %s can NOT be opened with mode %s\n"
	.section	.text.open_file,"ax",@progbits
	.align	2
	.globl	open_file
	.hidden	open_file
	.type	open_file, @function
open_file:
	addi	sp,sp,-16
	sw	s0,8(sp)
	mv	s0,a1
	mv	a5,a0
	mv	a1,a2
	mv	a0,s0
	sw	s1,4(sp)
	sw	a5,0(sp)
	sw	ra,12(sp)
	mv	s1,a2
	call	fopen
	lw	a5,0(sp)
	sw	a0,0(a5)
	beq	a0,zero,.L5
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L5:
	mv	a2,s1
	mv	a1,s0
	lla	a0,.LC0
	call	printf
	lw	s0,8(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	li	a0,1
	addi	sp,sp,16
	tail	bench_exit
	.size	open_file, .-open_file
	.section	.rodata.close_file.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"Error: Cannot close file\n"
	.section	.text.close_file,"ax",@progbits
	.align	2
	.globl	close_file
	.hidden	close_file
	.type	close_file, @function
close_file:
	lw	a0,0(a0)
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	fclose
	bne	a0,zero,.L9
	lw	ra,8(sp)
	addi	sp,sp,12
	jr	ra
.L9:
	lla	a0,.LC1
	call	printf
	lw	ra,8(sp)
	li	a0,1
	addi	sp,sp,12
	tail	bench_exit
	.size	close_file, .-close_file
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
