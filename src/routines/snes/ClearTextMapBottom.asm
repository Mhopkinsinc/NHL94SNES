; Fill the text map from row 12 down with the blank tile
ClearTextMapBottom:
	lda.w #$007E
	sta.b $12
	lda.w #$3AF4
	sta.b $10
	lda.l $7E35D0
	clc
	adc.l $7E35AA
	ldx.w #$0500
	jsl.l MemFill
	rtl
