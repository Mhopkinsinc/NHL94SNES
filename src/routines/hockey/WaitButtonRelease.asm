; Wait until the active controller's buttons are up.
WaitButtonRelease:
	phx
	pha
	ldx.w pausepad
.loop:
	lda.w JoyPad,x
	bne .loop
	pla
	plx
	rtl
