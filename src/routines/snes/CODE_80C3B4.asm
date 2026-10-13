; Unidentified routine.
CODE_80C3B4:
	cmp.w #$FB7A
	bne CODE_80C3BE
	jsr.w DecompressRLE
	bra CODE_80C3C5
