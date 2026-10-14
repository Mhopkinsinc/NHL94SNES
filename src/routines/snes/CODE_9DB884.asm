; Unidentified routine.
CODE_9DB884:
	phx
	ldx.w $0BE9
	bne .1
	plx
.loop:
	dex
	bne .loop
	phx
.1:
	plx
	rts
