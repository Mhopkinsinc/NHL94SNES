; Unidentified routine.
CODE_9B8F2B:
	lda.b $A5
	clc
	adc.w $0D47
	sta.b $A5
	bmi CODE_9B8F28
	sta.w $0D47
	jsl.l CODE_9B8F7B
	bra CODE_9B8F28
