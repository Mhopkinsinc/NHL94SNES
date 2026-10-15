; Fill the text map with the blank tile
ClearTextMap:
	lda.w #textmap>>16
	sta.b $12
	lda.w #textmap
	sta.b $10
	lda.l blankchar
	clc
	adc.l charofs
	ldx.w #$0800
	jsl.l MemFill
	rtl
