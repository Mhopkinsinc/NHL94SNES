; Switch the roster to the other team and redraw it.
SwapRosterTeam:
	lda.b a2
	eor.w #$0002
	sta.b a2
	jsl.l SpriteFrameStart
	ldx.b a2
	lda.w HomeTeam,x
	sta.l $7E3454
	ldx.w #$004C
	ldy.w #$0018
	lda.w #TeamRosterSwap>>16
	sta.b $8F
	lda.w #TeamRosterSwap
	sta.b a1
	jsl.l PrintLetterSprites
	jsl.l DrawMatchupPictures
	jmp.w TeamRosterRedraw
