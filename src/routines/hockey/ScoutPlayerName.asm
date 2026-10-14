; Put the name of player d0 of team a2 (GetPlayerRecord) into mesarea and type it (ScoutTypeText)
ScoutPlayerName:
	phx
	lda.b a0
	pha
	jsl.l GetPlayerRecord
	lda.b $8B
	sta.b $8F
	lda.b a0
	sta.b a1
	lda.w #mesarea>>16
	sta.b $97
	lda.w #mesarea
	sta.b a3
	lda.w #$0002
	sta.b [a3]
	jsl.l appstring
	lda.w #mesarea>>16
	sta.b $8F
	lda.w #mesarea
	sta.b a1
	pla
	sta.b a0
	plx
	stx.b d0
	jmp.w ScoutTypeText
