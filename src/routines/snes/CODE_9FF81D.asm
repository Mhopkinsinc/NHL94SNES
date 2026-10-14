; Unidentified routine.
CODE_9FF81D:
	lda.w #DATA8_9AEE3C
	sta.b $0C
	lda.w #$009A
	sta.b $0E
	lda.w #$0040
	sta.b tmp0
	jsr.w CODE_9FF975
	lda.w #$0007
	sta.b d5
	lda.w #$0001
	sta.b $B7
	jmp.w CODE_9FF898
