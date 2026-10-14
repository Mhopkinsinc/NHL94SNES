; Script code %H: the home full name (GetTeamLongName)
ScoutHomeName:
	lda.w HomeTeam
	jsl.l GetTeamLongName
	bra ScoutAppend
