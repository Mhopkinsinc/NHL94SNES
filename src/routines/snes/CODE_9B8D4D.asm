; Unidentified routine.
CODE_9B8D4D:
	lda.b $A5
CODE_9B8D4F:
	inc a
	inc a
	sta.b $95
	jsr.w CODE_808D72
	sta.w $1D93
	inc.b $95
	inc.b $95
	jsr.w CODE_808D72
	dec.b $95
	dec.b $95
	jsr.w CODE_9B8D7C
	inc.b $95
	inc.b $95
	lda.w $1D93
	jsr.w CODE_9B8D7C
	rts
