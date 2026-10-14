; convert $00 bytes of linear 4bpp tiles at [$0C] to SNES planar, in place
LinearToPlanar:
	ldx.b $00
	phb
	sep #$20
	lda.b $0E
	pha
	rep #$20
	plb
	stz.b $04
	lda.w #$FFFE
	sta.b $06
	lda.b $00
	lsr a
	lsr a
	sta.b $00
	bra .2
.1:
	txa
	lsr a
	lsr a
	lsr a
	lsr a
	beq .6
	tax
	iny
	iny
	bra .5
.2:
	ldx.w #$0080
	stz.b $14
	stz.b $16
	lda.b $04
	asl a
	asl a
	tay
.5:
	lda.b ($0C),y
	beq .1
	xba
	tay
.loop:
	tya
	asl a
	bcc .1x
	tay
	txa
	tsb.b $15
	tya
.1x:
	asl a
	bcc .2x
	tay
	txa
	tsb.b $14
	tya
.2x:
	asl a
	bcc .3
	tay
	txa
	tsb.b $17
	tya
.3:
	asl a
	bcc .4
	tay
	txa
	tsb.b $16
	tya
.4:
	tay
	txa
	lsr a
	tax
	cpx.w #$0010
	bcs .loop
	cpx.w #$0000
	beq .6
	cpx.w #$0008
	bcc .loop
	lda.b $04
	asl a
	asl a
	tay
	iny
	iny
	bra .5
.6:
	lda.b $06
	inc a
	inc a
	tay
	and.w #$0010
	beq .1xx
	tya
	clc
	adc.w #$0010
	tay
.1xx:
	sty.b $06
	lda.b $16
	sta.b ($10),y
	tya
	clc
	adc.w #$0010
	tay
	lda.b $14
	sta.b ($10),y
	inc.b $04
	dec.b $00
	bpl .2
	plb
	rtl
