#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"Top.c"
	.option nopic
	.text
	.section	.text.subReset0.part.0,"ax",@progbits
	.align	2
	.type	subReset0.part.0, @function
subReset0.part.0:
	li	a3,8192
	li	a4,2037612544
	li	a5,19009536
	addi	a5,a5,470
	addi	a3,a3,-2048
	li	a2,-2147483648
	addi	a4,a4,-1672
	la a1, .LANCHOR0; sw a2, 0(a1);
	la a2, .LANCHOR4; sw a3, 0(a2);
	la a2, .LANCHOR5; sw a3, 0(a2);
	la a3, .LANCHOR8; sw a4, 0(a3);
	la a3, .LANCHOR9; sw a4, 0(a3);
	la a3, .LANCHOR6; sw zero, 0(a3);
	la a4, .LANCHOR10; sw a5, 0(a4);
	la a4, .LANCHOR11; sw a5, 0(a4);
	la a3, .LANCHOR7; sw zero, 0(a3);
	la a5, .LANCHOR12; sb zero, 0(a5);
	la a5, .LANCHOR13; sb zero, 0(a5);
	la a5, .LANCHOR14; sb zero, 0(a5);
	la a5, .LANCHOR15; sb zero, 0(a5);
	la a5, .LANCHOR16; sb zero, 0(a5);
	la a5, .LANCHOR17; sb zero, 0(a5);
	la a5, .LANCHOR18; sb zero, 0(a5);
	la a5, .LANCHOR19; sb zero, 0(a5);
	la a5, .LANCHOR20; sb zero, 0(a5);
	la a5, .LANCHOR21; sb zero, 0(a5);
	la a5, .LANCHOR22; sb zero, 0(a5);
	la a5, .LANCHOR23; sb zero, 0(a5);
	la a5, .LANCHOR24; sb zero, 0(a5);
	la a5, .LANCHOR25; sb zero, 0(a5);
	la a5, .LANCHOR26; sb zero, 0(a5);
	la a5, .LANCHOR27; sb zero, 0(a5);
	la a5, .LANCHOR28; sb zero, 0(a5);
	la a5, .LANCHOR29; sb zero, 0(a5);
	la a5, .LANCHOR30; sb zero, 0(a5);
	la a5, .LANCHOR31; sb zero, 0(a5);
	lla	a5,.LANCHOR32
	li	a3,0
	li	a4,0
	la a2, .LANCHOR1; sb zero, 0(a2);
	la a2, .LANCHOR2; sb zero, 0(a2);
	la a2, .LANCHOR3; sb zero, 0(a2);
	sw	a3,0(a5)
	sw	a4,4(a5)
	lla	a5,.LANCHOR33
	sw	a3,0(a5)
	sw	a4,4(a5)
	la a5, .LANCHOR34; sb zero, 0(a5);
	la a5, .LANCHOR35; sb zero, 0(a5);
	la a5, .LANCHOR36; sb zero, 0(a5);
	la a5, .LANCHOR37; sb zero, 0(a5);
	la a5, .LANCHOR38; sb zero, 0(a5);
	la a5, .LANCHOR39; sb zero, 0(a5);
	ret
	.size	subReset0.part.0, .-subReset0.part.0
	.section	.rodata.gprintf.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"AM Panic: "
	.align	2
.LC1:
	.string	"Assertion `0' failed"
	.align	2
.LC2:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/301.gsim/Top.c:313  \n"
	.align	2
.LC3:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/301.gsim/Top.c:321  \n"
	.align	2
.LC4:
	.string	"%c"
	.align	2
.LC5:
	.string	"%lld"
	.align	2
.LC6:
	.string	"%llx"
	.section	.text.gprintf,"ax",@progbits
	.align	2
	.globl	gprintf
	.hidden	gprintf
	.type	gprintf, @function
gprintf:
	addi	sp,sp,-40
	sw	a5,36(sp)
	addi	a5,sp,20
	sw	s0,12(sp)
	sw	s1,8(sp)
	sw	a3,28(sp)
	sw	ra,16(sp)
	mv	s1,a0
	sw	a1,20(sp)
	sw	a2,24(sp)
	sw	a4,32(sp)
	sw	a5,4(sp)
	li	s0,0
	li	a3,37
.L4:
	add	a5,s1,s0
	lbu	a1,0(a5)
	addi	a5,s0,1
	beq	a1,zero,.L3
.L28:
	beq	a1,a3,.L6
	lla	a0,.LC4
	sw	a5,0(sp)
	call	printf
	lw	a5,0(sp)
	li	a3,37
	mv	s0,a5
	add	a5,s1,s0
	lbu	a1,0(a5)
	addi	a5,s0,1
	bne	a1,zero,.L28
.L3:
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	addi	sp,sp,40
	jr	ra
.L6:
	lw	a4,4(sp)
	li	a1,32
	lw	a2,0(a4)
	ble	a2,a1,.L29
	li	a1,64
	bgt	a2,a1,.L20
	add	a5,s1,a5
	lbu	a5,0(a5)
	addi	a0,a4,12
	lw	a1,4(a4)
	lw	a2,8(a4)
	sw	a0,4(sp)
	li	a4,100
	addi	s0,s0,2
	beq	a5,a4,.L13
.L31:
	li	a4,120
	bne	a5,a4,.L30
	lla	a0,.LC6
	call	printf
	li	a3,37
	j	.L4
.L29:
	add	a5,s1,a5
	lbu	a5,0(a5)
	addi	a2,a4,8
	lw	a1,4(a4)
	sw	a2,4(sp)
	li	a4,100
	li	a2,0
	addi	s0,s0,2
	bne	a5,a4,.L31
.L13:
	lla	a0,.LC5
	call	printf
	li	a3,37
	j	.L4
.L30:
	li	a4,99
	bne	a5,a4,.L32
	andi	a1,a1,0xff
	lla	a0,.LC4
	call	printf
	li	a3,37
	j	.L4
.L32:
	lla	s0,.LC0
	li	a0,65
.L16:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L16
	lla	s0,.LC1
	li	a0,65
.L17:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L17
	lla	s0,.LC3
	li	a0,32
.L18:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L18
.L19:
	li	a0,1
	call	halt
.L20:
	lla	s0,.LC0
	li	a0,65
.L10:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L10
	lla	s0,.LC1
	li	a0,65
.L11:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L11
	lla	s0,.LC2
	li	a0,32
.L12:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L12
	j	.L19
	.size	gprintf, .-gprintf
	.section	.text.STop_init,"ax",@progbits
	.align	2
	.globl	STop_init
	.hidden	STop_init
	.type	STop_init, @function
STop_init:
	addi	sp,sp,-12
	sw	ra,8(sp)
	lla	a5,.LANCHOR40
	li	a4,0
	li	a3,0
	li	a2,8
	li	a1,255
	lla	a0,.LANCHOR41
	sw	a4,4(a5)
	sw	a3,0(a5)
	call	memset
	li	a5,134479872
	addi	a5,a5,513
	lw	ra,8(sp)
	la a4, .LANCHOR42; sw a5, 0(a4);
	li	a5,4096
	addi	a5,a5,-1021
	la a4, .LANCHOR43; sh a5, 0(a4);
	addi	sp,sp,12
	jr	ra
	.size	STop_init, .-STop_init
	.section	.text.init,"ax",@progbits
	.align	2
	.globl	init
	.hidden	init
	.type	init, @function
init:
	addi	sp,sp,-12
	li	a2,8
	li	a1,255
	lla	a0,.LANCHOR41
	sw	ra,8(sp)
	call	memset
	li	a5,134479872
	addi	a5,a5,513
	lw	ra,8(sp)
	la a4, .LANCHOR42; sw a5, 0(a4);
	li	a5,4096
	addi	a5,a5,-1021
	la a4, .LANCHOR43; sh a5, 0(a4);
	addi	sp,sp,12
	jr	ra
	.size	init, .-init
	.section	.text.activateAll,"ax",@progbits
	.align	2
	.globl	activateAll
	.hidden	activateAll
	.type	activateAll, @function
activateAll:
	li	a2,8
	li	a1,255
	lla	a0,.LANCHOR41
	tail	memset
	.size	activateAll, .-activateAll
	.section	.text.set_clock,"ax",@progbits
	.align	2
	.globl	set_clock
	.hidden	set_clock
	.type	set_clock, @function
set_clock:
	lla	a5,.LANCHOR44
	lbu	a4,0(a5)
	beq	a4,a0,.L38
	sb	a0,0(a5)
.L38:
	ret
	.size	set_clock, .-set_clock
	.section	.text.set_reset,"ax",@progbits
	.align	2
	.globl	set_reset
	.hidden	set_reset
	.type	set_reset, @function
set_reset:
	lla	a5,.LANCHOR45
	lbu	a4,0(a5)
	beq	a4,a0,.L40
	lla	a3,.LANCHOR41
	lbu	a4,0(a3)
	sb	a0,0(a5)
	ori	a5,a4,3
	sb	a5,0(a3)
.L40:
	ret
	.size	set_reset, .-set_reset
	.section	.text.subReset0,"ax",@progbits
	.align	2
	.globl	subReset0
	.hidden	subReset0
	.type	subReset0, @function
subReset0:
	la a5, .LANCHOR45; lbu a5, 0(a5);
	beq	a5,zero,.L42
	tail	subReset0.part.0
.L42:
	ret
	.size	subReset0, .-subReset0
	.section	.text.resetAll,"ax",@progbits
	.align	2
	.globl	resetAll
	.hidden	resetAll
	.type	resetAll, @function
resetAll:
	la a5, .LANCHOR45; lbu a5, 0(a5);
	bne	a5,zero,.L46
	ret
.L46:
	lla	a5,.LANCHOR41
	lw	a3,0(a5)
	li	a2,-58826752
	lw	a4,4(a5)
	addi	a2,a2,-356
	or	a3,a3,a2
	li	a2,647168
	addi	a2,a2,1844
	or	a4,a4,a2
	sw	a3,0(a5)
	sw	a4,4(a5)
	tail	subReset0.part.0
	.size	resetAll, .-resetAll
	.section	.rodata.subStep0.str1.4,"aMS",@progbits,1
	.align	2
.LC7:
	.string	"Assertion `!((((npc_DOT_lsu_DOT__T_3 & (npc_DOT_lsu_DOT__T_4 ^ 0x1)) & (npc_DOT_lsu_DOT__T_7 ^ 0x1)) & (npc_DOT_lsu_DOT__T_6 ^ 0x1)) & npc_DOT_lsu_DOT__T_24)' failed"
	.align	2
.LC8:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/301.gsim/Top.c:1734  \n"
	.align	2
.LC9:
	.string	"\033[1;31m"
	.align	2
.LC10:
	.string	"assertion fails"
	.align	2
.LC11:
	.string	"\033[0m\n"
	.align	2
.LC12:
	.string	"Assertion failed: Bad csrAddr = %c%c%c%c%c%c%c%c%c%c\n\n    at LSU.scala:134 .otherwise { assert(false.B, p\"Bad csrAddr = _DOT_csrAddr\\n\") }\n"
	.section	.text.subStep0,"ax",@progbits
	.align	2
	.globl	subStep0
	.hidden	subStep0
	.type	subStep0, @function
subStep0:
	addi	sp,sp,-204
	sw	s0,196(sp)
	sw	ra,200(sp)
	sw	s1,192(sp)
	lla	s0,.LANCHOR41
	lbu	a2,0(s0)
	andi	a5,a2,1
	bne	a5,zero,.L607
	andi	a5,a2,2
	bne	a5,zero,.L608
.L49:
	andi	a5,a2,4
	bne	a5,zero,.L609
.L51:
	andi	a5,a2,8
	bne	a5,zero,.L610
	andi	a5,a2,16
	bne	a5,zero,.L611
.L56:
	andi	a2,a2,32
	bne	a2,zero,.L57
.L621:
	la t1, .LANCHOR86; lw t1, 0(t1);
	la t0, .LANCHOR87; lbu t0, 0(t0);
	la a5, .LANCHOR85; lbu a5, 0(a5);
	la a0, .LANCHOR80; lbu a0, 0(a0);
	la a1, .LANCHOR81; lw a1, 0(a1);
	la a2, .LANCHOR82; lw a2, 0(a2);
	la a3, .LANCHOR83; lbu a3, 0(a3);
	la a4, .LANCHOR84; lw a4, 0(a4);
	sw	t0,4(sp)
	sw	t1,0(sp)
	call	NPCTrap
	lb	a5,0(s0)
	blt	a5,zero,.L59
.L622:
	lbu	s1,1(s0)
.L60:
	bne	s1,zero,.L65
	lla	a5,.LANCHOR124
	sw	a5,60(sp)
	lla	ra,.LANCHOR147
	lla	t2,.LANCHOR153
.L66:
	lbu	a4,2(s0)
	bne	a4,zero,.L199
	lbu	a5,3(s0)
	lla	s1,.LANCHOR214
.L200:
	bne	a5,zero,.L219
	lla	a4,.LANCHOR267
.L220:
	lbu	a5,4(s0)
	andi	a5,a5,1
	bne	a5,zero,.L241
	la a1, .LANCHOR275; lw a1, 0(a1);
.L242:
	lbu	a2,0(ra)
	lw	a3,60(sp)
	lw	a5,0(t2)
	lw	a4,0(a4)
	lbu	a3,0(a3)
	lbu	a0,0(s1)
	lla	s1,.LANCHOR277
	sw	a2,0(sp)
	lw	t1,0(s1)
	mv	a2,s1
	sw	t1,60(sp)
	call	SimDMEM
	lw	a4,0(s1)
	lw	t1,60(sp)
	lbu	a3,4(s0)
	sub	a5,a4,t1
	snez	a5,a5
	slli	a5,a5,2
	or	a5,a5,a3
	sb	a5,4(s0)
	andi	a3,a5,4
	bne	a3,zero,.L612
.L244:
	andi	a4,a5,8
	bne	a4,zero,.L613
.L252:
	andi	a4,a5,16
	bne	a4,zero,.L614
.L254:
	andi	a4,a5,32
	bne	a4,zero,.L615
.L255:
	andi	a4,a5,64
	bne	a4,zero,.L616
.L256:
	slli	a5,a5,24
	srai	a5,a5,24
	blt	a5,zero,.L617
.L257:
	lbu	a5,5(s0)
	bne	a5,zero,.L618
.L259:
	lbu	a5,6(s0)
	bne	a5,zero,.L619
.L47:
	lw	ra,200(sp)
	lw	s0,196(sp)
	lw	s1,192(sp)
	addi	sp,sp,204
	jr	ra
.L607:
	lla	a3,.LANCHOR46
	lbu	a5,0(a3)
	la a4, .LANCHOR45; lbu a4, 0(a4);
	not	a4,a4
	andi	a4,a4,1
	lbu	a1,1(s0)
	sub	a5,a5,a4
	snez	a5,a5
	slli	a0,a5,7
	or	a2,a0,a2
	or	a5,a5,a1
	sb	a5,1(s0)
	sb	a4,0(a3)
	sb	a2,0(s0)
	andi	a5,a2,2
	beq	a5,zero,.L49
.L608:
	la a5, .LANCHOR45; lbu a5, 0(a5);
	beq	a5,zero,.L49
	lla	a5,.LANCHOR0
	lw	a4,0(a5)
	li	a3,-2147483648
	lla	a0,.LANCHOR8
	lla	t1,.LANCHOR10
	lw	ra,0(a0)
	la a5, .LANCHOR1; lbu a5, 0(a5);
	lw	a0,0(t1)
	add	a4,a4,a3
	lla	s1,.LANCHOR4
	lbu	a1,2(s0)
	lw	t0,0(s1)
	snez	a4,a4
	snez	a5,a5
	neg	a5,a5
	neg	a3,a4
	li	t1,8192
	addi	t1,t1,-2048
	mv	t2,a0
	or	a3,a3,a5
	slli	a4,a4,4
	li	a0,2037612544
	addi	a0,a0,-1672
	or	a1,a1,a4
	sub	t0,t0,t1
	la a4, .LANCHOR6; lw a4, 0(a4);
	andi	a3,a3,8
	sb	a1,2(s0)
	or	a3,a2,a3
	snez	a4,a4
	sub	ra,ra,a0
	li	a1,19009536
	snez	t0,t0
	sb	a3,0(s0)
	addi	a1,a1,470
	or	t0,a4,t0
	snez	ra,ra
	la a3, .LANCHOR3; lbu a3, 0(a3);
	sub	a2,t2,a1
	or	ra,ra,t0
	li	t2,537399296
	lw	t0,0(s0)
	addi	t2,t2,-2048
	snez	a3,a3
	neg	a3,a3
	and	a5,a5,t2
	or	a5,a5,t0
	andi	t2,a3,8
	la t0, .LANCHOR12; lbu t0, 0(t0);
	snez	a2,a2
	or	t2,t2,a5
	or	a2,a2,ra
	slli	a4,a4,3
	snez	t0,t0
	slli	a2,a2,6
	srli	ra,a5,8
	or	a4,t2,a4
	slli	t0,t0,3
	sw	a5,0(s0)
	or	a4,a4,t0
	li	a5,-2147483648
	or	ra,a2,ra
	andi	a3,a3,6
	lla	a2,.LANCHOR0
	sw	a5,0(a2)
	sb	a4,0(s0)
	la a5, .LANCHOR5; sw t1, 0(a5);
	la a4, .LANCHOR13; lbu a4, 0(a4);
	or	a3,ra,a3
	la a5, .LANCHOR1; sb zero, 0(a5);
	la a5, .LANCHOR2; sb zero, 0(a5);
	la a5, .LANCHOR3; sb zero, 0(a5);
	la a5, .LANCHOR6; sw zero, 0(a5);
	la a5, .LANCHOR7; sw zero, 0(a5);
	lla	a5,.LANCHOR8
	sb	a3,1(s0)
	sw	t1,0(s1)
	snez	a4,a4
	lla	t1,.LANCHOR10
	sw	a0,0(a5)
	lw	a3,0(s0)
	la a5, .LANCHOR9; sw a0, 0(a5);
	sw	a1,0(t1)
	la a5, .LANCHOR11; sw a1, 0(a5);
	la a5, .LANCHOR12; sb zero, 0(a5);
	la a5, .LANCHOR13; sb zero, 0(a5);
	la a5, .LANCHOR14; sb zero, 0(a5);
	li	a0,71303168
	la a2, .LANCHOR15; lbu a2, 0(a2);
	neg	a4,a4
	and	a4,a4,a0
	snez	a2,a2
	li	a0,-2141188096
	la a5, .LANCHOR17; lbu a5, 0(a5);
	la a1, .LANCHOR18; lbu a1, 0(a1);
	addi	a0,a0,-2048
	neg	a2,a2
	and	a2,a2,a0
	snez	a1,a1
	snez	a5,a5
	neg	a5,a5
	or	a4,a4,a2
	slli	a0,a1,3
	or	a4,a4,a3
	mv	a1,a0
	andi	a3,a5,-120
	andi	a5,a5,10
	or	a5,a5,a1
	srli	a1,a4,8
	sw	a4,0(s0)
	or	a0,a0,a3
	or	a5,a5,a1
	la a3, .LANCHOR19; lbu a3, 0(a3);
	sb	a5,1(s0)
	la a2, .LANCHOR20; lbu a2, 0(a2);
	or	a4,a0,a4
	snez	a5,a3
	sb	a4,0(s0)
	snez	a3,a2
	neg	a5,a5
	li	a2,-2146959360
	lw	a0,0(s0)
	la a4, .LANCHOR21; lbu a4, 0(a4);
	and	a5,a5,a2
	neg	a3,a3
	li	a2,1576960
	and	a3,a3,a2
	snez	a4,a4
	la a2, .LANCHOR23; lbu a2, 0(a2);
	neg	a1,a4
	or	a5,a5,a3
	li	a3,1179648
	snez	a2,a2
	or	a5,a5,a0
	and	a3,a3,a1
	or	a3,a3,a5
	slli	a1,a2,3
	la a5, .LANCHOR24; lbu a5, 0(a5);
	sw	a3,0(s0)
	snez	a5,a5
	or	a3,a1,a3
	sb	a3,0(s0)
	li	a1,1074790400
	neg	a5,a5
	lw	a0,0(s0)
	neg	t1,a2
	and	a5,a5,a1
	li	a1,1075449856
	la a3, .LANCHOR26; lbu a3, 0(a3);
	and	t1,t1,a1
	lw	a2,4(s0)
	or	a5,a5,t1
	snez	a3,a3
	la a1, .LANCHOR27; lbu a1, 0(a1);
	or	a5,a5,a0
	neg	a3,a3
	li	a0,537657344
	snez	a1,a1
	and	a3,a3,a0
	slli	a4,a4,2
	or	a4,a4,a2
	or	a5,a5,a3
	slli	a3,a1,4
	la a2, .LANCHOR15; sb zero, 0(a2);
	la a2, .LANCHOR16; sb zero, 0(a2);
	la a2, .LANCHOR17; sb zero, 0(a2);
	la a2, .LANCHOR18; sb zero, 0(a2);
	la a2, .LANCHOR19; sb zero, 0(a2);
	la a2, .LANCHOR20; sb zero, 0(a2);
	la a2, .LANCHOR21; sb zero, 0(a2);
	sw	a4,4(s0)
	la a2, .LANCHOR22; sb zero, 0(a2);
	la a2, .LANCHOR23; sb zero, 0(a2);
	la a2, .LANCHOR24; sb zero, 0(a2);
	la a2, .LANCHOR25; sb zero, 0(a2);
	la a2, .LANCHOR26; sb zero, 0(a2);
	sw	a5,0(s0)
	or	a5,a3,a5
	la a3, .LANCHOR27; sb zero, 0(a3);
	sb	a5,0(s0)
	lw	t1,0(s0)
	la a2, .LANCHOR29; lbu a2, 0(a2);
	la a5, .LANCHOR30; lbu a5, 0(a5);
	la a3, .LANCHOR31; lbu a3, 0(a3);
	neg	a0,a1
	li	a1,537133056
	snez	a2,a2
	and	a0,a0,a1
	snez	a5,a5
	snez	a3,a3
	or	a0,a0,t1
	neg	a3,a3
	or	a5,a2,a5
	slli	a2,a2,3
	lla	a1,.LANCHOR32
	andi	t0,a3,20
	srli	t2,a0,8
	or	a2,a2,a0
	slli	a5,a5,1
	sw	a0,0(s0)
	lw	t1,4(a1)
	lw	a0,0(a1)
	or	a2,a2,t0
	or	a5,a5,t2
	sb	a2,0(s0)
	sb	a5,1(s0)
	lw	a5,0(s0)
	or	a0,a0,t1
	li	t1,268697600
	la t0, .LANCHOR34; lbu t0, 0(t0);
	la a2, .LANCHOR35; lbu a2, 0(a2);
	snez	a0,a0
	and	a3,a3,t1
	or	t1,a3,a5
	snez	t0,t0
	slli	a3,a0,3
	snez	a2,a2
	la a5, .LANCHOR37; lbu a5, 0(a5);
	or	a3,a3,t1
	slli	t0,t0,3
	neg	a2,a2
	snez	a5,a5
	andi	a2,a2,12
	or	a3,a3,t0
	or	a3,a3,a2
	slli	a2,a5,3
	sw	t1,0(s0)
	or	a3,a3,a2
	sb	a3,0(s0)
	lw	a3,0(s0)
	la a2, .LANCHOR38; lbu a2, 0(a2);
	neg	a5,a5
	li	t1,-2147221504
	snez	a2,a2
	and	a5,a5,t1
	or	a5,a5,a3
	slli	a3,a2,3
	sw	a5,0(s0)
	or	a5,a3,a5
	sb	a5,0(s0)
	slli	a0,a0,2
	la a5, .LANCHOR28; sb zero, 0(a5);
	la a5, .LANCHOR29; sb zero, 0(a5);
	la a5, .LANCHOR30; sb zero, 0(a5);
	la a5, .LANCHOR31; sb zero, 0(a5);
	lla	a5,.LANCHOR33
	or	a0,a0,a4
	li	a3,0
	li	a4,0
	sw	a4,4(a5)
	sw	a3,0(a5)
	sw	a4,4(a1)
	la a5, .LANCHOR34; sb zero, 0(a5);
	la a5, .LANCHOR35; sb zero, 0(a5);
	la a5, .LANCHOR36; sb zero, 0(a5);
	sw	a3,0(a1)
	sb	a0,4(s0)
	la a5, .LANCHOR37; sb zero, 0(a5);
	la a5, .LANCHOR38; sb zero, 0(a5);
	lw	a4,0(s0)
	li	a5,134217728
	addi	a5,a5,1024
	neg	a2,a2
	and	a2,a2,a5
	or	a2,a2,a4
	sw	a2,0(s0)
	la a5, .LANCHOR39; sb zero, 0(a5);
	andi	a2,a2,0xff
	j	.L49
.L609:
	la a3, .LANCHOR31; lbu a3, 0(a3);
	addi	a3,a3,-3
	la a0, .LANCHOR47; lbu a0, 0(a0);
	la a4, .LANCHOR35; lbu a4, 0(a4);
	lla	a1,.LANCHOR36
	seqz	a3,a3
	seqz	t1,a4
	lbu	a5,0(a1)
	and	a3,a0,a3
	seqz	a0,a0
	and	a4,a4,a0
	and	a0,a3,t1
	or	a4,a4,a0
	lbu	t1,6(s0)
	sub	a5,a4,a5
	snez	a5,a5
	or	a5,a5,t1
	sb	a4,0(a1)
	sb	a5,6(s0)
	beq	a3,zero,.L51
	li	t2,-49152
	lla	t1,.LANCHOR49
	lla	a0,.LANCHOR50
	lbu	a4,0(t1)
	lbu	t0,0(a0)
	la a3, .LANCHOR48; lhu a3, 0(a3);
	addi	a1,t2,8
	addi	t2,t2,4
	add	a1,a3,a1
	add	a3,a3,t2
	seqz	a1,a1
	seqz	a3,a3
	sub	a4,a3,a4
	sub	t0,a1,t0
	snez	a4,a4
	snez	t0,t0
	or	a4,a4,t0
	or	a5,a5,a4
	sb	a3,0(t1)
	sb	a1,0(a0)
	sb	a5,6(s0)
	j	.L51
.L610:
	lla	s1,.LANCHOR51
	lbu	a4,0(s1)
	la a0, .LANCHOR3; lbu a0, 0(a0);
	addi	a0,a0,-2
	seqz	a0,a0
	sub	a4,a0,a4
	lbu	a3,1(s0)
	snez	a4,a4
	lla	a5,.LANCHOR52
	lbu	a5,0(a5)
	neg	a4,a4
	la a2, .LANCHOR12; lbu a2, 0(a2);
	andi	a4,a4,6
	seqz	t1,a2
	or	a4,a4,a3
	sb	a4,1(s0)
	sub	a5,t1,a5
	lla	a4,.LANCHOR53
	lw	t0,0(s0)
	lbu	a4,0(a4)
	la a1, .LANCHOR23; lbu a1, 0(a1);
	snez	a5,a5
	sw	t1,68(sp)
	addi	a1,a1,-3
	li	t1,1079508992
	neg	a5,a5
	seqz	a1,a1
	and	a5,a5,t1
	or	a5,a5,t0
	sub	a4,a1,a4
	lbu	t0,5(s0)
	la t1, .LANCHOR18; lbu t1, 0(t1);
	lla	a3,.LANCHOR54
	snez	a4,a4
	lbu	a2,0(a3)
	sw	t1,60(sp)
	slli	ra,a4,4
	lla	a3,.LANCHOR55
	sw	ra,64(sp)
	sw	t0,72(sp)
	lw	ra,60(sp)
	lbu	a3,0(a3)
	slli	a4,a4,5
	srli	t0,a5,24
	sw	a5,0(s0)
	or	t0,a4,t0
	la t2, .LANCHOR29; lbu t2, 0(t2);
	sb	t0,3(s0)
	lw	t0,72(sp)
	sw	t2,80(sp)
	sub	a3,ra,a3
	seqz	t2,t2
	lw	ra,64(sp)
	sub	a2,t2,a2
	snez	a3,a3
	or	a3,a3,t0
	snez	a2,a2
	la t0, .LANCHOR35; lbu t0, 0(t0);
	slli	a2,a2,1
	srli	t1,a5,8
	sw	t0,64(sp)
	la t0, .LANCHOR1; lbu t0, 0(t0);
	or	a5,ra,a5
	or	t1,a2,t1
	lla	a4,.LANCHOR56
	sw	t0,84(sp)
	lla	t0,.LANCHOR34
	la a2, .LANCHOR37; lbu a2, 0(a2);
	sb	a5,0(s0)
	sb	t1,1(s0)
	lbu	a5,0(a4)
	lbu	t0,0(t0)
	la t1, .LANCHOR0; lw t1, 0(t1);
	sw	t1,76(sp)
	lw	t1,68(sp)
	sb	a0,0(s1)
	lla	a0,.LANCHOR52
	sb	t1,0(a0)
	lw	ra,60(sp)
	lla	a0,.LANCHOR53
	sb	a1,0(a0)
	lla	a1,.LANCHOR54
	sb	a2,0(a4)
	sb	t2,0(a1)
	sb	a3,5(s0)
	lla	a1,.LANCHOR55
	lla	a4,.LANCHOR57
	lla	a3,.LANCHOR58
	lbu	a0,0(a4)
	sb	ra,0(a1)
	lbu	a4,0(a3)
	lw	ra,4(s0)
	sub	a3,a2,a5
	snez	a3,a3
	slli	t1,a3,31
	slli	a3,a3,3
	or	a3,a3,ra
	lw	ra,64(sp)
	la s1, .LANCHOR38; lbu s1, 0(s1);
	seqz	a1,s1
	seqz	ra,ra
	sw	ra,88(sp)
	seqz	ra,a2
	sw	ra,92(sp)
	lw	ra,84(sp)
	lw	t2,0(s0)
	sw	a1,68(sp)
	sw	a3,72(sp)
	sub	a0,a1,a0
	addi	ra,ra,-2
	addi	a1,s1,-2
	seqz	a1,a1
	sw	ra,84(sp)
	snez	a0,a0
	lw	ra,72(sp)
	li	a5,134217728
	neg	a0,a0
	addi	a5,a5,1024
	sub	a4,a1,a4
	or	t1,t1,t2
	and	a5,a0,a5
	snez	a4,a4
	or	a5,a5,t1
	sw	ra,4(s0)
	neg	a4,a4
	lw	ra,68(sp)
	andi	a4,a4,6
	srli	a3,a5,8
	or	a3,a4,a3
	lla	a4,.LANCHOR57
	sb	ra,0(a4)
	lw	ra,64(sp)
	srli	t1,a5,24
	lla	t2,.LANCHOR59
	lla	a4,.LANCHOR58
	sw	a5,0(s0)
	sb	a1,0(a4)
	sb	ra,0(t2)
	ori	t1,t1,16
	sb	t1,3(s0)
	lw	ra,88(sp)
	lla	a0,.LANCHOR60
	sb	a2,1(t2)
	sb	ra,0(a0)
	lw	ra,92(sp)
	andi	a5,a5,0xff
	li	a4,99
	sb	ra,1(a0)
	lw	ra,84(sp)
	andi	a3,a3,0xff
	seqz	a2,ra
	sw	a2,64(sp)
	la a2, .LANCHOR6; lw a2, 0(a2);
	addi	a2,a2,1
	sw	a2,68(sp)
	ori	a2,a5,16
	beq	t0,a4,.L620
	addi	a5,t0,1
	andi	a5,a5,127
	sub	a4,t0,a5
	snez	a4,a4
	slli	a4,a4,3
	or	a4,a2,a4
	lw	a2,72(sp)
	lla	a1,.LANCHOR34
	sb	a5,0(a1)
	srli	a2,a2,8
	andi	a5,a2,0xff
	sb	a4,0(s0)
	sw	a5,88(sp)
.L55:
	lw	a5,80(sp)
	lla	a4,.LANCHOR61
	lbu	a2,0(a4)
	or	a5,a5,s1
	seqz	a5,a5
	sub	a2,a5,a2
	lw	t0,60(sp)
	lla	a1,.LANCHOR62
	snez	a2,a2
	sw	a5,72(sp)
	slli	a2,a2,1
	lbu	a5,0(a1)
	lla	t1,.LANCHOR64
	lbu	a4,0(t1)
	la a1, .LANCHOR63; lbu a1, 0(a1);
	or	a3,a3,a2
	sb	a3,1(s0)
	and	t0,t0,a1
	la a2, .LANCHOR65; lbu a2, 0(a2);
	la a3, .LANCHOR17; lbu a3, 0(a3);
	and	a3,a2,a3
	sub	a5,t0,a5
	lw	a1,0(s0)
	sub	a4,a3,a4
	snez	a5,a5
	neg	a5,a5
	sw	a3,84(sp)
	snez	a4,a4
	li	a3,67174400
	and	a3,a5,a3
	neg	a4,a4
	or	a3,a3,a1
	andi	a2,a4,-128
	sw	a3,0(s0)
	or	a2,a2,a3
	sb	a2,0(s0)
	lw	a2,76(sp)
	srli	a1,a3,8
	lla	s1,.LANCHOR66
	andi	a4,a4,9
	or	a4,a4,a1
	lbu	a5,0(s1)
	andi	a1,a2,-4
	lw	a2,64(sp)
	srli	a3,a1,4
	andi	a3,a3,3
	sub	a5,a2,a5
	snez	a5,a5
	li	a2,2101248
	lla	t2,.LANCHOR68
	addi	a2,a2,-2048
	neg	a5,a5
	sb	a4,1(s0)
	sw	t0,80(sp)
	lbu	a4,0(t2)
	lla	ra,.LANCHOR67
	and	a5,a5,a2
	slli	t0,a3,2
	lla	a2,.LANCHOR70
	lw	t1,0(s0)
	lw	a0,0(ra)
	add	a2,a2,t0
	lw	a2,0(a2)
	sub	a4,a3,a4
	or	a5,a5,t1
	snez	a4,a4
	sub	a0,a1,a0
	sw	a2,60(sp)
	slli	a4,a4,3
	srli	a2,a5,16
	snez	a0,a0
	or	a2,a4,a2
	slli	a0,a0,3
	sw	a5,0(s0)
	or	a2,a2,a0
	lla	t1,.LANCHOR69
	lw	a0,0(t1)
	sb	a2,2(s0)
	lw	a2,60(sp)
	lla	t0,.LANCHOR7
	lw	a4,0(t0)
	sub	a5,a2,a0
	lw	a2,68(sp)
	lw	a0,0(s0)
	snez	a5,a5
	sub	a4,a2,a4
	neg	a5,a5
	li	a2,-2146959360
	and	a2,a5,a2
	or	a2,a2,a0
	lw	a0,88(sp)
	snez	a4,a4
	or	a5,a0,a4
	lw	a0,72(sp)
	lla	a4,.LANCHOR61
	sb	a5,5(s0)
	sb	a0,0(a4)
	lw	a0,80(sp)
	lla	a4,.LANCHOR62
	lw	a5,64(sp)
	sb	a0,0(a4)
	lw	a0,84(sp)
	lla	a4,.LANCHOR64
	sb	a5,0(s1)
	sb	a0,0(a4)
	lw	a5,60(sp)
	lw	a4,68(sp)
	sw	a2,0(s0)
	andi	a2,a2,0xff
	sw	a5,0(t1)
	sw	a4,0(t0)
	sw	a1,0(ra)
	sb	a3,0(t2)
	andi	a5,a2,16
	beq	a5,zero,.L56
.L611:
	la a5, .LANCHOR71; lbu a5, 0(a5);
	lla	a4,.LANCHOR59
	add	a4,a4,a5
	lbu	t1,0(a4)
	la a3, .LANCHOR31; lbu a3, 0(a3);
	addi	a0,a3,-1
	lla	a4,.LANCHOR72
	lbu	a4,0(a4)
	seqz	a0,a0
	and	s1,a0,t1
	lla	a1,.LANCHOR73
	la t1, .LANCHOR73; sh zero, 0(t1);
	la a2, .LANCHOR27; lbu a2, 0(a2);
	lbu	t1,3(s0)
	lla	a0,.LANCHOR60
	add	a2,a1,a2
	add	a5,a0,a5
	sb	s1,0(a2)
	sub	a4,s1,a4
	lbu	ra,1(a0)
	lbu	t0,0(a5)
	lbu	a0,1(a1)
	lla	a5,.LANCHOR74
	snez	a4,a4
	lbu	a1,0(a5)
	mv	t2,t1
	slli	a4,a4,5
	or	a4,a4,t2
	la t2, .LANCHOR53; lbu t2, 0(t2);
	and	a0,a0,t2
	sb	a4,3(s0)
	sub	a4,a0,a1
	lla	a1,.LANCHOR78
	lw	a1,0(a1)
	addi	t1,a3,-2
	seqz	a3,a3
	and	a3,a3,ra
	seqz	t1,t1
	la ra, .LANCHOR79; lw ra, 0(ra);
	and	t1,t1,t0
	sub	t0,ra,a1
	lw	a1,4(s0)
	snez	a4,a4
	lla	a5,.LANCHOR76
	lbu	a5,0(a5)
	neg	t2,a4
	lla	a2,.LANCHOR75
	slli	a4,a4,2
	or	a4,a4,a1
	lbu	a2,0(a2)
	lw	a1,0(s0)
	or	a3,a3,t1
	la t1, .LANCHOR77; lbu t1, 0(t1);
	sw	t1,60(sp)
	sub	a5,t1,a5
	li	t1,1074266112
	or	t1,a1,t1
	sub	a2,a3,a2
	li	a1,-2147352576
	snez	a2,a2
	snez	t0,t0
	snez	a5,a5
	and	a1,a1,t2
	or	a1,a1,t1
	neg	a2,a2
	li	t1,805830656
	or	a5,a5,t0
	and	a2,a2,t1
	sw	a4,4(s0)
	srli	t1,a4,16
	slli	a5,a5,1
	lla	a4,.LANCHOR72
	sb	s1,0(a4)
	or	a5,a5,t1
	lla	a4,.LANCHOR74
	lw	t1,60(sp)
	or	a2,a2,a1
	sb	a0,0(a4)
	lla	a4,.LANCHOR75
	sb	a3,0(a4)
	sw	a2,0(s0)
	lla	a4,.LANCHOR76
	lla	a1,.LANCHOR78
	andi	a2,a2,0xff
	sb	t1,0(a4)
	sw	ra,0(a1)
	sb	a5,6(s0)
	andi	a2,a2,32
	beq	a2,zero,.L621
.L57:
	lla	s1,.LANCHOR96
	lla	ra,.LANCHOR98
	lw	a4,0(s1)
	lbu	a5,0(ra)
	lla	a3,.LANCHOR100
	la a2, .LANCHOR97; lw a2, 0(a2);
	la a1, .LANCHOR99; lbu a1, 0(a1);
	lw	a3,0(a3)
	lla	a0,.LANCHOR102
	sub	a4,a2,a4
	sub	a5,a1,a5
	lla	t1,.LANCHOR104
	la t0, .LANCHOR101; lw t0, 0(t0);
	lbu	ra,0(a0)
	lbu	t2,6(s0)
	sw	a2,60(sp)
	snez	a4,a4
	lw	a2,0(t1)
	snez	a5,a5
	or	a5,a5,a4
	sub	a4,t0,a3
	la a0, .LANCHOR103; lbu a0, 0(a0);
	la a3, .LANCHOR105; lw a3, 0(a3);
	slli	a5,a5,2
	snez	a4,a4
	sub	ra,a0,ra
	or	t2,t2,a5
	slli	a5,a4,2
	sub	a4,a3,a2
	or	t2,t2,a5
	snez	ra,ra
	snez	a5,a4
	sw	a5,80(sp)
	slli	ra,ra,2
	or	t2,t2,ra
	lw	ra,80(sp)
	la t1, .LANCHOR90; lw t1, 0(t1);
	la a5, .LANCHOR91; lbu a5, 0(a5);
	slli	ra,ra,2
	la a4, .LANCHOR92; lw a4, 0(a4);
	sw	t0,68(sp)
	sw	a0,72(sp)
	la t0, .LANCHOR89; lbu t0, 0(t0);
	la a0, .LANCHOR88; lbu a0, 0(a0);
	sw	ra,80(sp)
	la a2, .LANCHOR94; lw a2, 0(a2);
	la ra, .LANCHOR85; sb a5, 0(ra);
	la ra, .LANCHOR80; sb a0, 0(ra);
	la ra, .LANCHOR87; sb t0, 0(ra);
	la ra, .LANCHOR86; sw t1, 0(ra);
	la ra, .LANCHOR84; sw a4, 0(ra);
	sw	a1,64(sp)
	sw	a3,76(sp)
	la a1, .LANCHOR95; lw a1, 0(a1);
	la a3, .LANCHOR93; lbu a3, 0(a3);
	la ra, .LANCHOR83; sb a3, 0(ra);
	la ra, .LANCHOR82; sw a2, 0(ra);
	la ra, .LANCHOR81; sw a1, 0(ra);
	lw	ra,60(sp)
	sw	ra,0(s1)
	lw	s1,64(sp)
	lla	ra,.LANCHOR98
	sb	s1,0(ra)
	lw	s1,68(sp)
	lla	ra,.LANCHOR100
	sw	s1,0(ra)
	lw	s1,72(sp)
	lla	ra,.LANCHOR102
	sb	s1,0(ra)
	lw	s1,76(sp)
	lla	ra,.LANCHOR104
	sw	s1,0(ra)
	lw	ra,80(sp)
	or	t2,t2,ra
	sb	t2,6(s0)
	sw	t0,4(sp)
	sw	t1,0(sp)
	call	NPCTrap
	lb	a5,0(s0)
	bge	a5,zero,.L622
.L59:
	lla	a5,.LANCHOR106
	lhu	a3,0(a5)
	la a2, .LANCHOR107; lw a2, 0(a2);
	lla	a1,.LANCHOR108
	lla	t0,.LANCHOR110
	slli	a2,a2,20
	srli	a2,a2,20
	lbu	a4,0(a1)
	lbu	a1,0(t0)
	lla	t0,.LANCHOR64
	lbu	t0,0(t0)
	sub	a3,a2,a3
	lbu	s1,1(s0)
	snez	a3,a3
	lla	a0,.LANCHOR109
	neg	a3,a3
	lbu	a5,0(a0)
	addi	t1,a2,-773
	sw	t0,68(sp)
	andi	a3,a3,65
	lla	t0,.LANCHOR46
	seqz	t2,t1
	or	a3,a3,s1
	lbu	t0,0(t0)
	lw	s1,68(sp)
	addi	ra,a2,-833
	sw	ra,64(sp)
	sub	a4,t2,a4
	seqz	ra,ra
	addi	a0,a2,-768
	snez	a4,a4
	sub	a5,ra,a5
	and	t0,s1,t0
	sw	t2,60(sp)
	neg	a4,a4
	seqz	t2,a0
	snez	a5,a5
	snez	t1,t1
	and	t1,t1,t0
	sub	a1,t2,a1
	andi	a4,a4,9
	neg	a5,a5
	snez	a0,a0
	or	a4,a3,a4
	and	a0,a0,t1
	lw	a3,60(sp)
	lw	t1,64(sp)
	snez	a1,a1
	andi	a5,a5,9
	or	a5,a4,a5
	neg	a1,a1
	lla	a4,.LANCHOR106
	sh	a2,0(a4)
	andi	a1,a1,9
	lla	a4,.LANCHOR108
	or	s1,a5,a1
	sb	a3,0(a4)
	snez	a5,t1
	lla	a4,.LANCHOR109
	lla	t0,.LANCHOR110
	sb	ra,0(a4)
	sb	t2,0(t0)
	sb	s1,1(s0)
	and	a5,a5,a0
	bne	a5,zero,.L623
.L61:
	lla	a3,.LANCHOR111
	lbu	a5,0(a3)
	la a4, .LANCHOR17; lbu a4, 0(a4);
	la a1, .LANCHOR112; lbu a1, 0(a1);
	lbu	a2,2(s0)
	and	a4,a4,a1
	sub	a5,a4,a5
	snez	a5,a5
	or	a5,a5,a2
	sb	a4,0(a3)
	sb	a5,2(s0)
	j	.L60
.L65:
	la a5, .LANCHOR41+1; sb zero, 0(a5);
	andi	a5,s1,1
	bne	a5,zero,.L624
.L67:
	lla	a4,.LANCHOR124
	andi	a5,s1,2
	sw	a4,60(sp)
	bne	a5,zero,.L625
.L184:
	andi	a5,s1,4
	bne	a5,zero,.L626
.L186:
	andi	a5,s1,8
	bne	a5,zero,.L627
.L187:
	andi	a5,s1,16
	lla	ra,.LANCHOR147
	bne	a5,zero,.L628
.L190:
	andi	a5,s1,32
	lla	t2,.LANCHOR153
	bne	a5,zero,.L629
.L194:
	andi	a5,s1,64
	bne	a5,zero,.L630
.L197:
	slli	s1,s1,24
	srai	s1,s1,24
	bge	s1,zero,.L66
	la a5, .LANCHOR135; lbu a5, 0(a5);
	beq	a5,zero,.L66
	lla	t1,.LANCHOR161
	lw	a2,0(t1)
	lbu	a0,5(s0)
	la t0, .LANCHOR160; lw t0, 0(t0);
	sw	t0,68(sp)
	sub	a2,t0,a2
	lla	t0,.LANCHOR77
	sw	a0,72(sp)
	lbu	a0,0(t0)
	lla	a5,.LANCHOR162
	lbu	a4,0(a5)
	sw	a0,92(sp)
	lla	a0,.LANCHOR101
	lw	a0,0(a0)
	lla	a5,.LANCHOR97
	lw	s1,0(a5)
	lla	a3,.LANCHOR63
	la a5, .LANCHOR163; lbu a5, 0(a5);
	lbu	a1,0(a3)
	la t0, .LANCHOR112; lbu t0, 0(t0);
	la a3, .LANCHOR128; lbu a3, 0(a3);
	sub	a4,a5,a4
	sw	t0,64(sp)
	snez	a2,a2
	seqz	t0,a3
	sw	a0,96(sp)
	snez	a4,a4
	lla	a0,.LANCHOR103
	or	a4,a4,a2
	neg	a2,t0
	lbu	t0,0(a0)
	sw	a2,84(sp)
	slli	a4,a4,4
	lw	a2,64(sp)
	sw	t0,100(sp)
	lbu	t0,0(s0)
	sw	a4,104(sp)
	lw	a4,84(sp)
	sw	a5,80(sp)
	sub	a1,a2,a1
	la a5, .LANCHOR114; lw a5, 0(a5);
	sw	t0,76(sp)
	la t0, .LANCHOR167; lw t0, 0(t0);
	sub	a2,a5,s1
	neg	a3,a3
	and	t0,a4,t0
	snez	a1,a1
	la a4, .LANCHOR149; lw a4, 0(a4);
	and	a4,a3,a4
	snez	a2,a2
	la a3, .LANCHOR165; lw a3, 0(a3);
	slli	a1,a1,3
	la s1, .LANCHOR164; lbu s1, 0(s1);
	sw	a2,108(sp)
	sw	a3,84(sp)
	la a3, .LANCHOR166; lbu a3, 0(a3);
	sw	a1,112(sp)
	lw	a1,92(sp)
	or	t0,t0,a4
	lw	a4,72(sp)
	sub	a1,s1,a1
	sw	s1,72(sp)
	lw	s1,68(sp)
	lw	a2,104(sp)
	sw	a3,88(sp)
	sw	s1,0(t1)
	lw	s1,64(sp)
	lla	t1,.LANCHOR63
	lla	a3,.LANCHOR105
	sb	s1,0(t1)
	lw	s1,80(sp)
	lla	t1,.LANCHOR162
	or	a4,a4,a2
	sb	s1,0(t1)
	lw	s1,72(sp)
	sw	a1,116(sp)
	sb	a4,5(s0)
	lw	a1,0(a3)
	lla	a4,.LANCHOR97
	sw	a5,0(a4)
	lw	t1,84(sp)
	lla	a4,.LANCHOR77
	sb	s1,0(a4)
	lw	s1,88(sp)
	sw	a1,92(sp)
	lla	a4,.LANCHOR101
	la a1, .LANCHOR133; lbu a1, 0(a1);
	sw	t1,0(a4)
	sw	a1,104(sp)
	la a4, .LANCHOR168; lw a4, 0(a4);
	la a1, .LANCHOR118; lbu a1, 0(a1);
	lw	a2,108(sp)
	sb	s1,0(a0)
	sw	t0,0(a3)
	sw	a4,64(sp)
	sw	a1,108(sp)
	lw	a1,112(sp)
	lw	a0,96(sp)
	lw	a4,108(sp)
	slli	a2,a2,5
	sub	a0,t1,a0
	lw	t1,104(sp)
	or	a3,a1,a2
	lla	a2,.LANCHOR99
	or	a4,t1,a4
	lw	t1,76(sp)
	lbu	a1,0(a2)
	lw	a2,116(sp)
	or	a3,t1,a3
	lw	t1,100(sp)
	srli	a5,a5,31
	snez	a2,a2
	sub	t1,s1,t1
	xori	a5,a5,1
	lla	s1,.LANCHOR79
	slli	a2,a2,4
	and	a5,a4,a5
	or	a2,a3,a2
	lw	a4,0(s1)
	lw	a3,64(sp)
	snez	a0,a0
	slli	a0,a0,5
	or	a2,a2,a0
	lw	a0,92(sp)
	sub	a3,a3,a4
	snez	t1,t1
	slli	t1,t1,5
	snez	a3,a3
	sub	a1,a5,a1
	or	t1,a2,t1
	slli	a3,a3,4
	snez	a1,a1
	sub	a2,t0,a0
	lw	a4,64(sp)
	or	a3,t1,a3
	slli	a1,a1,5
	snez	a2,a2
	slli	a2,a2,5
	or	a3,a3,a1
	or	a3,a3,a2
	lla	a2,.LANCHOR99
	sw	a4,0(s1)
	sb	a5,0(a2)
	sb	a3,0(s0)
	j	.L66
.L199:
	la a5, .LANCHOR41+2; sb zero, 0(a5);
	andi	a5,a4,1
	bne	a5,zero,.L631
.L201:
	andi	a5,a4,2
	bne	a5,zero,.L632
.L203:
	andi	a5,a4,4
	lla	s1,.LANCHOR214
	bne	a5,zero,.L633
.L205:
	slli	a3,a4,24
	srai	a3,a3,24
	andi	a5,a4,8
	sw	a3,64(sp)
	bne	a5,zero,.L634
.L209:
	andi	a5,a4,16
	bne	a5,zero,.L635
.L211:
	andi	a3,a4,32
	lbu	a5,3(s0)
	bne	a3,zero,.L636
.L212:
	andi	a4,a4,64
	bne	a4,zero,.L637
.L213:
	lw	a4,64(sp)
	bge	a4,zero,.L200
	la a4, .LANCHOR243; lbu a4, 0(a4);
	seqz	a1,a4
	snez	a4,a4
	neg	a2,a1
	neg	a4,a4
	xor	a4,a4,a2
	la a0, .LANCHOR234; lw a0, 0(a0);
	la a3, .LANCHOR233; lw a3, 0(a3);
	and	a4,a4,a0
	xor	a4,a4,a2
	add	a1,a3,a1
	add	t1,a4,a1
	lla	t0,.LANCHOR244
	lla	a2,.LANCHOR245
	sltu	a1,a1,a3
	lw	a0,0(t0)
	lbu	a2,0(a2)
	sltu	a4,t1,a4
	lla	a3,.LANCHOR246
	lbu	a3,0(a3)
	add	a4,a4,a1
	la a1, .LANCHOR232; lw a1, 0(a1);
	xori	a4,a4,1
	srli	a1,a1,31
	xor	a1,a4,a1
	sub	a0,t1,a0
	sub	a2,a4,a2
	snez	a0,a0
	snez	a2,a2
	sub	a3,a1,a3
	neg	a0,a0
	neg	a2,a2
	snez	a3,a3
	or	a2,a0,a2
	neg	a3,a3
	or	a3,a3,a2
	andi	a3,a3,3
	or	a5,a5,a3
	lla	a2,.LANCHOR245
	lla	a3,.LANCHOR246
	sw	t1,0(t0)
	sb	a4,0(a2)
	sb	a1,0(a3)
	sb	a5,3(s0)
	j	.L200
.L219:
	la a4, .LANCHOR41+3; sb zero, 0(a4);
	andi	a4,a5,1
	bne	a4,zero,.L638
.L221:
	andi	a4,a5,2
	bne	a4,zero,.L639
.L224:
	andi	a4,a5,4
	bne	a4,zero,.L640
.L226:
	andi	a4,a5,8
	bne	a4,zero,.L229
	lla	a4,.LANCHOR267
.L230:
	andi	a3,a5,16
	bne	a3,zero,.L641
	andi	a3,a5,32
	bne	a3,zero,.L642
.L234:
	andi	a3,a5,64
	bne	a3,zero,.L643
.L235:
	slli	a5,a5,24
	srai	a5,a5,24
	bge	a5,zero,.L220
	lla	t0,.LANCHOR37
	lbu	a5,0(t0)
	la a3, .LANCHOR56; lbu a3, 0(a3);
	la a1, .LANCHOR273; lbu a1, 0(a1);
	and	a1,a1,a3
	la a3, .LANCHOR268; lbu a3, 0(a3);
	and	a3,a1,a3
	la a0, .LANCHOR209; lbu a0, 0(a0);
	seqz	a2,a5
	seqz	a3,a3
	and	a2,a0,a2
	and	a3,a5,a3
	or	a3,a3,a2
	sub	a5,a5,a3
	snez	a5,a5
	li	a2,-2147221504
	addi	a2,a2,8
	neg	a5,a5
	and	a5,a5,a2
	sw	a0,72(sp)
	la a2, .LANCHOR262; lbu a2, 0(a2);
	lw	a0,0(s0)
	sw	a2,64(sp)
	sb	a3,0(t0)
	lw	a3,64(sp)
	or	a5,a5,a0
	la a0, .LANCHOR74; lbu a0, 0(a0);
	sw	a0,68(sp)
	la t1, .LANCHOR15; lbu t1, 0(t1);
	and	t1,a3,t1
	lw	a3,68(sp)
	la a2, .LANCHOR271; lbu a2, 0(a2);
	la a0, .LANCHOR188; lbu a0, 0(a0);
	sw	a5,0(s0)
	and	a2,a3,a2
	seqz	a0,a0
	beq	a1,zero,.L237
	lla	t0,.LANCHOR269
	lbu	a1,0(t0)
	srli	a3,a5,24
	ori	a3,a3,-112
	addi	a1,a1,-1
	sb	a1,0(t0)
	sb	a3,3(s0)
.L238:
	and	a2,a2,a0
	beq	a2,zero,.L239
	la a2, .LANCHOR193; lbu a2, 0(a2);
	slli	a3,a2,2
	lla	a1,.LANCHOR70
	add	a1,a1,a3
	ori	a5,a5,8
	la a0, .LANCHOR192; lw a0, 0(a0);
	lla	a3,.LANCHOR19
	sb	a5,0(s0)
	sw	a0,0(a1)
	lbu	a5,0(a3)
	bne	t1,zero,.L274
	li	a1,1
	sll	a2,a1,a2
	andi	a2,a2,15
	or	a2,a5,a2
	sub	a5,a5,a2
	lw	a1,0(s0)
	snez	a5,a5
	neg	a5,a5
	li	a0,-2146959360
	and	a5,a5,a0
	or	a5,a5,a1
	sb	a2,0(a3)
	sw	a5,0(s0)
	j	.L220
.L241:
	la a5, .LANCHOR209; lbu a5, 0(a5);
	seqz	a1,a5
	la a3, .LANCHOR276; lw a3, 0(a3);
	neg	a1,a1
	and	a1,a1,a3
	neg	a5,a5
	la a3, .LANCHOR207; lw a3, 0(a3);
	and	a5,a5,a3
	or	a1,a1,a5
	la a5, .LANCHOR275; sw a1, 0(a5);
	j	.L242
.L612:
	lla	a3,.LANCHOR32
	lw	a2,0(a3)
	lw	a0,4(a3)
	la a1, .LANCHOR280; lbu a1, 0(a1);
	la a3, .LANCHOR279; lbu a3, 0(a3);
	neg	a3,a3
	neg	a1,a1
	and	a1,a1,a2
	and	a3,a3,a0
	la a0, .LANCHOR71; lbu a0, 0(a0);
	lla	a2,.LANCHOR278
	or	a3,a3,a1
	slli	a1,a0,2
	sw	a3,0(a2)
	lla	t0,.LANCHOR157
	sw	a4,4(a2)
	add	a2,a2,a1
	lw	a4,0(a2)
	lw	t1,0(t0)
	lbu	a3,1(s0)
	la a0, .LANCHOR188; lbu a0, 0(a0);
	sub	t1,a4,t1
	snez	t1,t1
	slli	t1,t1,6
	or	t1,t1,a3
	la a1, .LANCHOR21; lbu a1, 0(a1);
	la a2, .LANCHOR202; lbu a2, 0(a2);
	la a3, .LANCHOR74; lbu a3, 0(a3);
	seqz	t2,a0
	sub	a2,a2,a1
	sb	t1,1(s0)
	sw	a4,0(t0)
	and	t1,a3,t2
	seqz	a2,a2
	beq	t1,zero,.L246
	addi	t2,a1,-3
	seqz	t2,t2
	addi	t1,a1,-1
	addi	t0,a1,-2
	and	t2,a3,t2
	seqz	a1,a1
	seqz	t1,t1
	seqz	t0,t0
	beq	t2,zero,.L247
	lbu	s1,2(s0)
	la t2, .LANCHOR193; lbu t2, 0(t2);
	slli	t2,t2,2
	sw	s1,60(sp)
	lla	s1,.LANCHOR201
	add	t2,s1,t2
	lw	s1,60(sp)
	sw	a4,0(t2)
	ori	s1,s1,2
	sb	s1,2(s0)
.L247:
	and	t0,a3,t0
	beq	t0,zero,.L248
	lbu	t0,2(s0)
	la t2, .LANCHOR193; lbu t2, 0(t2);
	slli	s1,t2,2
	lla	t2,.LANCHOR199
	add	t2,t2,s1
	ori	t0,t0,2
	sw	a4,0(t2)
	sb	t0,2(s0)
.L248:
	and	t1,a3,t1
	beq	t1,zero,.L249
	lbu	t1,2(s0)
	la t2, .LANCHOR193; lbu t2, 0(t2);
	slli	t2,t2,2
	lla	t0,.LANCHOR197
	add	t0,t0,t2
	ori	t1,t1,2
	sw	a4,0(t0)
	sb	t1,2(s0)
.L249:
	and	a1,a3,a1
	beq	a1,zero,.L246
	lbu	a1,2(s0)
	la t0, .LANCHOR193; lbu t0, 0(t0);
	slli	t0,t0,2
	lla	t1,.LANCHOR195
	add	t1,t1,t0
	ori	a1,a1,2
	sw	a4,0(t1)
	sb	a1,2(s0)
.L246:
	or	a0,a0,a2
	and	a3,a3,a0
	beq	a3,zero,.L244
	lla	a3,.LANCHOR223
	lw	a1,0(a3)
	lbu	a2,2(s0)
	sw	a4,0(a3)
	sub	a4,a4,a1
	snez	a4,a4
	slli	a4,a4,4
	or	a4,a4,a2
	sb	a4,2(s0)
	j	.L244
.L613:
	la a4, .LANCHOR273; lbu a4, 0(a4);
	la a3, .LANCHOR56; lbu a3, 0(a3);
	and	a4,a4,a3
	bne	a4,zero,.L644
	la a4, .LANCHOR209; lbu a4, 0(a4);
	beq	a4,zero,.L252
	lla	a3,.LANCHOR276
	lw	a2,0(a3)
	la a4, .LANCHOR207; lw a4, 0(a4);
	sw	a4,0(a3)
	sub	a4,a4,a2
	snez	a4,a4
	neg	a4,a4
	andi	a4,a4,9
	or	a5,a5,a4
	sb	a5,4(s0)
	j	.L252
.L614:
	lla	t0,.LANCHOR1
	lbu	a3,0(t0)
	lla	a0,.LANCHOR190
	lbu	a4,0(a0)
	la t2, .LANCHOR2; lbu t2, 0(t2);
	la t1, .LANCHOR219; lbu t1, 0(t1);
	sub	a3,t2,a3
	lla	a2,.LANCHOR188
	sub	a4,t1,a4
	snez	a3,a3
	li	s1,537399296
	lbu	a5,0(a2)
	addi	s1,s1,-2040
	snez	a4,a4
	neg	a3,a3
	and	a3,a3,s1
	neg	a4,a4
	li	s1,1075445760
	la a1, .LANCHOR218; lbu a1, 0(a1);
	and	a4,a4,s1
	lw	s1,0(s0)
	sub	a5,a1,a5
	snez	a5,a5
	or	a4,a3,a4
	or	a4,a4,s1
	neg	a3,a5
	li	s1,-1073348608
	and	a3,s1,a3
	lw	s1,4(s0)
	slli	a5,a5,2
	or	a4,a3,a4
	or	a5,a5,s1
	sw	a5,4(s0)
	sb	t2,0(t0)
	sb	t1,0(a0)
	sb	a1,0(a2)
	sw	a4,0(s0)
	andi	a5,a5,0xff
	j	.L254
.L615:
	lla	t1,.LANCHOR154
	lla	t0,.LANCHOR4
	lw	a2,0(t1)
	lw	a4,0(t0)
	lla	a3,.LANCHOR8
	lw	a3,0(a3)
	la s1, .LANCHOR152; lw s1, 0(s1);
	la t2, .LANCHOR5; lw t2, 0(t2);
	sub	a2,s1,a2
	sub	a4,t2,a4
	lbu	a1,1(s0)
	la a0, .LANCHOR9; lw a0, 0(a0);
	snez	a2,a2
	snez	a4,a4
	slli	a2,a2,5
	slli	a4,a4,6
	sub	a3,a0,a3
	or	a4,a2,a4
	snez	a3,a3
	or	a1,a1,a4
	slli	a3,a3,6
	or	a1,a1,a3
	lla	a4,.LANCHOR8
	sw	s1,0(t1)
	sw	t2,0(t0)
	sw	a0,0(a4)
	sb	a1,1(s0)
	j	.L255
.L616:
	lla	a3,.LANCHOR151
	lw	a4,0(a3)
	la a2, .LANCHOR116; lw a2, 0(a2);
	lbu	a1,1(s0)
	sub	a4,a2,a4
	snez	a4,a4
	neg	a4,a4
	andi	a4,a4,96
	or	a4,a4,a1
	sw	a2,0(a3)
	sb	a4,1(s0)
	j	.L256
.L617:
	lla	a2,.LANCHOR156
	lla	a4,.LANCHOR150
	lw	a5,0(a2)
	lw	a0,0(a4)
	la a1, .LANCHOR131; lw a1, 0(a1);
	la a3, .LANCHOR132; lw a3, 0(a3);
	lbu	t1,1(s0)
	sub	a5,a1,a5
	sub	a0,a3,a0
	snez	a5,a5
	snez	a0,a0
	slli	a5,a5,6
	neg	a0,a0
	or	a5,a5,t1
	andi	a0,a0,96
	or	a5,a5,a0
	sw	a1,0(a2)
	sw	a3,0(a4)
	sb	a5,1(s0)
	j	.L257
.L618:
	la a4, .LANCHOR41+5; sb zero, 0(a4);
	andi	a4,a5,1
	bne	a4,zero,.L645
.L260:
	andi	a4,a5,2
	bne	a4,zero,.L646
.L261:
	andi	a4,a5,4
	bne	a4,zero,.L647
.L262:
	andi	a4,a5,8
	bne	a4,zero,.L648
.L263:
	andi	a4,a5,16
	bne	a4,zero,.L649
.L264:
	andi	a4,a5,32
	bne	a4,zero,.L650
.L265:
	andi	a4,a5,64
	bne	a4,zero,.L651
.L266:
	slli	a5,a5,24
	srai	a5,a5,24
	bge	a5,zero,.L259
	lla	a5,.LANCHOR71
	lbu	a5,0(a5)
	lla	a4,.LANCHOR281
	lbu	a4,0(a4)
	lla	t1,.LANCHOR27
	la a0, .LANCHOR211; lbu a0, 0(a0);
	lw	a1,4(s0)
	lbu	s1,0(t1)
	la a2, .LANCHOR213; lbu a2, 0(a2);
	sub	a5,a0,a5
	snez	a5,a5
	sub	a4,a2,a4
	la t0, .LANCHOR28; lbu t0, 0(t0);
	slli	t2,a5,2
	snez	a4,a4
	or	t2,t2,a1
	sub	s1,t0,s1
	slli	a4,a4,3
	sw	t2,4(s0)
	or	a4,a4,t2
	snez	s1,s1
	lla	a3,.LANCHOR273
	sb	a4,4(s0)
	lbu	a3,0(a3)
	neg	a4,s1
	li	s1,537133056
	lw	a1,0(s0)
	addi	s1,s1,16
	la t2, .LANCHOR210; lbu t2, 0(t2);
	and	a4,a4,s1
	li	s1,805306368
	neg	a5,a5
	sub	a3,t2,a3
	addi	s1,s1,16
	or	a4,a4,a1
	snez	a3,a3
	and	a5,a5,s1
	or	a5,a5,a4
	lw	a1,4(s0)
	slli	a4,a3,31
	or	a4,a4,a5
	lla	a5,.LANCHOR71
	sb	a0,0(a5)
	slli	a3,a3,3
	lla	a5,.LANCHOR281
	sb	a2,0(a5)
	or	a3,a3,a1
	lla	a5,.LANCHOR273
	sb	t0,0(t1)
	sb	t2,0(a5)
	sw	a4,0(s0)
	sw	a3,4(s0)
	j	.L259
.L619:
	la a4, .LANCHOR41+6; sb zero, 0(a4);
	andi	a4,a5,1
	bne	a4,zero,.L652
.L270:
	andi	a4,a5,2
	bne	a4,zero,.L653
.L271:
	andi	a4,a5,4
	bne	a4,zero,.L654
.L272:
	andi	a5,a5,8
	beq	a5,zero,.L47
	lla	a3,.LANCHOR38
	lbu	a5,0(a3)
	la a2, .LANCHOR39; lbu a2, 0(a2);
	lw	a1,0(s0)
	sub	a5,a2,a5
	snez	a5,a5
	li	a4,134217728
	neg	a5,a5
	addi	a4,a4,1032
	and	a5,a5,a4
	or	a5,a5,a1
	sb	a2,0(a3)
	sw	a5,0(s0)
	j	.L47
.L644:
	lla	a2,.LANCHOR276
	lw	a4,0(a2)
	la a1, .LANCHOR281; lbu a1, 0(a1);
	li	a3,1
	sll	a3,a3,a1
	andi	a3,a3,255
	add	a3,a3,a4
	sub	a4,a4,a3
	snez	a4,a4
	neg	a4,a4
	andi	a4,a4,9
	or	a5,a5,a4
	sw	a3,0(a2)
	sb	a5,4(s0)
	j	.L252
.L620:
	lla	a2,.LANCHOR32
	lw	a4,0(a2)
	lla	a1,.LANCHOR33
	lw	a2,4(a2)
	lw	t1,0(a1)
	addi	a0,a4,1
	lw	t0,4(a1)
	sltu	a4,a0,a4
	add	a4,a4,a2
	xor	a2,a0,t1
	xor	t1,a4,t0
	or	a2,a2,t1
	lw	t1,72(sp)
	snez	a2,a2
	ori	a5,a5,24
	srli	t1,t1,8
	or	t1,a2,t1
	sw	a4,4(a1)
	andi	a4,t1,0xff
	sw	a4,88(sp)
	sw	a0,0(a1)
	la a4, .LANCHOR34; sb zero, 0(a4);
	sb	a5,0(s0)
	j	.L55
.L623:
	lla	a0,.LC9
	call	printf
	lla	a0,.LC10
	call	printf
	lla	a0,.LC11
	call	printf
	lla	a4,.LANCHOR46
	lbu	a1,0(a4)
	lla	a5,.LANCHOR64
	lla	a4,.LANCHOR108
	lbu	a2,0(a4)
	lbu	a5,0(a5)
	lla	a4,.LANCHOR110
	lbu	a3,0(a4)
	lla	a4,.LANCHOR109
	lbu	a4,0(a4)
	and	a5,a5,a1
	xori	a2,a2,1
	and	a5,a5,a2
	xori	a3,a3,1
	and	a5,a5,a3
	xori	a4,a4,1
	and	a5,a5,a4
	bne	a5,zero,.L278
	lbu	s1,1(s0)
	j	.L61
.L625:
	la a3, .LANCHOR3; lbu a3, 0(a3);
	la a4, .LANCHOR119; lbu a4, 0(a4);
	la a5, .LANCHOR17; lbu a5, 0(a5);
	lla	ra,.LANCHOR121
	lw	ra,0(ra)
	and	a5,a4,a5
	seqz	t1,a3
	lla	a4,.LANCHOR120
	lla	a0,.LANCHOR123
	and	t1,a5,t1
	lbu	a1,0(a4)
	sw	a5,64(sp)
	lbu	a4,0(a0)
	la a5, .LANCHOR51; lbu a5, 0(a5);
	la a0, .LANCHOR30; lbu a0, 0(a0);
	lla	t2,.LANCHOR118
	lla	t0,.LANCHOR117
	sb	a5,0(t0)
	lbu	a2,0(t2)
	la a5, .LANCHOR117+1; sb zero, 0(a5);
	add	t0,t0,a0
	lla	t2,.LANCHOR29
	sw	ra,76(sp)
	sw	a0,80(sp)
	lbu	ra,0(t2)
	addi	a0,t1,-1
	lbu	t2,0(t0)
	la t0, .LANCHOR122; lw t0, 0(t0);
	neg	a5,t1
	and	a0,a0,t0
	la t0, .LANCHOR114; lw t0, 0(t0);
	and	a5,a5,t0
	lw	t0,64(sp)
	sub	a1,t1,a1
	addi	a3,a3,-1
	sub	a2,t0,a2
	lbu	t0,3(s0)
	snez	a2,a2
	snez	a1,a1
	sw	t0,72(sp)
	seqz	a3,a3
	lw	t0,76(sp)
	neg	a2,a2
	neg	a1,a1
	or	a3,t1,a3
	andi	a1,a1,56
	andi	a2,a2,-116
	or	a0,a0,a5
	or	a2,a2,a1
	sub	a4,a3,a4
	lw	a1,72(sp)
	snez	a4,a4
	sub	t0,a0,t0
	sw	a0,68(sp)
	la a5, .LANCHOR58; lbu a5, 0(a5);
	neg	a0,a4
	snez	t0,t0
	slli	a4,a4,3
	and	a5,a5,t2
	slli	t0,t0,3
	or	a4,a1,a4
	addi	t2,ra,-2
	or	a4,t0,a4
	seqz	a5,a5
	lw	t0,64(sp)
	seqz	t2,t2
	neg	t2,t2
	neg	a5,a5
	and	a5,a5,t2
	lla	t2,.LANCHOR118
	sb	t0,0(t2)
	lw	t2,68(sp)
	lla	t0,.LANCHOR120
	sb	t1,0(t0)
	lla	t0,.LANCHOR121
	la a1, .LANCHOR61; lbu a1, 0(a1);
	andi	a0,a0,20
	sw	t2,0(t0)
	lla	t1,.LANCHOR123
	or	a0,a2,a0
	and	a1,a3,a1
	la a2, .LANCHOR54; lbu a2, 0(a2);
	sb	a3,0(t1)
	sb	a4,3(s0)
	lla	a4,.LANCHOR124
	or	a0,s1,a0
	sb	a3,0(a4)
	and	a2,a1,a2
	seqz	a4,ra
	andi	a5,a5,0xff
	andi	s1,a0,0xff
	beq	a2,zero,.L185
	lw	a0,80(sp)
	lbu	a2,1(s0)
	snez	a3,a0
	slli	a3,a3,1
	or	a3,a3,a2
	sb	a3,1(s0)
	la a2, .LANCHOR30; sb zero, 0(a2);
.L185:
	neg	a4,a4
	neg	a1,a1
	and	a3,a1,a4
	or	a4,a5,a3
	andi	a4,a4,2
	sub	a5,ra,a4
	lhu	a3,0(s0)
	snez	a5,a5
	neg	a5,a5
	andi	a5,a5,520
	or	a5,a5,a3
	lla	a3,.LANCHOR29
	sb	a4,0(a3)
	sh	a5,0(s0)
	j	.L184
.L624:
	lla	a2,.LANCHOR115
	lla	a1,.LANCHOR113
	lbu	t1,0(a2)
	lbu	a4,0(a1)
	la a3, .LANCHOR114; lw a3, 0(a3);
	srli	a5,a3,1
	andi	a5,a5,1
	andi	a0,a3,3
	sub	t1,a5,t1
	sub	a4,a0,a4
	snez	a4,a4
	snez	t1,t1
	neg	a4,a4
	neg	t1,t1
	or	a4,a4,t1
	sb	a5,0(a2)
	andi	a4,a4,80
	sb	a0,0(a1)
	la a2, .LANCHOR64; lbu a2, 0(a2);
	la a5, .LANCHOR106; lhu a5, 0(a5);
	or	s1,s1,a4
	beq	a2,zero,.L67
	la a4, .LANCHOR108; lbu a4, 0(a4);
	beq	a4,zero,.L68
	lla	a4,.LANCHOR116
	lw	a5,0(a4)
	andi	a3,a3,-4
	lbu	a2,4(s0)
	sub	a5,a3,a5
	snez	a5,a5
	slli	a5,a5,6
	or	a5,a5,a2
	sw	a3,0(a4)
	sb	a5,4(s0)
	j	.L67
.L641:
	lla	a3,.LANCHOR60
	lbu	a2,1(a3)
	la a1, .LANCHOR71; lbu a1, 0(a1);
	add	a3,a3,a1
	sw	a2,72(sp)
	la a2, .LANCHOR269; lbu a2, 0(a2);
	lbu	t1,0(a3)
	seqz	t0,a2
	li	a3,1
	lla	a2,.LANCHOR270
	sb	a3,0(a2)
	lla	a3,.LANCHOR59
	add	a3,a3,a1
	lla	a0,.LANCHOR31
	lbu	a0,0(a0)
	sb	t0,1(a2)
	sw	t0,88(sp)
	lbu	t0,0(a3)
	lw	a3,72(sp)
	add	a2,a2,a1
	lbu	a1,0(a2)
	sw	a0,64(sp)
	seqz	a0,a3
	neg	a3,a3
	sw	t1,76(sp)
	la a2, .LANCHOR75; lbu a2, 0(a2);
	la t1, .LANCHOR208; lbu t1, 0(t1);
	andi	a3,a3,3
	slli	a0,a0,1
	sw	a1,68(sp)
	or	a0,a0,a3
	neg	a1,a2
	seqz	a3,t1
	sw	a1,80(sp)
	neg	a3,a3
	sw	a3,112(sp)
	lw	a3,80(sp)
	seqz	a2,a2
	sw	a2,84(sp)
	andi	a3,a3,3
	sw	a3,92(sp)
	lw	a3,84(sp)
	lw	a2,64(sp)
	neg	t1,t1
	slli	a3,a3,1
	sw	a3,96(sp)
	lw	a3,68(sp)
	addi	a1,a2,-2
	seqz	a1,a1
	and	a3,a3,t0
	sw	a1,100(sp)
	lw	a1,64(sp)
	sw	a3,104(sp)
	lw	a3,112(sp)
	lw	a2,76(sp)
	addi	t0,a1,-1
	addi	a1,a1,-3
	sw	a1,108(sp)
	and	a1,a0,a3
	sw	a1,112(sp)
	seqz	a2,a2
	lw	a3,72(sp)
	neg	a2,a2
	andi	a2,a2,3
	and	t1,a3,t1
	lw	a3,92(sp)
	sw	a2,92(sp)
	lw	a2,76(sp)
	lw	a1,96(sp)
	seqz	t0,t0
	andi	a2,a2,1
	sw	a2,76(sp)
	lw	a2,108(sp)
	or	a1,a3,a1
	sw	a1,72(sp)
	seqz	a2,a2
	sw	a2,96(sp)
	lw	a2,112(sp)
	lw	a1,100(sp)
	lw	a3,104(sp)
	or	t1,a2,t1
	lw	a2,64(sp)
	neg	a1,a1
	seqz	a3,a3
	seqz	a2,a2
	sw	a2,100(sp)
	lw	a2,72(sp)
	and	a3,a3,t0
	lw	t0,92(sp)
	and	a1,a2,a1
	lw	a2,76(sp)
	la a0, .LANCHOR204; lbu a0, 0(a0);
	neg	a0,a0
	or	t0,t0,a2
	lw	a2,96(sp)
	and	a0,t1,a0
	lw	t1,100(sp)
	neg	a2,a2
	sw	t0,72(sp)
	sw	a2,76(sp)
	neg	t0,t1
	or	a1,a1,a3
	lw	t1,72(sp)
	lw	a3,76(sp)
	lla	a2,.LANCHOR268
	and	a0,a0,t0
	and	t1,t1,a3
	lw	t0,88(sp)
	lbu	a3,0(a2)
	or	a1,a1,t1
	andi	a0,a0,3
	or	a1,a1,a0
	lw	a0,64(sp)
	sub	a3,t0,a3
	andi	a1,a1,0xff
	snez	a3,a3
	slli	a3,a3,7
	sub	a0,a0,a1
	or	a5,a3,a5
	snez	a0,a0
	li	a3,268697600
	neg	a0,a0
	addi	a3,a3,20
	and	a3,a0,a3
	lb	a0,80(sp)
	lw	t1,0(s0)
	ori	a5,a5,32
	sw	a0,64(sp)
	lw	a0,84(sp)
	or	a3,a3,t1
	neg	a0,a0
	sw	a0,72(sp)
	lla	a0,.LANCHOR31
	sb	t0,0(a2)
	sb	a1,0(a0)
	sw	a3,76(sp)
.L233:
	la a2, .LANCHOR1; lbu a2, 0(a2);
	addi	a2,a2,-1
	lla	a3,.LANCHOR272
	seqz	a2,a2
	sb	a2,0(a3)
	la a0, .LANCHOR53; lbu a0, 0(a0);
	lla	a2,.LANCHOR26
	la a1, .LANCHOR27; lbu a1, 0(a1);
	sb	a0,1(a3)
	lbu	a0,0(a2)
	add	a3,a3,a1
	lbu	a3,0(a3)
	seqz	a2,a0
	la t0, .LANCHOR189; lbu t0, 0(t0);
	la a1, .LANCHOR72; lbu a1, 0(a1);
	neg	a2,a2
	neg	t0,t0
	and	t0,t0,a2
	and	a3,a3,a1
	addi	a1,a0,-2
	seqz	a2,a1
	andi	a1,t0,0xff
	sw	a1,80(sp)
	neg	a1,a2
	lw	a2,64(sp)
	lw	t1,68(sp)
	andi	t0,a2,2
	lw	a2,72(sp)
	and	a3,t1,a3
	seqz	a3,a3
	andi	a2,a2,1
	sw	t0,64(sp)
	neg	a3,a3
	mv	t0,a2
	and	a3,a3,a1
	mv	a1,t0
	lw	t0,64(sp)
	addi	t1,a0,-1
	seqz	t1,t1
	or	a1,t0,a1
	lw	t0,80(sp)
	neg	t1,t1
	lla	a2,.LANCHOR271
	or	t1,t0,t1
	lbu	a2,0(a2)
	and	a1,a1,t1
	lw	t1,68(sp)
	andi	a3,a3,2
	or	a1,a3,a1
	sub	a3,t1,a2
	sub	a2,a0,a1
	snez	a2,a2
	li	a0,537657344
	snez	a3,a3
	neg	a2,a2
	and	a2,a2,a0
	neg	a3,a3
	lw	a0,76(sp)
	andi	a3,a3,-64
	or	a3,a5,a3
	lla	a5,.LANCHOR271
	or	a2,a2,a0
	sb	t1,0(a5)
	andi	a5,a3,0xff
	lla	a3,.LANCHOR26
	sb	a1,0(a3)
	sw	a2,0(s0)
	j	.L234
.L651:
	lla	a0,.LANCHOR24
	lbu	a4,0(a0)
	la t1, .LANCHOR25; lbu t1, 0(t1);
	lla	a2,.LANCHOR265
	lbu	a3,0(a2)
	sub	a4,t1,a4
	lw	t0,0(s0)
	snez	a4,a4
	la a1, .LANCHOR145; lbu a1, 0(a1);
	neg	a4,a4
	li	t2,1074790400
	and	a4,a4,t2
	sub	a3,a1,a3
	or	a4,a4,t0
	snez	a3,a3
	slli	a3,a3,3
	srli	t0,a4,24
	sw	a4,0(s0)
	or	a4,a3,t0
	sb	t1,0(a0)
	sb	a1,0(a2)
	sb	a4,3(s0)
	j	.L266
.L630:
	la a4, .LANCHOR157; lw a4, 0(a4);
	srli	a3,a4,24
	lla	a5,.LANCHOR159
	mv	a0,a3
	srli	a1,a4,8
	la a2, .LANCHOR115; lbu a2, 0(a2);
	sb	a1,0(a5)
	sb	a0,1(a5)
	add	a2,a5,a2
	lbu	a2,0(a2)
	la t1, .LANCHOR113; lbu t1, 0(t1);
	la a3, .LANCHOR142; lbu a3, 0(a3);
	sw	a2,76(sp)
	mv	t0,t1
	lla	a2,.LANCHOR158
	srli	a3,a3,2
	sw	a4,0(a2)
	andi	a3,a3,1
	add	a2,a2,t0
	lbu	a2,0(a2)
	addi	a3,a3,-1
	la a1, .LANCHOR141; lbu a1, 0(a1);
	sw	a3,80(sp)
	li	a5,-4096
	li	a3,-4096
	la t1, .LANCHOR106; lhu t1, 0(t1);
	sw	a0,84(sp)
	sw	a1,64(sp)
	addi	a0,a1,-1
	addi	a3,a3,238
	addi	a1,a5,239
	sw	a2,68(sp)
	add	a2,t1,a3
	add	a3,t1,a1
	lhu	a1,80(sp)
	srli	a4,a4,16
	andi	a4,a4,0xff
	sw	a1,72(sp)
	lw	a1,76(sp)
	sh	a4,100(sp)
	seqz	t0,a0
	srli	a1,a1,7
	sw	a1,92(sp)
	lw	a1,84(sp)
	neg	t0,t0
	addi	a5,a5,1024
	slli	a1,a1,8
	sw	a1,96(sp)
	lw	a1,64(sp)
	add	a5,t1,a5
	seqz	a5,a5
	seqz	a4,a1
	sw	a4,84(sp)
	lw	a4,72(sp)
	sw	a5,88(sp)
	lw	a5,100(sp)
	and	t0,a4,t0
	lw	a4,92(sp)
	snez	a0,a0
	neg	a0,a0
	neg	a4,a4
	sw	a4,92(sp)
	lw	a4,96(sp)
	seqz	a2,a2
	seqz	a3,a3
	or	a4,a4,a5
	sw	a4,96(sp)
	sw	a0,100(sp)
	lw	a5,88(sp)
	lw	a4,84(sp)
	neg	a3,a3
	neg	a5,a5
	sw	a5,88(sp)
	lw	a5,68(sp)
	neg	a4,a4
	sw	a4,104(sp)
	srli	a5,a5,7
	sw	a5,84(sp)
	lw	a5,64(sp)
	la a4, .LANCHOR10; lw a4, 0(a4);
	la a0, .LANCHOR8; lw a0, 0(a0);
	snez	a5,a5
	sw	a5,64(sp)
	lw	a5,92(sp)
	neg	a2,a2
	and	a2,a2,a4
	and	a5,t0,a5
	sw	a5,92(sp)
	lw	t0,100(sp)
	lw	a5,96(sp)
	and	a0,a3,a0
	or	a0,a2,a0
	and	t0,a5,t0
	sw	t0,96(sp)
	lw	t0,64(sp)
	addi	a1,t1,-768
	addi	a4,t1,-833
	neg	a5,t0
	lw	t0,84(sp)
	sw	a5,64(sp)
	la a2, .LANCHOR6; lw a2, 0(a2);
	neg	a5,t0
	lw	t0,88(sp)
	seqz	a4,a4
	seqz	a1,a1
	and	a2,t0,a2
	sw	a4,88(sp)
	or	a2,a0,a2
	neg	a1,a1
	la a0, .LANCHOR4; lw a0, 0(a0);
	and	a1,a1,a0
	lw	a0,88(sp)
	sw	a5,84(sp)
	lw	t0,96(sp)
	lw	a5,92(sp)
	neg	a0,a0
	lw	a4,104(sp)
	or	t0,a5,t0
	lw	a5,72(sp)
	sw	a0,72(sp)
	lw	a0,64(sp)
	and	a5,a5,a4
	addi	a3,t1,-834
	and	t0,t0,a0
	lw	a0,84(sp)
	or	a1,a2,a1
	seqz	a3,a3
	and	a5,a5,a0
	lw	a0,80(sp)
	or	t0,t0,a5
	la a2, .LANCHOR156; lw a2, 0(a2);
	and	a0,a0,a4
	lw	a5,84(sp)
	lw	a4,72(sp)
	neg	a3,a3
	and	a3,a3,a2
	addi	t1,t1,-773
	la a2, .LANCHOR150; lw a2, 0(a2);
	and	a0,a0,a5
	and	a4,a4,a2
	lw	a5,76(sp)
	lw	a2,64(sp)
	seqz	t1,t1
	or	a3,a1,a3
	neg	t1,t1
	la a1, .LANCHOR151; lw a1, 0(a1);
	and	a1,t1,a1
	andi	a4,a4,-4
	or	a4,a3,a4
	and	a5,a5,a2
	andi	a1,a1,-4
	la a2, .LANCHOR155; lbu a2, 0(a2);
	or	a1,a4,a1
	seqz	a3,a2
	neg	a2,a2
	and	a2,a1,a2
	slli	t0,t0,16
	la a1, .LANCHOR114; lw a1, 0(a1);
	neg	a3,a3
	or	a5,a0,a5
	and	a3,a3,a1
	srli	t0,t0,16
	or	a3,a2,a3
	slli	t0,t0,8
	lw	a2,68(sp)
	andi	a5,a5,0xff
	la a0, .LANCHOR134; lbu a0, 0(a0);
	or	a5,t0,a5
	lla	a4,.LANCHOR160
	seqz	a1,a0
	slli	a5,a5,8
	lw	t1,0(a4)
	or	a5,a5,a2
	neg	a1,a1
	neg	a0,a0
	and	a2,a5,a0
	and	a5,a1,a3
	or	a3,a2,a5
	sub	a5,a3,t1
	lbu	a2,3(s0)
	snez	a5,a5
	slli	a1,a5,2
	or	a2,a2,a1
	slli	a5,a5,7
	sw	a3,0(a4)
	or	s1,a5,s1
	sb	a2,3(s0)
	j	.L197
.L632:
	la a2, .LANCHOR23; lbu a2, 0(a2);
	addi	a0,a2,-2
	la a5, .LANCHOR188; lbu a5, 0(a5);
	seqz	a2,a2
	la a1, .LANCHOR140; lbu a1, 0(a1);
	seqz	a3,a5
	la t1, .LANCHOR74; lbu t1, 0(t1);
	seqz	a0,a0
	and	a2,a2,a1
	and	a3,a3,t1
	sw	a0,68(sp)
	sw	a2,88(sp)
	beq	a3,zero,.L204
	lla	a1,.LANCHOR22
	lbu	a3,0(a1)
	la a2, .LANCHOR21; lbu a2, 0(a2);
	addi	a2,a2,1
	andi	a2,a2,3
	lbu	a0,5(s0)
	sub	a3,a2,a3
	snez	a3,a3
	slli	a3,a3,5
	or	a3,a3,a0
	sb	a2,0(a1)
	sb	a3,5(s0)
.L204:
	la a2, .LANCHOR191; lw a2, 0(a2);
	andi	t1,a2,0xff
	lla	a0,.LANCHOR203
	lw	s1,0(a0)
	srli	a3,t1,4
	andi	a1,a3,3
	slli	a0,a1,2
	sw	s1,84(sp)
	sw	a0,64(sp)
	lla	s1,.LANCHOR193
	lla	a0,.LANCHOR202
	sw	a1,76(sp)
	lbu	a1,0(s1)
	lbu	s1,0(a0)
	srli	a0,a2,6
	sw	a0,72(sp)
	lw	a0,64(sp)
	andi	a2,a2,-4
	sw	a2,96(sp)
	lla	a2,.LANCHOR195
	add	a2,a2,a0
	lw	a2,0(a2)
	lla	a3,.LANCHOR192
	lw	t0,0(a3)
	la a3, .LANCHOR190; lbu a3, 0(a3);
	or	a3,a5,a3
	sw	a2,80(sp)
	seqz	a3,a3
	lw	a2,72(sp)
	or	a3,a5,a3
	lw	a5,64(sp)
	sw	a3,104(sp)
	lla	a0,.LANCHOR189
	sub	a3,a2,t0
	lla	t0,.LANCHOR197
	lbu	a0,0(a0)
	lw	a2,96(sp)
	add	t0,t0,a5
	lw	a5,84(sp)
	lw	t0,0(t0)
	srli	t1,t1,2
	sw	a0,100(sp)
	sub	a2,a2,a5
	andi	t1,t1,3
	lla	a0,.LANCHOR194
	lla	a5,.LANCHOR196
	lw	a0,0(a0)
	lw	a5,0(a5)
	sw	t0,84(sp)
	sw	t1,92(sp)
	lw	t0,88(sp)
	lw	t1,104(sp)
	sw	a0,108(sp)
	sw	a5,112(sp)
	la a0, .LANCHOR138; lbu a0, 0(a0);
	and	a5,t0,t1
	lw	t0,68(sp)
	lw	t1,76(sp)
	snez	a3,a3
	or	a0,t0,a0
	sub	t0,t1,a1
	lw	a1,64(sp)
	lla	t1,.LANCHOR199
	or	a5,a5,a0
	add	t1,t1,a1
	lbu	a1,3(s0)
	sw	a5,68(sp)
	lw	a5,64(sp)
	sw	a1,104(sp)
	lla	a1,.LANCHOR198
	lw	a1,0(a1)
	lla	a0,.LANCHOR201
	add	a0,a0,a5
	sw	a1,116(sp)
	lw	a1,0(t1)
	lw	t1,92(sp)
	lw	a0,0(a0)
	sw	a1,88(sp)
	sub	a1,t1,s1
	lla	s1,.LANCHOR200
	lw	t1,0(s1)
	lw	s1,68(sp)
	sw	a0,64(sp)
	sw	t1,120(sp)
	snez	t1,a1
	lw	a1,100(sp)
	lw	a0,108(sp)
	snez	a2,a2
	sub	a1,s1,a1
	lw	s1,80(sp)
	snez	a1,a1
	sw	a1,100(sp)
	sub	a0,s1,a0
	lw	a1,84(sp)
	lw	s1,112(sp)
	snez	t0,t0
	slli	a5,a3,2
	slli	a2,a2,6
	or	a2,a2,a5
	slli	a5,t0,2
	sub	a1,a1,s1
	or	s1,a2,a5
	lw	a5,104(sp)
	slli	a3,a3,7
	slli	a2,t1,4
	or	a3,a5,a3
	lw	a5,100(sp)
	sw	a2,112(sp)
	sw	t1,108(sp)
	lw	a2,116(sp)
	slli	t1,a5,5
	lw	a5,88(sp)
	snez	a0,a0
	sw	t0,104(sp)
	sub	a5,a5,a2
	lw	a2,112(sp)
	slli	t0,t0,2
	or	t1,a3,t1
	or	a2,s1,a2
	slli	s1,a0,4
	sw	s1,112(sp)
	lw	s1,4(s0)
	snez	a1,a1
	snez	a5,a5
	or	s1,s1,t0
	lw	t0,64(sp)
	lw	a3,120(sp)
	sb	t1,3(s0)
	lw	t1,108(sp)
	sub	a3,t0,a3
	lw	t0,112(sp)
	slli	a0,a0,2
	or	a0,a0,s1
	or	a2,a2,t0
	slli	t0,a1,4
	or	a2,a2,t0
	slli	t0,a5,4
	or	a2,a2,t0
	snez	a3,a3
	lw	t0,104(sp)
	slli	t1,t1,2
	or	t1,a0,t1
	slli	a0,a3,4
	or	a0,a2,a0
	slli	a1,a1,2
	lw	a2,100(sp)
	or	a1,t1,a1
	slli	a5,a5,2
	slli	t1,t0,31
	lw	t0,0(s0)
	or	a5,a1,a5
	slli	a3,a3,2
	sw	s1,4(s0)
	lw	s1,68(sp)
	or	a5,a5,a3
	slli	a2,a2,2
	lw	a3,72(sp)
	or	a1,t0,t1
	or	a2,a0,a2
	lw	t1,76(sp)
	lla	t0,.LANCHOR189
	or	a2,a4,a2
	sb	s1,0(t0)
	lla	a4,.LANCHOR192
	lw	s1,80(sp)
	sw	a3,0(a4)
	sw	a1,0(s0)
	lla	a4,.LANCHOR193
	lw	a1,84(sp)
	sb	t1,0(a4)
	lla	a3,.LANCHOR194
	lw	t1,92(sp)
	sw	s1,0(a3)
	lla	a3,.LANCHOR196
	sw	a1,0(a3)
	lla	a4,.LANCHOR202
	lw	a1,88(sp)
	lw	t0,64(sp)
	sb	t1,0(a4)
	lw	a4,96(sp)
	lla	a3,.LANCHOR198
	sw	a1,0(a3)
	sb	a5,4(s0)
	lla	a3,.LANCHOR200
	lla	a5,.LANCHOR203
	sw	a4,0(a5)
	sw	t0,0(a3)
	andi	a4,a2,0xff
	j	.L203
.L631:
	la a5, .LANCHOR62; lbu a5, 0(a5);
	sw	a5,124(sp)
	sw	zero,136(sp)
	beq	a5,zero,.L202
	la a5, .LANCHOR169; lbu a5, 0(a5);
	snez	a5,a5
	sw	a5,136(sp)
.L202:
	lla	t1,.LANCHOR173
	li	a1,-1048576
	la a0, .LANCHOR171; lw a0, 0(a0);
	lbu	t0,0(t1)
	addi	a1,a1,-115
	add	a1,a0,a1
	lla	a3,.LANCHOR170
	lla	a5,.LANCHOR172
	lbu	a2,0(a3)
	lbu	a3,0(a5)
	snez	a5,a1
	srli	s1,a0,2
	sw	t0,64(sp)
	neg	a5,a5
	lbu	t0,3(s0)
	sw	a0,76(sp)
	andi	a5,a5,0xff
	andi	a0,s1,31
	seqz	a1,a1
	sw	a5,96(sp)
	addi	a5,a0,-27
	sw	a1,84(sp)
	sw	t0,80(sp)
	seqz	a5,a5
	lla	t0,.LANCHOR175
	lbu	t0,0(t0)
	sw	a5,68(sp)
	lw	a5,84(sp)
	sub	a2,a1,a2
	sw	t0,100(sp)
	lw	a1,76(sp)
	neg	t0,a5
	sw	t0,92(sp)
	lw	t0,96(sp)
	srli	a1,a1,20
	addi	a5,a0,-8
	and	a1,t0,a1
	lla	t0,.LANCHOR176
	lbu	t0,0(t0)
	seqz	a5,a5
	sw	a5,88(sp)
	sw	t0,104(sp)
	lw	t0,92(sp)
	andi	a1,a1,15
	sub	a3,a0,a3
	andi	a5,t0,11
	sw	a5,108(sp)
	lw	t0,64(sp)
	lw	a5,68(sp)
	sw	a0,128(sp)
	addi	a0,a0,-24
	sub	a5,a5,t0
	lw	t0,108(sp)
	sw	a0,72(sp)
	lla	t1,.LANCHOR174
	or	a1,a1,t0
	lla	t0,.LANCHOR178
	sw	a1,64(sp)
	lbu	a1,0(t0)
	lbu	t1,0(t1)
	snez	a2,a2
	sw	a1,116(sp)
	lw	a1,72(sp)
	slli	a2,a2,2
	andi	a0,s1,29
	seqz	a1,a1
	sw	a1,72(sp)
	lw	t0,80(sp)
	andi	a1,s1,7
	lla	s1,.LANCHOR177
	or	a2,a2,t0
	lw	t0,88(sp)
	lbu	s1,0(s1)
	snez	a3,a3
	sub	t1,t0,t1
	addi	a0,a0,-12
	snez	a5,a5
	slli	a3,a3,2
	sw	s1,112(sp)
	or	a3,a2,a3
	seqz	s1,a0
	slli	a2,a5,2
	snez	a0,t1
	lw	a5,100(sp)
	lw	t1,72(sp)
	lw	t0,76(sp)
	sw	s1,80(sp)
	sub	a5,t1,a5
	lla	t1,.LANCHOR179
	lbu	t1,0(t1)
	lw	s1,96(sp)
	addi	a1,a1,-5
	sw	t1,140(sp)
	seqz	t1,a1
	sw	t1,76(sp)
	srli	t0,t0,15
	la t1, .LANCHOR163; lbu t1, 0(t1);
	sw	t1,96(sp)
	and	t0,s1,t0
	lw	t1,92(sp)
	lw	s1,64(sp)
	sw	a0,108(sp)
	andi	a1,t1,10
	slli	a0,s1,2
	lla	t1,.LANCHOR183
	or	a3,a3,a2
	add	a0,t1,a0
	lw	a2,104(sp)
	lw	a0,0(a0)
	sw	a3,100(sp)
	lw	a3,80(sp)
	andi	t0,t0,15
	or	t0,t0,a1
	lla	a1,.LANCHOR180
	sub	a3,a3,a2
	sw	a0,132(sp)
	lbu	a2,0(a1)
	lw	a0,72(sp)
	lw	a1,80(sp)
	sw	a2,144(sp)
	lw	a2,76(sp)
	or	a0,a0,a1
	lw	a1,68(sp)
	sw	a0,92(sp)
	lw	t1,108(sp)
	or	a0,a1,a2
	lw	a1,96(sp)
	slli	t1,t1,2
	snez	a5,a5
	sub	a1,s1,a1
	lw	s1,100(sp)
	slli	a5,a5,2
	seqz	a1,a1
	or	t1,s1,t1
	lw	s1,116(sp)
	or	t1,t1,a5
	sw	t1,116(sp)
	sub	a2,a2,s1
	lla	s1,.LANCHOR181
	sw	a2,104(sp)
	lbu	a2,0(s1)
	la s1, .LANCHOR111; lbu s1, 0(s1);
	sw	s1,100(sp)
	lw	t1,100(sp)
	lw	a5,104(sp)
	xori	s1,a0,1
	sw	a2,148(sp)
	lw	a0,92(sp)
	lw	a2,112(sp)
	sw	s1,120(sp)
	and	t1,t1,a1
	lla	s1,.LANCHOR182
	lw	a1,140(sp)
	sub	a0,a0,a2
	sw	t1,104(sp)
	snez	a2,a5
	lw	t1,120(sp)
	lw	a5,0(s1)
	snez	a0,a0
	sub	a1,a1,t1
	sw	a5,152(sp)
	lla	t1,.LANCHOR183
	slli	a5,t0,2
	add	t1,t1,a5
	lw	a5,116(sp)
	snez	a3,a3
	slli	a3,a3,2
	sw	a0,112(sp)
	lla	a0,.LANCHOR184
	or	a5,a5,a3
	lbu	a3,0(a0)
	snez	a1,a1
	sw	a1,116(sp)
	sw	a3,140(sp)
	lla	a3,.LANCHOR185
	lw	a3,0(a3)
	lw	a1,84(sp)
	slli	a2,a2,2
	sw	a3,156(sp)
	lla	a3,.LANCHOR170
	sb	a1,0(a3)
	lw	a3,128(sp)
	lla	a1,.LANCHOR172
	sb	a3,0(a1)
	lw	a1,68(sp)
	lla	a3,.LANCHOR173
	sb	a1,0(a3)
	lw	a3,88(sp)
	lla	a1,.LANCHOR174
	sb	a3,0(a1)
	lw	a3,72(sp)
	lla	a1,.LANCHOR175
	sb	a3,0(a1)
	lw	a1,80(sp)
	lla	a3,.LANCHOR176
	sb	a1,0(a3)
	lw	a1,92(sp)
	lla	a3,.LANCHOR177
	sb	a1,0(a3)
	lw	a3,76(sp)
	lla	a1,.LANCHOR178
	sb	a3,0(a1)
	lw	a1,120(sp)
	lla	a3,.LANCHOR179
	sb	a1,0(a3)
	lw	a1,144(sp)
	lla	a3,.LANCHOR180
	sb	t0,0(a3)
	sub	a3,t0,a1
	lw	a1,64(sp)
	sw	a3,68(sp)
	lla	a3,.LANCHOR181
	sb	a1,0(a3)
	lw	a3,132(sp)
	or	a1,a5,a2
	lw	a2,68(sp)
	sw	a3,0(s1)
	lw	s1,104(sp)
	snez	a2,a2
	sw	a2,68(sp)
	sb	s1,0(a0)
	lw	a0,112(sp)
	lw	a2,64(sp)
	lw	s1,0(t1)
	slli	a5,a0,2
	lw	a0,148(sp)
	or	a1,a1,a5
	lw	a5,116(sp)
	sub	a2,a2,a0
	lla	a0,.LANCHOR186
	lbu	t1,0(a0)
	slli	a5,a5,2
	snez	a2,a2
	lw	a0,96(sp)
	sw	t1,76(sp)
	or	a1,a1,a5
	mv	t1,a2
	lw	a5,68(sp)
	lw	a2,152(sp)
	sub	t0,t0,a0
	slli	a0,a5,2
	sub	a5,a3,a2
	lw	a2,108(sp)
	sw	t1,72(sp)
	lw	a3,100(sp)
	seqz	t0,t0
	slli	a2,a2,5
	and	t0,a3,t0
	or	a2,a2,a4
	lw	a3,140(sp)
	lw	a4,104(sp)
	or	a1,a1,a0
	sw	t0,64(sp)
	sub	a4,a4,a3
	lw	a3,112(sp)
	slli	t1,t1,2
	or	t1,a1,t1
	slli	t0,a3,5
	lw	a1,64(sp)
	lw	a3,76(sp)
	or	a2,a2,t0
	lw	a0,156(sp)
	lw	t0,116(sp)
	sub	a1,a1,a3
	lw	a3,68(sp)
	snez	a5,a5
	sub	a0,s1,a0
	slli	t0,t0,5
	or	t0,a2,t0
	slli	a5,a5,2
	snez	a0,a0
	slli	a3,a3,5
	or	a3,t0,a3
	snez	a4,a4
	lw	t0,72(sp)
	slli	a0,a0,2
	or	a5,t1,a5
	slli	a2,a4,2
	snez	a1,a1
	or	a5,a5,a0
	or	a5,a5,a2
	slli	a2,a1,2
	slli	a0,t0,5
	or	a5,a5,a2
	lw	t0,64(sp)
	or	a0,a3,a0
	sb	a5,3(s0)
	lla	a3,.LANCHOR185
	lw	a5,124(sp)
	sw	s1,0(a3)
	slli	a4,a4,5
	lla	a3,.LANCHOR186
	or	a4,a0,a4
	slli	a1,a1,5
	sb	t0,0(a3)
	or	a4,a4,a1
	beq	a5,zero,.L201
	lw	a5,136(sp)
	beq	a5,zero,.L201
	la a5, .LANCHOR169; lbu a5, 0(a5);
	slli	a5,a5,2
	lla	t1,.LANCHOR183
	add	a5,t1,a5
	la a3, .LANCHOR187; lw a3, 0(a3);
	sw	a3,0(a5)
	li	a5,1
	sb	a5,2(s0)
	j	.L201
.L629:
	la a4, .LANCHOR141; lbu a4, 0(a4);
	la a1, .LANCHOR107; lw a1, 0(a1);
	andi	a2,a1,0xff
	addi	a3,a4,-1
	addi	a5,a4,-2
	sw	a2,64(sp)
	seqz	a3,a3
	seqz	a2,a4
	seqz	a5,a5
	la t2, .LANCHOR120; lbu t2, 0(t2);
	sw	a2,68(sp)
	sw	a3,72(sp)
	sw	a5,76(sp)
	beq	t2,zero,.L195
	lla	a0,.LANCHOR122
	lla	a5,.LANCHOR143
	lw	a2,0(a0)
	lbu	a5,0(a5)
	lla	t1,.LANCHOR148
	lbu	a3,0(t1)
	lbu	t0,1(s0)
	la t1, .LANCHOR114; lw t1, 0(t1);
	sub	a5,a4,a5
	sub	a2,t1,a2
	snez	a2,a2
	snez	a5,a5
	sw	t0,64(sp)
	slli	a2,a2,1
	slli	a5,a5,4
	la t0, .LANCHOR146; lbu t0, 0(t0);
	or	a5,a2,a5
	lw	a2,64(sp)
	sub	a3,t0,a3
	snez	a3,a3
	slli	a3,a3,4
	or	a5,a2,a5
	or	a5,a5,a3
	lla	a3,.LANCHOR143
	sb	a4,0(a3)
	lla	a4,.LANCHOR148
	sw	t1,0(a0)
	sb	t0,0(a4)
	sb	a5,1(s0)
.L195:
	la a3, .LANCHOR129; lbu a3, 0(a3);
	seqz	a5,a3
	la a2, .LANCHOR150; lw a2, 0(a2);
	neg	a3,a3
	neg	a5,a5
	and	a3,a3,a2
	la a4, .LANCHOR125; lbu a4, 0(a4);
	and	a5,a5,a1
	seqz	a2,a4
	or	a5,a3,a5
	lla	a3,.LANCHOR149
	lw	a0,0(a3)
	neg	a2,a2
	la a3, .LANCHOR151; lw a3, 0(a3);
	neg	a4,a4
	and	a4,a4,a3
	and	a5,a5,a2
	or	a5,a5,a4
	andi	a5,a5,-4
	slli	a3,a1,16
	sub	a2,a5,a0
	srli	a3,a3,16
	slli	a0,a1,16
	sw	a5,64(sp)
	slli	a4,a1,8
	andi	a5,a1,0xff
	or	a0,a0,a3
	lw	a3,72(sp)
	or	a4,a4,a5
	slli	a5,a4,16
	srli	a5,a5,16
	neg	a3,a3
	sw	a5,80(sp)
	mv	a5,a3
	lw	a3,76(sp)
	lbu	t1,2(s0)
	snez	a2,a2
	slli	t0,a2,4
	neg	a3,a3
	or	t0,t1,t0
	and	a3,a3,a1
	lw	t1,80(sp)
	lw	a1,68(sp)
	and	a0,a0,a5
	slli	a4,a4,16
	lw	a5,64(sp)
	neg	a1,a1
	or	a4,a4,t1
	and	a4,a4,a1
	lla	a1,.LANCHOR149
	slli	a2,a2,7
	or	a3,a0,a3
	sw	a5,0(a1)
	sb	t0,2(s0)
	or	s1,a2,s1
	or	a3,a3,a4
	beq	t2,zero,.L196
	lla	a4,.LANCHOR152
	lw	a5,0(a4)
	lbu	a2,4(s0)
	sw	a3,0(a4)
	sub	a5,a3,a5
	snez	a5,a5
	slli	a5,a5,5
	or	a5,a5,a2
	sb	a5,4(s0)
.L196:
	seqz	a4,t2
	neg	a5,t2
	neg	a4,a4
	la a2, .LANCHOR154; lw a2, 0(a2);
	and	a4,a4,a2
	and	a5,a5,a3
	lla	t2,.LANCHOR153
	or	a5,a4,a5
	sw	a5,0(t2)
	j	.L194
.L628:
	lla	a0,.LANCHOR140
	lbu	a5,0(a0)
	la a3, .LANCHOR128; lbu a3, 0(a3);
	seqz	a2,a3
	la a4, .LANCHOR20; lbu a4, 0(a4);
	and	a2,a2,a4
	sub	a5,a2,a5
	lw	t1,0(s0)
	la a1, .LANCHOR23; lbu a1, 0(a1);
	snez	a5,a5
	addi	t0,a1,-1
	neg	a5,a5
	li	t2,1073872896
	seqz	t0,t0
	and	a5,a5,t2
	slli	t0,t0,1
	or	a5,a5,t1
	seqz	a4,a1
	li	t1,134479872
	or	a4,a4,t0
	addi	t1,t1,513
	lla	t0,.LANCHOR42
	sw	t1,0(t0)
	li	t1,4096
	seqz	a4,a4
	addi	t1,t1,-1021
	lla	t0,.LANCHOR43
	sh	t1,0(t0)
	sb	a2,0(a0)
	sw	a5,0(s0)
	and	a3,a3,a4
	beq	a3,zero,.L191
	lla	a3,.LANCHOR25
	lbu	a4,0(a3)
	lbu	a2,5(s0)
	addi	a4,a4,-1
	snez	a4,a4
	slli	a4,a4,6
	or	a4,a4,a2
	li	a2,1
	sb	a2,0(a3)
	sb	a4,5(s0)
.L192:
	lla	a3,.LANCHOR141
	lbu	a3,0(a3)
	la a1, .LANCHOR120; lbu a1, 0(a1);
	la a2, .LANCHOR142; lbu a2, 0(a2);
	andi	a2,a2,3
	lla	t0,.LANCHOR144
	seqz	a4,a1
	lbu	a0,0(t0)
	neg	t2,a1
	neg	ra,a4
	sub	a3,a2,a3
	la a1, .LANCHOR143; lbu a1, 0(a1);
	and	a4,t2,a2
	snez	a3,a3
	and	a1,ra,a1
	or	a1,a1,a4
	slli	a4,a3,2
	sw	a1,64(sp)
	sub	a0,a1,a0
	srli	t1,a5,16
	mv	a1,a4
	or	t1,a1,t1
	lla	a1,.LANCHOR141
	sb	a2,0(a1)
	snez	a0,a0
	lw	a1,64(sp)
	addi	a4,a2,-2
	slli	a0,a0,3
	srli	a5,a5,24
	or	a5,a0,a5
	seqz	a4,a4
	neg	a3,a3
	addi	a0,a2,-1
	neg	a4,a4
	sb	t1,2(s0)
	sb	a1,0(t0)
	sb	a5,3(s0)
	la t0, .LANCHOR123; lbu t0, 0(t0);
	andi	t1,a3,96
	seqz	a2,a2
	seqz	a0,a0
	andi	a5,a4,15
	andi	t2,t2,0xff
	andi	a3,ra,0xff
	beq	t0,zero,.L193
	lla	a4,.LANCHOR145
	lbu	ra,0(a4)
	lbu	t0,5(s0)
	sb	a1,0(a4)
	sub	a4,a1,ra
	snez	a4,a4
	slli	a4,a4,6
	or	a4,a4,t0
	sb	a4,5(s0)
.L193:
	la a4, .LANCHOR115; lbu a4, 0(a4);
	lla	a1,.LANCHOR43
	add	a1,a1,a4
	lbu	ra,0(a1)
	la a4, .LANCHOR113; lbu a4, 0(a4);
	lla	a1,.LANCHOR42
	add	a4,a1,a4
	lbu	a1,0(a4)
	lla	t0,.LANCHOR146
	neg	a0,a0
	lbu	a4,0(t0)
	and	a0,ra,a0
	neg	a2,a2
	and	a1,a1,a2
	or	a5,a5,a0
	or	a5,a5,a1
	sub	a4,a5,a4
	snez	a4,a4
	la a2, .LANCHOR148; lbu a2, 0(a2);
	slli	a4,a4,5
	and	a3,a3,a2
	and	t2,t2,a5
	or	t1,t1,a4
	lla	ra,.LANCHOR147
	or	a4,a3,t2
	sb	a5,0(t0)
	or	s1,s1,t1
	sb	a4,0(ra)
	j	.L190
.L627:
	lla	a5,.LANCHOR17
	lbu	t0,0(a5)
	la a3, .LANCHOR130; lbu a3, 0(a3);
	la t1, .LANCHOR126; lbu t1, 0(t1);
	la a5, .LANCHOR127; lbu a5, 0(a5);
	la a0, .LANCHOR129; lbu a0, 0(a0);
	or	a5,t1,a5
	lla	a2,.LANCHOR128
	lla	a1,.LANCHOR125
	or	a0,a0,a3
	lbu	a4,0(a2)
	lbu	a3,0(a1)
	or	a0,a5,a0
	and	a0,t0,a0
	lla	t2,.LANCHOR18
	lbu	ra,0(t2)
	sw	a0,84(sp)
	lbu	t2,2(s0)
	sub	a4,a0,a4
	sub	a3,a5,a3
	sb	a5,0(a1)
	lw	a1,84(sp)
	snez	a4,a4
	snez	a3,a3
	neg	a4,a4
	sw	t0,64(sp)
	sw	t2,68(sp)
	slli	a3,a3,5
	andi	a0,a4,80
	sb	a1,0(a2)
	sw	a3,100(sp)
	lw	a2,64(sp)
	andi	a3,a4,-112
	lw	a4,68(sp)
	seqz	t0,ra
	and	a5,a5,a2
	or	a4,a4,a0
	and	a2,ra,t0
	la t2, .LANCHOR1; lbu t2, 0(t2);
	sw	a2,92(sp)
	sw	a3,104(sp)
	sw	a4,108(sp)
	seqz	t2,t2
	beq	a5,zero,.L188
	lla	a2,.LANCHOR132
	lw	a3,0(a2)
	lla	a0,.LANCHOR131
	lw	t0,0(a0)
	seqz	a4,t1
	neg	a5,t1
	la a1, .LANCHOR107; lw a1, 0(a1);
	andi	a5,a5,11
	slli	a4,a4,1
	or	a4,a4,a5
	lbu	t1,4(s0)
	sub	a5,a1,a3
	snez	a5,a5
	sub	a3,a4,t0
	slli	a5,a5,7
	snez	a3,a3
	or	a5,t1,a5
	slli	a3,a3,7
	or	a5,a5,a3
	sw	a4,0(a0)
	sw	a1,0(a2)
	sb	a5,4(s0)
.L189:
	lw	t0,64(sp)
	la a5, .LANCHOR134; lbu a5, 0(a5);
	la a4, .LANCHOR66; lb a4, 0(a4);
	la a3, .LANCHOR119; lbu a3, 0(a3);
	seqz	a2,a5
	and	t1,t0,a5
	or	a2,a4,a2
	la a5, .LANCHOR120; lbu a5, 0(a5);
	seqz	a0,a3
	la a1, .LANCHOR118; lbu a1, 0(a1);
	and	a3,a3,a5
	sw	t1,68(sp)
	and	a0,a0,a2
	seqz	t1,t1
	or	a4,a4,t1
	or	a0,a0,a3
	seqz	a3,a1
	and	a3,a3,a4
	and	a5,a5,a1
	or	a5,a3,a5
	mv	t1,a5
	lla	a1,.LANCHOR139
	lla	a5,.LANCHOR135
	lbu	a4,0(a5)
	lbu	a5,0(a1)
	la a1, .LANCHOR15; lbu a1, 0(a1);
	and	a1,t1,a1
	sw	t1,88(sp)
	lw	t1,68(sp)
	sw	a1,76(sp)
	lw	a1,64(sp)
	and	a0,t0,a0
	and	t2,t1,t2
	sw	t2,80(sp)
	seqz	a3,a0
	lla	t2,.LANCHOR136
	and	a3,a1,a3
	lbu	a1,0(t2)
	lla	a2,.LANCHOR133
	lbu	a2,0(a2)
	sw	a0,72(sp)
	sw	a1,112(sp)
	lla	a1,.LANCHOR137
	lw	t2,72(sp)
	lbu	a0,0(a1)
	lw	a1,92(sp)
	sub	a2,t1,a2
	lw	t1,80(sp)
	or	a1,t2,a1
	sw	a1,92(sp)
	xori	a1,t1,1
	sw	a1,96(sp)
	lw	a1,76(sp)
	sub	a4,t2,a4
	lw	t2,96(sp)
	or	a3,a1,a3
	lw	a1,84(sp)
	sub	a5,a5,t2
	lhu	t2,0(s0)
	seqz	a1,a1
	and	a3,a1,a3
	lw	a1,92(sp)
	lla	t0,.LANCHOR138
	lbu	t0,0(t0)
	sw	a3,84(sp)
	sw	t2,116(sp)
	sub	ra,ra,a1
	lw	a3,64(sp)
	lw	a1,84(sp)
	snez	a4,a4
	neg	a4,a4
	sw	a4,64(sp)
	sub	t0,t1,t0
	lw	a4,76(sp)
	snez	a2,a2
	sub	a3,a3,a1
	snez	t0,t0
	lbu	a1,3(s0)
	neg	t1,a2
	slli	t0,t0,1
	slli	a2,a2,3
	or	a2,t0,a2
	sub	a0,a4,a0
	lw	t0,88(sp)
	lw	a4,112(sp)
	sw	a1,120(sp)
	lw	a1,100(sp)
	li	t2,4096
	sub	t0,t0,a4
	andi	t1,t1,-128
	lw	a4,104(sp)
	snez	ra,ra
	or	t1,a1,t1
	neg	ra,ra
	addi	a1,t2,-2040
	and	a1,ra,a1
	lw	ra,116(sp)
	or	t1,a4,t1
	lw	a4,64(sp)
	or	a1,a1,ra
	snez	a5,a5
	lw	ra,108(sp)
	snez	a3,a3
	neg	a3,a3
	slli	a5,a5,2
	andi	a4,a4,-128
	addi	t2,t2,-1400
	and	t2,a3,t2
	or	a5,a2,a5
	or	a4,t1,a4
	snez	t0,t0
	lw	t1,68(sp)
	or	a5,ra,a5
	slli	t0,t0,6
	or	a1,a1,t2
	lw	t2,72(sp)
	or	a4,s1,a4
	or	a5,a5,t0
	lla	a3,.LANCHOR133
	lw	t0,88(sp)
	sb	t1,0(a3)
	andi	s1,a4,0xff
	lla	a3,.LANCHOR135
	lw	a4,76(sp)
	sb	t2,0(a3)
	lw	ra,120(sp)
	lla	a3,.LANCHOR136
	lw	a2,92(sp)
	sb	t0,0(a3)
	lw	t1,80(sp)
	lla	a3,.LANCHOR137
	snez	a0,a0
	sb	a4,0(a3)
	lw	t2,96(sp)
	lw	a3,84(sp)
	slli	a0,a0,1
	or	a0,a0,ra
	lla	a4,.LANCHOR138
	lla	ra,.LANCHOR18
	sb	t1,0(a4)
	sb	a2,0(ra)
	lla	a4,.LANCHOR139
	lla	a2,.LANCHOR17
	sb	a0,3(s0)
	sb	a3,0(a2)
	sh	a1,0(s0)
	sb	t2,0(a4)
	sb	a5,2(s0)
	j	.L187
.L626:
	lla	a5,.LANCHOR3
	lbu	a5,0(a5)
	la a2, .LANCHOR57; lbu a2, 0(a2);
	la t0, .LANCHOR118; lbu t0, 0(t0);
	seqz	a0,a5
	sw	a2,64(sp)
	neg	t0,t0
	neg	a0,a0
	la a1, .LANCHOR123; lbu a1, 0(a1);
	and	a0,t0,a0
	lw	t0,64(sp)
	addi	a3,a5,-1
	sw	a5,68(sp)
	addi	ra,a5,-2
	neg	a5,a1
	sw	a5,76(sp)
	neg	a2,a2
	la a4, .LANCHOR38; lbu a4, 0(a4);
	sw	a2,80(sp)
	seqz	t0,t0
	lbu	a2,76(sp)
	seqz	t1,a4
	sw	t0,64(sp)
	la t2, .LANCHOR58; lbu t2, 0(t2);
	lw	t0,80(sp)
	seqz	t2,t2
	seqz	a3,a3
	neg	t1,t1
	and	t1,a2,t1
	sw	a1,72(sp)
	seqz	ra,ra
	neg	t2,t2
	neg	a3,a3
	or	a3,a0,a3
	sw	t2,76(sp)
	lw	a0,64(sp)
	andi	t2,t0,2
	neg	t0,ra
	mv	ra,t1
	lw	t1,72(sp)
	addi	a1,a4,-1
	la a5, .LANCHOR51; lbu a5, 0(a5);
	addi	a4,a4,-2
	seqz	a1,a1
	seqz	a5,a5
	seqz	a4,a4
	andi	a2,a2,2
	neg	a4,a4
	or	t2,a0,t2
	neg	a1,a1
	lw	a0,76(sp)
	seqz	t1,t1
	neg	a5,a5
	or	a1,ra,a1
	or	t1,t1,a2
	and	a5,a5,a4
	and	t2,a3,t2
	andi	a5,a5,2
	and	a3,a1,t1
	or	a3,a3,a5
	and	t0,a0,t0
	lw	a5,68(sp)
	lla	a0,.LANCHOR39
	andi	t0,t0,2
	lbu	a0,0(a0)
	or	a4,t2,t0
	sub	a5,a5,a4
	lhu	a2,0(s0)
	snez	a5,a5
	lbu	a1,6(s0)
	sub	a0,a3,a0
	neg	a5,a5
	snez	a0,a0
	andi	a5,a5,1544
	or	a5,a5,a2
	slli	a0,a0,3
	lla	a2,.LANCHOR39
	or	a1,a0,a1
	sb	a3,0(a2)
	lla	a3,.LANCHOR3
	sb	a1,6(s0)
	sb	a4,0(a3)
	sh	a5,0(s0)
	j	.L186
.L636:
	la t1, .LANCHOR228; lbu t1, 0(t1);
	la a2, .LANCHOR181; lbu a2, 0(a2);
	la a1, .LANCHOR180; lbu a1, 0(a1);
	la a3, .LANCHOR66; lbu a3, 0(a3);
	la t0, .LANCHOR229; lbu t0, 0(t0);
	sub	a2,a2,t1
	la a0, .LANCHOR15; lbu a0, 0(a0);
	sub	a1,a1,t1
	seqz	a3,a3
	sw	a3,76(sp)
	and	a0,a0,t0
	seqz	a2,a2
	seqz	a1,a1
	and	a1,a0,a1
	and	a0,a2,a0
	lw	a2,76(sp)
	la t1, .LANCHOR225; lbu t1, 0(t1);
	la t0, .LANCHOR226; lbu t0, 0(t0);
	la a3, .LANCHOR134; lbu a3, 0(a3);
	sw	a1,68(sp)
	sw	a0,72(sp)
	and	a1,a2,a3
	la a0, .LANCHOR227; lbu a0, 0(a0);
	or	a3,t1,t0
	la a2, .LANCHOR186; lbu a2, 0(a2);
	la t1, .LANCHOR184; lbu t1, 0(t1);
	or	a3,a3,a0
	and	t1,a1,t1
	lw	a0,72(sp)
	and	a1,a1,a2
	lw	a2,68(sp)
	xori	a0,a0,1
	and	t1,t1,a0
	xori	t0,a2,1
	and	a1,a1,t0
	lw	a0,72(sp)
	lw	t0,68(sp)
	la a2, .LANCHOR177; lbu a2, 0(a2);
	and	a0,a0,a3
	and	a3,t0,a3
	sw	a3,92(sp)
	lla	a3,.LANCHOR231
	lbu	a3,0(a3)
	sw	a2,88(sp)
	lla	t0,.LANCHOR230
	sw	a3,80(sp)
	lla	a3,.LANCHOR232
	lw	a3,0(a3)
	la a2, .LANCHOR174; lbu a2, 0(a2);
	lbu	t0,0(t0)
	sw	a3,84(sp)
	la a3, .LANCHOR179; lbu a3, 0(a3);
	sw	a3,76(sp)
	lw	a3,88(sp)
	or	a0,t1,a0
	lla	t1,.LANCHOR235
	or	a2,a3,a2
	lw	a3,92(sp)
	xori	a0,a0,1
	seqz	a2,a2
	or	a3,a1,a3
	lbu	a1,0(t1)
	lw	t1,76(sp)
	or	a2,a2,a0
	xori	a3,a3,1
	seqz	t1,t1
	sw	t1,76(sp)
	lw	a0,76(sp)
	sw	a1,88(sp)
	la t1, .LANCHOR233; lw t1, 0(t1);
	or	a3,a0,a3
	and	a0,a2,a3
	lw	a3,68(sp)
	lw	a2,72(sp)
	la a1, .LANCHOR234; lw a1, 0(a1);
	sub	t0,a3,t0
	lw	a3,80(sp)
	xor	t1,t1,a1
	lw	a1,84(sp)
	sub	a2,a2,a3
	lw	a3,88(sp)
	sub	a1,t1,a1
	snez	t0,t0
	snez	a1,a1
	snez	a2,a2
	sub	a3,a0,a3
	neg	a1,a1
	or	a2,a2,t0
	snez	a3,a3
	andi	t0,a1,-128
	slli	a2,a2,2
	slli	a3,a3,6
	or	a3,a3,t0
	or	a2,a5,a2
	andi	a1,a1,3
	lw	t0,68(sp)
	or	a5,a2,a1
	lw	a2,72(sp)
	lla	a1,.LANCHOR230
	sb	t0,0(a1)
	lla	a1,.LANCHOR231
	sb	a2,0(a1)
	lla	a2,.LANCHOR232
	sw	t1,0(a2)
	lw	a2,64(sp)
	or	a4,a4,a3
	lla	t1,.LANCHOR235
	or	a3,a2,a3
	sb	a5,3(s0)
	sb	a0,0(t1)
	sw	a3,64(sp)
	andi	a4,a4,0xff
	j	.L212
.L635:
	lla	a5,.LANCHOR20
	lbu	t1,0(a5)
	la a5, .LANCHOR190; lbu a5, 0(a5);
	neg	a2,a5
	la a1, .LANCHOR216; lbu a1, 0(a1);
	la a0, .LANCHOR24; lbu a0, 0(a0);
	sw	a2,84(sp)
	and	a1,t1,a1
	seqz	a0,a0
	seqz	a3,a5
	sw	t1,76(sp)
	and	t1,a0,a1
	lw	a0,84(sp)
	lla	a1,.LANCHOR0
	lw	a1,0(a1)
	neg	a3,a3
	mv	t0,a3
	la a2, .LANCHOR202; lbu a2, 0(a2);
	la a5, .LANCHOR21; lbu a5, 0(a5);
	and	a5,t0,a5
	and	a2,a0,a2
	sw	a1,72(sp)
	or	a2,a2,a5
	la a1, .LANCHOR194; lw a1, 0(a1);
	lla	a5,.LANCHOR220
	sw	a1,0(a5)
	la a3, .LANCHOR23; lbu a3, 0(a3);
	la a1, .LANCHOR196; lw a1, 0(a1);
	sw	a1,4(a5)
	seqz	a3,a3
	la a1, .LANCHOR198; lw a1, 0(a1);
	sw	t1,68(sp)
	sw	a1,8(a5)
	or	a3,t1,a3
	la a1, .LANCHOR200; lw a1, 0(a1);
	la t1, .LANCHOR128; lbu t1, 0(t1);
	slli	a2,a2,2
	sw	t1,92(sp)
	sw	a1,12(a5)
	lw	t1,68(sp)
	lw	a1,72(sp)
	add	a5,a5,a2
	la a0, .LANCHOR217; lbu a0, 0(a0);
	lw	a5,0(a5)
	and	a3,a0,a3
	sw	t0,100(sp)
	la t0, .LANCHOR52; lbu t0, 0(t0);
	addi	a2,a1,4
	sw	a0,88(sp)
	sw	t0,80(sp)
	and	a0,t0,t1
	neg	t1,a3
	lw	t0,92(sp)
	and	t1,t1,a2
	sw	a5,104(sp)
	lw	a2,72(sp)
	addi	a3,a3,-1
	xori	a5,a0,1
	and	a3,a3,a2
	lla	a2,.LANCHOR221
	lbu	a0,0(a2)
	lla	a2,.LANCHOR224
	lbu	a2,0(a2)
	seqz	a1,t0
	or	t1,t1,a3
	sw	a2,96(sp)
	lw	a2,76(sp)
	neg	a3,a1
	and	a3,t1,a3
	and	a5,a2,a5
	neg	a2,t0
	lla	t0,.LANCHOR222
	lw	t0,0(t0)
	la t1, .LANCHOR149; lw t1, 0(t1);
	and	a2,a2,t1
	sw	t0,92(sp)
	lw	t0,88(sp)
	or	a3,a3,a2
	andi	a3,a3,-4
	or	a5,t0,a5
	lw	t0,80(sp)
	lw	a2,96(sp)
	seqz	t0,t0
	sw	t0,80(sp)
	lw	t1,80(sp)
	and	t0,a1,a5
	lw	a5,68(sp)
	lw	a1,100(sp)
	or	t1,a5,t1
	la a5, .LANCHOR223; lw a5, 0(a5);
	sw	t1,80(sp)
	and	a5,a1,a5
	lw	t1,84(sp)
	lw	a1,104(sp)
	sw	a3,84(sp)
	lw	a3,80(sp)
	and	a1,t1,a1
	or	t1,a5,a1
	mv	a1,t1
	lw	a5,76(sp)
	lw	t1,68(sp)
	sw	a1,76(sp)
	sub	a2,a3,a2
	mv	a3,a1
	lw	a1,92(sp)
	sub	a0,t1,a0
	lw	t1,84(sp)
	sub	a3,a3,a1
	lw	a1,72(sp)
	sub	a5,a5,t0
	snez	a5,a5
	snez	a0,a0
	snez	a2,a2
	sub	a1,a1,t1
	neg	a0,a0
	li	t1,1576960
	neg	a5,a5
	neg	a2,a2
	snez	a3,a3
	or	a2,a0,a2
	and	a5,a5,t1
	neg	a3,a3
	lw	t1,0(s0)
	or	a3,a2,a3
	snez	a1,a1
	li	a2,1048576
	neg	a1,a1
	addi	a2,a2,8
	or	a5,a5,t1
	and	a2,a1,a2
	lw	t1,68(sp)
	or	a2,a2,a5
	lla	a5,.LANCHOR20
	sb	t0,0(a5)
	lw	t0,76(sp)
	lla	a0,.LANCHOR221
	sb	t1,0(a0)
	lla	a0,.LANCHOR222
	sw	t0,0(a0)
	lw	a0,80(sp)
	lla	a5,.LANCHOR224
	lw	t1,84(sp)
	sb	a0,0(a5)
	lw	a5,64(sp)
	andi	a3,a3,64
	lla	a1,.LANCHOR0
	or	a5,a5,a3
	sw	a5,64(sp)
	or	a4,a4,a3
	sw	t1,0(a1)
	sw	a2,0(s0)
	j	.L211
.L634:
	la a5, .LANCHOR23; lbu a5, 0(a5);
	addi	a0,a5,-1
	seqz	a0,a0
	la t1, .LANCHOR190; lbu t1, 0(t1);
	lla	t0,.LANCHOR216
	or	t1,a0,t1
	lbu	a0,0(t0)
	la a1, .LANCHOR20; lbu a1, 0(a1);
	la a2, .LANCHOR52; lbu a2, 0(a2);
	sw	a0,64(sp)
	lla	a0,.LANCHOR217
	lbu	a0,0(a0)
	la a3, .LANCHOR26; lbu a3, 0(a3);
	and	a2,a1,a2
	or	a5,a5,a1
	addi	a3,a3,-2
	sw	t1,68(sp)
	sw	a0,76(sp)
	and	a2,t1,a2
	snez	a3,a3
	la a0, .LANCHOR75; lbu a0, 0(a0);
	seqz	a5,a5
	or	a2,a5,a2
	and	a0,a3,a0
	lw	a5,68(sp)
	lw	a3,64(sp)
	lla	t0,.LANCHOR215
	la a1, .LANCHOR205; lbu a1, 0(a1);
	sub	a5,a5,a3
	lw	a3,76(sp)
	la t1, .LANCHOR215; sh zero, 0(t1);
	add	a1,t0,a1
	sub	a3,a2,a3
	sb	a0,0(a1)
	lbu	t1,3(s0)
	la a1, .LANCHOR1; lbu a1, 0(a1);
	snez	a5,a5
	snez	a3,a3
	sw	a1,64(sp)
	neg	a3,a3
	neg	a5,a5
	or	a5,a5,a3
	lw	a3,64(sp)
	lbu	t0,0(t0)
	ori	t1,t1,64
	sb	t1,3(s0)
	lw	t1,68(sp)
	la a1, .LANCHOR133; lbu a1, 0(a1);
	addi	a3,a3,-1
	sw	a2,72(sp)
	sw	a3,76(sp)
	and	a1,t0,a1
	lw	a3,64(sp)
	lla	t0,.LANCHOR216
	sb	t1,0(t0)
	la a2, .LANCHOR73; lbu a2, 0(a2);
	lw	t1,72(sp)
	neg	a0,a2
	lla	t0,.LANCHOR217
	seqz	a2,a2
	andi	a0,a0,2
	seqz	a3,a3
	or	a0,a2,a0
	and	a3,a3,a1
	sb	t1,0(t0)
	lbu	t0,4(s0)
	lw	a2,76(sp)
	sw	a3,80(sp)
	slli	a3,a4,24
	andi	a5,a5,16
	srai	a3,a3,24
	seqz	a2,a2
	or	a3,a3,a5
	sw	a2,76(sp)
	sw	t0,68(sp)
	sw	a0,72(sp)
	sw	a3,64(sp)
	la a2, .LANCHOR67; lw a2, 0(a2);
	or	a4,a4,a5
	beq	t1,zero,.L210
	lla	a0,.LANCHOR191
	lw	a3,0(a0)
	li	a5,-268435456
	and	a5,a2,a5
	sw	a3,88(sp)
	li	a3,-805306368
	add	a5,a5,a3
	lla	a3,.LANCHOR219
	lbu	t0,0(a3)
	andi	a1,a2,-4
	srli	t1,a1,6
	sw	t1,96(sp)
	sw	t0,92(sp)
	lw	t0,96(sp)
	lla	t1,.LANCHOR218
	lbu	a0,0(t1)
	la t1, .LANCHOR69; lw t1, 0(t1);
	sw	a1,84(sp)
	sub	t1,t1,t0
	la a1, .LANCHOR68; lbu a1, 0(a1);
	la a3, .LANCHOR19; lbu a3, 0(a3);
	srli	a2,a2,31
	sra	a3,a3,a1
	seqz	t1,t1
	seqz	a5,a5
	and	a1,a3,t1
	or	a5,a5,a2
	lw	a3,84(sp)
	lw	a2,88(sp)
	lbu	t1,2(s0)
	lw	t0,92(sp)
	sub	a3,a2,a3
	snez	a3,a3
	neg	a3,a3
	andi	a3,a3,6
	xori	a5,a5,1
	or	a3,a3,t1
	lla	t1,.LANCHOR218
	sub	a0,a5,a0
	sub	a2,t0,a1
	sb	a5,0(t1)
	lw	a5,84(sp)
	snez	a0,a0
	snez	a2,a2
	or	a2,a2,a0
	lla	a0,.LANCHOR191
	sw	a5,0(a0)
	lw	a5,68(sp)
	slli	a2,a2,4
	sb	a3,2(s0)
	or	a5,a5,a2
	lla	a3,.LANCHOR219
	sb	a1,0(a3)
	sw	a5,68(sp)
.L210:
	lw	a2,76(sp)
	lw	a1,72(sp)
	lla	a3,.LANCHOR2
	neg	a2,a2
	and	a2,a1,a2
	lw	a1,80(sp)
	lbu	a5,0(a3)
	or	a2,a1,a2
	sub	a5,a2,a5
	lw	a1,68(sp)
	snez	a5,a5
	slli	a5,a5,4
	or	t0,a1,a5
	sb	a2,0(a3)
	sb	t0,4(s0)
	j	.L209
.L633:
	la a3, .LANCHOR26; lbu a3, 0(a3);
	lla	t1,.LANCHOR204
	lbu	a2,0(t1)
	addi	a5,a3,-2
	snez	a5,a5
	la a1, .LANCHOR189; lbu a1, 0(a1);
	and	s1,a5,a1
	sub	a2,s1,a2
	lbu	a1,3(s0)
	la a5, .LANCHOR192; lw a5, 0(a5);
	la a0, .LANCHOR193; lbu a0, 0(a0);
	snez	a2,a2
	slli	a5,a5,2
	slli	a2,a2,4
	or	a5,a5,a0
	la a0, .LANCHOR31; lbu a0, 0(a0);
	or	a2,a2,a1
	seqz	a3,a3
	sw	a0,76(sp)
	la a0, .LANCHOR37; lbu a0, 0(a0);
	sb	s1,0(t1)
	and	a3,s1,a3
	sw	a0,64(sp)
	sw	a2,68(sp)
	la a1, .LANCHOR139; lbu a1, 0(a1);
	beq	a3,zero,.L206
	lla	a0,.LANCHOR28
	lbu	a2,0(a0)
	lbu	t1,5(s0)
	sb	a1,0(a0)
	sub	a2,a1,a2
	snez	a2,a2
	slli	a2,a2,7
	or	a2,a2,t1
	sb	a2,5(s0)
.L206:
	la a2, .LANCHOR188; lbu a2, 0(a2);
	seqz	a0,a2
	xori	t1,a3,1
	la t0, .LANCHOR27; lbu t0, 0(t0);
	neg	a0,a0
	slli	a5,a5,4
	and	a1,a1,a3
	and	t1,t0,t1
	and	a3,a0,a5
	neg	a2,a2
	la a5, .LANCHOR191; lw a5, 0(a5);
	or	t0,t1,a1
	and	a2,a2,a5
	or	a3,a3,a2
	lla	a5,.LANCHOR206
	slli	a2,t0,2
	la a0, .LANCHOR114; lw a0, 0(a0);
	sw	a0,0(a5)
	lla	a1,.LANCHOR207
	sw	a3,4(a5)
	add	a5,a5,a2
	lw	t1,0(a1)
	lw	a2,0(a5)
	lla	a0,.LANCHOR205
	lbu	a3,0(a0)
	sub	a5,a2,t1
	snez	a5,a5
	lbu	t1,4(s0)
	neg	a5,a5
	sub	a3,t0,a3
	snez	a3,a3
	andi	a5,a5,9
	or	a5,a5,t1
	slli	t1,a3,3
	sb	a5,4(s0)
	or	a4,a4,t1
	lla	a5,.LANCHOR209
	lw	t1,68(sp)
	sb	t0,0(a0)
	lbu	a0,0(a5)
	slli	a3,a3,7
	or	a3,t1,a3
	sw	a2,0(a1)
	sw	t0,80(sp)
	lla	a1,.LANCHOR208
	sw	a0,72(sp)
	sw	a3,68(sp)
	lbu	a1,0(a1)
	beq	s1,zero,.L207
	li	a3,33554432
	xor	a3,a2,a3
	slli	a2,a2,16
	srli	a2,a2,16
	sw	a2,84(sp)
	lbu	a2,5(s0)
	lla	s1,.LANCHOR210
	lbu	s1,0(s1)
	lla	t1,.LANCHOR48
	lhu	t0,0(t1)
	sw	a2,100(sp)
	lw	a2,84(sp)
	lla	a5,.LANCHOR211
	lbu	t1,0(a5)
	sw	s1,88(sp)
	li	a5,-65536
	and	a5,a3,a5
	lla	s1,.LANCHOR47
	sub	a2,a2,t0
	lw	t0,88(sp)
	lbu	a0,0(s1)
	snez	s1,a5
	seqz	a5,a5
	lbu	a3,0(s0)
	sw	a5,96(sp)
	snez	a2,a2
	sub	a5,t0,s1
	lw	t0,96(sp)
	slli	a2,a2,2
	or	a2,a2,a3
	lw	a3,100(sp)
	sub	a0,a0,t0
	snez	a5,a5
	snez	a0,a0
	slli	a5,a5,7
	or	a5,a5,a3
	slli	a0,a0,2
	lw	a3,76(sp)
	or	a0,a2,a0
	sub	t1,s1,t1
	sb	a0,0(s0)
	lw	a2,68(sp)
	lw	a0,72(sp)
	sub	a1,a1,s1
	snez	t1,t1
	slli	t1,t1,7
	snez	a1,a1
	seqz	a3,a3
	and	a3,s1,a3
	or	a5,a5,t1
	slli	a1,a1,4
	sb	a5,5(s0)
	or	a1,a2,a1
	sub	a2,a3,a0
	snez	a2,a2
	lw	a0,4(s0)
	neg	a5,a2
	sb	a1,3(s0)
	andi	a5,a5,9
	lw	a1,0(s0)
	or	a5,a5,a0
	lw	a0,84(sp)
	lla	t1,.LANCHOR48
	slli	a2,a2,31
	sh	a0,0(t1)
	or	a2,a2,a1
	lla	a0,.LANCHOR47
	lla	a1,.LANCHOR208
	sb	t0,0(a0)
	sb	s1,0(a1)
	lla	t1,.LANCHOR210
	lla	a0,.LANCHOR211
	lla	a1,.LANCHOR209
	sw	s1,92(sp)
	sb	s1,0(t1)
	sb	s1,0(a0)
	sb	a3,0(a1)
	sw	a2,0(s0)
	sw	a5,4(s0)
	lw	a2,64(sp)
	or	a2,a3,a2
	sw	a2,64(sp)
	beq	a3,zero,.L208
	lw	t0,80(sp)
	lla	a3,.LANCHOR212
	la a1, .LANCHOR141; lbu a1, 0(a1);
	sb	a1,0(a3)
	li	a1,2
	lla	a2,.LANCHOR213
	sb	a1,1(a3)
	add	a3,a3,t0
	lbu	a3,0(a3)
	lbu	a0,0(a2)
	srli	a1,a5,8
	sb	a3,0(a2)
	sub	a5,a3,a0
	snez	a5,a5
	slli	a5,a5,7
	or	a5,a5,a1
	sb	a5,5(s0)
.L208:
	lw	a5,64(sp)
	lla	s1,.LANCHOR214
	sb	a5,0(s1)
	j	.L205
.L637:
	lla	t1,.LANCHOR236
	lbu	a4,0(t1)
	la t0, .LANCHOR15; lbu t0, 0(t0);
	la a3, .LANCHOR136; lbu a3, 0(a3);
	la a2, .LANCHOR235; lbu a2, 0(a2);
	la a1, .LANCHOR13; lbu a1, 0(a1);
	mv	t1,a4
	and	a4,a3,t0
	and	a3,a3,a2
	and	a2,a1,a3
	seqz	a4,a4
	sw	a3,76(sp)
	and	a4,t0,a4
	lla	a3,.LANCHOR16
	sub	t0,a2,t1
	la t1, .LANCHOR221; lbu t1, 0(t1);
	sw	t1,68(sp)
	lbu	a3,0(a3)
	seqz	t1,a2
	la a0, .LANCHOR128; lbu a0, 0(a0);
	sw	t1,80(sp)
	sw	a0,88(sp)
	seqz	t1,a1
	seqz	a0,a0
	or	a4,a2,a4
	and	a4,a0,a4
	sw	t1,84(sp)
	lla	t1,.LANCHOR236
	sub	a3,a4,a3
	sb	a2,0(t1)
	sw	a0,72(sp)
	lla	a2,.LANCHOR16
	lbu	a0,5(s0)
	sb	a4,0(a2)
	snez	a3,a3
	lw	a2,80(sp)
	slli	a3,a3,2
	snez	t0,t0
	or	a0,a3,a0
	lw	t1,68(sp)
	lw	a4,76(sp)
	slli	t0,t0,2
	lw	a3,84(sp)
	or	a5,a5,t0
	and	a2,a1,a2
	la t0, .LANCHOR52; lbu t0, 0(t0);
	sw	a0,68(sp)
	sb	a5,3(s0)
	sw	a2,80(sp)
	or	a1,a4,a3
	and	t1,t0,t1
	lw	a4,88(sp)
	la a0, .LANCHOR224; lbu a0, 0(a0);
	beq	t0,zero,.L214
	beq	a1,zero,.L214
	li	t1,0
	beq	a4,zero,.L217
.L275:
	lbu	a3,0(s0)
	la a4, .LANCHOR12; lbu a4, 0(a4);
	snez	a4,a4
	slli	a4,a4,3
	or	a4,a4,a3
	sb	a4,0(s0)
	la a3, .LANCHOR12; sb zero, 0(a3);
.L217:
	and	a4,a1,a0
	beq	a4,zero,.L218
	lla	a3,.LANCHOR239
	lw	a2,0(a3)
	seqz	a1,t0
	la a3, .LANCHOR203; lw a3, 0(a3);
	sw	a2,76(sp)
	lla	a2,.LANCHOR240
	lw	a0,0(a2)
	neg	a2,t0
	and	t0,a2,a3
	neg	a1,a1
	la a3, .LANCHOR237; lw a3, 0(a3);
	sw	a0,84(sp)
	and	a3,a1,a3
	la a0, .LANCHOR222; lw a0, 0(a0);
	or	a3,t0,a3
	and	a0,a2,a0
	lw	t0,76(sp)
	la a2, .LANCHOR238; lw a2, 0(a2);
	and	a2,a1,a2
	or	a0,a0,a2
	sub	a1,a0,t0
	lw	t0,84(sp)
	snez	a1,a1
	sub	a2,a3,t0
	snez	a2,a2
	or	a2,a2,a1
	lla	a1,.LANCHOR239
	sw	a0,0(a1)
	lla	a1,.LANCHOR240
	sw	a3,0(a1)
	lw	a3,68(sp)
	slli	a2,a2,2
	or	a3,a3,a2
	sw	a3,68(sp)
.L218:
	lw	a3,80(sp)
	lla	a2,.LANCHOR14
	lbu	a1,0(a2)
	or	a4,a3,a4
	lw	a3,72(sp)
	and	a3,a3,a4
	sub	a4,a3,a1
	lw	a1,68(sp)
	snez	a4,a4
	slli	a4,a4,2
	or	a4,a1,a4
	sb	a3,0(a2)
	sb	a4,5(s0)
	beq	t1,zero,.L213
	lla	t1,.LANCHOR241
	lla	a1,.LANCHOR242
	lw	a2,0(t1)
	lw	a3,0(a1)
	la t0, .LANCHOR203; lw t0, 0(t0);
	la a0, .LANCHOR222; lw a0, 0(a0);
	sub	a2,t0,a2
	sub	a3,a0,a3
	snez	a2,a2
	snez	a3,a3
	or	a3,a3,a2
	slli	a3,a3,2
	or	a4,a4,a3
	sw	t0,0(t1)
	sw	a0,0(a1)
	sb	a4,5(s0)
	j	.L213
.L639:
	la a4, .LANCHOR137; lbu a4, 0(a4);
	beq	a4,zero,.L224
	lla	a2,.LANCHOR112
	lbu	a3,0(a2)
	la a4, .LANCHOR229; lbu a4, 0(a4);
	lhu	a1,0(s0)
	sub	a3,a4,a3
	sw	a4,80(sp)
	lla	a0,.LANCHOR163
	snez	a3,a3
	li	a4,-32768
	lbu	a2,0(a0)
	addi	a4,a4,128
	neg	a3,a3
	and	a3,a3,a4
	lla	t1,.LANCHOR142
	la a0, .LANCHOR228; lbu a0, 0(a0);
	lbu	a4,0(t1)
	or	a3,a3,a1
	sh	a3,0(s0)
	sub	a1,a0,a2
	la a3, .LANCHOR247; lbu a3, 0(a3);
	lw	a2,0(s0)
	snez	a1,a1
	sw	a3,72(sp)
	sub	a4,a3,a4
	neg	a1,a1
	li	a3,98304
	sw	a0,84(sp)
	and	a1,a1,a3
	lla	a0,.LANCHOR134
	snez	a4,a4
	lbu	a3,0(a0)
	or	a1,a1,a2
	neg	a4,a4
	sw	a1,0(s0)
	srli	a2,a1,8
	andi	a4,a4,80
	lla	a1,.LANCHOR155
	la t1, .LANCHOR225; lbu t1, 0(t1);
	or	a4,a4,a2
	lbu	a2,0(a1)
	sb	a4,1(s0)
	sub	a4,t1,a3
	lla	a3,.LANCHOR164
	lbu	t0,0(a3)
	snez	a4,a4
	li	a3,2117632
	sw	a2,88(sp)
	addi	a3,a3,-2048
	neg	a4,a4
	lla	a2,.LANCHOR165
	lw	a2,0(a2)
	and	a4,a4,a3
	la a3, .LANCHOR226; lbu a3, 0(a3);
	sw	a3,64(sp)
	lw	a3,0(s0)
	sw	t0,92(sp)
	lw	t0,80(sp)
	sw	a2,96(sp)
	la a2, .LANCHOR227; lbu a2, 0(a2);
	or	a4,a4,a3
	sw	a2,68(sp)
	lla	a2,.LANCHOR112
	la a3, .LANCHOR251; lw a3, 0(a3);
	sw	a4,76(sp)
	sb	t0,0(a2)
	la a4, .LANCHOR250; lbu a4, 0(a4);
	lw	a2,84(sp)
	lla	t0,.LANCHOR163
	sb	t1,0(a0)
	lw	a0,64(sp)
	sb	a2,0(t0)
	lw	a2,72(sp)
	sb	a0,0(a1)
	lla	t0,.LANCHOR142
	lla	a1,.LANCHOR164
	sb	a2,0(t0)
	sb	a4,0(a1)
	lla	a2,.LANCHOR165
	lla	a1,.LANCHOR166
	lla	t0,.LANCHOR167
	sw	a3,0(a2)
	lbu	a2,0(a1)
	lw	a1,0(t0)
	lw	t0,92(sp)
	lw	t1,76(sp)
	sw	a1,80(sp)
	lw	a1,88(sp)
	sw	t1,0(s0)
	sub	a1,a0,a1
	sub	a0,a4,t0
	lla	a4,.LANCHOR168
	lw	t1,0(a4)
	snez	a4,a1
	lw	a1,96(sp)
	snez	a0,a0
	la t0, .LANCHOR252; lbu t0, 0(t0);
	sub	a1,a3,a1
	lla	a3,.LANCHOR127
	lbu	a3,0(a3)
	sw	t0,120(sp)
	sub	a2,t0,a2
	sw	a3,92(sp)
	la a3, .LANCHOR253; lw a3, 0(a3);
	sw	a3,84(sp)
	slli	a3,a0,7
	lla	a0,.LANCHOR126
	lbu	t0,0(a0)
	slli	a4,a4,6
	or	a4,a4,a3
	sw	t0,108(sp)
	lw	a3,84(sp)
	lw	t0,80(sp)
	snez	a1,a1
	slli	a1,a1,7
	snez	a2,a2
	la a0, .LANCHOR254; lw a0, 0(a0);
	or	a4,a4,a1
	slli	a2,a2,7
	or	a4,a4,a2
	sw	a0,88(sp)
	sub	a0,a3,t0
	la t0, .LANCHOR256; lbu t0, 0(t0);
	lla	a3,.LANCHOR129
	lbu	a3,0(a3)
	sw	t0,96(sp)
	sw	a4,80(sp)
	lw	a1,88(sp)
	la a4, .LANCHOR257; lbu a4, 0(a4);
	sw	a4,100(sp)
	lw	a4,80(sp)
	lla	t0,.LANCHOR119
	snez	a0,a0
	sub	t1,a1,t1
	slli	a0,a0,7
	lbu	a1,0(t0)
	la t0, .LANCHOR258; lbu t0, 0(t0);
	sw	t0,104(sp)
	or	a4,a4,a0
	sw	a4,80(sp)
	lw	a0,104(sp)
	lw	a4,108(sp)
	lw	t0,96(sp)
	lw	a2,92(sp)
	sub	a0,a0,a4
	la a4, .LANCHOR259; lbu a4, 0(a4);
	sw	a4,108(sp)
	lw	a4,80(sp)
	sub	a2,t0,a2
	snez	t1,t1
	slli	t1,t1,7
	snez	a2,a2
	or	a4,a4,t1
	slli	a2,a2,3
	lw	t1,100(sp)
	or	a4,a4,a2
	lw	a2,108(sp)
	sub	a3,t1,a3
	la t1, .LANCHOR255; lbu t1, 0(t1);
	sw	t1,92(sp)
	sub	a1,a2,a1
	lw	t1,68(sp)
	lw	a2,64(sp)
	sw	a4,124(sp)
	la a4, .LANCHOR260; lw a4, 0(a4);
	or	t1,t1,a2
	sw	a4,116(sp)
	neg	a4,a2
	lw	a2,68(sp)
	sw	a4,80(sp)
	snez	a0,a0
	neg	a4,a2
	sw	a4,112(sp)
	lw	a4,124(sp)
	slli	a0,a0,3
	lla	t0,.LANCHOR65
	or	a4,a4,a0
	sw	a4,128(sp)
	lla	a4,.LANCHOR114
	lbu	t0,0(t0)
	lw	a2,92(sp)
	lw	a0,76(sp)
	lw	a4,0(a4)
	sub	a2,a2,t0
	seqz	t0,t1
	sw	a4,124(sp)
	lw	a4,80(sp)
	la t1, .LANCHOR233; lw t1, 0(t1);
	srli	a0,a0,8
	and	t1,a4,t1
	lw	a4,128(sp)
	snez	a3,a3
	neg	a3,a3
	or	a0,a4,a0
	sw	a0,128(sp)
	neg	a4,t0
	lw	a0,112(sp)
	lw	t0,116(sp)
	snez	a1,a1
	andi	a3,a3,40
	and	t0,a0,t0
	lw	a0,128(sp)
	neg	a1,a1
	or	t1,t0,t1
	or	a3,a0,a3
	la a0, .LANCHOR249; lw a0, 0(a0);
	andi	a1,a1,10
	and	a4,a4,a0
	or	a0,a4,t1
	or	a3,a3,a1
	lw	a4,76(sp)
	sb	a3,1(s0)
	snez	a2,a2
	lw	a3,64(sp)
	slli	a2,a2,3
	or	a2,a2,a4
	lw	a4,124(sp)
	seqz	a1,a3
	lw	a3,72(sp)
	sb	a2,0(s0)
	sub	a4,a0,a4
	andi	t0,a3,6
	lw	t1,0(s0)
	snez	a4,a4
	li	a3,323584
	neg	a4,a4
	addi	a3,a3,-1280
	and	a3,a4,a3
	or	a3,a3,t1
	sw	a3,64(sp)
	lw	a3,116(sp)
	neg	a4,a1
	lw	t1,68(sp)
	la a2, .LANCHOR234; lw a2, 0(a2);
	and	a4,a4,a3
	lw	a3,80(sp)
	lw	a1,120(sp)
	slli	a2,a2,20
	srli	a2,a2,20
	and	a2,a2,a3
	seqz	a3,t1
	lla	t1,.LANCHOR166
	sb	a1,0(t1)
	lw	a1,84(sp)
	lla	t1,.LANCHOR167
	sw	a3,76(sp)
	sw	a1,0(t1)
	lw	a1,88(sp)
	lla	t1,.LANCHOR168
	or	a4,a4,a2
	sw	a1,0(t1)
	lw	t1,92(sp)
	lla	a1,.LANCHOR65
	addi	a3,t0,-6
	sb	t1,0(a1)
	lw	t1,96(sp)
	lla	a1,.LANCHOR127
	lw	a2,76(sp)
	sb	t1,0(a1)
	lw	t1,100(sp)
	lla	a1,.LANCHOR129
	seqz	a3,a3
	sb	t1,0(a1)
	lw	t1,104(sp)
	lla	a1,.LANCHOR126
	sb	t1,0(a1)
	lw	t1,108(sp)
	lla	a1,.LANCHOR119
	sb	t1,0(a1)
	lla	a1,.LANCHOR114
	sw	a0,0(a1)
	lw	a1,64(sp)
	la t1, .LANCHOR245; lbu t1, 0(t1);
	and	a3,a3,t1
	sw	a1,0(s0)
	neg	a1,a2
	lla	a2,.LANCHOR107
	lw	a0,0(a2)
	and	a4,a4,a1
	la a1, .LANCHOR244; lw a1, 0(a1);
	sw	a0,80(sp)
	addi	a0,t0,-4
	seqz	a0,a0
	sw	a0,76(sp)
	lw	a0,112(sp)
	la a2, .LANCHOR246; lbu a2, 0(a2);
	seqz	t1,t0
	and	a1,a0,a1
	lw	a0,76(sp)
	lw	t0,80(sp)
	or	a4,a4,a1
	and	a0,a0,a2
	la a2, .LANCHOR232; lw a2, 0(a2);
	seqz	a2,a2
	and	a2,a2,t1
	or	a3,a3,a0
	or	a3,a3,a2
	lw	a2,72(sp)
	la a1, .LANCHOR261; lbu a1, 0(a1);
	sw	a4,76(sp)
	andi	t1,a2,1
	xor	a3,a3,t1
	lw	t1,68(sp)
	seqz	a2,a1
	sub	a4,a4,t0
	and	a2,t1,a2
	la t1, .LANCHOR262; lbu t1, 0(t1);
	and	a1,a1,a3
	or	a3,a2,t1
	or	a3,a1,a3
	lla	a0,.LANCHOR130
	lw	a1,64(sp)
	snez	a4,a4
	li	a2,12288
	lbu	t0,0(a0)
	neg	a4,a4
	addi	a2,a2,-1920
	and	a2,a4,a2
	or	a2,a2,a1
	sub	t0,a3,t0
	slli	a2,a2,16
	srli	a2,a2,16
	snez	t0,t0
	srli	a1,a2,8
	slli	a4,t0,3
	or	a4,a4,a1
	lw	a1,76(sp)
	sh	a2,0(s0)
	lla	a2,.LANCHOR107
	sw	a1,0(a2)
	sb	a3,0(a0)
	sb	a4,1(s0)
	j	.L224
.L638:
	la a3, .LANCHOR243; lbu a3, 0(a3);
	seqz	a3,a3
	la a4, .LANCHOR247; lbu a4, 0(a4);
	neg	a3,a3
	and	a3,a3,a4
	addi	a4,a3,-7
	addi	a1,a3,-6
	la t0, .LANCHOR233; lw t0, 0(t0);
	la t1, .LANCHOR234; lw t1, 0(t1);
	seqz	a4,a4
	seqz	a1,a1
	and	a0,t1,t0
	sw	t0,64(sp)
	addi	a2,a3,-4
	or	t0,t1,t0
	neg	a4,a4
	neg	a1,a1
	and	a1,a1,t0
	and	a4,a4,a0
	seqz	a2,a2
	or	a4,a4,a1
	neg	a2,a2
	la a1, .LANCHOR232; lw a1, 0(a1);
	seqz	t0,a3
	and	a2,a2,a1
	or	a4,a4,a2
	neg	a1,t0
	la a2, .LANCHOR244; lw a2, 0(a2);
	and	a2,a1,a2
	la a1, .LANCHOR246; lbu a1, 0(a1);
	sw	a1,72(sp)
	or	a4,a4,a2
	lw	a2,72(sp)
	addi	t0,a3,-2
	seqz	t0,t0
	and	t0,t0,a2
	addi	a2,a3,-3
	la a0, .LANCHOR248; lbu a0, 0(a0);
	seqz	a2,a2
	sw	a0,68(sp)
	sw	a2,76(sp)
	seqz	a0,a0
	la a2, .LANCHOR245; lbu a2, 0(a2);
	sw	a2,80(sp)
	neg	a2,a0
	lw	a0,68(sp)
	sw	t0,72(sp)
	sw	a2,84(sp)
	neg	a0,a0
	lw	a2,64(sp)
	sw	a0,92(sp)
	lw	a0,72(sp)
	andi	t1,t1,31
	srl	t0,a2,t1
	sw	t0,88(sp)
	or	a4,a4,a0
	lw	t0,80(sp)
	lw	a0,76(sp)
	sra	a2,a2,t1
	addi	a1,a3,-1
	and	a0,a0,t0
	sw	a0,68(sp)
	lw	a0,64(sp)
	lw	t0,88(sp)
	seqz	a1,a1
	sll	a0,a0,t1
	lw	t1,84(sp)
	addi	a3,a3,-5
	neg	a1,a1
	and	t1,t1,t0
	lw	t0,92(sp)
	seqz	a3,a3
	neg	a3,a3
	and	a2,t0,a2
	lw	t0,68(sp)
	and	a1,a1,a0
	or	a2,t1,a2
	or	a4,a4,t0
	or	a4,a4,a1
	and	a2,a2,a3
	or	a3,a4,a2
	lla	a2,.LANCHOR249
	lw	a4,0(a2)
	sw	a3,0(a2)
	sub	a4,a3,a4
	snez	a4,a4
	neg	a4,a4
	andi	a4,a4,6
	or	a5,a5,a4
	j	.L221
.L650:
	lla	a2,.LANCHOR21
	lbu	a4,0(a2)
	la a1, .LANCHOR22; lbu a1, 0(a1);
	lw	t1,0(s0)
	sub	a4,a1,a4
	lw	a0,4(s0)
	snez	a4,a4
	neg	t0,a4
	li	a3,1179648
	and	a3,a3,t0
	slli	a4,a4,2
	or	a3,a3,t1
	or	a4,a4,a0
	sb	a1,0(a2)
	sw	a3,0(s0)
	sw	a4,4(s0)
	j	.L265
.L649:
	lla	a1,.LANCHOR187
	lla	a3,.LANCHOR169
	lw	a4,0(a1)
	lbu	t0,0(a3)
	la a0, .LANCHOR161; lw a0, 0(a0);
	la a2, .LANCHOR162; lbu a2, 0(a2);
	sub	a4,a0,a4
	sub	t0,a2,t0
	snez	a4,a4
	snez	t0,t0
	lw	t1,0(s0)
	neg	t0,t0
	neg	a4,a4
	or	a4,a4,t0
	li	t0,67174400
	and	a4,a4,t0
	or	a4,a4,t1
	sw	a0,0(a1)
	sb	a2,0(a3)
	sw	a4,0(s0)
	j	.L264
.L648:
	lla	a3,.LANCHOR262
	lbu	a4,0(a3)
	la a2, .LANCHOR264; lbu a2, 0(a2);
	lbu	a1,3(s0)
	sub	a4,a2,a4
	snez	a4,a4
	neg	a4,a4
	andi	a4,a4,-126
	or	a4,a4,a1
	sb	a2,0(a3)
	sb	a4,3(s0)
	j	.L263
.L647:
	lla	t0,.LANCHOR263
	lw	a2,0(t0)
	la a1, .LANCHOR240; lw a1, 0(a1);
	lbu	a4,3(s0)
	sub	a2,a1,a2
	la s1, .LANCHOR239; lw s1, 0(s1);
	snez	a2,a2
	sw	s1,60(sp)
	lla	t2,.LANCHOR171
	slli	a2,a2,2
	lw	a0,0(t2)
	or	a2,a2,a4
	lla	t1,.LANCHOR15
	lw	a4,60(sp)
	sw	a1,76(sp)
	lbu	a1,0(t1)
	la t1, .LANCHOR14; lbu t1, 0(t1);
	sw	t1,64(sp)
	lla	a3,.LANCHOR13
	lbu	a3,0(a3)
	sub	a4,a4,a0
	lw	a0,64(sp)
	sb	a2,3(s0)
	la a2, .LANCHOR16; lbu a2, 0(a2);
	sw	a2,80(sp)
	sub	a1,a2,a1
	la a2, .LANCHOR241; lw a2, 0(a2);
	sw	a2,68(sp)
	sub	a3,a0,a3
	la a2, .LANCHOR242; lw a2, 0(a2);
	snez	a4,a4
	sw	a2,72(sp)
	snez	a3,a3
	li	a2,67174400
	neg	a4,a4
	and	a4,a4,a2
	neg	a3,a3
	li	a2,71303168
	and	a3,a3,a2
	lla	s1,.LANCHOR237
	lw	a0,0(s1)
	or	a4,a4,a3
	lw	a3,68(sp)
	lla	t1,.LANCHOR238
	lw	a2,72(sp)
	sub	a0,a3,a0
	lw	a3,0(t1)
	snez	a1,a1
	neg	a1,a1
	sub	a3,a2,a3
	lw	a2,0(s0)
	snez	a0,a0
	snez	a3,a3
	or	a4,a4,a2
	li	a2,-2141188096
	addi	a2,a2,-2048
	and	a2,a1,a2
	or	a2,a4,a2
	or	a3,a3,a0
	lw	a1,76(sp)
	lw	a0,64(sp)
	slli	a4,a3,6
	sw	a2,0(s0)
	srli	a3,a2,16
	lw	a2,60(sp)
	or	a4,a4,a3
	lla	a3,.LANCHOR13
	sb	a0,0(a3)
	sw	a1,0(t0)
	sw	a2,0(t2)
	lw	a2,80(sp)
	lla	a3,.LANCHOR15
	sb	a4,2(s0)
	sb	a2,0(a3)
	lw	a3,68(sp)
	lw	a2,72(sp)
	sw	a3,0(s1)
	sw	a2,0(t1)
	j	.L262
.L646:
	lla	a3,.LANCHOR10
	lw	a4,0(a3)
	la a2, .LANCHOR11; lw a2, 0(a2);
	lbu	a1,1(s0)
	sub	a4,a2,a4
	snez	a4,a4
	slli	a4,a4,6
	or	a4,a4,a1
	sw	a2,0(a3)
	sb	a4,1(s0)
	j	.L261
.L645:
	lla	t2,.LANCHOR6
	lw	a3,0(t2)
	la a4, .LANCHOR7; lw a4, 0(a4);
	sw	a4,60(sp)
	sub	a3,a4,a3
	lla	a4,.LANCHOR33
	lhu	a1,0(s0)
	lla	a2,.LANCHOR32
	lw	t0,0(a4)
	lw	t1,4(a4)
	snez	a3,a3
	li	a4,16384
	lw	a0,0(a2)
	neg	a3,a3
	addi	a4,a4,8
	and	a4,a3,a4
	or	a4,a4,a1
	sh	a4,0(s0)
	xor	a4,t0,a0
	lw	a0,4(a2)
	lla	s1,.LANCHOR88
	lbu	a3,0(s1)
	xor	a1,t1,a0
	lw	t2,0(s0)
	la a0, .LANCHOR55; lbu a0, 0(a0);
	or	a4,a4,a1
	snez	a4,a4
	sub	a3,a0,a3
	slli	a1,a4,3
	snez	a3,a3
	or	a1,a1,t2
	slli	a3,a3,5
	lw	t2,4(s0)
	sw	a1,0(s0)
	or	a3,a3,a1
	lw	a1,60(sp)
	slli	a4,a4,2
	or	a4,a4,t2
	lla	t2,.LANCHOR6
	sw	a1,0(t2)
	sw	t0,0(a2)
	sw	t1,4(a2)
	sw	a4,4(s0)
	sb	a0,0(s1)
	sb	a3,0(s0)
	j	.L260
.L643:
	lla	a3,.LANCHOR23
	lbu	a3,0(a3)
	la t1, .LANCHOR188; lbu t1, 0(t1);
	la a0, .LANCHOR73+1; lbu a0, 0(a0);
	mv	a2,a3
	la a3, .LANCHOR271; lbu a3, 0(a3);
	or	a3,t1,a3
	sw	a2,64(sp)
	and	a0,a3,a0
	seqz	a3,a2
	la a2, .LANCHOR52; lbu a2, 0(a2);
	sw	a2,88(sp)
	lw	a2,64(sp)
	la a1, .LANCHOR215+1; lbu a1, 0(a1);
	sw	a0,68(sp)
	seqz	a0,a1
	sw	a0,76(sp)
	addi	a2,a2,-2
	sw	a2,92(sp)
	lw	a2,76(sp)
	sw	t1,72(sp)
	la t0, .LANCHOR190; lbu t0, 0(t0);
	slli	a2,a2,1
	sw	a2,76(sp)
	lw	a2,72(sp)
	la a0, .LANCHOR140; lbu a0, 0(a0);
	seqz	t0,t0
	seqz	t1,t1
	sw	a0,84(sp)
	neg	t0,t0
	neg	a2,a2
	neg	t1,t1
	and	t1,t0,t1
	sw	a2,80(sp)
	lw	t0,84(sp)
	lw	a2,92(sp)
	neg	a1,a1
	neg	t0,t0
	seqz	a2,a2
	sw	t0,84(sp)
	lw	t0,88(sp)
	sw	a2,88(sp)
	lw	a2,68(sp)
	andi	a1,a1,3
	la a0, .LANCHOR24; lbu a0, 0(a0);
	seqz	a2,a2
	sw	a2,92(sp)
	lw	a2,76(sp)
	or	a0,t0,a0
	lw	t0,64(sp)
	or	a1,a2,a1
	lw	a2,80(sp)
	sw	a1,72(sp)
	neg	a3,a3
	or	a2,t1,a2
	lw	t1,84(sp)
	lw	a1,92(sp)
	addi	t0,t0,-1
	and	a3,t1,a3
	neg	a1,a1
	sw	a1,76(sp)
	and	a3,a2,a3
	lw	a2,76(sp)
	seqz	a0,a0
	lw	t1,88(sp)
	seqz	t0,t0
	and	t0,a0,t0
	lw	a0,72(sp)
	andi	a2,a2,3
	lw	a1,64(sp)
	sw	a2,72(sp)
	neg	t1,t1
	lw	a2,68(sp)
	and	a3,a0,a3
	and	t1,a0,t1
	lw	a0,72(sp)
	addi	a1,a1,-3
	andi	a2,a2,1
	seqz	a1,a1
	or	a2,a0,a2
	neg	a1,a1
	and	a2,a2,a1
	or	t0,t0,t1
	lw	a1,64(sp)
	or	t0,a3,t0
	or	a2,t0,a2
	sub	a3,a1,a2
	snez	a3,a3
	lw	a1,0(s0)
	li	a0,1075449856
	neg	a3,a3
	addi	a0,a0,8
	and	a3,a3,a0
	or	a3,a3,a1
	lla	a1,.LANCHOR23
	sb	a2,0(a1)
	sw	a3,0(s0)
	j	.L235
.L654:
	lla	t0,.LANCHOR94
	lla	a3,.LANCHOR93
	lbu	a3,0(a3)
	lw	a1,0(t0)
	la a0, .LANCHOR104; lw a0, 0(a0);
	la s1, .LANCHOR102; lbu s1, 0(s1);
	sub	a1,a0,a1
	sub	a3,s1,a3
	lla	t1,.LANCHOR92
	snez	a1,a1
	snez	a3,a3
	or	a3,a3,a1
	lw	a1,0(t1)
	lbu	t2,0(s0)
	sw	s1,64(sp)
	la s1, .LANCHOR100; lw s1, 0(s1);
	sub	a1,s1,a1
	slli	a3,a3,5
	snez	a1,a1
	lla	a4,.LANCHOR91
	or	t2,t2,a3
	lbu	a4,0(a4)
	slli	a3,a1,5
	lla	a1,.LANCHOR90
	lw	a1,0(a1)
	sw	a0,60(sp)
	la a0, .LANCHOR98; lbu a0, 0(a0);
	la a2, .LANCHOR96; lw a2, 0(a2);
	sub	a4,a0,a4
	snez	a4,a4
	sub	a1,a2,a1
	or	a3,t2,a3
	slli	a4,a4,5
	snez	t2,a1
	or	a4,a3,a4
	slli	a3,t2,5
	lw	t2,60(sp)
	or	a4,a4,a3
	lla	a3,.LANCHOR93
	sw	t2,0(t0)
	lw	t0,64(sp)
	sw	s1,0(t1)
	sb	a4,0(s0)
	sb	t0,0(a3)
	lla	a3,.LANCHOR91
	sb	a0,0(a3)
	lla	a3,.LANCHOR90
	sw	a2,0(a3)
	j	.L272
.L653:
	lla	a1,.LANCHOR95
	lla	a3,.LANCHOR89
	lw	t0,0(a1)
	lbu	a4,0(a3)
	la a0, .LANCHOR78; lw a0, 0(a0);
	la a2, .LANCHOR76; lbu a2, 0(a2);
	sub	t0,a0,t0
	sub	a4,a2,a4
	lbu	t1,0(s0)
	snez	t0,t0
	snez	a4,a4
	or	a4,a4,t0
	slli	a4,a4,5
	or	t1,t1,a4
	sw	a0,0(a1)
	sb	a2,0(a3)
	sb	t1,0(s0)
	j	.L271
.L652:
	lla	t2,.LANCHOR35
	lbu	a4,0(t2)
	la s1, .LANCHOR36; lbu s1, 0(s1);
	lla	t1,.LANCHOR280
	sub	a4,s1,a4
	sw	a4,64(sp)
	lbu	a4,0(s0)
	lla	a1,.LANCHOR279
	lbu	a2,0(t1)
	sw	a4,68(sp)
	lbu	a4,4(s0)
	lbu	a3,0(a1)
	la t0, .LANCHOR50; lbu t0, 0(t0);
	la a0, .LANCHOR49; lbu a0, 0(a0);
	sw	a4,60(sp)
	lw	a4,64(sp)
	sub	a2,t0,a2
	sub	a3,a0,a3
	snez	a2,a2
	snez	a3,a3
	or	a3,a3,a2
	snez	a4,a4
	lw	a2,68(sp)
	neg	a4,a4
	andi	a4,a4,12
	or	a4,a4,a2
	lw	a2,60(sp)
	slli	a3,a3,2
	sb	s1,0(t2)
	or	a3,a2,a3
	sb	a4,0(s0)
	sb	t0,0(t1)
	sb	a0,0(a1)
	sb	a3,4(s0)
	j	.L270
.L229:
	la a3, .LANCHOR38; lbu a3, 0(a3);
	addi	a3,a3,-1
	seqz	a3,a3
	la a4, .LANCHOR57; lbu a4, 0(a4);
	slli	a3,a3,1
	or	a3,a4,a3
	la a2, .LANCHOR123; lbu a2, 0(a2);
	snez	a3,a3
	and	a4,a4,a2
	and	a3,a2,a3
	seqz	a1,a4
	beq	a3,zero,.L231
	neg	a4,a4
	neg	a1,a1
	la t0, .LANCHOR144; lbu t0, 0(t0);
	la a3, .LANCHOR265; lbu a3, 0(a3);
	and	t0,a4,t0
	and	a3,a1,a3
	lla	a0,.LANCHOR266
	or	a3,t0,a3
	li	t0,1
	sll	a3,t0,a3
	lw	t0,0(a0)
	la t1, .LANCHOR121; lw t1, 0(t1);
	and	a4,a4,t1
	and	a1,a1,t0
	or	a1,a4,a1
	lw	a4,0(a0)
	andi	a3,a3,255
	add	a1,a1,a3
	lbu	t0,3(s0)
	sub	a3,a1,a4
	snez	a3,a3
	neg	a2,a2
	slli	a3,a3,3
	lla	a4,.LANCHOR267
	and	a2,a2,t1
	or	a3,a3,t0
	sw	a2,0(a4)
	sw	a1,0(a0)
	sb	a3,3(s0)
	j	.L230
.L640:
	la a3, .LANCHOR171; lw a3, 0(a3);
	la a4, .LANCHOR172; lbu a4, 0(a4);
	sw	a3,64(sp)
	sw	a4,80(sp)
	srli	a3,a3,12
	addi	a4,a4,-25
	andi	a2,a3,0xff
	andi	t0,a3,7
	seqz	a3,a4
	la a0, .LANCHOR236; lbu a0, 0(a0);
	sw	a2,108(sp)
	sw	a3,104(sp)
	la a2, .LANCHOR180; lbu a2, 0(a2);
	la a3, .LANCHOR263; lw a3, 0(a3);
	sw	a0,72(sp)
	sw	t0,68(sp)
	sw	a2,100(sp)
	sw	a3,76(sp)
	beq	a0,zero,.L398
	lla	a1,.LANCHOR261
	lla	a0,.LANCHOR259
	lbu	a4,0(a1)
	lbu	a0,0(a0)
	lla	a2,.LANCHOR254
	lw	t1,0(a2)
	la a1, .LANCHOR174; lbu a1, 0(a1);
	la t0, .LANCHOR175; lbu t0, 0(t0);
	sub	a0,a1,a0
	sub	a4,t0,a4
	sw	a1,84(sp)
	snez	a0,a0
	mv	a1,a3
	lla	a2,.LANCHOR253
	snez	a4,a4
	lw	a2,0(a2)
	or	a4,a4,a0
	sub	a0,a1,t1
	lla	t1,.LANCHOR248
	lbu	t1,0(t1)
	sw	a2,96(sp)
	lbu	a2,3(s0)
	sw	t1,112(sp)
	lla	t1,.LANCHOR257
	lbu	t1,0(t1)
	sw	a2,88(sp)
	la a2, .LANCHOR170; lbu a2, 0(a2);
	sw	a2,116(sp)
	sw	t1,124(sp)
	lw	t1,116(sp)
	la a2, .LANCHOR13; lbu a2, 0(a2);
	addi	a3,a3,4
	and	t1,t1,a2
	lw	a2,96(sp)
	sw	a3,128(sp)
	lw	a1,64(sp)
	sub	a2,a3,a2
	lla	a3,.LANCHOR258
	lbu	a3,0(a3)
	sw	t0,92(sp)
	lla	t0,.LANCHOR252
	sw	a3,96(sp)
	li	a3,-807403520
	addi	a3,a3,-115
	add	a3,a1,a3
	lbu	t0,0(t0)
	sw	a3,120(sp)
	srli	a3,a1,30
	lw	a1,88(sp)
	slli	a4,a4,1
	snez	a0,a0
	or	a1,a1,a4
	snez	a4,a2
	sub	a2,t1,t0
	andi	t0,a3,1
	lw	a3,120(sp)
	slli	a0,a0,1
	or	a0,a1,a0
	seqz	a3,a3
	sw	a3,116(sp)
	lw	a3,64(sp)
	slli	a4,a4,1
	or	a4,a0,a4
	lw	a0,112(sp)
	addi	a3,a3,-115
	seqz	a3,a3
	sw	a3,88(sp)
	sub	a3,t0,a0
	lw	a0,116(sp)
	lw	a1,124(sp)
	snez	a2,a2
	slli	a2,a2,1
	or	a4,a4,a2
	sub	a1,a0,a1
	lw	a2,96(sp)
	lw	a0,88(sp)
	snez	a1,a1
	snez	a3,a3
	sub	a0,a0,a2
	or	a3,a3,a4
	lla	a2,.LANCHOR225
	slli	a4,a1,1
	lw	a1,80(sp)
	lbu	a2,0(a2)
	snez	a0,a0
	or	a3,a3,a4
	slli	a0,a0,1
	seqz	a1,a1
	or	a3,a3,a0
	lla	a4,.LANCHOR247
	sb	a3,3(s0)
	lbu	a4,0(a4)
	sub	a3,a1,a2
	lw	a2,68(sp)
	snez	a3,a3
	lw	a0,0(s0)
	sub	a4,a2,a4
	la a2, .LANCHOR178; lbu a2, 0(a2);
	sw	a1,112(sp)
	neg	a3,a3
	mv	a1,a2
	li	a2,35651584
	and	a3,a3,a2
	snez	a4,a4
	la a2, .LANCHOR173; lbu a2, 0(a2);
	sw	a2,96(sp)
	neg	a4,a4
	lw	a2,84(sp)
	or	a3,a3,a0
	andi	a0,a4,3
	sw	a0,140(sp)
	la a4, .LANCHOR176; lbu a4, 0(a4);
	lw	a0,96(sp)
	or	a2,a2,a1
	sw	a4,136(sp)
	lw	a4,84(sp)
	sw	a1,124(sp)
	mv	a1,a2
	or	a0,a0,a1
	sw	a1,132(sp)
	lla	a1,.LANCHOR259
	sb	a4,0(a1)
	lw	a4,92(sp)
	lla	a1,.LANCHOR261
	srli	a2,a3,24
	sb	a4,0(a1)
	lw	a4,76(sp)
	lla	a1,.LANCHOR254
	sw	a4,0(a1)
	lw	a4,128(sp)
	lla	a1,.LANCHOR253
	sw	a4,0(a1)
	lla	a1,.LANCHOR252
	sb	t1,0(a1)
	lla	t1,.LANCHOR248
	sb	t0,0(t1)
	lw	t1,116(sp)
	lla	a1,.LANCHOR257
	sb	t1,0(a1)
	lw	a4,88(sp)
	lw	t1,140(sp)
	lla	a1,.LANCHOR258
	sb	a4,0(a1)
	lw	a4,112(sp)
	sw	a3,0(s0)
	or	a2,t1,a2
	lw	a3,68(sp)
	lw	t1,136(sp)
	lla	a1,.LANCHOR225
	sb	a4,0(a1)
	lla	a1,.LANCHOR247
	sb	a3,0(a1)
	lw	a4,104(sp)
	and	a3,t0,t1
	lla	t0,.LANCHOR243
	lw	a1,112(sp)
	sb	a2,3(s0)
	lbu	a2,0(t0)
	lw	t0,68(sp)
	or	a4,a4,a0
	or	a4,a1,a4
	seqz	a1,t0
	or	a1,a1,a4
	xori	a3,a3,1
	and	t1,a3,a1
	sub	a4,t1,a2
	sw	t1,112(sp)
	lw	t1,96(sp)
	la a0, .LANCHOR177; lbu a0, 0(a0);
	addi	a3,t0,-1
	snez	a4,a4
	or	a1,a0,t1
	neg	a4,a4
	snez	a0,a3
	li	a3,25165824
	sw	a0,116(sp)
	and	a0,a4,a3
	lw	a3,64(sp)
	li	a4,-1048576
	addi	a4,a4,-115
	lw	t1,124(sp)
	add	a4,a3,a4
	sw	a0,124(sp)
	lw	a3,92(sp)
	lw	a0,84(sp)
	lw	a2,64(sp)
	or	a0,a0,a3
	lw	a3,64(sp)
	andi	t0,a2,127
	neg	a2,t1
	and	a2,a2,a3
	lw	t1,132(sp)
	mv	a3,t0
	addi	a3,a3,-23
	sw	a3,96(sp)
	lw	a3,100(sp)
	or	a1,t1,a1
	lw	t1,116(sp)
	seqz	a3,a3
	sw	a0,84(sp)
	and	a3,a3,t1
	sw	a2,92(sp)
	lw	t1,124(sp)
	lw	a2,0(s0)
	addi	a0,t0,-111
	addi	t0,t0,-55
	or	t1,t1,a2
	seqz	a2,a4
	sw	a2,136(sp)
	seqz	a2,a1
	lw	a1,84(sp)
	sw	a2,140(sp)
	lw	a2,92(sp)
	seqz	a1,a1
	li	a4,-4096
	sw	a1,144(sp)
	and	a1,a2,a4
	lw	a4,120(sp)
	lw	a2,96(sp)
	sw	t1,0(s0)
	sw	a1,148(sp)
	lw	t1,112(sp)
	snez	a1,a4
	sw	a1,152(sp)
	seqz	a1,a0
	sw	a1,156(sp)
	seqz	a2,a2
	seqz	a1,t0
	xori	a3,a3,1
	lla	a4,.LANCHOR243
	sw	a1,160(sp)
	sw	a2,164(sp)
	sw	a3,168(sp)
	sb	t1,0(a4)
.L227:
	la a3, .LANCHOR169; lbu a3, 0(a3);
	la a4, .LANCHOR181; lbu a4, 0(a4);
	sub	a4,a4,a3
	la a2, .LANCHOR62; lbu a2, 0(a2);
	seqz	a4,a4
	and	a4,a2,a4
	la t0, .LANCHOR187; lw t0, 0(t0);
	la a0, .LANCHOR184; lbu a0, 0(a0);
	addi	a1,a4,-1
	sw	a3,116(sp)
	neg	a4,a4
	la a3, .LANCHOR182; lw a3, 0(a3);
	and	a1,a1,a3
	and	a4,a4,t0
	seqz	a3,a0
	lw	t1,64(sp)
	or	a4,a1,a4
	neg	a3,a3
	and	a4,a4,a3
	sw	a2,120(sp)
	sw	t0,124(sp)
	la a2, .LANCHOR231; lbu a2, 0(a2);
	la t0, .LANCHOR160; lw t0, 0(t0);
	neg	a0,a0
	li	a3,-4096
	and	a0,a0,t0
	seqz	a1,a2
	addi	a3,a3,-15
	or	a4,a4,a0
	neg	a1,a1
	add	a3,t1,a3
	and	a1,a4,a1
	sw	t0,128(sp)
	seqz	a4,a3
	la t0, .LANCHOR249; lw t0, 0(t0);
	neg	a2,a2
	srli	a0,t1,7
	andi	a0,a0,0xff
	and	a2,a2,t0
	sw	a4,92(sp)
	lw	a4,72(sp)
	sw	a0,84(sp)
	or	a1,a1,a2
	srli	a0,t1,25
	sw	t0,132(sp)
	sw	a0,96(sp)
	sw	a1,112(sp)
	beq	a4,zero,.L226
	li	a4,28672
	li	a2,-8192
	addi	a1,a4,127
	and	a1,t1,a1
	addi	a0,a2,-115
	addi	a2,a2,-35
	add	a0,a1,a0
	add	a2,a1,a2
	snez	a0,a0
	snez	a2,a2
	sw	a1,72(sp)
	and	a2,a0,a2
	addi	a1,a4,63
	snez	a3,a3
	and	a0,a3,a2
	and	a1,t1,a1
	lw	a2,72(sp)
	addi	a1,a1,-35
	li	a3,-20480
	mv	t0,t1
	snez	a1,a1
	li	t1,28672
	addi	a3,a3,-3
	add	a3,a2,a3
	and	a1,a1,a0
	addi	t1,t1,111
	li	a0,-4096
	li	a2,-16384
	addi	a4,a4,95
	and	t1,t0,t1
	and	a4,t0,a4
	addi	a2,a2,-3
	mv	t0,a0
	addi	a0,a0,-3
	add	a4,a4,a0
	snez	a3,a3
	lw	a0,64(sp)
	add	a2,t1,a2
	and	a1,a3,a1
	snez	a2,a2
	li	a3,20480
	and	a1,a2,a1
	addi	a3,a3,111
	snez	a2,a4
	lw	a4,64(sp)
	and	a3,a0,a3
	li	a0,16384
	addi	a0,a0,127
	and	a0,a4,a0
	li	a4,-16384
	addi	a3,a3,-3
	addi	a4,a4,-99
	and	a2,a2,a1
	add	a4,a0,a4
	snez	a3,a3
	and	a3,a3,a2
	snez	a4,a4
	and	a2,a4,a3
	addi	a1,t0,-99
	lw	a4,72(sp)
	lw	t0,64(sp)
	add	a1,t1,a1
	snez	a1,a1
	li	t1,-33525760
	and	a1,a1,a2
	addi	a0,a4,-103
	li	a2,-1073741824
	addi	a4,t1,127
	and	a3,t0,a4
	addi	a2,a2,-51
	li	a4,-33538048
	add	a2,a3,a2
	addi	a4,a4,127
	li	a3,-16384
	and	a4,t0,a4
	snez	a0,a0
	addi	a3,a3,-51
	and	a0,a0,a1
	add	a3,a4,a3
	snez	a2,a2
	and	a2,a2,a0
	snez	a3,a3
	addi	a4,a4,-51
	and	a3,a3,a2
	snez	a4,a4
	and	a4,a4,a3
	addi	a1,t1,95
	lw	a3,72(sp)
	li	a0,-1073762304
	and	a1,t0,a1
	addi	a0,a0,-19
	li	a2,-24576
	add	a0,a1,a0
	addi	a2,a2,-19
	add	a2,a3,a2
	snez	a0,a0
	li	a3,12288
	and	a0,a0,a4
	addi	a3,a3,127
	li	a4,-12288
	and	a3,t0,a3
	addi	a4,a4,-19
	add	a3,a3,a4
	li	a4,-33542144
	li	a1,-4096
	addi	a4,a4,127
	mv	t1,t0
	and	a4,t0,a4
	addi	t0,a1,-19
	add	a4,a4,t0
	lw	t0,84(sp)
	snez	a2,a2
	and	a2,a2,a0
	andi	a0,t0,1
	sw	a0,84(sp)
	srli	a1,t1,31
	srli	a0,t1,20
	lla	t1,.LANCHOR228
	lbu	t1,0(t1)
	snez	a3,a3
	and	a3,a3,a2
	snez	a4,a4
	sw	t1,172(sp)
	and	a4,a4,a3
	lw	t1,108(sp)
	lw	a3,84(sp)
	sw	a0,72(sp)
	lw	a0,96(sp)
	slli	a2,a1,1
	slli	a1,a1,8
	or	a2,a2,a3
	or	a3,a1,t1
	lla	t1,.LANCHOR229
	lbu	t1,0(t1)
	andi	a1,t0,15
	sw	t0,84(sp)
	andi	t0,a0,63
	lw	a0,72(sp)
	sw	a1,108(sp)
	lw	a1,152(sp)
	sw	t1,176(sp)
	slli	a3,a3,1
	andi	t1,a0,1
	lw	a0,108(sp)
	and	a4,a1,a4
	or	a3,a3,t1
	lw	a1,136(sp)
	lw	t1,144(sp)
	snez	a0,a0
	slli	a3,a3,11
	and	t1,t1,a0
	xori	a1,a1,1
	lw	a0,172(sp)
	sw	a3,152(sp)
	slli	a2,a2,6
	lw	a3,108(sp)
	and	a4,a4,a1
	or	a2,a2,t0
	lw	a1,88(sp)
	lw	t0,64(sp)
	sub	a3,a3,a0
	lla	a0,.LANCHOR256
	lbu	a0,0(a0)
	xori	a1,a1,1
	srli	t0,t0,7
	and	a4,a4,a1
	andi	t0,t0,30
	lw	a1,156(sp)
	slli	a2,a2,5
	or	a2,a2,t0
	sw	a0,172(sp)
	lw	a0,96(sp)
	sw	a2,88(sp)
	sw	t1,156(sp)
	mv	a2,t1
	lw	t1,176(sp)
	xori	a1,a1,1
	and	a1,a4,a1
	lw	a4,160(sp)
	sub	a2,a2,t1
	lw	t1,64(sp)
	slli	a0,a0,5
	sw	a0,144(sp)
	xori	a0,a4,1
	and	a0,a1,a0
	srli	a4,t1,20
	lw	a1,164(sp)
	lw	t1,152(sp)
	la t0, .LANCHOR173; lbu t0, 0(t0);
	sw	t0,96(sp)
	srli	t1,t1,20
	lw	t0,72(sp)
	xori	a1,a1,1
	sw	a1,136(sp)
	neg	a1,t1
	lw	t1,144(sp)
	srli	t0,t0,11
	sw	t0,160(sp)
	srli	t0,t1,11
	lhu	t1,88(sp)
	sw	a1,176(sp)
	lw	a1,104(sp)
	sw	t1,180(sp)
	lw	t1,96(sp)
	snez	a3,a3
	neg	a3,a3
	or	t1,t1,a1
	sw	t1,64(sp)
	lw	t1,136(sp)
	andi	a4,a4,2046
	snez	a2,a2
	and	a1,a0,t1
	lw	a0,84(sp)
	sw	a1,136(sp)
	li	a1,35651584
	and	a3,a3,a1
	andi	a1,a0,31
	lw	a0,152(sp)
	neg	a2,a2
	neg	t0,t0
	or	a0,a0,a4
	lw	a4,160(sp)
	sw	a0,84(sp)
	slli	t0,t0,12
	neg	a0,a4
	lw	a4,176(sp)
	sw	a0,164(sp)
	slli	t1,a4,21
	lw	a4,180(sp)
	srli	a4,a4,12
	sw	a4,184(sp)
	la a4, .LANCHOR174; lbu a4, 0(a4);
	sw	a4,152(sp)
	la a0, .LANCHOR175; lbu a0, 0(a0);
	sw	a0,104(sp)
	la a0, .LANCHOR177; lbu a0, 0(a0);
	sw	a0,160(sp)
	lw	a0,0(s0)
	lw	a4,172(sp)
	or	a3,a3,a0
	li	a0,35651584
	and	a2,a2,a0
	lw	a0,136(sp)
	sub	a0,a0,a4
	lw	a4,144(sp)
	snez	a0,a0
	or	a1,a4,a1
	lw	a4,164(sp)
	or	a1,t0,a1
	slli	a4,a4,12
	sw	a4,164(sp)
	lw	a4,84(sp)
	or	t1,t1,a4
	lw	a4,96(sp)
	sw	t1,176(sp)
	lw	t1,92(sp)
	neg	a4,a4
	sw	a4,180(sp)
	lw	a4,184(sp)
	neg	a4,a4
	sw	a4,184(sp)
	lw	a4,64(sp)
	or	a4,t1,a4
	sw	a4,188(sp)
	lla	a4,.LANCHOR227
	lbu	a4,0(a4)
	sw	a4,144(sp)
	or	a4,a2,a3
	lw	a2,100(sp)
	lw	a3,116(sp)
	sw	a4,84(sp)
	lw	a4,152(sp)
	sub	a3,a3,a2
	sw	a3,172(sp)
	lw	a2,72(sp)
	lw	a3,164(sp)
	neg	a4,a4
	sw	a4,96(sp)
	or	a3,a3,a2
	lw	a4,160(sp)
	sw	a3,160(sp)
	lw	a3,176(sp)
	lw	a2,180(sp)
	neg	t1,a4
	sw	a1,176(sp)
	and	a4,a3,a2
	lw	a3,140(sp)
	neg	a2,a3
	lw	a3,184(sp)
	slli	t0,a3,13
	lw	a3,188(sp)
	neg	a3,a3
	sw	a3,180(sp)
	lw	a3,104(sp)
	seqz	a1,a3
	lla	a3,.LANCHOR234
	lw	a3,0(a3)
	neg	a1,a1
	sw	a3,116(sp)
	lw	a3,112(sp)
	and	t1,t1,a3
	sw	t1,100(sp)
	slli	t1,a0,1
	sw	t1,140(sp)
	lw	t1,148(sp)
	lw	a3,84(sp)
	or	a4,a4,t1
	lw	t1,160(sp)
	srli	a0,a3,24
	sw	a0,164(sp)
	and	a2,a2,t1
	lw	a0,176(sp)
	lw	t1,96(sp)
	lw	a3,172(sp)
	or	a4,a4,a2
	and	a0,a0,t1
	lw	t1,88(sp)
	sw	a0,148(sp)
	lw	a0,180(sp)
	or	t0,t0,t1
	lw	t1,104(sp)
	seqz	a3,a3
	lw	a2,148(sp)
	neg	t1,t1
	sw	t1,88(sp)
	andi	t1,a0,4
	sw	t1,104(sp)
	lw	t1,84(sp)
	lw	a0,164(sp)
	sw	t1,0(s0)
	lw	t1,120(sp)
	and	a3,t1,a3
	lw	t1,140(sp)
	or	a0,t1,a0
	lw	t1,100(sp)
	or	t1,a2,t1
	lw	a2,88(sp)
	sb	a0,3(s0)
	la a0, .LANCHOR186; lbu a0, 0(a0);
	sw	a0,84(sp)
	or	a4,a4,t1
	lw	a0,76(sp)
	lw	t1,64(sp)
	sw	a4,76(sp)
	and	a2,t0,a2
	lw	a4,144(sp)
	lw	t0,104(sp)
	andi	a0,a0,-4
	and	a1,t0,a1
	mv	t0,a0
	sub	a0,a4,t1
	lla	t1,.LANCHOR260
	lw	a4,0(t1)
	lw	t1,76(sp)
	or	a2,a2,a1
	sw	a4,120(sp)
	lw	a4,116(sp)
	sw	a2,88(sp)
	lw	a1,152(sp)
	sub	t1,t1,a4
	lw	a4,88(sp)
	sw	t0,104(sp)
	seqz	a2,a1
	add	a4,a4,t0
	lw	t0,124(sp)
	neg	a1,a3
	addi	a3,a3,-1
	and	t0,a1,t0
	la a1, .LANCHOR185; lw a1, 0(a1);
	and	a3,a3,a1
	lw	a1,84(sp)
	neg	a2,a2
	and	a2,a4,a2
	seqz	a1,a1
	sw	a1,88(sp)
	lla	a1,.LANCHOR264
	lbu	a1,0(a1)
	or	t0,t0,a3
	sw	a2,124(sp)
	sw	a1,116(sp)
	la a1, .LANCHOR230; lbu a1, 0(a1);
	lw	a3,88(sp)
	lw	a2,112(sp)
	sw	a1,100(sp)
	lw	a1,96(sp)
	la a4, .LANCHOR179; lbu a4, 0(a4);
	sw	a4,88(sp)
	and	a2,a1,a2
	neg	a1,a3
	and	a1,t0,a1
	lw	a3,84(sp)
	lw	a4,124(sp)
	sw	a1,112(sp)
	lw	t0,128(sp)
	lw	a1,80(sp)
	neg	a3,a3
	or	a2,a4,a2
	and	a3,a3,t0
	snez	a0,a0
	addi	t0,a1,-13
	lw	a1,0(s0)
	sw	a2,84(sp)
	neg	a0,a0
	li	a2,35651584
	snez	t1,t1
	and	a2,a0,a2
	or	a2,a2,a1
	neg	a4,t1
	li	a1,60817408
	and	a4,a4,a1
	sw	a4,96(sp)
	lw	a1,84(sp)
	lw	a4,120(sp)
	snez	t0,t0
	sw	t0,120(sp)
	sub	a4,a1,a4
	lw	a1,112(sp)
	lw	t0,88(sp)
	lw	a0,100(sp)
	or	a1,a1,a3
	lbu	a3,5(s0)
	sw	a4,100(sp)
	seqz	a4,t0
	sw	a3,112(sp)
	lw	a3,96(sp)
	sw	a4,124(sp)
	lw	a4,116(sp)
	or	t0,a2,a3
	lw	a2,100(sp)
	lw	a3,92(sp)
	seqz	t1,a0
	neg	t1,t1
	sub	a4,a3,a4
	snez	a3,a2
	lw	a2,132(sp)
	and	a1,a1,t1
	neg	a0,a0
	lla	t1,.LANCHOR233
	lw	t1,0(t1)
	and	a0,a0,a2
	lw	a2,120(sp)
	sw	t1,96(sp)
	snez	t1,a4
	neg	a2,a2
	sw	a2,116(sp)
	sw	t1,100(sp)
	lw	a2,124(sp)
	lw	a4,116(sp)
	srli	t1,t0,24
	sw	t0,0(s0)
	lw	t0,100(sp)
	or	a0,a1,a0
	neg	a2,a2
	lw	a1,88(sp)
	and	a2,a4,a2
	slli	a4,t0,3
	lw	t0,104(sp)
	neg	a1,a1
	and	a1,a0,a1
	and	a2,a2,t0
	or	t0,a1,a2
	lw	a2,112(sp)
	slli	a3,a3,1
	or	a3,a3,t1
	lw	t1,108(sp)
	or	a4,a4,a2
	lw	a2,156(sp)
	lla	a0,.LANCHOR228
	sb	a3,3(s0)
	sb	t1,0(a0)
	lw	a3,92(sp)
	lla	a0,.LANCHOR229
	sb	a2,0(a0)
	lw	a0,136(sp)
	lla	a2,.LANCHOR264
	sb	a3,0(a2)
	lla	a3,.LANCHOR256
	sb	a0,0(a3)
	lw	a0,76(sp)
	lw	t1,64(sp)
	lla	a3,.LANCHOR234
	sw	a0,0(a3)
	lla	a3,.LANCHOR227
	sb	t1,0(a3)
	lw	t1,84(sp)
	lla	a3,.LANCHOR260
	lw	a1,0(s0)
	sw	t1,0(a3)
	lla	a3,.LANCHOR233
	sw	t0,0(a3)
	lw	a3,96(sp)
	li	t1,60817408
	sb	a4,5(s0)
	sub	a3,a3,t0
	snez	a3,a3
	neg	a3,a3
	and	a3,a3,t1
	lla	t1,.LANCHOR226
	lbu	a0,0(t1)
	lla	a4,.LANCHOR251
	lw	t1,80(sp)
	lw	a4,0(a4)
	or	a3,a3,a1
	sw	a0,76(sp)
	li	a0,-4096
	addi	a1,t1,-28
	addi	t1,a0,239
	srli	a0,a3,24
	sub	a2,a4,t0
	lw	a4,72(sp)
	sw	a0,72(sp)
	lw	a0,68(sp)
	seqz	a1,a1
	snez	a2,a2
	snez	a0,a0
	and	a0,a1,a0
	lw	a1,72(sp)
	sw	t0,84(sp)
	slli	t0,a2,1
	add	t1,a4,t1
	sw	a3,0(s0)
	sw	a0,64(sp)
	or	a3,t0,a1
	li	a2,-4096
	sb	a3,3(s0)
	addi	a2,a2,1024
	slli	a1,t1,16
	lla	a3,.LANCHOR250
	lbu	a0,0(a3)
	lw	t1,64(sp)
	add	a4,a4,a2
	lw	a3,76(sp)
	srli	a1,a1,16
	sltiu	a1,a1,2
	seqz	a4,a4
	or	a4,a1,a4
	lw	a1,168(sp)
	sub	a3,a3,t1
	snez	a3,a3
	and	a4,t1,a4
	lla	t0,.LANCHOR255
	and	t1,a1,t1
	neg	a3,a3
	li	a1,35651584
	lbu	a2,0(t0)
	and	a3,a3,a1
	lw	a1,0(s0)
	sub	a0,a4,a0
	snez	a0,a0
	or	a3,a3,a1
	sub	a2,t1,a2
	srli	a1,a3,24
	sw	a3,0(s0)
	slli	a0,a0,1
	lw	a3,84(sp)
	snez	a2,a2
	slli	a2,a2,1
	or	a1,a0,a1
	or	a1,a1,a2
	lla	a2,.LANCHOR251
	sw	a3,0(a2)
	lw	a3,64(sp)
	lla	a2,.LANCHOR226
	sb	t1,0(t0)
	sb	a3,0(a2)
	lla	a3,.LANCHOR250
	sb	a4,0(a3)
	sb	a1,3(s0)
	j	.L226
.L214:
	bne	a4,zero,.L275
	seqz	a4,t0
	and	a4,a0,a4
	and	a4,a1,a4
	beq	t1,a4,.L217
	lla	a3,.LANCHOR12
	lbu	a4,0(a3)
	lbu	a2,0(s0)
	sb	t1,0(a3)
	sub	a4,t1,a4
	snez	a4,a4
	slli	a4,a4,3
	or	a4,a4,a2
	sb	a4,0(s0)
	j	.L217
.L231:
	lla	t0,.LANCHOR266
	lw	a1,0(t0)
	seqz	a3,a2
	la t1, .LANCHOR121; lw t1, 0(t1);
	neg	a3,a3
	neg	a0,a2
	and	a3,a3,a1
	and	a0,a0,t1
	lla	a4,.LANCHOR267
	or	a3,a3,a0
	sw	a3,0(a4)
	beq	a2,zero,.L230
	lbu	a2,3(s0)
	sub	a3,a1,t1
	snez	a3,a3
	slli	a3,a3,3
	or	a3,a3,a2
	sw	t1,0(t0)
	sb	a3,3(s0)
	j	.L230
.L207:
	lw	a3,68(sp)
	snez	a5,a1
	slli	a5,a5,4
	or	a5,a3,a5
	lw	a3,72(sp)
	sb	a5,3(s0)
	lw	a2,4(s0)
	lw	a5,0(s0)
	snez	s1,a3
	neg	a3,s1
	andi	a3,a3,9
	slli	s1,s1,31
	or	a3,a3,a2
	or	a5,s1,a5
	la a2, .LANCHOR208; sb zero, 0(a2);
	la a2, .LANCHOR209; sb zero, 0(a2);
	sw	a5,0(s0)
	sw	a3,4(s0)
	j	.L208
.L188:
	la a5, .LANCHOR64; lbu a5, 0(a5);
	beq	a5,zero,.L189
	la a5, .LANCHOR108; lbu a5, 0(a5);
	la a4, .LANCHOR110; lbu a4, 0(a4);
	or	a5,a5,a4
	bne	a5,zero,.L189
	la a5, .LANCHOR109; lbu a5, 0(a5);
	beq	a5,zero,.L189
	lla	a3,.LANCHOR132
	lw	a5,0(a3)
	la a4, .LANCHOR114; lw a4, 0(a4);
	andi	a4,a4,-4
	lbu	a2,4(s0)
	sub	a5,a4,a5
	snez	a5,a5
	slli	a5,a5,7
	or	a5,a5,a2
	sw	a4,0(a3)
	sb	a5,4(s0)
	j	.L189
.L191:
	li	a4,1
	bne	a1,a4,.L192
	lbu	a3,5(s0)
	la a4, .LANCHOR25; lbu a4, 0(a4);
	snez	a4,a4
	slli	a4,a4,6
	or	a4,a4,a3
	sb	a4,5(s0)
	la a3, .LANCHOR25; sb zero, 0(a3);
	j	.L192
.L239:
	lla	a3,.LANCHOR19
	beq	t1,zero,.L220
.L274:
	lbu	a5,0(a3)
	lw	a3,0(s0)
	li	a2,-2146959360
	snez	a5,a5
	neg	a5,a5
	and	a5,a5,a2
	or	a5,a5,a3
	sw	a5,0(s0)
	la a3, .LANCHOR19; sb zero, 0(a3);
	j	.L220
.L398:
	sw	zero,168(sp)
	sw	zero,164(sp)
	sw	zero,160(sp)
	sw	zero,156(sp)
	sw	zero,152(sp)
	sw	zero,144(sp)
	sw	zero,140(sp)
	sw	zero,136(sp)
	sw	zero,88(sp)
	sw	zero,148(sp)
	j	.L227
.L237:
	lw	a3,72(sp)
	beq	a3,zero,.L238
	neg	a1,a0
	la a3, .LANCHOR274; sb zero, 0(a3);
	andi	t0,a1,3
	lla	a3,.LANCHOR274
	la a1, .LANCHOR205; lbu a1, 0(a1);
	sb	t0,1(a3)
	add	a3,a3,a1
	lla	a1,.LANCHOR269
	lbu	t0,0(a1)
	lbu	a3,0(a3)
	sb	a3,0(a1)
	sub	a3,a3,t0
	snez	a3,a3
	neg	a3,a3
	andi	a3,a3,-112
	srli	a1,a5,24
	or	a3,a3,a1
	sb	a3,3(s0)
	j	.L238
.L68:
	la a4, .LANCHOR110; lbu a4, 0(a4);
	la a3, .LANCHOR109; lbu a3, 0(a3);
	or	a4,a4,a3
	bne	a4,zero,.L67
	la a4, .LANCHOR46; lbu a4, 0(a4);
	beq	a4,zero,.L67
	li	a4,769
	beq	a5,a4,.L279
	li	a4,770
	beq	a5,a4,.L280
	li	a2,771
	li	a3,32
	li	a4,63
	bne	a5,a2,.L655
.L71:
	li	a1,32
	li	a2,834
	sw	a1,60(sp)
	bne	a5,a2,.L656
.L75:
	li	a2,4096
	addi	a2,a2,-238
	bne	a5,a2,.L76
	li	a2,32
	sw	a2,60(sp)
.L80:
	li	a1,32
	li	a2,835
	sw	a1,64(sp)
	bne	a5,a2,.L657
.L85:
	li	a2,4096
	addi	a2,a2,-1
	bne	a5,a2,.L86
	li	a2,32
	sw	a2,64(sp)
.L90:
	li	a2,836
	bne	a5,a2,.L91
	li	a3,32
.L95:
	li	a1,770
	li	a2,109
	bne	a5,a1,.L96
.L100:
	li	a1,834
	bne	a5,a1,.L101
	li	a2,32
.L105:
	li	a1,4096
	addi	a1,a1,-238
	bne	a5,a1,.L106
	li	a2,109
.L110:
	li	a0,774
	li	a1,110
	bne	a5,a0,.L658
.L115:
	li	a0,4096
	addi	a0,a0,-1024
	bne	a5,a0,.L116
	li	a1,32
.L120:
	li	a0,771
	bne	a5,a0,.L121
	li	a4,100
.L125:
	li	a0,835
	bne	a5,a0,.L126
	li	a4,109
.L130:
	li	a0,4096
	addi	a0,a0,-1
	bne	a5,a0,.L131
	li	a4,32
.L135:
	li	t1,774
	li	a0,101
	bne	a5,t1,.L659
.L140:
	li	t1,4096
	addi	t1,t1,-1024
	bne	a5,t1,.L141
	li	a0,121
.L145:
	li	t0,770
	li	t1,108
	bne	a5,t0,.L146
.L150:
	li	t0,834
	bne	a5,t0,.L151
	li	t1,117
.L155:
	li	t0,4096
	addi	t0,t0,-238
	bne	a5,t0,.L156
	li	t1,104
.L160:
	li	t2,772
	li	t0,105
	bne	a5,t2,.L161
.L165:
	li	t2,836
	bne	a5,t2,.L166
	li	t0,105
.L170:
	li	ra,769
	li	t2,97
	bne	a5,ra,.L171
.L175:
	li	ra,832
	bne	a5,ra,.L176
	li	t2,104
.L180:
	li	ra,4096
	addi	ra,ra,-239
	bne	a5,ra,.L181
.L396:
	li	t2,100
.L183:
	sw	a4,24(sp)
	sw	a2,8(sp)
	lw	a4,64(sp)
	lw	a2,60(sp)
	li	a5,8
	sw	a0,32(sp)
	sw	a1,16(sp)
	sw	a3,0(sp)
	sw	t2,56(sp)
	sw	a5,52(sp)
	sw	t0,48(sp)
	sw	a5,44(sp)
	sw	t1,40(sp)
	sw	a5,36(sp)
	sw	a5,28(sp)
	sw	a5,20(sp)
	sw	a5,12(sp)
	sw	a5,4(sp)
	li	a3,8
	li	a1,8
	lla	a0,.LC12
	call	gprintf
	j	.L67
.L176:
	li	ra,834
	bne	a5,ra,.L177
	li	t2,101
.L181:
	li	ra,4096
	addi	ra,ra,-238
	beq	a5,ra,.L396
.L182:
	li	ra,4096
	addi	ra,ra,-1
	bne	a5,ra,.L183
	li	t2,116
	j	.L183
.L177:
	li	ra,835
	bne	a5,ra,.L178
	li	t2,108
	j	.L182
.L166:
	li	t2,4096
	addi	t2,t2,-1024
	bne	a5,t2,.L167
	li	t0,108
.L171:
	li	ra,770
	li	t2,103
	beq	a5,ra,.L176
.L172:
	li	ra,771
	li	t2,103
	beq	a5,ra,.L177
.L173:
	li	ra,772
	li	t2,101
	bne	a5,ra,.L174
.L178:
	li	ra,836
	bne	a5,ra,.L179
	li	t2,112
	j	.L183
.L655:
	li	a4,772
	bne	a5,a4,.L660
	li	a4,32
	sw	a4,60(sp)
	li	a3,32
	li	a4,63
.L72:
	li	a2,835
	bne	a5,a2,.L661
	li	a2,32
	sw	a2,60(sp)
.L76:
	li	a2,4096
	addi	a2,a2,-1
	bne	a5,a2,.L77
	li	a2,32
	sw	a3,64(sp)
	sw	a2,60(sp)
.L81:
	li	a2,836
	bne	a5,a2,.L82
	li	a2,32
	sw	a2,64(sp)
.L86:
	li	a2,774
	bne	a5,a2,.L87
	li	a3,111
.L91:
	li	a2,4096
	addi	a2,a2,-1024
	bne	a5,a2,.L92
	li	a3,32
.L96:
	li	a1,771
	li	a2,109
	bne	a5,a1,.L97
.L101:
	li	a1,835
	bne	a5,a1,.L102
	li	a2,32
.L106:
	li	a1,4096
	addi	a1,a1,-1
	bne	a5,a1,.L107
	mv	a1,a4
	li	a2,32
.L111:
	li	a0,832
	bne	a5,a0,.L112
	li	a1,99
.L116:
	li	a0,4096
	addi	a0,a0,-239
	bne	a5,a0,.L117
	li	a1,110
.L121:
	li	a0,772
	bne	a5,a0,.L122
	li	a4,32
.L126:
	li	a0,836
	bne	a5,a0,.L127
	li	a4,32
.L131:
	li	t1,769
	li	a0,109
	bne	a5,t1,.L132
.L136:
	li	t1,832
	bne	a5,t1,.L137
	li	a0,97
.L141:
	li	t1,4096
	addi	t1,t1,-239
	bne	a5,t1,.L142
	li	a0,111
.L146:
	li	t0,771
	li	t1,108
	beq	a5,t0,.L151
.L147:
	li	t0,772
	li	t1,109
	bne	a5,t0,.L148
.L152:
	li	t0,836
	bne	a5,t0,.L153
	li	t1,109
.L157:
	li	t2,769
	li	t0,115
	beq	a5,t2,.L162
.L158:
	li	t2,770
	li	t0,101
	beq	a5,t2,.L163
.L159:
	li	t2,771
	li	t0,101
	bne	a5,t2,.L160
.L164:
	li	t2,835
	bne	a5,t2,.L165
	li	t0,97
.L169:
	li	t2,4096
	addi	t2,t2,-1
	bne	a5,t2,.L170
	li	t0,115
.L174:
	li	ra,774
	li	t2,110
	bne	a5,ra,.L662
.L179:
	li	ra,4096
	addi	ra,ra,-1024
	bne	a5,ra,.L180
	li	t2,101
	j	.L183
.L151:
	li	t0,835
	bne	a5,t0,.L152
	li	t1,118
.L156:
	li	t0,4096
	addi	t0,t0,-1
	bne	a5,t0,.L157
	li	t1,97
.L161:
	li	t2,774
	li	t0,101
	beq	a5,t2,.L166
	li	t0,63
.L162:
	li	t2,832
	bne	a5,t2,.L163
	li	t0,99
.L167:
	li	t2,4096
	addi	t2,t2,-239
	bne	a5,t2,.L168
	li	t0,105
	j	.L172
.L163:
	li	t2,834
	bne	a5,t2,.L164
	li	t0,115
.L168:
	li	t2,4096
	addi	t2,t2,-238
	bne	a5,t2,.L169
	li	t0,105
	j	.L173
.L153:
	li	t0,4096
	addi	t0,t0,-1024
	bne	a5,t0,.L154
	li	t1,99
	j	.L158
.L137:
	li	t1,834
	bne	a5,t1,.L138
	li	a0,97
.L142:
	li	t1,4096
	addi	t1,t1,-238
	bne	a5,t1,.L143
	li	a0,99
	j	.L147
.L661:
	li	a2,836
	bne	a5,a2,.L73
	li	a2,32
	sw	a2,60(sp)
.L77:
	li	a1,99
	li	a2,774
	sw	a1,64(sp)
	bne	a5,a2,.L78
.L82:
	li	a2,4096
	addi	a2,a2,-1024
	bne	a5,a2,.L83
	li	a2,32
	sw	a2,64(sp)
.L87:
	li	a2,832
	bne	a5,a2,.L88
	li	a3,109
.L92:
	li	a2,4096
	addi	a2,a2,-239
	bne	a5,a2,.L93
	li	a3,118
.L97:
	li	a1,772
	li	a2,32
	bne	a5,a1,.L98
.L102:
	li	a1,836
	bne	a5,a1,.L103
	li	a2,32
.L107:
	li	a0,770
	li	a1,101
	bne	a5,a0,.L108
.L112:
	li	a0,834
	bne	a5,a0,.L113
	li	a1,109
.L117:
	li	a0,4096
	addi	a0,a0,-238
	bne	a5,a0,.L118
	li	a1,97
.L122:
	li	a0,774
	bne	a5,a0,.L123
	li	a4,116
.L127:
	li	a0,4096
	addi	a0,a0,-1024
	bne	a5,a0,.L128
	li	a4,99
.L132:
	li	t1,770
	li	a0,101
	beq	a5,t1,.L137
.L133:
	li	t1,771
	li	a0,101
	bne	a5,t1,.L134
.L138:
	li	t1,835
	bne	a5,t1,.L139
	li	a0,116
.L143:
	li	t1,4096
	addi	t1,t1,-1
	bne	a5,t1,.L144
	li	a0,108
.L148:
	li	t0,774
	li	t1,114
	beq	a5,t0,.L153
	li	t1,63
.L149:
	li	t0,832
	bne	a5,t0,.L150
	li	t1,116
.L154:
	li	t0,4096
	addi	t0,t0,-239
	bne	a5,t0,.L155
	li	t1,114
	j	.L159
.L103:
	li	a1,4096
	addi	a1,a1,-1024
	bne	a5,a1,.L104
	li	a2,32
.L108:
	li	a0,771
	li	a1,105
	beq	a5,a0,.L113
.L109:
	li	a0,772
	li	a1,32
	bne	a5,a0,.L110
.L114:
	li	a0,836
	bne	a5,a0,.L115
	li	a1,32
.L119:
	li	a0,770
	bne	a5,a0,.L120
	li	a4,100
.L124:
	li	a0,834
	bne	a5,a0,.L125
	li	a4,99
.L129:
	li	a0,4096
	addi	a0,a0,-238
	bne	a5,a0,.L130
	li	a4,114
.L134:
	li	t1,772
	li	a0,32
	bne	a5,t1,.L135
.L139:
	li	t1,836
	bne	a5,t1,.L140
	li	a0,32
.L144:
	li	t0,769
	li	t1,105
	beq	a5,t0,.L149
	j	.L145
.L113:
	li	a0,835
	bne	a5,a0,.L114
	li	a1,32
.L118:
	li	a0,4096
	addi	a0,a0,-1
	bne	a5,a0,.L119
	li	a1,32
.L123:
	li	a0,832
	bne	a5,a0,.L124
	li	a4,114
.L128:
	li	a0,4096
	addi	a0,a0,-239
	bne	a5,a0,.L129
	li	a4,100
	j	.L133
.L660:
	li	a4,774
	bne	a5,a4,.L663
	li	a4,109
	sw	a4,60(sp)
	li	a3,63
	li	a4,63
.L73:
	li	a2,4096
	addi	a2,a2,-1024
	bne	a5,a2,.L74
	li	a2,32
	sw	a2,60(sp)
.L78:
	li	a1,32
	li	a2,832
	sw	a1,64(sp)
	bne	a5,a2,.L79
.L83:
	li	a2,4096
	addi	a2,a2,-239
	bne	a5,a2,.L84
	li	a2,109
	sw	a2,64(sp)
.L88:
	li	a2,834
	bne	a5,a2,.L89
	li	a3,32
.L93:
	li	a2,4096
	addi	a2,a2,-238
	bne	a5,a2,.L94
	li	a3,32
.L98:
	li	a1,774
	li	a2,117
	beq	a5,a1,.L103
	mv	a2,a4
.L99:
	li	a1,832
	bne	a5,a1,.L100
	li	a2,115
.L104:
	li	a1,4096
	addi	a1,a1,-239
	bne	a5,a1,.L105
	li	a2,101
	j	.L109
.L279:
	li	a3,32
	li	a4,32
.L70:
	li	a1,32
	li	a2,832
	sw	a1,60(sp)
	bne	a5,a2,.L71
.L74:
	li	a2,4096
	addi	a2,a2,-239
	bne	a5,a2,.L75
	li	a2,32
	sw	a2,60(sp)
.L79:
	li	a1,32
	li	a2,834
	sw	a1,64(sp)
	bne	a5,a2,.L80
.L84:
	li	a2,4096
	addi	a2,a2,-238
	bne	a5,a2,.L85
	li	a2,32
	sw	a2,64(sp)
.L89:
	li	a2,835
	bne	a5,a2,.L90
	li	a3,32
.L94:
	li	a2,4096
	addi	a2,a2,-1
	bne	a5,a2,.L95
	mv	a2,a4
	li	a3,32
	j	.L99
.L280:
	li	a3,32
	li	a4,63
	j	.L70
.L657:
	sw	a3,64(sp)
	j	.L81
.L663:
	li	a3,63
	li	a4,63
	j	.L70
.L662:
	li	t2,63
	j	.L175
.L659:
	li	a0,63
	j	.L136
.L658:
	mv	a1,a4
	j	.L111
.L656:
	sw	a3,60(sp)
	j	.L72
.L278:
	lla	s0,.LC0
	li	a0,65
.L62:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L62
	lla	s0,.LC7
	li	a0,65
.L63:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L63
	lla	s0,.LC8
	li	a0,32
.L64:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L64
	li	a0,1
	call	halt
.L642:
	la a3, .LANCHOR71; lbu a3, 0(a3);
	lla	a2,.LANCHOR270
	add	a2,a2,a3
	lbu	a2,0(a2)
	la a3, .LANCHOR75; lbu a3, 0(a3);
	sw	a2,68(sp)
	lw	a2,0(s0)
	sw	a2,76(sp)
	neg	a2,a3
	slli	a2,a2,24
	seqz	a3,a3
	srai	a2,a2,24
	neg	a3,a3
	sw	a2,64(sp)
	sw	a3,72(sp)
	j	.L233
	.size	subStep0, .-subStep0
	.section	.text.step,"ax",@progbits
	.align	2
	.globl	step
	.hidden	step
	.type	step, @function
step:
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	subStep0
	la a5, .LANCHOR45; lbu a5, 0(a5);
	bne	a5,zero,.L670
.L665:
	lla	a4,.LANCHOR40
	lw	a5,0(a4)
	lw	a2,4(a4)
	lw	ra,8(sp)
	addi	a3,a5,1
	sltu	a5,a3,a5
	add	a5,a5,a2
	sw	a3,0(a4)
	sw	a5,4(a4)
	addi	sp,sp,12
	jr	ra
.L670:
	lla	a5,.LANCHOR41
	lw	a3,0(a5)
	li	a2,-58826752
	lw	a4,4(a5)
	addi	a2,a2,-356
	or	a3,a3,a2
	li	a2,647168
	addi	a2,a2,1844
	or	a4,a4,a2
	sw	a3,0(a5)
	sw	a4,4(a5)
	call	subReset0.part.0
	j	.L665
	.size	step, .-step
	.section	.bss.npc_DOT_icache_DOT_dataRead_s1,"aw",@nobits
	.align	2
	.set	.LANCHOR220,. + 0
	.type	npc_DOT_icache_DOT_dataRead_s1, @object
	.size	npc_DOT_icache_DOT_dataRead_s1, 16
npc_DOT_icache_DOT_dataRead_s1:
	.zero	16
	.section	.bss.npc_DOT_icache_DOT_data_0,"aw",@nobits
	.align	2
	.set	.LANCHOR195,. + 0
	.type	npc_DOT_icache_DOT_data_0, @object
	.size	npc_DOT_icache_DOT_data_0, 16
npc_DOT_icache_DOT_data_0:
	.zero	16
	.section	.bss.npc_DOT_icache_DOT_data_1,"aw",@nobits
	.align	2
	.set	.LANCHOR197,. + 0
	.type	npc_DOT_icache_DOT_data_1, @object
	.size	npc_DOT_icache_DOT_data_1, 16
npc_DOT_icache_DOT_data_1:
	.zero	16
	.section	.bss.npc_DOT_icache_DOT_data_2,"aw",@nobits
	.align	2
	.set	.LANCHOR199,. + 0
	.type	npc_DOT_icache_DOT_data_2, @object
	.size	npc_DOT_icache_DOT_data_2, 16
npc_DOT_icache_DOT_data_2:
	.zero	16
	.section	.bss.npc_DOT_icache_DOT_data_3,"aw",@nobits
	.align	2
	.set	.LANCHOR201,. + 0
	.type	npc_DOT_icache_DOT_data_3, @object
	.size	npc_DOT_icache_DOT_data_3, 16
npc_DOT_icache_DOT_data_3:
	.zero	16
	.section	.bss.npc_DOT_icache_DOT_tag,"aw",@nobits
	.align	2
	.set	.LANCHOR70,. + 0
	.type	npc_DOT_icache_DOT_tag, @object
	.size	npc_DOT_icache_DOT_tag, 16
npc_DOT_icache_DOT_tag:
	.zero	16
	.section	.bss.npc_DOT_idu_DOT_R,"aw",@nobits
	.align	2
	.set	.LANCHOR183,. + 0
	.type	npc_DOT_idu_DOT_R, @object
	.size	npc_DOT_idu_DOT_R, 64
npc_DOT_idu_DOT_R:
	.zero	64
	.section	.sbss.activeFlags,"aw",@nobits
	.align	2
	.set	.LANCHOR41,. + 0
	.type	activeFlags, @object
	.size	activeFlags, 8
activeFlags:
	.zero	8
	.section	.sbss.clock,"aw",@nobits
	.set	.LANCHOR44,. + 0
	.type	clock, @object
	.size	clock, 1
clock:
	.zero	1
	.section	.sbss.cycles,"aw",@nobits
	.align	3
	.set	.LANCHOR40,. + 0
	.type	cycles, @object
	.size	cycles, 8
cycles:
	.zero	8
	.section	.sbss.mem_DOT_axi4memctrl_DOT__io_axi_b_valid_T,"aw",@nobits
	.set	.LANCHOR58,. + 0
	.type	mem_DOT_axi4memctrl_DOT__io_axi_b_valid_T, @object
	.size	mem_DOT_axi4memctrl_DOT__io_axi_b_valid_T, 1
mem_DOT_axi4memctrl_DOT__io_axi_b_valid_T:
	.zero	1
	.section	.sbss.mem_DOT_axi4memctrl_DOT__io_axi_r_bits_last_T,"aw",@nobits
	.set	.LANCHOR268,. + 0
	.type	mem_DOT_axi4memctrl_DOT__io_axi_r_bits_last_T, @object
	.size	mem_DOT_axi4memctrl_DOT__io_axi_r_bits_last_T, 1
mem_DOT_axi4memctrl_DOT__io_axi_r_bits_last_T:
	.zero	1
	.section	.sbss.mem_DOT_axi4memctrl_DOT__io_axi_r_valid_T,"aw",@nobits
	.set	.LANCHOR56,. + 0
	.type	mem_DOT_axi4memctrl_DOT__io_axi_r_valid_T, @object
	.size	mem_DOT_axi4memctrl_DOT__io_axi_r_valid_T, 1
mem_DOT_axi4memctrl_DOT__io_axi_r_valid_T:
	.zero	1
	.section	.sbss.mem_DOT_axi4memctrl_DOT__io_axi_w_ready_T,"aw",@nobits
	.set	.LANCHOR57,. + 0
	.type	mem_DOT_axi4memctrl_DOT__io_axi_w_ready_T, @object
	.size	mem_DOT_axi4memctrl_DOT__io_axi_w_ready_T, 1
mem_DOT_axi4memctrl_DOT__io_axi_w_ready_T:
	.zero	1
	.section	.sbss.mem_DOT_axi4memctrl_DOT_araddrReg,"aw",@nobits
	.align	2
	.set	.LANCHOR276,. + 0
	.type	mem_DOT_axi4memctrl_DOT_araddrReg, @object
	.size	mem_DOT_axi4memctrl_DOT_araddrReg, 4
mem_DOT_axi4memctrl_DOT_araddrReg:
	.zero	4
	.section	.sbss.mem_DOT_axi4memctrl_DOT_arburstCnt,"aw",@nobits
	.set	.LANCHOR269,. + 0
	.type	mem_DOT_axi4memctrl_DOT_arburstCnt, @object
	.size	mem_DOT_axi4memctrl_DOT_arburstCnt, 1
mem_DOT_axi4memctrl_DOT_arburstCnt:
	.zero	1
	.section	.sbss.mem_DOT_axi4memctrl_DOT_arsizeReg,"aw",@nobits
	.set	.LANCHOR281,. + 0
	.type	mem_DOT_axi4memctrl_DOT_arsizeReg, @object
	.size	mem_DOT_axi4memctrl_DOT_arsizeReg, 1
mem_DOT_axi4memctrl_DOT_arsizeReg:
	.zero	1
	.section	.sbss.mem_DOT_axi4memctrl_DOT_arsizeReg_DOT_NEXT,"aw",@nobits
	.set	.LANCHOR213,. + 0
	.type	mem_DOT_axi4memctrl_DOT_arsizeReg_DOT_NEXT, @object
	.size	mem_DOT_axi4memctrl_DOT_arsizeReg_DOT_NEXT, 1
mem_DOT_axi4memctrl_DOT_arsizeReg_DOT_NEXT:
	.zero	1
	.section	.sbss.mem_DOT_axi4memctrl_DOT_awaddrReg,"aw",@nobits
	.align	2
	.set	.LANCHOR266,. + 0
	.type	mem_DOT_axi4memctrl_DOT_awaddrReg, @object
	.size	mem_DOT_axi4memctrl_DOT_awaddrReg, 4
mem_DOT_axi4memctrl_DOT_awaddrReg:
	.zero	4
	.section	.sbss.mem_DOT_axi4memctrl_DOT_awsizeReg,"aw",@nobits
	.set	.LANCHOR265,. + 0
	.type	mem_DOT_axi4memctrl_DOT_awsizeReg, @object
	.size	mem_DOT_axi4memctrl_DOT_awsizeReg, 1
mem_DOT_axi4memctrl_DOT_awsizeReg:
	.zero	1
	.section	.sbss.mem_DOT_axi4memctrl_DOT_awsizeReg_DOT_NEXT,"aw",@nobits
	.set	.LANCHOR145,. + 0
	.type	mem_DOT_axi4memctrl_DOT_awsizeReg_DOT_NEXT, @object
	.size	mem_DOT_axi4memctrl_DOT_awsizeReg_DOT_NEXT, 1
mem_DOT_axi4memctrl_DOT_awsizeReg_DOT_NEXT:
	.zero	1
	.section	.sbss.mem_DOT_axi4memctrl_DOT_state_r,"aw",@nobits
	.set	.LANCHOR37,. + 0
	.type	mem_DOT_axi4memctrl_DOT_state_r, @object
	.size	mem_DOT_axi4memctrl_DOT_state_r, 1
mem_DOT_axi4memctrl_DOT_state_r:
	.zero	1
	.section	.sbss.mem_DOT_axi4memctrl_DOT_state_w,"aw",@nobits
	.set	.LANCHOR38,. + 0
	.type	mem_DOT_axi4memctrl_DOT_state_w, @object
	.size	mem_DOT_axi4memctrl_DOT_state_w, 1
mem_DOT_axi4memctrl_DOT_state_w:
	.zero	1
	.section	.sbss.mem_DOT_axi4memctrl_DOT_state_w_DOT_NEXT,"aw",@nobits
	.set	.LANCHOR39,. + 0
	.type	mem_DOT_axi4memctrl_DOT_state_w_DOT_NEXT, @object
	.size	mem_DOT_axi4memctrl_DOT_state_w_DOT_NEXT, 1
mem_DOT_axi4memctrl_DOT_state_w_DOT_NEXT:
	.zero	1
	.section	.sbss.mem_DOT_dmem_DOT_raddr,"aw",@nobits
	.align	2
	.set	.LANCHOR275,. + 0
	.type	mem_DOT_dmem_DOT_raddr, @object
	.size	mem_DOT_dmem_DOT_raddr, 4
mem_DOT_dmem_DOT_raddr:
	.zero	4
	.section	.sbss.mem_DOT_dmem_DOT_rdata,"aw",@nobits
	.align	2
	.set	.LANCHOR277,. + 0
	.type	mem_DOT_dmem_DOT_rdata, @object
	.size	mem_DOT_dmem_DOT_rdata, 4
mem_DOT_dmem_DOT_rdata:
	.zero	4
	.section	.sbss.mem_DOT_dmem_DOT_ren,"aw",@nobits
	.set	.LANCHOR214,. + 0
	.type	mem_DOT_dmem_DOT_ren, @object
	.size	mem_DOT_dmem_DOT_ren, 1
mem_DOT_dmem_DOT_ren:
	.zero	1
	.section	.sbss.mem_DOT_dmem_DOT_waddr,"aw",@nobits
	.align	2
	.set	.LANCHOR267,. + 0
	.type	mem_DOT_dmem_DOT_waddr, @object
	.size	mem_DOT_dmem_DOT_waddr, 4
mem_DOT_dmem_DOT_waddr:
	.zero	4
	.section	.sbss.mem_DOT_dmem_DOT_wdata,"aw",@nobits
	.align	2
	.set	.LANCHOR153,. + 0
	.type	mem_DOT_dmem_DOT_wdata, @object
	.size	mem_DOT_dmem_DOT_wdata, 4
mem_DOT_dmem_DOT_wdata:
	.zero	4
	.section	.sbss.mem_DOT_dmem_DOT_wen,"aw",@nobits
	.set	.LANCHOR124,. + 0
	.type	mem_DOT_dmem_DOT_wen, @object
	.size	mem_DOT_dmem_DOT_wen, 1
mem_DOT_dmem_DOT_wen:
	.zero	1
	.section	.sbss.mem_DOT_dmem_DOT_wmask,"aw",@nobits
	.set	.LANCHOR147,. + 0
	.type	mem_DOT_dmem_DOT_wmask, @object
	.size	mem_DOT_dmem_DOT_wmask, 1
mem_DOT_dmem_DOT_wmask:
	.zero	1
	.section	.sbss.npc_DOT__exu_io_in_valid_T,"aw",@nobits
	.set	.LANCHOR236,. + 0
	.type	npc_DOT__exu_io_in_valid_T, @object
	.size	npc_DOT__exu_io_in_valid_T, 1
npc_DOT__exu_io_in_valid_T:
	.zero	1
	.section	.sbss.npc_DOT__lsu_io_in_valid_T,"aw",@nobits
	.set	.LANCHOR137,. + 0
	.type	npc_DOT__lsu_io_in_valid_T, @object
	.size	npc_DOT__lsu_io_in_valid_T, 1
npc_DOT__lsu_io_in_valid_T:
	.zero	1
	.section	.sbss.npc_DOT_clint_DOT_cnt,"aw",@nobits
	.align	3
	.set	.LANCHOR32,. + 0
	.type	npc_DOT_clint_DOT_cnt, @object
	.size	npc_DOT_clint_DOT_cnt, 8
npc_DOT_clint_DOT_cnt:
	.zero	8
	.section	.sbss.npc_DOT_clint_DOT_cnt_DOT_NEXT,"aw",@nobits
	.align	3
	.set	.LANCHOR33,. + 0
	.type	npc_DOT_clint_DOT_cnt_DOT_NEXT, @object
	.size	npc_DOT_clint_DOT_cnt_DOT_NEXT, 8
npc_DOT_clint_DOT_cnt_DOT_NEXT:
	.zero	8
	.section	.sbss.npc_DOT_clint_DOT_incCond_c_value,"aw",@nobits
	.set	.LANCHOR34,. + 0
	.type	npc_DOT_clint_DOT_incCond_c_value, @object
	.size	npc_DOT_clint_DOT_incCond_c_value, 1
npc_DOT_clint_DOT_incCond_c_value:
	.zero	1
	.section	.sbss.npc_DOT_clint_DOT_isMtimeReg,"aw",@nobits
	.set	.LANCHOR280,. + 0
	.type	npc_DOT_clint_DOT_isMtimeReg, @object
	.size	npc_DOT_clint_DOT_isMtimeReg, 1
npc_DOT_clint_DOT_isMtimeReg:
	.zero	1
	.section	.sbss.npc_DOT_clint_DOT_isMtimeReg_DOT_NEXT,"aw",@nobits
	.set	.LANCHOR50,. + 0
	.type	npc_DOT_clint_DOT_isMtimeReg_DOT_NEXT, @object
	.size	npc_DOT_clint_DOT_isMtimeReg_DOT_NEXT, 1
npc_DOT_clint_DOT_isMtimeReg_DOT_NEXT:
	.zero	1
	.section	.sbss.npc_DOT_clint_DOT_isMtimehReg,"aw",@nobits
	.set	.LANCHOR279,. + 0
	.type	npc_DOT_clint_DOT_isMtimehReg, @object
	.size	npc_DOT_clint_DOT_isMtimehReg, 1
npc_DOT_clint_DOT_isMtimehReg:
	.zero	1
	.section	.sbss.npc_DOT_clint_DOT_isMtimehReg_DOT_NEXT,"aw",@nobits
	.set	.LANCHOR49,. + 0
	.type	npc_DOT_clint_DOT_isMtimehReg_DOT_NEXT, @object
	.size	npc_DOT_clint_DOT_isMtimehReg_DOT_NEXT, 1
npc_DOT_clint_DOT_isMtimehReg_DOT_NEXT:
	.zero	1
	.section	.sbss.npc_DOT_clint_DOT_state,"aw",@nobits
	.set	.LANCHOR35,. + 0
	.type	npc_DOT_clint_DOT_state, @object
	.size	npc_DOT_clint_DOT_state, 1
npc_DOT_clint_DOT_state:
	.zero	1
	.section	.sbss.npc_DOT_clint_DOT_state_DOT_NEXT,"aw",@nobits
	.set	.LANCHOR36,. + 0
	.type	npc_DOT_clint_DOT_state_DOT_NEXT, @object
	.size	npc_DOT_clint_DOT_state_DOT_NEXT, 1
npc_DOT_clint_DOT_state_DOT_NEXT:
	.zero	1
	.section	.sbss.npc_DOT_deq_q_DOT__empty_T,"aw",@nobits
	.set	.LANCHOR52,. + 0
	.type	npc_DOT_deq_q_DOT__empty_T, @object
	.size	npc_DOT_deq_q_DOT__empty_T, 1
npc_DOT_deq_q_DOT__empty_T:
	.zero	1
	.section	.sbss.npc_DOT_deq_q_DOT_io_DOT__DOT_deq_DOT__DOT_valid,"aw",@nobits
	.set	.LANCHOR224,. + 0
	.type	npc_DOT_deq_q_DOT_io_DOT__DOT_deq_DOT__DOT_valid, @object
	.size	npc_DOT_deq_q_DOT_io_DOT__DOT_deq_DOT__DOT_valid, 1
npc_DOT_deq_q_DOT_io_DOT__DOT_deq_DOT__DOT_valid:
	.zero	1
	.section	.sbss.npc_DOT_deq_q_DOT_maybe_full,"aw",@nobits
	.set	.LANCHOR12,. + 0
	.type	npc_DOT_deq_q_DOT_maybe_full, @object
	.size	npc_DOT_deq_q_DOT_maybe_full, 1
npc_DOT_deq_q_DOT_maybe_full:
	.zero	1
	.section	.sbss.npc_DOT_deq_q_DOT_ram_DOT__DOT_inst,"aw",@nobits
	.align	2
	.set	.LANCHOR238,. + 0
	.type	npc_DOT_deq_q_DOT_ram_DOT__DOT_inst, @object
	.size	npc_DOT_deq_q_DOT_ram_DOT__DOT_inst, 4
npc_DOT_deq_q_DOT_ram_DOT__DOT_inst:
	.zero	4
	.section	.sbss.npc_DOT_deq_q_DOT_ram_DOT__DOT_inst_DOT_NEXT,"aw",@nobits
	.align	2
	.set	.LANCHOR242,. + 0
	.type	npc_DOT_deq_q_DOT_ram_DOT__DOT_inst_DOT_NEXT, @object
	.size	npc_DOT_deq_q_DOT_ram_DOT__DOT_inst_DOT_NEXT, 4
npc_DOT_deq_q_DOT_ram_DOT__DOT_inst_DOT_NEXT:
	.zero	4
	.section	.sbss.npc_DOT_deq_q_DOT_ram_DOT__DOT_pc,"aw",@nobits
	.align	2
	.set	.LANCHOR237,. + 0
	.type	npc_DOT_deq_q_DOT_ram_DOT__DOT_pc, @object
	.size	npc_DOT_deq_q_DOT_ram_DOT__DOT_pc, 4
npc_DOT_deq_q_DOT_ram_DOT__DOT_pc:
	.zero	4
	.section	.sbss.npc_DOT_deq_q_DOT_ram_DOT__DOT_pc_DOT_NEXT,"aw",@nobits
	.align	2
	.set	.LANCHOR241,. + 0
	.type	npc_DOT_deq_q_DOT_ram_DOT__DOT_pc_DOT_NEXT, @object
	.size	npc_DOT_deq_q_DOT_ram_DOT__DOT_pc_DOT_NEXT, 4
npc_DOT_deq_q_DOT_ram_DOT__DOT_pc_DOT_NEXT:
	.zero	4
	.section	.sbss.npc_DOT_exu_DOT__aluOut_T_29,"aw",@nobits
	.align	2
	.set	.LANCHOR249,. + 0
	.type	npc_DOT_exu_DOT__aluOut_T_29, @object
	.size	npc_DOT_exu_DOT__aluOut_T_29, 4
npc_DOT_exu_DOT__aluOut_T_29:
	.zero	4
	.section	.sbss.npc_DOT_exu_DOT_slt,"aw",@nobits
	.set	.LANCHOR246,. + 0
	.type	npc_DOT_exu_DOT_slt, @object
	.size	npc_DOT_exu_DOT_slt, 1
npc_DOT_exu_DOT_slt:
	.zero	1
	.section	.sbss.npc_DOT_exu_DOT_sltu,"aw",@nobits
	.set	.LANCHOR245,. + 0
	.type	npc_DOT_exu_DOT_sltu, @object
	.size	npc_DOT_exu_DOT_sltu, 1
npc_DOT_exu_DOT_sltu:
	.zero	1
	.section	.sbss.npc_DOT_exu_DOT_sum,"aw",@nobits
	.align	2
	.set	.LANCHOR244,. + 0
	.type	npc_DOT_exu_DOT_sum, @object
	.size	npc_DOT_exu_DOT_sum, 4
npc_DOT_exu_DOT_sum:
	.zero	4
	.section	.sbss.npc_DOT_exu_DOT_xor,"aw",@nobits
	.align	2
	.set	.LANCHOR232,. + 0
	.type	npc_DOT_exu_DOT_xor, @object
	.size	npc_DOT_exu_DOT_xor, 4
npc_DOT_exu_DOT_xor:
	.zero	4
	.section	.sbss.npc_DOT_exu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_aluop_isAdd,"aw",@nobits
	.set	.LANCHOR243,. + 0
	.type	npc_DOT_exu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_aluop_isAdd, @object
	.size	npc_DOT_exu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_aluop_isAdd, 1
npc_DOT_exu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_aluop_isAdd:
	.zero	1
	.section	.sbss.npc_DOT_exu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_csrWen,"aw",@nobits
	.set	.LANCHOR255,. + 0
	.type	npc_DOT_exu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_csrWen, @object
	.size	npc_DOT_exu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_csrWen, 1
npc_DOT_exu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_csrWen:
	.zero	1
	.section	.sbss.npc_DOT_exu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_funct3,"aw",@nobits
	.set	.LANCHOR247,. + 0
	.type	npc_DOT_exu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_funct3, @object
	.size	npc_DOT_exu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_funct3, 1
npc_DOT_exu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_funct3:
	.zero	1
	.section	.sbss.npc_DOT_exu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_illegal,"aw",@nobits
	.set	.LANCHOR256,. + 0
	.type	npc_DOT_exu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_illegal, @object
	.size	npc_DOT_exu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_illegal, 1
npc_DOT_exu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_illegal:
	.zero	1
	.section	.sbss.npc_DOT_exu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_isArithShift,"aw",@nobits
	.set	.LANCHOR248,. + 0
	.type	npc_DOT_exu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_isArithShift, @object
	.size	npc_DOT_exu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_isArithShift, 1
npc_DOT_exu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_isArithShift:
	.zero	1
	.section	.sbss.npc_DOT_exu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_isBranch,"aw",@nobits
	.set	.LANCHOR261,. + 0
	.type	npc_DOT_exu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_isBranch, @object
	.size	npc_DOT_exu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_isBranch, 1
npc_DOT_exu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_isBranch:
	.zero	1
	.section	.sbss.npc_DOT_exu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_isCSR,"aw",@nobits
	.set	.LANCHOR226,. + 0
	.type	npc_DOT_exu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_isCSR, @object
	.size	npc_DOT_exu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_isCSR, 1
npc_DOT_exu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_isCSR:
	.zero	1
	.section	.sbss.npc_DOT_exu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_isEcall,"aw",@nobits
	.set	.LANCHOR258,. + 0
	.type	npc_DOT_exu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_isEcall, @object
	.size	npc_DOT_exu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_isEcall, 1
npc_DOT_exu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_isEcall:
	.zero	1
	.section	.sbss.npc_DOT_exu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_isFencei,"aw",@nobits
	.set	.LANCHOR262,. + 0
	.type	npc_DOT_exu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_isFencei, @object
	.size	npc_DOT_exu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_isFencei, 1
npc_DOT_exu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_isFencei:
	.zero	1
	.section	.sbss.npc_DOT_exu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_isFencei_DOT_NEXT,"aw",@nobits
	.set	.LANCHOR264,. + 0
	.type	npc_DOT_exu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_isFencei_DOT_NEXT, @object
	.size	npc_DOT_exu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_isFencei_DOT_NEXT, 1
npc_DOT_exu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_isFencei_DOT_NEXT:
	.zero	1
	.section	.sbss.npc_DOT_exu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_isJmp,"aw",@nobits
	.set	.LANCHOR227,. + 0
	.type	npc_DOT_exu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_isJmp, @object
	.size	npc_DOT_exu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_isJmp, 1
npc_DOT_exu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_isJmp:
	.zero	1
	.section	.sbss.npc_DOT_exu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_isLoad,"aw",@nobits
	.set	.LANCHOR225,. + 0
	.type	npc_DOT_exu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_isLoad, @object
	.size	npc_DOT_exu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_isLoad, 1
npc_DOT_exu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_isLoad:
	.zero	1
	.section	.sbss.npc_DOT_exu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_isMret,"aw",@nobits
	.set	.LANCHOR257,. + 0
	.type	npc_DOT_exu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_isMret, @object
	.size	npc_DOT_exu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_isMret, 1
npc_DOT_exu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_isMret:
	.zero	1
	.section	.sbss.npc_DOT_exu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_isStore,"aw",@nobits
	.set	.LANCHOR259,. + 0
	.type	npc_DOT_exu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_isStore, @object
	.size	npc_DOT_exu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_isStore, 1
npc_DOT_exu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_isStore:
	.zero	1
	.section	.sbss.npc_DOT_exu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_code,"aw",@nobits
	.align	2
	.set	.LANCHOR251,. + 0
	.type	npc_DOT_exu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_code, @object
	.size	npc_DOT_exu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_code, 4
npc_DOT_exu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_code:
	.zero	4
	.section	.sbss.npc_DOT_exu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_dnpc,"aw",@nobits
	.align	2
	.set	.LANCHOR253,. + 0
	.type	npc_DOT_exu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_dnpc, @object
	.size	npc_DOT_exu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_dnpc, 4
npc_DOT_exu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_dnpc:
	.zero	4
	.section	.sbss.npc_DOT_exu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_isEbreak,"aw",@nobits
	.set	.LANCHOR252,. + 0
	.type	npc_DOT_exu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_isEbreak, @object
	.size	npc_DOT_exu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_isEbreak, 1
npc_DOT_exu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_isEbreak:
	.zero	1
	.section	.sbss.npc_DOT_exu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_pc,"aw",@nobits
	.align	2
	.set	.LANCHOR254,. + 0
	.type	npc_DOT_exu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_pc, @object
	.size	npc_DOT_exu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_pc, 4
npc_DOT_exu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_pc:
	.zero	4
	.section	.sbss.npc_DOT_exu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_skip,"aw",@nobits
	.set	.LANCHOR250,. + 0
	.type	npc_DOT_exu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_skip, @object
	.size	npc_DOT_exu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_skip, 1
npc_DOT_exu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_skip:
	.zero	1
	.section	.sbss.npc_DOT_exu_io_in_bits_r_DOT__DOT_rd,"aw",@nobits
	.set	.LANCHOR228,. + 0
	.type	npc_DOT_exu_io_in_bits_r_DOT__DOT_rd, @object
	.size	npc_DOT_exu_io_in_bits_r_DOT__DOT_rd, 1
npc_DOT_exu_io_in_bits_r_DOT__DOT_rd:
	.zero	1
	.section	.sbss.npc_DOT_exu_io_in_bits_r_DOT__DOT_src1,"aw",@nobits
	.align	2
	.set	.LANCHOR233,. + 0
	.type	npc_DOT_exu_io_in_bits_r_DOT__DOT_src1, @object
	.size	npc_DOT_exu_io_in_bits_r_DOT__DOT_src1, 4
npc_DOT_exu_io_in_bits_r_DOT__DOT_src1:
	.zero	4
	.section	.sbss.npc_DOT_exu_io_in_bits_r_DOT__DOT_src2,"aw",@nobits
	.align	2
	.set	.LANCHOR234,. + 0
	.type	npc_DOT_exu_io_in_bits_r_DOT__DOT_src2, @object
	.size	npc_DOT_exu_io_in_bits_r_DOT__DOT_src2, 4
npc_DOT_exu_io_in_bits_r_DOT__DOT_src2:
	.zero	4
	.section	.sbss.npc_DOT_exu_io_in_bits_r_DOT__DOT_src3,"aw",@nobits
	.align	2
	.set	.LANCHOR260,. + 0
	.type	npc_DOT_exu_io_in_bits_r_DOT__DOT_src3, @object
	.size	npc_DOT_exu_io_in_bits_r_DOT__DOT_src3, 4
npc_DOT_exu_io_in_bits_r_DOT__DOT_src3:
	.zero	4
	.section	.sbss.npc_DOT_exu_io_in_bits_r_DOT__DOT_wen,"aw",@nobits
	.set	.LANCHOR229,. + 0
	.type	npc_DOT_exu_io_in_bits_r_DOT__DOT_wen, @object
	.size	npc_DOT_exu_io_in_bits_r_DOT__DOT_wen, 1
npc_DOT_exu_io_in_bits_r_DOT__DOT_wen:
	.zero	1
	.section	.sbss.npc_DOT_exu_io_in_valid_REG,"aw",@nobits
	.set	.LANCHOR15,. + 0
	.type	npc_DOT_exu_io_in_valid_REG, @object
	.size	npc_DOT_exu_io_in_valid_REG, 1
npc_DOT_exu_io_in_valid_REG:
	.zero	1
	.section	.sbss.npc_DOT_exu_io_in_valid_REG_DOT_NEXT,"aw",@nobits
	.set	.LANCHOR16,. + 0
	.type	npc_DOT_exu_io_in_valid_REG_DOT_NEXT, @object
	.size	npc_DOT_exu_io_in_valid_REG_DOT_NEXT, 1
npc_DOT_exu_io_in_valid_REG_DOT_NEXT:
	.zero	1
	.section	.sbss.npc_DOT_icache_DOT__idx_s0_T_2,"aw",@nobits
	.set	.LANCHOR68,. + 0
	.type	npc_DOT_icache_DOT__idx_s0_T_2, @object
	.size	npc_DOT_icache_DOT__idx_s0_T_2, 1
npc_DOT_icache_DOT__idx_s0_T_2:
	.zero	1
	.section	.sbss.npc_DOT_icache_DOT__idx_s1_T_2,"aw",@nobits
	.set	.LANCHOR193,. + 0
	.type	npc_DOT_icache_DOT__idx_s1_T_2, @object
	.size	npc_DOT_icache_DOT__idx_s1_T_2, 1
npc_DOT_icache_DOT__idx_s1_T_2:
	.zero	1
	.section	.sbss.npc_DOT_icache_DOT__io_core_resp_valid_T_2,"aw",@nobits
	.set	.LANCHOR221,. + 0
	.type	npc_DOT_icache_DOT__io_core_resp_valid_T_2, @object
	.size	npc_DOT_icache_DOT__io_core_resp_valid_T_2, 1
npc_DOT_icache_DOT__io_core_resp_valid_T_2:
	.zero	1
	.section	.sbss.npc_DOT_icache_DOT__io_mem_r_ready_T,"aw",@nobits
	.set	.LANCHOR53,. + 0
	.type	npc_DOT_icache_DOT__io_mem_r_ready_T, @object
	.size	npc_DOT_icache_DOT__io_mem_r_ready_T, 1
npc_DOT_icache_DOT__io_mem_r_ready_T:
	.zero	1
	.section	.sbss.npc_DOT_icache_DOT__resFromMem_T,"aw",@nobits
	.set	.LANCHOR74,. + 0
	.type	npc_DOT_icache_DOT__resFromMem_T, @object
	.size	npc_DOT_icache_DOT__resFromMem_T, 1
npc_DOT_icache_DOT__resFromMem_T:
	.zero	1
	.section	.sbss.npc_DOT_icache_DOT__res_T_3,"aw",@nobits
	.align	2
	.set	.LANCHOR222,. + 0
	.type	npc_DOT_icache_DOT__res_T_3, @object
	.size	npc_DOT_icache_DOT__res_T_3, 4
npc_DOT_icache_DOT__res_T_3:
	.zero	4
	.section	.sbss.npc_DOT_icache_DOT__s1_in_ready_T_5,"aw",@nobits
	.set	.LANCHOR217,. + 0
	.type	npc_DOT_icache_DOT__s1_in_ready_T_5, @object
	.size	npc_DOT_icache_DOT__s1_in_ready_T_5, 1
npc_DOT_icache_DOT__s1_in_ready_T_5:
	.zero	1
	.section	.sbss.npc_DOT_icache_DOT__tag_s1_T_3,"aw",@nobits
	.align	2
	.set	.LANCHOR192,. + 0
	.type	npc_DOT_icache_DOT__tag_s1_T_3, @object
	.size	npc_DOT_icache_DOT__tag_s1_T_3, 4
npc_DOT_icache_DOT__tag_s1_T_3:
	.zero	4
	.section	.sbss.npc_DOT_icache_DOT__wordIdx_s1_T_1,"aw",@nobits
	.set	.LANCHOR202,. + 0
	.type	npc_DOT_icache_DOT__wordIdx_s1_T_1, @object
	.size	npc_DOT_icache_DOT__wordIdx_s1_T_1, 1
npc_DOT_icache_DOT__wordIdx_s1_T_1:
	.zero	1
	.section	.sbss.npc_DOT_icache_DOT_beatCnt_value,"aw",@nobits
	.set	.LANCHOR21,. + 0
	.type	npc_DOT_icache_DOT_beatCnt_value, @object
	.size	npc_DOT_icache_DOT_beatCnt_value, 1
npc_DOT_icache_DOT_beatCnt_value:
	.zero	1
	.section	.sbss.npc_DOT_icache_DOT_beatCnt_value_DOT_NEXT,"aw",@nobits
	.set	.LANCHOR22,. + 0
	.type	npc_DOT_icache_DOT_beatCnt_value_DOT_NEXT, @object
	.size	npc_DOT_icache_DOT_beatCnt_value_DOT_NEXT, 1
npc_DOT_icache_DOT_beatCnt_value_DOT_NEXT:
	.zero	1
	.section	.sbss.npc_DOT_icache_DOT_dataRead_s1_MPORT,"aw",@nobits
	.align	2
	.set	.LANCHOR194,. + 0
	.type	npc_DOT_icache_DOT_dataRead_s1_MPORT, @object
	.size	npc_DOT_icache_DOT_dataRead_s1_MPORT, 4
npc_DOT_icache_DOT_dataRead_s1_MPORT:
	.zero	4
	.section	.sbss.npc_DOT_icache_DOT_dataRead_s1_MPORT_1,"aw",@nobits
	.align	2
	.set	.LANCHOR196,. + 0
	.type	npc_DOT_icache_DOT_dataRead_s1_MPORT_1, @object
	.size	npc_DOT_icache_DOT_dataRead_s1_MPORT_1, 4
npc_DOT_icache_DOT_dataRead_s1_MPORT_1:
	.zero	4
	.section	.sbss.npc_DOT_icache_DOT_dataRead_s1_MPORT_2,"aw",@nobits
	.align	2
	.set	.LANCHOR198,. + 0
	.type	npc_DOT_icache_DOT_dataRead_s1_MPORT_2, @object
	.size	npc_DOT_icache_DOT_dataRead_s1_MPORT_2, 4
npc_DOT_icache_DOT_dataRead_s1_MPORT_2:
	.zero	4
	.section	.sbss.npc_DOT_icache_DOT_dataRead_s1_MPORT_3,"aw",@nobits
	.align	2
	.set	.LANCHOR200,. + 0
	.type	npc_DOT_icache_DOT_dataRead_s1_MPORT_3, @object
	.size	npc_DOT_icache_DOT_dataRead_s1_MPORT_3, 4
npc_DOT_icache_DOT_dataRead_s1_MPORT_3:
	.zero	4
	.section	.sbss.npc_DOT_icache_DOT_flushReg,"aw",@nobits
	.set	.LANCHOR24,. + 0
	.type	npc_DOT_icache_DOT_flushReg, @object
	.size	npc_DOT_icache_DOT_flushReg, 1
npc_DOT_icache_DOT_flushReg:
	.zero	1
	.section	.sbss.npc_DOT_icache_DOT_flushReg_DOT_NEXT,"aw",@nobits
	.set	.LANCHOR25,. + 0
	.type	npc_DOT_icache_DOT_flushReg_DOT_NEXT, @object
	.size	npc_DOT_icache_DOT_flushReg_DOT_NEXT, 1
npc_DOT_icache_DOT_flushReg_DOT_NEXT:
	.zero	1
	.section	.sbss.npc_DOT_icache_DOT_reqValid,"aw",@nobits
	.set	.LANCHOR140,. + 0
	.type	npc_DOT_icache_DOT_reqValid, @object
	.size	npc_DOT_icache_DOT_reqValid, 1
npc_DOT_icache_DOT_reqValid:
	.zero	1
	.section	.sbss.npc_DOT_icache_DOT_resFromMem,"aw",@nobits
	.align	2
	.set	.LANCHOR223,. + 0
	.type	npc_DOT_icache_DOT_resFromMem, @object
	.size	npc_DOT_icache_DOT_resFromMem, 4
npc_DOT_icache_DOT_resFromMem:
	.zero	4
	.section	.sbss.npc_DOT_icache_DOT_s0_out_bits_tagRead_MPORT,"aw",@nobits
	.align	2
	.set	.LANCHOR69,. + 0
	.type	npc_DOT_icache_DOT_s0_out_bits_tagRead_MPORT, @object
	.size	npc_DOT_icache_DOT_s0_out_bits_tagRead_MPORT, 4
npc_DOT_icache_DOT_s0_out_bits_tagRead_MPORT:
	.zero	4
	.section	.sbss.npc_DOT_icache_DOT_s1_in_bits_r_DOT__DOT_hit,"aw",@nobits
	.set	.LANCHOR190,. + 0
	.type	npc_DOT_icache_DOT_s1_in_bits_r_DOT__DOT_hit, @object
	.size	npc_DOT_icache_DOT_s1_in_bits_r_DOT__DOT_hit, 1
npc_DOT_icache_DOT_s1_in_bits_r_DOT__DOT_hit:
	.zero	1
	.section	.sbss.npc_DOT_icache_DOT_s1_in_bits_r_DOT__DOT_hit_DOT_NEXT,"aw",@nobits
	.set	.LANCHOR219,. + 0
	.type	npc_DOT_icache_DOT_s1_in_bits_r_DOT__DOT_hit_DOT_NEXT, @object
	.size	npc_DOT_icache_DOT_s1_in_bits_r_DOT__DOT_hit_DOT_NEXT, 1
npc_DOT_icache_DOT_s1_in_bits_r_DOT__DOT_hit_DOT_NEXT:
	.zero	1
	.section	.sbss.npc_DOT_icache_DOT_s1_in_bits_r_DOT__DOT_mmio,"aw",@nobits
	.set	.LANCHOR188,. + 0
	.type	npc_DOT_icache_DOT_s1_in_bits_r_DOT__DOT_mmio, @object
	.size	npc_DOT_icache_DOT_s1_in_bits_r_DOT__DOT_mmio, 1
npc_DOT_icache_DOT_s1_in_bits_r_DOT__DOT_mmio:
	.zero	1
	.section	.sbss.npc_DOT_icache_DOT_s1_in_bits_r_DOT__DOT_mmio_DOT_NEXT,"aw",@nobits
	.set	.LANCHOR218,. + 0
	.type	npc_DOT_icache_DOT_s1_in_bits_r_DOT__DOT_mmio_DOT_NEXT, @object
	.size	npc_DOT_icache_DOT_s1_in_bits_r_DOT__DOT_mmio_DOT_NEXT, 1
npc_DOT_icache_DOT_s1_in_bits_r_DOT__DOT_mmio_DOT_NEXT:
	.zero	1
	.section	.sbss.npc_DOT_icache_DOT_s1_in_bits_r_DOT__DOT_req_DOT__DOT_addr,"aw",@nobits
	.align	2
	.set	.LANCHOR191,. + 0
	.type	npc_DOT_icache_DOT_s1_in_bits_r_DOT__DOT_req_DOT__DOT_addr, @object
	.size	npc_DOT_icache_DOT_s1_in_bits_r_DOT__DOT_req_DOT__DOT_addr, 4
npc_DOT_icache_DOT_s1_in_bits_r_DOT__DOT_req_DOT__DOT_addr:
	.zero	4
	.section	.sbss.npc_DOT_icache_DOT_s1_in_valid_REG,"aw",@nobits
	.set	.LANCHOR20,. + 0
	.type	npc_DOT_icache_DOT_s1_in_valid_REG, @object
	.size	npc_DOT_icache_DOT_s1_in_valid_REG, 1
npc_DOT_icache_DOT_s1_in_valid_REG:
	.zero	1
	.section	.sbss.npc_DOT_icache_DOT_s1_ok,"aw",@nobits
	.set	.LANCHOR216,. + 0
	.type	npc_DOT_icache_DOT_s1_ok, @object
	.size	npc_DOT_icache_DOT_s1_ok, 1
npc_DOT_icache_DOT_s1_ok:
	.zero	1
	.section	.sbss.npc_DOT_icache_DOT_state,"aw",@nobits
	.set	.LANCHOR23,. + 0
	.type	npc_DOT_icache_DOT_state, @object
	.size	npc_DOT_icache_DOT_state, 1
npc_DOT_icache_DOT_state:
	.zero	1
	.section	.sbss.npc_DOT_icache_DOT_valid,"aw",@nobits
	.set	.LANCHOR19,. + 0
	.type	npc_DOT_icache_DOT_valid, @object
	.size	npc_DOT_icache_DOT_valid, 1
npc_DOT_icache_DOT_valid:
	.zero	1
	.section	.sbss.npc_DOT_idu_DOT_MPORT,"aw",@nobits
	.align	2
	.set	.LANCHOR185,. + 0
	.type	npc_DOT_idu_DOT_MPORT, @object
	.size	npc_DOT_idu_DOT_MPORT, 4
npc_DOT_idu_DOT_MPORT:
	.zero	4
	.section	.sbss.npc_DOT_idu_DOT_MPORT_1,"aw",@nobits
	.align	2
	.set	.LANCHOR182,. + 0
	.type	npc_DOT_idu_DOT_MPORT_1, @object
	.size	npc_DOT_idu_DOT_MPORT_1, 4
npc_DOT_idu_DOT_MPORT_1:
	.zero	4
	.section	.sbss.npc_DOT_idu_DOT__isStype_T,"aw",@nobits
	.set	.LANCHOR172,. + 0
	.type	npc_DOT_idu_DOT__isStype_T, @object
	.size	npc_DOT_idu_DOT__isStype_T, 1
npc_DOT_idu_DOT__isStype_T:
	.zero	1
	.section	.sbss.npc_DOT_idu_DOT__rs1_T_1,"aw",@nobits
	.set	.LANCHOR180,. + 0
	.type	npc_DOT_idu_DOT__rs1_T_1, @object
	.size	npc_DOT_idu_DOT__rs1_T_1, 1
npc_DOT_idu_DOT__rs1_T_1:
	.zero	1
	.section	.sbss.npc_DOT_idu_DOT__rs2_T_1,"aw",@nobits
	.set	.LANCHOR181,. + 0
	.type	npc_DOT_idu_DOT__rs2_T_1, @object
	.size	npc_DOT_idu_DOT__rs2_T_1, 1
npc_DOT_idu_DOT__rs2_T_1:
	.zero	1
	.section	.sbss.npc_DOT_idu_DOT_canIssue,"aw",@nobits
	.set	.LANCHOR235,. + 0
	.type	npc_DOT_idu_DOT_canIssue, @object
	.size	npc_DOT_idu_DOT_canIssue, 1
npc_DOT_idu_DOT_canIssue:
	.zero	1
	.section	.sbss.npc_DOT_idu_DOT_exCanFwRs1,"aw",@nobits
	.set	.LANCHOR230,. + 0
	.type	npc_DOT_idu_DOT_exCanFwRs1, @object
	.size	npc_DOT_idu_DOT_exCanFwRs1, 1
npc_DOT_idu_DOT_exCanFwRs1:
	.zero	1
	.section	.sbss.npc_DOT_idu_DOT_exCanFwRs2,"aw",@nobits
	.set	.LANCHOR231,. + 0
	.type	npc_DOT_idu_DOT_exCanFwRs2, @object
	.size	npc_DOT_idu_DOT_exCanFwRs2, 1
npc_DOT_idu_DOT_exCanFwRs2:
	.zero	1
	.section	.sbss.npc_DOT_idu_DOT_isBtype,"aw",@nobits
	.set	.LANCHOR175,. + 0
	.type	npc_DOT_idu_DOT_isBtype, @object
	.size	npc_DOT_idu_DOT_isBtype, 1
npc_DOT_idu_DOT_isBtype:
	.zero	1
	.section	.sbss.npc_DOT_idu_DOT_isEbreak,"aw",@nobits
	.set	.LANCHOR170,. + 0
	.type	npc_DOT_idu_DOT_isEbreak, @object
	.size	npc_DOT_idu_DOT_isEbreak, 1
npc_DOT_idu_DOT_isEbreak:
	.zero	1
	.section	.sbss.npc_DOT_idu_DOT_isJtype,"aw",@nobits
	.set	.LANCHOR173,. + 0
	.type	npc_DOT_idu_DOT_isJtype, @object
	.size	npc_DOT_idu_DOT_isJtype, 1
npc_DOT_idu_DOT_isJtype:
	.zero	1
	.section	.sbss.npc_DOT_idu_DOT_isRtype,"aw",@nobits
	.set	.LANCHOR176,. + 0
	.type	npc_DOT_idu_DOT_isRtype, @object
	.size	npc_DOT_idu_DOT_isRtype, 1
npc_DOT_idu_DOT_isRtype:
	.zero	1
	.section	.sbss.npc_DOT_idu_DOT_isStype,"aw",@nobits
	.set	.LANCHOR174,. + 0
	.type	npc_DOT_idu_DOT_isStype, @object
	.size	npc_DOT_idu_DOT_isStype, 1
npc_DOT_idu_DOT_isStype:
	.zero	1
	.section	.sbss.npc_DOT_idu_DOT_isUtype,"aw",@nobits
	.set	.LANCHOR178,. + 0
	.type	npc_DOT_idu_DOT_isUtype, @object
	.size	npc_DOT_idu_DOT_isUtype, 1
npc_DOT_idu_DOT_isUtype:
	.zero	1
	.section	.sbss.npc_DOT_idu_DOT_lsCanFwRs1,"aw",@nobits
	.set	.LANCHOR186,. + 0
	.type	npc_DOT_idu_DOT_lsCanFwRs1, @object
	.size	npc_DOT_idu_DOT_lsCanFwRs1, 1
npc_DOT_idu_DOT_lsCanFwRs1:
	.zero	1
	.section	.sbss.npc_DOT_idu_DOT_lsCanFwRs2,"aw",@nobits
	.set	.LANCHOR184,. + 0
	.type	npc_DOT_idu_DOT_lsCanFwRs2, @object
	.size	npc_DOT_idu_DOT_lsCanFwRs2, 1
npc_DOT_idu_DOT_lsCanFwRs2:
	.zero	1
	.section	.sbss.npc_DOT_idu_DOT_src1UseReg,"aw",@nobits
	.set	.LANCHOR179,. + 0
	.type	npc_DOT_idu_DOT_src1UseReg, @object
	.size	npc_DOT_idu_DOT_src1UseReg, 1
npc_DOT_idu_DOT_src1UseReg:
	.zero	1
	.section	.sbss.npc_DOT_idu_DOT_src2UseReg,"aw",@nobits
	.set	.LANCHOR177,. + 0
	.type	npc_DOT_idu_DOT_src2UseReg, @object
	.size	npc_DOT_idu_DOT_src2UseReg, 1
npc_DOT_idu_DOT_src2UseReg:
	.zero	1
	.section	.sbss.npc_DOT_idu_io_in_bits_r_DOT__DOT_inst,"aw",@nobits
	.align	2
	.set	.LANCHOR171,. + 0
	.type	npc_DOT_idu_io_in_bits_r_DOT__DOT_inst, @object
	.size	npc_DOT_idu_io_in_bits_r_DOT__DOT_inst, 4
npc_DOT_idu_io_in_bits_r_DOT__DOT_inst:
	.zero	4
	.section	.sbss.npc_DOT_idu_io_in_bits_r_DOT__DOT_inst_DOT_NEXT,"aw",@nobits
	.align	2
	.set	.LANCHOR239,. + 0
	.type	npc_DOT_idu_io_in_bits_r_DOT__DOT_inst_DOT_NEXT, @object
	.size	npc_DOT_idu_io_in_bits_r_DOT__DOT_inst_DOT_NEXT, 4
npc_DOT_idu_io_in_bits_r_DOT__DOT_inst_DOT_NEXT:
	.zero	4
	.section	.sbss.npc_DOT_idu_io_in_bits_r_DOT__DOT_pc,"aw",@nobits
	.align	2
	.set	.LANCHOR263,. + 0
	.type	npc_DOT_idu_io_in_bits_r_DOT__DOT_pc, @object
	.size	npc_DOT_idu_io_in_bits_r_DOT__DOT_pc, 4
npc_DOT_idu_io_in_bits_r_DOT__DOT_pc:
	.zero	4
	.section	.sbss.npc_DOT_idu_io_in_bits_r_DOT__DOT_pc_DOT_NEXT,"aw",@nobits
	.align	2
	.set	.LANCHOR240,. + 0
	.type	npc_DOT_idu_io_in_bits_r_DOT__DOT_pc_DOT_NEXT, @object
	.size	npc_DOT_idu_io_in_bits_r_DOT__DOT_pc_DOT_NEXT, 4
npc_DOT_idu_io_in_bits_r_DOT__DOT_pc_DOT_NEXT:
	.zero	4
	.section	.sbss.npc_DOT_idu_io_in_valid_REG,"aw",@nobits
	.set	.LANCHOR13,. + 0
	.type	npc_DOT_idu_io_in_valid_REG, @object
	.size	npc_DOT_idu_io_in_valid_REG, 1
npc_DOT_idu_io_in_valid_REG:
	.zero	1
	.section	.sbss.npc_DOT_idu_io_in_valid_REG_DOT_NEXT,"aw",@nobits
	.set	.LANCHOR14,. + 0
	.type	npc_DOT_idu_io_in_valid_REG_DOT_NEXT, @object
	.size	npc_DOT_idu_io_in_valid_REG_DOT_NEXT, 1
npc_DOT_idu_io_in_valid_REG_DOT_NEXT:
	.zero	1
	.section	.sbss.npc_DOT_ifu_DOT_PC,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	npc_DOT_ifu_DOT_PC, @object
	.size	npc_DOT_ifu_DOT_PC, 4
npc_DOT_ifu_DOT_PC:
	.zero	4
	.section	.sbss.npc_DOT_ifu_DOT__io_mem_req_bits_addr_T_1,"aw",@nobits
	.align	2
	.set	.LANCHOR67,. + 0
	.type	npc_DOT_ifu_DOT__io_mem_req_bits_addr_T_1, @object
	.size	npc_DOT_ifu_DOT__io_mem_req_bits_addr_T_1, 4
npc_DOT_ifu_DOT__io_mem_req_bits_addr_T_1:
	.zero	4
	.section	.sbss.npc_DOT_ifu_DOT_pc_s2,"aw",@nobits
	.align	2
	.set	.LANCHOR203,. + 0
	.type	npc_DOT_ifu_DOT_pc_s2, @object
	.size	npc_DOT_ifu_DOT_pc_s2, 4
npc_DOT_ifu_DOT_pc_s2:
	.zero	4
	.section	.sbss.npc_DOT_lsu_DOT__T_24,"aw",@nobits
	.set	.LANCHOR46,. + 0
	.type	npc_DOT_lsu_DOT__T_24, @object
	.size	npc_DOT_lsu_DOT__T_24, 1
npc_DOT_lsu_DOT__T_24:
	.zero	1
	.section	.sbss.npc_DOT_lsu_DOT__T_3,"aw",@nobits
	.set	.LANCHOR64,. + 0
	.type	npc_DOT_lsu_DOT__T_3, @object
	.size	npc_DOT_lsu_DOT__T_3, 1
npc_DOT_lsu_DOT__T_3:
	.zero	1
	.section	.sbss.npc_DOT_lsu_DOT__T_4,"aw",@nobits
	.set	.LANCHOR108,. + 0
	.type	npc_DOT_lsu_DOT__T_4, @object
	.size	npc_DOT_lsu_DOT__T_4, 1
npc_DOT_lsu_DOT__T_4:
	.zero	1
	.section	.sbss.npc_DOT_lsu_DOT__T_6,"aw",@nobits
	.set	.LANCHOR109,. + 0
	.type	npc_DOT_lsu_DOT__T_6, @object
	.size	npc_DOT_lsu_DOT__T_6, 1
npc_DOT_lsu_DOT__T_6:
	.zero	1
	.section	.sbss.npc_DOT_lsu_DOT__T_7,"aw",@nobits
	.set	.LANCHOR110,. + 0
	.type	npc_DOT_lsu_DOT__T_7, @object
	.size	npc_DOT_lsu_DOT__T_7, 1
npc_DOT_lsu_DOT__T_7:
	.zero	1
	.section	.sbss.npc_DOT_lsu_DOT__WIRE_1,"aw",@nobits
	.align	2
	.set	.LANCHOR159,. + 0
	.type	npc_DOT_lsu_DOT__WIRE_1, @object
	.size	npc_DOT_lsu_DOT__WIRE_1, 2
npc_DOT_lsu_DOT__WIRE_1:
	.zero	2
	.section	.sbss.npc_DOT_lsu_DOT__WIRE_2,"aw",@nobits
	.align	2
	.set	.LANCHOR158,. + 0
	.type	npc_DOT_lsu_DOT__WIRE_2, @object
	.size	npc_DOT_lsu_DOT__WIRE_2, 4
npc_DOT_lsu_DOT__WIRE_2:
	.zero	4
	.section	.sbss.npc_DOT_lsu_DOT__csrAddr_T,"aw",@nobits
	.align	1
	.set	.LANCHOR106,. + 0
	.type	npc_DOT_lsu_DOT__csrAddr_T, @object
	.size	npc_DOT_lsu_DOT__csrAddr_T, 2
npc_DOT_lsu_DOT__csrAddr_T:
	.zero	2
	.section	.sbss.npc_DOT_lsu_DOT__io_fw_wen_T,"aw",@nobits
	.set	.LANCHOR111,. + 0
	.type	npc_DOT_lsu_DOT__io_fw_wen_T, @object
	.size	npc_DOT_lsu_DOT__io_fw_wen_T, 1
npc_DOT_lsu_DOT__io_fw_wen_T:
	.zero	1
	.section	.sbss.npc_DOT_lsu_DOT__io_in_ready_T_1,"aw",@nobits
	.set	.LANCHOR136,. + 0
	.type	npc_DOT_lsu_DOT__io_in_ready_T_1, @object
	.size	npc_DOT_lsu_DOT__io_in_ready_T_1, 1
npc_DOT_lsu_DOT__io_in_ready_T_1:
	.zero	1
	.section	.sbss.npc_DOT_lsu_DOT__io_mem_ar_valid_T_1,"aw",@nobits
	.set	.LANCHOR138,. + 0
	.type	npc_DOT_lsu_DOT__io_mem_ar_valid_T_1, @object
	.size	npc_DOT_lsu_DOT__io_mem_ar_valid_T_1, 1
npc_DOT_lsu_DOT__io_mem_ar_valid_T_1:
	.zero	1
	.section	.sbss.npc_DOT_lsu_DOT__io_mem_aw_valid_T_1,"aw",@nobits
	.set	.LANCHOR123,. + 0
	.type	npc_DOT_lsu_DOT__io_mem_aw_valid_T_1, @object
	.size	npc_DOT_lsu_DOT__io_mem_aw_valid_T_1, 1
npc_DOT_lsu_DOT__io_mem_aw_valid_T_1:
	.zero	1
	.section	.sbss.npc_DOT_lsu_DOT__io_mem_b_ready_T,"aw",@nobits
	.set	.LANCHOR51,. + 0
	.type	npc_DOT_lsu_DOT__io_mem_b_ready_T, @object
	.size	npc_DOT_lsu_DOT__io_mem_b_ready_T, 1
npc_DOT_lsu_DOT__io_mem_b_ready_T:
	.zero	1
	.section	.sbss.npc_DOT_lsu_DOT__io_out_bits_res_T_1,"aw",@nobits
	.align	2
	.set	.LANCHOR160,. + 0
	.type	npc_DOT_lsu_DOT__io_out_bits_res_T_1, @object
	.size	npc_DOT_lsu_DOT__io_out_bits_res_T_1, 4
npc_DOT_lsu_DOT__io_out_bits_res_T_1:
	.zero	4
	.section	.sbss.npc_DOT_lsu_DOT__io_out_valid_T_2,"aw",@nobits
	.set	.LANCHOR135,. + 0
	.type	npc_DOT_lsu_DOT__io_out_valid_T_2, @object
	.size	npc_DOT_lsu_DOT__io_out_valid_T_2, 1
npc_DOT_lsu_DOT__io_out_valid_T_2:
	.zero	1
	.section	.sbss.npc_DOT_lsu_DOT__io_redirect_dnpc_T_1,"aw",@nobits
	.align	2
	.set	.LANCHOR149,. + 0
	.type	npc_DOT_lsu_DOT__io_redirect_dnpc_T_1, @object
	.size	npc_DOT_lsu_DOT__io_redirect_dnpc_T_1, 4
npc_DOT_lsu_DOT__io_redirect_dnpc_T_1:
	.zero	4
	.section	.sbss.npc_DOT_lsu_DOT__io_redirect_valid_T_2,"aw",@nobits
	.set	.LANCHOR128,. + 0
	.type	npc_DOT_lsu_DOT__io_redirect_valid_T_2, @object
	.size	npc_DOT_lsu_DOT__io_redirect_valid_T_2, 1
npc_DOT_lsu_DOT__io_redirect_valid_T_2:
	.zero	1
	.section	.sbss.npc_DOT_lsu_DOT__sbufReq_wmask_T,"aw",@nobits
	.set	.LANCHOR141,. + 0
	.type	npc_DOT_lsu_DOT__sbufReq_wmask_T, @object
	.size	npc_DOT_lsu_DOT__sbufReq_wmask_T, 1
npc_DOT_lsu_DOT__sbufReq_wmask_T:
	.zero	1
	.section	.sbss.npc_DOT_lsu_DOT__sbufReq_wmask_T_1,"aw",@nobits
	.set	.LANCHOR113,. + 0
	.type	npc_DOT_lsu_DOT__sbufReq_wmask_T_1, @object
	.size	npc_DOT_lsu_DOT__sbufReq_wmask_T_1, 1
npc_DOT_lsu_DOT__sbufReq_wmask_T_1:
	.zero	1
	.section	.sbss.npc_DOT_lsu_DOT__sbufReq_wmask_T_10,"aw",@nobits
	.set	.LANCHOR146,. + 0
	.type	npc_DOT_lsu_DOT__sbufReq_wmask_T_10, @object
	.size	npc_DOT_lsu_DOT__sbufReq_wmask_T_10, 1
npc_DOT_lsu_DOT__sbufReq_wmask_T_10:
	.zero	1
	.section	.sbss.npc_DOT_lsu_DOT__sbufReq_wmask_T_2,"aw",@nobits
	.set	.LANCHOR115,. + 0
	.type	npc_DOT_lsu_DOT__sbufReq_wmask_T_2, @object
	.size	npc_DOT_lsu_DOT__sbufReq_wmask_T_2, 1
npc_DOT_lsu_DOT__sbufReq_wmask_T_2:
	.zero	1
	.section	.sbss.npc_DOT_lsu_DOT__sbufReq_wmask_WIRE_2,"aw",@nobits
	.align	2
	.set	.LANCHOR42,. + 0
	.type	npc_DOT_lsu_DOT__sbufReq_wmask_WIRE_2, @object
	.size	npc_DOT_lsu_DOT__sbufReq_wmask_WIRE_2, 4
npc_DOT_lsu_DOT__sbufReq_wmask_WIRE_2:
	.zero	4
	.section	.sbss.npc_DOT_lsu_DOT__sbufReq_wmask_WIRE_3,"aw",@nobits
	.align	2
	.set	.LANCHOR43,. + 0
	.type	npc_DOT_lsu_DOT__sbufReq_wmask_WIRE_3, @object
	.size	npc_DOT_lsu_DOT__sbufReq_wmask_WIRE_3, 2
npc_DOT_lsu_DOT__sbufReq_wmask_WIRE_3:
	.zero	2
	.section	.sbss.npc_DOT_lsu_DOT_io_DOT__DOT_mem_DOT__DOT_aw_DOT__DOT_bits_DOT__DOT_size,"aw",@nobits
	.set	.LANCHOR144,. + 0
	.type	npc_DOT_lsu_DOT_io_DOT__DOT_mem_DOT__DOT_aw_DOT__DOT_bits_DOT__DOT_size, @object
	.size	npc_DOT_lsu_DOT_io_DOT__DOT_mem_DOT__DOT_aw_DOT__DOT_bits_DOT__DOT_size, 1
npc_DOT_lsu_DOT_io_DOT__DOT_mem_DOT__DOT_aw_DOT__DOT_bits_DOT__DOT_size:
	.zero	1
	.section	.sbss.npc_DOT_lsu_DOT_isValidLoad,"aw",@nobits
	.set	.LANCHOR133,. + 0
	.type	npc_DOT_lsu_DOT_isValidLoad, @object
	.size	npc_DOT_lsu_DOT_isValidLoad, 1
npc_DOT_lsu_DOT_isValidLoad:
	.zero	1
	.section	.sbss.npc_DOT_lsu_DOT_isValidStore,"aw",@nobits
	.set	.LANCHOR118,. + 0
	.type	npc_DOT_lsu_DOT_isValidStore, @object
	.size	npc_DOT_lsu_DOT_isValidStore, 1
npc_DOT_lsu_DOT_isValidStore:
	.zero	1
	.section	.sbss.npc_DOT_lsu_DOT_marchid,"aw",@nobits
	.align	2
	.set	.LANCHOR10,. + 0
	.type	npc_DOT_lsu_DOT_marchid, @object
	.size	npc_DOT_lsu_DOT_marchid, 4
npc_DOT_lsu_DOT_marchid:
	.zero	4
	.section	.sbss.npc_DOT_lsu_DOT_marchid_DOT_NEXT,"aw",@nobits
	.align	2
	.set	.LANCHOR11,. + 0
	.type	npc_DOT_lsu_DOT_marchid_DOT_NEXT, @object
	.size	npc_DOT_lsu_DOT_marchid_DOT_NEXT, 4
npc_DOT_lsu_DOT_marchid_DOT_NEXT:
	.zero	4
	.section	.sbss.npc_DOT_lsu_DOT_mcause,"aw",@nobits
	.align	2
	.set	.LANCHOR156,. + 0
	.type	npc_DOT_lsu_DOT_mcause, @object
	.size	npc_DOT_lsu_DOT_mcause, 4
npc_DOT_lsu_DOT_mcause:
	.zero	4
	.section	.sbss.npc_DOT_lsu_DOT_mcause_DOT_NEXT,"aw",@nobits
	.align	2
	.set	.LANCHOR131,. + 0
	.type	npc_DOT_lsu_DOT_mcause_DOT_NEXT, @object
	.size	npc_DOT_lsu_DOT_mcause_DOT_NEXT, 4
npc_DOT_lsu_DOT_mcause_DOT_NEXT:
	.zero	4
	.section	.sbss.npc_DOT_lsu_DOT_mcycle,"aw",@nobits
	.align	2
	.set	.LANCHOR6,. + 0
	.type	npc_DOT_lsu_DOT_mcycle, @object
	.size	npc_DOT_lsu_DOT_mcycle, 4
npc_DOT_lsu_DOT_mcycle:
	.zero	4
	.section	.sbss.npc_DOT_lsu_DOT_mcycle_DOT_NEXT,"aw",@nobits
	.align	2
	.set	.LANCHOR7,. + 0
	.type	npc_DOT_lsu_DOT_mcycle_DOT_NEXT, @object
	.size	npc_DOT_lsu_DOT_mcycle_DOT_NEXT, 4
npc_DOT_lsu_DOT_mcycle_DOT_NEXT:
	.zero	4
	.section	.sbss.npc_DOT_lsu_DOT_memFinish,"aw",@nobits
	.set	.LANCHOR66,. + 0
	.type	npc_DOT_lsu_DOT_memFinish, @object
	.size	npc_DOT_lsu_DOT_memFinish, 1
npc_DOT_lsu_DOT_memFinish:
	.zero	1
	.section	.sbss.npc_DOT_lsu_DOT_mepc,"aw",@nobits
	.align	2
	.set	.LANCHOR150,. + 0
	.type	npc_DOT_lsu_DOT_mepc, @object
	.size	npc_DOT_lsu_DOT_mepc, 4
npc_DOT_lsu_DOT_mepc:
	.zero	4
	.section	.sbss.npc_DOT_lsu_DOT_mepc_DOT_NEXT,"aw",@nobits
	.align	2
	.set	.LANCHOR132,. + 0
	.type	npc_DOT_lsu_DOT_mepc_DOT_NEXT, @object
	.size	npc_DOT_lsu_DOT_mepc_DOT_NEXT, 4
npc_DOT_lsu_DOT_mepc_DOT_NEXT:
	.zero	4
	.section	.sbss.npc_DOT_lsu_DOT_mstatus,"aw",@nobits
	.align	2
	.set	.LANCHOR4,. + 0
	.type	npc_DOT_lsu_DOT_mstatus, @object
	.size	npc_DOT_lsu_DOT_mstatus, 4
npc_DOT_lsu_DOT_mstatus:
	.zero	4
	.section	.sbss.npc_DOT_lsu_DOT_mstatus_DOT_NEXT,"aw",@nobits
	.align	2
	.set	.LANCHOR5,. + 0
	.type	npc_DOT_lsu_DOT_mstatus_DOT_NEXT, @object
	.size	npc_DOT_lsu_DOT_mstatus_DOT_NEXT, 4
npc_DOT_lsu_DOT_mstatus_DOT_NEXT:
	.zero	4
	.section	.sbss.npc_DOT_lsu_DOT_mtvec,"aw",@nobits
	.align	2
	.set	.LANCHOR151,. + 0
	.type	npc_DOT_lsu_DOT_mtvec, @object
	.size	npc_DOT_lsu_DOT_mtvec, 4
npc_DOT_lsu_DOT_mtvec:
	.zero	4
	.section	.sbss.npc_DOT_lsu_DOT_mtvec_DOT_NEXT,"aw",@nobits
	.align	2
	.set	.LANCHOR116,. + 0
	.type	npc_DOT_lsu_DOT_mtvec_DOT_NEXT, @object
	.size	npc_DOT_lsu_DOT_mtvec_DOT_NEXT, 4
npc_DOT_lsu_DOT_mtvec_DOT_NEXT:
	.zero	4
	.section	.sbss.npc_DOT_lsu_DOT_mvendorid,"aw",@nobits
	.align	2
	.set	.LANCHOR8,. + 0
	.type	npc_DOT_lsu_DOT_mvendorid, @object
	.size	npc_DOT_lsu_DOT_mvendorid, 4
npc_DOT_lsu_DOT_mvendorid:
	.zero	4
	.section	.sbss.npc_DOT_lsu_DOT_mvendorid_DOT_NEXT,"aw",@nobits
	.align	2
	.set	.LANCHOR9,. + 0
	.type	npc_DOT_lsu_DOT_mvendorid_DOT_NEXT, @object
	.size	npc_DOT_lsu_DOT_mvendorid_DOT_NEXT, 4
npc_DOT_lsu_DOT_mvendorid_DOT_NEXT:
	.zero	4
	.section	.sbss.npc_DOT_lsu_DOT_raiseException,"aw",@nobits
	.set	.LANCHOR125,. + 0
	.type	npc_DOT_lsu_DOT_raiseException, @object
	.size	npc_DOT_lsu_DOT_raiseException, 1
npc_DOT_lsu_DOT_raiseException:
	.zero	1
	.section	.sbss.npc_DOT_lsu_DOT_rdataMuxS2,"aw",@nobits
	.align	2
	.set	.LANCHOR157,. + 0
	.type	npc_DOT_lsu_DOT_rdataMuxS2, @object
	.size	npc_DOT_lsu_DOT_rdataMuxS2, 4
npc_DOT_lsu_DOT_rdataMuxS2:
	.zero	4
	.section	.sbss.npc_DOT_lsu_DOT_sbufState,"aw",@nobits
	.set	.LANCHOR3,. + 0
	.type	npc_DOT_lsu_DOT_sbufState, @object
	.size	npc_DOT_lsu_DOT_sbufState, 1
npc_DOT_lsu_DOT_sbufState:
	.zero	1
	.section	.sbss.npc_DOT_lsu_DOT_sbufWen,"aw",@nobits
	.set	.LANCHOR120,. + 0
	.type	npc_DOT_lsu_DOT_sbufWen, @object
	.size	npc_DOT_lsu_DOT_sbufWen, 1
npc_DOT_lsu_DOT_sbufWen:
	.zero	1
	.section	.sbss.npc_DOT_lsu_DOT_sbuf_DOT__DOT_addr,"aw",@nobits
	.align	2
	.set	.LANCHOR121,. + 0
	.type	npc_DOT_lsu_DOT_sbuf_DOT__DOT_addr, @object
	.size	npc_DOT_lsu_DOT_sbuf_DOT__DOT_addr, 4
npc_DOT_lsu_DOT_sbuf_DOT__DOT_addr:
	.zero	4
	.section	.sbss.npc_DOT_lsu_DOT_sbuf_r_DOT__DOT_addr,"aw",@nobits
	.align	2
	.set	.LANCHOR122,. + 0
	.type	npc_DOT_lsu_DOT_sbuf_r_DOT__DOT_addr, @object
	.size	npc_DOT_lsu_DOT_sbuf_r_DOT__DOT_addr, 4
npc_DOT_lsu_DOT_sbuf_r_DOT__DOT_addr:
	.zero	4
	.section	.sbss.npc_DOT_lsu_DOT_sbuf_r_DOT__DOT_size,"aw",@nobits
	.set	.LANCHOR143,. + 0
	.type	npc_DOT_lsu_DOT_sbuf_r_DOT__DOT_size, @object
	.size	npc_DOT_lsu_DOT_sbuf_r_DOT__DOT_size, 1
npc_DOT_lsu_DOT_sbuf_r_DOT__DOT_size:
	.zero	1
	.section	.sbss.npc_DOT_lsu_DOT_sbuf_r_DOT__DOT_wdata,"aw",@nobits
	.align	2
	.set	.LANCHOR154,. + 0
	.type	npc_DOT_lsu_DOT_sbuf_r_DOT__DOT_wdata, @object
	.size	npc_DOT_lsu_DOT_sbuf_r_DOT__DOT_wdata, 4
npc_DOT_lsu_DOT_sbuf_r_DOT__DOT_wdata:
	.zero	4
	.section	.sbss.npc_DOT_lsu_DOT_sbuf_r_DOT__DOT_wdata_DOT_NEXT,"aw",@nobits
	.align	2
	.set	.LANCHOR152,. + 0
	.type	npc_DOT_lsu_DOT_sbuf_r_DOT__DOT_wdata_DOT_NEXT, @object
	.size	npc_DOT_lsu_DOT_sbuf_r_DOT__DOT_wdata_DOT_NEXT, 4
npc_DOT_lsu_DOT_sbuf_r_DOT__DOT_wdata_DOT_NEXT:
	.zero	4
	.section	.sbss.npc_DOT_lsu_DOT_sbuf_r_DOT__DOT_wmask,"aw",@nobits
	.set	.LANCHOR148,. + 0
	.type	npc_DOT_lsu_DOT_sbuf_r_DOT__DOT_wmask, @object
	.size	npc_DOT_lsu_DOT_sbuf_r_DOT__DOT_wmask, 1
npc_DOT_lsu_DOT_sbuf_r_DOT__DOT_wmask:
	.zero	1
	.section	.sbss.npc_DOT_lsu_DOT_state,"aw",@nobits
	.set	.LANCHOR1,. + 0
	.type	npc_DOT_lsu_DOT_state, @object
	.size	npc_DOT_lsu_DOT_state, 1
npc_DOT_lsu_DOT_state:
	.zero	1
	.section	.sbss.npc_DOT_lsu_DOT_state_DOT_NEXT,"aw",@nobits
	.set	.LANCHOR2,. + 0
	.type	npc_DOT_lsu_DOT_state_DOT_NEXT, @object
	.size	npc_DOT_lsu_DOT_state_DOT_NEXT, 1
npc_DOT_lsu_DOT_state_DOT_NEXT:
	.zero	1
	.section	.sbss.npc_DOT_lsu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_csrWen,"aw",@nobits
	.set	.LANCHOR65,. + 0
	.type	npc_DOT_lsu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_csrWen, @object
	.size	npc_DOT_lsu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_csrWen, 1
npc_DOT_lsu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_csrWen:
	.zero	1
	.section	.sbss.npc_DOT_lsu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_funct3,"aw",@nobits
	.set	.LANCHOR142,. + 0
	.type	npc_DOT_lsu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_funct3, @object
	.size	npc_DOT_lsu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_funct3, 1
npc_DOT_lsu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_funct3:
	.zero	1
	.section	.sbss.npc_DOT_lsu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_illegal,"aw",@nobits
	.set	.LANCHOR127,. + 0
	.type	npc_DOT_lsu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_illegal, @object
	.size	npc_DOT_lsu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_illegal, 1
npc_DOT_lsu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_illegal:
	.zero	1
	.section	.sbss.npc_DOT_lsu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_isCSR,"aw",@nobits
	.set	.LANCHOR155,. + 0
	.type	npc_DOT_lsu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_isCSR, @object
	.size	npc_DOT_lsu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_isCSR, 1
npc_DOT_lsu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_isCSR:
	.zero	1
	.section	.sbss.npc_DOT_lsu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_isEcall,"aw",@nobits
	.set	.LANCHOR126,. + 0
	.type	npc_DOT_lsu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_isEcall, @object
	.size	npc_DOT_lsu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_isEcall, 1
npc_DOT_lsu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_isEcall:
	.zero	1
	.section	.sbss.npc_DOT_lsu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_isLoad,"aw",@nobits
	.set	.LANCHOR134,. + 0
	.type	npc_DOT_lsu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_isLoad, @object
	.size	npc_DOT_lsu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_isLoad, 1
npc_DOT_lsu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_isLoad:
	.zero	1
	.section	.sbss.npc_DOT_lsu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_isMret,"aw",@nobits
	.set	.LANCHOR129,. + 0
	.type	npc_DOT_lsu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_isMret, @object
	.size	npc_DOT_lsu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_isMret, 1
npc_DOT_lsu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_isMret:
	.zero	1
	.section	.sbss.npc_DOT_lsu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_isStore,"aw",@nobits
	.set	.LANCHOR119,. + 0
	.type	npc_DOT_lsu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_isStore, @object
	.size	npc_DOT_lsu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_isStore, 1
npc_DOT_lsu_io_in_bits_r_DOT__DOT_decode_DOT__DOT_isStore:
	.zero	1
	.section	.sbss.npc_DOT_lsu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_code,"aw",@nobits
	.align	2
	.set	.LANCHOR165,. + 0
	.type	npc_DOT_lsu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_code, @object
	.size	npc_DOT_lsu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_code, 4
npc_DOT_lsu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_code:
	.zero	4
	.section	.sbss.npc_DOT_lsu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_dnpc,"aw",@nobits
	.align	2
	.set	.LANCHOR167,. + 0
	.type	npc_DOT_lsu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_dnpc, @object
	.size	npc_DOT_lsu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_dnpc, 4
npc_DOT_lsu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_dnpc:
	.zero	4
	.section	.sbss.npc_DOT_lsu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_isEbreak,"aw",@nobits
	.set	.LANCHOR166,. + 0
	.type	npc_DOT_lsu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_isEbreak, @object
	.size	npc_DOT_lsu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_isEbreak, 1
npc_DOT_lsu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_isEbreak:
	.zero	1
	.section	.sbss.npc_DOT_lsu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_pc,"aw",@nobits
	.align	2
	.set	.LANCHOR168,. + 0
	.type	npc_DOT_lsu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_pc, @object
	.size	npc_DOT_lsu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_pc, 4
npc_DOT_lsu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_pc:
	.zero	4
	.section	.sbss.npc_DOT_lsu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_skip,"aw",@nobits
	.set	.LANCHOR164,. + 0
	.type	npc_DOT_lsu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_skip, @object
	.size	npc_DOT_lsu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_skip, 1
npc_DOT_lsu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_skip:
	.zero	1
	.section	.sbss.npc_DOT_lsu_io_in_bits_r_DOT__DOT_rd,"aw",@nobits
	.set	.LANCHOR163,. + 0
	.type	npc_DOT_lsu_io_in_bits_r_DOT__DOT_rd, @object
	.size	npc_DOT_lsu_io_in_bits_r_DOT__DOT_rd, 1
npc_DOT_lsu_io_in_bits_r_DOT__DOT_rd:
	.zero	1
	.section	.sbss.npc_DOT_lsu_io_in_bits_r_DOT__DOT_redirect,"aw",@nobits
	.set	.LANCHOR130,. + 0
	.type	npc_DOT_lsu_io_in_bits_r_DOT__DOT_redirect, @object
	.size	npc_DOT_lsu_io_in_bits_r_DOT__DOT_redirect, 1
npc_DOT_lsu_io_in_bits_r_DOT__DOT_redirect:
	.zero	1
	.section	.sbss.npc_DOT_lsu_io_in_bits_r_DOT__DOT_res,"aw",@nobits
	.align	2
	.set	.LANCHOR114,. + 0
	.type	npc_DOT_lsu_io_in_bits_r_DOT__DOT_res, @object
	.size	npc_DOT_lsu_io_in_bits_r_DOT__DOT_res, 4
npc_DOT_lsu_io_in_bits_r_DOT__DOT_res:
	.zero	4
	.section	.sbss.npc_DOT_lsu_io_in_bits_r_DOT__DOT_res2,"aw",@nobits
	.align	2
	.set	.LANCHOR107,. + 0
	.type	npc_DOT_lsu_io_in_bits_r_DOT__DOT_res2, @object
	.size	npc_DOT_lsu_io_in_bits_r_DOT__DOT_res2, 4
npc_DOT_lsu_io_in_bits_r_DOT__DOT_res2:
	.zero	4
	.section	.sbss.npc_DOT_lsu_io_in_bits_r_DOT__DOT_wen,"aw",@nobits
	.set	.LANCHOR112,. + 0
	.type	npc_DOT_lsu_io_in_bits_r_DOT__DOT_wen, @object
	.size	npc_DOT_lsu_io_in_bits_r_DOT__DOT_wen, 1
npc_DOT_lsu_io_in_bits_r_DOT__DOT_wen:
	.zero	1
	.section	.sbss.npc_DOT_lsu_io_in_valid_REG,"aw",@nobits
	.set	.LANCHOR17,. + 0
	.type	npc_DOT_lsu_io_in_valid_REG, @object
	.size	npc_DOT_lsu_io_in_valid_REG, 1
npc_DOT_lsu_io_in_valid_REG:
	.zero	1
	.section	.sbss.npc_DOT_npctrap_DOT_code,"aw",@nobits
	.align	2
	.set	.LANCHOR84,. + 0
	.type	npc_DOT_npctrap_DOT_code, @object
	.size	npc_DOT_npctrap_DOT_code, 4
npc_DOT_npctrap_DOT_code:
	.zero	4
	.section	.sbss.npc_DOT_npctrap_DOT_dnpc,"aw",@nobits
	.align	2
	.set	.LANCHOR82,. + 0
	.type	npc_DOT_npctrap_DOT_dnpc, @object
	.size	npc_DOT_npctrap_DOT_dnpc, 4
npc_DOT_npctrap_DOT_dnpc:
	.zero	4
	.section	.sbss.npc_DOT_npctrap_DOT_isEbreak,"aw",@nobits
	.set	.LANCHOR83,. + 0
	.type	npc_DOT_npctrap_DOT_isEbreak, @object
	.size	npc_DOT_npctrap_DOT_isEbreak, 1
npc_DOT_npctrap_DOT_isEbreak:
	.zero	1
	.section	.sbss.npc_DOT_npctrap_DOT_isMMIO,"aw",@nobits
	.set	.LANCHOR85,. + 0
	.type	npc_DOT_npctrap_DOT_isMMIO, @object
	.size	npc_DOT_npctrap_DOT_isMMIO, 1
npc_DOT_npctrap_DOT_isMMIO:
	.zero	1
	.section	.sbss.npc_DOT_npctrap_DOT_memAddr,"aw",@nobits
	.align	2
	.set	.LANCHOR86,. + 0
	.type	npc_DOT_npctrap_DOT_memAddr, @object
	.size	npc_DOT_npctrap_DOT_memAddr, 4
npc_DOT_npctrap_DOT_memAddr:
	.zero	4
	.section	.sbss.npc_DOT_npctrap_DOT_pc,"aw",@nobits
	.align	2
	.set	.LANCHOR81,. + 0
	.type	npc_DOT_npctrap_DOT_pc, @object
	.size	npc_DOT_npctrap_DOT_pc, 4
npc_DOT_npctrap_DOT_pc:
	.zero	4
	.section	.sbss.npc_DOT_npctrap_DOT_skip,"aw",@nobits
	.set	.LANCHOR87,. + 0
	.type	npc_DOT_npctrap_DOT_skip, @object
	.size	npc_DOT_npctrap_DOT_skip, 1
npc_DOT_npctrap_DOT_skip:
	.zero	1
	.section	.sbss.npc_DOT_npctrap_DOT_valid,"aw",@nobits
	.set	.LANCHOR80,. + 0
	.type	npc_DOT_npctrap_DOT_valid, @object
	.size	npc_DOT_npctrap_DOT_valid, 1
npc_DOT_npctrap_DOT_valid:
	.zero	1
	.section	.sbss.npc_DOT_npctrap_io_REG_DOT__DOT_code,"aw",@nobits
	.align	2
	.set	.LANCHOR92,. + 0
	.type	npc_DOT_npctrap_io_REG_DOT__DOT_code, @object
	.size	npc_DOT_npctrap_io_REG_DOT__DOT_code, 4
npc_DOT_npctrap_io_REG_DOT__DOT_code:
	.zero	4
	.section	.sbss.npc_DOT_npctrap_io_REG_DOT__DOT_code_DOT_NEXT,"aw",@nobits
	.align	2
	.set	.LANCHOR100,. + 0
	.type	npc_DOT_npctrap_io_REG_DOT__DOT_code_DOT_NEXT, @object
	.size	npc_DOT_npctrap_io_REG_DOT__DOT_code_DOT_NEXT, 4
npc_DOT_npctrap_io_REG_DOT__DOT_code_DOT_NEXT:
	.zero	4
	.section	.sbss.npc_DOT_npctrap_io_REG_DOT__DOT_dnpc,"aw",@nobits
	.align	2
	.set	.LANCHOR94,. + 0
	.type	npc_DOT_npctrap_io_REG_DOT__DOT_dnpc, @object
	.size	npc_DOT_npctrap_io_REG_DOT__DOT_dnpc, 4
npc_DOT_npctrap_io_REG_DOT__DOT_dnpc:
	.zero	4
	.section	.sbss.npc_DOT_npctrap_io_REG_DOT__DOT_dnpc_DOT_NEXT,"aw",@nobits
	.align	2
	.set	.LANCHOR104,. + 0
	.type	npc_DOT_npctrap_io_REG_DOT__DOT_dnpc_DOT_NEXT, @object
	.size	npc_DOT_npctrap_io_REG_DOT__DOT_dnpc_DOT_NEXT, 4
npc_DOT_npctrap_io_REG_DOT__DOT_dnpc_DOT_NEXT:
	.zero	4
	.section	.sbss.npc_DOT_npctrap_io_REG_DOT__DOT_isEbreak,"aw",@nobits
	.set	.LANCHOR93,. + 0
	.type	npc_DOT_npctrap_io_REG_DOT__DOT_isEbreak, @object
	.size	npc_DOT_npctrap_io_REG_DOT__DOT_isEbreak, 1
npc_DOT_npctrap_io_REG_DOT__DOT_isEbreak:
	.zero	1
	.section	.sbss.npc_DOT_npctrap_io_REG_DOT__DOT_isEbreak_DOT_NEXT,"aw",@nobits
	.set	.LANCHOR102,. + 0
	.type	npc_DOT_npctrap_io_REG_DOT__DOT_isEbreak_DOT_NEXT, @object
	.size	npc_DOT_npctrap_io_REG_DOT__DOT_isEbreak_DOT_NEXT, 1
npc_DOT_npctrap_io_REG_DOT__DOT_isEbreak_DOT_NEXT:
	.zero	1
	.section	.sbss.npc_DOT_npctrap_io_REG_DOT__DOT_isMMIO,"aw",@nobits
	.set	.LANCHOR91,. + 0
	.type	npc_DOT_npctrap_io_REG_DOT__DOT_isMMIO, @object
	.size	npc_DOT_npctrap_io_REG_DOT__DOT_isMMIO, 1
npc_DOT_npctrap_io_REG_DOT__DOT_isMMIO:
	.zero	1
	.section	.sbss.npc_DOT_npctrap_io_REG_DOT__DOT_isMMIO_DOT_NEXT,"aw",@nobits
	.set	.LANCHOR98,. + 0
	.type	npc_DOT_npctrap_io_REG_DOT__DOT_isMMIO_DOT_NEXT, @object
	.size	npc_DOT_npctrap_io_REG_DOT__DOT_isMMIO_DOT_NEXT, 1
npc_DOT_npctrap_io_REG_DOT__DOT_isMMIO_DOT_NEXT:
	.zero	1
	.section	.sbss.npc_DOT_npctrap_io_REG_DOT__DOT_memAddr,"aw",@nobits
	.align	2
	.set	.LANCHOR90,. + 0
	.type	npc_DOT_npctrap_io_REG_DOT__DOT_memAddr, @object
	.size	npc_DOT_npctrap_io_REG_DOT__DOT_memAddr, 4
npc_DOT_npctrap_io_REG_DOT__DOT_memAddr:
	.zero	4
	.section	.sbss.npc_DOT_npctrap_io_REG_DOT__DOT_memAddr_DOT_NEXT,"aw",@nobits
	.align	2
	.set	.LANCHOR96,. + 0
	.type	npc_DOT_npctrap_io_REG_DOT__DOT_memAddr_DOT_NEXT, @object
	.size	npc_DOT_npctrap_io_REG_DOT__DOT_memAddr_DOT_NEXT, 4
npc_DOT_npctrap_io_REG_DOT__DOT_memAddr_DOT_NEXT:
	.zero	4
	.section	.sbss.npc_DOT_npctrap_io_REG_DOT__DOT_pc,"aw",@nobits
	.align	2
	.set	.LANCHOR95,. + 0
	.type	npc_DOT_npctrap_io_REG_DOT__DOT_pc, @object
	.size	npc_DOT_npctrap_io_REG_DOT__DOT_pc, 4
npc_DOT_npctrap_io_REG_DOT__DOT_pc:
	.zero	4
	.section	.sbss.npc_DOT_npctrap_io_REG_DOT__DOT_pc_DOT_NEXT,"aw",@nobits
	.align	2
	.set	.LANCHOR78,. + 0
	.type	npc_DOT_npctrap_io_REG_DOT__DOT_pc_DOT_NEXT, @object
	.size	npc_DOT_npctrap_io_REG_DOT__DOT_pc_DOT_NEXT, 4
npc_DOT_npctrap_io_REG_DOT__DOT_pc_DOT_NEXT:
	.zero	4
	.section	.sbss.npc_DOT_npctrap_io_REG_DOT__DOT_skip,"aw",@nobits
	.set	.LANCHOR89,. + 0
	.type	npc_DOT_npctrap_io_REG_DOT__DOT_skip, @object
	.size	npc_DOT_npctrap_io_REG_DOT__DOT_skip, 1
npc_DOT_npctrap_io_REG_DOT__DOT_skip:
	.zero	1
	.section	.sbss.npc_DOT_npctrap_io_REG_DOT__DOT_skip_DOT_NEXT,"aw",@nobits
	.set	.LANCHOR76,. + 0
	.type	npc_DOT_npctrap_io_REG_DOT__DOT_skip_DOT_NEXT, @object
	.size	npc_DOT_npctrap_io_REG_DOT__DOT_skip_DOT_NEXT, 1
npc_DOT_npctrap_io_REG_DOT__DOT_skip_DOT_NEXT:
	.zero	1
	.section	.sbss.npc_DOT_npctrap_io_valid_REG,"aw",@nobits
	.set	.LANCHOR88,. + 0
	.type	npc_DOT_npctrap_io_valid_REG, @object
	.size	npc_DOT_npctrap_io_valid_REG, 1
npc_DOT_npctrap_io_valid_REG:
	.zero	1
	.section	.sbss.npc_DOT_npctrap_io_valid_REG_DOT_NEXT,"aw",@nobits
	.set	.LANCHOR55,. + 0
	.type	npc_DOT_npctrap_io_valid_REG_DOT_NEXT, @object
	.size	npc_DOT_npctrap_io_valid_REG_DOT_NEXT, 1
npc_DOT_npctrap_io_valid_REG_DOT_NEXT:
	.zero	1
	.section	.sbss.npc_DOT_wbu_DOT__io_wb_wen_T,"aw",@nobits
	.set	.LANCHOR62,. + 0
	.type	npc_DOT_wbu_DOT__io_wb_wen_T, @object
	.size	npc_DOT_wbu_DOT__io_wb_wen_T, 1
npc_DOT_wbu_DOT__io_wb_wen_T:
	.zero	1
	.section	.sbss.npc_DOT_wbu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_code,"aw",@nobits
	.align	2
	.set	.LANCHOR101,. + 0
	.type	npc_DOT_wbu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_code, @object
	.size	npc_DOT_wbu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_code, 4
npc_DOT_wbu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_code:
	.zero	4
	.section	.sbss.npc_DOT_wbu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_dnpc,"aw",@nobits
	.align	2
	.set	.LANCHOR105,. + 0
	.type	npc_DOT_wbu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_dnpc, @object
	.size	npc_DOT_wbu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_dnpc, 4
npc_DOT_wbu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_dnpc:
	.zero	4
	.section	.sbss.npc_DOT_wbu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_isEbreak,"aw",@nobits
	.set	.LANCHOR103,. + 0
	.type	npc_DOT_wbu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_isEbreak, @object
	.size	npc_DOT_wbu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_isEbreak, 1
npc_DOT_wbu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_isEbreak:
	.zero	1
	.section	.sbss.npc_DOT_wbu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_isMMIO,"aw",@nobits
	.set	.LANCHOR99,. + 0
	.type	npc_DOT_wbu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_isMMIO, @object
	.size	npc_DOT_wbu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_isMMIO, 1
npc_DOT_wbu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_isMMIO:
	.zero	1
	.section	.sbss.npc_DOT_wbu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_memAddr,"aw",@nobits
	.align	2
	.set	.LANCHOR97,. + 0
	.type	npc_DOT_wbu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_memAddr, @object
	.size	npc_DOT_wbu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_memAddr, 4
npc_DOT_wbu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_memAddr:
	.zero	4
	.section	.sbss.npc_DOT_wbu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_pc,"aw",@nobits
	.align	2
	.set	.LANCHOR79,. + 0
	.type	npc_DOT_wbu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_pc, @object
	.size	npc_DOT_wbu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_pc, 4
npc_DOT_wbu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_pc:
	.zero	4
	.section	.sbss.npc_DOT_wbu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_skip,"aw",@nobits
	.set	.LANCHOR77,. + 0
	.type	npc_DOT_wbu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_skip, @object
	.size	npc_DOT_wbu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_skip, 1
npc_DOT_wbu_io_in_bits_r_DOT__DOT_npctrap_DOT__DOT_skip:
	.zero	1
	.section	.sbss.npc_DOT_wbu_io_in_bits_r_DOT__DOT_rd,"aw",@nobits
	.set	.LANCHOR169,. + 0
	.type	npc_DOT_wbu_io_in_bits_r_DOT__DOT_rd, @object
	.size	npc_DOT_wbu_io_in_bits_r_DOT__DOT_rd, 1
npc_DOT_wbu_io_in_bits_r_DOT__DOT_rd:
	.zero	1
	.section	.sbss.npc_DOT_wbu_io_in_bits_r_DOT__DOT_rd_DOT_NEXT,"aw",@nobits
	.set	.LANCHOR162,. + 0
	.type	npc_DOT_wbu_io_in_bits_r_DOT__DOT_rd_DOT_NEXT, @object
	.size	npc_DOT_wbu_io_in_bits_r_DOT__DOT_rd_DOT_NEXT, 1
npc_DOT_wbu_io_in_bits_r_DOT__DOT_rd_DOT_NEXT:
	.zero	1
	.section	.sbss.npc_DOT_wbu_io_in_bits_r_DOT__DOT_res,"aw",@nobits
	.align	2
	.set	.LANCHOR187,. + 0
	.type	npc_DOT_wbu_io_in_bits_r_DOT__DOT_res, @object
	.size	npc_DOT_wbu_io_in_bits_r_DOT__DOT_res, 4
npc_DOT_wbu_io_in_bits_r_DOT__DOT_res:
	.zero	4
	.section	.sbss.npc_DOT_wbu_io_in_bits_r_DOT__DOT_res_DOT_NEXT,"aw",@nobits
	.align	2
	.set	.LANCHOR161,. + 0
	.type	npc_DOT_wbu_io_in_bits_r_DOT__DOT_res_DOT_NEXT, @object
	.size	npc_DOT_wbu_io_in_bits_r_DOT__DOT_res_DOT_NEXT, 4
npc_DOT_wbu_io_in_bits_r_DOT__DOT_res_DOT_NEXT:
	.zero	4
	.section	.sbss.npc_DOT_wbu_io_in_bits_r_DOT__DOT_wen,"aw",@nobits
	.set	.LANCHOR63,. + 0
	.type	npc_DOT_wbu_io_in_bits_r_DOT__DOT_wen, @object
	.size	npc_DOT_wbu_io_in_bits_r_DOT__DOT_wen, 1
npc_DOT_wbu_io_in_bits_r_DOT__DOT_wen:
	.zero	1
	.section	.sbss.npc_DOT_wbu_io_in_valid_REG,"aw",@nobits
	.set	.LANCHOR18,. + 0
	.type	npc_DOT_wbu_io_in_valid_REG, @object
	.size	npc_DOT_wbu_io_in_valid_REG, 1
npc_DOT_wbu_io_in_valid_REG:
	.zero	1
	.section	.sbss.npc_DOT_xbar2_DOT__arSel_1_T_6,"aw",@nobits
	.set	.LANCHOR208,. + 0
	.type	npc_DOT_xbar2_DOT__arSel_1_T_6, @object
	.size	npc_DOT_xbar2_DOT__arSel_1_T_6, 1
npc_DOT_xbar2_DOT__arSel_1_T_6:
	.zero	1
	.section	.sbss.npc_DOT_xbar2_DOT__io_in_ar_ready_T_4,"aw",@nobits
	.set	.LANCHOR75,. + 0
	.type	npc_DOT_xbar2_DOT__io_in_ar_ready_T_4, @object
	.size	npc_DOT_xbar2_DOT__io_in_ar_ready_T_4, 1
npc_DOT_xbar2_DOT__io_in_ar_ready_T_4:
	.zero	1
	.section	.sbss.npc_DOT_xbar2_DOT__io_in_r_valid_T_1,"aw",@nobits
	.set	.LANCHOR72,. + 0
	.type	npc_DOT_xbar2_DOT__io_in_r_valid_T_1, @object
	.size	npc_DOT_xbar2_DOT__io_in_r_valid_T_1, 1
npc_DOT_xbar2_DOT__io_in_r_valid_T_1:
	.zero	1
	.section	.sbss.npc_DOT_xbar2_DOT__io_out_1_ar_valid_T_1,"aw",@nobits
	.set	.LANCHOR209,. + 0
	.type	npc_DOT_xbar2_DOT__io_out_1_ar_valid_T_1, @object
	.size	npc_DOT_xbar2_DOT__io_out_1_ar_valid_T_1, 1
npc_DOT_xbar2_DOT__io_out_1_ar_valid_T_1:
	.zero	1
	.section	.sbss.npc_DOT_xbar2_DOT_arSelIdx_s1,"aw",@nobits
	.set	.LANCHOR71,. + 0
	.type	npc_DOT_xbar2_DOT_arSelIdx_s1, @object
	.size	npc_DOT_xbar2_DOT_arSelIdx_s1, 1
npc_DOT_xbar2_DOT_arSelIdx_s1:
	.zero	1
	.section	.sbss.npc_DOT_xbar2_DOT_arSelIdx_s1_DOT_NEXT,"aw",@nobits
	.set	.LANCHOR211,. + 0
	.type	npc_DOT_xbar2_DOT_arSelIdx_s1_DOT_NEXT, @object
	.size	npc_DOT_xbar2_DOT_arSelIdx_s1_DOT_NEXT, 1
npc_DOT_xbar2_DOT_arSelIdx_s1_DOT_NEXT:
	.zero	1
	.section	.sbss.npc_DOT_xbar2_DOT_arSel_s1_0,"aw",@nobits
	.set	.LANCHOR47,. + 0
	.type	npc_DOT_xbar2_DOT_arSel_s1_0, @object
	.size	npc_DOT_xbar2_DOT_arSel_s1_0, 1
npc_DOT_xbar2_DOT_arSel_s1_0:
	.zero	1
	.section	.sbss.npc_DOT_xbar2_DOT_arSel_s1_1,"aw",@nobits
	.set	.LANCHOR273,. + 0
	.type	npc_DOT_xbar2_DOT_arSel_s1_1, @object
	.size	npc_DOT_xbar2_DOT_arSel_s1_1, 1
npc_DOT_xbar2_DOT_arSel_s1_1:
	.zero	1
	.section	.sbss.npc_DOT_xbar2_DOT_arSel_s1_DOT_NEXT_1,"aw",@nobits
	.set	.LANCHOR210,. + 0
	.type	npc_DOT_xbar2_DOT_arSel_s1_DOT_NEXT_1, @object
	.size	npc_DOT_xbar2_DOT_arSel_s1_DOT_NEXT_1, 1
npc_DOT_xbar2_DOT_arSel_s1_DOT_NEXT_1:
	.zero	1
	.section	.sbss.npc_DOT_xbar2_DOT_in_ar_bits_s1_DOT__DOT_addr,"aw",@nobits
	.align	1
	.set	.LANCHOR48,. + 0
	.type	npc_DOT_xbar2_DOT_in_ar_bits_s1_DOT__DOT_addr, @object
	.size	npc_DOT_xbar2_DOT_in_ar_bits_s1_DOT__DOT_addr, 2
npc_DOT_xbar2_DOT_in_ar_bits_s1_DOT__DOT_addr:
	.zero	2
	.section	.sbss.npc_DOT_xbar2_DOT_io_DOT__DOT_in_DOT__DOT_r_DOT__DOT_bits_DOT__DOT_last,"aw",@nobits
	.set	.LANCHOR271,. + 0
	.type	npc_DOT_xbar2_DOT_io_DOT__DOT_in_DOT__DOT_r_DOT__DOT_bits_DOT__DOT_last, @object
	.size	npc_DOT_xbar2_DOT_io_DOT__DOT_in_DOT__DOT_r_DOT__DOT_bits_DOT__DOT_last, 1
npc_DOT_xbar2_DOT_io_DOT__DOT_in_DOT__DOT_r_DOT__DOT_bits_DOT__DOT_last:
	.zero	1
	.section	.sbss.npc_DOT_xbar2_DOT_io_DOT__DOT_out_DOT__DOT_ar_DOT__DOT_ready,"aw",@nobits
	.align	2
	.set	.LANCHOR60,. + 0
	.type	npc_DOT_xbar2_DOT_io_DOT__DOT_out_DOT__DOT_ar_DOT__DOT_ready, @object
	.size	npc_DOT_xbar2_DOT_io_DOT__DOT_out_DOT__DOT_ar_DOT__DOT_ready, 2
npc_DOT_xbar2_DOT_io_DOT__DOT_out_DOT__DOT_ar_DOT__DOT_ready:
	.zero	2
	.section	.sbss.npc_DOT_xbar2_DOT_io_DOT__DOT_out_DOT__DOT_r_DOT__DOT_bits_DOT__DOT_data,"aw",@nobits
	.align	2
	.set	.LANCHOR278,. + 0
	.type	npc_DOT_xbar2_DOT_io_DOT__DOT_out_DOT__DOT_r_DOT__DOT_bits_DOT__DOT_data, @object
	.size	npc_DOT_xbar2_DOT_io_DOT__DOT_out_DOT__DOT_r_DOT__DOT_bits_DOT__DOT_data, 8
npc_DOT_xbar2_DOT_io_DOT__DOT_out_DOT__DOT_r_DOT__DOT_bits_DOT__DOT_data:
	.zero	8
	.section	.sbss.npc_DOT_xbar2_DOT_io_DOT__DOT_out_DOT__DOT_r_DOT__DOT_bits_DOT__DOT_last,"aw",@nobits
	.align	2
	.set	.LANCHOR270,. + 0
	.type	npc_DOT_xbar2_DOT_io_DOT__DOT_out_DOT__DOT_r_DOT__DOT_bits_DOT__DOT_last, @object
	.size	npc_DOT_xbar2_DOT_io_DOT__DOT_out_DOT__DOT_r_DOT__DOT_bits_DOT__DOT_last, 2
npc_DOT_xbar2_DOT_io_DOT__DOT_out_DOT__DOT_r_DOT__DOT_bits_DOT__DOT_last:
	.zero	2
	.section	.sbss.npc_DOT_xbar2_DOT_io_DOT__DOT_out_DOT__DOT_r_DOT__DOT_valid,"aw",@nobits
	.align	2
	.set	.LANCHOR59,. + 0
	.type	npc_DOT_xbar2_DOT_io_DOT__DOT_out_DOT__DOT_r_DOT__DOT_valid, @object
	.size	npc_DOT_xbar2_DOT_io_DOT__DOT_out_DOT__DOT_r_DOT__DOT_valid, 2
npc_DOT_xbar2_DOT_io_DOT__DOT_out_DOT__DOT_r_DOT__DOT_valid:
	.zero	2
	.section	.sbss.npc_DOT_xbar2_DOT_stateRead,"aw",@nobits
	.set	.LANCHOR31,. + 0
	.type	npc_DOT_xbar2_DOT_stateRead, @object
	.size	npc_DOT_xbar2_DOT_stateRead, 1
npc_DOT_xbar2_DOT_stateRead:
	.zero	1
	.section	.sbss.npc_DOT_xbar_DOT__inputArbWrite_io_out_ready_T,"aw",@nobits
	.set	.LANCHOR61,. + 0
	.type	npc_DOT_xbar_DOT__inputArbWrite_io_out_ready_T, @object
	.size	npc_DOT_xbar_DOT__inputArbWrite_io_out_ready_T, 1
npc_DOT_xbar_DOT__inputArbWrite_io_out_ready_T:
	.zero	1
	.section	.sbss.npc_DOT_xbar_DOT__io_out_ar_valid_T_1,"aw",@nobits
	.set	.LANCHOR204,. + 0
	.type	npc_DOT_xbar_DOT__io_out_ar_valid_T_1, @object
	.size	npc_DOT_xbar_DOT__io_out_ar_valid_T_1, 1
npc_DOT_xbar_DOT__io_out_ar_valid_T_1:
	.zero	1
	.section	.sbss.npc_DOT_xbar_DOT_acceptWrite,"aw",@nobits
	.set	.LANCHOR54,. + 0
	.type	npc_DOT_xbar_DOT_acceptWrite, @object
	.size	npc_DOT_xbar_DOT_acceptWrite, 1
npc_DOT_xbar_DOT_acceptWrite:
	.zero	1
	.section	.sbss.npc_DOT_xbar_DOT_chosenReadIdx,"aw",@nobits
	.set	.LANCHOR139,. + 0
	.type	npc_DOT_xbar_DOT_chosenReadIdx, @object
	.size	npc_DOT_xbar_DOT_chosenReadIdx, 1
npc_DOT_xbar_DOT_chosenReadIdx:
	.zero	1
	.section	.sbss.npc_DOT_xbar_DOT_chosenReadIdxReg_s0,"aw",@nobits
	.set	.LANCHOR205,. + 0
	.type	npc_DOT_xbar_DOT_chosenReadIdxReg_s0, @object
	.size	npc_DOT_xbar_DOT_chosenReadIdxReg_s0, 1
npc_DOT_xbar_DOT_chosenReadIdxReg_s0:
	.zero	1
	.section	.sbss.npc_DOT_xbar_DOT_chosenReadIdxReg_s1,"aw",@nobits
	.set	.LANCHOR27,. + 0
	.type	npc_DOT_xbar_DOT_chosenReadIdxReg_s1, @object
	.size	npc_DOT_xbar_DOT_chosenReadIdxReg_s1, 1
npc_DOT_xbar_DOT_chosenReadIdxReg_s1:
	.zero	1
	.section	.sbss.npc_DOT_xbar_DOT_chosenReadIdxReg_s1_DOT_NEXT,"aw",@nobits
	.set	.LANCHOR28,. + 0
	.type	npc_DOT_xbar_DOT_chosenReadIdxReg_s1_DOT_NEXT, @object
	.size	npc_DOT_xbar_DOT_chosenReadIdxReg_s1_DOT_NEXT, 1
npc_DOT_xbar_DOT_chosenReadIdxReg_s1_DOT_NEXT:
	.zero	1
	.section	.sbss.npc_DOT_xbar_DOT_chosenWrite,"aw",@nobits
	.set	.LANCHOR30,. + 0
	.type	npc_DOT_xbar_DOT_chosenWrite, @object
	.size	npc_DOT_xbar_DOT_chosenWrite, 1
npc_DOT_xbar_DOT_chosenWrite:
	.zero	1
	.section	.sbss.npc_DOT_xbar_DOT_hasReadValid,"aw",@nobits
	.set	.LANCHOR189,. + 0
	.type	npc_DOT_xbar_DOT_hasReadValid, @object
	.size	npc_DOT_xbar_DOT_hasReadValid, 1
npc_DOT_xbar_DOT_hasReadValid:
	.zero	1
	.section	.sbss.npc_DOT_xbar_DOT_io_DOT__DOT_in_DOT__DOT_ar_DOT__DOT_bits_DOT__DOT_addr,"aw",@nobits
	.align	2
	.set	.LANCHOR206,. + 0
	.type	npc_DOT_xbar_DOT_io_DOT__DOT_in_DOT__DOT_ar_DOT__DOT_bits_DOT__DOT_addr, @object
	.size	npc_DOT_xbar_DOT_io_DOT__DOT_in_DOT__DOT_ar_DOT__DOT_bits_DOT__DOT_addr, 8
npc_DOT_xbar_DOT_io_DOT__DOT_in_DOT__DOT_ar_DOT__DOT_bits_DOT__DOT_addr:
	.zero	8
	.section	.sbss.npc_DOT_xbar_DOT_io_DOT__DOT_in_DOT__DOT_ar_DOT__DOT_bits_DOT__DOT_len,"aw",@nobits
	.align	2
	.set	.LANCHOR274,. + 0
	.type	npc_DOT_xbar_DOT_io_DOT__DOT_in_DOT__DOT_ar_DOT__DOT_bits_DOT__DOT_len, @object
	.size	npc_DOT_xbar_DOT_io_DOT__DOT_in_DOT__DOT_ar_DOT__DOT_bits_DOT__DOT_len, 2
npc_DOT_xbar_DOT_io_DOT__DOT_in_DOT__DOT_ar_DOT__DOT_bits_DOT__DOT_len:
	.zero	2
	.section	.sbss.npc_DOT_xbar_DOT_io_DOT__DOT_in_DOT__DOT_ar_DOT__DOT_bits_DOT__DOT_size,"aw",@nobits
	.align	2
	.set	.LANCHOR212,. + 0
	.type	npc_DOT_xbar_DOT_io_DOT__DOT_in_DOT__DOT_ar_DOT__DOT_bits_DOT__DOT_size, @object
	.size	npc_DOT_xbar_DOT_io_DOT__DOT_in_DOT__DOT_ar_DOT__DOT_bits_DOT__DOT_size, 2
npc_DOT_xbar_DOT_io_DOT__DOT_in_DOT__DOT_ar_DOT__DOT_bits_DOT__DOT_size:
	.zero	2
	.section	.sbss.npc_DOT_xbar_DOT_io_DOT__DOT_in_DOT__DOT_ar_DOT__DOT_ready,"aw",@nobits
	.align	2
	.set	.LANCHOR215,. + 0
	.type	npc_DOT_xbar_DOT_io_DOT__DOT_in_DOT__DOT_ar_DOT__DOT_ready, @object
	.size	npc_DOT_xbar_DOT_io_DOT__DOT_in_DOT__DOT_ar_DOT__DOT_ready, 2
npc_DOT_xbar_DOT_io_DOT__DOT_in_DOT__DOT_ar_DOT__DOT_ready:
	.zero	2
	.section	.sbss.npc_DOT_xbar_DOT_io_DOT__DOT_in_DOT__DOT_b_DOT__DOT_ready,"aw",@nobits
	.align	2
	.set	.LANCHOR117,. + 0
	.type	npc_DOT_xbar_DOT_io_DOT__DOT_in_DOT__DOT_b_DOT__DOT_ready, @object
	.size	npc_DOT_xbar_DOT_io_DOT__DOT_in_DOT__DOT_b_DOT__DOT_ready, 2
npc_DOT_xbar_DOT_io_DOT__DOT_in_DOT__DOT_b_DOT__DOT_ready:
	.zero	2
	.section	.sbss.npc_DOT_xbar_DOT_io_DOT__DOT_in_DOT__DOT_r_DOT__DOT_ready,"aw",@nobits
	.align	2
	.set	.LANCHOR272,. + 0
	.type	npc_DOT_xbar_DOT_io_DOT__DOT_in_DOT__DOT_r_DOT__DOT_ready, @object
	.size	npc_DOT_xbar_DOT_io_DOT__DOT_in_DOT__DOT_r_DOT__DOT_ready, 2
npc_DOT_xbar_DOT_io_DOT__DOT_in_DOT__DOT_r_DOT__DOT_ready:
	.zero	2
	.section	.sbss.npc_DOT_xbar_DOT_io_DOT__DOT_in_DOT__DOT_r_DOT__DOT_valid,"aw",@nobits
	.align	2
	.set	.LANCHOR73,. + 0
	.type	npc_DOT_xbar_DOT_io_DOT__DOT_in_DOT__DOT_r_DOT__DOT_valid, @object
	.size	npc_DOT_xbar_DOT_io_DOT__DOT_in_DOT__DOT_r_DOT__DOT_valid, 2
npc_DOT_xbar_DOT_io_DOT__DOT_in_DOT__DOT_r_DOT__DOT_valid:
	.zero	2
	.section	.sbss.npc_DOT_xbar_DOT_io_DOT__DOT_out_DOT__DOT_ar_DOT__DOT_bits_DOT__DOT_addr,"aw",@nobits
	.align	2
	.set	.LANCHOR207,. + 0
	.type	npc_DOT_xbar_DOT_io_DOT__DOT_out_DOT__DOT_ar_DOT__DOT_bits_DOT__DOT_addr, @object
	.size	npc_DOT_xbar_DOT_io_DOT__DOT_out_DOT__DOT_ar_DOT__DOT_bits_DOT__DOT_addr, 4
npc_DOT_xbar_DOT_io_DOT__DOT_out_DOT__DOT_ar_DOT__DOT_bits_DOT__DOT_addr:
	.zero	4
	.section	.sbss.npc_DOT_xbar_DOT_stateRead,"aw",@nobits
	.set	.LANCHOR26,. + 0
	.type	npc_DOT_xbar_DOT_stateRead, @object
	.size	npc_DOT_xbar_DOT_stateRead, 1
npc_DOT_xbar_DOT_stateRead:
	.zero	1
	.section	.sbss.npc_DOT_xbar_DOT_stateWrite,"aw",@nobits
	.set	.LANCHOR29,. + 0
	.type	npc_DOT_xbar_DOT_stateWrite, @object
	.size	npc_DOT_xbar_DOT_stateWrite, 1
npc_DOT_xbar_DOT_stateWrite:
	.zero	1
	.section	.sbss.reset,"aw",@nobits
	.set	.LANCHOR45,. + 0
	.type	reset, @object
	.size	reset, 1
reset:
	.zero	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
