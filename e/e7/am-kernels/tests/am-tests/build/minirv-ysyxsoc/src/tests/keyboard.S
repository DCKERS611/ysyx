#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"keyboard.c"
	.option nopic
	.text
	.section	.rodata.keyboard_test.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"DOWN"
	.align	2
.LC1:
	.string	"UP"
	.align	2
.LC2:
	.string	"Try to press any key (uart or keyboard)...\n"
	.align	2
.LC3:
	.string	"Got (uart): %c (%d)\n"
	.align	2
.LC4:
	.string	"Got  (kbd): %s (%d) %s\n"
	.section	.text.keyboard_test,"ax",@progbits
	.align	2
	.globl	keyboard_test
	.hidden	keyboard_test
	.type	keyboard_test, @function
keyboard_test:
	addi	sp,sp,-20
	lla	a0,.LC2
	sw	ra,16(sp)
	sw	s1,8(sp)
	sw	s0,12(sp)
	call	printf
	mv	a1,sp
	li	a0,1
	call	ioe_read
	lbu	a5,0(sp)
	lla	a4,.LANCHOR0
	mv	a1,sp
	li	a0,7
	sb	a5,0(a4)
	call	ioe_read
	lbu	a5,0(sp)
	lla	a4,.LANCHOR1
	lla	s1,.LANCHOR2
	sb	a5,0(a4)
.L5:
	li	s0,255
.L4:
	lla	a5,.LANCHOR0
	lbu	a5,0(a5)
	bne	a5,zero,.L3
.L2:
	lla	a5,.LANCHOR1
	lbu	a5,0(a5)
	beq	a5,zero,.L4
	j	.L7
.L18:
	call	printf
.L3:
	mv	a1,sp
	li	a0,3
	call	ioe_read
	lbu	a2,0(sp)
	lla	a0,.LC3
	mv	a1,a2
	bne	a2,s0,.L18
	j	.L2
.L19:
	lw	a1,0(a5)
	lla	a3,.LC0
	bne	a4,zero,.L6
	lla	a3,.LC1
.L6:
	call	printf
.L7:
	li	a0,8
	mv	a1,sp
	call	ioe_read
	lw	a2,4(sp)
	lbu	a4,0(sp)
	lla	a0,.LC4
	slli	a5,a2,2
	add	a5,s1,a5
	bne	a2,zero,.L19
	j	.L5
	.size	keyboard_test, .-keyboard_test
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC5:
	.string	"ESCAPE"
	.align	2
.LC6:
	.string	"F1"
	.align	2
.LC7:
	.string	"F2"
	.align	2
.LC8:
	.string	"F3"
	.align	2
.LC9:
	.string	"F4"
	.align	2
.LC10:
	.string	"F5"
	.align	2
.LC11:
	.string	"F6"
	.align	2
.LC12:
	.string	"F7"
	.align	2
.LC13:
	.string	"F8"
	.align	2
.LC14:
	.string	"F9"
	.align	2
.LC15:
	.string	"F10"
	.align	2
.LC16:
	.string	"F11"
	.align	2
.LC17:
	.string	"F12"
	.align	2
.LC18:
	.string	"GRAVE"
	.align	2
.LC19:
	.string	"1"
	.align	2
.LC20:
	.string	"2"
	.align	2
.LC21:
	.string	"3"
	.align	2
.LC22:
	.string	"4"
	.align	2
.LC23:
	.string	"5"
	.align	2
.LC24:
	.string	"6"
	.align	2
.LC25:
	.string	"7"
	.align	2
.LC26:
	.string	"8"
	.align	2
.LC27:
	.string	"9"
	.align	2
.LC28:
	.string	"0"
	.align	2
.LC29:
	.string	"MINUS"
	.align	2
.LC30:
	.string	"EQUALS"
	.align	2
.LC31:
	.string	"BACKSPACE"
	.align	2
.LC32:
	.string	"TAB"
	.align	2
.LC33:
	.string	"Q"
	.align	2
.LC34:
	.string	"W"
	.align	2
.LC35:
	.string	"E"
	.align	2
.LC36:
	.string	"R"
	.align	2
.LC37:
	.string	"T"
	.align	2
.LC38:
	.string	"Y"
	.align	2
.LC39:
	.string	"U"
	.align	2
.LC40:
	.string	"I"
	.align	2
.LC41:
	.string	"O"
	.align	2
.LC42:
	.string	"P"
	.align	2
.LC43:
	.string	"LEFTBRACKET"
	.align	2
.LC44:
	.string	"RIGHTBRACKET"
	.align	2
.LC45:
	.string	"BACKSLASH"
	.align	2
.LC46:
	.string	"CAPSLOCK"
	.align	2
.LC47:
	.string	"A"
	.align	2
.LC48:
	.string	"S"
	.align	2
.LC49:
	.string	"D"
	.align	2
.LC50:
	.string	"F"
	.align	2
.LC51:
	.string	"G"
	.align	2
.LC52:
	.string	"H"
	.align	2
.LC53:
	.string	"J"
	.align	2
.LC54:
	.string	"K"
	.align	2
.LC55:
	.string	"L"
	.align	2
.LC56:
	.string	"SEMICOLON"
	.align	2
.LC57:
	.string	"APOSTROPHE"
	.align	2
.LC58:
	.string	"RETURN"
	.align	2
.LC59:
	.string	"LSHIFT"
	.align	2
.LC60:
	.string	"Z"
	.align	2
.LC61:
	.string	"X"
	.align	2
.LC62:
	.string	"C"
	.align	2
.LC63:
	.string	"V"
	.align	2
.LC64:
	.string	"B"
	.align	2
.LC65:
	.string	"N"
	.align	2
.LC66:
	.string	"M"
	.align	2
.LC67:
	.string	"COMMA"
	.align	2
.LC68:
	.string	"PERIOD"
	.align	2
.LC69:
	.string	"SLASH"
	.align	2
.LC70:
	.string	"RSHIFT"
	.align	2
.LC71:
	.string	"LCTRL"
	.align	2
.LC72:
	.string	"APPLICATION"
	.align	2
.LC73:
	.string	"LALT"
	.align	2
.LC74:
	.string	"SPACE"
	.align	2
.LC75:
	.string	"RALT"
	.align	2
.LC76:
	.string	"RCTRL"
	.align	2
.LC77:
	.string	"LEFT"
	.align	2
.LC78:
	.string	"RIGHT"
	.align	2
.LC79:
	.string	"INSERT"
	.align	2
.LC80:
	.string	"DELETE"
	.align	2
.LC81:
	.string	"HOME"
	.align	2
.LC82:
	.string	"END"
	.align	2
.LC83:
	.string	"PAGEUP"
	.align	2
.LC84:
	.string	"PAGEDOWN"
	.section	.rodata.names,"a"
	.align	2
	.set	.LANCHOR2,. + 0
	.type	names, @object
	.size	names, 332
names:
	.zero	4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.word	.LC10
	.word	.LC11
	.word	.LC12
	.word	.LC13
	.word	.LC14
	.word	.LC15
	.word	.LC16
	.word	.LC17
	.word	.LC18
	.word	.LC19
	.word	.LC20
	.word	.LC21
	.word	.LC22
	.word	.LC23
	.word	.LC24
	.word	.LC25
	.word	.LC26
	.word	.LC27
	.word	.LC28
	.word	.LC29
	.word	.LC30
	.word	.LC31
	.word	.LC32
	.word	.LC33
	.word	.LC34
	.word	.LC35
	.word	.LC36
	.word	.LC37
	.word	.LC38
	.word	.LC39
	.word	.LC40
	.word	.LC41
	.word	.LC42
	.word	.LC43
	.word	.LC44
	.word	.LC45
	.word	.LC46
	.word	.LC47
	.word	.LC48
	.word	.LC49
	.word	.LC50
	.word	.LC51
	.word	.LC52
	.word	.LC53
	.word	.LC54
	.word	.LC55
	.word	.LC56
	.word	.LC57
	.word	.LC58
	.word	.LC59
	.word	.LC60
	.word	.LC61
	.word	.LC62
	.word	.LC63
	.word	.LC64
	.word	.LC65
	.word	.LC66
	.word	.LC67
	.word	.LC68
	.word	.LC69
	.word	.LC70
	.word	.LC71
	.word	.LC72
	.word	.LC73
	.word	.LC74
	.word	.LC75
	.word	.LC76
	.word	.LC1
	.word	.LC0
	.word	.LC77
	.word	.LC78
	.word	.LC79
	.word	.LC80
	.word	.LC81
	.word	.LC82
	.word	.LC83
	.word	.LC84
	.section	.sbss.has_kbd,"aw",@nobits
	.set	.LANCHOR1,. + 0
	.type	has_kbd, @object
	.size	has_kbd, 1
has_kbd:
	.zero	1
	.section	.sbss.has_uart,"aw",@nobits
	.set	.LANCHOR0,. + 0
	.type	has_uart, @object
	.size	has_uart, 1
has_uart:
	.zero	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
