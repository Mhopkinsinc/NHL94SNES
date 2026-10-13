; Unidentified routine.
CODE_9ED0A8:
	lda.w gmclock
	bne rtss
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
	bmi rtss
	ldx.w tmsort,y
	ldy.w puckc
	bmi rtss
	lda.w pfteam,y
	cmp.w pfteam,x
	bne rtss
	ldy.b $91
	lda.w gmode
	bit.w #$0008
	bne CODE_9ED0EF
	lda.w $19D0,y
	bne rtss
	lda.w pucky
	sta.b $A9
	jsl.l CPgoalie
	rtl
