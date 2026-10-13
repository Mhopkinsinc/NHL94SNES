; Unidentified routine.
CODE_9BA079:
	lda.w $0DF9
	cmp.w #$001A
	bmi CODE_9BA076
	asl a
	adc.w $0DF9
	clc
	adc.w pucky
	cmp.w #$FE98
	bpl CODE_9BA076
	cmp.w #$FE90
	bmi CODE_9BA076
	lda.w puckx
	cmp.w #$FFFD
	bpl CODE_9BA076
	cmp.w #$FFF4
	bmi CODE_9BA076
	bra CODE_9BA038
