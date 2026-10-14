; Wait until the active controller's buttons are up.
WaitButtonRelease:
	phx
	pha
	ldx.w $0AC6
.loop:
	lda.w JoyPad,x
	bne .loop
	pla
	plx
	rtl
