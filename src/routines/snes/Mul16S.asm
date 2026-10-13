; Unidentified routine.
Mul16S:		; A * X into $08-$0B, both signed
	phy
	tay
	beq Mul16_Zero
	bpl Mul16XS_TestX
	eor.w #$FFFF
	inc a
	tay
	sta.b $00
	txa
	beq Mul16_Zero
	bpl Mul16XS_Neg
	eor.w #$FFFF
	inc a
	bra Mul16U_Go
