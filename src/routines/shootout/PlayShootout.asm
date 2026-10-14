; the shootout: both shooter lists, then a turn for each team every round, until after five rounds
PlayShootout:
		;   $178E and $1790 differ
	lda.l $7E34C6
	pha
	lda.w #$0000
	sta.l $7E34C6
	lda.w #$0001
	sta.w $1D81
	stz.b a2
	jsl.l InitShooters
	lda.w #$0002
	sta.b a2
	jsl.l InitShooters
	jsl.l CODE_9F833C
	jsl.l StartPer
	jsl.l Pausemode
	lda.w #$0001
	sta.w shootoutround
	stz.b d1
.loop:
	stz.w $1D89
	lda.w #$0002
	sta.b a2
	stz.b a1
	jsl.l .t1
	lda.w shootoutround
	cmp.w #$0005
	bmi .1
	lda.w #$0001
	sta.w $1D89
.1:
	stz.b a2
	lda.w #$0002
	sta.b a1
	jsl.l .t1
	jsl.l CODE_80CA0A
	inc.w shootoutround
	lda.w shootoutround
	cmp.w #$0006
	bmi .loop
	lda.w $178E
	cmp.w $1790
	beq .loop
	stz.w $1D81
	pla
	sta.l $7E34C6
	rtl

.t1:		; a shootout turn of team $91: the shooter of this round from its list
	stz.w $1D83
	stz.w $1D87
	lda.b a2
	pha
	jsl.l ClearPenaltyBuffer
	stz.w gmode
	lda.b a2
	beq .1x
	lda.w #$0002
	sta.w gmode
.1x:
	jsl.l StartPer
	pla
	sta.b a2
	lda.w #$0000
	sta.w $1E8D
	lda.b a2
	beq .2
	lda.w #$000C
	sta.w $1E8D
.2:
	ldy.w #$0000
.loopx:
	lda.w $19F6,y
	cmp.b a2
	beq .t2
	iny
	iny
	cpy.w #$000A
	bcc .loopx
	lda.w #$FFFF
	sta.w $1E93
	bra .3

.t2:
	sty.w $1E93
.3:
	jsl.l CODE_9EC72D
	lda.b a2
	beq .t2x
	lda.w shootoutround
.loopxx:
	cmp.w #$0006
	bmi .t1x
	sec
	sbc.w #$0005
	bra .loopxx

.t1x:
	tay
	sep #$20
	lda.w awayshooters,y
	rep #$20
	and.w #$00FF
	dec a
	sta.w $1E8F
	lda.w #$000C
	sta.w $1E8D
	lda.w #$0002
	sta.w $1E91
	bra .4

.t2x:
	lda.w shootoutround
.loopxxx:
	cmp.w #$0006
	bmi .t1xx
	sec
	sbc.w #$0005
	bra .loopxxx

.t1xx:
	tay
	sep #$20
	lda.w homeshooters,y
	rep #$20
	and.w #$00FF
	dec a
	sta.w $1E8F
	lda.w #$0000
	sta.w $1E8D
	stz.w $1E91
.4:
	jsl.l Gameloop
	rtl
