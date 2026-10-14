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
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF370
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0013
	sta.b d0
	lda.w #$0008
	sta.b d1
	lda.l $7E35D0
	sta.b d2
	jsl.l eraser
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF375
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0015
	sta.b d0
	lda.w #$0007
	sta.b d1
	jsl.l Framer
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #StarsOfTheGame
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	jsl.l .t1
	lda.w #$0005
	sta.w printy
	lda.w #$000D
	sta.w printx
	stz.b d3
	stz.b a2
	lda.w $1E2B
	cmp.w #$001A
	bmi .1
	sec
	sbc.w #$001A
	sta.w $1E2B
	inc.b d3
	lda.w #$0002
	sta.b a2
.1:
	jsl.l printteamname
	lda.w #$0005
	sta.w printy
	lda.w #$0011
	sta.w printx
	lda.w $1E2B
	sta.b d0
	jsl.l CODE_9FC427
	jsl.l print
	inc.w printy
	lda.w #$000D
	sta.w printx
	stz.b d3
	stz.b a2
	lda.w $1E2D
	cmp.w #$001A
	bmi .2
	sec
	sbc.w #$001A
	sta.w $1E2D
	inc.b d3
	lda.w #$0002
	sta.b a2
.2:
	jsl.l printteamname
	lda.w #$0006
	sta.w printy
	lda.w #$0011
	sta.w printx
	lda.w $1E2D
	sta.b d0
	jsl.l CODE_9FC427
	jsl.l print
	inc.w printy
	lda.w #$000D
	sta.w printx
	stz.b d3
	stz.b a2
	lda.w $1E2F
	cmp.w #$001A
	bmi .3
	sec
	sbc.w #$001A
	sta.w $1E2F
	inc.b d3
	lda.w #$0002
	sta.b a2
.3:
	jsl.l printteamname
	lda.w #$0007
	sta.w printy
	lda.w #$0011
	sta.w printx
	lda.w $1E2F
	sta.b d0
	jsl.l CODE_9FC427
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
	sta.w $1E33
	lda.w #$0000
	sta.w $1E31
	lda.w #$0000
	sta.w $1E37
	lda.w #$0000
	sta.w $1E35
	lda.w #$0000
	sta.w $1E3B
	lda.w #$0000
	sta.w $1E39
	lda.w #$FFFF
	sta.w $1E1F
	lda.w #$007E
	sta.b $8F
	lda.w #$3136
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
	sta.w $1E1F
	dey
	lda.b [a1],y
	and.w #$00F0
	beq .1x
	lda.w $1E1F
	clc
	adc.w #$001A
	sta.w $1E1F
.1x:
	stz.b a2
	jsl.l GetPlayerCount
	lda.b d0
	sta.w $1E21
	jsl.l GoalieCount
	lda.b d0
	sta.w $1E23
	ldx.w #$0000
.12:
	phx
	cpx.w $1E21
	bmi .t1x
	jmp.w .16

.t1x:
	jsl.l CODE_9C9EC5
	lda.b $A7
	sec
	sbc.w $1E33
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
	sbc.w $1E31
	beq .3x
	bmi .t1xxx
	bvs .3x
	bra .13

.t1xxx:
	bvs .13
.3x:
	lda.b $A7
	sec
	sbc.w $1E37
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
	sbc.w $1E35
	beq .6
	bmi .t1xxxxxx
	bvs .6
	bra .14

.t1xxxxxx:
	bvs .14
.6:
	lda.b $A7
	sec
	sbc.w $1E3B
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
	sbc.w $1E39
	beq .11
	bmi .t1xxxxxxxx
	bvs .11
	bra .15

.t1xxxxxxxx:
	bvs .15
.11:
	bra .16
.13:
	lda.w $1E2B
	sta.w $1E25
	lda.w $1E33
	sta.w $1E29
	lda.w $1E31
	sta.w $1E27
	stx.w $1E2B
	lda.b $A7
	sta.w $1E33
	lda.b d0
	sta.w $1E31
	ldx.w $1E25
	lda.w $1E29
	sta.b $A7
	lda.w $1E27
	sta.b d0
.14:
	lda.w $1E2D
	sta.w $1E25
	lda.w $1E37
	sta.w $1E29
	lda.w $1E35
	sta.w $1E27
	stx.w $1E2D
	lda.b $A7
	sta.w $1E37
	lda.b d0
	sta.w $1E35
	ldx.w $1E25
	lda.w $1E29
	sta.b $A7
	lda.w $1E27
	sta.b d0
.15:
	stx.w $1E2F
	lda.b $A7
	sta.w $1E3B
	lda.b d0
	sta.w $1E39
.16:
	plx
	inx
	lda.w $1E21
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
	sta.w $1E21
	jsl.l GoalieCount
	lda.b d0
	clc
	adc.w #$001A
	sta.w $1E23
.1xxx:
	cpx.w #$0034
	bpl .t1xxxxxxxxx
	jmp.w .12

.t1xxxxxxxxx:
	rtl
