; Unidentified routine.
CODE_9EAC4A:
	cmp.w Xpos,y
	bpl CODE_9EAC53
	lda.b $16
	sta.b d1
CODE_9EAC53:
	rts
