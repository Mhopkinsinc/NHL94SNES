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
	bcs .t1
	lda.w Xvel,x
	sta.b $0C
	lda.w Yvel,x
	sta.b $0E
	bra CODE_9E9B46

.t1:
	lda.w Xvel,y
	sta.b $0C
	lda.w Yvel,y
	sta.b $0E
CODE_9E9B46:
	asl.b $0C
	asl.b $0E
	lda.w #$000F
	jsl.l CODE_9C9AD0
	rtl
