; Unidentified routine.
Mul16x8HiXS:		; X * A (low byte) / 256 into A and $09, X signed
	phy
	tay
	beq Mul16x8Hi_Zero
Mul16x8HiXS_TestX:
	txa
	beq Mul16x8Hi_Zero
	bpl Mul16x8HiU_Go
	eor.w #$FFFF
	inc a
Mul16x8HiXS_Neg:
	jsl.l Mul16x8HiU_Pre
	eor.w #$FFFF
	inc a
	sta.b $09
	ply
	rtl
