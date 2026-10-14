; Switch player stats to the other team and redraw the heading.
SwapPlayerStatsTeam:
	lda.b a2
	eor.w #$0002
	sta.b a2
	jsl.l CODE_9C8826
	jsl.l CODE_9C8B54
	jsl.l CODE_9C8B69
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
	jsl.l CODE_9C936C
	jsl.l CODE_9DDDB3
	jsl.l WaitFrame
	jsl.l CODE_9C88A0
	jsl.l SpriteFrameEnd
	jsl.l CODE_9DE0D4
	jmp.w CODE_9C8684
