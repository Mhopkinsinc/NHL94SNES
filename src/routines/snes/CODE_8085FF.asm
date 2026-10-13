; Unidentified routine.
CODE_8085FF:
	pha
CODE_808600:
	lda.w JoyPad
	and.w #$FFF0
	bne CODE_808600
	pla
	rtl
