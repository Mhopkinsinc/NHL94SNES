; $08-$0B / $04 into $00, unsigned; $7FFF when the quotient does not fit
Div32U:
	sep #$20
	lda.b $0B
	beq .hi0
	cmp.b $05
	bcc .go
	jmp.w Div_Overflow
.go:
	rep #$20
	lda.b $0A
	ldx.w #$0010
.loop:
	asl.b $08
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
	sep #$20		; not reached
.hi0:
	lda.b $05
	beq Div32U_ByteDivisor
	lda.b $0A
	beq Div16U_Go
	cmp.b $05
	bcc Div_8Bits
	rep #$20
	lda.b $0A
	and.w #$00FF
	ldx.w #$0010
.loop2:
	asl.b $08
	rol a
	bcs .sub2
	cmp.b $04
	bcc .bit2
.sub2:
	sbc.b $04
	sec
.bit2:
	rol.b $00
	dex
	bne .loop2
	rtl
