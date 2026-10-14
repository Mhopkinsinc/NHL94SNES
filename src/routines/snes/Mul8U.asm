; A * X, 8 by 8 bits, unsigned, into A
Mul8U:
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
