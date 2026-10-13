; Unidentified routine.
CODE_80D04F:
	lda.b $8D
	clc
	adc.b [$8D]
	adc.w #$0004
	sta.b $8D
CODE_80D059:
	lda.b [$8D]
	bmi CODE_80D061
	dec.b $A5
	bpl CODE_80D04F
CODE_80D061:
	lda.b [$8D]
	bpl CODE_80D06A
	dec.w $0D47
	bra CODE_80D03E
