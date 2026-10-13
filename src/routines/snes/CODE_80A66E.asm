; Unidentified routine.
CODE_80A66E:
	stx.b $4B
	sta.w $07FD
	rep #$20
	lda.w $096A,y
	sta.w $07FB
CODE_80A67B:
	sep #$20
	inx
	txa
	and.b #$07
	tax
	dey
	dey
	dec.b $68
	bne CODE_80A643
	ldx.b $4B
	txy
	jmp.w CODE_80A44A
