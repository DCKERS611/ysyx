#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"lundump.c"
	.option nopic
	.text
	.section	.rodata.error.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"%s: %s precompiled chunk"
	.section	.text.error,"ax",@progbits
	.align	2
	.type	error, @function
error:
	addi	sp,sp,-12
	lw	a2,8(a0)
	sw	s0,4(sp)
	mv	s0,a0
	lw	a0,0(a0)
	mv	a3,a1
	lla	a1,.LC0
	sw	ra,8(sp)
	call	luaO_pushfstring
	lw	a0,0(s0)
	li	a1,3
	call	luaD_throw
	.size	error, .-error
	.section	.rodata.fchecksize.part.0.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"%s size mismatch in"
	.section	.text.fchecksize.part.0,"ax",@progbits
	.align	2
	.type	fchecksize.part.0, @function
fchecksize.part.0:
	addi	sp,sp,-12
	sw	s0,4(sp)
	mv	s0,a0
	lw	a0,0(a0)
	mv	a2,a1
	lla	a1,.LC1
	sw	ra,8(sp)
	call	luaO_pushfstring
	mv	a1,a0
	mv	a0,s0
	call	error
	.size	fchecksize.part.0, .-fchecksize.part.0
	.section	.rodata.LoadString.str1.4,"aMS",@progbits,1
	.align	2
.LC2:
	.string	"truncated"
	.section	.text.LoadString,"ax",@progbits
	.align	2
	.type	LoadString, @function
LoadString:
	addi	sp,sp,-60
	sw	s0,52(sp)
	mv	s0,a0
	lw	a0,4(a0)
	li	a2,1
	addi	a1,sp,3
	sw	ra,56(sp)
	sw	s1,48(sp)
	call	luaZ_read
	bne	a0,zero,.L9
	lbu	a2,3(sp)
	li	a5,255
	sw	a2,4(sp)
	beq	a2,a5,.L14
	beq	a2,zero,.L12
.L15:
	addi	a2,a2,-1
	sw	a2,4(sp)
	li	a5,40
	bgtu	a2,a5,.L11
	lw	a0,4(s0)
	addi	a1,sp,8
	call	luaZ_read
	bne	a0,zero,.L9
	lw	a2,4(sp)
	lw	a0,0(s0)
	addi	a1,sp,8
	call	luaS_newlstr
	lw	ra,56(sp)
	lw	s0,52(sp)
	mv	s1,a0
	mv	a0,s1
	lw	s1,48(sp)
	addi	sp,sp,60
	jr	ra
.L11:
	lw	a0,0(s0)
	mv	a1,a2
	call	luaS_createlngstrobj
	mv	s1,a0
	lw	a2,4(sp)
	lw	a0,4(s0)
	addi	a1,s1,16
	call	luaZ_read
	bne	a0,zero,.L9
	lw	ra,56(sp)
	lw	s0,52(sp)
	mv	a0,s1
	lw	s1,48(sp)
	addi	sp,sp,60
	jr	ra
.L14:
	lw	a0,4(s0)
	li	a2,4
	addi	a1,sp,4
	call	luaZ_read
	bne	a0,zero,.L9
	lw	a2,4(sp)
	bne	a2,zero,.L15
.L12:
	lw	ra,56(sp)
	lw	s0,52(sp)
	li	s1,0
	mv	a0,s1
	lw	s1,48(sp)
	addi	sp,sp,60
	jr	ra
.L9:
	lla	a1,.LC2
	mv	a0,s0
	call	error
	.size	LoadString, .-LoadString
	.section	.text.LoadFunction,"ax",@progbits
	.align	2
	.type	LoadFunction, @function
LoadFunction:
	addi	sp,sp,-88
	sw	s0,80(sp)
	sw	s1,76(sp)
	sw	ra,84(sp)
	mv	s0,a0
	sw	a1,0(sp)
	mv	s1,a2
	call	LoadString
	beq	a0,zero,.L57
.L17:
	lw	a5,0(sp)
	li	a2,4
	addi	a1,sp,28
	sw	a0,72(a5)
	lw	a0,4(s0)
	call	luaZ_read
	bne	a0,zero,.L19
	lw	a5,28(sp)
	lw	s1,0(sp)
	lw	a0,4(s0)
	li	a2,4
	sw	a5,36(s1)
	addi	a1,sp,24
	call	luaZ_read
	bne	a0,zero,.L19
	lw	a5,24(sp)
	lw	a0,4(s0)
	li	a2,1
	sw	a5,40(s1)
	addi	a1,sp,19
	call	luaZ_read
	bne	a0,zero,.L19
	lbu	a5,19(sp)
	li	a2,1
	addi	a1,sp,18
	sb	a5,6(s1)
	lw	a0,4(s0)
	call	luaZ_read
	bne	a0,zero,.L19
	lbu	a5,18(sp)
	li	a2,1
	addi	a1,sp,17
	sb	a5,7(s1)
	lw	a0,4(s0)
	call	luaZ_read
	bne	a0,zero,.L19
	lbu	a5,17(sp)
	li	a2,4
	addi	a1,sp,72
	sb	a5,8(s1)
	lw	a0,4(s0)
	call	luaZ_read
	bne	a0,zero,.L19
	lw	s1,72(sp)
	li	a5,1073741824
	lw	a0,0(s0)
	addi	a4,s1,1
	bgeu	a4,a5,.L56
	slli	a3,s1,2
	li	a2,0
	li	a1,0
	sw	a3,4(sp)
	call	luaM_realloc_
	lw	a5,0(sp)
	lw	a3,4(sp)
	mv	a1,a0
	lw	a0,4(s0)
	mv	a2,a3
	sw	a1,48(a5)
	sw	s1,20(a5)
	call	luaZ_read
	bne	a0,zero,.L19
	lw	a0,4(s0)
	li	a2,4
	addi	a1,sp,60
	call	luaZ_read
	mv	a4,a0
	bne	a0,zero,.L19
	lw	a5,60(sp)
	li	a3,536870912
	lw	a0,0(s0)
	addi	a2,a5,1
	bgeu	a2,a3,.L56
	sw	a4,12(sp)
	slli	a4,a5,3
	li	a2,0
	mv	a3,a4
	li	a1,0
	sw	a5,4(sp)
	sw	a4,8(sp)
	call	luaM_realloc_
	lw	a2,0(sp)
	lw	a5,4(sp)
	mv	s1,a0
	sw	a0,44(a2)
	sw	a5,16(a2)
	ble	a5,zero,.L22
	lw	a4,8(sp)
	mv	a5,a0
	add	a3,a4,a0
	lw	a4,12(sp)
.L23:
	sw	zero,4(a5)
	addi	a5,a5,8
	bne	a5,a3,.L23
.L31:
	lw	a0,4(s0)
	li	a2,1
	addi	a1,sp,22
	add	s1,s1,a4
	sw	a4,4(sp)
	call	luaZ_read
	bne	a0,zero,.L19
	lbu	a5,22(sp)
	li	a3,20
	lw	a4,4(sp)
	bgtu	a5,a3,.L24
	lla	a3,.L26
	slli	a5,a5,2
	add	a5,a5,a3
	lw	a5,0(a5)
	add	a5,a5,a3
	jr	a5
	.section	.rodata.LoadFunction,"a",@progbits
	.align	2
	.align	2
.L26:
	.word	.L30-.L26
	.word	.L29-.L26
	.word	.L24-.L26
	.word	.L28-.L26
	.word	.L25-.L26
	.word	.L24-.L26
	.word	.L24-.L26
	.word	.L24-.L26
	.word	.L24-.L26
	.word	.L24-.L26
	.word	.L24-.L26
	.word	.L24-.L26
	.word	.L24-.L26
	.word	.L24-.L26
	.word	.L24-.L26
	.word	.L24-.L26
	.word	.L24-.L26
	.word	.L24-.L26
	.word	.L24-.L26
	.word	.L27-.L26
	.word	.L25-.L26
	.section	.text.LoadFunction
.L30:
	sw	zero,4(s1)
.L24:
	lw	a5,8(sp)
	addi	a4,a4,8
	beq	a4,a5,.L22
.L58:
	lw	a5,0(sp)
	lw	s1,44(a5)
	j	.L31
.L25:
	mv	a0,s0
	sw	a4,4(sp)
	call	LoadString
	sw	a0,0(s1)
	lbu	a5,4(a0)
	lw	a4,4(sp)
	ori	a5,a5,64
	sw	a5,4(s1)
	lw	a5,8(sp)
	addi	a4,a4,8
	bne	a4,a5,.L58
.L22:
	lw	a0,4(s0)
	li	a2,4
	addi	a1,sp,56
	call	luaZ_read
	mv	a5,a0
	bne	a0,zero,.L19
	lw	s1,56(sp)
	li	a4,536870912
	lw	a0,0(s0)
	addi	a3,s1,1
	bgeu	a3,a4,.L56
	sw	a5,4(sp)
	slli	a5,s1,3
	li	a2,0
	mv	a3,a5
	li	a1,0
	sw	a5,8(sp)
	call	luaM_realloc_
	lw	a2,0(sp)
	mv	a4,a0
	sw	a0,64(a2)
	sw	s1,12(a2)
	ble	s1,zero,.L33
	lw	a5,8(sp)
	mv	a3,a0
	add	a2,a0,a5
	lw	a5,4(sp)
.L34:
	sw	zero,0(a3)
	addi	a3,a3,8
	bne	a2,a3,.L34
	j	.L35
.L28:
	lw	a0,4(s0)
	li	a2,4
	addi	a1,sp,64
	sw	a4,4(sp)
	call	luaZ_read
	bne	a0,zero,.L19
	li	a5,3
	sw	a5,4(s1)
	lw	a5,64(sp)
	lw	a4,4(sp)
	sw	a5,0(s1)
	j	.L24
.L27:
	lw	a0,4(s0)
	li	a2,4
	addi	a1,sp,68
	sw	a4,4(sp)
	call	luaZ_read
	bne	a0,zero,.L19
	li	a5,19
	sw	a5,4(s1)
	lw	a5,68(sp)
	lw	a4,4(sp)
	sw	a5,0(s1)
	j	.L24
.L29:
	lw	a0,4(s0)
	li	a2,1
	addi	a1,sp,23
	sw	a4,4(sp)
	call	luaZ_read
	bne	a0,zero,.L19
	lbu	a5,23(sp)
	li	a3,1
	lw	a4,4(sp)
	sw	a3,4(s1)
	sw	a5,0(s1)
	j	.L24
.L59:
	lw	a4,0(sp)
	lw	a4,64(a4)
.L35:
	lw	a0,4(s0)
	li	a2,1
	addi	a1,sp,20
	add	s1,a4,a5
	sw	a5,4(sp)
	call	luaZ_read
	bne	a0,zero,.L19
	lbu	a4,20(sp)
	lw	a5,0(sp)
	li	a2,1
	sb	a4,4(s1)
	lw	a4,64(a5)
	lw	a0,4(s0)
	lw	a5,4(sp)
	addi	a1,sp,21
	add	s1,a4,a5
	call	luaZ_read
	bne	a0,zero,.L19
	lbu	a4,21(sp)
	lw	a5,4(sp)
	lw	a3,8(sp)
	sb	a4,5(s1)
	addi	a5,a5,8
	bne	a5,a3,.L59
.L33:
	lw	a0,4(s0)
	li	a2,4
	addi	a1,sp,52
	call	luaZ_read
	mv	s1,a0
	bne	a0,zero,.L19
	lw	t1,52(sp)
	li	a4,1073741824
	lw	a0,0(s0)
	addi	a3,t1,1
	bgeu	a3,a4,.L56
	slli	a5,t1,2
	li	a2,0
	mv	a3,a5
	li	a1,0
	sw	t1,4(sp)
	sw	a5,8(sp)
	call	luaM_realloc_
	lw	a2,0(sp)
	lw	t1,4(sp)
	mv	a4,a0
	sw	a0,52(a2)
	sw	t1,28(a2)
	ble	t1,zero,.L37
	lw	a5,8(sp)
	mv	a3,a0
	add	a2,a5,a0
.L38:
	sw	zero,0(a3)
	addi	a3,a3,4
	bne	a2,a3,.L38
	j	.L39
.L60:
	lw	a5,0(sp)
	lw	a4,52(a5)
.L39:
	lw	a0,0(s0)
	add	a4,a4,s1
	sw	a4,4(sp)
	call	luaF_newproto
	lw	a5,0(sp)
	lw	a4,4(sp)
	lw	a3,52(a5)
	sw	a0,0(a4)
	lw	a2,72(a5)
	add	a3,a3,s1
	lw	a1,0(a3)
	mv	a0,s0
	addi	s1,s1,4
	call	LoadFunction
	lw	a4,8(sp)
	bne	a4,s1,.L60
.L37:
	lw	a0,4(s0)
	li	a2,4
	addi	a1,sp,48
	call	luaZ_read
	bne	a0,zero,.L19
	lw	s1,48(sp)
	li	a5,1073741824
	lw	a0,0(s0)
	addi	a4,s1,1
	bgeu	a4,a5,.L56
	slli	a3,s1,2
	li	a2,0
	li	a1,0
	sw	a3,4(sp)
	call	luaM_realloc_
	lw	a5,0(sp)
	lw	a3,4(sp)
	mv	a1,a0
	lw	a0,4(s0)
	mv	a2,a3
	sw	a1,56(a5)
	sw	s1,24(a5)
	call	luaZ_read
	bne	a0,zero,.L19
	lw	a0,4(s0)
	li	a2,4
	addi	a1,sp,44
	call	luaZ_read
	sw	a0,4(sp)
	bne	a0,zero,.L19
	lw	s1,44(sp)
	li	a5,357912576
	addi	a5,a5,1365
	addi	a4,s1,1
	lw	a0,0(s0)
	bgtu	a4,a5,.L56
	slli	a5,s1,1
	add	a5,a5,s1
	slli	a5,a5,2
	mv	a3,a5
	li	a2,0
	li	a1,0
	sw	a5,8(sp)
	call	luaM_realloc_
	lw	a4,0(sp)
	mv	a5,a0
	sw	a0,60(a4)
	sw	s1,32(a4)
	ble	s1,zero,.L42
	lw	a3,8(sp)
	mv	a4,a0
	add	a3,a0,a3
.L43:
	sw	zero,0(a4)
	addi	a4,a4,12
	bne	a3,a4,.L43
	j	.L44
.L61:
	lw	a5,0(sp)
	lw	a5,60(a5)
.L44:
	lw	a4,4(sp)
	mv	a0,s0
	add	s1,a5,a4
	call	LoadString
	lw	a5,0(sp)
	mv	a4,a0
	lw	a0,4(s0)
	lw	a5,60(a5)
	sw	a4,0(s1)
	lw	a4,4(sp)
	li	a2,4
	addi	a1,sp,36
	add	s1,a5,a4
	call	luaZ_read
	bne	a0,zero,.L19
	lw	a4,36(sp)
	lw	a5,0(sp)
	lw	a0,4(s0)
	li	a2,4
	lw	a5,60(a5)
	sw	a4,4(s1)
	lw	a4,4(sp)
	addi	a1,sp,40
	add	s1,a5,a4
	call	luaZ_read
	bne	a0,zero,.L19
	lw	a4,4(sp)
	lw	a5,40(sp)
	lw	a3,8(sp)
	addi	a4,a4,12
	sw	a4,4(sp)
	sw	a5,8(s1)
	bne	a3,a4,.L61
.L42:
	lw	a0,4(s0)
	li	a2,4
	addi	a1,sp,32
	call	luaZ_read
	bne	a0,zero,.L19
	lw	a5,32(sp)
	li	s1,0
	sw	a5,8(sp)
	ble	a5,zero,.L16
.L45:
	lw	a5,0(sp)
	slli	a3,s1,3
	mv	a0,s0
	lw	a4,64(a5)
	addi	s1,s1,1
	add	a4,a4,a3
	sw	a4,4(sp)
	call	LoadString
	lw	a4,4(sp)
	lw	a5,8(sp)
	sw	a0,0(a4)
	bne	a5,s1,.L45
.L16:
	lw	ra,84(sp)
	lw	s0,80(sp)
	lw	s1,76(sp)
	addi	sp,sp,88
	jr	ra
.L57:
	mv	a0,s1
	j	.L17
.L19:
	lla	a1,.LC2
	mv	a0,s0
	call	error
.L56:
	call	luaM_toobig
	.size	LoadFunction, .-LoadFunction
	.section	.rodata.luaU_undump.str1.4,"aMS",@progbits,1
	.align	2
.LC3:
	.string	"binary string"
	.align	2
.LC4:
	.string	"\033Lua"
	.align	2
.LC5:
	.string	"not a"
	.align	2
.LC6:
	.string	"version mismatch in"
	.align	2
.LC7:
	.string	"format mismatch in"
	.align	2
.LC8:
	.string	"\031\223\r\n\032\n"
	.align	2
.LC9:
	.string	"corrupted"
	.align	2
.LC10:
	.string	"int"
	.align	2
.LC11:
	.string	"size_t"
	.align	2
.LC12:
	.string	"Instruction"
	.align	2
.LC13:
	.string	"lua_Integer"
	.align	2
.LC14:
	.string	"lua_Number"
	.align	2
.LC15:
	.string	"endianness mismatch in"
	.align	2
.LC16:
	.string	"float format mismatch in"
	.section	.text.luaU_undump,"ax",@progbits
	.align	2
	.globl	luaU_undump
	.hidden	luaU_undump
	.type	luaU_undump, @function
luaU_undump:
	addi	sp,sp,-68
	sw	s0,60(sp)
	sw	s1,56(sp)
	sw	ra,64(sp)
	lbu	a5,0(a2)
	li	a4,64
	mv	s0,a0
	mv	s1,a1
	beq	a5,a4,.L63
	li	a4,61
	beq	a5,a4,.L63
	li	a4,27
	bne	a5,a4,.L65
	lla	a2,.LC3
	j	.L65
.L63:
	addi	a2,a2,1
.L65:
	lla	a0,.LC4+1
	sw	a2,28(sp)
	sw	s0,20(sp)
	sw	s1,24(sp)
	call	strlen
	mv	a2,a0
	sw	a0,0(sp)
	addi	a1,sp,32
	mv	a0,s1
	call	luaZ_read
	lw	a2,0(sp)
	bne	a0,zero,.L68
	addi	a1,sp,32
	lla	a0,.LC4+1
	call	memcmp
	bne	a0,zero,.L80
	lw	a0,24(sp)
	li	a2,1
	addi	a1,sp,6
	call	luaZ_read
	bne	a0,zero,.L68
	lbu	a4,6(sp)
	li	a5,83
	bne	a4,a5,.L81
	lw	a0,24(sp)
	li	a2,1
	addi	a1,sp,5
	call	luaZ_read
	bne	a0,zero,.L68
	lbu	a5,5(sp)
	bne	a5,zero,.L82
	lla	a0,.LC8
	call	strlen
	mv	s1,a0
	lw	a0,24(sp)
	mv	a2,s1
	addi	a1,sp,44
	call	luaZ_read
	bne	a0,zero,.L68
	mv	a2,s1
	addi	a1,sp,44
	lla	a0,.LC8
	call	memcmp
	bne	a0,zero,.L83
	lw	a0,24(sp)
	li	a2,1
	addi	a1,sp,11
	call	luaZ_read
	bne	a0,zero,.L68
	lbu	a4,11(sp)
	li	a5,4
	bne	a4,a5,.L84
	lw	a0,24(sp)
	li	a2,1
	addi	a1,sp,10
	call	luaZ_read
	bne	a0,zero,.L68
	lbu	s1,10(sp)
	li	a5,4
	bne	s1,a5,.L85
	lw	a0,24(sp)
	li	a2,1
	addi	a1,sp,9
	call	luaZ_read
	bne	a0,zero,.L68
	lbu	a5,9(sp)
	bne	a5,s1,.L86
	lw	a0,24(sp)
	li	a2,1
	addi	a1,sp,8
	sw	a5,0(sp)
	call	luaZ_read
	bne	a0,zero,.L68
	lbu	s1,8(sp)
	lw	a5,0(sp)
	bne	s1,a5,.L87
	lw	a0,24(sp)
	li	a2,1
	addi	a1,sp,7
	call	luaZ_read
	bne	a0,zero,.L68
	lbu	a5,7(sp)
	bne	a5,s1,.L88
	lw	a0,24(sp)
	li	a2,4
	addi	a1,sp,16
	call	luaZ_read
	bne	a0,zero,.L68
	lw	a4,16(sp)
	li	a5,20480
	addi	a5,a5,1656
	bne	a4,a5,.L89
	lw	a0,24(sp)
	li	a2,4
	addi	a1,sp,12
	call	luaZ_read
	bne	a0,zero,.L68
	lw	a4,12(sp)
	li	a5,370
	bne	a4,a5,.L90
	lw	a0,24(sp)
	li	a2,1
	addi	a1,sp,4
	call	luaZ_read
	bne	a0,zero,.L68
	lbu	a1,4(sp)
	mv	a0,s0
	call	luaF_newLclosure
	lw	a5,12(s0)
	li	a4,70
	mv	s1,a0
	sw	a0,0(a5)
	sw	a4,4(a5)
	mv	a0,s0
	call	luaD_inctop
	mv	a0,s0
	call	luaF_newproto
	sw	a0,12(s1)
	mv	a1,a0
	li	a2,0
	addi	a0,sp,20
	call	LoadFunction
	lw	ra,64(sp)
	lw	s0,60(sp)
	mv	a0,s1
	lw	s1,56(sp)
	addi	sp,sp,68
	jr	ra
.L68:
	lla	a1,.LC2
	addi	a0,sp,20
	call	error
.L90:
	lla	a1,.LC16
	addi	a0,sp,20
	call	error
.L89:
	lla	a1,.LC15
	addi	a0,sp,20
	call	error
.L88:
	lla	a1,.LC14
	addi	a0,sp,20
	call	fchecksize.part.0
.L87:
	lla	a1,.LC13
	addi	a0,sp,20
	call	fchecksize.part.0
.L86:
	lla	a1,.LC12
	addi	a0,sp,20
	call	fchecksize.part.0
.L85:
	lla	a1,.LC11
	addi	a0,sp,20
	call	fchecksize.part.0
.L84:
	lla	a1,.LC10
	addi	a0,sp,20
	call	fchecksize.part.0
.L83:
	lla	a1,.LC9
	addi	a0,sp,20
	call	error
.L82:
	lla	a1,.LC7
	addi	a0,sp,20
	call	error
.L81:
	lla	a1,.LC6
	addi	a0,sp,20
	call	error
.L80:
	lla	a1,.LC5
	addi	a0,sp,20
	call	error
	.size	luaU_undump, .-luaU_undump
	.hidden	luaD_inctop
	.hidden	luaF_newLclosure
	.hidden	luaM_toobig
	.hidden	luaF_newproto
	.hidden	luaM_realloc_
	.hidden	luaS_createlngstrobj
	.hidden	luaS_newlstr
	.hidden	luaZ_read
	.hidden	luaD_throw
	.hidden	luaO_pushfstring
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
