; Assignment: a wing on offense skates to a spot in the zone of the puck
asswingo:
	cpx.w puckc
	beq .3
	ldy.w puckc
	bmi .8
	lda.w pfteam,x
	cmp.w pfteam,y
	beq .8
	lda.w #$0003
	sta.b d0
	jmp.w assreplace
.1:
	rtl
.2:
	jmp.w assnothing
.3:
	lda.w #$0011
	sta.b d0
	jmp.w assinsert
.8:
	lda.w gmclock
	bne .2
	jsl.l check4bench
	lda.w $19D4,x
	bpl .1
	lda.w pflags,x
	bit.w #$0002
	beq .1x
	and.w #$FFFD
	sta.w pflags,x
	lda.w #$FFFF
	sta.w $1083,x
	stz.w $1003,x
	stz.w $1023,x
	lda.w #$0008
	sta.w $10A3,x
.1x:
	lda.w $1003,x
	sec
	sbc.b d7
	sta.w $1003,x
	bmi .t1
	jmp.w .7

.t1:
	clc
	adc.w $1343,x
	bpl .2x
.1xx:
	lda.w #$0000
.2x:
	sta.w $1003,x
	lda.w pucky
	sta.b d0
	lda.w puckvy
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	bit.w #$0200
	beq .3x
	ora.w #$FC00
.3x:
	clc
	adc.b d0
	sta.b d3
	lda.w pfgoal,x
	bne .4
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
	lda.w #$0000
	sec
	sbc.b d3
	sta.b d3
.4:
	stz.b d2
	lda.b d3
	sec
	sbc.w #$FFA8
	bmi .5
	lda.w #$0008
	sta.b d2
	lda.b d0
	sec
	sbc.w #$0058
	bmi .5
	ldy.b a2
	lda.w tmflags,y
	bit.w #$0010
	bne .5
	asl.b d2
	lda.b d3
	sec
	sbc.w #$0108
	bmi .5
	lda.w #$0018
	sta.b d2
.5:
	lda.b d2
	cmp.w $1083,x
	bne .6
	lda.w $0792
	cmp.w #$0200
	bcs .7
.6:
	lda.b d2
	sta.w $1083,x
	tay
	lda.w #$009E
	sta.b $8B
	lda.w #DATA8_9E8BB7
	sta.b a0
	iny
	iny
	lda.b [a0],y
	dey
	dey
	jsl.l randomd0s
	adc.b [a0],y
	sta.w $1043,x
	tya
	clc
	adc.w #$0006
	tay
	lda.b [a0],y
	dey
	dey
	jsl.l randomd0s
	adc.b [a0],y
	sta.w $1063,x
.7:
	lda.w $1043,x
	sta.b d0
	lda.w position,x
	cmp.w #$0005
	beq .1xxx
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
.1xxx:
	lda.w $1063,x
	sta.b d1
	lda.w pfgoal,x
	bne .2xx
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
	lda.w #$0000
	sec
	sbc.b d1
	sta.b d1
.2xx:
	lda.w #$009E
	sta.b $8B
	lda.w #$8904
	sta.b a0
	jml.l skateto

.t1x:
	rtl
