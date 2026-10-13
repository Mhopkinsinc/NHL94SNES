; Unidentified routine.
CODE_808F19:
	sta.b $14
	txy
	dey
	dey
CODE_808F1E:
	lda.b [$10],y
	and.b $14
	sta.b [$10],y
	dey
	dey
	bne CODE_808F1E
	lda.b [$10]
	and.b $14
	sta.b [$10]
	rtl
