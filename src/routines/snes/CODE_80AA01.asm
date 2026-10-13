; Unidentified routine.
CODE_80AA01:
	cpy.b #$35
	bne CODE_80AA14
	sep #$20
	lda.b $5E
	sta.w $07EC
	jsr.w CODE_80ADE9
	rep #$20
	jmp.w CODE_80ABA5
