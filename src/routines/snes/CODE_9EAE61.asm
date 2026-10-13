; Unidentified routine.
CODE_9EAE61:
	cmp.w Xpos,y
	bpl CODE_9EAEBB
	lda.b $16
	sta.b $A9
	rts
