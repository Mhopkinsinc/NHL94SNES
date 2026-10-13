; Unidentified routine.
CODE_808EDF:
	txy
	dey
	dey
CODE_808EE2:
	sta.b [$10],y
	dey
	dey
	bne CODE_808EE2
	sta.b [$10]
	rtl
