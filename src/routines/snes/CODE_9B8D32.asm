; Unidentified routine.
CODE_9B8D32:
	jsr.w CODE_9B8D72
	sta.w $1D93
	inc.b a3
	jsr.w CODE_9B8D72
	dec.b a3
	jsr.w CODE_9B8D7C
	inc.b a3
	lda.w $1D93
	jsr.w CODE_9B8D7C
	dec.b a3
	rts
