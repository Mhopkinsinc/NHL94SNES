; A * X, 8 by 8 bits, unsigned, into A
Mul8U:
	phy
Mul8U_mul:
	sep #$30
	sta.w WRMPYA
	stx.w WRMPYB
	rep #$30
Mul8U_res:
	nop
	lda.w RDMPYL
	ply
	rtl
