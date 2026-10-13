; Unidentified routine.
CODE_9BAC3E:
	cmp.w #$FFFF
	beq CODE_9BACC1
	lda.w $0D75
	cmp.w $0CBD
	bpl CODE_9BAC5C
	lda.w $0CBD
	sec
	sbc.w #$0002
	cmp.w $0D75
	bpl CODE_9BAC5A
	lda.w $0D75
CODE_9BAC5A:
	bra CODE_9BAC6B
