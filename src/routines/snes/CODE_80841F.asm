; Unidentified routine.
CODE_80841F:
	cmp.w #$FFFF
	bne CODE_80841A
	lda.w STAT77
	bmi CODE_80843E
	dec.w $0AD3
	bmi .1
	bne CODE_80843E
.1:
	stz.w $0AD3
	bra CODE_80843B
