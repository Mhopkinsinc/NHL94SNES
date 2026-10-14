; Unidentified routine.
CODE_9EF78A:
	stz.b a1
	lda.w #$0002
	sta.b a2
	jsl.l ClearOffsidesIfAllPlayers
	stz.b a2
	lda.w #$0002
	sta.b a1
	jsl.l ClearOffsidesIfAllPlayers
	lda.w #$0054
	sta.b d0
	lda.w pucky
	bpl CODE_9EF7AD
	jmp.w CODE_9EF833
