; Unidentified routine.
CODE_9DCC36:
	stx.b a2
	lda.w HomeTeam,x
	cmp.l $7E346C,x
	bne CODE_9DCC42
	rtl
