; Unidentified routine.
CODE_8085E6:
	sta.b $14
	iny
CODE_8085E9:
	jsl.l WaitFrame
	dex
	bne CODE_8085F7
	dey
	bne CODE_8085F7
	lda.w #$0000
	rtl
