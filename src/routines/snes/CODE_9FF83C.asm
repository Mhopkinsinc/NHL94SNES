; Unidentified routine.
CODE_9FF83C:
	lda.w #$0008
	sta.b $B7
	jmp.w CODE_9FF898

.t1:
	lda.w #DATA8_9AEE5C
	sta.b $0C
	lda.w #$009A
	sta.b $0E
	lda.w #$0020
	sta.b tmp0
	jsr.w CODE_9FF975
	lda.w #$000C
	sta.b d5
	lda.w #$0001
	sta.b $B7
	jmp.w CODE_9FF898
