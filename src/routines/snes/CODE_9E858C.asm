; Unidentified routine.
CODE_9E858C:
	lda.w gmclock
	bne CODE_9E8589
	jsl.l check4bench
	lda.w $19D4,x
	bpl CODE_9E8588
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
	bpl .2
	lda.w $1343,x
	sta.w $1003,x
.2:
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
	bpl CODE_9E860B
	lda.w #$FF80
	clc
	adc.w pucky
	pha
	asl a
	pla
	ror a
	sta.b d1
	bra CODE_9E860B

.t1:
	rtl

.t2:
	lda.w #$0058
	sec
	sbc.w pucky
	bmi CODE_9E860B
	lda.b d1
	clc
	adc.w pucky
	pha
	asl a
	pla
	ror a
	sta.b d1
CODE_9E860B:
	lda.w #$009E
	sta.b $8B
	lda.w #CODE_9ED0FC
	sta.b a0
	jmp.w CODE_9EA5A4
	ldy.w $0AD9
	bmi CODE_9E8631
	lda.w pfteam,x
	cmp.w pfteam,y
	bne CODE_9E8631
	lda.w #$0001
	sta.b d0
	jmp.w assreplace
