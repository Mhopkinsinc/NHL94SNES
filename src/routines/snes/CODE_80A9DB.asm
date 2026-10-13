; Unidentified routine.
CODE_80A9DB:
	cpy.b #$33
	bne CODE_80A9EE
	sep #$20
	lda.b $5E
	sta.w $07EA
	jsr.w CODE_80ADE9
	rep #$20
	jmp.w CODE_80ABA5
