; Unidentified routine.
CODE_80A200:
	phx
	phy
	phb
	php
	sep #$30
	pha
	dec.w SoundLock
	lda.b $50
	pha
	plb
	pla
	ldx.b #$10
	stx.b $4A
	ldx.b #$20
	stx.w $07FF
	asl a
	tay
	rep #$20
	lda.b [$34],y
	clc
	adc.b $34
	sta.b $4E
	sta.w $086A,x
CODE_80A226:
	ldy.b #$06
	lda.b ($4E),y
	sta.b $5E
	sep #$20
	ldy.b #$05
	lda.b ($4E),y
	sta.b $60
	ldy.b #$2F
	lda.b ($4E),y
	sta.w $089D,x
	stz.w $088C,x
	lda.w $07E3
	bne CODE_80A24F
	ldy.b #$12
	lda.b ($4E),y
	sta.w $08BE
	iny
	lda.b ($4E),y
	bra CODE_80A256
