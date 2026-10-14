; Unidentified routine.
SPCIPLUpload:		; send the stream at [$0C] through the boot loader: blocks of length, sound RAM address and data;
		;   length 0 ends it with the start address
	rep #$30
	ldy.w #$0000
	lda.w #$BBAA
.loop:
	cmp.w APUIO0
	bne .loop
	sep #$20
	lda.b #$CC
	bra .4
.1:
	lda.b [$0C],y
	iny
	xba
	lda.b #$00
	bra .3
.2:
	xba
	lda.b [$0C],y
	iny
	xba
.loopx:
	cmp.w APUIO0
	bne .loopx
	inc a
.3:
	rep #$20
	sta.w APUIO0
	sep #$20
	dex
	bne .2
.loopxx:
	cmp.w APUIO0
	bne .loopxx
.loop2:
	adc.b #$03
	beq .loop2
.4:
	pha
	rep #$20
	lda.b [$0C],y
	iny
	iny
	tax
	lda.b [$0C],y
	iny
	iny
	sta.w APUIO2
	sep #$20
	cpx.w #$0001
	lda.b #$00
	rol a
	sta.w APUIO1
	adc.b #$7F
	pla
	sta.w APUIO0
.loopxxx:
	cmp.w APUIO0
	bne .loopxxx
	bvs .1
	stz.w APUIO0
	rep #$30
	rtl
