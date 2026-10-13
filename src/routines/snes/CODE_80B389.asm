; Unidentified routine.
CODE_80B389:		; make sure the tiles of the frame at [$0C] are in VRAM; A = its tile cache entry, negative if no room
	phx
	phy
	phb
	pea.w $7E7E
	plb
	plb
	jmp.w CODE_80B3B1
