; Unidentified routine.
CODE_808615:
	pha
CODE_808616:
	jsl.l WaitFrame
	lda.w JoyPad
	and.w #$FFF0
	beq CODE_808625
	dex
	bne CODE_808616
CODE_808625:
	pla
	rtl
