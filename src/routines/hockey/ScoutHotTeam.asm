; Script code %t: the full name of the hotter team ($1E41), then " has" (" have" for the two New York teams)
ScoutHotTeam:
	lda.w hotterteam
	jsl.l GetTeamLongName
	lda.w #mesarea>>16
	sta.b a3+2
	lda.w #mesarea
	sta.b a3
	lda.w #$0002
	sta.b [a3]
	jsl.l appstring
	lda.w #ScoutFragments>>16
	sta.b a1+2
	lda.w #ScoutFragments+18
	sta.b a1
	lda.w hotterteam
	cmp.w #$000D
	beq .1
	cmp.w #$000E
	beq .1
	lda.w #ScoutFragments>>16
	sta.b a1+2
	lda.w #ScoutFragments+12
	sta.b a1
.1:
	jsl.l appstring
	lda.w #mesarea>>16
	sta.b a1+2
	lda.w #mesarea
	sta.b a1
	bra ScoutTypeText
