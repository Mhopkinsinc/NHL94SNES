; Unidentified routine.
CODE_808F4C:
	phy
CODE_808F4D:
	sep #$30
	sta.w WRMPYA
	stx.w WRMPYB
	rep #$30
CODE_808F57:
	nop
	lda.w RDMPYL
	ply
	rtl
