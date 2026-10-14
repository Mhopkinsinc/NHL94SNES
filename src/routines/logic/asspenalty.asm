; Assignment: the player skates to the penalty box
asspenalty:
	lda.w pflags,x
	bit.w #$0002
	bne .t1
	jmp.w .2

.t1:
	jsl.l .9
	lda.w pflags,x
	and.w #$FFF9
	ora.w #$1000
	sta.w pflags,x
	lda.w #$0000
	sta.b d4
	jsl.l setpads
	stz.w $1023,x
	lda.w #$0008
	sta.w $10A3,x
	jsl.l PenBoxSpot
	lda.b $08
	sta.b d1
	sta.w $1063,x
	lda.w #$0088
	sta.w $1043,x
	stz.w $1003,x
	lda.w pflags,x
	ora.w #$8000
	sta.w pflags,x
	stz.w Wallcos,x
	stz.w Wallsin,x
	lda.w #$0384
	sta.w $1083,x
.2:
	lda.w $1083,x
	sec
	sbc.w $0ADB
	sta.w $1083,x
	bpl .6
.1:
	jmp.w .7
.3:
	rtl
.4:
	lda.w $1043,x
	sta.b d0
	lda.w $1063,x
	sta.b d1
	lda.w #rtss>>16
	sta.b $8B
	lda.w #rtss
	sta.b a0
	jml.l skateto
.6:
	lda.w Ypos,x
	sec
	sbc.w $1063,x
	cmp.w #$FFF3
	bmi .4
	cmp.w #$000D
	bpl .4
	lda.w Xpos,x
	sec
	sbc.w $1043,x
	sta.b d0
	sec
	sbc.w #$FFE8
	bmi .4
	lda.w $1003,x
	sec
	sbc.b d7
	sta.w $1003,x
	bpl .3
	adc.w #$0008
	sta.w $1003,x
	cpx.w puckc
	bne .2x
.1x:
	lda.w #$FFFF
	sta.w puckc
	lda.w #$003C
	sta.w $1203,x
.2x:
	lda.w #SPAglide
	sta.w $1563,x
	jsl.l SetSPAFromA
	lda.w #$0006
	sta.b d2
	lda.w $14A3,x
	beq .3x
	lda.w #$0002
	sta.b d2
.3x:
	lda.w facedir,x
	cmp.b d2
	beq .5
.4x:
	inc a
	and.w #$0007
	sta.w facedir,x
.5:
	stz.w $0EE3,x
	lda.w #$1000
	sta.w $0EC3,x
	lda.b d0
	sec
	sbc.w #$FFF8
	bmi .8
	stz.w $0EC3,x
	lda.w facedir,x
	cmp.b d2
	bne .8
.7:
	lda.w $1063,x
	sta.w Ypos,x
	lda.w #$0088
	sta.w Xpos,x
	lda.w #$0002
	sta.w facedir,x
	sta.w pfalock,x
	lda.w #SPAwallright
	jsl.l SetSPAFromA
	lda.w pflags,x
	and.w #$BFFF
	sta.w pflags,x
	lda.w #$000E
	sta.b d0
	jml.l assreplace
.8:
	rtl
.9:
	ldy.b a2
	lda.w $19D0,y
	cmp.w #$0004
	bcc .3xx
.1xx:
	sta.b d1
	lda.w #$0006
	sta.b d0
	lda.w tmsort,y
	tax
	ldy.w #$0000
.loop:
	lda.w position,x
	bmi .2xx
	beq .2xx
	iny
.2xx:
	inx
	inx
	dec.b d0
	bne .loop
	cpy.b d1
	beq .4xx
	bcc .4xx
.3xx:
	ldx.b $E4
	lda.w $19D4,x
	bpl .t1x
	jmp.w .8

.t1x:
	sta.b d4
	jsl.l PassPadToTeammate
	rtl
.4xx:
	cpy.w #$0003
	bne .2xxx
	ldx.b a2
	ldy.w $0AF9,x
.loopx:
	iny
	iny
	cpy.w #$000A
	bne .1xxx
	ldy.w #$0000
.1xxx:
	lda.w $19F6,y
	bpl .loopx
	and.w #$00FF
	cmp.b a2
	bne .loopx
	sta.w $19F6,y
	inc a
	inc a
	lsr a
	sta.w $1C84,y
.2xxx:
	ldx.b a2
	ldy.w $0AF9,x
	bra .6x
.5x:
	iny
	iny
	cpy.w #$000A
	bne .6x
	ldy.w #$0000
.6x:
	lda.w $19F6,y
	cmp.b a2
	bne .5x
	ora.w #$FF00
	sta.w $19F6,y
	lda.w #$0000
	sta.w $1C84,y
	phy
	iny
	iny
	cpy.w #$000A
	bne .1xxxx
	ldy.w #$0000
.1xxxx:
	tya
	sta.w $0AF9,x
	ply
	ldx.w $19EC,y
	lda.w #$FFFF
	sta.w $19EC,y
	sta.w $19D4,x
	jmp.w .3xx
