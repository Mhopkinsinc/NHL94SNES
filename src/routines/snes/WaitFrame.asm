; Unidentified routine.
WaitFrame:
	pha
	lda.w $0764
CODE_808587:
	cmp.w $0764
	beq CODE_808587
	pla
	rtl
