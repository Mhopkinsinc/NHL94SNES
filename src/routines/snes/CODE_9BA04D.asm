; Unidentified routine.
CODE_9BA04D:
	lda.w $0DF9
	cmp.w #$001A
	bmi CODE_9BA076
	asl a
	adc.w $0DF9
	clc
	adc.w pucky
	cmp.w #$FEB8
	bpl CODE_9BA076
	cmp.w #$FEB0
	bmi CODE_9BA076
	lda.w puckx
	cmp.w #$FFF4
	bpl CODE_9BA076
	cmp.w #$FFEC
	bmi CODE_9BA076
	bra CODE_9BA038
