; Unidentified routine.
CODE_9EDC06:
	lda.w facedir,x
	sta.b $14
	lda.w $0BCB,x
	bne CODE_9EDC32
	lda.b $A5
	sec
	sbc.b $14
	beq CODE_9EDC32
	eor.w #$FFFF
	inc a
	and.w #$0004
	lsr a
	dec a
	sta.b $A5
	clc
	adc.b $14
	and.w #$0007
	sta.w facedir,x
	lda.w #$0006
	sta.w $0BCB,x
	rtl
