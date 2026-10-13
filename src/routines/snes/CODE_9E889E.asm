; Unidentified routine.
CODE_9E889E:
	lda.w puckx
	pha
	asl a
	pla
	ror a
	clc
	adc.b $A5
CODE_9E88A8:
	sta.b $A5
	ldy.b $91
	lda.w tmflags,y
	bit.w #$0010
	bne CODE_9E88F5
	lda.w pucky
	sta.b $AD
	lda.w pfgoal,x
	bne CODE_9E88C6
	lda.w #$0000
	sec
	sbc.b $AD
	sta.b $AD
CODE_9E88C6:
	lda.b $AD
	cmp.w #$FFA8
	bmi CODE_9E88E0
	cmp.w #$0058
	bmi CODE_9E88D9
	lda.w #$0062
	sta.b $A9
	bra CODE_9E88E5
