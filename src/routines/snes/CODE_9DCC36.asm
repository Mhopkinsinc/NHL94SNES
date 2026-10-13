; Unidentified routine.
CODE_9DCC36:
	stx.b $91
	lda.w HomeTeam,x
	cmp.l $7E346C,x
	bne CODE_9DCC42
	rtl
