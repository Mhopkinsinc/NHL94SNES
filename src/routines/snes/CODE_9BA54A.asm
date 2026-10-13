; Unidentified routine.
CODE_9BA54A:
	lda.w $1DB9
	dec a
	bmi CODE_9BA522
	sta.w $1DB9
	bra CODE_9BA4FE
