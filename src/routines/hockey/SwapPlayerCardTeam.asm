; Switch player cards to the other team.
SwapPlayerCardTeam:
	lda.b a2
	eor.w #$0002
	sta.b a2
	stz.w curitem
	jsl.l GetPlayerCount
	lda.b d0
	clc
	adc.w #$0006
	sta.w listend
	jsl.l DrawPlayerCard
	jmp.w PlayerCardsRedraw
