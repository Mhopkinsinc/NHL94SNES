; Unidentified routine.
CODE_80841F:
	cmp.w #$FFFF
	bne CODE_80841A
	lda.w STAT77
	bmi CODE_80843E
	dec.w $0AD3
	bmi CODE_808430
	bne CODE_80843E
CODE_808430:
	stz.w $0AD3
	bra CODE_80843B
