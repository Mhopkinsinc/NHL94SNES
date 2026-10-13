; Unidentified routine.
CODE_80B07E:		; DrawSprite with the frame at [$0C]
	sta.b $14
	stx.b $1C
	sty.b $1E
	phb
	pea.w $7E7E
	plb
	plb
	jmp.w CODE_80B0B0
