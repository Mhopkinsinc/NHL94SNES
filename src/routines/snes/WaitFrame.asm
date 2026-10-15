; Wait for the next frame ($0764 changes)
WaitFrame:
	pha
	lda.w FrameCount
.loop:
	cmp.w FrameCount
	beq .loop
	pla
	rtl
