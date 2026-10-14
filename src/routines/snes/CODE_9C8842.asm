; Unidentified routine.
CODE_9C8842:
	stz.w $1DBD
	jsl.l GoalieCount
	lda.b d0
	sta.w $1DC1
CODE_9C884E:
	dec.w $1DC1
	lda.w $1DBD
	sta.w $1DB9
	rtl
