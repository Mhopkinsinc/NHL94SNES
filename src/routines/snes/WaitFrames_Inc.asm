; Wait X frames, Y counting the rounds of 65536 (the _Inc entry adds 1 to Y first)
WaitFrames_Inc:
	iny

WaitFrames:
	jsl.l WaitFrame
	dex
	bne WaitFrames
	dey
	bne WaitFrames
	rtl
