#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"myfun.c"
	.option nopic
	.text
	.section	.rodata.my_fputs.part.0.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"AM Panic: "
	.align	2
.LC1:
	.string	"Assertion `fp == stdout' failed"
	.align	2
.LC2:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/303.cproc/src/myfun.c:59  \n"
	.section	.text.my_fputs.part.0,"ax",@progbits
	.align	2
	.type	my_fputs.part.0, @function
my_fputs.part.0:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LC0
	li	a0,65
.L2:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L2
	lla	s0,.LC1
	li	a0,65
.L3:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L3
	lla	s0,.LC2
	li	a0,32
.L4:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L4
	li	a0,1
	call	halt
	.size	my_fputs.part.0, .-my_fputs.part.0
	.section	.text.my_getc,"ax",@progbits
	.align	2
	.globl	my_getc
	.hidden	my_getc
	.type	my_getc, @function
my_getc:
	la a5, .LANCHOR0; lw a5, 0(a5);
	beq	a5,zero,.L15
	la a5, .LANCHOR0; sw zero, 0(a5);
	la a0, .LANCHOR1; lbu a0, 0(a0);
	ret
.L15:
	tail	getc
	.size	my_getc, .-my_getc
	.section	.rodata.my_ungetc.str1.4,"aMS",@progbits,1
	.align	2
.LC3:
	.string	"Assertion `!char_buf_valid' failed"
	.align	2
.LC4:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/303.cproc/src/myfun.c:17  \n"
	.section	.text.my_ungetc,"ax",@progbits
	.align	2
	.globl	my_ungetc
	.hidden	my_ungetc
	.type	my_ungetc, @function
my_ungetc:
	lla	a4,.LANCHOR0
	lw	a3,0(a4)
	bne	a3,zero,.L27
	li	a3,1
	sw	a3,0(a4)
	la a4, .LANCHOR1; sb a0, 0(a4);
	ret
.L27:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LC0
	li	a0,65
.L18:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L18
	lla	s0,.LC3
	li	a0,65
.L19:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L19
	lla	s0,.LC4
	li	a0,32
.L20:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L20
	li	a0,1
	call	halt
	.size	my_ungetc, .-my_ungetc
	.section	.text.obuf_init,"ax",@progbits
	.align	2
	.globl	obuf_init
	.hidden	obuf_init
	.type	obuf_init, @function
obuf_init:
	li	a1,4096
	lla	a0,.LANCHOR2
	tail	bench_obuf_init
	.size	obuf_init, .-obuf_init
	.section	.rodata.obuf_display.str1.4,"aMS",@progbits,1
	.align	2
.LC5:
	.string	"\n"
	.align	2
.LC6:
	.string	"Warning: Output is truncated to %d bytes\n"
	.section	.text.obuf_display,"ax",@progbits
	.align	2
	.globl	obuf_display
	.hidden	obuf_display
	.type	obuf_display, @function
obuf_display:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR2
	lw	a1,4(s0)
	sw	ra,8(sp)
	li	a5,8388608
	la a3, stdout; lw a3, 0(a3);
	ble	a1,a5,.L30
	li	a1,8388608
.L30:
	lw	a0,0(s0)
	li	a2,1
	call	fwrite
	lla	a0,.LC5
	call	printf
	lw	a4,4(s0)
	li	a5,8388608
	bgt	a4,a5,.L33
	lw	ra,8(sp)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
.L33:
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a1,8388608
	lla	a0,.LC6
	addi	sp,sp,12
	tail	printf
	.size	obuf_display, .-obuf_display
	.section	.text.obuf_checksum,"ax",@progbits
	.align	2
	.globl	obuf_checksum
	.hidden	obuf_checksum
	.type	obuf_checksum, @function
obuf_checksum:
	lla	a5,.LANCHOR2
	lw	a0,0(a5)
	lw	a1,4(a5)
	add	a1,a0,a1
	tail	bench_checksum
	.size	obuf_checksum, .-obuf_checksum
	.section	.text.obuf_exit,"ax",@progbits
	.align	2
	.globl	obuf_exit
	.hidden	obuf_exit
	.type	obuf_exit, @function
obuf_exit:
	la a0, .LANCHOR2; lw a0, 0(a0);
	tail	free
	.size	obuf_exit, .-obuf_exit
	.section	.text.my_putchar,"ax",@progbits
	.align	2
	.globl	my_putchar
	.hidden	my_putchar
	.type	my_putchar, @function
my_putchar:
	addi	sp,sp,-16
	sw	a0,0(sp)
	mv	a1,sp
	lla	a0,.LANCHOR2
	li	a2,1
	sw	ra,12(sp)
	call	bench_obuf_append
	lw	ra,12(sp)
	lbu	a0,0(sp)
	addi	sp,sp,16
	jr	ra
	.size	my_putchar, .-my_putchar
	.section	.rodata.my_fputc.str1.4,"aMS",@progbits,1
	.align	2
.LC7:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/303.cproc/src/myfun.c:54  \n"
	.section	.text.my_fputc,"ax",@progbits
	.align	2
	.globl	my_fputc
	.hidden	my_fputc
	.type	my_fputc, @function
my_fputc:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	la a4, stdout; lw a4, 0(a4);
	bne	a4,a1,.L47
	mv	a5,a0
	mv	a1,sp
	lla	a0,.LANCHOR2
	li	a2,1
	sw	a5,0(sp)
	call	bench_obuf_append
	lw	ra,12(sp)
	lw	s0,8(sp)
	lbu	a0,0(sp)
	addi	sp,sp,16
	jr	ra
.L47:
	lla	s0,.LC0
	li	a0,65
.L40:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L40
	lla	s0,.LC1
	li	a0,65
.L41:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L41
	lla	s0,.LC7
	li	a0,32
.L42:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L42
	li	a0,1
	call	halt
	.size	my_fputc, .-my_fputc
	.section	.text.my_fputs,"ax",@progbits
	.align	2
	.globl	my_fputs
	.hidden	my_fputs
	.type	my_fputs, @function
my_fputs:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	la a5, stdout; lw a5, 0(a5);
	bne	a5,a1,.L51
	mv	s0,a0
	call	strlen
	mv	a2,a0
	mv	a1,s0
	lla	a0,.LANCHOR2
	call	bench_obuf_append
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,0
	addi	sp,sp,12
	jr	ra
.L51:
	call	my_fputs.part.0
	.size	my_fputs, .-my_fputs
	.section	.text.my_puts,"ax",@progbits
	.align	2
	.globl	my_puts
	.hidden	my_puts
	.type	my_puts, @function
my_puts:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	mv	s0,a0
	lla	s1,.LANCHOR2
	call	strlen
	mv	a2,a0
	mv	a1,s0
	mv	a0,s1
	call	bench_obuf_append
	mv	a0,s1
	mv	a1,sp
	li	a5,10
	li	a2,1
	sw	a5,0(sp)
	call	bench_obuf_append
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	li	a0,0
	addi	sp,sp,16
	jr	ra
	.size	my_puts, .-my_puts
	.section	.rodata.my_printf.str1.4,"aMS",@progbits,1
	.align	2
.LC8:
	.string	"Assertion `ret < 256' failed"
	.align	2
.LC9:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/303.cproc/src/myfun.c:75  \n"
	.section	.text.my_printf,"ax",@progbits
	.align	2
	.globl	my_printf
	.hidden	my_printf
	.type	my_printf, @function
my_printf:
	addi	sp,sp,-292
	addi	t1,sp,272
	sw	a1,272(sp)
	sw	a2,276(sp)
	sw	a3,280(sp)
	mv	a2,a0
	mv	a3,t1
	li	a1,256
	addi	a0,sp,4
	sw	a5,288(sp)
	sw	ra,268(sp)
	sw	s0,264(sp)
	sw	a4,284(sp)
	sw	t1,0(sp)
	call	vsnprintf
	li	a5,255
	bgt	a0,a5,.L63
	mv	s0,a0
	addi	a0,sp,4
	call	strlen
	mv	a2,a0
	addi	a1,sp,4
	lla	a0,.LANCHOR2
	call	bench_obuf_append
	lw	ra,268(sp)
	mv	a0,s0
	lw	s0,264(sp)
	addi	sp,sp,292
	jr	ra
.L63:
	lla	s0,.LC0
	li	a0,65
.L56:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L56
	lla	s0,.LC8
	li	a0,65
.L57:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L57
	lla	s0,.LC9
	li	a0,32
.L58:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L58
	li	a0,1
	call	halt
	.size	my_printf, .-my_printf
	.section	.text.__ucmpdi2,"ax",@progbits
	.align	2
	.globl	__ucmpdi2
	.hidden	__ucmpdi2
	.type	__ucmpdi2, @function
__ucmpdi2:
	bgtu	a3,a1,.L68
	beq	a3,a1,.L72
.L70:
	bgtu	a1,a3,.L69
	beq	a1,a3,.L73
.L71:
	li	a0,1
	ret
.L73:
	bleu	a0,a2,.L71
.L69:
	li	a0,2
	ret
.L72:
	bleu	a2,a0,.L70
.L68:
	li	a0,0
	ret
	.size	__ucmpdi2, .-__ucmpdi2
	.section	.text.strpbrk,"ax",@progbits
	.align	2
	.globl	strpbrk
	.hidden	strpbrk
	.type	strpbrk, @function
strpbrk:
	lbu	a3,0(a0)
	beq	a3,zero,.L80
	lbu	a2,0(a1)
.L76:
	mv	a5,a1
	mv	a4,a2
	bne	a2,zero,.L77
	j	.L78
.L84:
	lbu	a4,0(a5)
	beq	a4,zero,.L78
.L77:
	addi	a5,a5,1
	bne	a4,a3,.L84
	ret
.L78:
	lbu	a3,1(a0)
	addi	a0,a0,1
	bne	a3,zero,.L76
.L80:
	li	a0,0
	ret
	.size	strpbrk, .-strpbrk
	.section	.bss.obuf,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	obuf, @object
	.size	obuf, 12
obuf:
	.zero	12
	.section	.sbss.char_buf,"aw",@nobits
	.set	.LANCHOR1,. + 0
	.type	char_buf, @object
	.size	char_buf, 1
char_buf:
	.zero	1
	.section	.sbss.char_buf_valid,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	char_buf_valid, @object
	.size	char_buf_valid, 4
char_buf_valid:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
