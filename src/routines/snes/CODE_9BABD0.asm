; Unidentified routine.
CODE_9BABD0:
	lda.w $0CBD
	clc
	adc.w #$0004
	cmp.w $0D75
	bmi CODE_9BABDF
	lda.w $0D75
CODE_9BABDF:
	cmp.w #$FFC0
	bpl CODE_9BABE7
	lda.w #$FFC0
CODE_9BABE7:
	cmp.w #$0040
	bmi CODE_9BABEF
	lda.w #$0040
CODE_9BABEF:
	sta.w Hpos
	sta.w $0CBD
	lda.w Ypos,x
	sta.w $0DD7
	cmp.w $0CBF
	bpl CODE_9BAC11
	lda.w $0CBF
	sec
	sbc.w #$0004
	cmp.w $0DD7
	bpl CODE_9BAC0F
CODE_9BAC0C:
	lda.w $0DD7
CODE_9BAC0F:
	bra CODE_9BAC20
