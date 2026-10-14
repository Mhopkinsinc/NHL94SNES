; Send rows 1-12 of the text map to video memory
SendTextMapRows:
	lda.w #$007E
	sta.b $0E
	lda.w #$3834
	sta.b $0C
	ldy.w #$0020
	ldx.w #$0300
	jsl.l DMAToVRAM
	rtl
