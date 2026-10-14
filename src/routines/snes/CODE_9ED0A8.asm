; Unidentified routine.
CODE_9ED0A8:
	lda.w gmclock
	bne CODE_9ED0FC
	stz.b a2
	lda.w #$0002
	sta.b a1
	jsl.l CODE_9ED0BF
	stz.b a1
	lda.w #$0002
	sta.b a2
CODE_9ED0BF:
	ldy.b a2
	lda.w tmgoalie,y
	bmi CODE_9ED0FC
	ldx.w tmsort,y
	ldy.w $0AD9
	bmi CODE_9ED0FC
	lda.w pfteam,y
	cmp.w pfteam,x
	bne CODE_9ED0FC
	ldy.b a2
	lda.w gmode
	bit.w #$0008
	bne CODE_9ED0EF
	lda.w $19D0,y
	bne CODE_9ED0FC
	lda.w pucky
	sta.b d1
	jsl.l CPgoalie
	rtl
