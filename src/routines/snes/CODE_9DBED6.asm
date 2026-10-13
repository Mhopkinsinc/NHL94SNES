; Unidentified routine.
CODE_9DBED6:
	lda.w $1DB9
	sec
	sbc.w #$0007
	bmi CODE_9DBEE4
	sta.w $1D9B
	bra CODE_9DBF02
