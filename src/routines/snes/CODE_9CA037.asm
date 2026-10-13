; Unidentified routine.
CODE_9CA037:
	lda.w $0C29
	dec a
	bmi CODE_9CA032
CODE_9CA03D:
	sta.w $0C29
CODE_9CA040:
	lda.w $0C23
	asl a
	asl a
	asl a
	adc.w $0C29
	sta.w $0C29
	rtl
