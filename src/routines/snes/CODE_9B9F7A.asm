; Unidentified routine.
CODE_9B9F7A:
	lda.b $81
	beq CODE_9B9F91
	cmp.w #$003C
	bcc CODE_9B9F86
	lda.w #$003C
CODE_9B9F86:
	sec
	sbc.b $C1
	bpl CODE_9B9F8E
	lda.w #$0000
CODE_9B9F8E:
	sta.b $81
	rtl
