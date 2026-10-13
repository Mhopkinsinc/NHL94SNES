; Unidentified routine.
CODE_9EDC86:
	cmp.w #$0108
	bpl CODE_9EDC85
	lda.w pucky
	cmp.w #$0108
	bpl CODE_9EDC80
	rts
