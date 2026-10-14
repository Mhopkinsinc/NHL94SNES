; Unidentified routine.
CODE_9EDDF0:
	lda.b d4
	sec
	sbc.w pucky
	sta.b d0
	lda.w puckvy
	beq CODE_9EDDED
	eor.b d0
	bmi CODE_9EDDED
	lda.b d0
	stz.b $08
	lsr a
	ror.b $08
	lsr a
	ror.b $08
	lsr a
	ror.b $08
	lsr a
	ror.b $08
	bit.w #$0800
	beq .1
	ora.w #$F000
.1:
	sta.b $0A
	lda.w puckvy
	sta.b $04
	jsl.l Div32S
	lda.b $00
	sta.w $0D19,y
	lda.b $00
	asl a
	asl a
	asl a
	asl a
	ldx.w puckvx
	jsl.l Mul16XS
	adc.w puckx
	sta.b d0
	cmp.w #$0088
	bmi .2
	lda.w #$0088
	sta.b d0
.2:
	lda.b d0
	cmp.w #$FF78
	bpl .3
	lda.w #$FF78
	sta.b d0
.3:
	lda.b d0
	sta.w $0D17,y
	rtl
