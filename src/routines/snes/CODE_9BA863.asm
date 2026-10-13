; Unidentified routine.
CODE_9BA863:
	lda.w $19CE
	bne CODE_9BA89E
	ldy.w #$0033
	ldx.w #$0000
CODE_9BA86E:
	sep #$20
	lda.w $1A13,x
	inc a
	inc a
	sta.w $1A13,x
	lda.w $1A12,x
	inc a
	inc a
	sta.w $1A12,x
	lda.w $1A15,x
	inc a
	inc a
	sta.w $1A15,x
	lda.w $1A14,x
	inc a
	inc a
	sta.w $1A14,x
	rep #$20
	txa
	clc
	adc.w #$000C
	tax
	dey
	bpl CODE_9BA86E
	inc.w $19CE
CODE_9BA89E:
	rtl
