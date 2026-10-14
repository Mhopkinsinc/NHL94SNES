; Assignment: the center on defense, halfway between the puck and his goal
asscenterd:
	ldy.w puckc
	bmi .4
	lda.w pfteam,x
	cmp.w pfteam,y
	bne .4
	lda.w #$0006
	sta.b d0
	jmp.w assreplace
.1:
	rtl
.2:
	jmp.w assnothing
.4:
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
	stz.w $1003,x
	stz.w $1023,x
	lda.w #$0008
	sta.w $10A3,x
.1x:
	lda.w $1003,x
	sec
	sbc.b d7
	sta.w $1003,x
	bpl .2x
	lda.w $1343,x
	sta.w $1003,x
.2x:
	lda.w $0D71
	pha
	asl a
	pla
	ror a
	sta.b d0
	lda.w #$0080
	sta.b d1
	lda.w pfgoal,x
	beq .t2
	lda.w #$FF80
	sta.b d1
	lda.w #$FFA8
	sec
	sbc.w pucky
	bpl .3
	lda.w #$FF80
	clc
	adc.w pucky
	pha
	asl a
	pla
	ror a
	sta.b d1
	bra .3

.t1:
	rtl

.t2:
	lda.w #$0058
	sec
	sbc.w pucky
	bmi .3
	lda.b d1
	clc
	adc.w pucky
	pha
	asl a
	pla
	ror a
	sta.b d1
.3:
	lda.w #rtss>>16
	sta.b $8B
	lda.w #rtss
	sta.b a0
	jmp.w skateto
