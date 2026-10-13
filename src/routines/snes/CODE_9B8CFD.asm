; Unidentified routine.
CODE_9B8CFD:
	lda.b $A5
CODE_9B8CFF:
	sta.b $95
	jsr.w CODE_808D72
	cmp.w $1D8F
	bne CODE_9B8D20
	jsr.w $8D32
	bra CODE_9B8D20
