; Unidentified routine.
CODE_9D8737:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF40C
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
CODE_9D8751:
	jsl.l WaitFrame
	jsl.l SpriteFrameEnd
	rtl
