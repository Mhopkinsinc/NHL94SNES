; Unidentified routine.
CODE_9B8D72:
	sep #$20
	lda.b [$95]
	rep #$20
	and.w #$00FF
	rts
