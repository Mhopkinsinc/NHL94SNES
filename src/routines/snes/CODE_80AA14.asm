; Unidentified routine.
CODE_80AA14:
	cpy.b #$37
	bne CODE_80AA27
	sep #$20
	lda.b $5E
	sta.w $07F8
	jsr.w CODE_80A40F
	rep #$20
	jmp.w CODE_80ABA5
