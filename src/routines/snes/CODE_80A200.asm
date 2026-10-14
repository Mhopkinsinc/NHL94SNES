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
	bne .t1
	ldy.b #$12
	lda.b ($4E),y
	sta.w $08BE
	iny
	lda.b ($4E),y
	bra .1

.t1:
	ldy.b #$17
	lda.b ($4E),y
	sta.w $08BE
.1:
	sta.w $08CF
	lda.b $65
	sta.b $5A
	ldy.b #$10
	jsr.w CODE_80A697
	and.b #$FF
	sep #$20
	inc.w SoundLock
	plp
	plb
	ply
	plx
	rtl

.t1x:
	phx
	phy
	phb
	php
	sep #$30
	dec.w SoundLock
	pha
	lda.b $50
	pha
	plb
	pla
	asl a
	tay
	rep #$20
	lda.b [$34],y
	clc
	adc.b $34
	sta.b $4E
	ldx.b #$00
	txy
.2:
	lda.w $092A,x
	cmp.b $4E
	bne .t1xx
	jsr.w CODE_80ABF7
	bra .3

.t1xx:
	inx
	inx
	iny
	cpy.b #$08
	bne .2
.3:
	sep #$20
	inc.w SoundLock
	plp
	plb
	ply
	plx
	rtl
