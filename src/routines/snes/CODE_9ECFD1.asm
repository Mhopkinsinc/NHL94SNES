; Unidentified routine.
CODE_9ECFD1:
	lda.b [$8D]
	clc
	adc.b $8D
	sta.b $8D
	dec.b $A5
	bra CODE_9ECFCA
