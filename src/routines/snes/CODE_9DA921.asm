; Unidentified routine.
CODE_9DA921:
	lda.b d3
	clc
	adc.b d2
	sta.b d3
	sec
	sbc.b d5
	bmi CODE_9DA931
	bvs CODE_9DA933
	bra CODE_9DA938
