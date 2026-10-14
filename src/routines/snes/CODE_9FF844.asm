; Unidentified routine.
CODE_9FF844:
	lda.w #DATA8_9AEE5C
	sta.b $0C
	lda.w #$009A
	sta.b $0E
	lda.w #$0020
	sta.b $C5
	jsr.w CODE_9FF975
	lda.w #$000C
	sta.b $B9
	lda.w #$0001
	sta.b $B7
	jmp.w CODE_9FF898
