; Unidentified routine.
CODE_9BA89F:
	lda.w $19CE
	beq CODE_9BA8DA
	ldy.w #$0033
	ldx.w #$0000
CODE_9BA8AA:
	sep #$20
	lda.w $1A13,x
	dec a
	dec a
	sta.w $1A13,x
	lda.w $1A12,x
	dec a
	dec a
	sta.w $1A12,x
	lda.w $1A15,x
	dec a
	dec a
	sta.w $1A15,x
	lda.w $1A14,x
	dec a
	dec a
	sta.w $1A14,x
	rep #$20
	txa
	clc
	adc.w #$000C
	tax
	dey
	bpl CODE_9BA8AA
	dec.w $19CE
CODE_9BA8DA:
	rtl
