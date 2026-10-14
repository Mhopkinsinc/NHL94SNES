; Unidentified routine.
CODE_9E882A:
	lda.w gmclock
	beq .t2
	jmp.w assnothing

.t2:
	jsl.l check4bench
	lda.w $19D4,x
	bpl CODE_9E881E
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
	adc.w $1323,x
	bpl .3
.2:
	lda.w #$0000
.3:
	sta.w $1003,x
.4:
	lda.w #$009E
	sta.b $8B
	lda.w #$8904
	sta.b a0
	ldy.w #$0050
	lda.w position,x
	cmp.w #$0002
	beq .5
	ldy.w #$FFB0
.5:
	lda.w pfgoal,x
	bne .6
	tya
	eor.w #$FFFF
	inc a
	tay
.6:
	sty.b d0
	lda.w $0D71
	eor.b d0
	bmi .t3
	lda.w $0D71
	bra CODE_9E88A8

.t1:
	rtl

.t3:
	lda.w $0D71
	pha
	asl a
	pla
	ror a
	clc
	adc.b d0
CODE_9E88A8:
	sta.b d0
	ldy.b a2
	lda.w tmflags,y
	bit.w #$0010
	bne CODE_9E88F5
	lda.w pucky
	sta.b d2
	lda.w pfgoal,x
	bne .1
	lda.w #$0000
	sec
	sbc.b d2
	sta.b d2
.1:
	lda.b d2
	cmp.w #$FFA8
	bmi .t2
	cmp.w #$0058
	bmi .t1
	lda.w #$0062
	sta.b d1
	bra CODE_9E88E5

.t1:
	lda.w #$FFB2
	sta.b d1
	bra CODE_9E88E5

.t2:
	lda.w #$FF28
	sta.b d1
CODE_9E88E5:
	lda.w pfgoal,x
	bne CODE_9E88F2
	lda.w #$0000
	sec
	sbc.b d1
	sta.b d1
CODE_9E88F2:
	jmp.w CODE_9EA5A4
