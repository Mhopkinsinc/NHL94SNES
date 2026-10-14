; Unidentified routine.
CODE_9ECFD1:
	lda.b [a1]
	clc
	adc.b a1
	sta.b a1
	dec.b d0
	bra CODE_9ECFCA
