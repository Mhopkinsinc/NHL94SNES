; Script code %V: the visitors full name (GetTeamLongName)
ScoutVisName:
	lda.w VisTeam
	jsl.l GetTeamLongName
	bra ScoutAppend
