; Framer with an outline box (DATA8_9C8310: eight border tiles, the set's base tile in the middle) from tile set $7E35C0
FramerOutline:
	phx
	phy
	lda.l $7E35C0
	clc
	adc.l printfontset
	sta.b tmp0
	lda.w #$009C
	sta.b $0E
	lda.w #DATA8_9C8310+6
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
	lda.w #DATA8_9C8310+12
	sta.b $0C
	jsr.w FramerRow
	dec.b d1
	bne .loop
	lda.w #DATA8_9C8310+18
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
