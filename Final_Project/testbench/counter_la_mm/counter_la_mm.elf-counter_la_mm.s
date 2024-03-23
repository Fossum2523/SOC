	.file	"counter_la_mm.c"
	.option nopic
	.attribute arch, "rv32i2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/ubuntu/lab_final_prefetch0102-3/testbench/counter_la_mm" "counter_la_mm.c"
	.align	2
	.globl	putchar
	.type	putchar, @function
putchar:
.LFB316:
	.file 1 "../../firmware/stub.c"
	.loc 1 19 1
	.cfi_startproc
.LVL0:
	.loc 1 20 2
	.loc 1 19 1 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	.loc 1 20 5
	li	a5,10
	.loc 1 19 1
	mv	s0,a0
	.loc 1 20 5
	bne	a0,a5,.L2
	.loc 1 21 3 is_stmt 1
	li	a0,13
.LVL1:
	call	putchar
.LVL2:
.L2:
	.loc 1 22 13 is_stmt 0 discriminator 1
	li	a5,-268410880
	.loc 1 22 60 discriminator 1
	li	a4,1
.L3:
	.loc 1 22 60 is_stmt 1 discriminator 1
	.loc 1 22 13 is_stmt 0 discriminator 1
	lw	a3,-2044(a5)
	.loc 1 22 60 discriminator 1
	beq	a3,a4,.L3
	.loc 1 23 2 is_stmt 1
	.loc 1 24 1 is_stmt 0
	lw	ra,12(sp)
	.cfi_restore 1
	.loc 1 23 50
	sw	s0,-2048(a5)
	.loc 1 24 1
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE316:
	.size	putchar, .-putchar
	.align	2
	.globl	print
	.type	print, @function
print:
.LFB317:
	.loc 1 27 1 is_stmt 1
	.cfi_startproc
.LVL3:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	mv	s0,a0
	.loc 1 28 2
.LVL4:
.L7:
	.loc 1 28 9
	lbu	a0,0(s0)
	bne	a0,zero,.L8
	.loc 1 30 1 is_stmt 0
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
.LVL5:
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.LVL6:
.L8:
	.cfi_restore_state
	.loc 1 29 3 is_stmt 1
	.loc 1 29 14 is_stmt 0
	addi	s0,s0,1
.LVL7:
	.loc 1 29 3
	call	putchar
.LVL8:
	j	.L7
	.cfi_endproc
.LFE317:
	.size	print, .-print
	.section	.mprjram,"ax",@progbits
	.align	2
	.globl	mmatrix
	.type	mmatrix, @function
mmatrix:
.LFB324:
	.file 2 "counter_la_mm.c"
	.loc 2 150 60 is_stmt 1
	.cfi_startproc
	.loc 2 152 2
	.loc 2 153 2
	.loc 2 154 2
	.loc 2 155 3
	.loc 2 155 37 is_stmt 0
	li	a5,637534208
	li	a4,10813440
	sw	a4,12(a5)
	.loc 2 156 3 is_stmt 1
.LVL9:
	.loc 2 156 29
	.loc 2 157 38 is_stmt 0
	li	a3,872415232
	.loc 2 156 15
	li	a5,0
	.loc 2 156 29
	li	a4,16
.LVL10:
.L11:
	.loc 2 157 4 is_stmt 1 discriminator 3
	.loc 2 157 38 is_stmt 0 discriminator 3
	sw	a5,128(a3)
	.loc 2 156 43 is_stmt 1 discriminator 3
	addi	a5,a5,1
.LVL11:
	.loc 2 156 29 discriminator 3
	bne	a5,a4,.L11
	.loc 2 159 16 is_stmt 0
	li	a5,0
.LVL12:
	.loc 2 160 38
	li	a3,872415232
	.loc 2 159 31
	li	a4,16
.LVL13:
.L12:
	.loc 2 160 4 is_stmt 1 discriminator 3
	.loc 2 160 38 is_stmt 0 discriminator 3
	sw	a5,128(a3)
	.loc 2 159 46 is_stmt 1 discriminator 3
	addi	a5,a5,1
.LVL14:
	.loc 2 159 31 discriminator 3
	bne	a5,a4,.L12
	li	a5,16
.LVL15:
	.loc 2 163 40 is_stmt 0
	li	a1,822083584
	li	a0,1
	.loc 2 164 43
	li	a2,872415232
	.loc 2 164 40
	li	a3,637534208
.LVL16:
.L13:
	.loc 2 163 6 is_stmt 1 discriminator 3
	.loc 2 163 40 is_stmt 0 discriminator 3
	sw	a0,0(a1)
	.loc 2 164 6 is_stmt 1 discriminator 3
	.loc 2 164 43 is_stmt 0 discriminator 3
	lw	a4,132(a2)
	.loc 2 162 31 discriminator 3
	addi	a5,a5,-1
.LVL17:
	.loc 2 164 76 discriminator 3
	slli	a4,a4,16
	.loc 2 164 40 discriminator 3
	sw	a4,12(a3)
	.loc 2 162 46 is_stmt 1 discriminator 3
.LVL18:
	.loc 2 162 31 discriminator 3
	bne	a5,zero,.L13
	.loc 2 166 3
	.loc 2 166 37 is_stmt 0
	li	a5,5898240
	sw	a5,12(a3)
	.loc 2 167 1
	ret
	.cfi_endproc
.LFE324:
	.size	mmatrix, .-mmatrix
	.align	2
	.globl	QS
	.type	QS, @function
QS:
.LFB325:
	.loc 2 169 55 is_stmt 1
	.cfi_startproc
	.loc 2 170 2
	.loc 2 171 2
	.loc 2 172 2
	.loc 2 173 3
	.loc 2 173 11 is_stmt 0
	li	a4,838860800
.L18:
	.loc 2 173 58 is_stmt 1 discriminator 1
	.loc 2 173 11 is_stmt 0 discriminator 1
	lw	a5,0(a4)
	.loc 2 173 44 discriminator 1
	andi	a5,a5,4
	.loc 2 173 58 discriminator 1
	bne	a5,zero,.L18
	.loc 2 176 3 is_stmt 1
	.loc 2 176 37 is_stmt 0
	li	a5,1
	sw	a5,0(a4)
	.loc 2 177 3 is_stmt 1
	.loc 2 177 37 is_stmt 0
	li	a5,637534208
	li	a4,10813440
	sw	a4,12(a5)
	.loc 2 179 3 is_stmt 1
.LVL19:
	.loc 2 179 30
	.loc 2 179 15 is_stmt 0
	li	a5,11
	.loc 2 180 38
	li	a4,838860800
.LVL20:
.L19:
	.loc 2 180 4 is_stmt 1 discriminator 3
	.loc 2 180 38 is_stmt 0 discriminator 3
	sw	a5,128(a4)
	.loc 2 179 44 is_stmt 1 discriminator 3
	addi	a5,a5,-1
.LVL21:
	.loc 2 179 30 discriminator 3
	bne	a5,zero,.L19
	li	a5,11
.LVL22:
	.loc 2 186 38 is_stmt 0
	li	a1,822083584
	li	a0,1
	.loc 2 187 41
	li	a2,838860800
	.loc 2 187 38
	li	a3,637534208
.LVL23:
.L20:
	.loc 2 186 4 is_stmt 1 discriminator 3
	.loc 2 186 38 is_stmt 0 discriminator 3
	sw	a0,0(a1)
	.loc 2 187 4 is_stmt 1 discriminator 3
	.loc 2 187 41 is_stmt 0 discriminator 3
	lw	a4,132(a2)
	.loc 2 184 29 discriminator 3
	addi	a5,a5,-1
.LVL24:
	.loc 2 187 74 discriminator 3
	slli	a4,a4,16
	.loc 2 187 38 discriminator 3
	sw	a4,12(a3)
	.loc 2 184 44 is_stmt 1 discriminator 3
.LVL25:
	.loc 2 184 29 discriminator 3
	bne	a5,zero,.L20
	.loc 2 190 3
	.loc 2 190 37 is_stmt 0
	li	a5,5898240
	sw	a5,12(a3)
	.loc 2 191 3 is_stmt 1
	.loc 2 191 11 is_stmt 0
	li	a4,838860800
.L21:
	.loc 2 191 58 is_stmt 1 discriminator 1
	.loc 2 191 11 is_stmt 0 discriminator 1
	lw	a5,0(a4)
	.loc 2 191 44 discriminator 1
	andi	a5,a5,2
	.loc 2 191 58 discriminator 1
	bne	a5,zero,.L21
	.loc 2 194 11
	li	a4,838860800
.L22:
	.loc 2 194 58 is_stmt 1 discriminator 1
	.loc 2 194 11 is_stmt 0 discriminator 1
	lw	a5,0(a4)
	.loc 2 194 44 discriminator 1
	andi	a5,a5,4
	.loc 2 194 58 discriminator 1
	bne	a5,zero,.L22
	.loc 2 196 1
	ret
	.cfi_endproc
.LFE325:
	.size	QS, .-QS
	.align	2
	.globl	fir
	.type	fir, @function
fir:
.LFB326:
	.loc 2 198 56 is_stmt 1
	.cfi_startproc
	.loc 2 199 2
.LVL26:
	.loc 2 200 2
	.loc 2 201 2
	.loc 2 202 2
	.loc 2 207 3
	.loc 2 207 37 is_stmt 0
	li	a5,905969664
	li	a4,64
	sw	a4,16(a5)
	.loc 2 208 3 is_stmt 1
	.loc 2 208 37 is_stmt 0
	sw	zero,64(a5)
	.loc 2 209 3 is_stmt 1
	.loc 2 209 37 is_stmt 0
	li	a4,-1
	sw	a4,68(a5)
	.loc 2 210 3 is_stmt 1
	.loc 2 210 37 is_stmt 0
	li	a4,2
	sw	a4,72(a5)
	.loc 2 211 3 is_stmt 1
	.loc 2 211 37 is_stmt 0
	li	a4,-3
	sw	a4,76(a5)
	.loc 2 212 3 is_stmt 1
	.loc 2 212 37 is_stmt 0
	li	a3,4
	sw	a3,80(a5)
	.loc 2 213 3 is_stmt 1
	.loc 2 213 37 is_stmt 0
	sw	a4,84(a5)
	.loc 2 214 3 is_stmt 1
	.loc 2 214 37 is_stmt 0
	li	a4,-4
	sw	a4,88(a5)
	.loc 2 215 3 is_stmt 1
	.loc 2 215 37 is_stmt 0
	li	a4,3
	sw	a4,92(a5)
	.loc 2 216 3 is_stmt 1
	.loc 2 216 37 is_stmt 0
	li	a4,-2
	sw	a4,96(a5)
	.loc 2 217 3 is_stmt 1
	.loc 2 217 37 is_stmt 0
	li	a4,1
	sw	a4,100(a5)
	.loc 2 218 3 is_stmt 1
	.loc 2 218 37 is_stmt 0
	sw	zero,104(a5)
	.loc 2 222 3 is_stmt 1
	.loc 2 222 37 is_stmt 0
	sw	a4,0(a5)
	.loc 2 224 3 is_stmt 1
	.loc 2 224 37 is_stmt 0
	li	a5,637534208
	li	a4,10813440
	sw	a4,12(a5)
	.loc 2 230 3 is_stmt 1
.LVL27:
	.loc 2 230 29
	.loc 2 232 38 is_stmt 0
	li	a3,905969664
	.loc 2 230 15
	li	a5,1
	.loc 2 234 38
	li	a2,637534208
	.loc 2 230 29
	li	a1,63
.LVL28:
.L29:
	.loc 2 232 4 is_stmt 1 discriminator 3
	.loc 2 232 38 is_stmt 0 discriminator 3
	sw	a5,128(a3)
	.loc 2 234 4 is_stmt 1 discriminator 3
	.loc 2 234 75 is_stmt 0 discriminator 3
	lw	a4,132(a3)
	.loc 2 234 82 discriminator 3
	slli	a0,a5,16
	.loc 2 230 46 discriminator 3
	addi	a5,a5,1
.LVL29:
	.loc 2 234 75 discriminator 3
	slli	a4,a4,24
	.loc 2 234 82 discriminator 3
	add	a4,a4,a0
	.loc 2 234 38 discriminator 3
	sw	a4,12(a2)
.LVL30:
	.loc 2 230 46 is_stmt 1 discriminator 3
	.loc 2 230 29 discriminator 3
	bne	a5,a1,.L29
	.loc 2 239 3
	.loc 2 239 37 is_stmt 0
	sw	a5,128(a3)
	.loc 2 241 3 is_stmt 1
	.loc 2 241 74 is_stmt 0
	lw	a5,132(a3)
.LVL31:
	.loc 2 241 81
	li	a4,5898240
	.loc 2 241 74
	slli	a5,a5,24
	.loc 2 241 81
	add	a5,a5,a4
	.loc 2 241 37
	sw	a5,12(a2)
.LVL32:
	.loc 2 243 3 is_stmt 1
	.loc 2 243 11 is_stmt 0
	li	a4,905969664
.L30:
	.loc 2 243 58 is_stmt 1 discriminator 1
	.loc 2 243 11 is_stmt 0 discriminator 1
	lw	a5,0(a4)
	.loc 2 243 44 discriminator 1
	andi	a5,a5,2
	.loc 2 243 58 discriminator 1
	bne	a5,zero,.L30
	.loc 2 246 11
	li	a4,905969664
.L31:
	.loc 2 246 58 is_stmt 1 discriminator 1
	.loc 2 246 11 is_stmt 0 discriminator 1
	lw	a5,0(a4)
	.loc 2 246 44 discriminator 1
	andi	a5,a5,4
	.loc 2 246 58 discriminator 1
	bne	a5,zero,.L31
.LVL33:
	.loc 2 250 1
	ret
	.cfi_endproc
.LFE326:
	.size	fir, .-fir
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
.LFB323:
	.loc 2 48 1 is_stmt 1
	.cfi_startproc
	.loc 2 49 2
	.loc 2 51 5
	.loc 2 78 9
	.loc 2 48 1 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	.loc 2 78 57
	li	a2,1
	li	a5,-268419072
	.loc 2 80 39
	li	a3,8192
	addi	a4,a3,-2039
	.loc 2 78 57
	sw	a2,-2048(a5)
	.loc 2 80 5 is_stmt 1
	.loc 2 80 39 is_stmt 0
	li	a5,637534208
	sw	a4,160(a5)
	.loc 2 81 5 is_stmt 1
	.loc 2 81 39 is_stmt 0
	sw	a4,156(a5)
	.loc 2 82 5 is_stmt 1
	.loc 2 82 39 is_stmt 0
	sw	a4,152(a5)
	.loc 2 83 5 is_stmt 1
	.loc 2 83 39 is_stmt 0
	sw	a4,148(a5)
	.loc 2 84 5 is_stmt 1
	.loc 2 84 39 is_stmt 0
	sw	a4,144(a5)
	.loc 2 85 5 is_stmt 1
	.loc 2 85 39 is_stmt 0
	sw	a4,140(a5)
	.loc 2 86 5 is_stmt 1
	.loc 2 86 39 is_stmt 0
	sw	a4,136(a5)
	.loc 2 87 5 is_stmt 1
	.loc 2 87 39 is_stmt 0
	sw	a4,132(a5)
	.loc 2 88 5 is_stmt 1
	.loc 2 88 39 is_stmt 0
	sw	a4,128(a5)
	.loc 2 89 5 is_stmt 1
	.loc 2 89 39 is_stmt 0
	sw	a4,124(a5)
	.loc 2 90 5 is_stmt 1
	.loc 2 90 39 is_stmt 0
	sw	a4,120(a5)
	.loc 2 91 5 is_stmt 1
	.loc 2 91 39 is_stmt 0
	sw	a4,116(a5)
	.loc 2 92 5 is_stmt 1
	.loc 2 92 39 is_stmt 0
	sw	a4,112(a5)
	.loc 2 93 5 is_stmt 1
	.loc 2 93 39 is_stmt 0
	sw	a4,108(a5)
	.loc 2 94 5 is_stmt 1
	.loc 2 94 39 is_stmt 0
	sw	a4,104(a5)
	.loc 2 95 5 is_stmt 1
	.loc 2 95 39 is_stmt 0
	sw	a4,100(a5)
	.loc 2 97 5 is_stmt 1
	.loc 2 97 39 is_stmt 0
	sw	a4,96(a5)
	.loc 2 98 5 is_stmt 1
	.loc 2 98 39 is_stmt 0
	sw	a4,92(a5)
	.loc 2 99 5 is_stmt 1
	.loc 2 99 39 is_stmt 0
	sw	a4,88(a5)
	.loc 2 100 5 is_stmt 1
	.loc 2 100 39 is_stmt 0
	sw	a4,84(a5)
	.loc 2 101 5 is_stmt 1
	.loc 2 101 39 is_stmt 0
	sw	a4,80(a5)
	.loc 2 102 5 is_stmt 1
	.loc 2 102 39 is_stmt 0
	sw	a4,76(a5)
	.loc 2 103 5 is_stmt 1
	.loc 2 103 39 is_stmt 0
	sw	a4,72(a5)
	.loc 2 104 5 is_stmt 1
	.loc 2 104 39 is_stmt 0
	sw	a4,68(a5)
	.loc 2 105 5 is_stmt 1
	.loc 2 105 39 is_stmt 0
	sw	a4,64(a5)
	.loc 2 106 5 is_stmt 1
	.loc 2 106 39 is_stmt 0
	sw	a4,52(a5)
	.loc 2 107 5 is_stmt 1
	.loc 2 107 39 is_stmt 0
	sw	a4,48(a5)
	.loc 2 108 5 is_stmt 1
	.loc 2 108 39 is_stmt 0
	sw	a4,44(a5)
	.loc 2 109 5 is_stmt 1
	.loc 2 109 39 is_stmt 0
	sw	a4,40(a5)
	.loc 2 110 5 is_stmt 1
	.loc 2 112 39 is_stmt 0
	addi	a3,a3,-2040
	.loc 2 110 39
	sw	a4,36(a5)
	.loc 2 112 5 is_stmt 1
	.loc 2 112 39 is_stmt 0
	sw	a3,60(a5)
	.loc 2 113 5 is_stmt 1
	.loc 2 113 39 is_stmt 0
	li	a4,1026
	sw	a4,56(a5)
	.loc 2 117 2 is_stmt 1
	.loc 2 117 36 is_stmt 0
	sw	a2,0(a5)
	.loc 2 118 2 is_stmt 1
	.loc 2 118 10 is_stmt 0
	li	s0,637534208
	.loc 2 118 43
	li	a4,1
.L36:
	.loc 2 118 43 is_stmt 1 discriminator 1
	.loc 2 118 10 is_stmt 0 discriminator 1
	lw	a5,0(s0)
	.loc 2 118 43 discriminator 1
	beq	a5,a4,.L36
	.loc 2 119 2 is_stmt 1
	.loc 2 119 114 is_stmt 0
	li	a5,-268423168
	sw	zero,12(a5)
	.loc 2 119 57
	sw	zero,28(a5)
	.loc 2 120 2 is_stmt 1
	.loc 2 120 112 is_stmt 0
	li	a3,-1
	sw	a3,8(a5)
	.loc 2 120 56
	sw	a3,24(a5)
	.loc 2 121 2 is_stmt 1
	.loc 2 121 112 is_stmt 0
	sw	zero,4(a5)
	.loc 2 121 56
	sw	zero,20(a5)
	.loc 2 122 2 is_stmt 1
	.loc 2 122 100 is_stmt 0
	sw	zero,0(a5)
	.loc 2 122 50
	sw	zero,16(a5)
	.loc 2 123 2 is_stmt 1
	.loc 2 123 56 is_stmt 0
	sw	zero,56(a5)
	.loc 2 124 2 is_stmt 1
	.loc 2 124 112 is_stmt 0
	sw	zero,8(a5)
	.loc 2 124 56
	sw	zero,24(a5)
	.loc 2 127 2 is_stmt 1
	.loc 2 127 36 is_stmt 0
	li	a5,114688
	li	a3,805306368
	addi	a5,a5,512
	sw	a5,12(a3)
	.loc 2 130 2 is_stmt 1
.LBB12:
.LBB13:
	.file 3 "../../firmware/irq_vex.h"
	.loc 3 24 2
	.loc 3 25 2
 #APP
# 25 "../../firmware/irq_vex.h" 1
	csrr a5, 3008
# 0 "" 2
.LVL34:
	.loc 3 26 2
 #NO_APP
.LBE13:
.LBE12:
	.loc 2 131 2
	.loc 2 132 2
.LBB14:
.LBB15:
	.loc 3 31 2
	ori	a5,a5,4
.LVL35:
 #APP
# 31 "../../firmware/irq_vex.h" 1
	csrw 3008, a5
# 0 "" 2
.LVL36:
 #NO_APP
.LBE15:
.LBE14:
	.loc 2 134 2
.LBB16:
	.file 4 "../../firmware/csr.h"
	.loc 4 806 2
.LBB17:
.LBB18:
	.file 5 "../../firmware/hw/common.h"
	.loc 5 34 2
	.loc 5 34 32 is_stmt 0
	li	a5,-268406784
.LVL37:
	sw	a4,-2028(a5)
.LVL38:
.LBE18:
.LBE17:
.LBE16:
	.loc 2 137 2 is_stmt 1
	.loc 2 137 36 is_stmt 0
	li	a5,-1419771904
	sw	a5,12(s0)
	.loc 2 140 2 is_stmt 1
	call	mmatrix
.LVL39:
	.loc 2 142 2
	call	QS
.LVL40:
	.loc 2 144 2
	call	fir
.LVL41:
	.loc 2 147 2
	.loc 2 147 36 is_stmt 0
	li	a5,-1419706368
	.loc 2 148 1
	lw	ra,12(sp)
	.cfi_restore 1
	.loc 2 147 36
	sw	a5,12(s0)
	.loc 2 148 1
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE323:
	.size	main, .-main
	.text
.Letext0:
	.file 6 "/opt/riscv/lib/gcc/riscv32-unknown-elf/12.1.0/include/stdint-gcc.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x313
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0xc
	.4byte	.LASF24
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.LLRL13
	.4byte	0
	.4byte	.Ldebug_line0
	.byte	0x1
	.byte	0x1
	.byte	0x6
	.4byte	.LASF2
	.byte	0x1
	.byte	0x2
	.byte	0x5
	.4byte	.LASF3
	.byte	0x1
	.byte	0x4
	.byte	0x5
	.4byte	.LASF4
	.byte	0x1
	.byte	0x8
	.byte	0x5
	.4byte	.LASF5
	.byte	0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF6
	.byte	0x1
	.byte	0x2
	.byte	0x7
	.4byte	.LASF7
	.byte	0xd
	.4byte	.LASF25
	.byte	0x6
	.byte	0x34
	.byte	0x1b
	.4byte	0x5c
	.byte	0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.byte	0x1
	.byte	0x8
	.byte	0x7
	.4byte	.LASF9
	.byte	0xe
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF10
	.byte	0xf
	.4byte	.LASF26
	.byte	0x2
	.byte	0x2f
	.byte	0x6
	.4byte	.LFB323
	.4byte	.LFE323-.LFB323
	.byte	0x1
	.byte	0x9c
	.4byte	0x13a
	.byte	0x10
	.string	"j"
	.byte	0x2
	.byte	0x31
	.byte	0x6
	.4byte	0x6a
	.byte	0x2
	.4byte	.LASF11
	.byte	0x33
	.byte	0x9
	.4byte	0x6a
	.4byte	.LLST8
	.byte	0x6
	.4byte	0x257
	.4byte	.LBB12
	.4byte	.LBE12-.LBB12
	.byte	0x82
	.byte	0x9
	.4byte	0xc0
	.byte	0x11
	.4byte	0x268
	.byte	0
	.byte	0x6
	.4byte	0x23d
	.4byte	.LBB14
	.4byte	.LBE14-.LBB14
	.byte	0x84
	.byte	0x2
	.4byte	0xdd
	.byte	0x4
	.4byte	0x24a
	.4byte	.LLST9
	.byte	0
	.byte	0x6
	.4byte	0x2e2
	.4byte	.LBB16
	.4byte	.LBE16-.LBB16
	.byte	0x86
	.byte	0x2
	.4byte	0x11e
	.byte	0x4
	.4byte	0x2f0
	.4byte	.LLST10
	.byte	0x12
	.4byte	0x2fc
	.4byte	.LBB17
	.4byte	.LBE17-.LBB17
	.byte	0x4
	.2byte	0x326
	.byte	0x2
	.byte	0x4
	.4byte	0x30d
	.4byte	.LLST11
	.byte	0x4
	.4byte	0x305
	.4byte	.LLST10
	.byte	0
	.byte	0
	.byte	0x5
	.4byte	.LVL39
	.4byte	0x1dd
	.byte	0x5
	.4byte	.LVL40
	.4byte	0x19e
	.byte	0x5
	.4byte	.LVL41
	.4byte	0x13a
	.byte	0
	.byte	0x7
	.string	"fir"
	.byte	0xc6
	.4byte	0x189
	.4byte	.LFB326
	.4byte	.LFE326-.LFB326
	.byte	0x1
	.byte	0x9c
	.4byte	0x189
	.byte	0x2
	.4byte	.LASF12
	.byte	0xc7
	.byte	0x6
	.4byte	0x18e
	.4byte	.LLST6
	.byte	0x2
	.4byte	.LASF13
	.byte	0xc8
	.byte	0x6
	.4byte	0x6a
	.4byte	.LLST7
	.byte	0x3
	.4byte	.LASF14
	.byte	0x2
	.byte	0xc9
	.byte	0x6
	.4byte	0x6a
	.byte	0x3
	.4byte	.LASF15
	.byte	0x2
	.byte	0xca
	.byte	0x6
	.4byte	0x6a
	.byte	0
	.byte	0x8
	.4byte	0x6a
	.byte	0x13
	.4byte	0x6a
	.4byte	0x19e
	.byte	0x14
	.4byte	0x71
	.byte	0xa
	.byte	0
	.byte	0x7
	.string	"QS"
	.byte	0xa9
	.4byte	0x189
	.4byte	.LFB325
	.4byte	.LFE325-.LFB325
	.byte	0x1
	.byte	0x9c
	.4byte	0x1dd
	.byte	0x2
	.4byte	.LASF13
	.byte	0xaa
	.byte	0x6
	.4byte	0x6a
	.4byte	.LLST5
	.byte	0x3
	.4byte	.LASF14
	.byte	0x2
	.byte	0xab
	.byte	0x6
	.4byte	0x6a
	.byte	0x3
	.4byte	.LASF15
	.byte	0x2
	.byte	0xac
	.byte	0x6
	.4byte	0x6a
	.byte	0
	.byte	0x15
	.4byte	.LASF16
	.byte	0x2
	.byte	0x96
	.byte	0x33
	.4byte	0x189
	.4byte	.LFB324
	.4byte	.LFE324-.LFB324
	.byte	0x1
	.byte	0x9c
	.4byte	0x23d
	.byte	0x2
	.4byte	.LASF13
	.byte	0x98
	.byte	0x6
	.4byte	0x6a
	.4byte	.LLST2
	.byte	0x2
	.4byte	.LASF17
	.byte	0x98
	.byte	0xe
	.4byte	0x6a
	.4byte	.LLST3
	.byte	0x2
	.4byte	.LASF18
	.byte	0x98
	.byte	0x17
	.4byte	0x6a
	.4byte	.LLST4
	.byte	0x3
	.4byte	.LASF14
	.byte	0x2
	.byte	0x99
	.byte	0x6
	.4byte	0x6a
	.byte	0x3
	.4byte	.LASF15
	.byte	0x2
	.byte	0x9a
	.byte	0x6
	.4byte	0x6a
	.byte	0
	.byte	0x16
	.4byte	.LASF22
	.byte	0x3
	.byte	0x1d
	.byte	0x14
	.byte	0x3
	.4byte	0x257
	.byte	0x17
	.4byte	.LASF11
	.byte	0x3
	.byte	0x1d
	.byte	0x2d
	.4byte	0x71
	.byte	0
	.byte	0x18
	.4byte	.LASF27
	.byte	0x3
	.byte	0x16
	.byte	0x1c
	.4byte	0x71
	.byte	0x3
	.4byte	0x275
	.byte	0x3
	.4byte	.LASF11
	.byte	0x3
	.byte	0x18
	.byte	0xf
	.4byte	0x71
	.byte	0
	.byte	0x9
	.4byte	.LASF19
	.byte	0x1a
	.4byte	.LFB317
	.4byte	.LFE317-.LFB317
	.byte	0x1
	.byte	0x9c
	.4byte	0x2a0
	.byte	0xa
	.string	"p"
	.byte	0x1a
	.byte	0x18
	.4byte	0x2a0
	.4byte	.LLST1
	.byte	0x5
	.4byte	.LVL8
	.4byte	0x2b1
	.byte	0
	.byte	0x8
	.4byte	0x2ac
	.byte	0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF20
	.byte	0x19
	.4byte	0x2a5
	.byte	0x9
	.4byte	.LASF21
	.byte	0x12
	.4byte	.LFB316
	.4byte	.LFE316-.LFB316
	.byte	0x1
	.byte	0x9c
	.4byte	0x2e2
	.byte	0xa
	.string	"c"
	.byte	0x12
	.byte	0x13
	.4byte	0x2a5
	.4byte	.LLST0
	.byte	0x1a
	.4byte	.LVL2
	.4byte	0x2b1
	.byte	0x1b
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x3d
	.byte	0
	.byte	0
	.byte	0x1c
	.4byte	.LASF23
	.byte	0x4
	.2byte	0x325
	.byte	0x14
	.byte	0x3
	.4byte	0x2fc
	.byte	0x1d
	.string	"v"
	.byte	0x4
	.2byte	0x325
	.byte	0x38
	.4byte	0x50
	.byte	0
	.byte	0x1e
	.4byte	.LASF28
	.byte	0x5
	.byte	0x20
	.byte	0x14
	.byte	0x3
	.byte	0xb
	.string	"v"
	.byte	0x33
	.4byte	0x5c
	.byte	0xb
	.string	"a"
	.byte	0x44
	.4byte	0x5c
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.byte	0x1
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0
	.byte	0
	.byte	0x2
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x2
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x3
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x4
	.byte	0x5
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0x48
	.byte	0
	.byte	0x7d
	.byte	0x1
	.byte	0x7f
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x1d
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x58
	.byte	0x21
	.byte	0x2
	.byte	0x59
	.byte	0xb
	.byte	0x57
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x2
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0x33
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x7a
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0x21
	.byte	0x4
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0x6
	.byte	0x27
	.byte	0x19
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x7a
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x5
	.byte	0x3b
	.byte	0x21
	.byte	0x20
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0x11
	.byte	0x1
	.byte	0x25
	.byte	0xe
	.byte	0x13
	.byte	0xb
	.byte	0x3
	.byte	0x1f
	.byte	0x1b
	.byte	0x1f
	.byte	0x55
	.byte	0x17
	.byte	0x11
	.byte	0x1
	.byte	0x10
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0x16
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0x8
	.byte	0
	.byte	0
	.byte	0xf
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x7a
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x10
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x11
	.byte	0x34
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x12
	.byte	0x1d
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x58
	.byte	0xb
	.byte	0x59
	.byte	0x5
	.byte	0x57
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x13
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x14
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x15
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x7a
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x16
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x20
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x17
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x18
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x20
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x19
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1a
	.byte	0x48
	.byte	0x1
	.byte	0x7d
	.byte	0x1
	.byte	0x7f
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1b
	.byte	0x49
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x7e
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x1c
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x20
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1d
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1e
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x20
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loclists,"",@progbits
	.4byte	.Ldebug_loc3-.Ldebug_loc2
.Ldebug_loc2:
	.2byte	0x5
	.byte	0x4
	.byte	0
	.4byte	0
.Ldebug_loc0:
.LLST8:
	.byte	0x7
	.4byte	.LVL34
	.4byte	.LVL35
	.byte	0x5
	.byte	0x7f
	.byte	0
	.byte	0x34
	.byte	0x21
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL35
	.4byte	.LVL37
	.byte	0x1
	.byte	0x5f
	.byte	0
.LLST9:
	.byte	0x7
	.4byte	.LVL34
	.4byte	.LVL35
	.byte	0x5
	.byte	0x7f
	.byte	0
	.byte	0x34
	.byte	0x21
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL35
	.4byte	.LVL36
	.byte	0x1
	.byte	0x5f
	.byte	0
.LLST10:
	.byte	0x7
	.4byte	.LVL36
	.4byte	.LVL38
	.byte	0x2
	.byte	0x31
	.byte	0x9f
	.byte	0
.LLST11:
	.byte	0x7
	.4byte	.LVL36
	.4byte	.LVL38
	.byte	0x6
	.byte	0x9e
	.byte	0x4
	.4byte	0xf0006814
	.byte	0
.LLST6:
	.byte	0x7
	.4byte	.LVL26
	.4byte	.LVL33
	.byte	0x26
	.byte	0x30
	.byte	0x9f
	.byte	0x93
	.byte	0x4
	.byte	0x31
	.byte	0x9f
	.byte	0x93
	.byte	0x4
	.byte	0x9
	.byte	0xfe
	.byte	0x9f
	.byte	0x93
	.byte	0x4
	.byte	0x33
	.byte	0x9f
	.byte	0x93
	.byte	0x4
	.byte	0x9
	.byte	0xfc
	.byte	0x9f
	.byte	0x93
	.byte	0x4
	.byte	0x9
	.byte	0xfd
	.byte	0x9f
	.byte	0x93
	.byte	0x4
	.byte	0x34
	.byte	0x9f
	.byte	0x93
	.byte	0x4
	.byte	0x9
	.byte	0xfd
	.byte	0x9f
	.byte	0x93
	.byte	0x4
	.byte	0x93
	.byte	0xc
	.byte	0
.LLST7:
	.byte	0x7
	.4byte	.LVL27
	.4byte	.LVL28
	.byte	0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL28
	.4byte	.LVL29
	.byte	0x1
	.byte	0x5f
	.byte	0x7
	.4byte	.LVL29
	.4byte	.LVL30
	.byte	0x3
	.byte	0x7d
	.byte	0x80,0x1
	.byte	0x7
	.4byte	.LVL30
	.4byte	.LVL31
	.byte	0x1
	.byte	0x5f
	.byte	0x7
	.4byte	.LVL31
	.4byte	.LVL32
	.byte	0x3
	.byte	0x7d
	.byte	0x80,0x1
	.byte	0
.LLST5:
	.byte	0x7
	.4byte	.LVL19
	.4byte	.LVL20
	.byte	0x2
	.byte	0x3b
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL20
	.4byte	.LVL22
	.byte	0x1
	.byte	0x5f
	.byte	0x7
	.4byte	.LVL22
	.4byte	.LVL23
	.byte	0x7
	.byte	0x7e
	.byte	0x80,0x1
	.byte	0x6
	.byte	0x31
	.byte	0x1c
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL23
	.4byte	.LVL24
	.byte	0x5
	.byte	0x3b
	.byte	0x7f
	.byte	0
	.byte	0x1c
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL24
	.4byte	.LVL25
	.byte	0x5
	.byte	0x3a
	.byte	0x7f
	.byte	0
	.byte	0x1c
	.byte	0x9f
	.byte	0
.LLST2:
	.byte	0x7
	.4byte	.LVL9
	.4byte	.LVL10
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL10
	.4byte	.LVL12
	.byte	0x1
	.byte	0x5f
	.byte	0x7
	.4byte	.LVL12
	.4byte	.LVL13
	.byte	0x7
	.byte	0x7d
	.byte	0x80,0x1
	.byte	0x6
	.byte	0x23
	.byte	0x1
	.byte	0x9f
	.byte	0
.LLST3:
	.byte	0x7
	.4byte	.LVL13
	.4byte	.LVL15
	.byte	0x1
	.byte	0x5f
	.byte	0x7
	.4byte	.LVL15
	.4byte	.LVL16
	.byte	0x7
	.byte	0x7d
	.byte	0x80,0x1
	.byte	0x6
	.byte	0x23
	.byte	0x1
	.byte	0x9f
	.byte	0
.LLST4:
	.byte	0x7
	.4byte	.LVL16
	.4byte	.LVL17
	.byte	0x5
	.byte	0x40
	.byte	0x7f
	.byte	0
	.byte	0x1c
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL17
	.4byte	.LVL18
	.byte	0x5
	.byte	0x3f
	.byte	0x7f
	.byte	0
	.byte	0x1c
	.byte	0x9f
	.byte	0
.LLST1:
	.byte	0x7
	.4byte	.LVL3
	.4byte	.LVL4
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL4
	.4byte	.LVL5
	.byte	0x1
	.byte	0x58
	.byte	0x7
	.4byte	.LVL6
	.4byte	.LFE317
	.byte	0x1
	.byte	0x58
	.byte	0
.LLST0:
	.byte	0x7
	.4byte	.LVL0
	.4byte	.LVL1
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL1
	.4byte	.LFE316
	.byte	0x4
	.byte	0xa3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.byte	0
.Ldebug_loc3:
	.section	.debug_aranges,"",@progbits
	.4byte	0x3c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.LFB324
	.4byte	.LFE324-.LFB324
	.4byte	.LFB325
	.4byte	.LFE325-.LFB325
	.4byte	.LFB326
	.4byte	.LFE326-.LFB326
	.4byte	.LFB323
	.4byte	.LFE323-.LFB323
	.4byte	0
	.4byte	0
	.section	.debug_rnglists,"",@progbits
.Ldebug_ranges0:
	.4byte	.Ldebug_ranges3-.Ldebug_ranges2
.Ldebug_ranges2:
	.2byte	0x5
	.byte	0x4
	.byte	0
	.4byte	0
.LLRL13:
	.byte	0x6
	.4byte	.Ltext0
	.4byte	.Letext0
	.byte	0x6
	.4byte	.LFB324
	.4byte	.LFE324
	.byte	0x6
	.4byte	.LFB325
	.4byte	.LFE325
	.byte	0x6
	.4byte	.LFB326
	.4byte	.LFE326
	.byte	0x6
	.4byte	.LFB323
	.4byte	.LFE323
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF14:
	.string	"data"
.LASF28:
	.string	"csr_write_simple"
.LASF13:
	.string	"counter"
.LASF6:
	.string	"unsigned char"
.LASF8:
	.string	"long unsigned int"
.LASF15:
	.string	"temp"
.LASF7:
	.string	"short unsigned int"
.LASF21:
	.string	"putchar"
.LASF26:
	.string	"main"
.LASF27:
	.string	"irq_getmask"
.LASF22:
	.string	"irq_setmask"
.LASF17:
	.string	"counter1"
.LASF18:
	.string	"counter2"
.LASF10:
	.string	"unsigned int"
.LASF24:
	.string	"GNU C17 12.1.0 -mabi=ilp32 -mtune=rocket -misa-spec=2.2 -march=rv32i -g -Os -ffreestanding"
.LASF12:
	.string	"taps"
.LASF23:
	.string	"user_irq_0_ev_enable_write"
.LASF9:
	.string	"long long unsigned int"
.LASF16:
	.string	"mmatrix"
.LASF5:
	.string	"long long int"
.LASF11:
	.string	"mask"
.LASF19:
	.string	"print"
.LASF3:
	.string	"short int"
.LASF25:
	.string	"uint32_t"
.LASF4:
	.string	"long int"
.LASF20:
	.string	"char"
.LASF2:
	.string	"signed char"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"counter_la_mm.c"
.LASF1:
	.string	"/home/ubuntu/lab_final_prefetch0102-3/testbench/counter_la_mm"
	.ident	"GCC: (g1ea978e3066) 12.1.0"
