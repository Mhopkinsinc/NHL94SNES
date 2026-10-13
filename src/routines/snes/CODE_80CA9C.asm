; Unidentified routine.
CODE_80CA9C:
	ldy.b $91
	bne CODE_80CAA9
	sep #$20
	lda.w homeshooters
	rep #$20
	bra CODE_80CAB0
