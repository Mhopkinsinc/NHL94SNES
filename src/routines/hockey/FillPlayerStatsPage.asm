; Build the player stats page in the stats page buffer, a row per player in the sorted order
FillPlayerStatsPage:
	lda.w #$007F
	sta.b $12
	lda.w #$2780
	sta.b $10
	ldx.w #$4D80
	lda.l $7E35B6
	clc
	adc.l printfontset
	jsl.l MemFill
	ldy.w $1DBD
	tya
	dec a
	asl a
	sta.w printy
.1:
	inc.w printy
	inc.w printy
	sep #$20
	lda.w $1DFB,y
	rep #$20
	and.w #$00FF
	tax
	lda.w $1DF9
	beq .t1
	jsl.l .3
	bra .2

.t1:
	jsl.l .4
.2:
	iny
	cpy.w $1DC1
	beq .1
	bcc .1
	rtl
.3:
	phy
	lda.b d1
	pha
	lda.w #$FFFF
	jsl.l SetStatColumnPal
	lda.w #$0003
	sta.w printx
	stx.b d0
	jsl.l PlayerInitialName
	jsl.l PrintToStatsPage
	stx.w $1DC9
	lda.b a2
	beq .2x
.1x:
	lda.w #$001A
.2x:
	clc
	adc.w $1DC9
	tax
	lda.w #$0001
	jsl.l SetStatColumnPal
	lda.w #$0011
	sta.w printx
	sep #$20
	lda.w $18EE,x
	rep #$20
	and.w #$00FF
	sta.b d0
	lda.w #$0002
	sta.b d1
	jsl.l PushNumberWrap
	jsl.l PrintToStatsPage
	lda.w #$0002
	jsl.l SetStatColumnPal
	lda.w #$0014
	sta.w printx
	sep #$20
	lda.w $1922,x
	rep #$20
	and.w #$00FF
	sta.b d0
	lda.w #$0002
	sta.b d1
	jsl.l PushNumberWrap
	jsl.l PrintToStatsPage
	lda.w #$0003
	jsl.l SetStatColumnPal
	lda.w #$0017
	sta.w printx
	sep #$20
	lda.w $18EE,x
	rep #$20
	and.w #$00FF
	sta.b d0
	sep #$20
	lda.w $1922,x
	rep #$20
	and.w #$00FF
	clc
	adc.b d0
	sta.b d0
	lda.w #$0002
	sta.b d1
	jsl.l PushNumberWrap
	jsl.l PrintToStatsPage
	lda.w #$0004
	jsl.l SetStatColumnPal
	lda.w #$001A
	sta.w printx
	sep #$20
	lda.w $1956,x
	rep #$20
	and.w #$00FF
	sta.b d0
	lda.w #$0002
	sta.b d1
	jsl.l PushNumberWrap
	jsl.l PrintToStatsPage
	lda.w #$0005
	jsl.l SetStatColumnPal
	lda.w #$001D
	sta.w printx
	sep #$20
	lda.w $198A,x
	rep #$20
	and.w #$00FF
	sta.b d0
	lda.w #$0002
	sta.b d1
	jsl.l PushNumberWrap
	jsl.l PrintToStatsPage
	lda.w #$FFFF
	jsl.l SetStatColumnPal
	pla
	sta.b d1
	ply
	rtl
.4:
	phy
	lda.b d1
	pha
	lda.w #$FFFF
	jsl.l SetStatColumnPal
	lda.w #$0003
	sta.w printx
	stx.b d0
	jsl.l PlayerInitialName
	jsl.l PrintToStatsPage
	stx.w $1DC9
	lda.b a2
	beq .1xx
	lda.w #$001A
.1xx:
	clc
	adc.w $1DC9
	tax
	lda.w #$0012
	sta.w printx
	sep #$20
	lda.w $18EE,x
	rep #$20
	and.w #$00FF
	sta.b d0
	lda.w #$0003
	sta.b d1
	jsl.l PushNumberWrap
	jsl.l PrintToStatsPage
	lda.w #$0016
	sta.w printx
	sep #$20
	lda.w $1956,x
	rep #$20
	and.w #$00FF
	sta.b d0
	lda.w #$0003
	sta.b d1
	jsl.l PushNumberWrap
	jsl.l PrintToStatsPage
	lda.w #$001B
	sta.w printx
	sep #$20
	lda.w $18EE,x
	rep #$20
	and.w #$00FF
	phx
	ldx.w #$0064
	jsl.l Mul8XS
	sta.b $08
	plx
	sep #$20
	lda.w $1956,x
	rep #$20
	and.w #$00FF
	sta.b $04
	cmp.w #$0000
	beq .t1x
	jsl.l Div16U
	lda.b $00
	sta.b d0
	bra .2xx

.t1x:
	lda.w #$0064
	sta.b d0
.2xx:
	lda.w #$0064
	sec
	sbc.b d0
	sta.b d0
	lda.w #$0003
	sta.b d1
	jsl.l PushNumberWrap
	jsl.l PrintToStatsPage
	lda.w #$001E
	sta.w printx
	lda.w #$009C
	sta.b $8F
	lda.w #PercentSign
	sta.b a1
	jsl.l PrintToStatsPage
	pla
	sta.b d1
	ply
	rtl
