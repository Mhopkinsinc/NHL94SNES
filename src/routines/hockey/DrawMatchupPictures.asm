; Draw the two 6 x 6 pictures, visitors at x 1 and home at x $18: a team logo ($7E3454 / $7E3452) or, when that is negative, the matchup player picture ($7E345C / $7E345A)
DrawMatchupPictures:
	lda.b a2
	pha
	lda.l setupvis
	sta.b $00
	bpl .t1
	lda.l setuphome
	bpl .1
	lda.w #$0002
	sta.b a2
.1:
	lda.l matchupvis
	ldx.w #$0001
	ldy.w #$0001
	jsl.l DrawPlayerPicture
	lda.w #$007F
	sta.b $0E
	lda.w #$7780
	sta.b $0C
	lda.w #textmap2>>16
	sta.b $12
	lda.w #textmap2
	sta.b $10
	lda.w #$0020
	sta.b $24
	ldx.w #$0001
	ldy.w #$0001
	lda.w #$0000
	jsl.l PasteMap
	bra .2

.t1:
	lda.l setupvis
	asl a
	asl a
	tax
	lda.l LogoPaletteTable+2,x
	sta.b $0E
	lda.l LogoPaletteTable,x
	sta.b $0C
	ldy.w #$00A0
	ldx.w #$0010
	jsl.l SetColours
	lda.w #$007F
	sta.b $12
	lda.w #$7800
	sta.b $10
	lda.w #$2400
	ldx.w #$000C
	ldy.w #$000C
	jsl.l DrawSprite
	ldx.w #$0001
	ldy.w #$0001
	jsl.l ClearPictureBox
	lda.w #$007F
	sta.b $0E
	lda.w #$7700
	sta.b $0C
	lda.w #textmap2>>16
	sta.b $12
	lda.w #textmap2
	sta.b $10
	lda.w #$0020
	sta.b $24
	ldx.w #$0001
	ldy.w #$0001
	lda.w #$0000
	jsl.l PasteMap
.2:
	lda.l setuphome
	sta.b $00
	bpl .t1x
	lda.l setupvis
	bpl .1x
	stz.b a2
.1x:
	lda.l matchuphome
	ldx.w #$0018
	ldy.w #$0001
	jsl.l DrawPlayerPicture
	lda.w #$007F
	sta.b $0E
	lda.w #$7780
	sta.b $0C
	lda.w #textmap2>>16
	sta.b $12
	lda.w #textmap2
	sta.b $10
	lda.w #$0020
	sta.b $24
	ldx.w #$0018
	ldy.w #$0001
	lda.w #$0000
	jsl.l PasteMap
	bra .3

.t1x:
	lda.l setuphome
	asl a
	asl a
	tax
	lda.l LogoPaletteTable+2,x
	sta.b $0E
	lda.l LogoPaletteTable,x
	sta.b $0C
	ldy.w #$00B0
	ldx.w #$0010
	jsl.l SetColours
	lda.w #$007F
	sta.b $12
	lda.w #$7800
	sta.b $10
	lda.w #$2600
	ldx.w #$00C4
	ldy.w #$000C
	jsl.l DrawSprite
	ldx.w #$0018
	ldy.w #$0001
	jsl.l ClearPictureBox
	lda.w #$007F
	sta.b $0E
	lda.w #$7700
	sta.b $0C
	lda.w #textmap2>>16
	sta.b $12
	lda.w #textmap2
	sta.b $10
	lda.w #$0020
	sta.b $24
	ldx.w #$0018
	ldy.w #$0001
	lda.w #$0000
	jsl.l PasteMap
.3:
	lda.l playerstatson
	bne .5
	lda.l setupvis
	bmi .1xx
	lda.l setuphome
	bpl .t1xx
.1xx:
	lda.w #$007F
	sta.b $0E
	lda.l homepicaddr
	sta.b $0C
	lda.l picchars
	asl a
	asl a
	asl a
	asl a
	clc
	adc.w #$2000
	tay
	ldx.w #$0600
	jsl.l WaitFrame
	jsl.l DMAToVRAM
	lda.w #$007F
	sta.b $0E
	lda.l vispicaddr
	sta.b $0C
	lda.l picchars
	asl a
	asl a
	asl a
	asl a
	clc
	adc.w #$2300
	tay
	ldx.w #$0600
	jsl.l DMAToVRAM
	bra .4

.t1xx:
	jsl.l WaitFrame
.4:
	jsl.l SendTextMapRows
	jsl.l SendTextMap2Rows
.5:
	pla
	sta.b a2
	rtl
