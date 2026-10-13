; Unidentified routine.
CODE_9F86D3:
	bne CODE_9F86E2
	lda.w Ypos,x
	bpl CODE_9F86DF
	stx.w $0B9F
	bra CODE_9F86E2
