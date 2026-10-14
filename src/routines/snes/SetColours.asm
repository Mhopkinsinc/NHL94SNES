; Copy X colours from [$0C] into the colour buffer at colour Y
SetColours:		; copy X colours from [$0C] into the colour buffer $7F7500, from colour Y
	stx.b $16
	tya
	asl a
	tax
	ldy.w #$0000
.loop:
	lda.b [$0C],y
	sta.l $7F7500,x
	iny
	iny
	inx
	inx
	dec.b $16
	bne .loop
	rtl
