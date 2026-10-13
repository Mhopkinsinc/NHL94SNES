; Unidentified routine.
CODE_9BAC5C:
	lda.w $0CBD
	clc
	adc.w #$0002
	cmp.w $0D75
	bmi CODE_9BAC6B
	lda.w $0D75
CODE_9BAC6B:
	cmp.w #$FFC0
	bpl CODE_9BAC73
	lda.w #$FFC0
CODE_9BAC73:
	cmp.w #$0040
	bmi CODE_9BAC7B
	lda.w #$0040
CODE_9BAC7B:
	sta.w $0CEB
	sta.w $0CBD
	lda.w $0DD7
	cmp.w $0CBF
	bpl CODE_9BAC9A
	lda.w $0CBF
	sec
	sbc.w #$0002
	cmp.w $0DD7
	bpl CODE_9BAC98
	lda.w $0DD7
CODE_9BAC98:
	bra CODE_9BACA9
