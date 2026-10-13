; Unidentified routine.
Div_8Bits:		; $09-$0A:$08 / $04 when the quotient fits in 8 bits
	stz.b $00
	rep #$20
	lda.b $09
	ldx.w #$0008
.loop:
	asl.b $07
	rol a
	bcs .sub
	cmp.b $04
	bcc .bit
.sub:
	sbc.b $04
	sec
.bit:
	rol.b $00
	dex
	bne .loop
	rtl
