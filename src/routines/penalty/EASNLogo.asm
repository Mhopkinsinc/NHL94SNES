; Draw the EASN logo on the rink unless a power play is on
EASNLogo:
	lda.w sflags
	bit.w #sf2pwrplay
	bne .rtl
	lda.b a1+2
	pha
	lda.b a1
	pha
	lda.w #EASNLogoPos>>16
	sta.b a1+2
	lda.w #EASNLogoPos
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b a1+2
	lda.w #EASNLogoMap>>16
	sta.b p0+2
	lda.w #EASNLogoMap
	sta.b p0
	lda.w #textmap>>16
	sta.b p1+2
	lda.w #textmap
	sta.b p1
	lda.w #$0020
	sta.b r7
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
