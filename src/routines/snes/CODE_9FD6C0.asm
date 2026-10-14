; Unidentified routine.
CODE_9FD6C0:
	jsl.l GetPlayerCount
	lda.b d0
	sta.b d3
CODE_9FD6C8:
	lda.b d3
	sta.b d0
	dec.b d3
	bmi CODE_9FD6B8
	jsl.l TryAddPlayerToList
	beq CODE_9FD6C8
	bra CODE_9FD6B8
