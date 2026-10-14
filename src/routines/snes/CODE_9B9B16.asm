; Unidentified routine.
CODE_9B9B16:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF15D
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
CODE_9B9B30:
	jsl.l CODE_9FBF75
	rtl
