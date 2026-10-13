; Unidentified routine.
CODE_9EDD65:
	lda.w $1E91
	bne CODE_9EDD71
CODE_9EDD6A:
	lda.w puckvy
	bmi CODE_9EDD89
	bra CODE_9EDD77
