; $08 / $04 (8-bit) into $00 with the hardware divider; $7FFF when $04 is 0
Div16x8U:
	sep #$20
Div16x8U_Go:
	lda.b r1
	beq Div_Overflow
	ldx.b r2
	stx.w WRDIVL
	sta.w WRDIVB
	rep #$20
	phx
	plx
	nop
	lda.w RDDIVL
	sta.b r0
	rtl
