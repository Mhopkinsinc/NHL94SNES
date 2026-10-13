; Unidentified routine.
CODE_80A9A4:
	cpy.b #$0B
	bne CODE_80A9B6
	sep #$20
	ldx.b $4A
	lda.b $5E
	sta.w $08AE,x
	rep #$20
	jmp.w CODE_80ABA5
