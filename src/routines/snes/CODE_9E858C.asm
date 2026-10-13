; Unidentified routine.
CODE_9E858C:
	lda.w gmclock
	bne CODE_9E8589
	jsl.l CODE_9FDC4C
	lda.w $19D4,x
	bpl CODE_9E8588
	lda.w pflags,x
	bit.w #$0002
	beq CODE_9E85B4
	and.w #$FFFD
	sta.w pflags,x
	stz.w temp1,x
	stz.w temp2,x
	lda.w #$0008
	sta.w temp2b,x
CODE_9E85B4:
	lda.w temp1,x
	sec
	sbc.b $C1
	sta.w temp1,x
	bpl CODE_9E85C5
	lda.w aidef,x
	sta.w temp1,x
CODE_9E85C5:
	lda.w puckx
	pha
	asl a
	pla
	ror a
	sta.b $A5
	lda.w #$0080
	sta.b $A9
	lda.w pfgoal,x
	beq CODE_9E85F6
	lda.w #$FF80
	sta.b $A9
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
	sta.b $A9
	bra CODE_9E860B
