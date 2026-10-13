; Unidentified routine.
CODE_9FFAB4:
	sep #$20
	lda.b #$03
	sta.w OBSEL
	lda.b #$80
	sta.w VMAIN
	ldy.w #$0000
	lda.b [$0C],y
	sta.w BGMODE
	iny
	lda.b [$0C],y
	sta.w M7SEL
	iny
	lda.b [$0C],y
	sta.w TM
	iny
	lda.b [$0C],y
	sta.w TS
	iny
	iny
	lda.b [$0C],y
	iny
	ora.b [$0C],y
	sta.w BG1SC
	iny
	iny
	lda.b [$0C],y
	iny
	ora.b [$0C],y
	sta.w BG2SC
	iny
	iny
	lda.b [$0C],y
	iny
	ora.b [$0C],y
	sta.w BG3SC
	iny
	iny
	lda.b [$0C],y
	iny
	ora.b [$0C],y
	sta.w BG4SC
	iny
	iny
	lda.b [$0C],y
	lsr a
	lsr a
	lsr a
	lsr a
	iny
	iny
	ora.b [$0C],y
	sta.w BG12NBA
	iny
	iny
	lda.b [$0C],y
	lsr a
	lsr a
	lsr a
	lsr a
	iny
	iny
	ora.b [$0C],y
	sta.w BG34NBA
	rep #$20
	rtl
	db $00
	padbyte $FF
	pad $A08000
