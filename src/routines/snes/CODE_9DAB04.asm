; Unidentified routine.
CODE_9DAB04:
	lda.w HomeTeam
	sta.l $7E3452
CODE_9DAB0B:
	lda.l $7E3458
	dec a
	dec a
	sta.l $7E3458
	bmi CODE_9DAB18
	rts
