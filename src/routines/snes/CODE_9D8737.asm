; Unidentified routine.
CODE_9D8737:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF40C
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
CODE_9D8751:
	jsl.l WaitFrame
	jsl.l SpriteFrameEnd
	rtl
