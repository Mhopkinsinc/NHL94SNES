; Animation, speed, position, input and assignment for every object
updateplayers:
	lda.w #$FFFF
	sta.w $0B9D
	sta.w $0B9F
	sta.w $17AE
	sta.w $17B0
	sta.w $17B2
	sta.w $17B4
	lda.w $0DF9
	sta.w $0DFF
	ldx.w #$001E
.2:
	stx.b $E4
	lda.w Xpos,x
	sta.w $0E43,x
	lda.w $0D77,x
	sta.w $0E63,x
	lda.w Ypos,x
	sta.w $0E83,x
	lda.w $0DD9,x
	sta.w $0EA3,x
	cpx.w #$0018
	beq .1
	cpx.w #$001A
	bne .t2
.1:
	jmp.w .9

.t2:
	lda.w position,x
	bpl .t1
	jmp.w .11

.t1:
	bne .8
	lda.w Ypos,x
	bpl .t3
	stx.w $0B9F
	bra .8

.t3:
	stx.w $0B9D
.8:
	jsl.l updateanim
	lda.w $1203,x
	sec
	sbc.w $0ADB
	bpl .1x
	lda.w #$0000
.1x:
	sta.w $1203,x
	lda.w $1223,x
	sec
	sbc.w $0ADB
	bpl .2x
	lda.w #$0000
.2x:
	sta.w $1223,x
	lda.w sflags3
	bit.w #$0020
	beq .4
	lda.w pnum,x
	and.w #$00FF
	cmp.w #$0080
	bcc .3
	ora.w #$FF00
.3:
	sta.b d0
	cmp.w #$0000
	bmi .4
	asl.b d0
	jsl.l loadTeamStruct
.4:
	lda.w $0BEB,x
	beq .6
	sec
	sbc.w $0ADB
	bpl .5
	lda.w #$0000
.5:
	sta.w $0BEB,x
.6:
	cpx.w $0D07
	bne .7
	lda.w $1E89
	bne .10
.7:
	lda.w SPA,x
	cmp.w #SPAinjury1
	bne .t1x
	jmp.w .11

.t1x:
	cmp.w #DATA8_9DFC76
	bcc .t2x
	jmp.w .11

.t2x:
	cpx.w #$001C
	bne .9
	lda.w $0DF9
	bne .10
.9:
	txy
	ldx.w $0ADB
	lda.l .20,x
	and.w #$00FF
	sta.b d2
	lda.w pflags,y
	bit.w #$0001
	beq .1xx
	lda.l .22-1,x
	and.w #$00FF
	sta.b d2
.1xx:
	ldx.w $0EC3,y
	lda.b d2
	jsl.l Mul16x8HiXS
	sta.w $0EC3,y
	ldx.w $0EE3,y
	lda.b d2
	jsl.l Mul16x8HiXS
	sta.w $0EE3,y
	tyx
.10:
	lda.w $0CDF
	sta.b $0C
	lda.w $0EC3,x
	beq .1xxx
	tax
	lda.b $0C
	jsl.l Mul16x8XS
	ldx.b $E4
	lda.b $08
	clc
	adc.w $0D77,x
	sta.w $0D77,x
	lda.b $0A
	adc.w Xpos,x
	sta.w Xpos,x
.1xxx:
	lda.w $0EE3,x
	beq .2xx
	tax
	lda.b $0C
	jsl.l Mul16x8XS
	ldx.b $E4
	lda.b $08
	clc
	adc.w $0DD9,x
	sta.w $0DD9,x
	lda.b $0A
	adc.w Ypos,x
	sta.w Ypos,x
.2xx:
	cpx.w #$001C
	bne .11
	lda.w $0DF9
	bmi .11
	bne .3x
	lda.w $0E01
	beq .11
.3x:
	lda.w $0E01
	sec
	sbc.w $0CE1
	sta.w $0E01
	tax
	lda.w $0CDF
	jsl.l Mul16x8XS
	ldx.b $E4
	lda.b $08
	clc
	adc.w $0DFD
	sta.w $0DFD
	lda.b $0A
	adc.w $0DF9
	sta.w $0DF9
	bpl .11
	stz.w $0DF9
	stz.w $0DFD
	lda.w $0E01
	eor.w #$FFFF
	inc a
	lsr a
	sta.w $0E01
	cmp.w #$0200
	bmi .11
	asl a
	asl a
	sta.b $0C
	stz.b $0E
	lda.w #$0007
	jsl.l sfx
.11:
	lda.w $0D71
	sec
	sbc.w Xpos,x
	sta.b d0
	bpl .1xxxx
	eor.w #$FFFF
	inc a
.1xxxx:
	pha
	lsr a
	lsr a
	tax
	jsl.l Mul8U
	ldx.b $E4
	sta.w $0B3D,x
	lda.w pucky
	sec
	sbc.w Ypos,x
	sta.b d1
	bpl .2xxx
	eor.w #$FFFF
	inc a
.2xxx:
	pha
	lsr a
	lsr a
	tax
	jsl.l Mul8U
	ldx.b $E4
	clc
	adc.w $0B3D,x
	sta.w $0B3D,x
	cpx.w #$0018
	bcs .12
	sta.b $14
	lda.w position,x
	bmi .12
	beq .12
	lda.w pflags,x
	and.w #$1000
	ora.w pfalock,x
	bne .12
	lda.b $14
	cpx.w #$000C
	bcs .t1xx
	cmp.w $17AE
	bcs .12
	sta.w $17AE
	stx.w $17B2
	bra .12

.t1xx:
	cmp.w $17B0
	bcs .12
	sta.w $17B0
	stx.w $17B4
.12:
	ply
	pla
	jsl.l CODE_9CA568
	ldx.b $E4
	sta.w $0B1D,x
	cpx.w #$0018
	bcs .14
	cmp.w #$001E
	bcs .14
	lda.w iflags
	bit.w #$0004
	beq .14
	bit.w #$0001
	bne .14
	and.w #$0002
	beq .t1xxx
	lda.w pfgoal,x
	bne .14
	bra .13

.t1xxx:
	lda.w pfgoal,x
	beq .14
.13:
	lda.w $0DF9
	cmp.w #$000D
	bcs .14
	lda.w puckvy
	cmp.w #$2400
	bcs .14
	cmp.w #$DC00
	bmi .14
	lda.w #$0005
	trb.w iflags
.14:
	jsl.l vtoa
	sta.w $0B5D,x
	dex
	dex
	bmi .t1xxxx
	jmp.w .2

.t1xxxx:
	lda.w $0DCF
	cmp.w #$011F
	bmi .1xxxxx
	lda.w #$011F
.1xxxxx:
	sta.w $0DCF
	lda.w $0DD1
	cmp.w #$FED2
	bpl .2xxxx
	lda.w #$FED2
.2xxxx:
	sta.w $0DD1
	ldy.w #$000C
	lda.w #$000F
.loop:
	sta.w $0AE7,y
	dey
	dey
	bpl .loop
	ldx.w #$0008
	lda.w #$0000
.loop2:
	sta.w $0ADD,x
	dex
	dex
	bpl .loop2
	lda.w #$0000
	sta.b $EA
	lda.w #$0002
	sta.b $EC
	ldx.w #$0000
.15:
	stx.b a3
	stx.b $E4
	cpx.w #$000C
	bne .1xxxxxx
	lda.w #$0002
	sta.b $EA
	lda.w #$0000
	sta.b $EC
.1xxxxxx:
	lda.w #$FFFF
	sta.b $E6
	lda.w position,x
	bpl .t2xx
	jmp.w .19

.t2xx:
	txa
	lsr a
	sta.b d6
	cpx.w puckc
	bne .1xxxxxxx
	lda.w sfhormode
	bne .1xxxxxxx
	lda.w #$0000
	sta.b d4
	jsl.l setpads
.1xxxxxxx:
	cpx.w #$0018
	bcs .t1xxxxx
	lda.w $19D4,x
	bmi .t1xxxxx
	tay
	lda.w $0ADD,y
	bne .t1xxxxx
	lda.w #$0001
	sta.w $0ADD,y
	lda.w JoyPad,y
	sta.b d3
	lda.w padchange,y
	sta.b d2
	lda.w padnew,y
	sta.b d1
	lda.w paddir,y
	sta.b d0
	iny
	iny
	sty.b d4
	jsl.l doinput
	bra .t1xxxxx

.t1xxxxx:
	lda.w pfalock,x
	bne .1xxxxxxxx
	lda.w $0B7D,x
	asl a
	asl a
	tax
	lda.l asstab,x
	sta.w jmlvector+1
	lda.l asstab+1,x
	sta.w jmlvector+2
	ldx.b $E4
	jsl.l loadTeamStruct
	jsl.l jmlvector
.1xxxxxxxx:
	lda.w position,x
	ora.w gmclock
	bne .17
	cpx.w #$0018
	bcs .17
	cpx.w puckc
	beq .17
	lda.w $0B05,x
	bit.w #$0001
	bne .17
	lda.w Xpos,x
	cmp.w #$FFD5
	bpl .t3x
	cmp.w #$FFCF
	bmi .16
	lda.w #$FFD5
	stz.w $0EC3,x
	bra .16

.t3x:
	cmp.w #$002C
	bmi .16
	cmp.w #$0031
	bpl .16
	lda.w #$002B
	stz.w $0EC3,x
.16:
	sta.w Xpos,x
	lda.w Ypos,x
	bpl .t1xxxxxx
	cmp.w #$FF1C
	bmi .17
	cmp.w #$FF21
	bpl .17
	lda.w #$FF1B
	sta.w Ypos,x
	stz.w $0EE3,x
	bra .17

.t1xxxxxx:
	cmp.w #$00E5
	bpl .17
	cmp.w #$00E0
	bmi .17
	lda.w #$00E5
	sta.w Ypos,x
	stz.w $0EE3,x
.17:
	stz.w Wallcos,x
	stz.w Wallsin,x
	lda.w Ypos,x
	sta.b d3
	lda.w Xpos,x
	sta.b d2
	cmp.w $0E43,x
	bne .t1xxxxxxx
	lda.b d3
	cmp.w $0E83,x
	bne .t1xxxxxxx
	jmp.w .18

.t1xxxxxxx:
	jsl.l checkcoll
	cpx.w #$0018
	bcs .18
	lda.w position,x
	beq .18
	lda.w pflags,x
	and.w #$8000
	ora.w sfhormode
	bne .18
	lda.w Xpos,x
	cmp.w #$FFE7
	bmi .18
	cmp.w #$0019
	bpl .18
	lda.w Ypos,x
	bit.w #$8000
	beq .1xxxxxxxxx
	eor.w #$FFFF
	inc a
.1xxxxxxxxx:
	sec
	sbc.w #$010D
	sta.b $00
	lda.w $0E83,x
	bit.w #$8000
	beq .2xxxxx
	eor.w #$FFFF
	inc a
.2xxxxx:
	sec
	sbc.w #$010D
	eor.b $00
	bmi .4x
	lda.w Ypos,x
	bit.w #$8000
	beq .3xx
	eor.w #$FFFF
	inc a
.3xx:
	cmp.w #$0103
	bcc .18
	cmp.w #$0117
	bcs .18
.4x:
	lda.w $0E43,x
	sta.w Xpos,x
	lda.w $0E83,x
	sta.w Ypos,x
.18:
	lda.w $0F23,x
	sec
	sbc.w $0CDD
	bpl .19
	lda.w #$0000
.19:
	sta.w $0F23,x
	inx
	inx
	cpx.w #$0020
	beq .t1xxxxxxxx
	jmp.w .15

.t1xxxxxxxx:
	lda.w $0DF9
	cmp.w #$0018
	bcs .2xxxxxx
	lda.w $0D71
	cmp.w #$FF78
	bpl .1xxxxxxxxxx
	lda.w #$FF78
	sta.w $0D71
	ldx.w $0DB3
	cpx.w #$018C
	bne .1xxxxxxxxxx
	sta.w $0D73
.1xxxxxxxxxx:
	lda.w $0D71
	cmp.w #$0088
	bmi .2xxxxxx
	lda.w #$0088
	sta.w $0D71
	ldx.w $0DB3
	cpx.w #$018C
	bne .2xxxxxx
	sta.w $0D73
.2xxxxxx:
	lda.w $0DF9
	bne .4xx
	lda.w pucky
	cmp.w #$FEC2
	bmi .4xx
	cmp.w #$013E
	bpl .4xx
	lda.w pucky
	cmp.w #$FEDB
	bpl .3xxx
	lda.w #$FEDB
	sta.w pucky
	sta.w $0DD5
.3xxx:
	lda.w pucky
	cmp.w #$012A
	bmi .4xx
	lda.w #$012A
	sta.w pucky
	sta.w $0DD5
.4xx:
	lda.w puckc
	bmi .20
	lda.w pucky
	sta.l $7E30F4
.20:
	rtl
.21:
	db $FD,$FA,$F7,$F4,$F1,$EE,$EB,$E8,$E6,$E3
.22:
	db $FF,$FF,$FE,$FE,$FE,$FD,$FD,$FD,$FC,$FC
