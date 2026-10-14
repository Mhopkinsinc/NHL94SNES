; Unidentified routine.
CODE_9E9987:
	tya
	jsl.l CODE_9BC074
	lda.b d0
	bit.w #$8000
	beq .1
	eor.w #$FFFF
	inc a
.1:
	sta.b d2
	asl a
	tax
	lda.l DATA8_9E9927,x
	sta.b d4
	lda.b d1
	bit.w #$8000
	beq .2
	eor.w #$FFFF
	inc a
.2:
	asl a
	tax
	lda.l DATA8_9E9927,x
	sta.b d3
	ldx.b $E4
	lda.b a2
	jsl.l GetHot
	ldy.b a2
	lda.b d0
	clc
	adc.w Xpos,y
	sec
	sbc.w $0D71
	bit.w #$8000
	beq .3
	eor.w #$FFFF
	inc a
.3:
	cmp.b d2
	bcs .6
	sta.b d0
	lda.b d1
	clc
	adc.w Ypos,y
	sec
	sbc.w pucky
	bit.w #$8000
	beq .4
	eor.w #$FFFF
	inc a
.4:
	cmp.b d2
	bcs .6
	sta.b d1
	lda.b d3
	clc
	adc.b d4
	cmp.w #$0005
	bpl .5
	lda.w #$0005
.5:
	cmp.w $0DF9
	bcc .6
	lda.b d3
	sec
	sbc.b d4
	bmi .t1
	cmp.w $0DF9
	bcc .t1
.6:
	jmp.w CODE_9E98FB

.t1:
	lda.b d0
	tax
	jsl.l Mul8U
	sta.b d0
	lda.b d1
	tax
	jsl.l Mul8U
	clc
	adc.b d0
	sta.b d0
	lda.b d2
	tax
	jsl.l Mul8U
	ldx.b $E4
	sta.b d1
	lda.w $121F
	bmi .2x
	beq .2x
.1x:
	lsr.b d1
	lsr.b d1
.2x:
	lda.b d1
	cmp.b d0
	bcc .3x
	jsl.l CODE_9EF5DA
.3x:
	jmp.w CODE_9E98FB
