; Unidentified routine.
CODE_9ED755:
	lda.w puckvy
	xba
	lsr a
	and.w #$007F
	bit.w #$0040
	beq CODE_9ED765
	ora.w #$FF80
CODE_9ED765:
	sta.b $14
	cmp.w #$8000
	ror a
	adc.b $14
	clc
	adc.w pucky
	sta.b $A9
	lda.b $A9
	cmp.w #$00E0
	bpl CODE_9ED781
	lda.b $A9
	cmp.w #$FF20
	bpl CODE_9ED7CA
CODE_9ED781:
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
	beq CODE_9ED7A2
	ora.w #$FF00
CODE_9ED7A2:
	sta.b $14
	cmp.w #$8000
	ror a
	adc.b $14
	clc
	adc.w puckx
	sta.b $A5
	bra CODE_9ED7E7
