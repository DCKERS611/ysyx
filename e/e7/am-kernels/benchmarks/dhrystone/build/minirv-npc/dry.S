#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"dry.c"
	.option nopic
	.text
	.section	.text.Proc_2,"ax",@progbits
	.align	2
	.globl	Proc_2
	.hidden	Proc_2
	.type	Proc_2, @function
Proc_2:
	la a4, .LANCHOR0; lbu a4, 0(a4);
	li	a5,65
	beq	a4,a5,.L4
	ret
.L4:
	lw	a5,0(a0)
	la a4, .LANCHOR1; lw a4, 0(a4);
	addi	a5,a5,9
	sub	a5,a5,a4
	sw	a5,0(a0)
	ret
	.size	Proc_2, .-Proc_2
	.section	.text.Proc_3,"ax",@progbits
	.align	2
	.globl	Proc_3
	.hidden	Proc_3
	.type	Proc_3, @function
Proc_3:
	lla	a4,.LANCHOR2
	lw	a5,0(a4)
	beq	a5,zero,.L6
	lw	a5,0(a5)
	sw	a5,0(a0)
	lw	a5,0(a4)
.L6:
	la a4, .LANCHOR1; lw a4, 0(a4);
	addi	a4,a4,12
	sw	a4,12(a5)
	ret
	.size	Proc_3, .-Proc_3
	.section	.text.Proc_4,"ax",@progbits
	.align	2
	.globl	Proc_4
	.hidden	Proc_4
	.type	Proc_4, @function
Proc_4:
	lla	a4,.LANCHOR3
	lw	a3,0(a4)
	la a5, .LANCHOR0; lbu a5, 0(a5);
	addi	a5,a5,-65
	seqz	a5,a5
	or	a5,a5,a3
	sw	a5,0(a4)
	li	a5,66
	la a4, .LANCHOR4; sb a5, 0(a4);
	ret
	.size	Proc_4, .-Proc_4
	.section	.text.Proc_5,"ax",@progbits
	.align	2
	.globl	Proc_5
	.hidden	Proc_5
	.type	Proc_5, @function
Proc_5:
	li	a5,65
	la a4, .LANCHOR0; sb a5, 0(a4);
	la a5, .LANCHOR3; sw zero, 0(a5);
	ret
	.size	Proc_5, .-Proc_5
	.section	.text.Proc_6,"ax",@progbits
	.align	2
	.globl	Proc_6
	.hidden	Proc_6
	.type	Proc_6, @function
Proc_6:
	li	a4,2
	beq	a0,a4,.L13
	li	a5,3
	sw	a5,0(a1)
	li	a5,1
	beq	a0,a5,.L14
	bleu	a0,a5,.L18
	li	a5,4
	bne	a0,a5,.L19
	sw	a4,0(a1)
.L12:
	ret
.L14:
	la a4, .LANCHOR1; lw a4, 0(a4);
	li	a5,100
	ble	a4,a5,.L12
.L18:
	sw	zero,0(a1)
	ret
.L19:
	ret
.L13:
	li	a5,1
	sw	a5,0(a1)
	ret
	.size	Proc_6, .-Proc_6
	.section	.text.Proc_1,"ax",@progbits
	.align	2
	.globl	Proc_1
	.hidden	Proc_1
	.type	Proc_1, @function
Proc_1:
	lla	a4,.LANCHOR2
	lw	a5,0(a4)
	addi	sp,sp,-28
	sw	s0,20(sp)
	lw	a2,20(a5)
	lw	s0,0(a0)
	lw	a1,24(a5)
	lw	t1,28(a5)
	lw	a3,0(a5)
	sw	a2,0(sp)
	lw	a2,32(a5)
	lw	t0,16(a5)
	sw	s1,16(sp)
	sw	ra,24(sp)
	lw	s1,4(a5)
	lw	t2,8(a5)
	sw	a1,4(sp)
	sw	t1,8(sp)
	lw	a1,40(a5)
	lw	t1,36(a5)
	sw	a2,12(sp)
	lw	a2,44(a5)
	sw	a3,0(s0)
	lw	a3,0(a0)
	sw	t0,16(s0)
	lw	t0,0(sp)
	sw	s1,4(s0)
	sw	t2,8(s0)
	sw	t0,20(s0)
	lw	t0,4(sp)
	sw	t0,24(s0)
	lw	t0,8(sp)
	sw	t0,28(s0)
	lw	t0,12(sp)
	sw	t0,32(s0)
	sw	a2,44(s0)
	sw	t1,36(s0)
	sw	a1,40(s0)
	li	a2,5
	sw	a2,12(a0)
	sw	a3,0(s0)
	lw	s1,0(a5)
	la a5, .LANCHOR1; lw a5, 0(a5);
	addi	a5,a5,12
	sw	s1,0(s0)
	lw	a4,0(a4)
	sw	a2,12(s0)
	sw	a5,12(a4)
	lw	a5,4(s0)
	beq	a5,zero,.L24
	lw	a5,0(a0)
	lw	ra,24(sp)
	lw	a4,32(a5)
	lw	a3,28(a5)
	lw	s1,0(a5)
	sw	a4,0(sp)
	lw	a4,36(a5)
	lw	s0,4(a5)
	lw	t2,8(a5)
	lw	t0,12(a5)
	lw	t1,16(a5)
	lw	a1,20(a5)
	lw	a2,24(a5)
	sw	a4,4(sp)
	lw	a4,40(a5)
	lw	a5,44(a5)
	sw	a3,28(a0)
	lw	a3,0(sp)
	sw	s0,4(a0)
	lw	s0,20(sp)
	sw	a3,32(a0)
	lw	a3,4(sp)
	sw	s1,0(a0)
	sw	t2,8(a0)
	sw	t0,12(a0)
	sw	t1,16(a0)
	sw	a1,20(a0)
	sw	a2,24(a0)
	sw	a3,36(a0)
	sw	a4,40(a0)
	sw	a5,44(a0)
	lw	s1,16(sp)
	addi	sp,sp,28
	jr	ra
.L24:
	lw	a0,8(a0)
	li	a5,6
	sw	a5,12(s0)
	addi	a1,s0,8
	call	Proc_6
	li	a5,18
	sw	s1,0(s0)
	lw	ra,24(sp)
	sw	a5,12(s0)
	lw	s0,20(sp)
	lw	s1,16(sp)
	addi	sp,sp,28
	jr	ra
	.size	Proc_1, .-Proc_1
	.section	.text.Proc_7,"ax",@progbits
	.align	2
	.globl	Proc_7
	.hidden	Proc_7
	.type	Proc_7, @function
Proc_7:
	addi	a0,a0,2
	add	a0,a0,a1
	sw	a0,0(a2)
	ret
	.size	Proc_7, .-Proc_7
	.section	.text.Proc_8,"ax",@progbits
	.align	2
	.globl	Proc_8
	.hidden	Proc_8
	.type	Proc_8, @function
Proc_8:
	addi	a4,a2,5
	slli	a5,a4,1
	add	a5,a5,a4
	slli	a5,a5,3
	add	a5,a5,a4
	slli	a5,a5,3
	slli	t1,a4,2
	slli	a2,a2,2
	add	a0,a0,t1
	add	t1,a5,a2
	sw	a3,0(a0)
	sw	a3,4(a0)
	sw	a4,120(a0)
	add	a3,a1,t1
	lw	t1,16(a3)
	sw	a4,20(a3)
	sw	a4,24(a3)
	addi	a4,t1,1
	sw	a4,16(a3)
	lw	a4,0(a0)
	add	a1,a1,a5
	add	a1,a1,a2
	li	a5,4096
	add	a5,a5,a1
	sw	a4,-76(a5)
	li	a5,5
	la a4, .LANCHOR1; sw a5, 0(a4);
	ret
	.size	Proc_8, .-Proc_8
	.section	.text.Func_1,"ax",@progbits
	.align	2
	.globl	Func_1
	.hidden	Func_1
	.type	Func_1, @function
Func_1:
	andi	a0,a0,0xff
	andi	a1,a1,0xff
	beq	a0,a1,.L30
	li	a0,0
	ret
.L30:
	la a5, .LANCHOR0; sb a0, 0(a5);
	li	a0,1
	ret
	.size	Func_1, .-Func_1
	.section	.text.Func_2,"ax",@progbits
	.align	2
	.globl	Func_2
	.hidden	Func_2
	.type	Func_2, @function
Func_2:
	addi	sp,sp,-12
	sw	ra,8(sp)
	lbu	a5,2(a0)
	lbu	a4,3(a1)
	li	a2,0
	li	a3,0
.L32:
	beq	a5,a4,.L35
	beq	a3,zero,.L33
	la a5, .LANCHOR0; sb a2, 0(a5);
.L33:
	call	strcmp
	li	a5,0
	ble	a0,zero,.L31
	li	a5,10
	la a4, .LANCHOR1; sw a5, 0(a4);
	li	a5,1
.L31:
	lw	ra,8(sp)
	mv	a0,a5
	addi	sp,sp,12
	jr	ra
.L35:
	li	a3,1
	mv	a2,a5
	j	.L32
	.size	Func_2, .-Func_2
	.section	.text.Func_3,"ax",@progbits
	.align	2
	.globl	Func_3
	.hidden	Func_3
	.type	Func_3, @function
Func_3:
	addi	a0,a0,-2
	seqz	a0,a0
	ret
	.size	Func_3, .-Func_3
	.section	.text.check,"ax",@progbits
	.align	2
	.globl	check
	.hidden	check
	.type	check, @function
check:
	bne	a0,zero,.L43
	la a5, .LANCHOR5; sw zero, 0(a5);
.L43:
	ret
	.size	check, .-check
	.section	.rodata.main.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"PASS"
	.align	2
.LC1:
	.string	"FAIL"
	.align	2
.LC2:
	.string	"DHRYSTONE PROGRAM, SOME STRING"
	.align	2
.LC3:
	.string	"DHRYSTONE PROGRAM, 1'ST STRING"
	.align	2
.LC4:
	.string	"C, Version 2.2"
	.align	2
.LC5:
	.string	"Dhrystone Benchmark, Version %s\n"
	.align	2
.LC6:
	.string	"Trying %d runs through Dhrystone.\n"
	.globl	__udivdi3
	.align	2
.LC7:
	.string	"DHRYSTONE PROGRAM, 2'ND STRING"
	.align	2
.LC8:
	.string	"DHRYSTONE PROGRAM, 3'RD STRING"
	.globl	__divsi3
	.align	2
.LC9:
	.string	"Int_Glob:            %d\n"
	.align	2
.LC10:
	.string	"        should be:   %d\n"
	.align	2
.LC11:
	.string	"Bool_Glob:           %d\n"
	.align	2
.LC12:
	.string	"Ch_1_Glob:           %c\n"
	.align	2
.LC13:
	.string	"        should be:   %c\n"
	.align	2
.LC14:
	.string	"Ch_2_Glob:           %c\n"
	.align	2
.LC15:
	.string	"Arr_1_Glob[8]:       %d\n"
	.align	2
.LC16:
	.string	"Arr_2_Glob[8][7]:    %d\n"
	.align	2
.LC17:
	.string	"        should be:   Number_Of_Runs + 10\n"
	.align	2
.LC18:
	.string	"Ptr_Glob->Discr:             %d\n"
	.align	2
.LC19:
	.string	"Ptr_Glob->Enum_Comp:         %d\n"
	.align	2
.LC20:
	.string	"Ptr_Glob->Int_Comp:          %d\n"
	.align	2
.LC21:
	.string	"Ptr_Glob->Str_Comp:          %s\n"
	.align	2
.LC22:
	.string	"        should be:   DHRYSTONE PROGRAM, SOME STRING\n"
	.align	2
.LC23:
	.string	"Next_Ptr_Glob->Discr:             %d\n"
	.align	2
.LC24:
	.string	"Next_Ptr_Glob->Enum_Comp:         %d\n"
	.align	2
.LC25:
	.string	"Next_Ptr_Glob->Int_Comp:          %d\n"
	.align	2
.LC26:
	.string	"Next_Ptr_Glob->Str_Comp:          %s\n"
	.align	2
.LC27:
	.string	"Int_1_Loc:           %d\n"
	.align	2
.LC28:
	.string	"Int_2_Loc:           %d\n"
	.align	2
.LC29:
	.string	"Enum_Loc:            %d\n"
	.align	2
.LC30:
	.string	"Str_1_Loc:           %s\n"
	.align	2
.LC31:
	.string	"        should be:   DHRYSTONE PROGRAM, 1'ST STRING\n"
	.align	2
.LC32:
	.string	"Str_2_Loc:           %s\n"
	.align	2
.LC33:
	.string	"        should be:   DHRYSTONE PROGRAM, 2'ND STRING\n"
	.align	2
.LC34:
	.string	"Finished in %d ms\n"
	.align	2
.LC35:
	.string	"==================================================\n"
	.globl	__muldi3
	.globl	__divdi3
	.align	2
.LC36:
	.string	"Dhrystone %s          %d Marks\n"
	.align	2
.LC37:
	.string	"Dhrystone %s: elapsed time below 1 ms; increase runs\n"
	.align	2
.LC38:
	.string	"                   vs. 100000 Marks (i7-7700K @ 4.20GHz)\n"
	.section	.text.startup.main,"ax",@progbits
	.align	2
	.globl	main
	.hidden	main
	.type	main, @function
main:
	addi	sp,sp,-108
	addi	a5,sp,91
	andi	a5,a5,-8
	sw	a5,16(sp)
	sw	ra,104(sp)
	sw	s0,100(sp)
	sw	s1,96(sp)
	call	ioe_init
	lla	a3,.LANCHOR6
	lw	a5,0(a3)
	sw	zero,0(sp)
	andi	a4,a5,3
	beq	a4,zero,.L45
	addi	a4,a5,1
.L46:
	andi	a2,a4,3
	mv	a5,a4
	addi	a4,a4,1
	bne	a2,zero,.L46
.L45:
	lla	a4,.LANCHOR7
	sw	a5,0(a4)
	andi	a4,a5,3
	addi	a0,a5,48
	beq	a4,zero,.L47
	addi	a4,a5,49
.L48:
	andi	a2,a4,3
	mv	a0,a4
	addi	a4,a4,1
	bne	a2,zero,.L48
.L47:
	lla	a4,.LANCHOR2
	sw	a0,0(a4)
	sw	a5,0(a0)
	li	a5,2
	sw	a5,8(a0)
	li	a5,40
	addi	a4,a0,48
	sw	a5,12(a0)
	lla	a1,.LC2
	sw	zero,4(a0)
	addi	a0,a0,16
	sw	a4,0(a3)
	call	strcpy
	lla	a1,.LC3
	addi	a0,sp,20
	call	strcpy
	li	a5,10
	lla	s0,Arr_2_Glob
	sw	a5,1628(s0)
	lla	a1,.LC4
	lla	a0,.LC5
	call	printf
	li	a1,2000
	lla	a0,.LC6
	la a5, .LANCHOR8; sw zero, 0(a5);
	call	printf
	lw	s1,16(sp)
	li	a0,6
	mv	a1,s1
	call	ioe_read
	lw	a0,0(s1)
	lw	a1,4(s1)
	li	a2,1000
	li	a3,0
	call	__udivdi3
	lla	a5,.LANCHOR9
	sw	a0,0(a5)
	li	a5,1
	sw	a5,4(sp)
	lla	s1,.LANCHOR10
.L57:
	lla	a5,.LANCHOR0
	li	a4,65
	sb	a4,0(a5)
	li	a5,1
	lla	a4,.LANCHOR3
	sw	a5,0(a4)
	lla	a1,.LC7
	li	a5,66
	lla	a4,.LANCHOR4
	addi	a0,sp,52
	sb	a5,0(a4)
	call	strcpy
	lbu	a5,22(sp)
	lbu	a4,55(sp)
	li	a3,0
.L49:
	beq	a5,a4,.L81
	beq	a3,zero,.L50
	lw	a4,0(sp)
	lla	a5,.LANCHOR0
	sb	a4,0(a5)
.L50:
	addi	a1,sp,52
	addi	a0,sp,20
	call	strcmp
	lw	a4,1628(s0)
	lla	a5,.LANCHOR2
	mv	a2,a0
	addi	a4,a4,1
	lw	a0,0(a5)
	li	a3,8
	li	a5,7
	sw	a4,1628(s0)
	lla	a4,Arr_2_Glob+4096
	slti	a2,a2,1
	lla	a1,.LANCHOR3
	sw	a5,1536(a4)
	sw	a5,32(s1)
	lla	a4,.LANCHOR1
	sw	a5,36(s1)
	sw	a3,152(s1)
	li	a5,5
	sw	a3,1632(s0)
	sw	a3,1636(s0)
	sw	a2,0(a1)
	sw	a5,0(a4)
	call	Proc_1
	lla	a5,.LANCHOR4
	lbu	a1,0(a5)
	li	a4,64
	li	a5,65
	li	t1,1
	li	a2,3
	li	a3,67
	bleu	a1,a4,.L119
.L51:
	lla	a4,.LANCHOR4
	lbu	a4,0(a4)
	addi	a5,a5,1
	andi	a5,a5,0xff
	lla	a1,.LC8
	addi	a0,sp,52
	bltu	a4,a5,.L120
.L55:
	li	a4,0
	beq	a5,a3,.L121
.L53:
	bne	t1,a4,.L51
	sw	a5,8(sp)
	call	strcpy
	lw	a5,4(sp)
	lla	a4,.LANCHOR1
	li	t1,0
	sw	a5,0(a4)
	mv	a2,a5
	lw	a5,8(sp)
	lla	a4,.LANCHOR4
	lbu	a4,0(a4)
	addi	a5,a5,1
	andi	a5,a5,0xff
	li	a3,67
	lla	a1,.LC8
	addi	a0,sp,52
	bgeu	a4,a5,.L55
.L120:
	slli	a5,a2,1
	add	a5,a5,a2
	mv	a0,a5
	li	a1,7
	sw	t1,12(sp)
	sw	a5,8(sp)
	call	__divsi3
	lw	a5,8(sp)
	lw	t1,12(sp)
	addi	a5,a5,-7
	slli	a4,a5,3
	sub	a4,a4,a5
	sub	a4,a4,a0
.L52:
	lla	a5,.LANCHOR0
	lbu	a5,0(a5)
	li	a3,65
	bne	a5,a3,.L56
	lla	a5,.LANCHOR1
	lw	a5,0(a5)
	addi	a0,a0,9
	sub	a0,a0,a5
.L56:
	lw	a5,4(sp)
	addi	a5,a5,1
	mv	a3,a5
	sw	a5,4(sp)
	li	a5,2001
	bne	a3,a5,.L57
	lw	a1,16(sp)
	sw	a0,4(sp)
	li	a0,6
	sw	a4,8(sp)
	sw	t1,0(sp)
	call	ioe_read
	lw	a5,16(sp)
	li	a2,1000
	li	a3,0
	lw	a0,0(a5)
	lw	a1,4(a5)
	call	__udivdi3
	lla	a5,.LANCHOR9
	lw	a2,0(a5)
	lla	a5,.LANCHOR1
	mv	a3,a0
	lw	a1,0(a5)
	sub	a2,a3,a2
	lla	a5,.LANCHOR12
	la a0, .LANCHOR11; sw a3, 0(a0);
	li	a3,1
	sw	a2,0(a5)
	la a2, .LANCHOR8; sw a3, 0(a2);
	li	a3,5
	lw	t1,0(sp)
	lw	a4,4(sp)
	lw	a5,8(sp)
	beq	a1,a3,.L58
	lla	a0,.LC9
	sw	t1,8(sp)
	sw	a5,0(sp)
	la a3, .LANCHOR5; sw zero, 0(a3);
	call	printf
	li	a1,5
	lla	a0,.LC10
	call	printf
	lw	t1,8(sp)
	lw	a4,4(sp)
	lw	a5,0(sp)
.L58:
	lla	a3,.LANCHOR3
	lw	a1,0(a3)
	li	a3,1
	beq	a1,a3,.L59
	lla	a0,.LC11
	sw	t1,8(sp)
	sw	a4,4(sp)
	sw	a5,0(sp)
	la a3, .LANCHOR5; sw zero, 0(a3);
	call	printf
	li	a1,1
	lla	a0,.LC10
	call	printf
	lw	t1,8(sp)
	lw	a4,4(sp)
	lw	a5,0(sp)
.L59:
	lla	a3,.LANCHOR0
	lbu	a1,0(a3)
	li	a3,65
	beq	a1,a3,.L60
	lla	a0,.LC12
	sw	t1,8(sp)
	sw	a4,4(sp)
	sw	a5,0(sp)
	la a3, .LANCHOR5; sw zero, 0(a3);
	call	printf
	li	a1,65
	lla	a0,.LC13
	call	printf
	lw	t1,8(sp)
	lw	a4,4(sp)
	lw	a5,0(sp)
.L60:
	lla	a3,.LANCHOR4
	lbu	a1,0(a3)
	li	a3,66
	beq	a1,a3,.L61
	lla	a0,.LC14
	sw	t1,8(sp)
	sw	a4,4(sp)
	sw	a5,0(sp)
	la a3, .LANCHOR5; sw zero, 0(a3);
	call	printf
	li	a1,66
	lla	a0,.LC13
	call	printf
	lw	t1,8(sp)
	lw	a4,4(sp)
	lw	a5,0(sp)
.L61:
	lw	a1,32(s1)
	li	a3,7
	beq	a1,a3,.L62
	lla	a0,.LC15
	sw	t1,8(sp)
	sw	a4,4(sp)
	sw	a5,0(sp)
	la a3, .LANCHOR5; sw zero, 0(a3);
	call	printf
	li	a1,7
	lla	a0,.LC10
	call	printf
	lw	t1,8(sp)
	lw	a4,4(sp)
	lw	a5,0(sp)
.L62:
	lw	a1,1628(s0)
	li	a3,2010
	beq	a1,a3,.L63
	lla	a0,.LC16
	sw	t1,8(sp)
	sw	a4,4(sp)
	sw	a5,0(sp)
	la a3, .LANCHOR5; sw zero, 0(a3);
	call	printf
	lla	a0,.LC17
	call	printf
	lw	t1,8(sp)
	lw	a4,4(sp)
	lw	a5,0(sp)
.L63:
	lla	a3,.LANCHOR2
	lw	a3,0(a3)
	lw	a1,4(a3)
	beq	a1,zero,.L64
	lla	a0,.LC18
	sw	t1,8(sp)
	sw	a4,4(sp)
	sw	a5,0(sp)
	la a3, .LANCHOR5; sw zero, 0(a3);
	call	printf
	li	a1,0
	lla	a0,.LC10
	call	printf
	lw	t1,8(sp)
	lw	a4,4(sp)
	lw	a5,0(sp)
.L64:
	lla	a3,.LANCHOR2
	lw	a2,0(a3)
	li	a3,2
	lw	a1,8(a2)
	beq	a1,a3,.L65
	lla	a0,.LC19
	sw	t1,8(sp)
	sw	a4,4(sp)
	sw	a5,0(sp)
	la a3, .LANCHOR5; sw zero, 0(a3);
	call	printf
	li	a1,2
	lla	a0,.LC10
	call	printf
	lw	t1,8(sp)
	lw	a4,4(sp)
	lw	a5,0(sp)
.L65:
	lla	a3,.LANCHOR2
	lw	a2,0(a3)
	li	a3,17
	lw	a1,12(a2)
	beq	a1,a3,.L66
	lla	a0,.LC20
	sw	t1,8(sp)
	sw	a4,4(sp)
	sw	a5,0(sp)
	la a3, .LANCHOR5; sw zero, 0(a3);
	call	printf
	li	a1,17
	lla	a0,.LC10
	call	printf
	lw	t1,8(sp)
	lw	a4,4(sp)
	lw	a5,0(sp)
.L66:
	lla	s0,.LANCHOR2
	lw	a0,0(s0)
	lla	a1,.LC2
	sw	t1,8(sp)
	addi	a0,a0,16
	sw	a4,4(sp)
	sw	a5,0(sp)
	call	strcmp
	lw	a5,0(sp)
	lw	a4,4(sp)
	lw	t1,8(sp)
	beq	a0,zero,.L67
	lw	a1,0(s0)
	lla	a0,.LC21
	la a3, .LANCHOR5; sw zero, 0(a3);
	addi	a1,a1,16
	call	printf
	lla	a0,.LC22
	call	printf
	lw	t1,8(sp)
	lw	a4,4(sp)
	lw	a5,0(sp)
.L67:
	lla	a3,.LANCHOR7
	lw	a3,0(a3)
	lw	a1,4(a3)
	beq	a1,zero,.L68
	lla	a0,.LC23
	sw	t1,8(sp)
	sw	a4,4(sp)
	sw	a5,0(sp)
	la a3, .LANCHOR5; sw zero, 0(a3);
	call	printf
	li	a1,0
	lla	a0,.LC10
	call	printf
	lw	t1,8(sp)
	lw	a4,4(sp)
	lw	a5,0(sp)
.L68:
	lla	a3,.LANCHOR7
	lw	a2,0(a3)
	li	a3,1
	lw	a1,8(a2)
	beq	a1,a3,.L69
	lla	a0,.LC24
	sw	t1,8(sp)
	sw	a4,4(sp)
	sw	a5,0(sp)
	la a3, .LANCHOR5; sw zero, 0(a3);
	call	printf
	li	a1,1
	lla	a0,.LC10
	call	printf
	lw	t1,8(sp)
	lw	a4,4(sp)
	lw	a5,0(sp)
.L69:
	lla	a3,.LANCHOR7
	lw	a2,0(a3)
	li	a3,18
	lw	a1,12(a2)
	beq	a1,a3,.L70
	lla	a0,.LC25
	sw	t1,8(sp)
	sw	a4,4(sp)
	sw	a5,0(sp)
	la a3, .LANCHOR5; sw zero, 0(a3);
	call	printf
	li	a1,18
	lla	a0,.LC10
	call	printf
	lw	t1,8(sp)
	lw	a4,4(sp)
	lw	a5,0(sp)
.L70:
	lla	s0,.LANCHOR7
	lw	a0,0(s0)
	lla	a1,.LC2
	sw	t1,8(sp)
	addi	a0,a0,16
	sw	a4,4(sp)
	sw	a5,0(sp)
	call	strcmp
	lw	a5,0(sp)
	lw	a4,4(sp)
	lw	t1,8(sp)
	beq	a0,zero,.L71
	lw	a1,0(s0)
	lla	a0,.LC26
	la a3, .LANCHOR5; sw zero, 0(a3);
	addi	a1,a1,16
	call	printf
	lla	a0,.LC22
	call	printf
	lw	t1,8(sp)
	lw	a4,4(sp)
	lw	a5,0(sp)
.L71:
	li	a3,5
	beq	a4,a3,.L72
	mv	a1,a4
	lla	a0,.LC27
	sw	t1,4(sp)
	sw	a5,0(sp)
	la a4, .LANCHOR5; sw zero, 0(a4);
	call	printf
	li	a1,5
	lla	a0,.LC10
	call	printf
	lw	t1,4(sp)
	lw	a5,0(sp)
.L72:
	li	a4,13
	beq	a5,a4,.L73
	mv	a1,a5
	lla	a0,.LC28
	sw	t1,0(sp)
	la a5, .LANCHOR5; sw zero, 0(a5);
	call	printf
	li	a1,13
	lla	a0,.LC10
	call	printf
	lw	t1,0(sp)
.L73:
	bne	t1,zero,.L74
	li	a1,0
	lla	a0,.LC29
	la a5, .LANCHOR5; sw zero, 0(a5);
	call	printf
	li	a1,1
	lla	a0,.LC10
	call	printf
.L74:
	lla	a1,.LC3
	addi	a0,sp,20
	call	strcmp
	beq	a0,zero,.L75
	addi	a1,sp,20
	lla	a0,.LC30
	la a5, .LANCHOR5; sw zero, 0(a5);
	call	printf
	lla	a0,.LC31
	call	printf
.L75:
	lla	a1,.LC7
	addi	a0,sp,52
	call	strcmp
	beq	a0,zero,.L76
	addi	a1,sp,52
	lla	a0,.LC32
	la a5, .LANCHOR5; sw zero, 0(a5);
	call	printf
	lla	a0,.LC33
	call	printf
.L76:
	lla	a5,.LANCHOR12
	lw	a1,0(a5)
	lla	a0,.LC34
	mv	s0,a5
	call	printf
	lla	a0,.LC35
	call	printf
	lw	a0,0(s0)
	ble	a0,zero,.L77
	li	a2,499712
	addi	a2,a2,288
	li	a3,0
	srai	a1,a0,31
	call	__muldi3
	mv	a2,a0
	li	a0,1761800192
	mv	a3,a1
	addi	a0,a0,-192
	li	a1,0
	call	__udivdi3
	lla	s0,.LANCHOR5
	lw	a5,0(s0)
	mv	a2,a0
	lla	a1,.LC0
	beq	a5,zero,.L122
.L78:
	lla	a0,.LC36
	call	printf
.L79:
	lla	a0,.LC38
	call	printf
	lw	a0,0(s0)
	lw	ra,104(sp)
	lw	s0,100(sp)
	lw	s1,96(sp)
	seqz	a0,a0
	addi	sp,sp,108
	jr	ra
.L121:
	lla	a4,.LANCHOR0
	sb	a5,0(a4)
	li	a4,1
	j	.L53
.L81:
	li	a3,1
	sw	a5,0(sp)
	j	.L49
.L119:
	li	a4,13
	li	a0,1
	j	.L52
.L77:
	lla	s0,.LANCHOR5
	lw	a5,0(s0)
	lla	a1,.LC0
	bne	a5,zero,.L80
	lla	a1,.LC1
.L80:
	lla	a0,.LC37
	call	printf
	j	.L79
.L122:
	lla	a1,.LC1
	j	.L78
	.size	main, .-main
	.hidden	pass
	.globl	pass
	.hidden	Dhrystones_Per_Second
	.globl	Dhrystones_Per_Second
	.hidden	Microseconds
	.globl	Microseconds
	.hidden	User_Time
	.globl	User_Time
	.hidden	End_Time
	.globl	End_Time
	.hidden	Begin_Time
	.globl	Begin_Time
	.hidden	Done
	.globl	Done
	.hidden	Reg
	.globl	Reg
	.hidden	Arr_2_Glob
	.globl	Arr_2_Glob
	.hidden	Arr_1_Glob
	.globl	Arr_1_Glob
	.hidden	Ch_2_Glob
	.globl	Ch_2_Glob
	.hidden	Ch_1_Glob
	.globl	Ch_1_Glob
	.hidden	Bool_Glob
	.globl	Bool_Glob
	.hidden	Int_Glob
	.globl	Int_Glob
	.hidden	Next_Ptr_Glob
	.globl	Next_Ptr_Glob
	.hidden	Ptr_Glob
	.globl	Ptr_Glob
	.section	.bss.Arr_1_Glob,"aw",@nobits
	.align	2
	.set	.LANCHOR10,. + 0
	.type	Arr_1_Glob, @object
	.size	Arr_1_Glob, 200
Arr_1_Glob:
	.zero	200
	.section	.bss.Arr_2_Glob,"aw",@nobits
	.align	2
	.type	Arr_2_Glob, @object
	.size	Arr_2_Glob, 10000
Arr_2_Glob:
	.zero	10000
	.section	.bss.memory,"aw",@nobits
	.align	2
	.type	memory, @object
	.size	memory, 1024
memory:
	.zero	1024
	.section	.sbss.Begin_Time,"aw",@nobits
	.align	2
	.set	.LANCHOR9,. + 0
	.type	Begin_Time, @object
	.size	Begin_Time, 4
Begin_Time:
	.zero	4
	.section	.sbss.Bool_Glob,"aw",@nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	Bool_Glob, @object
	.size	Bool_Glob, 4
Bool_Glob:
	.zero	4
	.section	.sbss.Ch_1_Glob,"aw",@nobits
	.set	.LANCHOR0,. + 0
	.type	Ch_1_Glob, @object
	.size	Ch_1_Glob, 1
Ch_1_Glob:
	.zero	1
	.section	.sbss.Ch_2_Glob,"aw",@nobits
	.set	.LANCHOR4,. + 0
	.type	Ch_2_Glob, @object
	.size	Ch_2_Glob, 1
Ch_2_Glob:
	.zero	1
	.section	.sbss.Dhrystones_Per_Second,"aw",@nobits
	.align	2
	.type	Dhrystones_Per_Second, @object
	.size	Dhrystones_Per_Second, 4
Dhrystones_Per_Second:
	.zero	4
	.section	.sbss.Done,"aw",@nobits
	.align	2
	.set	.LANCHOR8,. + 0
	.type	Done, @object
	.size	Done, 4
Done:
	.zero	4
	.section	.sbss.End_Time,"aw",@nobits
	.align	2
	.set	.LANCHOR11,. + 0
	.type	End_Time, @object
	.size	End_Time, 4
End_Time:
	.zero	4
	.section	.sbss.Int_Glob,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	Int_Glob, @object
	.size	Int_Glob, 4
Int_Glob:
	.zero	4
	.section	.sbss.Microseconds,"aw",@nobits
	.align	2
	.type	Microseconds, @object
	.size	Microseconds, 4
Microseconds:
	.zero	4
	.section	.sbss.Next_Ptr_Glob,"aw",@nobits
	.align	2
	.set	.LANCHOR7,. + 0
	.type	Next_Ptr_Glob, @object
	.size	Next_Ptr_Glob, 4
Next_Ptr_Glob:
	.zero	4
	.section	.sbss.Ptr_Glob,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	Ptr_Glob, @object
	.size	Ptr_Glob, 4
Ptr_Glob:
	.zero	4
	.section	.sbss.Reg,"aw",@nobits
	.align	2
	.type	Reg, @object
	.size	Reg, 4
Reg:
	.zero	4
	.section	.sbss.User_Time,"aw",@nobits
	.align	2
	.set	.LANCHOR12,. + 0
	.type	User_Time, @object
	.size	User_Time, 4
User_Time:
	.zero	4
	.section	.sdata.free_mem,"aw"
	.align	2
	.set	.LANCHOR6,. + 0
	.type	free_mem, @object
	.size	free_mem, 4
free_mem:
	.word	memory
	.section	.sdata.pass,"aw"
	.align	2
	.set	.LANCHOR5,. + 0
	.type	pass, @object
	.size	pass, 4
pass:
	.word	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
