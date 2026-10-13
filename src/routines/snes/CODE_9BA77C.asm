; Unidentified routine.
CODE_9BA77C:
	sec
	sbc.w #$0032
	bpl CODE_9BA785
	lda.w #$0000
CODE_9BA785:
	lsr a
	lsr a
	sta.b $04
	cmp.w #$0013
	bmi CODE_9BA79F
CODE_9BA78E:
	lda.w #$0000
	sta.b $04
	lda.w #$009A
	sta.b $0E
	lda.w #DATA8_9ADFCB
	sta.b $0C
	bra CODE_9BA7A9
