; Unidentified routine.
CODE_80A881:
	lda.w $0804,x
	sta.b $4C
CODE_80A886:
	jsr.w CODE_80A58E
	lda.b $56
	sta.b $4C
	ldx.w $07FF
	ldy.b $60
	cpy.b #$D9
	bcs CODE_80A899
	jmp.w CODE_80AB63
