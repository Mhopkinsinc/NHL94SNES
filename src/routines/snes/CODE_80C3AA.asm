; Unidentified routine.
CODE_80C3AA:
	cmp.w #$FB30
	bne CODE_80C3B4
	jsr.w DecompressHuffman
	bra CODE_80C3C5
