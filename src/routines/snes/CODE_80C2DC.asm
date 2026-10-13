; Unidentified routine.
CODE_80C2DC:
	asl a
	dex
	dex
	beq CODE_80C2E5
	dey
	bne CODE_80C2DC
	rts
