; $08-$0B / $04-$07 into $00-$03, remainder in $08-$0B, unsigned
Div32x32U:
	phx
	phy
	stz.b r0
	stz.b r0+2
	ldy.w #$0000
	lda.b r1+2
	bmi .loop
.norm:
	iny
	asl.b r1
	rol.b r1+2
	bpl .norm
.loop:
	lda.b r2
	sec
	sbc.b r1
	tax
	lda.b r2+2
	sbc.b r1+2
	bcc .bit
	stx.b r2
	sta.b r2+2
.bit:
	rol.b r0
	rol.b r0+2
	lsr.b r1+2
	ror.b r1
	dey
	bpl .loop
	ply
	plx
	rtl
