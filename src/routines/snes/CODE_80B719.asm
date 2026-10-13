; Unidentified routine.
CODE_80B719:		; free the VRAM tiles of the frame at [$0C]
	phx
	phy
	phb
	pea.w $7E7E
	plb
	plb
	jmp.w CODE_80B741
