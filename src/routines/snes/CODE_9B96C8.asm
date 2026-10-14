; Unidentified routine.
CODE_9B96C8:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF0F0
	sta.b a1
	jsl.l CODE_9EC894
	pla
	sta.b a1
	pla
	sta.b $8F
	bra CODE_9B96FE
