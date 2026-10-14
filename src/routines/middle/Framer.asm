; Draw a frame and fill it. d0 / d1 = width / height
Framer:
	phx
	phy
	lda.l $7E35BC
	clc
	adc.l printfontset
	ora.w $0D0D
	sta.b tmp0
	lda.w #$009C
	sta.b $0E
	lda.w #DATA8_9C8080+6
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
	lda.w #DATA8_9C8080+12
	sta.b $0C
	jsr.w FramerRow
	dec.b d1
	bne .loop
	lda.w #DATA8_9C8080+18
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
