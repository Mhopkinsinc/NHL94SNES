; Unidentified routine.
CODE_9E9B0E:
	phy
	ldy.w $0EC3,x
	lda.w $0EE3,x
	jsl.l CODE_9CA554
	sta.b $14
	lda.b $01,s
	tay
	lda.w $0EC3,y
	pha
	lda.w $0EE3,y
	tay
	pla
	jsl.l CODE_9CA554
	ply
	cmp.b $14
	bcs CODE_9E9B3C
	lda.w $0EC3,x
	sta.b $0C
	lda.w $0EE3,x
	sta.b $0E
	bra CODE_9E9B46
