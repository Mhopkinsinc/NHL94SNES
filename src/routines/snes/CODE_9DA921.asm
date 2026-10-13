; Unidentified routine.
CODE_9DA921:
	lda.b $B1
	clc
	adc.b $AD
	sta.b $B1
	sec
	sbc.b $B9
	bmi CODE_9DA931
	bvs CODE_9DA933
	bra CODE_9DA938
