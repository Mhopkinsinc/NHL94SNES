; Unidentified routine.
CODE_9B8D32:
	jsr.w CODE_808D72
	sta.w $1D93
	inc.b $95
	jsr.w CODE_808D72
	dec.b $95
	jsr.w $8D7C
	inc.b $95
	lda.w $1D93
	jsr.w $8D7C
	dec.b $95
	rts
