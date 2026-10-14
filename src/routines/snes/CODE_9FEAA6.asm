; Unidentified routine.
CODE_9FEAA6:
	lda.b a0
	ldx.b d0
CODE_9FEAAA:
	dex
	bmi CODE_9FEAB4
	clc
	adc.b [a0]
	sta.b a0
	bra CODE_9FEAAA
