; The first and last row of the player stats list: the goalies or the skaters
SetPlayerStatsRange:
	lda.w statcolumn
	cmp.w #$0000
	beq .t1
	jsl.l GoalieCount
	lda.b d0
	sta.w listtop
	jsl.l GetPlayerCount
	lda.b d0
	sta.w listend
	bra .1

.t1:
	stz.w listtop
	jsl.l GoalieCount
	lda.b d0
	sta.w listend
.1:
	dec.w listend
	lda.w listtop
	sta.w curitem
	rtl
