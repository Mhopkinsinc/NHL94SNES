; Unidentified routine.
CODE_9DDFBF:
	sta.b $00
	stx.b $04
	sty.b $08
	lda.b $00
	asl a
	asl a
	tax
	lda.l LogoPaletteTable+2,x
	sta.b $0E
	lda.l LogoPaletteTable,x
	sta.b $0C
	ldy.w #$00A0
	ldx.w #$0010
	jsl.l CODE_9DE0BD
	lda.w #$007F
	sta.b $12
	lda.w #$7800
	sta.b $10
	lda.w #$2400
	ldx.b $04
	ldy.b $08
	jsl.l DrawSprite
	rtl
