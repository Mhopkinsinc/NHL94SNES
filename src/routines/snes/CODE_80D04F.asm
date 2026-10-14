; Unidentified routine.
CODE_80D04F:
	lda.b a1
	clc
	adc.b [a1]
	adc.w #$0004
	sta.b a1
CODE_80D059:
	lda.b [a1]
	bmi CODE_80D061
	dec.b d0
	bpl CODE_80D04F
CODE_80D061:
	lda.b [a1]
	bpl CODE_80D06A
	dec.w $0D47
	bra CODE_80D03E
