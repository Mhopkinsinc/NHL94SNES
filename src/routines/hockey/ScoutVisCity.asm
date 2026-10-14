; Script code %v: the visitors city (the first team String)
ScoutVisCity:
	lda.w $1CDE
	sta.b a1
	bra ScoutTeamCity
