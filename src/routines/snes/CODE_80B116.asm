; Unidentified routine.
CODE_80B116:
	sta.b $26
	lda.w $07C8
	clc
	adc.b $1C
	cmp.w #$0100
	bpl CODE_80B19B
	cmp.w #$FFF0
	bmi CODE_80B19B
	sta.b $20
	sta.w $0000,x
	lda.b $26
	sta.w $0001,x
	lda.w $07CC
	clc
	adc.b $16
	eor.b $14
	sta.w $0002,x
	ldy.w OAMHiPtr
	ldx.w OAMHiShift
	sep #$20
	lda.b $21
	bpl CODE_80B161
	lda.w $07CE
	beq CODE_80B156
	lda.w $0000,y
	ora.w $E688,x
	bra CODE_80B177
