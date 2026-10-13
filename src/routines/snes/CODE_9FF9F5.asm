; Unidentified routine.
CODE_9FF9F5:
	sep #$30
	sty.w CGADD
CODE_9FF9FA:
	sta.w CGDATA
	xba
	sta.w CGDATA
	xba
	dex
	bpl CODE_9FF9FA
	rep #$30
	rtl
