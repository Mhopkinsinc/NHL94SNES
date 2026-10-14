; Unidentified routine.
CODE_9FF9F5:
	sep #$30
	sty.w CGADD
.loop:
	sta.w CGDATA
	xba
	sta.w CGDATA
	xba
	dex
	bpl .loop
	rep #$30
	rtl
