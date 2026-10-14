; Unidentified routine.
CODE_9D9E89:
	lda.b d0
	clc
	adc.w $0D47
	sta.b d0
	bmi CODE_9D9E86
	sta.w $0D47
	jsl.l CODE_9D9ECB
	bra CODE_9D9E86
