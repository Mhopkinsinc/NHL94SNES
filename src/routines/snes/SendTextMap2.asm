; Send the second text map to video memory
SendTextMap2:
	lda.w #$007E
	sta.b $0E
	lda.w #textmap2
	sta.b $0C
	ldy.w #$0400
	ldx.w #$0800
	jsl.l DMAToVRAM
	rtl
