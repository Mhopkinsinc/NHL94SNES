; send the 256 colours of the colour buffer with DMAToCGRAM
SendColours:		; send the 256 colours of the colour buffer with DMAToCGRAM
	lda.w #$007F
	sta.b $0E
	lda.w #$7500
	sta.b $0C
	ldy.w #$0000
	ldx.w #$0100
	jsl.l DMAToCGRAM
	rtl
