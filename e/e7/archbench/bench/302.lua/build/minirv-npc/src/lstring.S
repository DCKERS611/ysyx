#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"lstring.c"
	.option nopic
	.text
	.section	.text.luaS_eqlngstr,"ax",@progbits
	.align	2
	.globl	luaS_eqlngstr
	.hidden	luaS_eqlngstr
	.type	luaS_eqlngstr, @function
luaS_eqlngstr:
	beq	a0,a1,.L3
	lw	a4,12(a0)
	lw	a2,12(a1)
	mv	a5,a0
	li	a0,0
	beq	a2,a4,.L10
	ret
.L10:
	addi	sp,sp,-12
	addi	a1,a1,16
	addi	a0,a5,16
	sw	ra,8(sp)
	call	memcmp
	lw	ra,8(sp)
	seqz	a0,a0
	addi	sp,sp,12
	jr	ra
.L3:
	li	a0,1
	ret
	.size	luaS_eqlngstr, .-luaS_eqlngstr
	.section	.text.luaS_hash,"ax",@progbits
	.align	2
	.globl	luaS_hash
	.hidden	luaS_hash
	.type	luaS_hash, @function
luaS_hash:
	srli	a4,a1,5
	addi	a4,a4,1
	mv	t1,a0
	xor	a0,a2,a1
	bltu	a1,a4,.L11
.L13:
	add	a5,t1,a1
	lbu	a3,-1(a5)
	srli	a2,a0,2
	slli	a5,a0,5
	add	a5,a5,a2
	add	a5,a5,a3
	sub	a1,a1,a4
	xor	a0,a0,a5
	bleu	a4,a1,.L13
.L11:
	ret
	.size	luaS_hash, .-luaS_hash
	.section	.text.luaS_hashlongstr,"ax",@progbits
	.align	2
	.globl	luaS_hashlongstr
	.hidden	luaS_hashlongstr
	.type	luaS_hashlongstr, @function
luaS_hashlongstr:
	lbu	a5,6(a0)
	mv	a3,a0
	lw	a0,8(a0)
	beq	a5,zero,.L20
	ret
.L20:
	lw	a4,12(a3)
	srli	a2,a4,5
	addi	a2,a2,1
	xor	a0,a0,a4
	bltu	a4,a2,.L17
.L18:
	add	a5,a3,a4
	lbu	a1,15(a5)
	srli	t1,a0,2
	slli	a5,a0,5
	add	a5,a5,t1
	add	a5,a5,a1
	sub	a4,a4,a2
	xor	a0,a0,a5
	bleu	a2,a4,.L18
.L17:
	li	a5,1
	sw	a0,8(a3)
	sb	a5,6(a3)
	ret
	.size	luaS_hashlongstr, .-luaS_hashlongstr
	.section	.text.luaS_resize,"ax",@progbits
	.align	2
	.globl	luaS_resize
	.hidden	luaS_resize
	.type	luaS_resize, @function
luaS_resize:
	addi	sp,sp,-20
	sw	s1,8(sp)
	lw	s1,16(a0)
	sw	s0,12(sp)
	sw	ra,16(sp)
	lw	a2,32(s1)
	mv	t1,a0
	mv	s0,a1
	bge	a2,a1,.L22
	addi	a5,a1,1
	li	a4,1073741824
	bgeu	a5,a4,.L33
	lw	a1,24(s1)
	slli	a3,s0,2
	slli	a2,a2,2
	sw	a0,4(sp)
	sw	a3,0(sp)
	call	luaM_realloc_
	lw	a2,32(s1)
	sw	a0,24(s1)
	lw	t1,4(sp)
	ble	s0,a2,.L22
	lw	a3,0(sp)
	slli	a5,a2,2
	add	a5,a0,a5
	add	a4,a0,a3
.L24:
	sw	zero,0(a5)
	addi	a5,a5,4
	bne	a4,a5,.L24
	bgt	a2,zero,.L34
.L32:
	sw	s0,32(s1)
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L22:
	ble	a2,zero,.L26
	lw	a0,24(s1)
.L34:
	mv	t0,a0
	li	t2,0
	addi	a1,s0,-1
.L28:
	lw	a4,0(t0)
	sw	zero,0(t0)
	beq	a4,zero,.L30
	sw	a2,0(sp)
.L29:
	lw	a5,8(a4)
	mv	a3,a4
	lw	a4,12(a4)
	and	a5,a1,a5
	slli	a5,a5,2
	add	a5,a0,a5
	lw	a2,0(a5)
	sw	a2,12(a3)
	sw	a3,0(a5)
	bne	a4,zero,.L29
	lw	a2,0(sp)
.L30:
	addi	t2,t2,1
	addi	t0,t0,4
	blt	t2,a2,.L28
.L26:
	bge	s0,a2,.L32
	addi	a5,s0,1
	li	a4,1073741824
	bgeu	a5,a4,.L33
	lw	a1,24(s1)
	slli	a3,s0,2
	slli	a2,a2,2
	mv	a0,t1
	call	luaM_realloc_
	lw	ra,16(sp)
	sw	s0,32(s1)
	lw	s0,12(sp)
	sw	a0,24(s1)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L33:
	mv	a0,t1
	call	luaM_toobig
	.size	luaS_resize, .-luaS_resize
	.section	.text.internshrstr,"ax",@progbits
	.align	2
	.type	internshrstr, @function
internshrstr:
	lw	a5,16(a0)
	addi	sp,sp,-36
	sw	a0,20(sp)
	lw	a4,44(a5)
	srli	a0,a2,5
	sw	s0,28(sp)
	sw	ra,32(sp)
	sw	s1,24(sp)
	sw	a5,8(sp)
	addi	a0,a0,1
	mv	s0,a2
	mv	t1,a1
	xor	a4,a2,a4
	bltu	a2,a0,.L45
.L46:
	add	a5,t1,a2
	lbu	a1,-1(a5)
	srli	t0,a4,2
	slli	a5,a4,5
	add	a5,a5,t0
	add	a5,a5,a1
	sub	a2,a2,a0
	xor	a4,a4,a5
	bleu	a0,a2,.L46
.L45:
	lw	a5,8(sp)
	lw	a3,32(a5)
	lw	s1,24(a5)
	addi	a5,a3,-1
	and	a5,a5,a4
	slli	a5,a5,2
	add	a5,s1,a5
	lw	s1,0(a5)
	sw	a3,12(sp)
	sw	a5,16(sp)
	bne	s1,zero,.L50
	j	.L47
.L48:
	lw	s1,12(s1)
	beq	s1,zero,.L47
.L50:
	lbu	a2,7(s1)
	bne	a2,s0,.L48
	mv	a0,t1
	addi	a1,s1,16
	mv	a2,s0
	sw	a4,4(sp)
	sw	t1,0(sp)
	call	memcmp
	lw	t1,0(sp)
	lw	a4,4(sp)
	bne	a0,zero,.L48
	lw	a5,8(sp)
	lbu	a3,5(s1)
	lbu	a4,48(a5)
	xori	a3,a3,3
	xori	a4,a4,3
	and	a4,a3,a4
	bne	a4,zero,.L44
	sb	a3,5(s1)
	lw	ra,32(sp)
	lw	s0,28(sp)
	mv	a0,s1
	lw	s1,24(sp)
	addi	sp,sp,36
	jr	ra
.L47:
	lw	a5,8(sp)
	lw	a3,12(sp)
	lw	a5,28(a5)
	ble	a3,a5,.L58
.L51:
	lw	a0,20(sp)
	addi	a2,s0,17
	li	a1,4
	sw	t1,4(sp)
	sw	a4,0(sp)
	call	luaC_newobj
	lw	a4,0(sp)
	lw	t1,4(sp)
	sb	zero,6(a0)
	sw	a4,8(a0)
	add	a4,a0,s0
	mv	s1,a0
	sb	zero,16(a4)
	mv	a2,s0
	mv	a1,t1
	addi	a0,a0,16
	call	memcpy
	lw	a5,16(sp)
	lw	a2,8(sp)
	sb	s0,7(s1)
	lw	a3,0(a5)
	lw	a4,28(a2)
	sw	a3,12(s1)
	sw	s1,0(a5)
	addi	a4,a4,1
	sw	a4,28(a2)
.L44:
	lw	ra,32(sp)
	lw	s0,28(sp)
	mv	a0,s1
	lw	s1,24(sp)
	addi	sp,sp,36
	jr	ra
.L58:
	li	a5,1073741824
	bge	a3,a5,.L51
	lw	a0,20(sp)
	slli	a1,a3,1
	sw	t1,4(sp)
	sw	a4,0(sp)
	call	luaS_resize
	lw	a4,8(sp)
	lw	t1,4(sp)
	lw	a5,32(a4)
	lw	s1,24(a4)
	lw	a4,0(sp)
	addi	a5,a5,-1
	and	a5,a5,a4
	slli	a5,a5,2
	add	a5,s1,a5
	sw	a5,16(sp)
	j	.L51
	.size	internshrstr, .-internshrstr
	.section	.text.luaS_clearcache,"ax",@progbits
	.align	2
	.globl	luaS_clearcache
	.hidden	luaS_clearcache
	.type	luaS_clearcache, @function
luaS_clearcache:
	addi	a5,a0,256
	addi	a3,a0,680
.L62:
	lw	a4,0(a5)
	lbu	a4,5(a4)
	andi	a4,a4,3
	beq	a4,zero,.L60
	lw	a4,120(a0)
	sw	a4,0(a5)
.L60:
	lw	a4,4(a5)
	lbu	a4,5(a4)
	andi	a4,a4,3
	beq	a4,zero,.L61
	lw	a4,120(a0)
	sw	a4,4(a5)
.L61:
	addi	a5,a5,8
	bne	a3,a5,.L62
	ret
	.size	luaS_clearcache, .-luaS_clearcache
	.section	.rodata.luaS_init.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"not enough memory"
	.section	.text.luaS_init,"ax",@progbits
	.align	2
	.globl	luaS_init
	.hidden	luaS_init
	.type	luaS_init, @function
luaS_init:
	addi	sp,sp,-12
	li	a1,128
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	lw	s0,16(a0)
	mv	s1,a0
	call	luaS_resize
	li	a2,17
	lla	a1,.LC0
	mv	a0,s1
	call	internshrstr
	mv	a1,a0
	sw	a0,120(s0)
	mv	a0,s1
	call	luaC_fix
	lw	a4,120(s0)
	addi	a5,s0,256
	addi	a3,s0,680
.L71:
	sw	a4,0(a5)
	sw	a4,4(a5)
	addi	a5,a5,8
	bne	a5,a3,.L71
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
	.size	luaS_init, .-luaS_init
	.section	.text.luaS_createlngstrobj,"ax",@progbits
	.align	2
	.globl	luaS_createlngstrobj
	.hidden	luaS_createlngstrobj
	.type	luaS_createlngstrobj, @function
luaS_createlngstrobj:
	lw	a5,16(a0)
	addi	sp,sp,-12
	sw	s1,0(sp)
	lw	s1,44(a5)
	sw	s0,4(sp)
	addi	a2,a1,17
	mv	s0,a1
	li	a1,20
	sw	ra,8(sp)
	call	luaC_newobj
	sb	zero,6(a0)
	sw	s1,8(a0)
	add	a4,a0,s0
	sb	zero,16(a4)
	lw	ra,8(sp)
	sw	s0,12(a0)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
	.size	luaS_createlngstrobj, .-luaS_createlngstrobj
	.section	.text.luaS_remove,"ax",@progbits
	.align	2
	.globl	luaS_remove
	.hidden	luaS_remove
	.type	luaS_remove, @function
luaS_remove:
	lw	a3,16(a0)
	lw	a2,8(a1)
	lw	a5,32(a3)
	lw	a4,24(a3)
	addi	a5,a5,-1
	and	a5,a5,a2
	slli	a5,a5,2
	add	a4,a4,a5
	lw	a5,0(a4)
	beq	a5,a1,.L77
.L78:
	mv	a4,a5
	lw	a5,12(a5)
	bne	a5,a1,.L78
	addi	a4,a4,12
.L77:
	lw	a5,28(a3)
	lw	a2,12(a1)
	addi	a5,a5,-1
	sw	a2,0(a4)
	sw	a5,28(a3)
	ret
	.size	luaS_remove, .-luaS_remove
	.section	.text.luaS_newlstr,"ax",@progbits
	.align	2
	.globl	luaS_newlstr
	.hidden	luaS_newlstr
	.type	luaS_newlstr, @function
luaS_newlstr:
	li	a4,40
	bleu	a2,a4,.L85
	addi	sp,sp,-20
	li	a4,-2147483648
	sw	s0,12(sp)
	sw	ra,16(sp)
	sw	s1,8(sp)
	xori	a4,a4,-18
	mv	s0,a2
	bgtu	a2,a4,.L86
	lw	a5,16(a0)
	sw	a1,4(sp)
	addi	a2,a2,17
	lw	a5,44(a5)
	li	a1,20
	sw	a5,0(sp)
	call	luaC_newobj
	lw	a5,0(sp)
	lw	a3,4(sp)
	sb	zero,6(a0)
	sw	a5,8(a0)
	add	a5,a0,s0
	sb	zero,16(a5)
	mv	s1,a0
	sw	s0,12(a0)
	mv	a2,s0
	mv	a1,a3
	addi	a0,a0,16
	call	memcpy
	lw	ra,16(sp)
	lw	s0,12(sp)
	mv	a0,s1
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L85:
	tail	internshrstr
.L86:
	call	luaM_toobig
	.size	luaS_newlstr, .-luaS_newlstr
	.globl	__umodsi3
	.section	.text.luaS_new,"ax",@progbits
	.align	2
	.globl	luaS_new
	.hidden	luaS_new
	.type	luaS_new, @function
luaS_new:
	addi	sp,sp,-24
	sw	s1,12(sp)
	mv	s1,a1
	sw	s0,16(sp)
	li	a1,53
	mv	s0,a0
	mv	a0,s1
	sw	ra,20(sp)
	call	__umodsi3
	sw	s0,4(sp)
	lw	s0,16(s0)
	addi	a0,a0,32
	slli	a0,a0,3
	add	s0,s0,a0
	lw	a4,0(s0)
	mv	a0,s1
	addi	a1,a4,16
	sw	a4,0(sp)
	call	strcmp
	lw	a4,0(sp)
	beq	a0,zero,.L87
	lw	a3,4(s0)
	mv	a0,s1
	sw	a4,8(sp)
	addi	a1,a3,16
	sw	a3,0(sp)
	call	strcmp
	lw	a3,0(sp)
	beq	a0,zero,.L89
	lw	a4,8(sp)
	mv	a0,s1
	sw	a4,4(s0)
	call	strlen
	mv	a2,a0
	lw	a0,4(sp)
	mv	a1,s1
	call	luaS_newlstr
	mv	a4,a0
	sw	a0,0(s0)
.L87:
	lw	ra,20(sp)
	lw	s0,16(sp)
	lw	s1,12(sp)
	mv	a0,a4
	addi	sp,sp,24
	jr	ra
.L89:
	mv	a4,a3
	j	.L87
	.size	luaS_new, .-luaS_new
	.section	.text.luaS_newudata,"ax",@progbits
	.align	2
	.globl	luaS_newudata
	.hidden	luaS_newudata
	.type	luaS_newudata, @function
luaS_newudata:
	addi	sp,sp,-12
	li	a5,-2147483648
	sw	ra,8(sp)
	sw	s0,4(sp)
	xori	a5,a5,-21
	bgtu	a1,a5,.L97
	mv	s0,a1
	addi	a2,a1,24
	li	a1,7
	call	luaC_newobj
	lla	a5,luaO_nilobject_
	lw	a4,4(a5)
	lw	a3,0(a5)
	sw	s0,12(a0)
	sb	a4,6(a0)
	lw	ra,8(sp)
	lw	s0,4(sp)
	sw	zero,8(a0)
	sw	a3,16(a0)
	addi	sp,sp,12
	jr	ra
.L97:
	call	luaM_toobig
	.size	luaS_newudata, .-luaS_newudata
	.hidden	luaO_nilobject_
	.hidden	luaC_fix
	.hidden	luaC_newobj
	.hidden	luaM_toobig
	.hidden	luaM_realloc_
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
