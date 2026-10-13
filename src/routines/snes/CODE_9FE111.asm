; Unidentified routine.
CODE_9FE111:
	sep #$20
	lda.b #$00
	sec
	sbc.b $14
	sta.w $1A12,x
	bra CODE_9FE10B
