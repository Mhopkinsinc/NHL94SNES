; Unidentified routine.
CODE_9EF78A:
	stz.b $8D
	lda.w #$0002
	sta.b $91
	jsl.l ClearOffsidesIfAllPlayers
	stz.b $91
	lda.w #$0002
	sta.b $8D
	jsl.l ClearOffsidesIfAllPlayers
	lda.w #$0054
	sta.b $A5
	lda.w pucky
	bpl CODE_9EF7AD
	jmp.w $F833
