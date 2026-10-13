; Unidentified routine.
CODE_8085CD:
	sta.b $14
	iny
CODE_8085D0:
	jsl.l WaitFrame
	dex
	bne CODE_8085DE
	dey
	bne CODE_8085DE
	lda.w #$0000
	rtl
