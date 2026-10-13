; Unidentified routine.
CODE_80C3A0:
	cmp.w #$FB46
	bne CODE_80C3AA
	jsr.w DecompressPairs
	bra CODE_80C3C5
