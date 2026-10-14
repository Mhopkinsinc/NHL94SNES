; Password bits divided by d0, remainder left in d0
SuperDiv:
	lda.b d0
	cmp.w #$0100
	bcs CODE_9CA467
	sep #$30
	phx
	ldx.b #$0E
	lda.b #$00
	xba
	lda.l $7E3517
	sta.b $14
CODE_9CA430:
	lda.l passbits,x
	sta.w WRDIVL
	lda.b $14
	sta.w WRDIVH
	lda.b d0
	sta.w WRDIVB
	nop
	nop
	nop
	nop
	nop
	nop
	xba
	clc
	adc.w RDDIVL
	sta.l passbits,x
	lda.w RDDIVH
	adc.b #$00
	xba
	lda.w RDMPYL
	sta.b $14
	dex
	bpl CODE_9CA430
	lda.b $14
	sta.b d0
	plx
	rep #$30
	clc
	rtl
