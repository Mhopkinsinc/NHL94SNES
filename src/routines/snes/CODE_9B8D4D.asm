; Unidentified routine.
CODE_9B8D4D:
	lda.b d0
.1:
	inc a
	inc a
	sta.b a3
	jsr.w CODE_808D72
	sta.w $1D93
	inc.b a3
	inc.b a3
	jsr.w CODE_808D72
	dec.b a3
	dec.b a3
	jsr.w CODE_9B8D7C
	inc.b a3
	inc.b a3
	lda.w $1D93
	jsr.w CODE_9B8D7C
	rts

.t1:
	sep #$20
	lda.b [a3]
	rep #$20
	and.w #$00FF
	rts
