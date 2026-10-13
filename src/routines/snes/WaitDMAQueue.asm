; Unidentified routine.
WaitDMAQueue:
	pha
CODE_80859B:
	lda.b $3A
	cmp.b $3C
	bne CODE_80859B
	pla
	rtl
