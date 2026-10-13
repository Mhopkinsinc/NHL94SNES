; Unidentified routine.
CODE_9E98FB:
	lda.w Xpos,y
	sec
	sbc.w puckx
	sta.b $A5
	cmp.w #$FFF5
	bmi CODE_9E98EC
	cmp.w #$000B
	bpl CODE_9E98EC
	lda.w Ypos,y
	sec
	sbc.w pucky
	sta.b $A9
	cmp.w #$FFF5
	bmi CODE_9E98EC
	cmp.w #$000B
	bpl CODE_9E98EC
	jsl.l CODE_9EF042
	bra CODE_9E98EC
