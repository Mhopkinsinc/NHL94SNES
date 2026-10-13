; Unidentified routine.
CODE_9EDC44:
	phk
	plb
	lda.w puckx
	sec
	sbc.w Xpos,x
	sta.b $A5
	lda.w pucky
	sec
	sbc.w Ypos,x
	sta.b $A9
	bra CODE_9EDC67
