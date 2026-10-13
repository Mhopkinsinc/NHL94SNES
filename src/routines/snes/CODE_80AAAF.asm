; Unidentified routine.
CODE_80AAAF:
	rep #$20
	plx
	lda.w $095A,x
	sta.b $5A
	bra CODE_80AAF3
