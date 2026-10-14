; Unidentified routine.
CODE_9B8CFD:
	lda.b d0
CODE_9B8CFF:
	sta.b a3
	jsr.w CODE_808D72
	cmp.w $1D8F
	bne CODE_9B8D20
	jsr.w CODE_9B8D32
	bra CODE_9B8D20
