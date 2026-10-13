; Unidentified routine.
CODE_808D43:
	stx.b $1C
	sty.b $1E
	ldy.w #$0000
	lda.b [$0C],y
	sta.b $18
	iny
	iny
	lda.b [$0C],y
	sta.b $1A
	lda.b $0C
	clc
	adc.w #$0006
	tax
	lda.b $1E
	asl a
	asl a
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.w $079C
	ora.b $1C
	tay
	lda.w $0761
	bmi CODE_808D72
	jmp.w CODE_808DB3
