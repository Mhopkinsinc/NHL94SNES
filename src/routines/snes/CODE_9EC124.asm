; Unidentified routine.
CODE_9EC124:
	lda.w #$0014
	sec
	sbc.w $1443,x
	asl a
	asl a
	asl a
	asl a
	sta.b $A5
	lda.w $19D4,x
	bmi CODE_9EC138
	asl.b $A5
CODE_9EC138:
	lda.w Xpos,x
	sec
	sbc.w puckx
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
	lsr.b $A5
CODE_9EC15C:
	jml.l randomd0
