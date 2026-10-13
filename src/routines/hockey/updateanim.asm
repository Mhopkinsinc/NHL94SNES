; Unidentified routine.
updateanim:
	lda.w SPA,x
	bne CODE_9EA442
	stz.w pf2aip,x
	stz.w pfalock,x
	rtl
