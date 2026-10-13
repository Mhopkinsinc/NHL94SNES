; Unidentified routine.
CODE_9FF992:
	ldx.w #$0000
	ldy.w #$0001
CODE_9FF998:
	lda.l $7F4000,x
	pha
	and.w #$001F
	cmp.w #$001F
	beq CODE_9FF9AC
	clc
	adc.w #$0001
	and.w #$001F
CODE_9FF9AC:
	sta.l $7F4000,x
	pla
	pha
	and.w #$03E0
	cmp.w #$03E0
	beq CODE_9FF9C1
	clc
	adc.w #$0020
	and.w #$03E0
CODE_9FF9C1:
	ora.l $7F4000,x
	sta.l $7F4000,x
	pla
	and.w #$7C00
	cmp.w #$7C00
	beq CODE_9FF9D9
	clc
	adc.w #$0400
	and.w #$7C00
CODE_9FF9D9:
	ora.l $7F4000,x
	sta.l $7F4000,x
	and.w #$7FFF
	cmp.w #$7FFF
	beq CODE_9FF9EC
	ldy.w #$0000
CODE_9FF9EC:
	inx
	inx
	cpx.w #$0020
	bmi CODE_9FF998
	tya
	rts
