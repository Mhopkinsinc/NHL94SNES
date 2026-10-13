; Unidentified routine.
CODE_9F8055:
	lda.w $1DB9
	eor.w #$0001
	sta.w $1DB9
	jsl.l CODE_9F8064
	bra CODE_9F8032
