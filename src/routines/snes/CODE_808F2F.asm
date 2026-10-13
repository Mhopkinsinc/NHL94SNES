; Unidentified routine.
CODE_808F2F:
	txa
	txy
	lsr a
	bcc CODE_808F3D
	dey
	sep #$20
	lda.b [$0C],y
	sta.b [$10],y
	rep #$20
CODE_808F3D:
	dey
	dey
CODE_808F3F:
	lda.b [$0C],y
	sta.b [$10],y
	dey
	dey
	bne CODE_808F3F
	lda.b [$0C]
	sta.b [$10]
	rtl
