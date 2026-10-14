; Set the frame hook back to the empty routine
ClearFrameHook:
	pha
	phx
	ldx.w #$0080
	lda.w #NullHook
	jsl.l SetFrameHook
	plx
	pla
	rtl
