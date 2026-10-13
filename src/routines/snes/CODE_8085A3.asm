; Unidentified routine.
CODE_8085A3:
	iny
CODE_8085A4:
	jsl.l WaitFrame
	dex
	bne CODE_8085B2
	dey
	bne CODE_8085B2
	lda.w #$0000
	rtl
