; Name player A of the visitors (ScoutPlayerName)
ScoutVisPlayer:
	ldx.b d0
	sta.b d0
	lda.w #$0002
	sta.b a2
	bra ScoutPlayerName
