; Unidentified routine.
CODE_9FBB56:
	tay
	lda.w Xpos,y
	sta.b $A5
	lda.w Ypos,y
	sta.b $A9
	lda.w sfhormode
	beq CODE_9FBB79
	lda.b $A9
	eor.w #$FFFF
	inc a
	sta.b $A5
	lda.w Xpos,y
	sec
	sbc.w #$00C5
	sta.b $A9
	bra CODE_9FBB89
