; Unidentified routine.
CODE_80AD89:
	sep #$20
	ldy.b $4B
	jsr.w CODE_80A4E3
CODE_80AD90:
	sep #$20
	inx
	inx
	iny
	cpy.b #$08
	bcs CODE_80AD9C
	jmp.w CODE_80AC7E
