; Unidentified routine.
CODE_808ED2:
	php
	sep #$20
	dey
CODE_808ED6:
	sta.b [$10],y
	dey
	bne CODE_808ED6
	sta.b [$10]
	plp
	rtl
