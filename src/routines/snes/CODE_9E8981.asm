; Unidentified routine.
CODE_9E8981:
	lda.w gmclock
	bne CODE_9E897E
	jsl.l check4bench
	lda.w $19D4,x
	bpl CODE_9E897D
	lda.w pflags,x
	bit.w #$0002
	beq .1
	and.w #$FFFD
	sta.w pflags,x
	stz.w $1003,x
	stz.w $1023,x
	lda.w #$0008
	sta.w $10A3,x
.1:
	lda.w $1003,x
	sec
	sbc.b d7
	sta.w $1003,x
	bpl .4
	clc
	adc.w $1343,x
	bpl .3
.2:
	lda.w #$0000
.3:
	sta.w $1003,x
.4:
	lda.w #$0064
	sta.b d0
	lda.w position,x
	cmp.w #$0005
	bne .5
	lda.w #$FF9C
	sta.b d0
.5:
	ldy.w puckc
	lda.w pfgoal,x
	beq .t3
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
	lda.w #$FF62
	sta.b d1
	lda.w #$FFB2
	sta.b d2
	lda.w position,y
	beq .6
	ldy.b a2
	lda.w tmflags,y
	bit.w #$0010
	bne .6
	lda.b d2
	sec
	sbc.w pucky
	bpl .t2
	lda.w pucky
	sta.b d1
	bra .7

.t1:
	rtl

.t2:
	lda.w #$FEF8
	sta.b d2
	sec
	sbc.w pucky
	bmi .7
	bra .6

.t3:
	lda.w #$009E
	sta.b d1
	lda.w #$004E
	sta.b d2
	lda.w position,y
	beq .6
	ldy.b a2
	lda.w tmflags,y
	bit.w #$0010
	bne .6
	lda.b d2
	sec
	sbc.w pucky
	bmi .t1x
	lda.w pucky
	sta.b d1
	bra .7

.t1x:
	lda.w #$0108
	sta.b d2
	sec
	sbc.w pucky
	bpl .7
.6:
	lda.b d2
	sta.b d1
.7:
	lda.w #$009E
	sta.b $8B
	lda.w #rtss
	sta.b a0
	lda.w $0D71
	eor.b d0
	sta.b d2
	bmi .1x
	lda.w $0D71
	sta.b d0
.1x:
	jmp.w skateto
