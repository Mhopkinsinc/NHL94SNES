; Unidentified routine.
CODE_9C8826:
	lda.w $1DF9
	cmp.w #$0000
	beq CODE_9C8842
	jsl.l GoalieCount
	lda.b d0
	sta.w $1DBD
	jsl.l GetPlayerCount
	lda.b d0
	sta.w $1DC1
	bra CODE_9C884E
