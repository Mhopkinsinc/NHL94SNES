; Unidentified routine.
CODE_9EA419:
	lda.w SPA,x
	bne CODE_9EA442
	stz.w $1543,x
	stz.w $14E3,x
	rtl
