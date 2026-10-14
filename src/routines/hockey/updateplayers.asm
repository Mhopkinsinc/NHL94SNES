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
CODE_9F86A4:
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
	jmp.w CODE_9F875F

.t2:
	lda.w position,x
	bpl .t1
	jmp.w CODE_9F8834

.t1:
	bne CODE_9F86E2
	lda.w Ypos,x
	bpl .t3
	stx.w $0B9F
	bra CODE_9F86E2

.t3:
	stx.w $0B9D
CODE_9F86E2:
	jsl.l CODE_9EA419
	lda.w $1203,x
	sec
	sbc.w $0ADB
	bpl .1
	lda.w #$0000
.1:
	sta.w $1203,x
	lda.w $1223,x
	sec
	sbc.w $0ADB
	bpl .2
	lda.w #$0000
.2:
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
	jsl.l CODE_9FC757
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
	bne CODE_9F8796
.7:
	lda.w SPA,x
	cmp.w #$F90E
	bne .t1
	jmp.w CODE_9F8834

.t1:
	cmp.w #$FC76
	bcc .t2
	jmp.w CODE_9F8834

.t2:
	cpx.w #$001C
	bne CODE_9F875F
	lda.w $0DF9
	bne CODE_9F8796
CODE_9F875F:
	txy
	ldx.w $0ADB
	lda.l CODE_9F8B64,x
	and.w #$00FF
	sta.b d2
	lda.w pflags,y
	bit.w #$0001
	beq .1
	lda.l DATA8_9F8B6F-1,x
	and.w #$00FF
	sta.b d2
.1:
	ldx.w $0EC3,y
	lda.b d2
	jsl.l Mul16x8HiXS
	sta.w $0EC3,y
	ldx.w $0EE3,y
	lda.b d2
	jsl.l Mul16x8HiXS
	sta.w $0EE3,y
	tyx
CODE_9F8796:
	lda.w $0CDF
	sta.b $0C
	lda.w $0EC3,x
	beq .1
	tax
	lda.b $0C
	jsl.l CODE_808FC9
	ldx.b $E4
	lda.b $08
	clc
	adc.w $0D77,x
	sta.w $0D77,x
	lda.b $0A
	adc.w Xpos,x
	sta.w Xpos,x
.1:
	lda.w $0EE3,x
	beq .2
	tax
	lda.b $0C
	jsl.l CODE_808FC9
	ldx.b $E4
	lda.b $08
	clc
	adc.w $0DD9,x
	sta.w $0DD9,x
	lda.b $0A
	adc.w Ypos,x
	sta.w Ypos,x
.2:
	cpx.w #$001C
	bne CODE_9F8834
	lda.w $0DF9
	bmi CODE_9F8834
	bne .3
	lda.w $0E01
	beq CODE_9F8834
.3:
	lda.w $0E01
	sec
	sbc.w $0CE1
	sta.w $0E01
	tax
	lda.w $0CDF
	jsl.l CODE_808FC9
	ldx.b $E4
	lda.b $08
	clc
	adc.w $0DFD
	sta.w $0DFD
	lda.b $0A
	adc.w $0DF9
	sta.w $0DF9
	bpl CODE_9F8834
	stz.w $0DF9
	stz.w $0DFD
	lda.w $0E01
	eor.w #$FFFF
	inc a
	lsr a
	sta.w $0E01
	cmp.w #$0200
	bmi CODE_9F8834
	asl a
	asl a
	sta.b $0C
	stz.b $0E
	lda.w #$0007
	jsl.l CODE_9C9AD0
CODE_9F8834:
	lda.w $0D71
	sec
	sbc.w Xpos,x
	sta.b d0
	bpl .1
	eor.w #$FFFF
	inc a
.1:
	pha
	lsr a
	lsr a
	tax
	jsl.l CODE_808F4C
	ldx.b $E4
	sta.w $0B3D,x
	lda.w pucky
	sec
	sbc.w Ypos,x
	sta.b d1
	bpl .2
	eor.w #$FFFF
	inc a
.2:
	pha
	lsr a
	lsr a
	tax
	jsl.l CODE_808F4C
	ldx.b $E4
	clc
	adc.w $0B3D,x
	sta.w $0B3D,x
	cpx.w #$0018
	bcs CODE_9F88A8
	sta.b $14
	lda.w position,x
	bmi CODE_9F88A8
	beq CODE_9F88A8
	lda.w pflags,x
	and.w #$1000
	ora.w pfalock,x
	bne CODE_9F88A8
	lda.b $14
	cpx.w #$000C
	bcs .t1
	cmp.w $17AE
	bcs CODE_9F88A8
	sta.w $17AE
	stx.w $17B2
	bra CODE_9F88A8

.t1:
	cmp.w $17B0
	bcs CODE_9F88A8
	sta.w $17B0
	stx.w $17B4
CODE_9F88A8:
	ply
	pla
	jsl.l CODE_9CA568
	ldx.b $E4
	sta.w $0B1D,x
	cpx.w #$0018
	bcs CODE_9F88F6
	cmp.w #$001E
	bcs CODE_9F88F6
	lda.w iflags
	bit.w #$0004
	beq CODE_9F88F6
	bit.w #$0001
	bne CODE_9F88F6
	and.w #$0002
	beq .t1
	lda.w pfgoal,x
	bne CODE_9F88F6
	bra CODE_9F88DB

.t1:
	lda.w pfgoal,x
	beq CODE_9F88F6
CODE_9F88DB:
	lda.w $0DF9
	cmp.w #$000D
	bcs CODE_9F88F6
	lda.w puckvy
	cmp.w #$2400
	bcs CODE_9F88F6
	cmp.w #$DC00
	bmi CODE_9F88F6
	lda.w #$0005
	trb.w iflags
CODE_9F88F6:
	jsl.l vtoa
	sta.w $0B5D,x
	dex
	dex
	bmi .t1
	jmp.w CODE_9F86A4

.t1:
	lda.w $0DCF
	cmp.w #$011F
	bmi .1
	lda.w #$011F
.1:
	sta.w $0DCF
	lda.w $0DD1
	cmp.w #$FED2
	bpl .2
	lda.w #$FED2
.2:
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
CODE_9F8947:
	stx.b a3
	stx.b $E4
	cpx.w #$000C
	bne .1
	lda.w #$0002
	sta.b $EA
	lda.w #$0000
	sta.b $EC
.1:
	lda.w #$FFFF
	sta.b $E6
	lda.w position,x
	bpl .t2
	jmp.w CODE_9F8ADD

.t2:
	txa
	lsr a
	sta.b d6
	cpx.w shotPlIdx
	bne .1x
	lda.w sfhormode
	bne .1x
	lda.w #$0000
	sta.b d4
	jsl.l CODE_9BC174
.1x:
	cpx.w #$0018
	bcs .t1
	lda.w $19D4,x
	bmi .t1
	tay
	lda.w $0ADD,y
	bne .t1
	lda.w #$0001
	sta.w $0ADD,y
	lda.w JoyPad,y
	sta.b d3
	lda.w $0AAE,y
	sta.b d2
	lda.w $0AB8,y
	sta.b d1
	lda.w $0AA4,y
	sta.b d0
	iny
	iny
	sty.b d4
	jsl.l CODE_9FC1B9
	bra .t1

.t1:
	lda.w pfalock,x
	bne .1xx
	lda.w $0B7D,x
	asl a
	asl a
	tax
	lda.l asstab,x
	sta.w $1D5A
	lda.l asstab+1,x
	sta.w $1D5B
	ldx.b $E4
	jsl.l CODE_9FC757
	jsl.l $001D59
.1xx:
	lda.w position,x
	ora.w gmclock
	bne CODE_9F8A44
	cpx.w #$0018
	bcs CODE_9F8A44
	cpx.w shotPlIdx
	beq CODE_9F8A44
	lda.w $0B05,x
	bit.w #$0001
	bne CODE_9F8A44
	lda.w Xpos,x
	cmp.w #$FFD5
	bpl .t3
	cmp.w #$FFCF
	bmi CODE_9F8A14
	lda.w #$FFD5
	stz.w $0EC3,x
	bra CODE_9F8A14

.t3:
	cmp.w #$002C
	bmi CODE_9F8A14
	cmp.w #$0031
	bpl CODE_9F8A14
	lda.w #$002B
	stz.w $0EC3,x
CODE_9F8A14:
	sta.w Xpos,x
	lda.w Ypos,x
	bpl .t1
	cmp.w #$FF1C
	bmi CODE_9F8A44
	cmp.w #$FF21
	bpl CODE_9F8A44
	lda.w #$FF1B
	sta.w Ypos,x
	stz.w $0EE3,x
	bra CODE_9F8A44

.t1:
	cmp.w #$00E5
	bpl CODE_9F8A44
	cmp.w #$00E0
	bmi CODE_9F8A44
	lda.w #$00E5
	sta.w Ypos,x
	stz.w $0EE3,x
CODE_9F8A44:
	stz.w $1103,x
	stz.w $1123,x
	lda.w Ypos,x
	sta.b d3
	lda.w Xpos,x
	sta.b d2
	cmp.w $0E43,x
	bne .t1
	lda.b d3
	cmp.w $0E83,x
	bne .t1
	jmp.w CODE_9F8AD1

.t1:
	jsl.l checkcoll
	cpx.w #$0018
	bcs CODE_9F8AD1
	lda.w position,x
	beq CODE_9F8AD1
	lda.w pflags,x
	and.w #$8000
	ora.w sfhormode
	bne CODE_9F8AD1
	lda.w Xpos,x
	cmp.w #$FFE7
	bmi CODE_9F8AD1
	cmp.w #$0019
	bpl CODE_9F8AD1
	lda.w Ypos,x
	bit.w #$8000
	beq .1
	eor.w #$FFFF
	inc a
.1:
	sec
	sbc.w #$010D
	sta.b $00
	lda.w $0E83,x
	bit.w #$8000
	beq .2
	eor.w #$FFFF
	inc a
.2:
	sec
	sbc.w #$010D
	eor.b $00
	bmi .4
	lda.w Ypos,x
	bit.w #$8000
	beq .3
	eor.w #$FFFF
	inc a
.3:
	cmp.w #$0103
	bcc CODE_9F8AD1
	cmp.w #$0117
	bcs CODE_9F8AD1
.4:
	lda.w $0E43,x
	sta.w Xpos,x
	lda.w $0E83,x
	sta.w Ypos,x
CODE_9F8AD1:
	lda.w $0F23,x
	sec
	sbc.w $0CDD
	bpl CODE_9F8ADD
	lda.w #$0000
CODE_9F8ADD:
	sta.w $0F23,x
	inx
	inx
	cpx.w #$0020
	beq .t1
	jmp.w CODE_9F8947

.t1:
	lda.w $0DF9
	cmp.w #$0018
	bcs .2
	lda.w $0D71
	cmp.w #$FF78
	bpl .1
	lda.w #$FF78
	sta.w $0D71
	ldx.w $0DB3
	cpx.w #$018C
	bne .1
	sta.w $0D73
.1:
	lda.w $0D71
	cmp.w #$0088
	bmi .2
	lda.w #$0088
	sta.w $0D71
	ldx.w $0DB3
	cpx.w #$018C
	bne .2
	sta.w $0D73
.2:
	lda.w $0DF9
	bne .4
	lda.w pucky
	cmp.w #$FEC2
	bmi .4
	cmp.w #$013E
	bpl .4
	lda.w pucky
	cmp.w #$FEDB
	bpl .3
	lda.w #$FEDB
	sta.w pucky
	sta.w $0DD5
.3:
	lda.w pucky
	cmp.w #$012A
	bmi .4
	lda.w #$012A
	sta.w pucky
	sta.w $0DD5
.4:
	lda.w shotPlIdx
	bmi CODE_9F8B64
	lda.w pucky
	sta.l $7E30F4
CODE_9F8B64:
	rtl
