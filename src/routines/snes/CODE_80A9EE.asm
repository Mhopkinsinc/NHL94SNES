; Unidentified routine.
CODE_80A9EE:
	cpy.b #$34
	bne CODE_80AA01
	sep #$20
	lda.b $5E
	sta.w $07EB
	jsr.w CODE_80ADE9
	rep #$20
	jmp.w CODE_80ABA5
