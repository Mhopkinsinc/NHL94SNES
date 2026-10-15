; X (16 bits) * A (8 bits) into $08-$0A, X signed
Mul16x8XS:
	phy
	tay
	beq Mul16x8_Zero
Mul16x8XS_neg:
	txa
	beq Mul16x8_Zero
	bpl Mul16x8U_go
	eor.w #$FFFF
	inc a
Mul16x8XS_mul:
	jsl.l Mul16x8U_Pre
Mul16x8XS_negres:
	lda.w #$0000
	sec
	sbc.b r2
	sta.b r2
	lda.w #$0000
	sbc.b r2+2
	sta.b r2+2
	ply
	rtl
