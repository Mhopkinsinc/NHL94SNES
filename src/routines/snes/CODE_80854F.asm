; Unidentified routine.
CODE_80854F:
	pha
	phx
	ldx.w #$0080
	lda.w #NullHook
	jsl.l CODE_80855E
	plx
	pla
	rtl
