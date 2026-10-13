; Unidentified routine.
CODE_9ECE06:
	lda.b $8D
	sec
	sbc.w #$0A2A
	sta.w $0A2A
	lda.w #$0A2A
	sta.b $8D
	rtl
