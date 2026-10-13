; Unidentified routine.
CODE_9FD6C0:
	jsl.l GetPlayerCount
	lda.b $A5
	sta.b $B1
CODE_9FD6C8:
	lda.b $B1
	sta.b $A5
	dec.b $B1
	bmi CODE_9FD6B8
	jsl.l TryAddPlayerToList
	beq CODE_9FD6C8
	bra CODE_9FD6B8
