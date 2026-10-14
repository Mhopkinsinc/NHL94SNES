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
	lda.w #$8086
	sta.b $0C
	jsr.w CODE_9D804F
	lda.b tmp2
	lsr a
	cmp.w textdirtylo
	bcs .1
	sta.w textdirtylo
.1:
	dec.b d1
	dec.b d1
.loop:
	lda.w #$808C
	sta.b $0C
	jsr.w CODE_9D804F
	dec.b d1
	bne .loop
	lda.w #$8092
	sta.b $0C
	jsr.w CODE_9D804F
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
