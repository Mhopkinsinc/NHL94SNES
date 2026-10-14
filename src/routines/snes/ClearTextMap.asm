; Fill the text map with the blank tile
ClearTextMap:
	lda.w #$007E
	sta.b $12
	lda.w #textmap
	sta.b $10
	lda.l $7E35D0
	clc
	adc.l $7E35AA
	ldx.w #$0800
	jsl.l MemFill
	rtl
