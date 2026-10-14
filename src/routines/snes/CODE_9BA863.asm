; Unidentified routine.
CODE_9BA863:
	lda.w $19CE
	bne .rtl
	ldy.w #$0033
	ldx.w #$0000
.loop:
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
	bpl .loop
	inc.w $19CE
.rtl:
	rtl
