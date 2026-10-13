; Unidentified routine.
CODE_9CA580:
	lda.b $14
	lsr a
	clc
	adc.b $14
	lsr a
	lsr a
	clc
	adc.b $16
	rtl
