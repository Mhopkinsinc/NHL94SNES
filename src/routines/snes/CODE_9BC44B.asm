; Unidentified routine.
CODE_9BC44B:
	lda.w $1DC1
	cmp.w #$0001
	bne CODE_9BC473
CODE_9BC453:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF1EF
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	jsl.l CODE_9FBF75
	bra CODE_9BC499
