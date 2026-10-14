; The scouting report screen: both teams, the matchups and the scrolling commentary until Start
ScoutingReport:
	lda.w #$0001
	sta.l $7E3474
	stz.w $1E3F
	jsl.l ClearTeamStats
	jsl.l LoadScoutingScreen
	ldx.w #$0000
	jsl.l LoadMatchupPhotos
	ldx.w #$0002
	jsl.l LoadMatchupPhotos
	lda.w #$0008
	ldx.w #$003E
	jsl.l SetupBandIRQ
	stz.w $1DB9
	stz.w $1E3D
	jsl.l .10
	jsl.l .12
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF390
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0016
	sta.b d0
	lda.w #$000B
	sta.b d1
	jsl.l CODE_9D80DD
	jsl.l ShowMatchups
	jsl.l ScoutingHDMA
	jsl.l ScreenOn
.3:
	jsl.l SendTextMap
	jsl.l WaitFrame
	jsl.l ReadPads
	ldx.w #$0002
	lda.w $0AB8
	sta.b $14
.loop:
	lda.w $1C84,x
	beq .1
	lda.w $0AB8,x
	ora.b $14
	sta.b $14
.1:
	inx
	inx
	cpx.w #$000A
	bcc .loop
	lda.b $14
	bit.w #$1000
	bne .5
	bit.w #$0800
	beq .2
	jsl.l CODE_9B866C
.2:
	bit.w #$4000
	bne .6
	bit.w #$8080
	bne .7
	bit.w #$0040
	beq .t1
	jmp.w .9

.t1:
	lda.w $1E3F
	bne .1x
	lda.w $1E3D
	inc a
	cmp.w #$012C
	bcs .8
	sta.w $1E3D
.1x:
	stz.w $1D5E
	lda.w JoyPad
	ora.w $0778
	bit.w #$0400
	beq .2x
	lda.w #$FFFF
	sta.w $1D5E
.2x:
	jsl.l UpdateScoutingDisplay
	lda.w $1E3F
	bne .4
	lda.l $7E34CC
	bne .4
	dec.w $0D41
	bmi .5
.4:
	jmp.w .3
.5:
	lda.w #$0000
	sta.l $7E3474
	rtl
.6:
	lda.w #$FFFF
	sta.w $1E3F
	lda.w $1DB9
	dec a
	bpl .1xx
	lda.w #$0006
	sta.w $1DB9
.1xx:
	sta.w $1DB9
	jsl.l ShowMatchups
	stz.w $1E3D
	bra .4
.7:
	lda.w #$FFFF
	sta.w $1E3F
.8:
	lda.w $1DB9
	inc a
	cmp.w #$0007
	bcc .1xxx
	lda.w #$0000
.1xxx:
	sta.w $1DB9
	jsl.l ShowMatchups
	stz.w $1E3D
	bra .4
.9:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF395
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0014
	sta.b d0
	lda.w #$0009
	sta.b d1
	lda.l $7E35D0
	sta.b d2
	jsl.l eraser
	jsl.l .12
	bra .4
.10:
	lda.w #$FFFF
	sta.w $1E49
	sta.w $1E4B
	sta.w $1E4D
	sta.w $1E4F
	sta.w $1E51
	sta.w $1E53
	sta.w $1E55
	sta.w $1E57
	sta.w $1E59
	sta.w $1E5B
	sta.w $1E5D
	sta.w $1E5F
	lda.w #$FF06
	sta.w $1E61
	sta.w $1E65
	sta.w $1E69
	sta.w $1E63
	sta.w $1E67
	sta.w $1E6B
	lda.w #$00FA
	sta.w $1E6D
	sta.w $1E71
	sta.w $1E75
	sta.w $1E6F
	sta.w $1E73
	sta.w $1E77
	stz.w $1E45
	stz.w $1E47
	stz.b a2
	jsl.l .11
	lda.w #$0002
	sta.b a2
	jsl.l .11
	lda.w HomeTeam
	sta.w $1E41
	lda.w #$0001
	sta.w $1E43
	lda.w $1E45
	sec
	sbc.w $1E47
	bmi .t1x
	bra .1xxxx

.t1x:
	lda.w VisTeam
	sta.w $1E41
	lda.w $1E47
	sec
	sbc.w $1E45
.1xxxx:
	cmp.w #$0008
	bcs .rtl
	stz.w $1E43
	cmp.w #$0004
	bcs .rtl
	lda.w #$FFFF
	sta.w $1E41
.rtl:
	rtl
.11:
	jsl.l GetPlayerCount
	lda.b d0
	sta.b d4
	ldx.w #$0000
.loopx:
	stx.w $1D9B
	lda.w #$0001
	sta.b d1
	jsl.l GetPlayerBaseRating
	lda.b d0
	sta.b d2
	lda.w #$0001
	sta.b d1
	jsl.l GetPlayerRating
	lda.b d0
	sec
	sbc.b d2
	sta.b d0
	ldy.b a2
	lda.w $1E45,y
	clc
	adc.b d0
	sta.w $1E45,y
	stx.b d3
	jsl.l .t1xx
	inx
	cpx.b d4
	bmi .loopx
	rtl

.t1xx:
	lda.b d3
	sta.b d1
	lda.b d0
	sta.b $08
	cmp.w $1E61,y
	beq .1xxxxx
	bpl .t2
.1xxxxx:
	cmp.w $1E65,y
	beq .2xx
	bpl .3x
.2xx:
	cmp.w $1E69,y
	beq .5x
	bpl .4x
	bra .5x

.t2:
	lda.w $1E61,y
	sta.b $00
	lda.w $1E49,y
	sta.b $04
	lda.b d0
	sta.w $1E61,y
	lda.b d1
	sta.w $1E49,y
	lda.b $00
	sta.b d0
	lda.b $04
	sta.b d1
.3x:
	lda.w $1E65,y
	sta.b $00
	lda.w $1E4D,y
	sta.b $04
	lda.b d0
	sta.w $1E65,y
	lda.b d1
	sta.w $1E4D,y
	lda.b $00
	sta.b d0
	lda.b $04
	sta.b d1
.4x:
	lda.b d0
	sta.w $1E69,y
	lda.b d1
	sta.w $1E51,y
.5x:
	lda.b d3
	sta.b d1
	lda.b $08
	sta.b d0
	cmp.w $1E6D,y
	bmi .t1xxx
	cmp.w $1E71,y
	bmi .6x
	cmp.w $1E75,y
	bmi .7x
	bra .8x

.t1xxx:
	lda.w $1E6D,y
	sta.b $00
	lda.w $1E55,y
	sta.b $04
	lda.b d0
	sta.w $1E6D,y
	lda.b d1
	sta.w $1E55,y
	lda.b $00
	sta.b d0
	lda.b $04
	sta.b d1
.6x:
	lda.w $1E71,y
	sta.b $00
	lda.w $1E59,y
	sta.b $04
	lda.b d0
	sta.w $1E71,y
	lda.b d1
	sta.w $1E59,y
	lda.b $00
	sta.b d0
	lda.b $04
	sta.b d1
.7x:
	lda.b d0
	sta.w $1E75,y
	lda.b d1
	sta.w $1E5D,y
.8x:
	rtl
.12:
	jsl.l InitScoutDisplay
	lda.w #$001D
	sta.b [a0]
	inc.b a0
	inc.b a0
	lda.w #$001C
	sta.b [a0]
	inc.b a0
	inc.b a0
	lda.w $1E41
	bmi .1xxxxxx
	lda.w #$001E
	sta.b [a0]
	inc.b a0
	inc.b a0
.1xxxxxx:
	lda.w HomeTeam
	sta.b d0
	lda.w #$001F
	sta.b [a0]
	inc.b a0
	inc.b a0
	lda.w VisTeam
	cmp.b d0
	beq .2xxx
	lda.w #$0020
	sta.b [a0]
	inc.b a0
	inc.b a0
.2xxx:
	lda.w #$0021
	sta.b [a0]
	inc.b a0
	inc.b a0
	lda.w #$FFFF
	sta.b [a0]
	stz.w $1D5E
	lda.w #$7FFF
	sta.w $0D41
	rtl
