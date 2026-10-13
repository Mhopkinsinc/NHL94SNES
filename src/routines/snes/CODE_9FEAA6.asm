; Unidentified routine.
CODE_9FEAA6:
	lda.b $89
	ldx.b $A5
CODE_9FEAAA:
	dex
	bmi CODE_9FEAB4
	clc
	adc.b [$89]
	sta.b $89
	bra CODE_9FEAAA
