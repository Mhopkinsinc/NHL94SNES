; Check button: a speed burst in the facing direction, which costs energy
burst:
	lda.w pfalock,x
	beq .t1
	rtl

.t1:
	jsl.l getpde
	lda.l $7E34C6
	beq .1
	lda.b d0
	sec
	sbc.w #$00CC
	sta.b d0
	jsl.l setpde
	lda.l $7E34C6
	cmp.w #$0002
	bne .1
	lda.w #$1000
	sta.b d0
.1:
	lda.b d0
	ldx.w #$0233
	jsl.l Mul16U
	ldx.b a3
	lda.b $0A
	sta.b $D7
	lda.w facedir,x
	asl a
	asl a
	tay
	lda.w #dirtab>>16
	sta.b $8B
	lda.w #dirtab
	sta.b a0
	lda.b [a0],y
	iny
	iny
	tax
	lda.b $D7
	jsl.l Mul8XS
	ldx.b a3
	clc
	adc.w Xvel,x
	sta.w Xvel,x
	lda.b [a0],y
	tax
	lda.b $D7
	jsl.l Mul8XS
	ldx.b a3
	clc
	adc.w Yvel,x
	sta.w Yvel,x
	lda.w #SPAburst
	sta.w pfalock,x
	jml.l SetSPAFromA
