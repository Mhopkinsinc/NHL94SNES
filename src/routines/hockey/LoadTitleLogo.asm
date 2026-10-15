; Draw the centre ice logo of team A (CenterIceTable) into the mode 7 map of the title
LoadTitleLogo:
	pha
	lda.w #$007F
	sta.b $0E
	lda.w #$4000
	sta.b $0C
	lda.w #$0000
	sta.w MapVRAM
	ldx.w #$003C
	ldy.w #$003C
	jsl.l Mode7MapToVRAM
	pla
	asl a
	asl a
	asl a
	tax
	phx
	lda.l CenterIceTable+4,x
	sta.b $0C
	lda.l CenterIceTable+6,x
	sta.b $0E
	jsr.w .t3
	txa
	lsr a
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0042
	tax
	tya
	lsr a
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0040
	tay
	lda.w #$007F
	sta.b $0E
	lda.w #$A000
	sta.b $0C
	lda.w #$0000
	sta.w MapVRAM
	jsl.l Mode7MapToVRAM
	plx
	lda.l CenterIceTable,x
	sta.b $0C
	lda.l CenterIceTable+2,x
	sta.b $0E
	lda.w #$007F
	sta.b $12
	lda.w #$0000
	sta.b $10
	jsl.l Decompress
	lda.w #$007F
	sta.b $0E
	lda.w #$0000
	sta.b $0C
	jsr.w .t2
	lda.w #$007F
	sta.b $0E
	lda.w #$A000
	sta.b $0C
	ldy.w #$0000
	jsl.l DMAToVRAMHigh
	rts

.t2:
	phx
	txa
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	inc a
	tax
	phx
	ldx.w #$0000
	lda.w #$0000
.loop:
	sta.l titlelogobuf,x
	inx
	inx
	cpx.w #$0040
	bcc .loop
	plx
	stz.w LogoSrcOfs
	lda.w #$0040
	sta.w LogoDstOfs
.loop2:
	phx
	jsr.w .t1
	lda.w LogoSrcOfs
	clc
	adc.w #$0020
	sta.w LogoSrcOfs
	lda.w LogoDstOfs
	clc
	adc.w #$0040
	sta.w LogoDstOfs
	plx
	dex
	bne .loop2
	pla
	asl a
	clc
	adc.w #$0040
	tax
	rts

.t1:
	stz.b $A7
	ldx.w LogoDstOfs
	ldy.w LogoSrcOfs
	sep #$20
.loopx:
	lda.b [$0C],y
	sta.b d0
	and.b #$0F
	ora.w LogoPalBits
	sta.l titlelogobuf+1,x
	lda.b d0
	lsr a
	lsr a
	lsr a
	lsr a
	and.b #$0F
	ora.w LogoPalBits
	sta.l titlelogobuf,x
	inx
	inx
	iny
	inc.b $A7
	lda.b $A7
	cmp.b #$20
	bcc .loopx
	rep #$20
	rts

.t3:
	lda.w #$0060
	sta.w LogoPalBits
	ldx.w #$0000
	ldy.w #$0000
	lda.b [$0C],y
	sta.b d0
	sta.l titlelogobuf,x
	ldx.w #$0002
	ldy.w #$0002
	lda.b [$0C],y
	sta.b $A7
	sta.l titlelogobuf,x
	ldx.w #$0004
	lda.w #$0010
	sta.l titlelogobuf,x
	lda.b d0
	ldx.b $A7
	jsl.l Mul8U
	clc
	adc.w #$0006
	sta.b d1
	ldx.w #$0006
	ldy.w #$0006
	sep #$20
.loopx2:
	lda.b [$0C],y
	inc a
	sta.l titlelogobuf,x
	iny
	cmp.b #$00
	beq .1
	lda.b [$0C],y
	bit.b #$1C
	beq .1
	lda.b #$70
	sta.w LogoPalBits
.1:
	iny
	inx
	cpx.b d1
	bcc .loopx2
	rep #$20
	ldx.b d0
	ldy.b $A7
	rts
