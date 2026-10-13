; Unidentified routine.
CODE_9B8309:
	and.b #$1E
	cmp.b #$02
	bne CODE_9B8316
	lda.b #$04
	tsb.w $1A0E
	bra CODE_9B831F
