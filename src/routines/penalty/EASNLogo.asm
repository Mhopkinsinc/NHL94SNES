; Draw the EASN logo on the rink unless a power play is on
EASNLogo:
	lda.w sflags
	bit.w #sf2pwrplay
	bne .rtl
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF8D2
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$009A
	sta.b $0E
	lda.w #DATA8_9AEA3A
	sta.b $0C
	lda.w #$007E
	sta.b $12
	lda.w #$37F4
	sta.b $10
	lda.w #$0020
	sta.b $24
	ldx.w #$0001
	ldy.w #$0019
	lda.w #$2000
	clc
	adc.l $7E35B0
	adc.l $7E35AA
	jsl.l CODE_808E2D
	lda.w #$0321
	cmp.w textdirtylo
	bcs .1
	sta.w textdirtylo
.1:
	lda.l DATA8_9AEA3A+2
	clc
	adc.w #$0019
	dec a
	asl a
	asl a
	asl a
	asl a
	asl a
	clc
	adc.l DATA8_9AEA3A
	cmp.w textdirtyhi
	bcc .rtl
	sta.w textdirtyhi
.rtl:
	rtl
