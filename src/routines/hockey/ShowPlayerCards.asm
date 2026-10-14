; Player cards. Left and right change the player, start leaves.
ShowPlayerCards:
	jsl.l GetPauseTeam
	lda.b a2
	pha
	stz.w $07C6
	jsl.l CODE_9DC697
	pla
	sta.b a2
	lda.b a2
	pha
	stz.w $1DB9
	jsl.l GetPlayerCount
	lda.b d0
	clc
	adc.w #$0006
	sta.w $1DC1
	jsl.l ScreenOn
	jsl.l DrawPlayerCard
PlayerCardsRedraw:
	jsl.l SendTextMap
PlayerCardsLoop:
	jsl.l WaitFrame
	jsl.l ReadPads
	jsl.l ReadPausePad
	jsl.l ProcessInputWithRepeat
	lda.b d1
	bit.w #$1000
	bne PlayerCardsExit
	bit.w #$0100
	bne NextPlayerCard
	bit.w #$0200
	bne PrevPlayerCard
	bit.w #$4000
	beq PlayerCardsWait
	jmp.w SwapPlayerCardTeam
PlayerCardsWait:
	bra PlayerCardsLoop
PlayerCardsExit:
	pla
	sta.b a2
	rtl
