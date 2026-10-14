; Unidentified routine.
CODE_9E98FB:
	lda.w Xpos,y
	sec
	sbc.w puckx
	sta.b d0
	cmp.w #$FFF5
	bmi CODE_9E98EC
	cmp.w #$000B
	bpl CODE_9E98EC
	lda.w Ypos,y
	sec
	sbc.w pucky
	sta.b d1
	cmp.w #$FFF5
	bmi CODE_9E98EC
	cmp.w #$000B
	bpl CODE_9E98EC
	jsl.l CODE_9EF042
	bra CODE_9E98EC
