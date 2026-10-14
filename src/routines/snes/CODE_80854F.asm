; Unidentified routine.
CODE_80854F:
	pha
	phx
	ldx.w #$0080
	lda.w #NullHook
	jsl.l SetNMIHook
	plx
	pla
	rtl
