; a3 = the RAM lines of team a2 (homelines / awaylines)
GetTeamLines:
	lda.w #$0000
	sta.b $97
	lda.b a2
	beq .t1
	lda.w #awaylines
	bra .1

.t1:
	lda.w #homelines
.1:
	sta.b a3
	rtl
