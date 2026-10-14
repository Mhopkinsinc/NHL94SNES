; Framer with a nine-tile box (DATA8_9C81D8: eight border tiles and a centre tile, no flips) from tile set $7E35BE
FramerNineTile:
	phx
	phy
	lda.l $7E35BE
	clc
	adc.l printfontset
	sta.b tmp0
	lda.w #$009C
	sta.b $0E
	lda.w #DATA8_9C81D8+6
	sta.b $0C
	jsr.w FramerRow
	lda.b tmp2
	lsr a
	cmp.w textdirtylo
	bcs .1
	sta.w textdirtylo
.1:
	dec.b d1
	dec.b d1
.loop:
	lda.w #DATA8_9C81D8+12
	sta.b $0C
	jsr.w FramerRow
	dec.b d1
	bne .loop
	lda.w #DATA8_9C81D8+18
	sta.b $0C
	jsr.w FramerRow
	inx
	inx
	txa
	lsr a
	cmp.w textdirtyhi
	bcc .2
	sta.w textdirtyhi
.2:
	ply
	plx
	rtl
