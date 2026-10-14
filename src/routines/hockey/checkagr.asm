; How hard a check is, from the player's checking rating
checkagr:
	lda.w #$0014
	sec
	sbc.w $1443,x
	asl a
	asl a
	asl a
	asl a
	sta.b d0
	lda.w $19D4,x
	bmi CODE_9EC138
	asl.b d0
CODE_9EC138:
	lda.w Xpos,x
	sec
	sbc.w $0D71
	cmp.w #$FFD7
	bmi CODE_9EC15C
	cmp.w #$0029
	bpl CODE_9EC15C
	lda.w Ypos,x
	sec
	sbc.w pucky
	cmp.w #$FFD7
	bmi CODE_9EC15C
	cmp.w #$0029
	bpl CODE_9EC15C
	lsr.b d0
CODE_9EC15C:
	jml.l randomd0
