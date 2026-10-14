; Unidentified routine.
CODE_9EA419:
	lda.w SPA,x
	bne CODE_9EA442
	stz.w $1543,x
	stz.w pfalock,x
	rtl
