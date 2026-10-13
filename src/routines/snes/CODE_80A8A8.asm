; Unidentified routine.
CODE_80A8A8:
	cpy.b #$E2
	bne CODE_80A8B5
	lda.w $0804,x
	sta.w $0826,x
	jmp.w CODE_80ABA5
