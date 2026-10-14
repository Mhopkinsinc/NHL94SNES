; Unidentified routine.
CODE_9E858C:
	lda.w gmclock
	bne CODE_9E8589
	jsl.l check4bench
	lda.w $19D4,x
	bpl CODE_9E8588
	lda.w pflags,x
	bit.w #$0002
	beq CODE_9E85B4
	and.w #$FFFD
	sta.w pflags,x
	stz.w $1003,x
	stz.w $1023,x
	lda.w #$0008
	sta.w $10A3,x
CODE_9E85B4:
	lda.w $1003,x
	sec
	sbc.b d7
	sta.w $1003,x
	bpl CODE_9E85C5
	lda.w $1343,x
	sta.w $1003,x
CODE_9E85C5:
	lda.w $0D71
	pha
	asl a
	pla
	ror a
	sta.b d0
	lda.w #$0080
	sta.b d1
	lda.w pfgoal,x
	beq CODE_9E85F6
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
