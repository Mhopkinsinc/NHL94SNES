; Queue the rink map rows that the vertical scroll brought on screen
ShowRinkRows:
	lda.w sfhormode
	beq .t2
	rtl

.t2:
	lda.w Vscroll
	clc
	adc.w #$0170
	lsr a
	lsr a
	lsr a
	tax
	sec
	sbc.w Oldrow
	bne .t1
	jmp.w .4

.t1:
	bpl .2
	stx.w Oldrow
	eor.w #$FFFF
	inc a
	cmp.w #$0019
	bcs .1
	sta.b tmp1
	lda.w vramrow
	sec
	sbc.b tmp1
	and.w #$001F
	sta.w vramrow
	sta.b tmp2
	bra .3
.1:
	lda.w #$001D
	sta.b tmp1
	stz.w vramrow
	stz.b tmp2
	bra .3
.2:
	stx.w Oldrow
	cmp.w #$0019
	bcs .1
	sta.b tmp1
	adc.w vramrow
	and.w #$001F
	sta.w vramrow
	adc.w #$001D
	sec
	sbc.b tmp1
	and.w #$001F
org $9FC002
	sta.b tmp2
	txa
	clc
	adc.w #$001D
	sec
	sbc.b tmp1
	tax
.3:
	txa
	asl a
	asl a
	asl a
	asl a
	asl a
	sta.b tmp0
	asl a
	adc.b tmp0
	adc.w #$C800
	adc.w #$0006
	sta.b tmp0
	lda.b tmp2
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.w #$0400
	sta.b tmp2
	lda.b tmp1
	sta.b $04
.loop:
	lda.w #$007F
	sta.b $0E
	lda.b tmp0
	sta.b $0C
	ldy.b tmp2
	ldx.w #$0040
	jsl.l DMAToVRAM
	lda.b tmp0
	clc
	adc.w #$0040
	sta.b $0C
	lda.b tmp2
	clc
	adc.w #$0400
	tay
	ldx.w #$0020
	jsl.l DMAToVRAM
	lda.b tmp0
	clc
	adc.w #$0060
	sta.b tmp0
	lda.b tmp2
	clc
	adc.w #$0020
	and.w #$03FF
	ora.w #$0400
	sta.b tmp2
	dec.b $04
	bne .loop
.4:
	lda.w Hscroll
	clc
	adc.w #$00C0
	sta.w $07DA
	lda.w Vscroll
	and.w #$0007
	sta.b $14
	lda.w vramrow
	asl a
	asl a
	asl a
	ora.b $14
	sta.w $07DC
	rtl
