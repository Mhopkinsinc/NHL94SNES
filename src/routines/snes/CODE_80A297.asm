; Unidentified routine.
CODE_80A297:
	inx
	inx
	iny
	cpy.b #$08
	bne CODE_80A28B
CODE_80A29E:
	sep #$20
	inc.w SoundLock
	plp
	plb
	ply
	plx
	rtl
