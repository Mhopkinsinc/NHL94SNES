; Unidentified routine.
CODE_80A9B6:
	cpy.b #$0C
	bne CODE_80A9C8
	sep #$20
	ldx.b $4A
	lda.b $5E
	sta.w $08BF,x
	rep #$20
	jmp.w CODE_80ABA5
