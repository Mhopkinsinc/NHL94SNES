; $09-$0A:$08 / $04 when the quotient fits in 8 bits
Div_8Bits:
	stz.b r0
	rep #$20
	lda.b r2+1
	ldx.w #$0008
.loop:
	asl.b r1+3
	rol a
	bcs .sub
	cmp.b r1
	bcc .bit
.sub:
	sbc.b r1
	sec
.bit:
	rol.b r0
	dex
	bne .loop
	rtl
