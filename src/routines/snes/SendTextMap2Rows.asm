; Send rows 1-12 of the second text map to video memory
SendTextMap2Rows:
	lda.w #$007E
	sta.b p0+2
	lda.w #$4034
	sta.b p0
	ldy.w #$0420
	ldx.w #$0300
	jsl.l DMAToVRAM
	rtl
