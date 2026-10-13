; Unidentified routine.
CODE_9E9B0E:
	phy
	ldy.w Xvel,x
	lda.w Yvel,x
	jsl.l CODE_9CA554
	sta.b $14
	lda.b $01,s
	tay
	lda.w Xvel,y
	pha
	lda.w Yvel,y
	tay
	pla
	jsl.l CODE_9CA554
	ply
	cmp.b $14
	bcs CODE_9E9B3C
	lda.w Xvel,x
	sta.b $0C
	lda.w Yvel,x
	sta.b $0E
	bra CODE_9E9B46
