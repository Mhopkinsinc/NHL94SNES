; Assignment: the goalie skates out to a loose puck
assgoalietopuck:
	lda.w #$0006
	ora.w $0B05,x
	sta.w $0B05,x
	lda.w Xpos,x
	cmp.w #$FFD8
	bmi .2
	cmp.w #$0029
	bpl .2
	lda.w Ypos,x
	bit.w #$8000
	beq .1
	eor.w #$FFFF
	inc a
.1:
	sta.b $00
	cmp.w #$00E4
	bmi .2
	cmp.w #$0104
	bpl .2
	lda.w #$FFFB
	and.w $0B05,x
	sta.w $0B05,x
.2:
	lda.w Xpos,x
	cmp.w #$FFD0
	bmi .4
	cmp.w #$0031
	bpl .4
	lda.w Ypos,x
	bit.w #$8000
	beq .3
	eor.w #$FFFF
	inc a
.3:
	cmp.w #$00E4
	bmi .4
	lda.w #$FFFD
	and.w $0B05,x
	sta.w $0B05,x
.4:
	lda.w $19D4,x
	bpl .6
	lda.w gmclock
	bne .6
	jsl.l check4bench
	lda.w pflags,x
	bit.w #$0002
	beq .5
	and.w #$FFFD
	sta.w pflags,x
	stz.w $1003,x
	stz.w $0BC9
.5:
	lda.w $1003,x
	sec
	sbc.b d7
	sta.w $1003,x
	bpl .8
	lda.w $1343,x
	lsr a
	lsr a
	clc
	adc.w $1003,x
	bpl .7
	lda.w #$0000
	bra .7
.6:
	jmp.w assexit
.7:
	sta.w $1003,x
	lda.w puckc
	bpl .6
	lda.w puckvy
	ldy.w pfgoal,x
	beq .1x
	eor.w #$FFFF
	inc a
.1x:
	cmp.w #$F800
	bmi .6
	stz.b a1
	lda.w #$0002
	sta.b a2
	lda.w pfteam,x
	beq .2x
	stz.b a2
	lda.w #$0002
	sta.b a1
.2x:
	ldy.b a2
	lda.w $17AE,y
	cmp.w #$0096
	bcc .6
.8:
	jsr.w CODE_9EDC44
	jsl.l vtoa
	jsl.l CODE_9EDC06
	asl.w $12E3,x
	jsl.l .t2
	lsr.w $12E3,x
	rtl

.t2:
	lda.w $1023,x
	sec
	sbc.b d7
	sta.w $1023,x
	bmi .t1
	jmp.w .5x

.t1:
	adc.w #$0005
	sta.w $1023,x
	lda.w puckvx
	xba
	and.w #$00FF
	bit.w #$0080
	beq .1xx
	ora.w #$FF00
.1xx:
	clc
	adc.w $0D71
	sta.b d0
	lda.w puckvy
	xba
	and.w #$00FF
	bit.w #$0080
	beq .2xx
	ora.w #$FF00
.2xx:
	clc
	adc.w pucky
	sta.b d1
	jsl.l avdgoal
	lda.b d1
	pha
	lda.b d0
	pha
	txa
	jsl.l GetHot
	lda.b d0
	eor.w #$FFFF
	inc a
	sec
	sbc.w $0EC4,x
	and.w #$00FF
	bit.w #$0080
	beq .3x
	ora.w #$FF00
.3x:
	clc
	adc.b $01,s
	sec
	sbc.w Xpos,x
	sta.b d0
	lda.b d1
	eor.w #$FFFF
	inc a
	sec
	sbc.w $0EE4,x
	and.w #$00FF
	bit.w #$0080
	beq .4x
	ora.w #$FF00
.4x:
	clc
	adc.b $03,s
	sec
	sbc.w Ypos,x
	sta.b d1
	pla
	pla
	jsl.l vtoa
	lda.b d0
	sta.w $10A3,x
.5x:
	lda.w $10A3,x
	sta.b d0
	jml.l doplayeracc
