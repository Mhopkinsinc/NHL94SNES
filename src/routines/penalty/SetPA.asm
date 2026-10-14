; Start the referee animation for penalty d0 and show its message
SetPA:
	lda.b d0
	sta.w RefPen
	stz.w RefStep
	jsl.l CODE_9EC160
	lda.b d0
	cmp.w #PenGoal
	bne .0
	jsl.l CODE_9FA697
.0:
	lda.w #$7FFF
	sta.w penmsgtimer
	lda.w sfhormode
	beq SetPA2
	lda.w #$003C
	sta.w penmsgtimer
SetPA2:
	phx
	lda.b d0
	pha
	lda.b d0+2
	pha
	lda.b d1
	pha
	lda.b d1+2
	pha
	lda.b d2
	pha
	lda.b d2+2
	pha
	lda.b a0
	pha
	lda.b a0+2
	pha
	lda.b a1
	pha
	lda.b a1+2
	pha
	lda.w RefStep
	bpl CODE_9EF9C5
	lda.w $1D81
	beq .skip
	lda.w #$0001
	sta.w $1D83
.skip:
	lda.w RefStep
	bra CODE_9EFA0F
