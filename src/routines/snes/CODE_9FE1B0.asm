; Unidentified routine.
CODE_9FE1B0:
	lda.b $A9
	bit.w #$8080
	bne CODE_9FE1FA
	bit.w #$0400
	beq CODE_9FE1DD
	inc.w $0D15
	lda.w $1EB9
	cmp.w $0D15
	beq CODE_9FE1D8
	lda.w $0D15
	sec
	sbc.w #$0005
	cmp.w $0D13
	bmi CODE_9FE19E
	inc.w $0D13
	bra CODE_9FE19E
