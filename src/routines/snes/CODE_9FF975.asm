; Unidentified routine.
CODE_9FF975:
	lda.w #$4000
	sta.b $10
	lda.w #$007F
	sta.b $12
	jsr.w CODE_9FFA08
	lda.w #$0010
	sta.b $C7
	lda.w #$4000
	sta.b $C9
	lda.w #$007F
	sta.b $CB
	rts
