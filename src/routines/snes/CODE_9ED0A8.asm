; Unidentified routine.
CODE_9ED0A8:
	lda.w $15D6
	bne CODE_9ED0FC
	stz.b $91
	lda.w #$0002
	sta.b $8D
	jsl.l CODE_9ED0BF
	stz.b $8D
	lda.w #$0002
	sta.b $91
CODE_9ED0BF:
	ldy.b $91
	lda.w tmgoalie,y
	bmi CODE_9ED0FC
	ldx.w tmsort,y
	ldy.w $0AD9
	bmi CODE_9ED0FC
	lda.w pfteam,y
	cmp.w pfteam,x
	bne CODE_9ED0FC
	ldy.b $91
	lda.w gmode
	bit.w #$0008
	bne CODE_9ED0EF
	lda.w $19D0,y
	bne CODE_9ED0FC
	lda.w pucky
	sta.b $A9
	jsl.l CODE_9ED130
	rtl
