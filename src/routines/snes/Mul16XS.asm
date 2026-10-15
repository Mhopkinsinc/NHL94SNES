; A * X into $08-$0B, X signed
Mul16XS:
	phy
	tay
	beq Mul16_Zero
Mul16XS_TestX:
	sta.b r0
	txa
	beq Mul16_Zero
	bpl Mul16U_Go
	eor.w #$FFFF
	inc a
Mul16XS_Neg:
	jsl.l Mul16U_Pre
	jmp.w Mul16x8XS_negres
