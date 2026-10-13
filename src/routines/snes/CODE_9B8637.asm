; Unidentified routine.
CODE_9B8637:
	lda.b $06
	inc a
	inc a
	tay
	and.w #$0010
	beq CODE_9B8647
	tya
	clc
	adc.w #$0010
	tay
CODE_9B8647:
	sty.b $06
	lda.b $16
	sta.b ($10),y
	tya
	clc
	adc.w #$0010
	tay
	lda.b $14
	sta.b ($10),y
	inc.b $04
	dec.b $00
	bpl CODE_9B85E8
	plb
	rtl
