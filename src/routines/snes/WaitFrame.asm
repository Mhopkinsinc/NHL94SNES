; Unidentified routine.
WaitFrame:
	pha
	lda.w $0764
.loop:
	cmp.w $0764
	beq .loop
	pla
	rtl
