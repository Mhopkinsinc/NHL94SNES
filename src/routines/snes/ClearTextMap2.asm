; Fill the second text map ($7E3FF4, the one SendTextMap2 sends) with the blank tile
ClearTextMap2:
	lda.w #$007E
	sta.b $12
	lda.w #textmap2
	sta.b $10
	lda.l $7E35D0
	clc
	adc.l $7E35AC
	ldx.w #$0800
	jsl.l MemFill
	rtl
