; Unidentified routine.
CODE_9BA89F:
	lda.w $19CE
	beq .rtl
	ldy.w #$0033
	ldx.w #$0000
.loop:
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
	bpl .loop
	dec.w $19CE
.rtl:
	rtl
