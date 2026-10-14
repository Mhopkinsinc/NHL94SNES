; Unidentified routine.
CODE_808F2F:
	txa
	txy
	lsr a
	bcc .1
	dey
	sep #$20
	lda.b [$0C],y
	sta.b [$10],y
	rep #$20
.1:
	dey
	dey
.loop:
	lda.b [$0C],y
	sta.b [$10],y
	dey
	dey
	bne .loop
	lda.b [$0C]
	sta.b [$10]
	rtl
