; Unidentified routine.
CODE_808569:
	pha
	phx
	ldx.w #$0080
	lda.w #NullHook
	jsl.l CODE_808578
	plx
	pla
	rtl
