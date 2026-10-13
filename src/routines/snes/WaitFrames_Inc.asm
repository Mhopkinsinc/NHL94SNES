; Unidentified routine.
WaitFrames_Inc:
	iny

WaitFrames:
	jsl.l WaitFrame
	dex
	bne WaitFrames
	dey
	bne WaitFrames
	rtl
