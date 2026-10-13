; Unidentified routine.
Div32x32U:		; $08-$0B / $04-$07 into $00-$03, remainder in $08-$0B, unsigned
	phx
	phy
	stz.b $00
	stz.b $02
	ldy.w #$0000
	lda.b $06
	bmi .loop
.norm:
	iny
	asl.b $04
	rol.b $06
	bpl .norm
.loop:
	lda.b $08
	sec
	sbc.b $04
	tax
	lda.b $0A
	sbc.b $06
	bcc .bit
	stx.b $08
	sta.b $0A
.bit:
	rol.b $00
	rol.b $02
	lsr.b $06
	ror.b $04
	dey
	bpl .loop
	ply
	plx
	rtl
