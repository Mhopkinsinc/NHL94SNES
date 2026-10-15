; Name player A of the home team (ScoutPlayerName)
ScoutHomePlayer:
	ldx.b d0
	sta.b d0
	stz.b a2
	bra ScoutPlayerName
