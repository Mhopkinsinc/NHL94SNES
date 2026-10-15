; Switch player stats to the other team and redraw the heading.
SwapPlayerStatsTeam:
	lda.b a2
	eor.w #$0002
	sta.b a2
	jsl.l SetPlayerStatsRange
	jsl.l InitStatsOrder
	jsl.l SortPlayerStats
	jsl.l SpriteFrameStart
	ldx.b a2
	lda.w HomeTeam,x
	sta.l setupvis
	ldx.w #$0049
	ldy.w #$0018
	lda.w #PlayerStatsHeading>>16
	sta.b a1+2
	lda.w #PlayerStatsHeading
	sta.b a1
	jsl.l PrintLetterSprites
	jsl.l DrawMatchupPictures
	jsl.l WaitFrame
	jsl.l DrawPlayerStatsPage
	jsl.l SpriteFrameEnd
	jsl.l SendColours
	jmp.w ShowPlayerStats_redraw
