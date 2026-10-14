; Unidentified routine.
CODE_9ED755:
	lda.w puckvy
	xba
	lsr a
	and.w #$007F
	bit.w #$0040
	beq .1
	ora.w #$FF80
.1:
	sta.b $14
	cmp.w #$8000
	ror a
	adc.b $14
	clc
	adc.w pucky
	sta.b d1
	lda.b d1
	cmp.w #$00E0
	bpl .2
	lda.b d1
	cmp.w #$FF20
	bpl CODE_9ED7CA
.2:
	lda.w $0D07
	bpl CODE_9ED7B2
	lda.w puckc
	bmi CODE_9ED7B2
	lda.w seed
	and.w #$0180
	beq CODE_9ED7D2
CODE_9ED793:
	lda.w puckvx
	xba
	and.w #$00FF
	bit.w #$0080
	beq .1
	ora.w #$FF00
.1:
	sta.b $14
	cmp.w #$8000
	ror a
	adc.b $14
	clc
	adc.w puckx
	sta.b d0
	bra CODE_9ED7E7
