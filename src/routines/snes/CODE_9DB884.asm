; Unidentified routine.
CODE_9DB884:
	phx
	ldx.w $0BE9
	bne CODE_9DB88F
	plx
CODE_9DB88B:
	dex
	bne CODE_9DB88B
	phx
CODE_9DB88F:
	plx
	rts
