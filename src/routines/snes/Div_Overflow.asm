; Unidentified routine.
Div_Overflow:		; quotient $7FFF
	rep #$20
	lda.w #$7FFF
	sta.b $00
	rtl
	sep #$20		; not reached
Div32U_ByteDivisor:		; $08-$0A / $04 (8-bit) with the hardware divider, high byte first
	lda.b $0A
	beq Div16x8U_Go
	cmp.b $04
	bcs Div_Overflow
	ldx.b $09
	lda.b $04
	stx.w WRDIVL
	sta.w WRDIVB
	phx
	plx
	nop
	nop
	lda.w RDDIVL
	sta.b $01
	lda.w RDMPYL
	sta.b $09
	lda.b $04
	ldx.b $08
	stx.w WRDIVL
	sta.w WRDIVB
	phx
	plx
	nop
	nop
	lda.w RDDIVL
	sta.b $00
	rep #$20
	rtl
