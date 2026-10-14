; X * A (low byte) / 256 into A and $09, unsigned
Mul16x8HiU:
	phy
	tay
	beq Mul16x8Hi_Zero
	txa
	beq Mul16x8Hi_Zero
Mul16x8HiU_Go:
	sep #$20
	sta.w WRMPYA
	sty.w WRMPYB
	stz.b $0A
	xba
	sta.w WRMPYA
	lda.w RDMPYH
	sta.b $09
	sty.w WRMPYB
	rep #$20
	lda.b $09
	clc
	adc.w RDMPYL
	sta.b $09
	ply
	rtl
