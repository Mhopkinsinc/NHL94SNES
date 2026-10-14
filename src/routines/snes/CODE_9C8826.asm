; Unidentified routine.
CODE_9C8826:
	lda.w $1DF9
	cmp.w #$0000
	beq .t1
	jsl.l GoalieCount
	lda.b d0
	sta.w $1DBD
	jsl.l GetPlayerCount
	lda.b d0
	sta.w $1DC1
	bra .1

.t1:
	stz.w $1DBD
	jsl.l GoalieCount
	lda.b d0
	sta.w $1DC1
.1:
	dec.w $1DC1
	lda.w $1DBD
	sta.w $1DB9
	rtl
