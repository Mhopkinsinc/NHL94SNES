; Start a period: reset the teams, the rink and the clock, then the game loop
StartPer:
	lda.w shootoutmode
	bne .1
	lda.w #$1FFF
	tcs
.1:
	stz.b a2
	jsl.l reenergizeteam
	lda.w #$0002
	sta.b a2
	jsl.l reenergizeteam
	stz.w reloadtime
	jsl.l forceblack
	jsl.l setupice_reset
	jsl.l ResetClock
	jsl.l InitCrowdExcite
	lda.w pregamepause
	beq .4
	lda.w #$FFFF
	sta.w pausepad
	ldy.w #$FFFE
.loop:
	iny
	iny
	cpy.w #$000A
	bcs .2
	lda.w cont1team,y
	beq .loop
	eor.w #$FFFF
	inc a
	sta.w pausepad
.2:
	lda.w cont1team
	ora.w cont2team
	ora.w cont3team
	ora.w cont4team
	ora.w cont5team
	bne .3
	stz.w pausepad
.3:
	jsl.l startpause
.4:
	ldx.w #$001C
	stx.b a3
	lda.w #$0000
	sta.l fox
	sta.l foy
	lda.w #$001B
	sta.b d0
	jsl.l assreplace
	jsl.l ClearTextMap
	lda.w #$0400
	tsb.w sflags
	lda.w #$FFFF
	sta.w recsfx
	sta.w recsfx2
	sta.w percue
	lda.l OptPlayMode
	cmp.w #$0004
	beq .t1
	lda.w #$0010
	trb.w sflags
	lda.w #$007E
	sta.w ReplayBufferPtr+2
	lda.w #ReplayBufferStart
	sta.w ReplayBufferPtr
	bra .5

.t1:
	lda.w pregamepause
	bne .5
	stz.w percue
.5:
	lda.w #$FFFF
	sta.w textdirtylo
	stz.w textdirtyhi
	stz.b $83
	stz.b $85
	stz.w lastframevc
	stz.w oldvcount
	ldx.w #$0000
	ldy.w #$01C0
	lda.w #$6000
	jsl.l InitSprites
	lda.w shootoutmode
	beq Gameloop
	rtl
