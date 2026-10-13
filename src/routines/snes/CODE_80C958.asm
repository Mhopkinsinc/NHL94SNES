; Unidentified routine.
CODE_80C958:
	lda.w $178E
	sec
	sbc.w $1790
	bne CODE_80C964
	jmp.w CODE_80CA05
