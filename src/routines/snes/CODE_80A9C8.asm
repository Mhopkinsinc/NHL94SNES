; Unidentified routine.
CODE_80A9C8:
	cpy.b #$32
	bne CODE_80A9DB
	sep #$20
	lda.b $5E
	sta.w $07E7
	jsr.w CODE_80ADE9
	rep #$20
	jmp.w CODE_80ABA5
