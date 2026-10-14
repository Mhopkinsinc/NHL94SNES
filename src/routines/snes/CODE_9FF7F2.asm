; Unidentified routine.
CODE_9FF7F2:
	lda.w #DATA8_9AEE1C
	sta.b $0C
	lda.w #$009A
	sta.b $0E
	lda.w #$0030
	sta.b tmp0
	jsr.w CODE_9FF975
	lda.w #$0005
	sta.b d5
	lda.w #$0001
	sta.b $B7
	jmp.w CODE_9FF898
