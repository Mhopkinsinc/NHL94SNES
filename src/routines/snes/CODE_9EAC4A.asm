; Unidentified routine.
CODE_9EAC4A:
	cmp.w Xpos,y
	bpl .rts
	lda.b $16
	sta.b d1
.rts:
	rts
