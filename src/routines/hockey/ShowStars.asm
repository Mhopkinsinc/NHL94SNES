; Stars of the Game
ShowStars:
	phx
	phy
	stx.b xsave
	ldx.w #$0000
.loop:
	lda.b d0,x
	pha
	inx
	inx
	cpx.w #$0018
	bne .loop
	ldx.b xsave
	stx.b xsave
	ldx.w #$0000
.loop2:
	lda.b a0,x
	pha
	inx
	inx
	cpx.w #$0014
	bne .loop2
	ldx.b xsave
	lda.b a1+2
	pha
	lda.b a1
	pha
	lda.w #ShowStarsPos>>16
	sta.b a1+2
	lda.w #ShowStarsPos
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b a1+2
	lda.w #$0013
	sta.b d0
	lda.w #$0008
	sta.b d1
	lda.l blankchar
	sta.b d2
	jsl.l eraser
	lda.b a1+2
	pha
	lda.b a1
	pha
	lda.w #ShowStarsPos2>>16
	sta.b a1+2
	lda.w #ShowStarsPos2
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b a1+2
	lda.w #$0015
	sta.b d0
	lda.w #$0007
	sta.b d1
	jsl.l Framer
	lda.b a1+2
	pha
	lda.b a1
	pha
	lda.w #StarsOfTheGame>>16
	sta.b a1+2
	lda.w #StarsOfTheGame
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b a1+2
	jsl.l .t1
	lda.w #$0005
	sta.w printy
	lda.w #$000D
	sta.w printx
	stz.b d3
	stz.b a2
	lda.w star1
	cmp.w #$001A
	bmi .1
	sec
	sbc.w #$001A
	sta.w star1
	inc.b d3
	lda.w #$0002
	sta.b a2
.1:
	jsl.l printteamname
	lda.w #$0005
	sta.w printy
	lda.w #$0011
	sta.w printx
	lda.w star1
	sta.b d0
	jsl.l PlayerInitialName
	jsl.l print
	inc.w printy
	lda.w #$000D
	sta.w printx
	stz.b d3
	stz.b a2
	lda.w star2
	cmp.w #$001A
	bmi .2
	sec
	sbc.w #$001A
	sta.w star2
	inc.b d3
	lda.w #$0002
	sta.b a2
.2:
	jsl.l printteamname
	lda.w #$0006
	sta.w printy
	lda.w #$0011
	sta.w printx
	lda.w star2
	sta.b d0
	jsl.l PlayerInitialName
	jsl.l print
	inc.w printy
	lda.w #$000D
	sta.w printx
	stz.b d3
	stz.b a2
	lda.w star3
	cmp.w #$001A
	bmi .3
	sec
	sbc.w #$001A
	sta.w star3
	inc.b d3
	lda.w #$0002
	sta.b a2
.3:
	jsl.l printteamname
	lda.w #$0007
	sta.w printy
	lda.w #$0011
	sta.w printx
	lda.w star3
	sta.b d0
	jsl.l PlayerInitialName
	jsl.l print
	stx.b xsave
	ldx.w #$0012
.loop3:
	pla
	sta.b a0,x
	dex
	dex
	bpl .loop3
	ldx.b xsave
	stx.b xsave
	ldx.w #$0016
.loop4:
	pla
	sta.b d0,x
	dex
	dex
	bpl .loop4
	ldx.b xsave
	ply
	plx
	rtl

.t1:
	lda.w #$0000
	sta.w star1score+2
	lda.w #$0000
	sta.w star1score
	lda.w #$0000
	sta.w star2score+2
	lda.w #$0000
	sta.w star2score
	lda.w #$0000
	sta.w star3score+2
	lda.w #$0000
	sta.w star3score
	lda.w #$FFFF
	sta.w otgoalscorer
	lda.w #$007E
	sta.b a1+2
	lda.w #ScoreSum-6
	sta.b a1
	ldy.w #$0000
	lda.b [a1],y
	and.w #$F000
	xba
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	cmp.w #$0003
	bne .1x
	iny
	iny
	iny
	lda.b [a1],y
	and.w #$00FF
	sta.w otgoalscorer
	dey
	lda.b [a1],y
	and.w #$00F0
	beq .1x
	lda.w otgoalscorer
	clc
	adc.w #$001A
	sta.w otgoalscorer
.1x:
	stz.b a2
	jsl.l GetPlayerCount
	lda.b d0
	sta.w starplayerend
	jsl.l GoalieCount
	lda.b d0
	sta.w stargoalieend
	ldx.w #$0000
.12:
	phx
	cpx.w starplayerend
	bmi .t1x
	jmp.w .16

.t1x:
	jsl.l .17
	lda.b d0+2
	sec
	sbc.w star1score+2
	bmi .t2
	bvc .1xx
	bra .3x

.t2:
	bvc .3x
.1xx:
	beq .2x
	bmi .t1xx
	bvs .2x
	bra .13

.t1xx:
	bvs .13
.2x:
	lda.b d0
	sec
	sbc.w star1score
	beq .3x
	bmi .t1xxx
	bvs .3x
	bra .13

.t1xxx:
	bvs .13
.3x:
	lda.b d0+2
	sec
	sbc.w star2score+2
	bmi .t1xxxx
	bvc .4
	bra .6

.t1xxxx:
	bvc .6
.4:
	beq .5
	bmi .t1xxxxx
	bvs .5
	bra .14

.t1xxxxx:
	bvs .14
.5:
	lda.b d0
	sec
	sbc.w star2score
	beq .6
	bmi .t1xxxxxx
	bvs .6
	bra .14

.t1xxxxxx:
	bvs .14
.6:
	lda.b d0+2
	sec
	sbc.w star3score+2
	bmi .8
	bvc .9
.7:
	jmp.w .16
.8:
	bvc .7
.9:
	beq .10
	bmi .t1xxxxxxx
	bvs .10
	bra .15

.t1xxxxxxx:
	bvs .15
.10:
	lda.b d0
	sec
	sbc.w star3score
	beq .11
	bmi .t1xxxxxxxx
	bvs .11
	bra .15

.t1xxxxxxxx:
	bvs .15
.11:
	bra .16
.13:
	lda.w star1
	sta.w starswapplayer
	lda.w star1score+2
	sta.w starswapscore+2
	lda.w star1score
	sta.w starswapscore
	stx.w star1
	lda.b d0+2
	sta.w star1score+2
	lda.b d0
	sta.w star1score
	ldx.w starswapplayer
	lda.w starswapscore+2
	sta.b d0+2
	lda.w starswapscore
	sta.b d0
.14:
	lda.w star2
	sta.w starswapplayer
	lda.w star2score+2
	sta.w starswapscore+2
	lda.w star2score
	sta.w starswapscore
	stx.w star2
	lda.b d0+2
	sta.w star2score+2
	lda.b d0
	sta.w star2score
	ldx.w starswapplayer
	lda.w starswapscore+2
	sta.b d0+2
	lda.w starswapscore
	sta.b d0
.15:
	stx.w star3
	lda.b d0+2
	sta.w star3score+2
	lda.b d0
	sta.w star3score
.16:
	plx
	inx
	lda.w starplayerend
	cmp.w #$001A
	bpl .1xxx
	cpx.w #$001A
	bmi .1xxx
	lda.w #$0002
	sta.b a2
	jsl.l GetPlayerCount
	lda.b d0
	clc
	adc.w #$001A
	sta.w starplayerend
	jsl.l GoalieCount
	lda.b d0
	clc
	adc.w #$001A
	sta.w stargoalieend
.1xxx:
	cpx.w #$0034
	bpl .t1xxxxxxxxx
	jmp.w .12

.t1xxxxxxxxx:
	rtl
.17:
	stz.b a2
	lda.w #$0002
	sta.b a1
	cpx.w #$001A
	bmi .1xxxx
	lda.w #$0002
	sta.b a2
	stz.b a1
.1xxxx:
	ldy.b a2
	lda.w tmscore,y
	ldy.b a1
	sec
	sbc.w tmscore,y
	sta.b d0
	lda.w #$0000
	sbc.w #$0000
	sta.b d0+2
	cpx.w stargoalieend
	bmi .t1xxxxxxxxxx
	cpx.w otgoalscorer
	bne .2xx
	lda.w #$000B
	sta.b $0A
	lda.w #$71B0
	sta.b $08
	jsr.w .18
.2xx:
	sep #$20
	lda.w tmgoals,x
	rep #$20
	and.w #$00FF
	phx
	ldx.w #$2AF8
	jsl.l Mul16U
	plx
	jsr.w .18
	sep #$20
	lda.w passists,x
	rep #$20
	and.w #$00FF
	phx
	ldx.w #$2774
	jsl.l Mul16U
	plx
	jsr.w .18
	sep #$20
	lda.w pshots,x
	rep #$20
	and.w #$00FF
	phx
	ldx.w #$000A
	jsl.l Mul16U
	plx
	jsr.w .18
	bra .3xx

.t1xxxxxxxxxx:
	lda.b d0
	pha
	jsl.l GetPeriodTime
	lda.b d0
	phx
	ldx.w #$0028
	jsl.l DivX8U
	plx
	sta.b d1
	pla
	sta.b d0
	sep #$20
	lda.w pshots,x
	rep #$20
	and.w #$00FF
	cmp.b d1
	bmi .3xx
	sta.b $04
	sep #$20
	lda.w tmgoals,x
	rep #$20
	and.w #$00FF
	phx
	ldx.w #$0064
	jsl.l Mul8U
	sta.b $08
	jsl.l Div16U
	plx
	lda.b $00
	cmp.w #$0003
	bpl .3xx
	lda.w #$0000
	sta.b $0A
	lda.w #$7D00
	sta.b $08
	jsr.w .18
	lda.b $00
	cmp.w #$0000
	bne .3xx
	lda.w #$0001
	sta.b $0A
	lda.w #$24F8
	sta.b $08
	jsr.w .18
.3xx:
	lda.b d0+2
	asl a
	sta.b d0+2
	lda.b d0
	asl a
	lda.b d0+2
	adc.w #$0000
	sta.b d0+2
	lda.b d0
	and.w #$7FFF
	sta.b d0
	rtl
.18:
	lda.b d0
	clc
	adc.b $08
	sta.b d0
	lda.b d0+2
	adc.b $0A
	sta.b d0+2
	rts
