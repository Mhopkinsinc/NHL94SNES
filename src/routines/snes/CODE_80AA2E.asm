; Unidentified routine.
CODE_80AA2E:
	cpy.b #$39
	bne CODE_80AA41
	sep #$20
	lda.b $5E
	sta.w $07E8
	jsr.w CODE_80A40F
	rep #$20
	jmp.w CODE_80ABA5
