; Unidentified routine.
CODE_9E9528:
	lda.b d0
	pha
	lda.b d1
	pha
	lda.b $AB
	pha
	lda.b d2
	pha
	lda.b d3
	pha
	lda.b d4
	pha
	lda.b d5
	pha
	sty.b a2
	lda.w Xpos,y
	sec
	sbc.w Xpos,x
	sta.b d2
	lda.w Ypos,y
	sec
	sbc.w Ypos,x
	sta.b d3
	ldy.b d2
	jsl.l CODE_9CA554
	cmp.w #$0010
	bmi CODE_9E955F
	jmp.w CODE_9E976E
