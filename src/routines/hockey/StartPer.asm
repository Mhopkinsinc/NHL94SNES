; Start a period: reset the teams, the rink and the clock, then the game loop
StartPer:
	lda.w $1D81
	bne .1
	lda.w #$1FFF
	tcs
.1:
	stz.b a2
	jsl.l reenergizeteam
	lda.w #$0002
	sta.b a2
	jsl.l reenergizeteam
	stz.w $0CC7
	jsl.l forceblack
	jsl.l CODE_9FB8B4
	jsl.l ResetClock
	jsl.l InitCrowdExcite
	lda.w $1EBB
	beq .4
	lda.w #$FFFF
	sta.w pausepad
	ldy.w #$FFFE
.loop:
	iny
	iny
	cpy.w #$000A
	bcs .2
	lda.w $1C84,y
	beq .loop
	eor.w #$FFFF
	inc a
	sta.w pausepad
.2:
	lda.w $1C84
	ora.w $1C86
	ora.w $1C88
	ora.w $1C8A
	ora.w $1C8C
	bne .3
	stz.w pausepad
.3:
	jsl.l SetPauseMode
.4:
	ldx.w #$001C
	stx.b a3
	lda.w #$0000
	sta.l $7E3136
	sta.l $7E3138
	lda.w #$001B
	sta.b d0
	jsl.l assreplace
	jsl.l ClearTextMap
	lda.w #$0400
	tsb.w sflags
	lda.w #$FFFF
	sta.w $0CAD
	sta.w $0CB3
	sta.w $0CC1
	lda.l $7E34BC
	cmp.w #$0004
	beq .t1
	lda.w #$0010
	trb.w sflags
	lda.w #$007E
	sta.w $0D21
	lda.w #$577E
	sta.w ReplayBufferPtr
	bra .5

.t1:
	lda.w $1EBB
	bne .5
	stz.w $0CC1
.5:
	lda.w #$FFFF
	sta.w textdirtylo
	stz.w textdirtyhi
	stz.b $83
	stz.b $85
	stz.w $0D35
	stz.w $0D01
	ldx.w #$0000
	ldy.w #$01C0
	lda.w #$6000
	jsl.l InitSprites
	lda.w $1D81
	beq Gameloop
	rtl
