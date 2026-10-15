; Print one ticker line: team d0's name and score d1
TickerTeam:
	lda.b r1,s
	sta.w printx
	inc.w printy
	lda.b d0
	jsl.l GetTeamLongName
	jsl.l print
	lda.b r1,s
	clc
	adc.w #$0017
	sta.w printx
	lda.b d1
	sta.b d0
	jsl.l PushNumber
	jml.l print
