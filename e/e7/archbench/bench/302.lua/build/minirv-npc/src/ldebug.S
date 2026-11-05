#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"ldebug.c"
	.option nopic
	.text
	.section	.rodata.getobjname.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"?"
	.align	2
.LC1:
	.string	"local"
	.align	2
.LC2:
	.string	"field"
	.align	2
.LC3:
	.string	"upvalue"
	.align	2
.LC4:
	.string	"constant"
	.align	2
.LC5:
	.string	"method"
	.align	2
.LC6:
	.string	"global"
	.align	2
.LC7:
	.string	"_ENV"
	.section	.text.getobjname,"ax",@progbits
	.align	2
	.type	getobjname, @function
getobjname:
	addi	sp,sp,-44
	sw	s0,36(sp)
	sw	ra,40(sp)
	sw	s1,32(sp)
	sw	a0,12(sp)
	mv	s0,a1
	sw	a2,0(sp)
	sw	a3,24(sp)
.L20:
	lw	a5,0(sp)
	lw	s1,12(sp)
	mv	a2,s0
	addi	a1,a5,1
	mv	a0,s1
	call	luaF_getlocalname
	lw	a4,24(sp)
	sw	a0,20(sp)
	sw	a0,0(a4)
	bne	a0,zero,.L29
	ble	s0,zero,.L1
	lw	a5,48(s1)
	li	t0,0
	sw	zero,8(sp)
	mv	a0,a5
	lw	a4,0(a0)
	sw	a5,28(sp)
	li	a5,-1
	sw	a5,4(sp)
	li	a5,-131072
	addi	a5,a5,1
	sw	a5,16(sp)
	srli	a3,a4,6
	andi	a5,a4,63
	li	t2,37
	li	t1,0
	li	s1,41
	li	a2,35
	addi	a1,t0,1
	andi	a3,a3,255
	bgtu	a5,t2,.L3
.L46:
	bgtu	a5,a2,.L4
	li	t2,4
	beq	a5,t2,.L5
	li	t2,30
	bne	a5,t2,.L7
	lw	a5,16(sp)
	srli	a4,a4,14
	add	a4,a4,a5
	add	a4,a4,a1
	ble	a4,t1,.L9
	blt	s0,a4,.L9
	lw	a5,8(sp)
	bge	a5,a4,.L9
	sw	a4,8(sp)
.L9:
	ble	s0,a1,.L45
.L28:
	lw	a4,4(a0)
	mv	t0,a1
	li	t2,37
	srli	a3,a4,6
	andi	a5,a4,63
	addi	a0,a0,4
	addi	t1,t1,1
	addi	a1,t0,1
	andi	a3,a3,255
	bleu	a5,t2,.L46
.L3:
	bne	a5,s1,.L7
	lw	a5,0(sp)
	addi	a3,a3,1
	ble	a5,a3,.L9
.L43:
	lw	a5,8(sp)
	bgt	a5,t1,.L10
	sw	t0,4(sp)
	bgt	s0,a1,.L28
.L45:
	lw	a4,4(sp)
	li	a5,-1
	beq	a4,a5,.L1
	slli	a5,a4,2
	lw	a4,28(sp)
	li	a3,12
	add	a5,a4,a5
	lw	a2,0(a5)
	andi	a4,a2,63
	bgtu	a4,a3,.L1
	lla	a1,.L15
	slli	a3,a4,2
	add	a3,a3,a1
	lw	a3,0(a3)
	add	a3,a3,a1
	jr	a3
	.section	.rodata.getobjname,"a",@progbits
	.align	2
	.align	2
.L15:
	.word	.L19-.L15
	.word	.L18-.L15
	.word	.L18-.L15
	.word	.L1-.L15
	.word	.L1-.L15
	.word	.L17-.L15
	.word	.L16-.L15
	.word	.L16-.L15
	.word	.L1-.L15
	.word	.L1-.L15
	.word	.L1-.L15
	.word	.L1-.L15
	.word	.L14-.L15
	.section	.text.getobjname
.L7:
	lla	a4,luaP_opmodes
	add	a5,a4,a5
	lbu	a5,0(a5)
	andi	a5,a5,64
	beq	a5,zero,.L9
	lw	a5,0(sp)
	bne	a5,a3,.L9
	j	.L43
.L5:
	lw	a5,0(sp)
	blt	a5,a3,.L9
	srli	a4,a4,23
	add	a4,a4,a3
	bgt	a5,a4,.L9
	j	.L43
.L4:
	lw	a5,0(sp)
	blt	a5,a3,.L9
	j	.L43
.L17:
	lw	a5,12(sp)
	srli	a2,a2,23
	slli	a2,a2,3
	lw	a5,64(a5)
	add	a5,a5,a2
	lw	a4,0(a5)
	lla	a5,.LC0
	beq	a4,zero,.L25
	addi	a5,a4,16
.L25:
	lw	a4,24(sp)
	sw	a5,0(a4)
	lla	a5,.LC3
	sw	a5,20(sp)
.L1:
	lw	ra,40(sp)
	lw	s0,36(sp)
	lw	a0,20(sp)
	lw	s1,32(sp)
	addi	sp,sp,44
	jr	ra
.L16:
	srli	s0,a2,14
	li	a5,7
	andi	s0,s0,511
	srli	a1,a2,23
	beq	a4,a5,.L47
	lw	a5,12(sp)
	slli	a2,a1,3
	lla	s1,.LC0
	lw	a5,64(a5)
	add	a5,a5,a2
	lw	a5,0(a5)
	beq	a5,zero,.L23
	addi	s1,a5,16
.L23:
	lw	a3,24(sp)
	lw	a1,4(sp)
	lw	a0,12(sp)
	mv	a2,s0
	call	kname
.L22:
	lla	a1,.LC7
	mv	a0,s1
	call	strcmp
	lla	a5,.LC6
	sw	a5,20(sp)
	beq	a0,zero,.L1
.L24:
	lw	ra,40(sp)
	lw	s0,36(sp)
	lla	a5,.LC2
	sw	a5,20(sp)
	lw	a0,20(sp)
	lw	s1,32(sp)
	addi	sp,sp,44
	jr	ra
.L18:
	li	a3,1
	srli	a2,a2,14
	beq	a4,a3,.L27
	lw	a2,4(a5)
	srli	a2,a2,6
.L27:
	lw	a5,12(sp)
	slli	a2,a2,3
	li	a3,4
	lw	a5,44(a5)
	add	a5,a5,a2
	lw	a4,4(a5)
	andi	a4,a4,15
	bne	a4,a3,.L1
	lw	a5,0(a5)
	lla	a4,.LC4
	sw	a4,20(sp)
	lw	a4,24(sp)
	addi	a5,a5,16
	sw	a5,0(a4)
	j	.L1
.L19:
	srli	a5,a2,6
	srli	a4,a2,23
	sw	a4,0(sp)
	andi	a5,a5,255
	ble	a5,a4,.L1
	lw	s0,4(sp)
	j	.L20
.L14:
	lw	a0,12(sp)
	lw	a3,24(sp)
	lw	a1,4(sp)
	srli	a2,a2,14
	andi	a2,a2,511
	call	kname
	lw	ra,40(sp)
	lw	s0,36(sp)
	lla	a5,.LC5
	sw	a5,20(sp)
	lw	a0,20(sp)
	lw	s1,32(sp)
	addi	sp,sp,44
	jr	ra
.L47:
	lw	a2,4(sp)
	lw	a0,12(sp)
	addi	a1,a1,1
	call	luaF_getlocalname
	mv	s1,a0
	lw	a3,24(sp)
	lw	a1,4(sp)
	lw	a0,12(sp)
	mv	a2,s0
	call	kname
	beq	s1,zero,.L24
	j	.L22
.L10:
	ble	s0,a1,.L1
	li	a5,-1
	sw	a5,4(sp)
	j	.L28
.L29:
	lla	a5,.LC1
	sw	a5,20(sp)
	j	.L1
	.size	getobjname, .-getobjname
	.section	.text.kname,"ax",@progbits
	.align	2
	.type	kname, @function
kname:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	andi	t1,a2,256
	mv	s0,a3
	beq	t1,zero,.L49
	lw	a4,44(a0)
	andi	a5,a2,-257
	slli	a5,a5,3
	add	a5,a4,a5
	lw	a4,4(a5)
	li	a3,4
	andi	a4,a4,15
	beq	a4,a3,.L50
.L52:
	lla	a5,.LC0
	sw	a5,0(s0)
.L48:
	lw	ra,8(sp)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
.L49:
	call	getobjname
	beq	a0,zero,.L52
	lbu	a4,0(a0)
	li	a5,99
	bne	a4,a5,.L52
	j	.L48
.L50:
	lw	a5,0(a5)
	lw	ra,8(sp)
	addi	a5,a5,16
	sw	a5,0(s0)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
	.size	kname, .-kname
	.section	.rodata.findlocal.constprop.0.str1.4,"aMS",@progbits,1
	.align	2
.LC8:
	.string	"(*temporary)"
	.align	2
.LC9:
	.string	"(*vararg)"
	.section	.text.findlocal.constprop.0,"ax",@progbits
	.align	2
	.type	findlocal.constprop.0, @function
findlocal.constprop.0:
	lhu	a5,34(a1)
	addi	sp,sp,-24
	sw	s0,16(sp)
	sw	s1,12(sp)
	sw	ra,20(sp)
	andi	a5,a5,2
	mv	s1,a1
	mv	a4,a0
	lw	a1,0(a1)
	mv	s0,a2
	beq	a5,zero,.L58
	lw	a2,0(a1)
	lw	a5,16(s1)
	lw	a0,12(a2)
	blt	s0,zero,.L71
	lw	a2,20(s1)
	lw	t1,48(a0)
	mv	a1,s0
	sw	a3,8(sp)
	sub	a2,a2,t1
	srai	a2,a2,2
	addi	a2,a2,-1
	sw	a4,4(sp)
	sw	a5,0(sp)
	call	luaF_getlocalname
	lw	a5,0(sp)
	lw	a4,4(sp)
	lw	a3,8(sp)
	beq	a0,zero,.L62
.L63:
	slli	s0,s0,3
	addi	s0,s0,-8
	add	a5,a5,s0
	sw	a5,0(a3)
.L57:
	lw	ra,20(sp)
	lw	s0,16(sp)
	lw	s1,12(sp)
	addi	sp,sp,24
	jr	ra
.L58:
	addi	a5,a1,8
.L62:
	lw	a2,20(a4)
	beq	s1,a2,.L72
	lw	a4,12(s1)
	lw	a4,0(a4)
.L65:
	sub	a4,a4,a5
	srai	a4,a4,3
	bgt	s0,a4,.L66
	ble	s0,zero,.L66
	lla	a0,.LC8
	j	.L63
.L66:
	lw	ra,20(sp)
	lw	s0,16(sp)
	lw	s1,12(sp)
	li	a0,0
	addi	sp,sp,24
	jr	ra
.L71:
	lbu	a4,6(a0)
	sub	a5,a5,a1
	srai	a5,a5,3
	neg	a2,s0
	sub	a5,a5,a4
	bge	a2,a5,.L66
	sub	a4,a4,s0
	slli	a4,a4,3
	add	a4,a1,a4
	sw	a4,0(a3)
	lla	a0,.LC9
	j	.L57
.L72:
	lw	a4,12(a4)
	j	.L65
	.size	findlocal.constprop.0, .-findlocal.constprop.0
	.section	.rodata.varinfo.str1.4,"aMS",@progbits,1
	.align	2
.LC10:
	.string	""
	.align	2
.LC11:
	.string	" (%s '%s')"
	.section	.text.varinfo,"ax",@progbits
	.align	2
	.type	varinfo, @function
varinfo:
	lw	t1,20(a0)
	addi	sp,sp,-16
	sw	ra,12(sp)
	lhu	a5,34(t1)
	sw	s0,8(sp)
	sw	zero,0(sp)
	andi	a5,a5,2
	bne	a5,zero,.L74
.L81:
	lla	a0,.LC10
.L73:
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16
	jr	ra
.L74:
	lw	a5,0(t1)
	mv	s0,a0
	lw	a0,0(a5)
	lbu	a2,6(a0)
	beq	a2,zero,.L76
	addi	a4,a0,16
	li	a5,0
	j	.L80
.L77:
	addi	a5,a5,1
	beq	a5,a2,.L76
.L80:
	lw	a3,0(a4)
	addi	a4,a4,4
	lw	a3,0(a3)
	bne	a1,a3,.L77
	lw	a4,12(a0)
	slli	a5,a5,3
	lw	a4,64(a4)
	add	a5,a4,a5
	lw	a5,0(a5)
	beq	a5,zero,.L83
	addi	a5,a5,16
.L78:
	sw	a5,0(sp)
	lla	a2,.LC3
.L79:
	lw	a3,0(sp)
	lla	a1,.LC11
	mv	a0,s0
	call	luaO_pushfstring
	j	.L73
.L76:
	lw	a2,16(t1)
	sub	a2,a1,a2
	blt	a2,zero,.L81
	lw	a5,4(t1)
	bgeu	a1,a5,.L81
	lw	a0,12(a0)
	lw	a5,20(t1)
	srai	a2,a2,3
	lw	a4,48(a0)
	mv	a3,sp
	sub	a5,a5,a4
	srai	a1,a5,2
	addi	a1,a1,-1
	call	getobjname
	mv	a2,a0
	beq	a0,zero,.L81
	j	.L79
.L83:
	lla	a5,.LC0
	j	.L78
	.size	varinfo, .-varinfo
	.section	.text.lua_sethook,"ax",@progbits
	.align	2
	.globl	lua_sethook
	.hidden	lua_sethook
	.type	lua_sethook, @function
lua_sethook:
	beq	a1,zero,.L95
	andi	a5,a2,255
	beq	a2,zero,.L96
	mv	a2,a5
.L93:
	lw	a4,20(a0)
	lhu	a5,34(a4)
	andi	a5,a5,2
	beq	a5,zero,.L94
	lw	a5,20(a4)
	sw	a5,24(a0)
.L94:
	sw	a1,88(a0)
	sw	a3,100(a0)
	sw	a3,104(a0)
	sw	a2,112(a0)
	ret
.L96:
	li	a1,0
	j	.L93
.L95:
	li	a2,0
	j	.L93
	.size	lua_sethook, .-lua_sethook
	.section	.text.lua_gethook,"ax",@progbits
	.align	2
	.globl	lua_gethook
	.hidden	lua_gethook
	.type	lua_gethook, @function
lua_gethook:
	lw	a0,88(a0)
	ret
	.size	lua_gethook, .-lua_gethook
	.section	.text.lua_gethookmask,"ax",@progbits
	.align	2
	.globl	lua_gethookmask
	.hidden	lua_gethookmask
	.type	lua_gethookmask, @function
lua_gethookmask:
	lw	a0,112(a0)
	ret
	.size	lua_gethookmask, .-lua_gethookmask
	.section	.text.lua_gethookcount,"ax",@progbits
	.align	2
	.globl	lua_gethookcount
	.hidden	lua_gethookcount
	.type	lua_gethookcount, @function
lua_gethookcount:
	lw	a0,100(a0)
	ret
	.size	lua_gethookcount, .-lua_gethookcount
	.section	.text.lua_getstack,"ax",@progbits
	.align	2
	.globl	lua_getstack
	.hidden	lua_getstack
	.type	lua_getstack, @function
lua_getstack:
	blt	a1,zero,.L117
	lw	a5,20(a0)
	addi	a0,a0,52
	beq	a1,zero,.L105
.L118:
	beq	a0,a5,.L117
	addi	a1,a1,-1
	lw	a5,8(a5)
	bne	a1,zero,.L118
.L105:
	beq	a0,a5,.L117
	sw	a5,96(a2)
	li	a0,1
	ret
.L117:
	li	a0,0
	ret
	.size	lua_getstack, .-lua_getstack
	.section	.text.lua_getlocal,"ax",@progbits
	.align	2
	.globl	lua_getlocal
	.hidden	lua_getlocal
	.type	lua_getlocal, @function
lua_getlocal:
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	ra,12(sp)
	lbu	a4,8(a0)
	li	a5,1
	mv	s0,a0
	mv	t1,a2
	beq	a4,a5,.L130
	beq	a1,zero,.L131
.L121:
	lw	a1,96(a1)
	mv	a3,sp
	mv	a2,t1
	mv	a0,s0
	sw	zero,0(sp)
	call	findlocal.constprop.0
	beq	a0,zero,.L122
	lw	a4,0(sp)
	lw	a5,12(s0)
	lw	a2,0(a4)
	addi	a3,a5,8
	sw	a2,0(a5)
	lw	a4,4(a4)
	sw	a4,4(a5)
	sw	a3,12(s0)
.L122:
	lbu	a4,8(s0)
	li	a5,1
	bne	a4,a5,.L119
	lw	a5,20(s0)
	lw	a4,32(s0)
	lw	a3,0(a5)
	lw	a2,28(a5)
	sub	a3,a3,a4
	add	a4,a4,a2
	sw	a4,0(a5)
	sw	a3,28(a5)
.L119:
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16
	jr	ra
.L130:
	lw	a5,20(a0)
	lw	a4,32(a0)
	lw	a3,0(a5)
	lw	a2,28(a5)
	sub	a3,a3,a4
	add	a4,a4,a2
	sw	a4,0(a5)
	sw	a3,28(a5)
	bne	a1,zero,.L121
.L131:
	lw	a5,12(s0)
	li	a4,70
	li	a0,0
	lw	a3,-4(a5)
	bne	a3,a4,.L122
	lw	a5,-8(a5)
	li	a2,0
	mv	a1,t1
	lw	a0,12(a5)
	call	luaF_getlocalname
	j	.L122
	.size	lua_getlocal, .-lua_getlocal
	.section	.text.lua_setlocal,"ax",@progbits
	.align	2
	.globl	lua_setlocal
	.hidden	lua_setlocal
	.type	lua_setlocal, @function
lua_setlocal:
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	ra,12(sp)
	lbu	a4,8(a0)
	sw	zero,0(sp)
	li	a5,1
	mv	s0,a0
	bne	a4,a5,.L133
	lw	a5,20(a0)
	lw	a4,32(a0)
	lw	a3,0(a5)
	lw	a0,28(a5)
	sub	a3,a3,a4
	add	a4,a4,a0
	sw	a4,0(a5)
	sw	a3,28(a5)
.L133:
	lw	a1,96(a1)
	mv	a3,sp
	mv	a0,s0
	call	findlocal.constprop.0
	beq	a0,zero,.L134
	lw	a5,12(s0)
	lw	a4,0(sp)
	lw	a2,-8(a5)
	addi	a3,a5,-8
	sw	a2,0(a4)
	lw	a5,-4(a5)
	sw	a5,4(a4)
	sw	a3,12(s0)
.L134:
	lbu	a4,8(s0)
	li	a5,1
	bne	a4,a5,.L132
	lw	a5,20(s0)
	lw	a4,32(s0)
	lw	a3,0(a5)
	lw	a2,28(a5)
	sub	a3,a3,a4
	add	a4,a4,a2
	sw	a4,0(a5)
	sw	a3,28(a5)
.L132:
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	lua_setlocal, .-lua_setlocal
	.section	.rodata.lua_getinfo.str1.4,"aMS",@progbits,1
	.align	2
.LC12:
	.string	"=?"
	.align	2
.LC13:
	.string	"main"
	.align	2
.LC14:
	.string	"Lua"
	.align	2
.LC15:
	.string	"C"
	.align	2
.LC16:
	.string	"=[C]"
	.align	2
.LC17:
	.string	"for iterator"
	.align	2
.LC18:
	.string	"metamethod"
	.align	2
.LC19:
	.string	"hook"
	.align	2
.LC20:
	.string	"__gc"
	.section	.text.lua_getinfo,"ax",@progbits
	.align	2
	.globl	lua_getinfo
	.hidden	lua_getinfo
	.type	lua_getinfo, @function
lua_getinfo:
	addi	sp,sp,-48
	sw	s1,36(sp)
	sw	ra,44(sp)
	sw	s0,40(sp)
	mv	s1,a0
	lbu	a0,8(a0)
	li	a3,1
	mv	a4,a1
	mv	a5,a2
	bne	a0,a3,.L141
	lw	a3,20(s1)
	lw	a2,32(s1)
	lw	a1,0(a3)
	lw	a0,28(a3)
	sub	a1,a1,a2
	add	a2,a2,a0
	sw	a2,0(a3)
	sw	a1,28(a3)
.L141:
	lbu	a3,0(a4)
	li	a2,62
	beq	a3,a2,.L230
	lw	t0,96(a5)
	lw	t2,0(t0)
.L143:
	lw	a2,4(t2)
	li	a1,6
	sw	zero,0(sp)
	andi	a2,a2,31
	beq	a2,a1,.L231
	beq	a3,zero,.L189
.L233:
	sw	s1,16(sp)
	lw	s1,0(sp)
	li	a2,1
	mv	s0,a4
	sw	t2,20(sp)
	sw	a4,24(sp)
	lla	t1,.L148
	mv	t2,a2
	mv	a4,t0
.L178:
	addi	a3,a3,-76
	andi	a3,a3,0xff
	li	a2,41
	bgtu	a3,a2,.L146
	slli	a3,a3,2
	add	a3,a3,t1
	lw	a3,0(a3)
	add	a3,a3,t1
	jr	a3
	.section	.rodata.lua_getinfo,"a",@progbits
	.align	2
	.align	2
.L148:
	.word	.L152-.L148
	.word	.L146-.L148
	.word	.L146-.L148
	.word	.L146-.L148
	.word	.L146-.L148
	.word	.L146-.L148
	.word	.L146-.L148
	.word	.L153-.L148
	.word	.L146-.L148
	.word	.L146-.L148
	.word	.L146-.L148
	.word	.L146-.L148
	.word	.L146-.L148
	.word	.L146-.L148
	.word	.L146-.L148
	.word	.L146-.L148
	.word	.L146-.L148
	.word	.L146-.L148
	.word	.L146-.L148
	.word	.L146-.L148
	.word	.L146-.L148
	.word	.L146-.L148
	.word	.L146-.L148
	.word	.L146-.L148
	.word	.L146-.L148
	.word	.L146-.L148
	.word	.L152-.L148
	.word	.L146-.L148
	.word	.L146-.L148
	.word	.L146-.L148
	.word	.L146-.L148
	.word	.L146-.L148
	.word	.L151-.L148
	.word	.L146-.L148
	.word	.L150-.L148
	.word	.L146-.L148
	.word	.L146-.L148
	.word	.L146-.L148
	.word	.L146-.L148
	.word	.L146-.L148
	.word	.L149-.L148
	.word	.L147-.L148
	.section	.text.lua_getinfo
.L146:
	li	t2,0
.L152:
	lbu	a3,1(s0)
	addi	s0,s0,1
	bne	a3,zero,.L178
	sw	t2,12(sp)
	lw	s1,16(sp)
	lw	t2,20(sp)
	lw	a4,24(sp)
.L145:
	mv	a0,a4
	li	a1,102
	sw	a4,4(sp)
	sw	t2,8(sp)
	call	strchr
	lw	a4,4(sp)
	beq	a0,zero,.L179
	lw	t2,8(sp)
	lw	a5,12(s1)
	lw	a2,0(t2)
	addi	a3,a5,8
	sw	a2,0(a5)
	lw	a2,4(t2)
	sw	a2,4(a5)
	sw	a3,12(s1)
.L179:
	lbu	a3,8(s1)
	li	a5,1
	bne	a3,a5,.L180
	lw	a5,20(s1)
	lw	a3,32(s1)
	lw	a2,0(a5)
	lw	a1,28(a5)
	sub	a2,a2,a3
	add	a3,a3,a1
	sw	a3,0(a5)
	sw	a2,28(a5)
.L180:
	li	a1,76
	mv	a0,a4
	call	strchr
	beq	a0,zero,.L140
	lw	a5,0(sp)
	beq	a5,zero,.L182
	lbu	a3,4(a5)
	li	a5,38
	bne	a3,a5,.L183
.L182:
	lw	a5,12(s1)
	sw	zero,4(a5)
	addi	a5,a5,8
	sw	a5,12(s1)
.L140:
	lw	ra,44(sp)
	lw	s0,40(sp)
	lw	a0,12(sp)
	lw	s1,36(sp)
	addi	sp,sp,48
	jr	ra
.L153:
	beq	s1,zero,.L154
	lbu	a2,4(s1)
	li	a3,38
	beq	a2,a3,.L154
	lw	a3,12(s1)
	lla	a1,.LC12
	lw	a2,72(a3)
	beq	a2,zero,.L157
	addi	a1,a2,16
.L157:
	lw	a0,36(a3)
	lw	a2,40(a3)
	sw	a1,16(a5)
	sw	a0,24(a5)
	lla	a3,.LC13
	bne	a0,zero,.L232
.L156:
	sw	a2,28(a5)
	sw	a3,12(a5)
	addi	a0,a5,36
	li	a2,60
	sw	t2,12(sp)
	sw	a4,8(sp)
	sw	a5,4(sp)
	call	luaO_chunkid
	lw	a5,4(sp)
	lw	a4,8(sp)
	lw	t2,12(sp)
	lla	t1,.L148
	j	.L152
.L147:
	beq	s1,zero,.L160
	lbu	a2,6(s1)
	li	a3,38
	sb	a2,32(a5)
	lbu	a2,4(s1)
	beq	a2,a3,.L187
	lw	a3,12(s1)
	lbu	a2,7(a3)
	sb	a2,34(a5)
	lbu	a3,6(a3)
	sb	a3,33(a5)
	j	.L152
.L149:
	li	a3,0
	beq	a4,zero,.L162
	lhu	a3,34(a4)
	andi	a3,a3,32
.L162:
	sb	a3,35(a5)
	j	.L152
.L150:
	beq	a4,zero,.L165
	lhu	a3,34(a4)
	andi	a2,a3,256
	bne	a2,zero,.L196
	andi	a3,a3,32
	bne	a3,zero,.L165
	lw	a3,8(a4)
	lhu	a2,34(a3)
	andi	a1,a2,2
	beq	a1,zero,.L165
	lw	a1,0(a3)
	lw	a3,20(a3)
	andi	a2,a2,4
	lw	a1,0(a1)
	lw	ra,-4(a3)
	lw	a0,12(a1)
	lw	a1,48(a0)
	sub	t0,a3,a1
	bne	a2,zero,.L197
	andi	a2,ra,63
	addi	a3,a2,-6
	li	a1,35
	bgtu	a3,a1,.L165
	lla	a1,.L166
	slli	a3,a3,2
	add	a3,a3,a1
	lw	a3,0(a3)
	add	a3,a3,a1
	jr	a3
	.section	.rodata.lua_getinfo
	.align	2
	.align	2
.L166:
	.word	.L198-.L166
	.word	.L198-.L166
	.word	.L177-.L166
	.word	.L165-.L166
	.word	.L177-.L166
	.word	.L165-.L166
	.word	.L198-.L166
	.word	.L175-.L166
	.word	.L175-.L166
	.word	.L175-.L166
	.word	.L175-.L166
	.word	.L175-.L166
	.word	.L175-.L166
	.word	.L175-.L166
	.word	.L175-.L166
	.word	.L175-.L166
	.word	.L175-.L166
	.word	.L175-.L166
	.word	.L175-.L166
	.word	.L174-.L166
	.word	.L173-.L166
	.word	.L165-.L166
	.word	.L172-.L166
	.word	.L171-.L166
	.word	.L165-.L166
	.word	.L170-.L166
	.word	.L169-.L166
	.word	.L168-.L166
	.word	.L165-.L166
	.word	.L165-.L166
	.word	.L167-.L166
	.word	.L167-.L166
	.word	.L165-.L166
	.word	.L165-.L166
	.word	.L165-.L166
	.word	.L199-.L166
	.section	.text.lua_getinfo
.L151:
	li	a2,-1
	beq	a4,zero,.L159
	lhu	a3,34(a4)
	andi	a3,a3,2
	beq	a3,zero,.L159
	lw	a3,0(a4)
	lw	a3,0(a3)
	lw	a1,12(a3)
	lw	a3,56(a1)
	beq	a3,zero,.L159
	lw	a2,20(a4)
	lw	a1,48(a1)
	sub	a2,a2,a1
	add	a3,a3,a2
	lw	a2,-4(a3)
.L159:
	sw	a2,20(a5)
	j	.L152
.L154:
	li	a3,-1
	lla	a1,.LC16
	sw	a3,24(a5)
	sw	a1,16(a5)
	li	a2,-1
	lla	a3,.LC15
	j	.L156
.L160:
	sb	zero,32(a5)
.L187:
	li	a3,1
	sb	a3,34(a5)
	sb	zero,33(a5)
	j	.L152
.L231:
	lw	a2,0(t2)
	sw	a2,0(sp)
	bne	a3,zero,.L233
.L189:
	li	a5,1
	sw	a5,12(sp)
	j	.L145
.L232:
	lla	a3,.LC14
	j	.L156
.L167:
	srli	a2,ra,6
	srai	a1,t0,2
	addi	a3,a5,4
	andi	a2,a2,0xff
	addi	a1,a1,-1
	sw	t2,12(sp)
	sw	a4,8(sp)
	sw	a5,4(sp)
	call	getobjname
	lw	a5,4(sp)
	lw	a4,8(sp)
	lw	t2,12(sp)
	sw	a0,8(a5)
	lla	t1,.L148
	bne	a0,zero,.L152
.L165:
	lla	a3,.LC10
	sw	a3,8(a5)
	sw	zero,4(a5)
	j	.L152
.L196:
	lla	a3,.LC20
	lla	a2,.LC18
.L164:
	sw	a3,4(a5)
	sw	a2,8(a5)
	j	.L152
.L230:
	lw	a3,12(s1)
	addi	a4,a4,1
	li	t0,0
	addi	t2,a3,-8
	sw	t2,12(s1)
	lbu	a3,0(a4)
	j	.L143
.L183:
	lw	a5,0(sp)
	mv	a0,s1
	lw	a3,12(a5)
	li	a5,0
	sw	a5,4(sp)
	lw	s0,56(a3)
	call	luaH_new
	lw	a3,12(s1)
	lw	a5,0(sp)
	li	a2,69
	sw	a0,0(a3)
	sw	a2,4(a3)
	mv	a1,a0
	lw	a0,12(a5)
	li	a2,1
	addi	a3,a3,8
	lw	a0,24(a0)
	sw	a2,28(sp)
	sw	a3,12(s1)
	sw	a2,32(sp)
	ble	a0,zero,.L140
	lw	a5,4(sp)
	mv	a0,s1
	mv	s1,a5
.L185:
	lw	a2,0(s0)
	addi	a3,sp,28
	sw	a1,8(sp)
	sw	a0,4(sp)
	call	luaH_setint
	lw	a5,0(sp)
	addi	s1,s1,1
	lw	a0,4(sp)
	lw	a3,12(a5)
	lw	a1,8(sp)
	addi	s0,s0,4
	lw	a3,24(a3)
	blt	s1,a3,.L185
	lw	ra,44(sp)
	lw	s0,40(sp)
	lw	a0,12(sp)
	lw	s1,36(sp)
	addi	sp,sp,48
	jr	ra
.L197:
	lla	a3,.LC0
	lla	a2,.LC19
	j	.L164
.L175:
	addi	a3,a2,-7
.L176:
	lw	a2,16(sp)
	addi	a3,a3,28
	slli	a3,a3,2
	lw	a2,16(a2)
	add	a3,a2,a3
	lw	a3,12(a3)
	lla	a2,.LC18
	addi	a3,a3,16
	j	.L164
.L198:
	li	a3,0
	j	.L176
.L177:
	li	a3,1
	j	.L176
.L168:
	li	a3,21
	j	.L176
.L169:
	li	a3,20
	j	.L176
.L170:
	li	a3,5
	j	.L176
.L171:
	li	a3,22
	j	.L176
.L172:
	li	a3,4
	j	.L176
.L173:
	li	a3,19
	j	.L176
.L174:
	li	a3,18
	j	.L176
.L199:
	lla	a3,.LC17
	mv	a2,a3
	j	.L164
	.size	lua_getinfo, .-lua_getinfo
	.section	.rodata.luaG_addinfo.str1.4,"aMS",@progbits,1
	.align	2
.LC21:
	.string	"%s:%d: %s"
	.section	.text.luaG_addinfo,"ax",@progbits
	.align	2
	.globl	luaG_addinfo
	.hidden	luaG_addinfo
	.type	luaG_addinfo, @function
luaG_addinfo:
	addi	sp,sp,-80
	sw	s0,72(sp)
	sw	s1,68(sp)
	sw	ra,76(sp)
	mv	s0,a0
	mv	s1,a1
	beq	a2,zero,.L235
	mv	a5,a2
	addi	a0,sp,8
	li	a2,60
	addi	a1,a5,16
	sw	a3,4(sp)
	sw	a0,0(sp)
	call	luaO_chunkid
	lw	a0,0(sp)
	lw	a3,4(sp)
.L236:
	mv	a4,s1
	mv	a2,a0
	lla	a1,.LC21
	mv	a0,s0
	call	luaO_pushfstring
	lw	ra,76(sp)
	lw	s0,72(sp)
	lw	s1,68(sp)
	addi	sp,sp,80
	jr	ra
.L235:
	li	a5,63
	sh	a5,8(sp)
	addi	a0,sp,8
	j	.L236
	.size	luaG_addinfo, .-luaG_addinfo
	.section	.text.luaG_errormsg,"ax",@progbits
	.align	2
	.globl	luaG_errormsg
	.hidden	luaG_errormsg
	.type	luaG_errormsg, @function
luaG_errormsg:
	lw	a4,92(a0)
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	bne	a4,zero,.L244
.L239:
	li	a1,2
	mv	a0,s0
	call	luaD_throw
.L244:
	lw	a5,12(a0)
	lw	a3,32(a0)
	li	a2,1
	lw	t1,-8(a5)
	lw	a1,-4(a5)
	add	a4,a3,a4
	sw	t1,0(a5)
	sw	a1,4(a5)
	lw	t1,0(a4)
	addi	a3,a5,8
	addi	a1,a5,-8
	sw	t1,-8(a5)
	lw	a4,4(a4)
	sw	a4,-4(a5)
	sw	a3,12(a0)
	call	luaD_callnoyield
	j	.L239
	.size	luaG_errormsg, .-luaG_errormsg
	.section	.text.luaG_runerror,"ax",@progbits
	.align	2
	.globl	luaG_runerror
	.hidden	luaG_runerror
	.type	luaG_runerror, @function
luaG_runerror:
	addi	sp,sp,-32
	addi	t1,sp,16
	sw	s1,4(sp)
	lw	s1,20(a0)
	sw	a2,16(sp)
	mv	a2,t1
	sw	s0,8(sp)
	sw	a5,28(sp)
	sw	ra,12(sp)
	mv	s0,a0
	sw	a3,20(sp)
	sw	a4,24(sp)
	sw	t1,0(sp)
	call	luaO_pushvfstring
	lhu	a5,34(s1)
	andi	a5,a5,2
	bne	a5,zero,.L253
.L246:
	mv	a0,s0
	call	luaG_errormsg
.L253:
	lw	a5,0(s1)
	lw	a5,0(a5)
	lw	a4,12(a5)
	lw	a5,56(a4)
	lw	a2,72(a4)
	beq	a5,zero,.L248
	lw	a3,20(s1)
	lw	a4,48(a4)
	sub	a4,a3,a4
	add	a5,a5,a4
	lw	a3,-4(a5)
.L247:
	mv	a1,a0
	mv	a0,s0
	call	luaG_addinfo
	j	.L246
.L248:
	li	a3,-1
	j	.L247
	.size	luaG_runerror, .-luaG_runerror
	.section	.rodata.luaG_typeerror.str1.4,"aMS",@progbits,1
	.align	2
.LC22:
	.string	"attempt to %s a %s value%s"
	.section	.text.luaG_typeerror,"ax",@progbits
	.align	2
	.globl	luaG_typeerror
	.hidden	luaG_typeerror
	.type	luaG_typeerror, @function
luaG_typeerror:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	mv	s0,a0
	mv	s1,a2
	sw	a1,0(sp)
	call	luaT_objtypename
	lw	a5,0(sp)
	sw	a0,0(sp)
	mv	a0,s0
	mv	a1,a5
	call	varinfo
	lw	a3,0(sp)
	mv	a4,a0
	mv	a2,s1
	lla	a1,.LC22
	mv	a0,s0
	call	luaG_runerror
	.size	luaG_typeerror, .-luaG_typeerror
	.section	.rodata.luaG_concaterror.str1.4,"aMS",@progbits,1
	.align	2
.LC23:
	.string	"concatenate"
	.section	.text.luaG_concaterror,"ax",@progbits
	.align	2
	.globl	luaG_concaterror
	.hidden	luaG_concaterror
	.type	luaG_concaterror, @function
luaG_concaterror:
	lw	a5,4(a1)
	addi	sp,sp,-12
	sw	ra,8(sp)
	andi	a5,a5,15
	addi	a5,a5,-3
	li	a4,1
	bgtu	a5,a4,.L257
	mv	a1,a2
.L257:
	lla	a2,.LC23
	call	luaG_typeerror
	.size	luaG_concaterror, .-luaG_concaterror
	.section	.text.luaG_opinterror,"ax",@progbits
	.align	2
	.globl	luaG_opinterror
	.hidden	luaG_opinterror
	.type	luaG_opinterror, @function
luaG_opinterror:
	lw	a4,4(a1)
	addi	sp,sp,-24
	sw	s0,16(sp)
	sw	s1,12(sp)
	sw	ra,20(sp)
	li	a5,3
	mv	s1,a2
	mv	s0,a1
	mv	t1,a0
	mv	a2,a3
	bne	a4,a5,.L260
	lw	a5,0(a1)
	sw	a5,8(sp)
.L261:
	mv	a1,s1
	mv	a0,t1
	call	luaG_typeerror
.L260:
	sw	a0,0(sp)
	addi	a1,sp,8
	mv	a0,s0
	sw	a3,4(sp)
	call	luaV_tonumber_
	lw	t1,0(sp)
	lw	a2,4(sp)
	bne	a0,zero,.L261
	mv	s1,s0
	j	.L261
	.size	luaG_opinterror, .-luaG_opinterror
	.section	.rodata.luaG_tointerror.str1.4,"aMS",@progbits,1
	.align	2
.LC24:
	.string	"number%s has no integer representation"
	.section	.text.luaG_tointerror,"ax",@progbits
	.align	2
	.globl	luaG_tointerror
	.hidden	luaG_tointerror
	.type	luaG_tointerror, @function
luaG_tointerror:
	lw	a3,4(a1)
	addi	sp,sp,-20
	sw	s0,12(sp)
	sw	s1,8(sp)
	sw	ra,16(sp)
	li	a4,19
	mv	s0,a1
	mv	s1,a0
	mv	a5,a2
	bne	a3,a4,.L264
	lw	a4,0(a1)
	sw	a4,4(sp)
.L265:
	mv	a1,a5
	mv	a0,s1
	call	varinfo
	mv	a2,a0
	lla	a1,.LC24
	mv	a0,s1
	call	luaG_runerror
.L264:
	sw	a2,0(sp)
	addi	a1,sp,4
	li	a2,0
	mv	a0,s0
	call	luaV_tointeger
	lw	a5,0(sp)
	bne	a0,zero,.L265
	mv	a5,s0
	j	.L265
	.size	luaG_tointerror, .-luaG_tointerror
	.section	.rodata.luaG_ordererror.str1.4,"aMS",@progbits,1
	.align	2
.LC25:
	.string	"attempt to compare two %s values"
	.align	2
.LC26:
	.string	"attempt to compare %s with %s"
	.section	.text.luaG_ordererror,"ax",@progbits
	.align	2
	.globl	luaG_ordererror
	.hidden	luaG_ordererror
	.type	luaG_ordererror, @function
luaG_ordererror:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	mv	s0,a0
	sw	a2,0(sp)
	call	luaT_objtypename
	lw	a2,0(sp)
	mv	s1,a0
	mv	a0,s0
	mv	a1,a2
	call	luaT_objtypename
	mv	a1,a0
	sw	a0,0(sp)
	mv	a0,s1
	call	strcmp
	lw	a3,0(sp)
	mv	a2,s1
	bne	a0,zero,.L268
	lla	a1,.LC25
	mv	a0,s0
	call	luaG_runerror
.L268:
	lla	a1,.LC26
	mv	a0,s0
	call	luaG_runerror
	.size	luaG_ordererror, .-luaG_ordererror
	.section	.text.luaG_traceexec,"ax",@progbits
	.align	2
	.globl	luaG_traceexec
	.hidden	luaG_traceexec
	.type	luaG_traceexec, @function
luaG_traceexec:
	lw	a5,104(a0)
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	addi	a5,a5,-1
	sw	a5,104(a0)
	lw	a4,20(a0)
	lw	s1,112(a0)
	mv	s0,a0
	bne	a5,zero,.L271
	andi	a5,s1,8
	beq	a5,zero,.L271
	lw	a3,100(a0)
	lhu	a5,34(a4)
	sw	a3,104(a0)
	andi	a3,a5,64
	bne	a3,zero,.L272
	li	a2,-1
	li	a1,3
	sw	a4,0(sp)
	andi	s1,s1,4
	call	luaD_hook
	lw	a4,0(sp)
	bne	s1,zero,.L284
	lw	a5,20(a4)
	lbu	a2,8(s0)
	li	a3,1
	sw	a5,24(s0)
	beq	a2,a3,.L277
.L270:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L271:
	andi	s1,s1,4
	beq	s1,zero,.L270
	lhu	a5,34(a4)
	li	s1,0
	andi	a3,a5,64
	bne	a3,zero,.L272
.L275:
	lw	a3,0(a4)
	lw	a5,20(a4)
	li	a2,-1
	lw	a3,0(a3)
	lw	a3,12(a3)
	lw	a0,48(a3)
	lw	a3,56(a3)
	sub	a1,a5,a0
	beq	a3,zero,.L278
	add	a2,a3,a1
	lw	a2,-4(a2)
.L278:
	li	t1,4
	beq	a1,t1,.L279
	lw	a1,24(s0)
	bleu	a5,a1,.L279
	li	t1,-1
	beq	a3,zero,.L280
	sub	a1,a1,a0
	add	a3,a3,a1
	lw	t1,-4(a3)
.L280:
	beq	a2,t1,.L281
.L279:
	li	a1,2
	mv	a0,s0
	sw	a4,0(sp)
	call	luaD_hook
	lw	a4,0(sp)
	lw	a5,20(a4)
.L281:
	lbu	a2,8(s0)
	sw	a5,24(s0)
	li	a3,1
	bne	a2,a3,.L270
	bne	s1,zero,.L277
.L282:
	lw	a3,12(s0)
	lhu	a2,34(a4)
	addi	a5,a5,-4
	addi	a3,a3,-8
	ori	a2,a2,64
	sw	a5,20(a4)
	sh	a2,34(a4)
	sw	a3,0(a4)
	li	a1,1
	mv	a0,s0
	call	luaD_throw
.L272:
	lw	ra,12(sp)
	lw	s0,8(sp)
	andi	a5,a5,-65
	sh	a5,34(a4)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L277:
	li	a3,1
	sw	a3,104(s0)
	j	.L282
.L284:
	li	s1,1
	j	.L275
	.size	luaG_traceexec, .-luaG_traceexec
	.hidden	luaD_hook
	.hidden	luaV_tointeger
	.hidden	luaV_tonumber_
	.hidden	luaT_objtypename
	.hidden	luaO_pushvfstring
	.hidden	luaD_callnoyield
	.hidden	luaD_throw
	.hidden	luaH_setint
	.hidden	luaH_new
	.hidden	luaO_chunkid
	.hidden	luaO_pushfstring
	.hidden	luaP_opmodes
	.hidden	luaF_getlocalname
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
