; Send the text map to video memory
SendTextMap:
	lda.w #textmap>>16
	sta.b $0E
	lda.w #textmap
	sta.b $0C
	ldy.w #$0000
	ldx.w #$0800
	jsl.l DMAToVRAM
	rtl
