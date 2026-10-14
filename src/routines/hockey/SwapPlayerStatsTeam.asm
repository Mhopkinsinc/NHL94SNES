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
	sta.l $7E3454
	ldx.w #$0049
	ldy.w #$0018
	lda.w #$009C
	sta.b $8F
	lda.w #PlayerStatsHeading
	sta.b a1
	jsl.l PrintLetterSprites
	jsl.l DrawMatchupPictures
	jsl.l WaitFrame
	jsl.l DrawPlayerStatsPage
	jsl.l SpriteFrameEnd
	jsl.l SendColours
	jmp.w ShowPlayerStats_redraw
