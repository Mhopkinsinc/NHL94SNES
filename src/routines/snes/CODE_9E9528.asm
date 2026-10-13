; Unidentified routine.
CODE_9E9528:
	lda.b $A5
	pha
	lda.b $A9
	pha
	lda.b $AB
	pha
	lda.b $AD
	pha
	lda.b $B1
	pha
	lda.b $B5
	pha
	lda.b $B9
	pha
	sty.b $91
	lda.w Xpos,y
	sec
	sbc.w Xpos,x
	sta.b $AD
	lda.w Ypos,y
	sec
	sbc.w Ypos,x
	sta.b $B1
	ldy.b $AD
	jsl.l CODE_9CA554
	cmp.w #$0010
	bmi CODE_9E955F
	jmp.w $976E
