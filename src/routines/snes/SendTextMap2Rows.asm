; Send rows 1-12 of the second text map to video memory
SendTextMap2Rows:
	lda.w #$007E
	sta.b $0E
	lda.w #$4034
	sta.b $0C
	ldy.w #$0420
	ldx.w #$0300
	jsl.l DMAToVRAM
	rtl
