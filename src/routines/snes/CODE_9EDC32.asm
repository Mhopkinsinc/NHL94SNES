; Unidentified routine.
CODE_9EDC32:
	lda.w $0BCB,x
	beq CODE_9EDC43
	sec
	sbc.w $0ADB
	bpl CODE_9EDC40
	lda.w #$0000
CODE_9EDC40:
	sta.w $0BCB,x
CODE_9EDC43:
	rtl
