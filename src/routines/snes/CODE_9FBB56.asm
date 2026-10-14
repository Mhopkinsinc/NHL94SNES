; Unidentified routine.
CODE_9FBB56:
	tay
	lda.w Xpos,y
	sta.b d0
	lda.w Ypos,y
	sta.b d1
	lda.w sfhormode
	beq CODE_9FBB79
	lda.b d1
	eor.w #$FFFF
	inc a
	sta.b d0
	lda.w Xpos,y
	sec
	sbc.w #tmp0
	sta.b d1
	bra CODE_9FBB89
