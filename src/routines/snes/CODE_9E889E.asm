; Unidentified routine.
CODE_9E889E:
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
	bne CODE_9E88C6
	lda.w #$0000
	sec
	sbc.b d2
	sta.b d2
CODE_9E88C6:
	lda.b d2
	cmp.w #$FFA8
	bmi CODE_9E88E0
	cmp.w #$0058
	bmi CODE_9E88D9
	lda.w #$0062
	sta.b d1
	bra CODE_9E88E5
