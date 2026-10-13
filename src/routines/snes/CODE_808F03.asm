; Unidentified routine.
CODE_808F03:
	sta.b $14
	txy
	dey
	dey
CODE_808F08:
	lda.b [$10],y
	ora.b $14
	sta.b [$10],y
	dey
	dey
	bne CODE_808F08
	lda.b [$10]
	ora.b $14
	sta.b [$10]
	rtl
