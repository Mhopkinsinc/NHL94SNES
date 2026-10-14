; Assignment: the puck at the start of play
puckfaceoff:
	stz.w $19C0
	lda.w $1D81
	beq .t4
	lda.w $1D83
	beq .t4
	inc.w $1D87
	rtl

.t4:
	lda.w #$FFFF
	sta.w puckc
	jsl.l pucknorm_move
	lda.w pflags,x
	bit.w #$0002
	bne .t1x
.1x:
	jmp.w .9

.t1x:
	and.w #$FFFD
	sta.w pflags,x
	lda.w gameclock
	bne .t2x
.1xx:
	jml.l PeriodOver

.t2x:
	lda.w gmode
	bit.w #$0040
	beq .t1xx
.1x2:
	jml.l PeriodOver

.t1xx:
	lda.w gsp
	cmp.w #$0003
	bne .t3
.1xxx:
	lda.w $178E
	cmp.w $1790
	beq .t3
	jml.l clockcont_0

.t3:
	lda.w gmode
	bit.w #$0008
	beq .t1x2
.1x3:
	jml.l Stop4Pen

.t1x2:
	jsl.l ReturnGoalies
	lda.w #$FFFF
	sta.w $1003,x
	sta.w $1023,x
	lda.l $7E34C6
	bne .t2xx
	jmp.w .9

.t2xx:
	lda.w $1E9B
	ora.w $1E9D
	beq .t1xxx
	jmp.w .9

.t1xxx:
	lda.w #$FFFF
	sta.w $1D55
	sta.w $1D57
	lda.w #$0008
	trb.w tmflags
	trb.w $17E0
	lda.w $1C84
	ora.w $1C86
	ora.w $1C88
	ora.w $1C8A
	ora.w $1C8C
	beq .1xx2
	lda.w sfhormode
	beq .1xx2
	lda.w #$0040
	tsb.w sflags
	jsl.l ClrHor
.1xx2:
	lda.l $7E344E
	bne .2
	lda.w $19D0
	beq .2
	jsl.l .11
	lsr a
	sta.b d0
	jsl.l .5
.2:
	lda.l $7E344E
	bne .3
	lda.w $19D2
	beq .3
	jsl.l .12
	lsr a
	sta.b d0
	jsl.l .6
.3:
	lda.w #$0000
	sta.l $7E344E
	stz.b a1
	lda.w #$0002
	sta.b a2
	sta.b d0
	jsl.l .1
	jmp.w .9
.1:
	lda.l $7E34C6
	bne .t1
	jmp.w .8

.t1:
	lda.b d0
	cmp.w $1C84
	bne .t3x
	jmp.w .8

.t3x:
	cmp.w $1C86
	bne .t1xxxx
	jmp.w .8

.t1xxxx:
	cmp.w $1C88
	bne .t2
	jmp.w .8

.t2:
	cmp.w $1C8A
	bne .t1xxxxx
	jmp.w .8

.t1xxxxx:
	cmp.w $1C8C
	bne .4
	jmp.w .8
.4:
	jsl.l CompLine
	jsl.l setpersonel
	jml.l printscores1
.5:
	lda.l $7E34C6
	cmp.w #$0002
	bne .7
	stz.b a2
	lda.w #$0002
	sta.b a1
	lda.w #$0001
	sta.b d0
	bra .4
.6:
	lda.l $7E34C6
	cmp.w #$0002
	bne .7
	stz.b a1
	lda.w #$0002
	sta.b a2
	sta.b d0
	bra .4
.7:
	ldy.b a3
	sty.b a2
	lda.b d0
	asl a
	sta.b d0
	sta.b a3
	tax
	phy
	ldy.w #$0000
	lda.w pfteam,x
	beq .1xxxx
	ldy.w #$0002
.1xxxx:
	lda.w #$FFFF
	sta.w $1D55,y
	jsl.l SetLCmode
	ply
	sty.b a2
	ldx.b a3
	phy
	ldy.w #$0000
	lda.w pfteam,x
	beq .2x
	ldy.w #$0002
.2x:
	lda.w tmflags,y
	ply
	bit.w #$0008
	beq .3x
	lda.w pfteam,x
	beq .t1xxxxxx
	lda.w #$0168
	sta.w $1023,y
	txa
	lsr a
	sta.w $1063,y
	bra .3x

.t1xxxxxx:
	lda.w #$0258
	sta.w $1003,y
	txa
	lsr a
	sta.w $1043,y
.3x:
	ldx.b a2
	ldy.b a3
	sty.b a2
	stx.b a3
.8:
	rtl
.9:
	stz.w $1E9D
	stz.b d0
	jsl.l .t1xxxxxxx
	lda.w #$0020
	sta.b d0
	jsl.l .t1xxxxxxx
	ldx.b a3
	lda.w $1003,x
	bpl .8
	lda.w $1023,x
	bpl .8
	stz.b a2
	lda.w #$0001
	sta.b d0
	inc a
	sta.b a1
	jsl.l .1
	lda.w #$001C
	sta.b d0
	ldx.b a3
	jml.l assreplace

.t1xxxxxxx:
	lda.b a3
	clc
	adc.b d0
	tay
	lda.w $1003,y
	bmi .8
.1xxxxx:
	lda.w $1043,y
	asl a
	sta.b d1
	tay
	stz.b a0
	stz.b a2
	lda.w pfteam,y
	beq .2xx
	lda.w #$0002
	sta.b a2
.2xx:
	phy
	ldy.b a2
	lda.w tmflags,y
	ply
	bit.w #$0008
	bne .t2xxx
	lda.b a3
	clc
	adc.b d0
	tay
	lda.w $1003,y
	ora.w #$FF00
	sta.w $1003,y
	ldx.b a3
	jmp.w SetLCmode2

.t2xxx:
	lda.b a3
	clc
	adc.b d0
	tay
	lda.w $1003,y
	sec
	sbc.b d7
	sta.w $1003,y
	bmi .t1xxxxxxxx
	jmp.w .8

.t1xxxxxxxx:
	ldx.b a3
	phx
	ldx.b d1
	stx.b a3
	phy
	ldy.w #$0000
	lda.w pfteam,x
	beq .1xxxxxx
	ldy.w #$0002
.1xxxxxx:
	lda.w tmflags,y
	ply
	bit.w #$0008
	beq .2xxx
	stz.b d2
	jsl.l lcfound
	jsl.l SetLCmode2
.2xxx:
	plx
	stx.b a3
	rtl
.10:
	ldy.w #$0000
.loop:
	lda.w $19F6,y
	cmp.b a2
	beq .t1xxxxxxxxx
	iny
	iny
	cpy.w #$000A
	bcc .loop
	lda.w #$FFFF
	bra .1xxxxxxx

.t1xxxxxxxxx:
	tya
.1xxxxxxx:
	rtl
.11:
	lda.w #$0000
	sta.b a2
	jsl.l .10
	tay
	lda.w $19EC,y
	rtl
.12:
	lda.w #$0002
	sta.b a2
	jsl.l .10
	tay
	lda.w $19EC,y
	rtl
