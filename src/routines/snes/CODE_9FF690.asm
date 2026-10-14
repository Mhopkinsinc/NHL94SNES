; Unidentified routine.
CODE_9FF690:
	lda.w #$4000
	sta.b $10
	lda.w #$007F
	sta.b $12
	jsr.w CODE_9FFA08
	lda.w #$0008
	tsb.b $C3
	lda.b $B9
	sta.b $B7
CODE_9FF6A6:
	jmp.w CODE_9FF898
