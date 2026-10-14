; Unpack the matchup players' photos of team x (0 home, 2 visitors) into the $7F photo buffer, unless that team's are already there ($7E346C)
LoadMatchupPhotos:
	stx.b a2
	lda.w HomeTeam,x
	cmp.l $7E346C,x
	bne .t1
	rtl

.t1:
	lda.b d0
	pha
	ldx.w #$000A
.1:
	phx
	txa
	lsr a
	jsl.l GetMatchupPlayer
	ldx.b a2
	lda.w HomeTeam,x
	sta.l $7E346C,x
	ldx.w #$001A
	jsl.l Mul8U
	clc
	adc.b d0
	asl a
	asl a
	tax
	lda.l PlayerPhotoTable,x
	sta.b $0C
	lda.l PlayerPhotoTable+2,x
	sta.b $0E
	lda.w #$007F
	sta.b $12
	lda.w #$0000
	sta.b $10
	jsl.l Decompress
	stx.b $00
	lda.b $01,s
	tax
	lda.b a2
	beq .t1x
	lda.w #$2D00
	bra .2

.t1x:
	lda.w #$5100
.2:
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
	bpl .1
	pla
	sta.b d0
	rtl
