; Assignment: the center on offense skates to a spot in the zone of the puck
asscentero:
	cpx.w puckc
	beq .3
	ldy.w puckc
	bmi .7
	lda.w pfteam,x
	cmp.w pfteam,y
	beq .7
	lda.w #$0005
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
.7:
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
	jmp.w .6

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
	lda.w pfgoal,x
	bne .3x
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
.3x:
	stz.b d2
	lda.b d0
	sec
	sbc.w #$FFA8
	bmi .4
	lda.w #$0008
	sta.b d2
	lda.b d0
	sec
	sbc.w #$0058
	bmi .4
	ldy.b a2
	lda.w tmflags,y
	bit.w #$0010
	bne .4
	asl.b d2
	lda.b d0
	sec
	sbc.w #$0108
	bmi .4
	lda.w #$0018
	sta.b d2
.4:
	lda.b d2
	cmp.w $1083,x
	bne .5
	lda.w $0794
	cmp.w #$0200
	bcs .6
.5:
	lda.b d2
	sta.w $1083,x
	tay
	lda.w #$009E
	sta.b $8B
	lda.w #DATA8_9E8553
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
.6:
	lda.w $1043,x
	sta.b d0
	lda.w $1063,x
	sta.b d1
	lda.w pfgoal,x
	bne .1xxx
	lda.w #$0000
	sec
	sbc.b d1
	sta.b d1
.1xxx:
	lda.w #$009E
	sta.b $8B
	lda.w #$8904
	sta.b a0
	jml.l skateto

.t1x:
	rtl
