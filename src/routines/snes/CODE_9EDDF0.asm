; Unidentified routine.
CODE_9EDDF0:
	lda.b $B5
	sec
	sbc.w pucky
	sta.b $A5
	lda.w puckvy
	beq CODE_9EDDED
	eor.b $A5
	bmi CODE_9EDDED
	lda.b $A5
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
	beq CODE_9EDE19
	ora.w #$F000
CODE_9EDE19:
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
	adc.w $0D71
	sta.b $A5
	cmp.w #$0088
	bmi CODE_9EDE45
	lda.w #$0088
	sta.b $A5
CODE_9EDE45:
	lda.b $A5
	cmp.w #$FF78
	bpl CODE_9EDE51
	lda.w #$FF78
	sta.b $A5
CODE_9EDE51:
	lda.b $A5
	sta.w $0D17,y
	rtl
