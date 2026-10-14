; Unidentified routine.
CODE_9EDC44:
	phk
	plb
	lda.w $0D71
	sec
	sbc.w Xpos,x
	sta.b d0
	lda.w pucky
	sec
	sbc.w Ypos,x
	sta.b d1
	bra CODE_9EDC67
