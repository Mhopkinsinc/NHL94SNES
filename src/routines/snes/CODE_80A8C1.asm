; Unidentified routine.
CODE_80A8C1:
	cpy.b #$DD
	bne CODE_80A8CD
CODE_80A8C5:
	ldy.b $5A
	sty.w $07F6
	jmp.w CODE_80ABA5
