; Unidentified routine.
CODE_8085B8:
	iny
CODE_8085B9:
	jsl.l WaitFrame
	dex
	bne CODE_8085C7
	dey
	bne CODE_8085C7
	lda.w #$0000
	rtl
