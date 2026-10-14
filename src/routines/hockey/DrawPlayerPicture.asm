; Draw the picture of player A of team a2 (PlayerPhotoTable) at x, y
DrawPlayerPicture:
	sta.b d0
	lda.l $7E3474
	beq .t1
	jmp.w .10

.t1:
	phy
	phx
	lda.b a2
	beq .t2
	lda.w #$2400
	sta.w $1E87
	bra .1

.t2:
	lda.w #$3400
	sta.w $1E87
.1:
	lda.b d0
	ldy.b a2
	sta.b d0
	lda.w HomeTeam,y
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
	lda.b a2
	beq .t1x
	lda.w #$6900
	sta.b $10
	sta.l $7E3472
	bra .2

.t1x:
	lda.w #$6F00
	sta.b $10
	sta.l $7E3470
.2:
	lda.w #$007F
	sta.b $0E
	lda.w #$0000
	sta.b $0C
	jsl.l LinearToPlanar
	jsl.l .6
	bne .t1xx
	lda.w #$0092
	sta.b $0E
	lda.w #DATA8_92FFB0
	sta.b $0C
	lda.w #$007E
	sta.b $12
	lda.w #textmap
	sta.b $10
	lda.w #$0020
	sta.b $24
	lda.l $7E35D2
	clc
	adc.w $1E87
	ldy.b a2
	beq .1x
	clc
	adc.w #$0030
.1x:
	plx
	ply
	jsl.l PasteMap
	bra .3

.t1xx:
	lda.w #$0092
	sta.b $0E
	lda.w #DATA8_92FFB0
	sta.b $0C
	lda.w #$007E
	sta.b $12
	lda.w #textmap
	sta.b $10
	lda.w #$0020
	sta.b $24
	lda.l $7E35D2
	clc
	adc.w $1E87
	ldy.b a2
	beq .1xx
	clc
	adc.w #$0030
.1xx:
	plx
	ply
	jsl.l .5
.3:
	ldy.b a2
	lda.w HomeTeam,y
	asl a
	asl a
	clc
	adc.w #$D8B3
	sta.b a1
	lda.w #$009D
	sta.b $8F
	lda.b [a1]
	sta.b $0C
	inc.b a1
	inc.b a1
	lda.b [a1]
	sta.b $0E
	lda.b a2
	beq .t1xxx
	ldy.w #$0010
	bra .4

.t1xxx:
	ldy.w #$0050
.4:
	ldx.w #$0010
	jsl.l SetColours
	rtl
.5:
	sta.b $26
	lda.b $12
	sta.b $16
	stx.b $1C
	tya
	asl a
	ldx.b $24
	jsl.l Mul16U
	lda.b $1C
	asl a
	clc
	adc.b $08
	adc.b $10
	sta.b $10
	ldy.w #$0000
	lda.b [$0C],y
	sta.b $18
	iny
	iny
	lda.b [$0C],y
	sta.b $1A
	lda.b $0C
	clc
	adc.w #$0006
	sta.b $0C
.loop:
	ldx.b $18
	ldy.w #$0000
.loop2:
	tya
	lsr a
	eor.w #$FFFF
	inc a
	clc
	adc.b $18
	dec a
	asl a
	adc.b $10
	sta.b $14
	lda.b [$0C],y
	clc
	adc.b $26
	ora.w #$4000
	sta.b [$14]
	iny
	iny
	dex
	bne .loop2
	lda.b $24
	asl a
	adc.b $10
	sta.b $10
	lda.b $18
	asl a
	adc.b $0C
	sta.b $0C
	dec.b $1A
	bne .loop
	rtl
.6:
	jsl.l .9
	beq .1xxx
	jsl.l .7
	sta.b $14
	jsl.l .8
	bne .t1xxxx
	lda.b $14
	rtl

.t1xxxx:
	lda.b $14
	eor.w #$0001
.1xxx:
	rtl
.7:
	jsl.l .8
	bne .t1xxxxx
	lda.w #$0005
	sta.b d1
	bra .1xxxx

.t1xxxxx:
	lda.w #$0004
	sta.b d1
.1xxxx:
	jsl.l GetPlayerRating
	lda.b d0
	and.w #$0001
	rtl
.8:
	lda.w #$0080
	sta.b $8F
	lda.w #AttribMenuSkater
	sta.b a1
	stz.b $08
	jsl.l GoalieCount
	lda.w $1D9B
	cmp.b d0
	bpl .t1xxxxxx
	lda.w #$0001
	rtl

.t1xxxxxx:
	lda.w #$0000
	rtl
.9:
	ldy.b a2
	lda.w #$009C
	sta.b $97
	lda.w tmdata,y
	sta.b a3
	ldy.w #$000C
	clc
	adc.b [a3],y
	sta.b a3
	ldy.w #$0005
.loopx:
	lda.b [a3],y
	and.w #$00FF
	dec a
	cmp.w $1D9B
	beq .t1xxxxxxx
	dey
	bpl .loopx
	lda.w #$0001
	rtl

.t1xxxxxxx:
	lda.w #$0000
	rtl
.10:
	phy
	phx
	ldx.b a2
	jsl.l LoadMatchupPhotos
	lda.b d0
	asl a
	tax
	lda.b a2
	beq .t1xxxxxxxx
	lda.w #$2400
	sta.w $1E87
	lda.w #$2D00
	clc
	adc.l DATA8_9DCCAE,x
	sta.l $7E3472
	bra .2x

.t1xxxxxxxx:
	lda.w #$3400
	sta.w $1E87
	lda.w #$5100
	clc
	adc.l DATA8_9DCCAE,x
	sta.l $7E3470
.2x:
	lda.w #$0092
	sta.b $0E
	lda.w #DATA8_92FFB0
	sta.b $0C
	lda.w #$007E
	sta.b $12
	lda.w #textmap
	sta.b $10
	lda.w #$0020
	sta.b $24
	lda.l $7E35D2
	clc
	adc.w $1E87
	ldy.b a2
	beq .1xxxxx
	clc
	adc.w #$0030
.1xxxxx:
	plx
	ply
	jsl.l PasteMap
	ldy.b a2
	lda.w HomeTeam,y
	asl a
	asl a
	clc
	adc.w #$D8B3
	sta.b a1
	lda.w #$009D
	sta.b $8F
	lda.b [a1]
	sta.b $0C
	inc.b a1
	inc.b a1
	lda.b [a1]
	sta.b $0E
	lda.b a2
	beq .t1xxxxxxxxx
	ldy.w #$0010
	bra .3x

.t1xxxxxxxxx:
	ldy.w #$0050
.3x:
	ldx.w #$0010
	jsl.l SetColours
	rtl
