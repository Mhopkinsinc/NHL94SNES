; Draw the EASN logo on the rink unless a power play is on
EASNLogo:
	lda.w sflags
	bit.w #sf2pwrplay
	bne .rtl
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #EASNLogoPos>>16
	sta.b $8F
	lda.w #EASNLogoPos
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #EASNLogoMap>>16
	sta.b $0E
	lda.w #EASNLogoMap
	sta.b $0C
	lda.w #textmap>>16
	sta.b $12
	lda.w #textmap
	sta.b $10
	lda.w #$0020
	sta.b $24
	ldx.w #$0001
	ldy.w #$0019
	lda.w #$2000
	clc
	adc.l EASNcset
	adc.l charofs
	jsl.l PasteMap
	lda.w #$0321
	cmp.w textdirtylo
	bcs .1
	sta.w textdirtylo
.1:
	lda.l EASNLogoMap+2
	clc
	adc.w #$0019
	dec a
	asl a
	asl a
	asl a
	asl a
	asl a
	clc
	adc.l EASNLogoMap
	cmp.w textdirtyhi
	bcc .rtl
	sta.w textdirtyhi
.rtl:
	rtl
