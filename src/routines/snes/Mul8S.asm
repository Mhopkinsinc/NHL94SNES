; A * X, 8 by 8 bits, both signed, into A
Mul8S:
	phy
	tay
	bpl Mul8XS_x
	txa
	bpl Mul8S_swap
	eor.w #$FFFF
	inc a
	sta.w WRMPYA
	tya
	eor.w #$FFFF
	inc a
	sta.w WRMPYB
	bra Mul8U_res
