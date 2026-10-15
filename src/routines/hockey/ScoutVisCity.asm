; Script code %v: the visitors city (the first team String)
ScoutVisCity:
	lda.w tmdata+2
	sta.b a1
	bra ScoutTeamCity
