; Unidentified routine.
CODE_9DCC8D:
	lda.w #$5100
CODE_9DCC90:
	clc
	adc.l DATA8_9DCCAE,x
	sta.b $10
	lda.w #$007F
	sta.b $0E
	lda.w #$0000
	sta.b $0C
	jsl.l LinearToPlanar
	plx
	dex
	dex
	bpl CODE_9DCC48
	pla
	sta.b $A5
	rtl
