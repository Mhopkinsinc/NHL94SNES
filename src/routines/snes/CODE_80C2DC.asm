; Unidentified routine.
CODE_80C2DC:
	asl a
	dex
	dex
	beq .t1
	dey
	bne CODE_80C2DC
	rts

.t1:
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
	ldx.b #$10
	dey
	bne CODE_80C2DC
	rts
